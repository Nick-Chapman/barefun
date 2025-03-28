-- | Locate identifier references at runtime; lift globals
module Stage3
  ( execute
  , compile
  ) where

import Builtin (Builtin,evalBuiltin)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Set (member)
import Interaction (Interaction(..))
import Lines (Lines,(<++),(++>),(>>>))
import Par4 (Position(..))
import Stage0 (evalLit,apply,Literal)
import Stage1 (Id(..),Ctag(..))
import Text.Printf (printf)
import Value (Value(..),deUnit)
import qualified Data.Map as Map
import qualified Stage2 as SRC (Code(..),Atomic(..),Arm(..), fvs)

type Transformed = Loadable

data Loadable -- restriction of Code
  = Run Code
  | LetTop Ref Top Loadable

data Top -- restriction of Atomic
  = TopLit Literal
  | TopLam Ref Code
  | TopRecLam Ref Ref Code
  -- TODO: TopConTag

data Code
  = Return Position Ref
  | Tail Ref Position Ref
  | LetAlias Ref Ref Code
  | LetAtomic Ref Atomic Code
  | PushContinuation [Ref] [Ref] (Ref,Code) Code
  | Case Ref [Arm]

data Arm = ArmTag Ctag [Ref] Code

data Atomic
  = Lit Literal -- TODO Never here. Will always be lifted to a global
  | Prim Builtin [Ref]
  | ConTag Ctag [Ref]
  | Lam [Ref] [Ref] Ref Code
  | RecLam [Ref] [Ref] Ref Ref Code

data Location = Global Int | InFrame Int | Temp Int | TheFrame | TheArg deriving (Eq,Ord)
data Ref = Ref Id Location

firstFrameIndex,firstTempIndex,firstGlobalIndex :: Int
firstFrameIndex = 1
firstTempIndex = 1
firstGlobalIndex = 1

----------------------------------------------------------------------
-- Show

instance Show Loadable where show = intercalate "\n" . ("let k () = ()":) . prettyL

prettyL :: Loadable -> Lines
prettyL = \case
  Run code -> prettyC code
  LetTop x rhs body ->
    ("let " ++ show x ++ " = ") <++ prettyT rhs ++> " in"
    ++ prettyL body

prettyT :: Top -> Lines
prettyT = \case
  TopLit x -> [show x]
  TopLam x body ->
    ("fun " ++ show x ++ " k ->")
    >>> prettyC body
  TopRecLam f x body ->
    ("fun " ++ show f ++ " " ++ show x ++ " k ->")
    >>> prettyC body

prettyC :: Code -> Lines
prettyC = \case
  Return _ x -> ["k " ++ show x]
  Tail x1 _pos x2 -> [printf "%s %s k" (show x1) (show x2)]
  LetAlias x y body ->
    ["let " ++ show x ++ " = " ++ show y ++ " in"]
    ++ prettyC body
  LetAtomic x rhs body ->
    ("let " ++ show x ++ " = ") <++ prettyA rhs ++> " in"
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
  Lit x -> [show x]
  Prim b xs -> [printf "PRIM_%s(%s)" (show b) (intercalate "," (map show xs))]
  ConTag tag [] -> [show tag]
  ConTag tag xs -> [printf "%s%s" (show tag) (show xs)]
  Lam pre post x body ->
    (show pre ++ ", fun " ++ show post ++ " " ++ show x ++ " k ->")
    >>> prettyC body
  RecLam pre post f x body ->
    (show pre ++ ", fun " ++ show post ++ " " ++ show f ++ " " ++ show x ++ " k ->")
    >>> prettyC body

prettyArm :: Arm -> Lines
prettyArm = \case
  ArmTag c xs rhs ->
    ("| " ++ prettyPat c xs ++ " ->")
    >>> prettyC rhs

prettyPat :: Ctag -> [Ref] -> String
prettyPat tag = \case
  [] -> show tag
  xs -> printf "%s(%s)" (show tag) (intercalate "," (map show xs))

instance Show Ref where show (Ref x loc) = show x ++ "_" ++ show loc

instance Show Location where
  show = \case
    Global n -> "g" ++ show n
    InFrame n -> "f" ++ show n
    Temp n -> "t" ++ show n
    TheArg -> "arg"
    TheFrame -> "me"

----------------------------------------------------------------------
-- Execute

execute :: Transformed -> Interaction
execute = evalLoadable0

