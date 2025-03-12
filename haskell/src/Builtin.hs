module Builtin ( Builtin(..), evalBuiltin ) where

import Value (Value(..),Cid(..))
import Interaction (Interaction(..))

data Builtin = PutChar | GetChar | EqChar
  deriving (Show)

evalBuiltin :: Builtin -> [Value] -> (Value -> Interaction) -> Interaction
evalBuiltin b vs k =
  case (b,vs) of
    (PutChar, [v]) -> do
      case v of
        VChar c -> IPut c (k mkVUnit)
        _ -> error "PutChar/expected char"

    (GetChar,[v]) -> do
      case v of
        VCons (Cid "Unit") [] -> IGet (\c -> k (VChar c))
        v -> error (show ("GetChar/expected unit",v))

    (EqChar, [v1,v2]) -> do
      case (v1,v2) of
        (VChar c1,VChar c2) -> do
          let b = (c1 == c2)
          let vTrue = VCons (Cid "True") []
          let vFalse = VCons (Cid "False") []
          let v = if b then vTrue else vFalse
          k v
        _ ->
          error (show ("GetChar/expected char/char",v1,v2))
    _ -> do
      error (show ("builtin/unsupported",b,length vs))

mkVUnit :: Value -- TODO move to Value?
mkVUnit = VCons (Cid "Unit") []
