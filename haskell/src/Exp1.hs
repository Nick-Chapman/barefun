module Exp1 (Exp(..),Arm(..),Literal(..),Id(..),Cid(..)) where

import Data.List (intercalate)
import Text.Printf (printf)

data Exp
  = Var Id
  | Con Cid [Exp]
  | Lit Literal
  | App Exp Exp
  | Lam Id Exp
  | Let Id Exp Exp
  | Prim Builtin [Exp]
  | Case Exp [Arm]

data Arm = Arm Cid [Id] Exp

data Literal = LitC Char

data Builtin -- = PutChar | GetChar | EqChar -- TODO

newtype Id = Id String
newtype Cid = Cid String

instance Show Exp where show = intercalate "\n" . pretty
instance Show Cid where show (Cid s) = s
instance Show Id where show (Id s) = s
instance Show Literal where show = \case LitC c -> show c

{- TODO
example should use constructor syntax for Nil/Cons
"rec", parse and pp
unit, parse as constructor, and special case PP
-}

pretty :: Exp -> Lines
pretty = \case

  Let x rhs body ->
    indented ("let " ++ show x ++ " =") (onTail (++ " in") (pretty rhs))
    ++ pretty body

  Lam x body ->
    bracket $
    indented ("fun " ++ show x ++ " ->") (pretty body)

  App e1 e2 ->
    bracket $
    jux (pretty e1) (pretty e2)

  Var x -> [show x]

  Con c [] ->
    [show c]

  Con c es ->
    undefined $ onHead (show c ++) (foldl juxComma [] (map pretty es)) -- TODO

  Lit x ->
    [show x]

  Case scrut arms ->
    (onHead ("match "++) . onTail (++ " with")) (pretty scrut)
    ++ concat (map prettyArm arms)

  Prim b es ->
    undefined b es -- TODO


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

onHead,onTail :: (String -> String) -> Lines -> Lines
onHead _ [] = error "onHead"
onHead f (x:xs) = f x : xs
onTail f = reverse . onHead f . reverse

jux :: Lines -> Lines -> Lines
jux [x] [y] = [ x ++ " " ++ y ]
jux xs ys = xs ++ ys

indented :: String -> Lines -> Lines
indented hang = \case
  [] -> error "indented"
  [oneLine] -> [hang ++ " " ++ oneLine]
  lines -> [hang] ++ ["  " ++ line | line <- lines]