evalLoadable0 :: Loadable -> Interaction
evalLoadable0 exp =
  evalLoadable env0 exp $ \v -> case deUnit v of () -> IDone

evalLoadable :: Env -> Loadable -> (Value -> Interaction) -> Interaction
evalLoadable env = \case
  Run code -> evalCode env env code
  LetTop x top body -> \k ->
    evalT env top $ \v -> do
      evalLoadable (insert x v env) body k

evalT :: Env -> Top -> (Value -> Interaction) -> Interaction
evalT genv = \case
  TopLit literal -> \k -> k (evalLit literal)
  TopLam x body -> \k -> do
    k (VFunc (\arg k -> evalCode genv (insert x arg genv) body k))
  TopRecLam f x body -> \k -> do
    let me = VFunc (\arg k -> do evalCode genv (insert x arg (insert f me genv)) body k)
    k me

-- TODO: pickup genv from scope in stead of threading?
evalCode :: Env -> Env -> Code -> (Value -> Interaction) -> Interaction
evalCode genv env = \case
  Return _ x -> \k -> k (look x)
  Tail x1 pos x2 -> \k -> ITickApp $ apply (look x1) pos (look x2) k
  LetAlias x y body -> \k -> do
    let v = look y
    evalCode genv (insert x v env) body k
  LetAtomic x a1 c2 -> \k -> do
    evalA a1 $ \v1 -> do
      evalCode genv (insert x v1 env) c2 k
  PushContinuation pre _ (x,later) first -> \k -> do
    evalCode genv env first $ \v1 -> do
      let env = mkFrameEnv genv look pre
      evalCode genv (insert x v1 env) later k
  Case scrut arms0 -> \k -> do
    case (look scrut) of
      VCons tagActual vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] -> error "case match failure"
            ArmTag (Ctag _ tag) xs body : arms -> do
              if tag /= tagActual then dispatch arms else do
                if length xs /= length vArgs then error (show ("case arm mismatch",xs,vArgs)) else do
                  let env' = foldr (uncurry insert) env (zip xs vArgs)
                  evalCode genv env' body k
        dispatch arms0
      v ->
        error (printf "case/scrut not a constructed value: %s" (show v))
  where
    evalA :: Atomic -> (Value -> Interaction) -> Interaction
    evalA = \case
      Lit literal -> \k -> k (evalLit literal)
      Prim b xs -> \k -> evalBuiltin b (map look xs) k
      ConTag (Ctag _ tag) xs -> \k -> k (VCons tag (map look xs))

      Lam pre _ x body -> \k -> do
        let env = mkFrameEnv genv look pre
        k (VFunc (\arg k -> evalCode genv (insert x arg env) body k))

      RecLam pre _ f x body -> \k -> do
        let env = mkFrameEnv genv look pre
        let me = VFunc (\arg k -> do evalCode genv (insert x arg (insert f me env)) body k)
        k me

    look :: Ref -> Value
    look (Ref x loc) = do
      let Env{venv} = env
          err = error (show ("var-lookup",x,loc,venv))
      maybe err id $ Map.lookup loc venv

data Env = Env { venv :: Map Location Value }

env0 :: Env
env0 = Env { venv = Map.empty }

mkFrameEnv :: Env -> (Ref -> Value) -> [Ref] -> Env
mkFrameEnv genv look fvs =
  foldr (uncurry insert) genv [ (Ref undefined (InFrame n), look ref) | (n,ref) <- zip [firstFrameIndex..] fvs ]

insert :: Ref -> Value -> Env -> Env
insert (Ref _ loc) v Env{venv} = Env { venv = Map.insert loc v venv }

----------------------------------------------------------------------
-- Compile

type Cenv = Map Id Ref

locateCenv :: Cenv -> Id -> Ref
locateCenv cenv x = maybe err id $ Map.lookup x cenv
  where err = error (show ("locateCenv",x))

compile :: SRC.Code -> Transformed
compile c = runM (Run <$> compileC Map.empty c)

