module Transform2 (compile, execute) where

import Builtin (Builtin)
import Data.List (intercalate)
import Interaction (Interaction(..))
import Lines (Lines,juxComma,bracket,onHead,onTail,jux,indented)
import Par4 (Position(..))
import Text.Printf (printf)
import qualified Transform1 as SRC

type Transformed = Code

compile :: SRC.Exp -> Transformed
compile = transExp

execute :: Transformed -> Interaction
execute = undefined

data Code
  = Var (Maybe Position) Id
  | ConTag Ctag [Code]
  | Lit Literal
  | App Code Position Code
  | Lam Id Code
  | RecLam Id Id Code
  | Let Id Code Code
  | Prim Builtin [Code]
  | Case Code [Arm]

data Arm = ArmTag Ctag [Id] Code

type Ctag = SRC.Ctag
type Literal = SRC.Literal
type Id = SRC.Id

instance Show Code where show = intercalate "\n" . pretty

pretty :: Code -> Lines
pretty = \case
  Let x rhs body ->
    indented ("let " ++ show x ++ " =") (onTail (++ " in") (pretty rhs))
    ++ pretty body
  Lam x body ->
    bracket $
    indented ("fun " ++ show x ++ " ->") (pretty body)
  RecLam f x body ->
    bracket $
    indented ("rec-fun " ++ show f ++ " " ++ show x ++ " ->") (pretty body)
  App e1 _ e2 ->
    bracket $
    jux (pretty e1) (pretty e2)
  Var _ x -> [show x]
  ConTag tag [] ->
    [show tag]
  ConTag tag es ->
    onHead (show tag ++) (bracket (foldl1 juxComma (map pretty es)))
  Lit x ->
    [show x]
  Case scrut arms ->
    (onHead ("match "++) . onTail (++ " with")) (pretty scrut)
    ++ concat (map prettyArm arms)
  Prim b xs -> do
    [printf "PRIM:%s%s" (show b) (show xs)]

prettyArm :: Arm -> Lines
prettyArm = \case
  ArmTag c xs rhs -> do
    indented ("| " ++ prettyPat c xs ++ " ->") (pretty rhs)

prettyPat :: Ctag -> [Id] -> String
prettyPat tag = \case
  [] -> show tag
  xs -> printf "%s(%s)" (show tag) (intercalate "," (map show xs))


transExp :: SRC.Exp -> Code
transExp = trans

trans :: SRC.Exp -> Code
trans = \case
  SRC.Let x rhs body -> Let x (trans rhs) (trans body)
  SRC.Lam x body -> Lam x (trans body)
  SRC.RecLam f x body -> RecLam f x (trans body)
  SRC.App e1 p e2 -> App (trans e1) p (trans e2)
  SRC.Var p x -> Var p x
  SRC.ConTag tag es -> ConTag tag (map trans es)
  SRC.Lit x -> Lit x
  SRC.Case scrut arms -> Case (trans scrut) (map transArm arms)
  SRC.Prim b xs -> Prim b (map trans xs)

transArm :: SRC.Arm -> Arm
transArm (SRC.ArmTag tag xs e) = ArmTag tag xs (trans e)
