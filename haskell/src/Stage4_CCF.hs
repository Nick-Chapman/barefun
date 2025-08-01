-- | Locate identifier references at runtime; lift globals
module Stage4_CCF
  ( Image(..), Top(..), Code(..), Atomic(..), Arm(..), Ref(..), Location(..), Global(..), Temp(..)
  , execute
  , compile
  ) where

import Primitive (Primitive,executePrimitive,isPure,evaluatePurePrimitive)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Set (notMember)
import Lines (Lines,(<++),(++>),(>>>))
import Par4 (Position(..))
import Stage0_AST (apply,applyN)
import Stage1_EXP (Id(..),Ctag(..))
import Text.Printf (printf)
import Value (Interaction(..))
import Value (Value(..),deUnit,Number)
import qualified Data.Map as Map
import qualified Stage3_ANF as SRC (Code(..),Atomic(..),Val(..),Arm(..), fvs)
import qualified Value as I (Tickable(..))

type Transformed = Image

data Image
  = Run Code
  | LetTop (Id,Global) Top Image

-- A top level expression corresponds to global/static data
data Top
  = TopLitS String
  | TopPrim Primitive [Ref]
  | TopLam Ref Code -- All top function defs allow recursion. We dont even have an unrecursive form.
  | TopLamN [Ref] Code
  | TopConApp Ctag [Ref]

data Code
  = Return Position Ref
  | Tail Ref Position Ref
  | TailN Ref Position [Ref]
  | TailPrim Primitive Position Ref
  | LetAtomic (Id,Temp) Atomic Code
  | PushContinuation [Ref] [Ref] (Ref,Code) Code
  | Match Ref [Arm]

data Arm = ArmTag Position Ctag [(Id,Temp)] Code

data Atomic
  = Prim Primitive [Ref]
  | ConApp Ctag [Ref]
  | Lam [Ref] [Ref] Ref Code
  | LamN [Ref] [Ref] [Ref] Code
  | RecLam [Ref] [Ref] Ref Ref Code
  | RecLamN [Ref] [Ref] Ref [Ref] Code

data Location = InGlobal Global | InFrame Int | InTemp Temp | TheFrame | TheArg Int
  deriving (Eq,Ord)

data Ref
  = Ref Id Location
  | RefLitC Char
  | RefLitN Number

data Global = Global Int deriving (Eq,Ord)
data Temp = Temp Int deriving (Eq,Ord)

firstFrameIndexForLambdas,firstFrameIndexForContinuations,firstTempIndex,firstGlobalIndex :: Int
firstFrameIndexForLambdas = 1
firstFrameIndexForContinuations = 2
firstTempIndex = 1 -- TODO: Justify these "first" values. Where else must match?
firstGlobalIndex = 1

-- need 29 temps for the norm (thrice) example; no reason to not have more; but want to know when required
-- sham example needs more
-- filesystem needs 48 -- no, even more! -- 51
-- haskell laziness means the example can startup, and reach the filesystem explorer prompt
-- while having not completed the compilation! very counter-intuitive.
-- maybe it could be fixed with strictness annotation :shrug:
maxTempIndex :: Int
maxTempIndex = 55

----------------------------------------------------------------------
-- Show

instance Show Image where show = intercalate "\n" . ("let k () = ()":) . prettyL

prettyL :: Image -> Lines
prettyL = \case
  Run code -> prettyC code
  LetTop (_,g) rhs body ->
    ("let " ++ show g ++ " = ") <++ prettyT rhs ++> " in"
    ++ prettyL body

prettyT :: Top -> Lines
prettyT = \case
  TopLitS x -> [show x]
  TopPrim prim xs -> [printf "PRIM_%s(%s)" (show prim) (intercalate "," (map show xs))]
  TopLam x body -> ("fun " ++ show x ++ " k ->") >>> prettyC body
  TopLamN xs body -> ("fun " ++ show xs ++ " k ->") >>> prettyC body
  TopConApp tag [] -> [show tag]
  TopConApp tag xs -> [printf "%s%s" (show tag) (show xs)]

