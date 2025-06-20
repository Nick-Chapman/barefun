-- | ANF style expressions. All sub-expressions named. Atomic/Compound expression forms distinguished.
module Stage3_ANF
  ( Code(..), Arm(..), Atomic(..), Val(..), fvs
  , execute
  , compile
  ) where

import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Set (Set,singleton,(\\),union)
import Lines (Lines,bracket,onHead,onTail,indented)
import Par4 (Position(..))
import Primitive (Primitive(MakeBytes),executePrimitive)
import Stage0_AST (apply,applyN)
import Stage1_EXP (Id(..),Name(GeneratedName),Ctag(..))
import Stage2_NBE (provenanceExp)
import Text.Printf (printf)
import Value (Interaction(..))
import Value (Value(..),deUnit,Number)
import qualified Data.Map as Map
import qualified Data.Set as Set (toList,fromList,unions,empty)
import qualified Stage0_AST as SRC (Literal(..))
import qualified Stage2_NBE as SRC
import qualified Value as I (Tickable(..))

type Transformed = Code

data Code
  = Return Position Val
  | Tail Val Position Val
  | TailN Val Position [Val]
  | TailPrim Primitive Position Val
  | LetAtomic Id Atomic Code
  | PushContinuation Fvs (Id,Code) Code
  | Match Val [Arm]

data Arm = ArmTag Position Ctag [Id] Code

-- Atomic expressions cause only bounded evaluation.
data Atomic
  = LitS Position String
  | Prim Position Primitive [Val]
  | ConTag Position Ctag [Val]
  | Lam Position Fvs Id Code
  | LamN Position Fvs [Id] Code
  | RecLam Position Fvs Id Id Code
  | RecLamN Position Fvs Id [Id] Code

-- Val expressions cause no evaluation.
data Val
  = Named Id
  | LitC Char
  | LitN Number

type Fvs = [Id]

----------------------------------------------------------------------
-- provenance

provenanceAtomic :: Atomic -> (String,Position)
provenanceAtomic = \case
  LitS pos _ -> ("lit",pos)
  Prim pos _ _ -> ("prim",pos)
  ConTag pos _ _ -> ("con",pos)
  Lam pos _ _ _ -> ("lam",pos)
  LamN pos _ _ _ -> ("lamN",pos)
  RecLam pos _ _ _ _ -> undefined $ ("reclam",pos) -- why never seen?
  RecLamN{} -> undefined

----------------------------------------------------------------------
-- Show

instance Show Code where show = intercalate "\n" . ("let k () = ()":) . pretty

pretty :: Code -> Lines
pretty = \case
  Return _ x -> ["k " ++ show x]
  Tail func _pos arg -> [printf "%s %s k" (show func) (show arg)]
  TailN func _pos args -> [printf "%s %s k" (show func) (show args)]
  TailPrim prim _pos arg -> [printf "PRIM_%s(%s) k" (show prim) (show arg)]
  LetAtomic x rhs body -> onHead (("let " ++ show x ++ " = ")++) (onTail (++ " in") (prettyA rhs)) ++ pretty body
  PushContinuation fvs (x,later) first -> indented ("let k " ++ show fvs ++ " " ++ show x ++ " =") (onTail (++ " in") (pretty later)) ++ pretty first
  Match scrut arms -> (onHead ("match "++) . onTail (++ " with")) [show scrut] ++ concat (map prettyArm arms)

prettyA :: Atomic -> Lines
prettyA = \case
  LitS _ x -> [show x]
  Prim _ prim xs -> do [printf "PRIM_%s(%s)" (show prim) (intercalate "," (map show xs))]
  ConTag _ tag [] -> [show tag]
  ConTag _ tag xs -> [printf "%s%s" (show tag) (show xs)]
  Lam _ fvs x body -> indented ("fun " ++ show fvs ++ " " ++ show x ++ " k ->") (pretty body)
  LamN _ fvs xs body -> indented ("fun " ++ show fvs ++ " " ++ show xs ++ " k ->") (pretty body)
  RecLam _ fvs f x body -> onHead ("fix "++) $ bracket $ indented ("fun " ++ show fvs ++ " " ++ show f ++ " " ++ show x ++ " k ->") (pretty body)
  RecLamN _ fvs f xs body -> onHead ("fix "++) $ bracket $ indented ("fun " ++ show fvs ++ " " ++ show f ++ " " ++ show xs ++ " k ->") (pretty body)



