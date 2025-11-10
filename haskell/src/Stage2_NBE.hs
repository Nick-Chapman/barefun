-- | Normalize using "Normalization by Evaluation" (Inlining & Constant Folding).
module Stage2_NBE
  ( Exp(..),Arm(..),Ctag(..), provenanceExp, sizeExp
  , compile
  , execute
  , pp
  ) where

import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Lines (Lines,juxComma,bracket,onHead,onTail,jux,indented)
import Par4 (Position(..))
import Primitive (Primitive(Noinline,IsComptimeKnown),isPure,evaluatePurePrimitive,executePrimitive)
import Stage0_AST (Literal(..),evalLit,applyN)
import Stage1_EXP (Ctag(..),PPControl(..),PPPosFlag(..), PPUniqueFlag(..))
import Text.Printf (printf)
import Value (Interaction(..),Value(..),Number,deUnit,mkBool)
import qualified Data.Map as Map
import qualified Stage1_EXP as SRC
import qualified Value as I (Tickable(Prim,App))

-- The NBE compilation stage constructs multi-lam/app

type Transformed = Exp

compile :: Int -> Int -> SRC.Exp -> Transformed
compile = normalize

enabled :: Bool
enabled = True -- controls 4 places

data Exp
  = Var Position Id
  | Lit Position Literal
  | ConTag Position Ctag [Exp]
  | Prim Position Primitive [Exp]
  | LamN Position [Id] Exp
  | RecLamN Position Id [Id] Exp
  | AppN Exp Position [Exp]
  | Let Position Id Exp Exp
  | Match Position Exp [Arm]

data Arm = ArmTag Position Ctag [Id] Exp

type Id = SRC.Id

----------------------------------------------------------------------
-- size

sizeExp :: Exp -> Int
sizeExp = \case
  Var{} -> 1
  Lit{} -> 1
  ConTag _ _ es -> 1 + sum (map sizeExp es)
  Prim _ _ es -> 1 + sum (map sizeExp es)
  LamN _ xs body -> length xs + sizeExp body
  RecLamN _ _ xs body -> 1 + length xs  + sizeExp body
  AppN fun _ args -> sizeExp fun + sum (map sizeExp args)
  Let _ _ rhs body -> 1 + sizeExp rhs + sizeExp body
  Match _ scrut arms -> sizeExp scrut + sum [ 1 + length xs + sizeExp rhs | ArmTag _pos _tag xs rhs <- arms ]

----------------------------------------------------------------------
-- provenance

provenanceExp :: Exp -> (String,Position)
provenanceExp = \case
  Var{} -> error "provenanceExp/Var" -- we never call on a Var
  AppN _ pos _ -> ("appN",pos)
  Lit pos _ -> ("lit",pos)
  ConTag pos _ _ -> ("con",pos)
  LamN pos _ _ -> ("lamN",pos)
  Let pos _ _ _ -> ("uLET", pos)
  Prim pos _ _ -> ("prim", pos)
  RecLamN{} -> undefined
  Match pos _ _ -> ("case",pos)

----------------------------------------------------------------------
-- Show

pp :: PPControl -> Exp -> String
pp control = intercalate "\n" . prettyTop control

prettyTop :: PPControl -> Exp -> Lines
prettyTop control = pretty
  where
    prettyId = prettyId0 control

    pretty :: Exp -> Lines
    pretty = \case
      Var _ x -> [prettyId x]
      Lit _ x -> [show x]
      ConTag _ tag [] -> [show tag]
      ConTag _ tag es -> onHead (show tag ++) (bracket (foldl1 juxComma (map pretty es)))
      Prim _ prim xs -> onHead (printf "prim_%s" (show prim) ++) (bracket (foldl1 juxComma (map pretty xs)))
      LamN _ xs body -> bracket $ indented ("fun (" ++ intercalate "," (map prettyId xs) ++ ") ->") (pretty body)
      --RecLamN _ f xs body -> onHead ("fix "++) $ bracket $ indented ("fun " ++ prettyId f ++ " (" ++ intercalate "," (map prettyId xs) ++ ") ->") (pretty body)
      RecLamN _ f xs body -> onTail (++ " in " ++ prettyId f) $ indented ("let rec " ++ prettyId f ++ " (" ++ intercalate "," (map prettyId xs) ++ ") =") (pretty body)
      AppN func _ args -> jux (pretty func) (bracket (foldl1 juxComma (map pretty args)))
      Let _ x rhs body -> indented ("let " ++ prettyId x ++ " =") (onTail (++ " in") (pretty rhs)) ++ pretty body
      Match _ scrut arms -> bracket ((onHead ("match "++) . onTail (++ " with")) (pretty scrut) ++ concat (map prettyArm arms))

    prettyArm :: Arm -> Lines
    prettyArm (ArmTag _pos c xs rhs) = indented ("| " ++ prettyPat c xs ++ " ->") (pretty rhs)

    prettyPat :: Ctag -> [Id] -> String
    prettyPat c = \case
      [] -> show c
      xs -> printf "%s(%s)" (show c) (intercalate "," (map prettyId xs))

