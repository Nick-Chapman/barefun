module Value ( Cid(..), Value(..)) where

import Data.Word (Word16)
import Interaction (Interaction)
import Text.Printf (printf)

newtype Cid = Cid String
  deriving (Eq,Ord)

instance Show Cid where show (Cid s) = s

data Value
  = VCons Cid [Value] -- TODO: use integer tags here
  | VChar Char
  | VNum Word16
  | VFunc (Value -> (Value -> Interaction) -> Interaction)

instance Show Value where
  show = \case
    VCons c vs -> printf "[construct:%s:%s]" (show c) (show vs)
    VChar c -> printf"[char:%s]" (show c)
    VNum n -> printf"[number:%s]" (show n)
    VFunc{} -> "[function]"
