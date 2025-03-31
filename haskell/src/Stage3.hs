-- | Locate identifier references at runtime; lift globals
module Stage3
  ( execute
  , compile
  ) where

import Builtin (Builtin,evalBuiltin)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Set (notMember)
import Interaction (Interaction(..))
import Lines (Lines,(<++),(++>),(>>>))
import Par4 (Position(..))
import Stage0 (evalLit,apply,Literal)
import Stage1 (Id(..),Ctag(..))
import Text.Printf (printf)
import Value (Value(..),deUnit)
import qualified Data.Map as Map
import qualified Interaction as I (Tickable(..))
import qualified Stage2 as SRC (Code(..),Atomic(..),Arm(..), fvs)

type Transformed = Loadable

data Loadable -- restriction of Code
  = Run Code
  | LetTop Ref Top Loadable

data Top -- restriction of Atomic
  = TopLit Literal
  | TopLam Ref Code
  | TopRecLam Ref Ref Code
  | TopConApp Ctag [Ref]

data Code
  = Return Position Ref
  | Tail Ref Position Ref
  | LetAlias Ref Ref Code
  | LetAtomic Ref Atomic Code
  | PushContinuation [Ref] [Ref] (Ref,Code) Code -- TODO better rep to zip these two Ref lists.
  | Case Ref [Arm]

data Arm = ArmTag Ctag [Ref] Code

data Atomic
  = Prim Builtin [Ref]
  | ConApp Ctag [Ref]
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
  TopConApp tag [] -> [show tag]
  TopConApp tag xs -> [printf "%s%s" (show tag) (show xs)]

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
  ArmTag c xs rhs ->
    ("| " ++ prettyPat c xs ++ " ->")
    >>> prettyC rhs

prettyPat :: Ctag -> [Ref] -> String
prettyPat tag = \case
  [] -> show tag
  xs -> printf "%s(%s)" (show tag) (intercalate "," (map show xs))

instance Show Ref where
  show (Ref x loc) = do
    let verbose = False
    if not verbose then show loc else
      show x ++ "_" ++ show loc

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
  TopConApp (Ctag _ tag) xs -> \k -> k (VCons tag (map look xs))
  where
    look :: Ref -> Value -- TODO: dedup evalCode
    look (Ref x loc) = do
      let Env{venv} = genv
          err = error (show ("evalT-lookup",x,loc,venv))
      maybe err id $ Map.lookup loc venv

-- TODO: pickup genv from scope in stead of threading?
evalCode :: Env -> Env -> Code -> (Value -> Interaction) -> Interaction
evalCode genv env = \case
  Return _ x -> \k -> ITick I.Return $ k (look x)
  Tail x1 pos x2 -> \k -> ITick I.Enter $ apply (look x1) pos (look x2) k
  LetAlias x y body -> \k -> do
    let v = look y
    evalCode genv (insert x v env) body k
  LetAtomic x a1 c2 -> \k -> do
    evalA a1 $ \v1 -> do
      evalCode genv (insert x v1 env) c2 k
  PushContinuation pre _ (x,later) first -> \k -> ITick I.PushContinuation $ do
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
      Prim b xs -> \k -> evalBuiltin b (map look xs) k
      ConApp (Ctag _ tag) xs -> \k -> k (VCons tag (map look xs))

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
        compileA x cenv rhs >>= \case
          Left rhs -> do -- not gloablized
            let xRef = Ref x (Temp nextTemp)
            cenv <- pure $ Map.insert x xRef cenv
            body <- compileC (nextTemp+1) cenv body
            pure $ LetAtomic xRef rhs body
          Right (xRefG, rhs) -> do -- globalized
            -- liftable things can have no effetcs, so if they are not even used we can just drop them
            --xRefG <- GlobalRef x
            if x `notMember` SRC.fvs body then compileC nextTemp cenv body else do
              cenv <- pure $ Map.insert x xRefG cenv
              Wrap (LetTop xRefG rhs) $ compileC nextTemp cenv body

      SRC.PushContinuation fvs (x,later) first -> do
        let xRef = Ref x TheArg
        first <- compileC nextTemp cenv first
        (cenv,pre,post) <- pure $ frame cenv fvs
        later <- compileCtop (Map.insert x xRef cenv) later
        pure $ PushContinuation pre post (xRef,later) first

      SRC.Case scrut arms -> do
        arms <- mapM compileArm arms
        pure $ Case (locate cenv scrut) arms

      where
        compileArm :: SRC.Arm -> M Arm
        compileArm (SRC.ArmTag tag xs body) = do
          let refs = [ Ref x (Temp n) | (x,n) <- zip xs [nextTemp..] ]
          cenv <- pure $ foldr (uncurry Map.insert) cenv (zip xs refs)
          body <- compileC (nextTemp + length xs) cenv body
          pure $ ArmTag tag refs body

compileA ::Id -> Cenv -> SRC.Atomic -> M (Either Atomic (Ref,Top))
compileA x cenv = \case
  SRC.Lit _ literal -> do
    g <- GlobalRef x
    pure $ Right (g, TopLit literal)

  SRC.Prim _ b xs ->
    -- TODO: pure primitive could/should be lifted
    pure $ Left $ Prim b (map (locate cenv) xs)

  SRC.ConTag _ c xs -> do
    let xs' = map (locate cenv) xs
    if all isGlobal xs' then
      do
        g <- GlobalRef x
        pure $ Right (g, TopConApp c xs')
      else do
        pure $ Left (ConApp c xs')

  SRC.Lam _ fvs x body -> do
    let xRef = Ref x TheArg
    (cenv,pre,post) <- pure $ frame cenv fvs
    body <- compileCtop (Map.insert x xRef cenv) body
    case (pre,post) of
      ([],[]) -> do
        g <- GlobalRef x
        pure $ Right (g, TopLam xRef body)
      _ ->
        pure $ Left (Lam pre post xRef body)

  SRC.RecLam _ fvs f x body -> do
    (cenv,pre,post) <- pure $ frame cenv fvs
    let xRef = Ref x TheArg
    case (pre,post) of
      ([],[]) -> do
        g <- GlobalRef x
        let fRef = Ref f TheFrame -- TODO: use the global reference!
        body <- compileCtop (Map.insert f fRef (Map.insert x xRef cenv)) body
        pure $ Right (g, TopRecLam fRef xRef body)
      _ -> do
        let fRef = Ref f TheFrame
        body <- compileCtop (Map.insert f fRef (Map.insert x xRef cenv)) body
        pure $ Left (RecLam pre post fRef xRef body)


frame :: Cenv -> [Id] -> (Cenv,[Ref],[Ref])
frame cenv fvs = do
  -- partition fvs in global/truely-free
  let globXs = [ x | x <- fvs, isGlobal (locate cenv x) ]
  let freeXs = [ x | x <- fvs, not (isGlobal (locate cenv x)) ]

  let pre = map (locate cenv) freeXs
  let post = [ Ref x (InFrame n) | (x,n) <- zip freeXs [firstFrameIndex..] ]

  let cenv' = Map.fromList $ [ (x,locate cenv x) | x <- globXs ] ++ [ (x,ref) | ref@(Ref x _) <- post ]
  (cenv', pre, post)

locate :: Cenv -> Id -> Ref
locate cenv x = maybe err id $ Map.lookup x cenv
  where err = error (show ("Stage3.locate",x))


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
