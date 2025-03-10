module Exp1 where

data Exp
  = Var Id
  | Con Cid [Exp]
  | Lit Literal
  | App Exp Exp
  | Lam Id Exp
  | Let Id Exp Exp
  | Prim Builtin [Exp]
  | Case Exp [Arm]
  deriving (Show)

data Arm = Arm Cid [Id] Exp
  deriving (Show)

data Literal = LitC Char
  deriving (Show)

data Builtin = PutChar | GetChar | EqChar
  deriving (Show)

newtype Id = Id String
  deriving (Show)

newtype Cid = Cid String
  deriving (Show)

-- TODO: pretty printer
