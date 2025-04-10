module Value
  ( tUnit, tFalse, tTrue, tNil, tCons
  , Value(..), Number --(..)
  , mkBool,mkList,deUnit
  ) where

import Interaction (Interaction)
import Text.Printf (printf)

newtype Number = Number Int deriving (Eq,Ord,Num,Integral,Real,Enum)

data Value
  = VCons Number [Value] -- TODO: should define and use Ctag here
  | VString String
  | VChar Char
  | VNum Number
  | VFunc (Value -> (Value -> Interaction) -> Interaction)

instance Show Number where show (Number n) = show n

instance Show Value where
  show = \case
    VCons tag vs -> printf "[construct:%s:%s]" (show tag) (show vs)
    VString s -> printf"[string:%s]" (show s)
    VChar c -> printf"[char:%s]" (show c)
    VNum n -> printf"[number:%s]" (show n)
    VFunc{} -> "[function]"

-- These tag values only need to be unique within their type
tUnit,tFalse,tTrue,tNil,tCons :: Number
tUnit = 0
tFalse = 0
tTrue = 1
tNil = 0
tCons = 1

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
deUnit = \case VCons tag [] | tag == tUnit -> (); _ -> error "deUnit"