prettyC :: Code -> Lines
prettyC = \case
  Return _ x -> ["k " ++ show x]
  Tail func _pos arg -> [printf "%s %s k" (show func) (show arg)]
  TailN func _pos args -> [printf "%s %s k" (show func) (show args)]
  TailPrim prim _pos arg -> [printf "PRIM_%s(%s) k" (show prim) (show arg)]
  LetAtomic (_,t) rhs body ->
    ("let " ++ show t ++ " = ") <++ prettyA rhs ++> " in"
    ++ prettyC body
  PushContinuation pre post (x,later) first ->
    ("let k = " ++ show pre ++ ", fun " ++ show post ++ " " ++ show x ++ " ->")
    >>> prettyC later ++> " in"
    ++ prettyC first
  Match scrut arms ->
    "match " <++ [show scrut] ++> " with"
    ++ concat (map prettyArm arms)

prettyA :: Atomic -> Lines
prettyA = \case
  Prim prim xs -> [printf "PRIM_%s(%s)" (show prim) (intercalate "," (map show xs))]
  ConApp tag [] -> [show tag]
  ConApp tag xs -> [printf "%s%s" (show tag) (show xs)]
  Lam pre post x0 body -> (show pre ++ ", fun " ++ show post ++ " " ++ show x0 ++ " k ->") >>> prettyC body
  LamN pre post xs body -> (show pre ++ ", fun " ++ show post ++ " " ++ show xs ++ " k ->") >>> prettyC body
  RecLam pre post f x0 body ->
    (show pre ++ ", fun " ++ show post ++ " " ++ show f ++ " " ++ show x0 ++ " k ->")
    >>> prettyC body
  RecLamN pre post f xs body ->
    (show pre ++ ", fun " ++ show post ++ " " ++ show f ++ " " ++ show xs ++ " k ->")
    >>> prettyC body

prettyArm :: Arm -> Lines
prettyArm = \case
  ArmTag _pos c xs rhs ->
    ("| " ++ prettyPat c xs ++ " ->")
    >>> prettyC rhs

prettyPat :: Ctag -> [(Id,Temp)] -> String
prettyPat tag = \case
  [] -> show tag
  xs -> printf "%s(%s)" (show tag) (intercalate "," (map (\(_,t) -> show t) xs))

instance Show Ref where
  show = \case
    RefLitC c -> show c
    RefLitN n -> show n
    Ref x loc -> do
      let verbose = False
      if not verbose then show loc else
        show x ++ "_" ++ show loc

instance Show Location where
  show = \case
    InGlobal g -> show g
    InFrame n -> "f" ++ show n
    InTemp t -> show t
    TheArg n -> "arg" ++ show n
    TheFrame -> "me"

instance Show Global where
  show (Global n) = "g" ++ show n

instance Show Temp where
  show (Temp n) = "t" ++ show n

----------------------------------------------------------------------
-- Execute

execute :: Transformed -> Interaction
execute = evalImage0

evalImage0 :: Image -> Interaction
evalImage0 exp = do
  -- All global defs may mutually recurse; we tie the knot for genv here.
  let (code,genv) = evalImage genv env0 exp
  evalCode genv genv code $ \v -> case deUnit v of () -> IDone

evalImage :: Env -> Env -> Image -> (Code,Env)
evalImage genv env = \case
  Run code -> (code,env)
  LetTop (x,g) top body -> do
    let env' = insert (Ref x (InGlobal g)) (evalT genv top) env
    evalImage genv env' body

look :: Env -> Ref -> Value
look Env{venv} = \case
  RefLitC c -> VChar c
  RefLitN n -> VNum n
  Ref x loc -> do
    maybe err id $ Map.lookup loc venv
      where err = error (show ("Stage4.look",x,loc,venv))

