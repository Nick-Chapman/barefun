module Transform2 (compile, execute) where

import Builtin (Builtin)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Interaction (Interaction(..))
import Lines (Lines,bracket,onHead,onTail,indented)
import Par4 (Position(..))
import Text.Printf (printf)
import qualified Transform1 as SRC

type Transformed = Code

compile :: SRC.Exp -> Transformed
compile e = runM (trans e)

execute :: Transformed -> Interaction
execute = undefined

data Code
  = Var (Maybe Position) Id
  | Lit Literal
  | ConTag Ctag [Id]
  | Prim Builtin [Id]
  | Lam Id Code
  | RecLam Id Id Code
  | Case Id [Arm]
  | App Id Position Id
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
  Case scrut arms -> (onHead ("match "++) . onTail (++ " with")) [show scrut] ++ concat (map prettyArm arms)
  App x1 _ x2 -> [printf "%s %s" (show x1) (show x2)]
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
  SRC.Lam x body -> do
    body <- trans body  -- TODO: reset K
    pure $ Lam x body
  SRC.RecLam f x body -> do
    body <- trans body  -- TODO: reset K
    pure $ RecLam f x body
  SRC.Case scrut arms -> do
    transId scrut $ \scrut -> do
      arms <- mapM transArm arms -- TODO: reset K
      pure $ Case scrut arms
  SRC.App e1 p e2 -> do
    transId e1 $ \x1 -> do
      transId e2 $ \x2 -> do
        pure $ App x1 p x2
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