prettyArm :: Arm -> Lines
prettyArm = \case
  ArmTag _pos c xs rhs -> do
    indented ("| " ++ prettyPat c xs ++ " ->") (pretty rhs)

prettyPat :: Ctag -> [Id] -> String
prettyPat tag = \case
  [] -> show tag
  xs -> printf "%s(%s)" (show tag) (intercalate "," (map show xs))

instance Show Val where
  show = \case
    Named x -> show x
    LitC c -> show c
    LitN n -> show n

----------------------------------------------------------------------
-- Execute

execute :: Transformed -> Interaction
execute = evalCode0

evalCode0 :: Code -> Interaction
evalCode0 exp =
  evalCode env0 exp $ \v -> case deUnit v of () -> IDone

evalCode :: Env -> Code -> (Value -> Interaction) -> Interaction
evalCode env = \case
  Return _ v -> \k -> ITick I.Return $ k (evalV v)
  Tail fun pos arg -> \k -> ITick I.Enter $ apply (evalV fun) pos (evalV arg) k
  TailN fun pos args -> \k -> ITick I.Enter $ applyN (evalV fun) pos (map evalV args) k
  TailPrim prim _pos arg -> \k -> ITick I.TailPrim $ do
    executePrimitive prim [evalV arg] k
  LetAtomic x a1 c2 -> \k -> do
    evalA a1 $ \v1 -> do
      evalCode (insert x v1 env) c2 k
  PushContinuation fvs (x,later) first -> \k -> ITick I.PushContinuation $ do
    evalCode env first $ \v1 -> do
      evalCode (insert x v1 (limit fvs env)) later k
  Match scrut arms0 -> \k -> do
    case (evalV scrut) of
      VCons (Ctag _ tagActual) vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] -> error "case match failure"
            ArmTag pos (Ctag _ tag) xs body : arms -> do
              if tag /= tagActual then dispatch arms else do
                if length xs /= length vArgs then error (show ("case arm mismatch",pos,xs,vArgs)) else do
                  let env' = foldr (uncurry insert) env (zip xs vArgs)
                  evalCode env' body k
        dispatch arms0
      v ->
        error (printf "case/scrut not a constructed value: %s" (show v))
  where

    evalA :: Atomic -> (Value -> Interaction) -> Interaction
    evalA = \case
      LitS _ s -> \k -> k (VString s)
      Prim _ prim vs -> \k -> ITick I.Prim $ executePrimitive prim (map evalV vs) k
      ConTag _ tag vs -> \k -> k (VCons tag (map evalV vs))
      Lam _ fvs x body -> \k -> do
        k (VFunc (\arg k -> evalCode (insert x arg (limit fvs env)) body k))
      LamN _ fvs xs body -> \k ->
        abstract (limit fvs env) xs body k
      RecLam _ fvs f x body -> \k -> do
        let me = VFunc (\arg k -> evalCode (insert f me (insert x arg (limit fvs env))) body k)
        k me
      RecLamN _ _ _ [] _ -> error "recLamN/[]"
      RecLamN _ fvs f (x0:xs0) body -> \k -> do
        let me = abstractV (insert f me $ limit fvs env) x0 xs0 body
        k me

    evalV :: Val -> Value
    evalV = \case
      Named x -> look x
      LitC c -> VChar c
      LitN n -> VNum n

    look :: Id -> Value
    look x = do
      let Env{venv} = env
      maybe err id $ Map.lookup x venv
        where err = error (show ("var-lookup",x))