prettyId0 :: PPControl -> Id -> String
prettyId0 control SRC.Id{name,optUnique,pos} =
  maybePos (maybeTag (maybeBracket (show name)))
  where
    maybePos s =
      case ppp control of
        PPPosOn -> printf "%s_%s" s (show pos)
        PPPosOff -> s

    maybeTag s =
      case optUnique of
        Nothing -> s
        Just n ->
          case ppu control of
            PPUniqueOn -> printf "%s_%d" s n
            PPUniqueOff -> s

    maybeBracket s = if needBracket s then printf "( %s )" s else s
    needBracket = \case "*" -> True; _ -> False

----------------------------------------------------------------------
-- Execute

execute :: Transformed -> Interaction
execute = eval0

eval0 :: Exp -> Interaction
eval0 exp = eval env0 exp $ \v -> case deUnit v of () -> IDone

evals :: Env -> [Exp] -> ([Value] -> Interaction) -> Interaction
evals env es k = case es of
  [] -> k []
  e:es -> do
    eval env e $ \v -> do
      evals env es $ \vs -> do
        k (v:vs)

abstract :: Env -> [Id] -> Exp -> (Value -> Interaction) -> Interaction
abstract env xs body k = case xs of
  [] -> eval env body k
  x:xs -> k (abstractV env x xs body)

abstractV :: Env -> Id -> [Id] -> Exp -> Value
abstractV env@Env{venv} x xs body =
  VFunc (\arg k -> abstract env { venv = Map.insert x arg venv } xs body k)

eval :: Env -> Exp -> (Value -> Interaction) -> Interaction
eval env@Env{venv} = \case
  Var pos x -> \k -> do
    k (maybe err id $ Map.lookup x venv)
      where err = error (show ("var-lookup",x,pos))
  Lit _ literal -> \k -> do
    k (evalLit literal)
  ConTag _ tag es -> \k -> do
    evals env es $ \vs -> do
      k (VCons tag vs)
  Prim _ prim es -> \k -> do
    evals env es $ \vs -> ITick I.Prim $ do
      executePrimitive prim vs k
  LamN _ xs body -> \k ->
    abstract env xs body k
  RecLamN _ _ [] _ -> error "recLamN/[]"
  RecLamN _ f (x0:xs0) body -> \k -> do
    let me = abstractV env { venv = Map.insert f me venv } x0 xs0 body
    k me
  AppN eFunc pos eArgs -> \k -> do
    evals env (reverse eArgs) $ \argsInRev -> do
      eval env eFunc $ \func -> do
        ITick I.App $ applyN func pos (reverse argsInRev) k
  Let _ x e1 e2 -> \k -> do
    eval env e1 $ \v1 -> do
      eval env { venv = Map.insert x v1 venv } e2 k
  Match _ e arms0 -> \k -> do
    eval env e $ \case
      VCons (Ctag _ tagActual) vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] -> error "case match failure"
            ArmTag pos (Ctag _ tag) xs body : arms -> do
              if tag /= tagActual then dispatch arms else do
                if length xs /= length vArgs then error (show ("case arm mismatch",pos,xs,vArgs)) else do
                  let env' = env { venv = foldr (uncurry Map.insert) venv (zip xs vArgs) }
                  eval env' body k
        dispatch arms0
      v ->
        error (printf "case/scrut not a constructed value: %s" (show v))

data Env = Env { venv :: Map Id Value }

env0 :: Env
env0 = Env { venv = Map.empty }

----------------------------------------------------------------------
-- Normalize

normalize :: Int -> Int -> SRC.Exp -> Exp
normalize mlam mapp e = runM mlam mapp (norm cenv0 e)

norm :: Cenv -> SRC.Exp -> M Exp
norm env e =
  reflect env e >>= reify

data SemValue
  = Syntax Exp
  | Macro Id (SemValue -> M SemValue)
  | Constant Position BaseValue
  | Constructed Position Ctag [SemValue]

isComptimeKnown :: SemValue -> Bool
isComptimeKnown = \case
  Constant{} -> True
  Macro{} -> True
  Constructed{} -> True
  Syntax{} -> False -- only syntax is comptime-unknown

