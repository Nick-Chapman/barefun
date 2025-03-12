module Value
  ( Value(..)
  ) where

import Exp1 (Cid)
import Interaction (Interaction)
import Text.Printf (printf)

data Value
  = VCons Cid [Value] -- TODO: use integer tags here
  | VChar Char
  | VFunc (Value -> (Value -> Interaction) -> Interaction)

instance Show Value where
  show = \case
    VCons c vs -> printf "[vcons:%s:%s]" (show c) (show vs)
    VChar c -> printf"[char:%s]" (show c)
    VFunc{} -> "[function]"
