module Transform2 (compile, execute) where

import Builtin (Builtin,evalBuiltin)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Interaction (Interaction(..))
import Lines (Lines,bracket,onHead,onTail,indented)
import Par4 (Position(..))
import Text.Printf (printf)
import Value (Value(..))
import qualified Data.Map as Map
import qualified Transform1 as SRC

type Transformed = Code

compile :: SRC.Exp -> Transformed
compile e = runM (trans e)

execute :: Transformed -> Interaction
execute = evalCode0

data Code
  = Var (Maybe Position) Id
  | Lit Literal
  | ConTag Ctag [Id]
  | Prim Builtin [Id]
  | Lam Id Code
  | RecLam Id Id Code
  | App Id Position Id
  | Case Id [Arm]
  | Let Id Code Code -- TODO: distinuish atomic/non-atomic binding

data Arm = ArmTag Ctag [Id] Code

type Ctag = SRC.Ctag
type Literal = SRC.Literal
type Id = SRC.Id

instance Show Code where show = intercalate "\n" . pretty

pretty :: Code -> Lines
pretty = \case
  Var _ x -> [show x]
  Lit x -> [show x]
  ConTag tag [] -> [show tag]
  ConTag tag xs -> [printf "%s%s" (show tag) (show xs)]
  Prim b xs -> do [printf "PRIM_%s%s" (show b) (show xs)]
  Lam x body -> bracket $ indented ("fun " ++ show x ++ " ->") (pretty body)
  RecLam f x body -> onHead ("fix "++) $ bracket $ indented ("fun " ++ show f ++ " " ++ show x ++ " ->") (pretty body)
  App x1 _ x2 -> [printf "%s %s" (show x1) (show x2)]
  Case scrut arms -> (onHead ("match "++) . onTail (++ " with")) [show scrut] ++ concat (map prettyArm arms)
  Let x rhs body -> indented ("let " ++ show x ++ " =") (onTail (++ " in") (pretty rhs)) ++ pretty body

prettyArm :: Arm -> Lines
prettyArm = \case
  ArmTag c xs rhs -> do
    indented ("| " ++ prettyPat c xs ++ " ->") (pretty rhs)

prettyPat :: Ctag -> [Id] -> String
prettyPat tag = \case
  [] -> show tag
  xs -> printf "%s(%s)" (show tag) (intercalate "," (map show xs))

trans :: SRC.Exp -> M Code
trans = \case
  SRC.Var p x -> do
    pure $ Var p x
  SRC.Lit x -> do
    pure $ Lit x
  SRC.ConTag tag es -> do
    transIds es $ \xs ->
      pure $ ConTag tag xs
  SRC.Prim b es -> do
    transIds es $ \xs ->
      pure $ Prim b xs
  SRC.Lam x body -> Lam x <$> trans body
  SRC.RecLam f x body -> RecLam f x <$> trans body
  SRC.App e1 p e2 -> do
    transId e1 $ \x1 -> do
      transId e2 $ \x2 -> do
        pure $ App x1 p x2
  SRC.Case scrut arms -> do
    transId scrut $ \scrut -> do
      arms <- mapM transArm arms
      pure $ Case scrut arms
  SRC.Let x rhs body -> do
    rhs <- trans rhs
    body <- trans body
    pure $ Let x rhs body

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
    Let u code <$> k u

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
      Fresh tag -> k (u+1) (SRC.Id (printf "%s%d" tag u))


evalCode0 :: Code -> Interaction
evalCode0 exp =
  evalCode env0 exp $ \v ->
  IDebug (printf "Final value: %s\n" (show v))
  $ IDone

evalCode :: Env -> Code -> (Value -> Interaction) -> Interaction
evalCode env@Env{venv} = \case
  Var _pos x -> \k -> k (look x)
  Lit literal -> \k -> k (SRC.evalLit literal)
  ConTag (SRC.Ctag tag) xs -> \k -> k (VCons tag (map look xs))
  Prim b xs -> \k -> do evalBuiltin b (map look xs) k
  Lam x body -> \k -> do
    k (VFunc (\arg k -> evalCode env { venv = Map.insert x arg venv } body k))
  RecLam f x body -> \k -> do
    let me = VFunc (\arg k -> evalCode env { venv = Map.insert f me (Map.insert x arg venv) } body k)
    k me
  App x1 pos x2 -> \k -> SRC.apply (look x1) pos (look x2) k
  Let x c1 c2 -> \k -> do
    evalCode env c1 $ \v1 -> do
      evalCode env { venv = Map.insert x v1 venv } c2 k
  Case scrut arms0 -> \k -> do
    case (look scrut) of
      VCons tagActual vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] -> error "case match failure"
            ArmTag (SRC.Ctag tag) xs body : arms -> do
              if tag /= tagActual then dispatch arms else do
                if length xs /= length vArgs then error (show ("case arm mismatch",xs,vArgs)) else do
                  let env' = env { venv = foldr (uncurry Map.insert) venv (zip xs vArgs) }
                  evalCode env' body k
        dispatch arms0
      v ->
        error (printf "case/scrut not a constructed value: %s" (show v))
  where
    look :: Id -> Value
    look x = do
      maybe err id $ Map.lookup x venv
        where err = error (show ("var-lookup",x))

data Env = Env { venv :: Map Id Value }

env0 :: Env
env0 = Env { venv = Map.empty }