abstract :: Env -> [Id] -> Code -> (Value -> Interaction) -> Interaction
abstract env xs body k = case xs of
  [] -> evalCode env body k
  x:xs -> k (abstractV env x xs body)

abstractV :: Env -> Id -> [Id] -> Code -> Value
abstractV env@Env{venv} x xs body =
  VFunc (\arg k -> abstract env { venv = Map.insert x arg venv } xs body k)


data Env = Env { venv :: Map Id Value }

limit :: [Id] -> Env -> Env
limit fvs Env{venv} = Env $ Map.fromList [ (x,v) | (x,v) <- Map.toList venv, x `elem` fvs ]

insert :: Id -> Value -> Env -> Env
insert x v Env{venv} = Env { venv = Map.insert x v venv }

env0 :: Env
env0 = Env { venv = Map.empty }

----------------------------------------------------------------------
-- Compile

-- | Convert to ANF. Generate name for all sub expressions, and code-returns.
-- | Distinguish binding of Atomic/Compound expressions.

compile :: SRC.Exp -> Transformed
compile e = runM (compileTop e)

compileTop :: SRC.Exp -> M Code
compileTop e = compileExp e pure >>= nameAtomic

data AC = Compound Code | Atomic Atomic

nameAtomic :: AC -> M Code
nameAtomic = \case
  Compound code -> pure code
  Atomic a -> do
    let (what,pos) = provenanceAtomic a
    x <- Fresh pos what
    let noPos = Position 0 0
    pure $ LetAtomic x a (Return noPos (Named x))

compileExp :: SRC.Exp -> (AC -> M AC) -> M AC
compileExp = \case
  SRC.Var pos x -> \k -> do
    k $ Compound $ Return pos (Named x)

  -- Numbers are Chars are small literals which cause no evaluation
  -- Strings on the other hand are compound literals, which ultimately become global/static data.
  SRC.Lit pos (SRC.LitC c) -> \k -> k $ Compound $ Return pos (LitC c)
  SRC.Lit pos (SRC.LitN n) -> \k -> k $ Compound $ Return pos (LitN n)
  SRC.Lit pos (SRC.LitS s) -> \k -> k $ Atomic $ LitS pos s

  SRC.ConTag pos tag es -> \k -> do
    compileAsIds es $ \xs ->
      k $ Atomic $ ConTag pos tag xs

  SRC.Prim pos prim es -> \k -> do
    case (prim,es) of
      -- A call to MakeBytes cannot be treated as an Atomic, because it allocates a statically
      -- unknowable amount of memory; the need-computation in stage 5 is not possible.
      -- We therefore tail call the primitive, which can perform its own heapcheck.
      (MakeBytes,[e]) -> do
        compileAsId e $ \x -> do
          k $ Compound $ TailPrim prim pos x
      _ ->
        compileAsIds es $ \xs ->
        k $ Atomic $ Prim pos prim xs

  SRC.LamN pos xs body -> \k -> do
    body <- compileTop body
    k $ Atomic $ mkLamN pos xs body

  SRC.RecLamN pos f xs body -> \k -> do
    body <- compileTop body
    k $ Atomic $ mkRecLamN pos f xs body

  SRC.AppN eFunc pos eArgs-> \k -> do
    compileAsIds (reverse eArgs) $ \argsInRev -> do
      compileAsId eFunc $ \func -> do
        k $ Compound $ TailN func pos (reverse argsInRev)

  SRC.Let _pos x rhs body -> \k -> do
    compileExp rhs $ \rhs -> do
      body <- compileExp body k >>= nameAtomic
      pure $ Compound $ mkBind x rhs body

  SRC.Match _pos scrut arms -> \k -> do
    compileAsId scrut $ \scrut -> do
      arms <- mapM compileArm arms
      k $ Compound $ Match scrut arms

compileArm :: SRC.Arm -> M Arm
compileArm (SRC.ArmTag pos tag xs exp) = do
  exp <- compileTop exp
  pure $ ArmTag pos tag xs exp

