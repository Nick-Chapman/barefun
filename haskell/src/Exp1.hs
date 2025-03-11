module Exp1 (Exp(..),Arm(..),Literal(..),Builtin(..),Id(..),Cid(..)) where

import Data.List (intercalate)
import Text.Printf (printf)
import Par4 (Position)

data Exp -- TODO: recursive bindings
  = Var (Maybe Position) Id
  | Con Cid [Exp]
  | Lit Literal
  | App Exp Position Exp
  | Lam Id Exp
  | Let Id Exp Exp
  | Prim Builtin [Id]
  | Case Exp [Arm]

data Arm = Arm Cid [Id] Exp

data Literal = LitC Char

data Builtin = PutChar | GetChar | EqChar
  deriving (Show)

newtype Id = Id String
  deriving (Eq,Ord)

newtype Cid = Cid String
  deriving (Eq,Ord)

instance Show Exp where show = intercalate "\n" . pretty
instance Show Cid where show (Cid s) = s
instance Show Id where show (Id s) = s
instance Show Literal where show = \case LitC c -> show c


pretty :: Exp -> Lines
pretty = \case

  Let x rhs body ->
    indented ("let " ++ show x ++ " =") (onTail (++ " in") (pretty rhs))
    ++ pretty body

  Lam x body ->
    bracket $
    indented ("fun " ++ show x ++ " ->") (pretty body)

  App e1 _ e2 ->
    bracket $
    jux (pretty e1) (pretty e2)

  Var _ x -> [show x]

  Con c [] ->
    [show c]

  Con c es ->
    onHead (show c ++) (foldl1 juxComma (map pretty es))

  Lit x ->
    [show x]

  Case scrut arms ->
    (onHead ("match "++) . onTail (++ " with")) (pretty scrut)
    ++ concat (map prettyArm arms)

  Prim b xs -> do
    [printf "PRIM:%s%s" (show b) (show xs)]


prettyArm :: Arm -> Lines
prettyArm = \case
  Arm c xs rhs -> do
    indented ("| " ++ prettyPat c xs ++ " ->") (pretty rhs)

prettyPat :: Cid -> [Id] -> String
prettyPat c = \case
  [] -> show c
  xs -> printf "%s(%s)" (show c) (intercalate "," (map show xs))

juxComma :: Lines -> Lines -> Lines
juxComma a b = jux (onTail (++",") a) b

type Lines = [String]

bracket :: Lines -> Lines
bracket = onHead ("(" ++) . onTail (++ ")")

onHead :: (String -> String) -> Lines -> Lines
onHead _ [] = error "onHead"
onHead f (x:xs) = f x : xs

onTail :: (String -> String) -> Lines -> Lines
onTail _ [] = error "onTail"
onTail f xs = (reverse . onHead f . reverse) xs


jux :: Lines -> Lines -> Lines
jux [x] [y] = [ x ++ " " ++ y ]
jux xs ys = xs ++ ys

indented :: String -> Lines -> Lines
indented hang = \case
  [] -> error "indented"
  [oneLine] -> [hang ++ " " ++ oneLine]
  lines -> [hang] ++ ["  " ++ line | line <- lines]
