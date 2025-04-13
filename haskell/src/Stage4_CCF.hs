-- | Locate identifier references at runtime; lift globals
module Stage4_CCF
  ( Loadable(..), Top(..), Code(..), Atomic(..), Arm(..), Ref(..), Location(..), Global(..), Temp(..)
  , execute
  , compile
  ) where

import Builtin (Builtin,executeBuiltin,isPure,evaluatePureBuiltin)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Set (notMember)
import Interaction (Interaction(..))
import Lines (Lines,(<++),(++>),(>>>))
import Par4 (Position(..))
import Stage0_AST (evalLit,apply,Literal)
import Stage1_EXP (Id(..),Ctag(..))
import Text.Printf (printf)
import Value (Value(..),deUnit)
import qualified Data.Map as Map
import qualified Interaction as I (Tickable(..))
import qualified Stage3_ANF as SRC (Code(..),Atomic(..),Arm(..), fvs)

type Transformed = Loadable

-- TODO: Better names for Loadable/Top

data Loadable -- restriction of Code
  = Run Code
  | LetTop (Id,Global) Top Loadable

data Top -- restriction of Atomic
  = TopLit Literal
  | TopPrim Builtin [Ref]
  | TopLam Ref Code -- always allowing recursion
  | TopConApp Ctag [Ref]

data Code
  = Return Position Ref
  | Tail Ref Position Ref
  | LetAlias Ref Ref Code
  | LetAtomic (Id,Temp) Atomic Code
  | PushContinuation [Ref] [Ref] (Ref,Code) Code
  | Case Ref [Arm]

data Arm = ArmTag Position Ctag [(Id,Temp)] Code

data Atomic
  = Prim Builtin [Ref]
  | ConApp Ctag [Ref]
  | Lam [Ref] [Ref] Ref Code
  | RecLam [Ref] [Ref] Ref Ref Code

data Location = InGlobal Global | InFrame Int | InTemp Temp | TheFrame | TheArg deriving (Eq,Ord)
data Ref = Ref Id Location

data Global = Global Int deriving (Eq,Ord)
data Temp = Temp Int deriving (Eq,Ord)

firstFrameIndexForLambdas,firstFrameIndexForContinuations,firstTempIndex,firstGlobalIndex :: Int
firstFrameIndexForLambdas = 1
firstFrameIndexForContinuations = 2
firstTempIndex = 1
firstGlobalIndex = 1

-- need 29 temps for the thrice example; no reason to not have more; but want to known when required
maxTempIndex :: Int
maxTempIndex = 30

----------------------------------------------------------------------
-- Show

instance Show Loadable where show = intercalate "\n" . ("let k () = ()":) . prettyL

prettyL :: Loadable -> Lines
prettyL = \case
  Run code -> prettyC code
  LetTop (_,g) rhs body ->
    ("let " ++ show g ++ " = ") <++ prettyT rhs ++> " in"
    ++ prettyL body

prettyT :: Top -> Lines
prettyT = \case
  TopLit x -> [show x]
  TopPrim b xs -> [printf "PRIM_%s(%s)" (show b) (intercalate "," (map show xs))]
  TopLam x body ->
    ("fun " ++ show x ++ " k ->")
    >>> prettyC body
  TopConApp tag [] -> [show tag]
  TopConApp tag xs -> [printf "%s%s" (show tag) (show xs)]

prettyC :: Code -> Lines
prettyC = \case
  Return _ x -> ["k " ++ show x]
  Tail x1 _pos x2 -> [printf "%s %s k" (show x1) (show x2)]
  LetAlias x y body ->
    ["let " ++ show x ++ " = " ++ show y ++ " in"]
    ++ prettyC body
  LetAtomic (_,t) rhs body ->
    ("let " ++ show t ++ " = ") <++ prettyA rhs ++> " in"
    ++ prettyC body
  PushContinuation pre post (x,later) first ->
    ("let k = " ++ show pre ++ ", fun " ++ show post ++ " " ++ show x ++ " ->")
    >>> prettyC later ++> " in"
    ++ prettyC first
  Case scrut arms ->
    "match " <++ [show scrut] ++> " with"
    ++ concat (map prettyArm arms)