compileC :: Cenv -> SRC.Code -> M Code
compileC = walkC firstTempIndex

  where
    walkC :: Int -> Cenv -> SRC.Code -> M Code
    walkC nextTemp cenv = \case
      SRC.Return pos x -> pure $ Return pos (locate x)
      SRC.Tail x1 pos x2 -> pure $ Tail (locate x1) pos (locate x2)

      SRC.LetAlias x y body -> do
        let yRef@(Ref _ yLoc) = locate y
        let xRef = Ref x yLoc
        let cenv' = Map.insert x xRef cenv
        body <- walkC nextTemp cenv' body
        pure $ LetAlias xRef yRef body

      SRC.LetAtomic x rhs body -> do
        rhs <- walkA rhs
        case maybeLiftable rhs of
          Nothing -> do
            let xRef = Ref x (Temp nextTemp)
            let cenv' = Map.insert x xRef cenv
            body <- walkC (nextTemp+1) cenv' body
            pure $ LetAtomic xRef rhs body
          Just rhs -> do
            if x `member` SRC.fvs body
              then
              do
                xRef <- GlobalRef x
                let cenv' = Map.insert x xRef cenv
                Wrap (LetTop xRef rhs) $ walkC nextTemp cenv' body
              else
              do
                walkC nextTemp cenv body

      SRC.PushContinuation fvs (x,later) first -> do
        let xRef = Ref x TheArg
        first <- walkC nextTemp cenv first
        let (cenv,pre,post) = frame locate fvs
        later <- compileC (Map.insert x xRef cenv) later
        pure $ PushContinuation pre post (xRef,later) first

      SRC.Case scrut arms -> do
        arms <- mapM walkArm arms
        pure $ Case (locate scrut) arms

      where
        walkArm :: SRC.Arm -> M Arm
        walkArm (SRC.ArmTag tag xs body) = do
          let refs = [ Ref x (Temp n) | (x,n) <- zip xs [nextTemp..] ]
          let cenv' = foldr (uncurry Map.insert) cenv (zip xs refs)
          body <- walkC (nextTemp + length xs) cenv' body
          pure $ ArmTag tag refs body

        locate :: Id -> Ref
        locate = locateCenv cenv

        -- TODO: have walkA return a variant of Atomic or Top
        walkA :: SRC.Atomic -> M Atomic
        walkA = \case
          SRC.Lit _ literal -> pure $ Lit literal
          SRC.Prim _ b xs -> pure $ Prim b (map locate xs)
          SRC.ConTag _ tag xs -> pure $ ConTag tag (map locate xs)

          SRC.Lam _ fvs x body -> do
            let xRef = Ref x TheArg
            let (cenv,pre,post) = frame locate fvs
            body <- compileC (Map.insert x xRef cenv) body
            pure $ Lam pre post xRef body

          SRC.RecLam fvs f x body -> do
            let fRef = Ref f TheFrame
            let xRef = Ref x TheArg
            let (cenv,pre,post) = frame locate fvs
            body <- compileC (Map.insert f fRef (Map.insert x xRef cenv)) body
            pure $ RecLam pre post fRef xRef body

maybeLiftable :: Atomic -> Maybe Top
maybeLiftable = \case
  Lit literal -> Just (TopLit literal)
  Lam [] [] x body -> Just (TopLam x body)
  RecLam [] [] f x body -> Just (TopRecLam f x body)
  _ -> Nothing

frame :: (Id -> Ref) -> [Id] -> (Cenv,[Ref],[Ref])
frame locate fvs = do
  -- partition fvs in global/truely-free
  let globXs = [ x | x <- fvs, isGlobal (locate x) ]
  let freeXs = [ x | x <- fvs, not (isGlobal (locate x)) ]

  let pre = map locate freeXs
  let post = [ Ref x (InFrame n) | (x,n) <- zip freeXs [firstFrameIndex..] ]

  let cenv = Map.fromList $ [ (x,locate x) | x <- globXs ] ++ [ (x,ref) | ref@(Ref x _) <- post ]
  (cenv, pre, post)

-- TODO: can we regard the "me" arg of a top-level lam-rec (ie. no freevars) as being global
isGlobal :: Ref -> Bool
isGlobal = \case Ref _ (Global _) -> True; _ -> False

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  Wrap :: (Loadable -> Loadable) -> M b -> M b
  GlobalRef :: Id -> M Ref

runM :: M Loadable -> Loadable
runM m0 = loop firstGlobalIndex m0 $ \_ x -> x
  where
    loop :: Int -> M a -> (Int -> a -> Loadable) -> Loadable
    loop u m k = case m of
      Ret x -> k u x
      Bind m f -> loop u m $ \u x -> loop u (f x) k
      Wrap f m -> f (loop u m k)
      GlobalRef x -> k (u+1) (Ref x (Global u))
