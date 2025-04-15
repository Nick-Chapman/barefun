module Value
  ( tUnit, tFalse, tTrue, tNil, tCons, cUnit, cFalse, cTrue, cNil, cCons
  , Value(..), Number, Ctag(..), Cid(..)
  , mkBool,mkList,deUnit
  ) where

import Interaction (Interaction,Bytes)
import Text.Printf (printf)

newtype Number = Number Int deriving (Eq,Ord,Num,Integral,Real,Enum)

data Value
  = VCons Ctag [Value]
  | VBytes Bytes
  | VString String
  | VChar Char
  | VNum Number
  | VFunc (Value -> (Value -> Interaction) -> Interaction)

data Ctag = Ctag Cid Number deriving (Eq)
data Cid = Cid String deriving (Eq,Ord)

instance Show Number where show (Number n) = show n

instance Show Value where
  show = \case
    VCons tag vs -> printf "[construct:%s:%s]" (show tag) (show vs)
    VBytes b -> printf"[bytes:%s]" (show b)
    VString s -> printf"[string:%s]" (show s)
    VChar c -> printf"[char:%s]" (show c)
    VNum n -> printf"[number:%s]" (show n)
    VFunc{} -> "[function]"

instance Show Ctag where show (Ctag cid n) = printf "%s%s" (show cid) (show n)
instance Show Cid where show (Cid s) = s

cUnit,cFalse,cTrue,cNil,cCons :: Cid
cUnit = Cid "Unit"
cTrue = Cid "true"
cFalse = Cid "false"
cNil = Cid "Nil"
cCons = Cid "Cons"

tUnit,tFalse,tTrue,tNil,tCons :: Ctag
tUnit = Ctag cUnit 0
tFalse = Ctag cFalse 0
tTrue = Ctag cTrue 1
tNil = Ctag cNil 0
tCons = Ctag cCons 1

mkBool :: Bool -> Value
mkBool = \case
  False -> false
  True -> true
  where
    false = VCons tFalse []
    true = VCons tTrue []

vNil :: Value
vNil = VCons tNil []

mkList :: [Value] -> Value
mkList = \case
  [] -> vNil
  v:vs -> VCons tCons [v, mkList vs]

deUnit :: Value -> ()
deUnit =
  \case VCons (Ctag _ tag) [] | tag == n -> (); _ -> error "deUnit"
  where Ctag _ n = tUnit
