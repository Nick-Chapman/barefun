module Value
  ( Cid(..), cUnit, cTrue, cFalse --, cNil, cCons
  , tUnit, tFalse, tTrue
  , Value(..), initCenv
  ) where

import Data.Word (Word16)
import Interaction (Interaction)
import Text.Printf (printf)

import Data.Map (Map)
import qualified Data.Map as Map

newtype Cid = Cid String
  deriving (Eq,Ord)

instance Show Cid where show (Cid s) = s

data Value
  = VCons Int [Value]
  | VChar Char
  | VNum Word16
  | VFunc (Value -> (Value -> Interaction) -> Interaction)

instance Show Value where
  show = \case
    VCons tag vs -> printf "[construct:%d:%s]" tag (show vs)
    VChar c -> printf"[char:%s]" (show c)
    VNum n -> printf"[number:%s]" (show n)
    VFunc{} -> "[function]"

cUnit,cFalse,cTrue,cNil,cCons :: Cid
cUnit = Cid "Unit"
cTrue = Cid "true"
cFalse = Cid "false"
cNil = Cid "Nil"
cCons = Cid "Cons"

-- These tag values only need to be unique within their type
tUnit,tFalse,tTrue,tNil,tCons :: Int
tUnit = 10
tFalse = 20
tTrue = 21
tNil = 30
tCons = 31

initCenv :: Map Cid Int
initCenv = Map.fromList
  [ (cUnit, tUnit)
  , (cNil, tNil)
  , (cCons, tCons)
  , (cFalse, tFalse)
  , (cTrue, tTrue)
  ]
