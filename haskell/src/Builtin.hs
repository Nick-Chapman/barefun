module Builtin ( Builtin(..), executeBuiltin, isPure, evaluatePureBuiltin ) where

import Interaction (Interaction(..))
import Value (Value(..),tUnit,mkBool,deUnit)
import qualified Data.Char as Char (chr,ord)
import Text.Printf (printf)

data Builtin
  = PutChar | GetChar
  | AddInt | SubInt | MulInt | DivInt | ModInt | LessInt | EqInt
  | EqChar | CharOrd | CharChr
  | StringLength | StringIndex
  | MakeBytes | FreezeBytes | SetBytes
  deriving (Show)

data Semantics
  = Pure ([Value] -> Value)
  | Impure ([Value] -> (Value -> Interaction) -> Interaction)

isPure :: Builtin -> Bool
isPure b =
  case defineBuiltin b of
    Pure{} -> True
    Impure{} -> False

evaluatePureBuiltin :: Builtin -> [Value] -> Value
evaluatePureBuiltin b args =
  case defineBuiltin b of
    Impure{} -> error "evaluatePureBuiltin/Impure"
    Pure f -> f args

executeBuiltin :: Builtin -> [Value] -> (Value -> Interaction) -> Interaction
executeBuiltin b args =
  case defineBuiltin b of
    Impure f -> f args
    Pure f -> \k -> k (f args)

defineBuiltin :: Builtin -> Semantics
defineBuiltin b =
  case b of
    PutChar -> Impure $ \vs k -> IPut (deChar (oneArg vs)) (k unit)
    GetChar -> Impure $ \vs k -> case deUnit (oneArg vs) of () -> IGet (\c -> k (VChar c))
    AddInt -> Pure (\vs -> VNum (uncurry (+) (twoArgs deNum deNum vs)))
    SubInt -> Pure (\vs -> VNum (uncurry (-) (twoArgs deNum deNum vs)))
    MulInt -> Pure (\vs -> VNum (uncurry (*) (twoArgs deNum deNum vs)))
    DivInt -> Pure (\vs -> VNum (uncurry div (twoArgs deNum deNum vs)))
    ModInt -> Pure (\vs -> VNum (uncurry mod (twoArgs deNum deNum vs)))
    LessInt -> Pure (\vs -> mkBool (uncurry (<) (twoArgs deNum deNum vs)))
    EqInt -> Pure (\vs -> mkBool (uncurry (==) (twoArgs deNum deNum vs)))
    EqChar -> Pure (\vs -> mkBool (uncurry (==) (twoArgs deChar deChar vs)))
    CharOrd -> Pure (\vs -> VNum ((fromIntegral . Char.ord) (deChar (oneArg vs))))
    CharChr -> Pure (\vs -> VChar ((Char.chr . fromIntegral) (deNum (oneArg vs))))
    StringLength -> Pure (\vs -> VNum (fromIntegral $ length (deString (oneArg vs))))
    StringIndex -> Pure (\vs -> VChar ((\(s,i) -> s!!(fromIntegral i)) $ (twoArgs deString deNum vs)))
    MakeBytes -> Impure $ \vs k -> IMakeBytes (fromIntegral $ deNum (oneArg vs)) (\b -> k (VBytes b))
    FreezeBytes -> Impure $ \vs k -> IFreezeBytes (deBytes (oneArg vs)) (\s -> k (VString s))
    SetBytes -> Impure $ \vs k -> do
      let (b,n,c) = threeArgs deBytes deNum deChar vs
      ISetBytes b (fromIntegral n) c (k unit)
  where
    unit = VCons tUnit []
    oneArg = \case [v] -> v; _ -> err
    twoArgs c1 c2 = \case [v1,v2] -> (c1 v1, c2 v2); _ -> err
    threeArgs c1 c2 c3 = \case [v1,v2,v3] -> (c1 v1, c2 v2, c3 v3); _ -> err
    deNum = \case VNum n -> n; _ -> err
    deChar = \case VChar c -> c; _ -> err
    deBytes = \case VBytes b -> b; _ -> err
    deString = \case VString s -> s; _ -> err
    err :: a
    err = error (printf "Builtin.hs: error: %s" (show b))
