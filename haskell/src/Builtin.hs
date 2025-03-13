module Builtin ( Builtin(..), evalBuiltin ) where

import Interaction (Interaction(..))
import Value (Value(..),Cid(..))
import qualified Data.Char as Char (chr,ord)

data Builtin = PutChar | GetChar | EqChar | LessInt | EqInt | AddInt | DivInt | ModInt | CharOrd | CharChr
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
        (VChar x1,VChar x2) -> do
          let b = (x1 == x2)
          let vTrue = VCons (Cid "True") []
          let vFalse = VCons (Cid "False") []
          let res = if b then vTrue else vFalse
          k res
        _ ->
          error (show ("EqChar/expected char/char",v1,v2))

    (EqInt, [v1,v2]) -> do
      case (v1,v2) of
        (VNum x1,VNum x2) -> do
          let b = (x1 == x2)
          let vTrue = VCons (Cid "True") []
          let vFalse = VCons (Cid "False") []
          let res = if b then vTrue else vFalse
          k res
        _ ->
          error (show ("EqInt/expected num/num",v1,v2))

    (LessInt, [v1,v2]) -> do
      case (v1,v2) of
        (VNum x1,VNum x2) -> do
          let b = (x1 < x2)
          let vTrue = VCons (Cid "True") []
          let vFalse = VCons (Cid "False") []
          let res = if b then vTrue else vFalse
          k res
        _ ->
          error (show ("LessInt/expected num/num",v1,v2))

    (AddInt, [v1,v2]) -> do
      case (v1,v2) of
        (VNum x1,VNum x2) -> do
          let res = VNum (x1 + x2)
          k res
        _ ->
          error (show ("AddInt/expected num/num",v1,v2))

    (DivInt, [v1,v2]) -> do
      case (v1,v2) of
        (VNum x1,VNum x2) -> do
          let res = VNum (x1 `div` x2)
          k res
        _ ->
          error (show ("DivInt/expected num/num",v1,v2))

    (ModInt, [v1,v2]) -> do
      case (v1,v2) of
        (VNum x1,VNum x2) -> do
          let res = VNum (x1 `mod` x2)
          k res
        _ ->
          error (show ("ModInt/expected num/num",v1,v2))

    (CharOrd, [v]) -> do
      case v of
        VChar c -> do
          let res = VNum (fromIntegral $ Char.ord c)
          k res
        _ ->
          error (show ("CharOrd/expected char",v))

    (CharChr, [v]) -> do
      case v of
        VNum n -> do
          let res = VChar (Char.chr (fromIntegral n))
          k res
        _ ->
          error (show ("CharChr/expected num",v))

    _ -> do
      error (show ("builtin/unsupported",b,length vs))

mkVUnit :: Value -- TODO move to Value?
mkVUnit = VCons (Cid "Unit") []
