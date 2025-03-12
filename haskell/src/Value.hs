module Value ( Cid(..), Value(..)) where

import Interaction (Interaction)
import Text.Printf (printf)

newtype Cid = Cid String
  deriving (Eq,Ord)

instance Show Cid where show (Cid s) = s


data Value
  = VCons Cid [Value] -- TODO: use integer tags here
  | VChar Char
  | VFunc (Value -> (Value -> Interaction) -> Interaction)

instance Show Value where
  show = \case
    VCons c vs -> printf "[vcons:%s:%s]" (show c) (show vs)
    VChar c -> printf"[char:%s]" (show c)
    VFunc{} -> "[function]"