prettyA :: Atomic -> Lines
prettyA = \case
  Prim b xs -> [printf "PRIM_%s(%s)" (show b) (intercalate "," (map show xs))]
  ConApp tag [] -> [show tag]
  ConApp tag xs -> [printf "%s%s" (show tag) (show xs)]
  Lam pre post x body ->
    (show pre ++ ", fun " ++ show post ++ " " ++ show x ++ " k ->")
    >>> prettyC body
  RecLam pre post f x body ->
    (show pre ++ ", fun " ++ show post ++ " " ++ show f ++ " " ++ show x ++ " k ->")
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
  show (Ref x loc) = do
    let verbose = False
    if not verbose then show loc else
      show x ++ "_" ++ show loc

instance Show Location where
  show = \case
    InGlobal g -> show g
    InFrame n -> "f" ++ show n
    InTemp t -> show t
    TheArg -> "arg"
    TheFrame -> "me"

instance Show Global where
  show (Global n) = "g" ++ show n

instance Show Temp where
  show (Temp n) = "t" ++ show n

----------------------------------------------------------------------
-- Execute

execute :: Transformed -> Interaction
execute = evalLoadable0

evalLoadable0 :: Loadable -> Interaction
evalLoadable0 exp = do
  -- All global defs may mutually recurse; we tie the knot for gev here.
  let (code,genv) = evalLoadable genv env0 exp
  evalCode genv genv code $ \v -> case deUnit v of () -> IDone

evalLoadable :: Env -> Env -> Loadable -> (Code,Env)
evalLoadable genv env = \case
  Run code -> (code,env)
  LetTop (x,g) top body -> do
    let env' = insert (Ref x (InGlobal g)) (evalT genv top) env
    evalLoadable genv env' body

look :: Env -> Ref -> Value
look Env{venv} (Ref x loc) = do
  maybe err id $ Map.lookup loc venv
  where err = error (show ("Stage4.look",x,loc,venv))

evalT :: Env -> Top -> Value
evalT genv = \case
  TopLit literal -> evalLit literal
  TopPrim b xs -> evaluatePureBuiltin b (map (look genv) xs)
  TopLam x body -> VFunc (\arg k -> evalCode genv (insert x arg genv) body k)
  TopConApp (Ctag _ tag) xs -> VCons tag (map (look genv) xs)