compileAsIds :: [SRC.Exp] -> ([Val] -> M AC) -> M AC
compileAsIds es k = case es of
  [] -> k []
  e:es -> do
    compileAsId e $ \x -> do
      compileAsIds es $ \xs ->
        k (x:xs)

compileAsId :: SRC.Exp -> (Val -> M AC) -> M AC
compileAsId = \case
  SRC.Lit _pos (SRC.LitC c) -> \k -> k (LitC c)
  SRC.Lit _pos (SRC.LitN n) -> \k -> k (LitN n)
  SRC.Var _pos x -> \k -> k (Named x)
  e -> \k -> do
    let (what,pos) = provenanceExp e
    x <- Fresh pos what
    compileExp e $ \code -> do
      body <- (k (Named x) >>= nameAtomic)
      pure $ Compound $ mkBind x code body

mkBind :: Id -> AC -> Code -> Code
mkBind x rhs body = case rhs of
  -- We used to have a special case for Compound/Return, constructing a LetAlias form.
  -- But it seems this case can never occur because of NbE on the previous stages.
  -- This is demonstrated by the undefined.
  -- And the LetAlias form is removed.
  -- If it turns out this case can occur, then the standard code for Compound will apply just fine.
  --Compound (Return _ (Named _y)) -> undefined -- $ LetAlias x _y body
  Compound rhs -> mkPushContinuation (x,body) rhs
  Atomic rhs -> LetAtomic x rhs body

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  Fresh :: Position -> String -> M Id

runM :: M a -> a
runM m0 = loop 1 m0 $ \_ x -> x
  where
    loop :: Int -> M a -> (Int -> a -> b) -> b
    loop u m k = case m of
      Ret x -> k u x
      Bind m f -> loop u m $ \u x -> loop u (f x) k
      Fresh pos tag -> do
        let x = Id { optUnique = Just u
                   , pos
                   , name = GeneratedName tag
                   }
        k (u+1) x

----------------------------------------------------------------------
-- Free Vars

mkLamN :: Position -> [Id] -> Code -> Atomic
mkLamN pos xs code = LamN pos (Set.toList (fvs code \\ Set.fromList xs)) xs code

mkRecLamN :: Position -> Id -> [Id] -> Code -> Atomic
mkRecLamN pos f xs code = RecLamN pos (Set.toList (fvs code \\ Set.fromList (f:xs))) f xs code

mkPushContinuation :: (Id,Code) -> Code -> Code
mkPushContinuation (x,later) first =
  PushContinuation (Set.toList (fvs later \\ singleton x)) (x,later) first

fvs :: Code -> Set Id
fvs = \case
  Return _ x -> fvsV x
  Tail func _ arg -> Set.unions [fvsV func,fvsV arg]
  TailN func _ args -> fvsV func `union` Set.unions (map fvsV args)
  TailPrim _ _ x -> fvsV x
  LetAtomic x rhs body -> fvsA rhs `union` (fvs body \\ singleton x)
  PushContinuation frame _ rhs -> fvs rhs `union` Set.fromList frame
  Match scrut arms -> fvsV scrut `union` Set.unions (map fvsArm arms)
  where
    fvsArm (ArmTag _pos _cid xs exp) = fvs exp \\ Set.fromList xs

fvsV :: Val -> Set Id
fvsV = \case
  Named x -> singleton x
  LitC{} -> Set.empty
  LitN{} -> Set.empty

fvsA :: Atomic -> Set Id
fvsA = \case
  LitS _ _ -> Set.empty
  ConTag _ _ xs -> Set.unions (map fvsV xs)
  Prim _ _ xs -> Set.unions (map fvsV xs)
  Lam _ fvs _ _ -> Set.fromList fvs
  LamN _ fvs _ _ -> Set.fromList fvs
  RecLam _ fvs _ _ _ -> Set.fromList fvs
  RecLamN _ fvs _ _ _ -> Set.fromList fvs