evalT :: Env -> Top -> Value
evalT genv = \case
  TopLitS string -> VString string
  TopPrim prim xs -> evaluatePurePrimitive prim (map (look genv) xs)
  TopLam x body -> VFunc $ \arg k -> evalCode genv (insert x arg genv) body k
  TopLamN [] _ -> error "TopLamN/[]"
  TopLamN (x:xs) body -> abstractV genv genv x xs body
  TopConApp tag xs -> VCons tag (map (look genv) xs)

evalCode :: Env -> Env -> Code -> (Value -> Interaction) -> Interaction
evalCode genv env = \case
  Return _ x -> \k -> ITick I.Return $ k (look env x)
  Tail func pos arg -> \k -> ITick I.Enter $ apply (look env func) pos (look env arg) k
  TailN func pos args -> \k -> ITick I.Enter $ applyN (look env func) pos (map (look env) args) k
  TailPrim prim _pos arg -> \k -> ITick I.TailPrim $ executePrimitive prim [look env arg] k
  LetAtomic (x,t) a1 c2 -> \k -> do
    evalA a1 $ \v1 -> do
      evalCode genv (insert (Ref x (InTemp t)) v1 env) c2 k
  PushContinuation pre _ (x,later) first -> \k -> ITick I.PushContinuation $ do
    evalCode genv env first $ \v1 -> do
      let env' = mkFrameEnv firstFrameIndexForContinuations genv env pre
      evalCode genv (insert x v1 env') later k
  Match scrut arms0 -> \k -> do
    case (look env scrut) of
      VCons (Ctag _ tagActual) vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] -> error "case match failure"
            ArmTag pos (Ctag _ tag) xs body : arms -> do
              if tag /= tagActual then dispatch arms else do
                if length xs /= length vArgs then error (show ("case arm mismatch",pos,xs,vArgs)) else do
                  let env' = foldr ins env (zip xs vArgs)
                        where ins ((x,t),v) = insert (Ref x (InTemp t)) v
                  evalCode genv env' body k
        dispatch arms0
      v ->
        error (printf "case/scrut not a constructed value: %s" (show v))
  where
    evalA :: Atomic -> (Value -> Interaction) -> Interaction
    evalA = \case
      Prim prim xs -> \k -> ITick I.Prim $ executePrimitive prim (map (look env) xs) k
      ConApp tag xs -> \k -> k (VCons tag (map (look env) xs))

      Lam pre _ x body -> \k -> do
        let env' = mkFrameEnv firstFrameIndexForLambdas genv env pre
        k (VFunc (\arg k -> evalCode genv (insert x arg env') body k))

      LamN pre _ xs body -> \k -> do
        let env' = mkFrameEnv firstFrameIndexForLambdas genv env pre
        abstract genv env' xs body k

      RecLam pre _ f x0 body -> \k -> do
        let env' = mkFrameEnv firstFrameIndexForLambdas genv env pre
        let me = VFunc (\arg0 k -> evalCode genv (insert x0 arg0 $ insert f me env') body k)
        k me

      RecLamN _ _ _ [] _ -> error "RecLamN/[]"
      RecLamN pre _ f (x:xs) body -> \k -> do
        let env' = insert f me (mkFrameEnv firstFrameIndexForLambdas genv env pre)
            me = abstractV genv env' x xs body
        k me

abstractV :: Env -> Env -> Ref -> [Ref] -> Code -> Value
abstractV genv env x xs body = VFunc (\arg k -> abstract genv (insert x arg env) xs body k)

abstract :: Env -> Env -> [Ref] -> Code -> (Value -> Interaction) -> Interaction
abstract genv env xs body k = case xs of
  [] -> evalCode genv env body k
  x:xs -> k (abstractV genv env x xs body)

data Env = Env { venv :: Map Location Value }

env0 :: Env
env0 = Env { venv = Map.empty }

mkFrameEnv :: Int -> Env -> Env -> [Ref] -> Env
mkFrameEnv firstFrameIndex genv env fvs =
  foldr (uncurry insert) genv [ (Ref undefined (InFrame n), look env ref) | (n,ref) <- zip [firstFrameIndex..] fvs ]

insert :: Ref -> Value -> Env -> Env
insert ref v Env{venv} =
  case ref of
    RefLitC{} -> undefined -- TODO: rejig code so we know this can never happen
    RefLitN{} -> undefined
    Ref _ loc -> Env { venv = Map.insert loc v venv }

----------------------------------------------------------------------
-- Compile

type Cenv = Map Id Ref

compile :: SRC.Code -> Transformed
compile c = runM (Run <$> compileCtop Map.empty c)

compileCtop :: Cenv -> SRC.Code -> M Code
compileCtop = compileC firstTempIndex

  where

    compileC :: Int -> Cenv -> SRC.Code -> M Code
    compileC nextTemp cenv = \case
      SRC.Return pos v -> pure $ Return pos (compileV cenv v)
      SRC.Tail func pos arg -> pure $ Tail (compileV cenv func) pos (compileV cenv arg)
      SRC.TailN func pos args -> pure $ TailN (compileV cenv func) pos (map (compileV cenv) args)
      SRC.TailPrim prim pos arg-> pure $ TailPrim prim pos (compileV cenv arg)

      SRC.LetAtomic x rhs body -> do
        compileA cenv rhs >>= \case
          Left rhs -> do -- not gloablized
            let temp = Temp (if nextTemp > maxTempIndex then err else nextTemp)
                  where err = error (show ("too many temps",nextTemp))
            cenv <- pure $ Map.insert x (Ref x (InTemp temp)) cenv
            body <- compileC (nextTemp+1) cenv body
            pure $ LetAtomic (x,temp) rhs body
          Right (xRefG, rhs) -> do -- globalized
            -- liftable things can have no effetcs, so if they are not even used we can just drop them
            if x `notMember` SRC.fvs body then compileC nextTemp cenv body else do
              cenv <- pure $ Map.insert x (Ref x (InGlobal xRefG)) cenv
              Wrap (LetTop (x,xRefG) rhs) $ compileC nextTemp cenv body

      SRC.PushContinuation fvs (x,later) first -> do
        let xRef = Ref x (TheArg 0)
        first <- compileC nextTemp cenv first
        (cenv,pre,post) <- pure $ frame firstFrameIndexForContinuations cenv fvs
        later <- compileCtop (Map.insert x xRef cenv) later
        pure $ PushContinuation pre post (xRef,later) first

      SRC.Match scrut arms -> do
        arms <- mapM compileArm arms
        pure $ Match (compileV cenv scrut) arms

      where
        compileArm :: SRC.Arm -> M Arm
        compileArm (SRC.ArmTag pos tag xs body) = do
          let temps = [ (x,Temp n) | (x,n) <- zip xs [nextTemp..] ]
          let refs = [ Ref x (InTemp t) | (x,t) <- temps ]
          cenv <- pure $ foldr (uncurry Map.insert) cenv (zip xs refs)
          body <- compileC (nextTemp + length xs) cenv body
          pure $ ArmTag pos tag temps body

compileA ::Cenv -> SRC.Atomic -> M (Either Atomic (Global,Top))
compileA cenv = \case
  SRC.LitS _ string -> do
    g <- GlobalRef
    pure $ Right (g, TopLitS string)

  SRC.Prim _ prim xs -> do
    let xs' = map (compileV cenv) xs
    if isPure prim && all isGlobal xs' then
      do
        g <- GlobalRef
        pure $ Right (g, TopPrim prim xs')
      else do
        pure $ Left $ Prim prim xs'

  SRC.ConTag _ c xs -> do
    let xs' = map (compileV cenv) xs
    if all isGlobal xs' then
      do
        g <- GlobalRef
        pure $ Right (g, TopConApp c xs')
      else do
        pure $ Left (ConApp c xs')

  SRC.Lam _ fvs x0 body -> do
    let r0 = Ref x0 (TheArg 0)
    (cenv,pre,post) <- pure $ frame firstFrameIndexForLambdas cenv fvs
    body <- compileCtop (Map.insert x0 r0 cenv) body
    case (pre,post) of
      ([],[]) -> do
        g <- GlobalRef
        pure $ Right (g, TopLam r0 body)
      _ ->
        pure $ Left (Lam pre post r0 body)

  SRC.LamN _ fvs xs body -> do
    let rs = [ Ref x (TheArg i) | (i,x) <- zip [0..] xs ]
    (cenv,pre,post) <- pure $ frame firstFrameIndexForLambdas cenv fvs
    body <- compileCtop (Map.fromList (zip xs rs) `Map.union` cenv) body
    case (pre,post) of
      ([],[]) -> do
        g <- GlobalRef
        pure $ Right (g, TopLamN rs body)
      _ ->
        pure $ Left (LamN pre post rs body)

  SRC.RecLam _ fvs f x0 body -> do
    (cenv,pre,post) <- pure $ frame firstFrameIndexForLambdas cenv fvs
    let r0 = Ref x0 (TheArg 0)
    case (pre,post) of
      ([],[]) -> do
        g <- GlobalRef
        let rF = Ref f (InGlobal g)
        body <- compileCtop (Map.insert f rF $ Map.insert x0 r0 cenv) body
        pure $ Right (g, TopLam r0 body)
      _ -> do
        let rF = Ref f TheFrame
        body <- compileCtop (Map.insert f rF $ Map.insert x0 r0 cenv) body
        pure $ Left (RecLam pre post rF r0 body)

  SRC.RecLamN _ fvs f xs body -> do
    (cenv,pre,post) <- pure $ frame firstFrameIndexForLambdas cenv fvs
    let rs = [ Ref x (TheArg i) | (i,x) <- zip [0..] xs ]
    case (pre,post) of
      ([],[]) -> do
        g <- GlobalRef
        let rF = Ref f (InGlobal g)
        body <- compileCtop (Map.fromList ((f,rF):zip xs rs) `Map.union` cenv) body
        pure $ Right (g, TopLamN rs body)
      _ -> do
        let rF = Ref f TheFrame
        body <- compileCtop (Map.fromList ((f,rF):zip xs rs) `Map.union` cenv) body
        pure $ Left (RecLamN pre post rF rs body)

compileV :: Cenv -> SRC.Val -> Ref
compileV cenv = \case
  SRC.Named x -> locate cenv x
  SRC.LitC c -> RefLitC c
  SRC.LitN n -> RefLitN n

frame :: Int -> Cenv -> [Id] -> (Cenv,[Ref],[Ref])
frame firstFrameIndex cenv fvs = do
  -- partition fvs in global/truely-free
  let globXs = [ x | x <- fvs, isGlobal (locate cenv x) ]
  let freeXs = [ x | x <- fvs, not (isGlobal (locate cenv x)) ]

  let pre = map (locate cenv) freeXs
  let post = [ Ref x (InFrame n) | (x,n) <- zip freeXs [firstFrameIndex..] ]

  let cenv' = Map.fromList $ [ (x,locate cenv x) | x <- globXs ] ++ [ (x,ref) | ref@(Ref x _) <- post ]
  (cenv', pre, post)

locate :: Cenv -> Id -> Ref
locate cenv x = maybe err id $ Map.lookup x cenv
  where err = error (show ("Stage4.locate",x))

isGlobal :: Ref -> Bool
isGlobal = \case Ref _ (InGlobal _) -> True; _ -> False

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  Wrap :: (Image -> Image) -> M b -> M b
  GlobalRef :: M Global

runM :: M Image -> Image
runM m0 = loop firstGlobalIndex m0 $ \_ x -> x
  where
    loop :: Int -> M a -> (Int -> a -> Image) -> Image
    loop u m k = case m of
      Ret x -> k u x
      Bind m f -> loop u m $ \u x -> loop u (f x) k
      Wrap f m -> f (loop u m k)
      GlobalRef -> k (u+1) (Global u)