isSharable :: SemValue -> Bool
isSharable = \case
  Constant{} -> True
  Macro{} -> True
  Constructed _ _ svs -> all isSharable svs
  Syntax (Var{}) -> True
  Syntax{} -> False

data BaseValue -- should BaseValue contain the Position infi?
  = BVString String
  | BVChar Char
  | BVNum Number
  | BVCons Ctag [BaseValue]

ofBV :: BaseValue -> Value
ofBV = \case
  BVString s -> VString s
  BVNum n -> VNum n
  BVChar n -> VChar n
  BVCons tag bvs -> VCons tag (map ofBV bvs)

toBV :: Value -> BaseValue
toBV = \case
  VString s -> BVString s
  VNum n -> BVNum n
  VChar n -> BVChar n
  VCons tag vs -> BVCons tag (map toBV vs)
  -- A Pure primitive should never return a non base value
  v -> error (show ("toBV",v))

posOfId :: Id -> Position
posOfId = \case SRC.Id{pos} -> pos

syn :: Id -> SemValue
syn x = Syntax (Var (posOfId x) x)

reifyBaseValue :: Position -> BaseValue -> Exp
reifyBaseValue pos = \case
  BVNum n -> Lit pos (LitN n)
  BVChar c -> Lit pos (LitC c)
  BVString s -> Lit pos (LitS s)
  BVCons tag bvs -> ConTag pos tag (map (reifyBaseValue pos) bvs)

reify :: SemValue -> M Exp
reify = \case
  Constructed pos tag args -> do
    es <- mapM reify args
    pure $ ConTag pos tag es
  Constant pos bv -> pure (reifyBaseValue pos bv)
  Syntax e -> pure e
  Macro x f -> do
    x <- fresh x
    body <- Reset $ do
      let arg :: SemValue = syn x
      res :: SemValue <- f arg
      res :: Exp <- reify res
      pure res
    mkLam (posOfId x) x body

share :: Id -> SemValue -> M SemValue
share x sv = do
  if isSharable sv then pure sv else do
    x <- fresh x
    rhs <- reify sv
    Wrap (Let (posOfId x) x rhs) (pure (syn x))

applyI :: SemValue -> Position -> SemValue -> M SemValue
applyI fun p arg = do
  case (enabled,fun) of
    -- (1) Normalize: Function Inlining
    (True, Macro x fun) -> do
      arg <- share x arg
      fun arg
    _ -> do
      fun <- reify fun
      arg <- reify arg
      Syntax <$> mkApp fun p arg

maybeAllConstant :: [SemValue] -> Maybe [BaseValue]
maybeAllConstant svs = do
  let vs = [ v | Constant _ v <- svs ]
  if length vs == length svs then Just vs else Nothing

reflectPrimitive :: Position -> Primitive -> [SemValue] -> M SemValue
reflectPrimitive pos prim es = do
  case (enabled && isPure prim, maybeAllConstant es) of
    -- (2) Normalize: Constant Propogation
    (True, Just bvs) -> do
      pure $ Constant pos (toBV (evaluatePurePrimitive prim (map ofBV bvs)))
    _ -> do
      es <- mapM reify es
      pure $ Syntax $ Prim pos prim es

reflectLit :: Literal -> BaseValue
reflectLit = \case
  LitC c -> BVChar c
  LitN n -> BVNum n
  LitS s -> BVString s

