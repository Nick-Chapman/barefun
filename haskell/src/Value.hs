module Value
  ( tUnit, tFalse, tTrue, tNil, tCons
  , Value(..)
  , mkList
  ) where

import Data.Word (Word16)
import Interaction (Interaction)
import Text.Printf (printf)

data Value
  = VCons Int [Value]
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
tUnit,tFalse,tTrue,tNil,tCons :: Int
tUnit = 10
tFalse = 20
tTrue = 21
tNil = 30
tCons = 31

vNil :: Value
vNil = VCons tNil []

mkList :: [Value] -> Value
mkList = \case
  [] -> vNil
  v:vs -> VCons tCons [v, mkList vs]
