module Value
  ( tUnit, tFalse, tTrue, tNil, tCons
  , Value(..)
  , mkBool,mkList,deUnit
  ) where

import Data.Word (Word16)
import Interaction (Interaction)
import Text.Printf (printf)

data Value
  = VCons Word16 [Value] -- TODO: should define and use Ctag here
  | VString String
  | VChar Char
  | VNum Word16
  | VFunc (Value -> (Value -> Interaction) -> Interaction)

instance Show Value where
  show = \case
    VCons tag vs -> printf "[construct:%d:%s]" tag (show vs)
    VString s -> printf"[string:%s]" (show s)
    VChar c -> printf"[char:%s]" (show c)
    VNum n -> printf"[number:%s]" (show n)
    VFunc{} -> "[function]"

-- These tag values only need to be unique within their type
tUnit,tFalse,tTrue,tNil,tCons :: Word16
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
