-- | ANF style expressions. All sub-expressions named. Atomic/Compound expression forms distinguished.
module Stage2
  ( execute
  , compile
  ) where

import Builtin (Builtin,evalBuiltin)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Interaction (Interaction(..))
import Lines (Lines,bracket,onHead,onTail,indented)
import Par4 (Position(..))
import Stage0 (evalLit,apply,Literal,Id(..))
import Stage1 (Ctag(..))
import Text.Printf (printf)
import Value (Value(..),deUnit)
import qualified Data.Map as Map
import qualified Stage1 as SRC

type Transformed = Code

data Code
  = Var (Maybe Position) Id
  | App Id Position Id
  | LetAtomic Id Atomic Code
  | PushContinuation (Id,Code) Code
  | Case Id [Arm]
  | Atomic Atomic -- TODO: remove this

data Arm = ArmTag Ctag [Id] Code

-- Atomic expressions cause only bounded evaluation.
data Atomic
  = Lit Literal
  | Prim Builtin [Id]
  | ConTag Ctag [Id]
  | Lam Id Code
  | RecLam Id Id Code

----------------------------------------------------------------------
-- Show

instance Show Code where show = intercalate "\n" . ("let k () = ()":) . pretty

pretty :: Code -> Lines
pretty = \case
  Atomic a -> onHead ("k "++) $ prettyA a
  Var _ x -> ["k "++show x]
  App x1 _ x2 -> [printf "%s %s k" (show x1) (show x2)]
  LetAtomic x rhs body -> indented ("let " ++ show x ++ " =") (onTail (++ " in") (prettyA rhs)) ++ pretty body
  PushContinuation (x,later) first -> indented ("let k " ++ show x ++ " =") (onTail (++ " in") (pretty later)) ++ pretty first
  Case scrut arms -> (onHead ("match "++) . onTail (++ " with")) [show scrut] ++ concat (map prettyArm arms)

prettyA :: Atomic -> Lines
prettyA = \case
  Lit x -> [show x]
  Prim b xs -> do [printf "PRIM_%s%s" (show b) (show xs)]
  ConTag tag [] -> [show tag]
  ConTag tag xs -> [printf "%s%s" (show tag) (show xs)]
  Lam x body -> bracket $ indented ("fun " ++ show x ++ " k ->") (pretty body)
  RecLam f x body -> onHead ("fix "++) $ bracket $ indented ("fun " ++ show f ++ " " ++ show x ++ " k ->") (pretty body)

prettyArm :: Arm -> Lines
prettyArm = \case
  ArmTag c xs rhs -> do
    indented ("| " ++ prettyPat c xs ++ " ->") (pretty rhs)

prettyPat :: Ctag -> [Id] -> String
prettyPat tag = \case
  [] -> show tag
  xs -> printf "%s(%s)" (show tag) (intercalate "," (map show xs))

----------------------------------------------------------------------
-- Execute

execute :: Transformed -> Interaction
execute = evalCode0

evalCode0 :: Code -> Interaction
evalCode0 exp =
  evalCode env0 exp $ \v -> case deUnit v of () -> IDone

evalCode :: Env -> Code -> (Value -> Interaction) -> Interaction
evalCode env@Env{venv} = \case
  Atomic a -> evalA a
  Var _pos x -> \k -> k (look x)
  App x1 pos x2 -> \k -> apply (look x1) pos (look x2) k
  LetAtomic x a1 c2 -> \k -> do
    evalA a1 $ \v1 -> do
      evalCode env { venv = Map.insert x v1 venv } c2 k
  PushContinuation (x,later) first -> \k -> do
    evalCode env first $ \v1 -> do
      evalCode env { venv = Map.insert x v1 venv } later k
  Case scrut arms0 -> \k -> do
    case (look scrut) of
      VCons tagActual vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] -> error "case match failure"
            ArmTag (Ctag tag) xs body : arms -> do
              if tag /= tagActual then dispatch arms else do
                if length xs /= length vArgs then error (show ("case arm mismatch",xs,vArgs)) else do
                  let env' = env { venv = foldr (uncurry Map.insert) venv (zip xs vArgs) }
                  evalCode env' body k
        dispatch arms0
      v ->
        error (printf "case/scrut not a constructed value: %s" (show v))
  where
    evalA :: Atomic -> (Value -> Interaction) -> Interaction
    evalA = \case
      Lit literal -> \k -> k (evalLit literal)
      Prim b xs -> \k -> evalBuiltin b (map look xs) k
      ConTag (Ctag tag) xs -> \k -> k (VCons tag (map look xs))
      Lam x body -> \k -> do
        k (VFunc (\arg k -> evalCode env { venv = Map.insert x arg venv } body k))
      RecLam f x body -> \k -> do
        let me = VFunc (\arg k -> evalCode env { venv = Map.insert f me (Map.insert x arg venv) } body k)
        k me

    look :: Id -> Value
    look x = do
      maybe err id $ Map.lookup x venv
        where err = error (show ("var-lookup",x))

data Env = Env { venv :: Map Id Value }

env0 :: Env
env0 = Env { venv = Map.empty }

----------------------------------------------------------------------
-- Compile

-- | Convert to ANF. Generate name for all sub expressions.
-- | Distinguish binding of Atomic/Compound expressions

compile :: SRC.Exp -> Transformed
compile e = runM (trans e)

trans :: SRC.Exp -> M Code
trans = \case
  SRC.Var p x -> do
    pure $ Var p x
  SRC.Lit x -> do
    pure $ Atomic $ Lit x
  SRC.ConTag tag es -> do
    transIds es $ \xs ->
      pure $ Atomic $ ConTag tag xs
  SRC.Prim b es -> do
    transIds es $ \xs ->
      pure $ Atomic $ Prim b xs
  SRC.Lam x body -> (Atomic . Lam x) <$> trans body
  SRC.RecLam f x body -> (Atomic . RecLam f x) <$> trans body
  SRC.App e1 p e2 -> do
    transId e1 $ \x1 -> do
      transId e2 $ \x2 -> do
        pure $ App x1 p x2
  SRC.Let x rhs body -> do
    rhs <- trans rhs
    body <- trans body
    pure $ mkLet x rhs body
  SRC.Case scrut arms -> do
    transId scrut $ \scrut -> do
      arms <- mapM transArm arms
      pure $ Case scrut arms

mkLet :: Id -> Code -> Code -> Code
mkLet x rhs body = case rhs of
  Atomic rhs -> LetAtomic x rhs body
  _ -> PushContinuation (x,body) rhs

transArm :: SRC.Arm -> M Arm
transArm (SRC.ArmTag tag xs exp) = do
  exp <- trans exp
  pure $ ArmTag tag xs exp

transId :: SRC.Exp -> (Id -> M Code) -> M Code
transId e k = case e of
  SRC.Var _pos x -> k x
  _ -> do
    u <- Fresh "u"
    code <- trans e
    mkLet u code <$> k u

transIds :: [SRC.Exp] -> ([Id] -> M Code) -> M Code
transIds es k = case es of
  [] -> k []
  e:es -> do
    transId e $ \x -> do
      transIds es $ \xs ->
        k (x:xs)

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  Fresh :: String -> M Id

runM :: M a -> a
runM m0 = loop 1 m0 $ \_ x -> x
  where
    loop :: Int -> M a -> (Int -> a -> b) -> b
    loop u m k = case m of
      Ret x -> k u x
      Bind m f -> loop u m $ \u x -> loop u (f x) k
      Fresh tag -> k (u+1) (Id (printf "%s%d" tag u))
