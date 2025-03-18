module Exp0
  ( Prog(..),Def(..),Exp(..),Arm(..),Literal(..),Id(..),Cid(..)
  ) where

import Builtin (Builtin)
import Data.List (intercalate)
import Data.Word (Word16)
import Lines (Lines,juxComma,bracket,onHead,onTail,jux,indented)
import Par4 (Position)
import Text.Printf (printf)

data Prog = Prog [Def]
data Def = ValDef Id Exp | TypeDef [Cid]

data Exp
  = Var (Maybe Position) Id
  | Con Cid [Exp]
  | Lit Literal
  | App Exp Position Exp
  | Lam Id Exp
  | RecLam Id Id Exp
  | Let Id Exp Exp
  | Prim Builtin [Exp]
  | Case Exp [Arm]

data Arm = Arm Cid [Id] Exp

data Literal = LitC Char | LitN Word16 | LitS String

newtype Id = Id String
  deriving (Eq,Ord)

newtype Cid = Cid String
  deriving (Eq,Ord)


instance Show Prog where show (Prog defs) = intercalate "\n" (map show defs)
instance Show Def where show = intercalate "\n" . prettyDef
instance Show Exp where show = intercalate "\n" . pretty
instance Show Id where show (Id s) = s
instance Show Cid where show (Cid s) = s
instance Show Literal where
  show = \case
    LitC c -> show c
    LitN n -> show n
    LitS s -> show s

prettyDef :: Def -> Lines
prettyDef = \case
  ValDef x rhs -> indented ("let " ++ show x ++ " =") (onTail (++ " in") (pretty rhs))
  TypeDef cids -> ["type _ = " ++ intercalate " | " (map show cids)]

pretty :: Exp -> Lines
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

  Con c [] ->
    [show c]

  Con c es ->
    onHead (show c ++) (bracket (foldl1 juxComma (map pretty es)))

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