evalCode :: Env -> Env -> Code -> (Value -> Interaction) -> Interaction
evalCode genv env = \case
  Return _ x -> \k -> ITick I.Return $ k (look env x)
  Tail x1 pos x2 -> \k -> ITick I.Enter $ apply (look env x1) pos (look env x2) k
  LetAlias x y body -> \k -> do
    let v = look env y
    evalCode genv (insert x v env) body k
  LetAtomic (x,t) a1 c2 -> \k -> do
    evalA a1 $ \v1 -> do
      evalCode genv (insert (Ref x (InTemp t)) v1 env) c2 k
  PushContinuation pre _ (x,later) first -> \k -> ITick I.PushContinuation $ do
    evalCode genv env first $ \v1 -> do
      let env' = mkFrameEnv firstFrameIndexForContinuations genv env pre
      evalCode genv (insert x v1 env') later k
  Case scrut arms0 -> \k -> do
    case (look env scrut) of
      VCons tagActual vArgs -> do
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
      Prim b xs -> \k -> ITick I.Prim $ executeBuiltin b (map (look env) xs) k
      ConApp (Ctag _ tag) xs -> \k -> k (VCons tag (map (look env) xs))

      Lam pre _ x body -> \k -> do
        let env' = mkFrameEnv firstFrameIndexForLambdas genv env pre
        k (VFunc (\arg k -> evalCode genv (insert x arg env') body k))

      RecLam pre _ f x body -> \k -> do
        let env' = mkFrameEnv firstFrameIndexForLambdas genv env pre
        let me = VFunc (\arg k -> do evalCode genv (insert x arg (insert f me env')) body k)
        k me

data Env = Env { venv :: Map Location Value }

env0 :: Env
env0 = Env { venv = Map.empty }

mkFrameEnv :: Int -> Env -> Env -> [Ref] -> Env
mkFrameEnv firstFrameIndex genv env fvs =
  foldr (uncurry insert) genv [ (Ref undefined (InFrame n), look env ref) | (n,ref) <- zip [firstFrameIndex..] fvs ]

insert :: Ref -> Value -> Env -> Env
insert (Ref _ loc) v Env{venv} = Env { venv = Map.insert loc v venv }

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
      SRC.Return pos x -> pure $ Return pos (locate cenv x)
      SRC.Tail x1 pos x2 -> pure $ Tail (locate cenv x1) pos (locate cenv x2)

      SRC.LetAlias x y body -> do
        let yRef@(Ref _ yLoc) = locate cenv y
        let xRef = Ref x yLoc
        cenv <- pure $ Map.insert x xRef cenv
        body <- compileC nextTemp cenv body
        pure $ LetAlias xRef yRef body

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
        let xRef = Ref x TheArg
        first <- compileC nextTemp cenv first
        (cenv,pre,post) <- pure $ frame firstFrameIndexForContinuations cenv fvs
        later <- compileCtop (Map.insert x xRef cenv) later
        pure $ PushContinuation pre post (xRef,later) first

      SRC.Case scrut arms -> do
        arms <- mapM compileArm arms
        pure $ Case (locate cenv scrut) arms

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
  SRC.Lit _ literal -> do
    g <- GlobalRef
    pure $ Right (g, TopLit literal)

  SRC.Prim _ b xs -> do
    let xs' = map (locate cenv) xs
    if isPure b && all isGlobal xs' then
      do
        g <- GlobalRef
        pure $ Right (g, TopPrim b xs')
      else do
        pure $ Left $ Prim b xs'

  SRC.ConTag _ c xs -> do
    let xs' = map (locate cenv) xs
    if all isGlobal xs' then
      do
        g <- GlobalRef
        pure $ Right (g, TopConApp c xs')
      else do
        pure $ Left (ConApp c xs')

  SRC.Lam _ fvs x body -> do
    let xRef = Ref x TheArg
    (cenv,pre,post) <- pure $ frame firstFrameIndexForLambdas cenv fvs
    body <- compileCtop (Map.insert x xRef cenv) body
    case (pre,post) of
      ([],[]) -> do
        g <- GlobalRef
        pure $ Right (g, TopLam xRef body)
      _ ->
        pure $ Left (Lam pre post xRef body)

  SRC.RecLam _ fvs f x body -> do
    (cenv,pre,post) <- pure $ frame firstFrameIndexForLambdas cenv fvs
    let xRef = Ref x TheArg
    case (pre,post) of
      ([],[]) -> do
        g <- GlobalRef
        let fRef = Ref f (InGlobal g)
        body <- compileCtop (Map.insert f fRef (Map.insert x xRef cenv)) body
        pure $ Right (g, TopLam xRef body)
      _ -> do
        let fRef = Ref f TheFrame
        body <- compileCtop (Map.insert f fRef (Map.insert x xRef cenv)) body
        pure $ Left (RecLam pre post fRef xRef body)


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
  Wrap :: (Loadable -> Loadable) -> M b -> M b
  GlobalRef :: M Global

runM :: M Loadable -> Loadable
runM m0 = loop firstGlobalIndex m0 $ \_ x -> x
  where
    loop :: Int -> M a -> (Int -> a -> Loadable) -> Loadable
    loop u m k = case m of
      Ret x -> k u x
      Bind m f -> loop u m $ \u x -> loop u (f x) k
      Wrap f m -> f (loop u m k)
      GlobalRef -> k (u+1) (Global u)