reflect :: Cenv -> SRC.Exp -> M SemValue
reflect env = \case

  SRC.Var _pos x -> do
    pure (look env x)
  SRC.Lit pos x -> do
    pure $ Constant pos (reflectLit x)
  SRC.ConTag pos tag args -> do
    args <- mapM (reflect env) args
    pure $ Constructed pos tag args

  SRC.Prim pos IsComptimeKnown [e] -> do
    sv <- reflect env e
    let bv = toBV (mkBool (isComptimeKnown sv))
    pure (Constant pos bv)

  SRC.Prim _ Noinline [e] -> do
    -- The noinline primitive has blocked inlining; now we throw it away
    Syntax <$> norm env e
  SRC.Prim pos prim es -> do
    es <- mapM (reflect env) es
    reflectPrimitive pos prim es
  SRC.Lam _pos x body -> do
    pure $ Macro x $ \arg -> do
      let env' = Map.insert x arg env
      reflect env' body
  SRC.RecLam pos f x body -> do
    x' <- fresh x
    f' <- fresh f
    let env' = Map.insert x (syn x') (Map.insert f (syn f') env)
    body <- Reset (norm env' body)
    Syntax <$> mkRecLam pos f' x' body
  SRC.App e1 p e2 -> do
    e1 <- reflect env e1
    e2 <- reflect env e2
    applyI e1 p e2
  SRC.Let p x rhs body -> do
    case enabled of
      -- (3) Normalize: Lets as Applied-Lambdas
      True -> reflect env (SRC.App (SRC.Lam p x body) p rhs)
      False -> do
        -- when not enabled, we preserve the user lets
        x' <- fresh x
        rhs <- norm env rhs
        body <- norm (Map.insert x (syn x') env) body
        pure $ Syntax $ Let p x' rhs body

  SRC.Match pos scrut arms -> do
    scrut <- reflect env scrut
    case (enabled,scrut) of
      -- (4) Normalize: Constant Branch Selection
      (True,Constructed _ tag args) -> caseSelect tag args env arms
      (True,Constant pos (BVCons tag vs)) -> caseSelect tag (map (Constant pos) vs) env arms
      (_,Constant{}) -> error "reflect: case-scrut a non-constucted constant"
      (_,Macro{}) -> error "reflect: case-scrut a function"
      _ -> do
        scrut <- reify scrut
        arms <- mapM (normArm env) arms
        pure $ Syntax $ Match pos scrut arms

caseSelect :: Ctag -> [SemValue] -> Cenv -> [SRC.Arm] -> M SemValue
caseSelect tag vs env arms = do
  let
    (xs,body) :: ([Id],SRC.Exp) =
      case [ (xs,body) | SRC.ArmTag _pos tagArm xs body <- arms, tagArm == tag ] of
        [] -> error "reflect: case match failure"
        x:_ -> x
  reflect (foldr (uncurry Map.insert) env (zip xs vs)) body

normArm :: Cenv -> SRC.Arm -> M Arm
normArm env (SRC.ArmTag pos c xs body) = do
  xys <- sequence [ do y <- fresh x; pure (x,y) | x <- xs ]
  let env' = foldr (uncurry Map.insert) env [ (x,syn y) | (x,y) <- xys ]
  body <- Reset (norm env' body)
  pure $ ArmTag pos c (map snd xys) body

type Cenv = Map Id SemValue

cenv0 :: Cenv
cenv0 = Map.empty

look :: Cenv -> Id -> SemValue
look env x = maybe err id $ Map.lookup x env
  where err = error (show ("Normalize.walk/Var",x))

fresh :: Id -> M Id
fresh SRC.Id{name,pos} = do
  u <- Fresh
  let optUnique = Just u
  let y = SRC.Id { optUnique, pos, name}
  pure y

mkRecLam :: Position -> Id -> Id -> Exp -> M Exp
mkRecLam p f x0 body = do
  threshold <- MultiLamEnabled
  case body of
    LamN _ xs body
      | threshold == 0 || length xs < threshold
        -> pure $ RecLamN p f (x0 : xs) body
    _ -> pure $ RecLamN p f [x0] body

mkLam :: Position -> Id -> Exp -> M Exp
mkLam p x0 body = do
  threshold <- MultiLamEnabled
  case body of
    LamN _ xs body
      | threshold == 0 || length xs < threshold
        -> pure $ LamN p (x0 : xs) body
    _ -> pure $ LamN p [x0] body

mkApp :: Exp -> Position -> Exp -> M Exp
mkApp fun p arg = do
  threshold <- MultiAppEnabled
  case fun of
    AppN fun p args
      | (threshold == 0 || length args < threshold)
        -> pure $ AppN fun p (args ++ [arg])
    _ -> pure $ AppN fun p [arg]

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  Fresh :: M Int
  Wrap :: (Exp -> Exp) -> M a -> M a
  Reset :: M Exp -> M Exp
  -- apply threshold to maximum multi-lama/all. (0 unbounded)
  MultiLamEnabled :: M Int
  MultiAppEnabled :: M Int

runM :: Int -> Int -> M Exp -> Exp
runM mlam mapp m0 = snd $ loop 1 m0 k0
  where
    k0 = \u x -> (u,x)

    loop :: Int -> M a -> (Int -> a -> Res) -> Res
    loop u m k = case m of
      Ret x -> k u x
      Bind m f -> loop u m $ \u x -> loop u (f x) k
      Fresh -> k (u+1) u
      Wrap f m  -> (u', f x) where (u',x) = loop u m k
      Reset m -> k u' x where (u',x) = loop u m k0
      MultiLamEnabled -> k u mlam
      MultiAppEnabled -> k u mapp

type Res = (State,Exp)
type State = Int
