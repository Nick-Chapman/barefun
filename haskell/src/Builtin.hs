module Builtin ( Builtin(..), evalBuiltin ) where

import Interaction (Interaction(..))
import Value (Value(..),tUnit,mkBool,mkList,deUnit)
import qualified Data.Char as Char (chr,ord)

data Builtin
  = PutChar | GetChar
  | AddInt | SubInt | MulInt | DivInt | ModInt | LessInt | EqInt
  | EqChar | CharOrd | CharChr
  | Explode
  deriving (Show)

evalBuiltin :: Builtin -> [Value] -> (Value -> Interaction) -> Interaction
evalBuiltin b vs k = do
  let
    unit = VCons tUnit []
    oneArg = \case [v] -> v; _ -> err
    twoArgs c1 c2 = \case [v1,v2] -> (c1 v1, c2 v2); _ -> err
    deNum = \case VNum n -> n; _ -> err
    deChar = \case VChar c -> c; _ -> err
    deString = \case VString s -> s; _ -> err
    err :: a
    err = error (show (b,vs))

  case b of
    PutChar -> IPut (deChar (oneArg vs)) (k unit)
    GetChar -> case deUnit (oneArg vs) of () -> IGet (\c -> k (VChar c))
    AddInt -> k (VNum (uncurry (+) (twoArgs deNum deNum vs)))
    SubInt -> k (VNum (uncurry (-) (twoArgs deNum deNum vs)))
    MulInt -> k (VNum (uncurry (*) (twoArgs deNum deNum vs)))
    DivInt -> k (VNum (uncurry div (twoArgs deNum deNum vs)))
    ModInt -> k (VNum (uncurry mod (twoArgs deNum deNum vs)))
    LessInt -> k (mkBool (uncurry (<) (twoArgs deNum deNum vs)))
    EqInt -> k (mkBool (uncurry (==) (twoArgs deNum deNum vs)))
    EqChar -> k (mkBool (uncurry (==) (twoArgs deChar deChar vs)))
    CharOrd -> k (VNum ((fromIntegral . Char.ord) (deChar (oneArg vs))))
    CharChr -> k (VChar ((Char.chr . fromIntegral) (deNum (oneArg vs))))
    Explode -> k (mkList [ VChar c | c <- deString (oneArg vs) ])
