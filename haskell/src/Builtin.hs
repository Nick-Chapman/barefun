module Builtin ( Builtin(..), executeBuiltin, isPure, evaluatePureBuiltin ) where

import Text.Printf (printf)
import Value (Value(..),tUnit,mkBool,deUnit,Interaction(..))
import qualified Data.Char as Char (chr,ord)

data Builtin
  = Crash
  | PutChar | GetChar
  | AddInt | SubInt | MulInt | DivInt | ModInt | LessInt | EqInt
  | EqChar | CharOrd | CharChr
  | MakeRef | DeRef | SetRef
  | StringLength | StringIndex
  | MakeBytes | SetBytes | GetBytes
  | FreezeBytes | ThawBytes
  | LoadSec | StoreSec
  | FreeWords

  | Wait_a_tick
  | Is_keyboard_ready
  | Get_keyboard_last_scancode
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

    MakeBytes -> Impure $ \vs k -> IMakeBytes (fromIntegral $ deNum (oneArg vs)) (\b -> k (VBytes b))
    SetBytes -> Impure $ \vs k -> do
      let (b,n,c) = threeArgs deBytes deNum deChar vs
      ISetBytes b (fromIntegral n) c (k unit)
    GetBytes -> Impure $ \vs k -> do
      let (b,n) = twoArgs deBytes deNum vs
      IGetBytes b (fromIntegral n) $ \c -> k (VChar c)

    FreezeBytes -> Impure $ \vs k -> IFreezeBytes (deBytes (oneArg vs)) (\s -> k (VString s))
    ThawBytes -> Impure $ \vs k -> IThawBytes (deString (oneArg vs)) (\b -> k (VBytes b))

    StringLength -> Pure (\vs -> VNum (fromIntegral $ length (deString (oneArg vs))))
    StringIndex -> Pure (\vs -> VChar ((\(s,i) -> s!!(fromIntegral i)) $ (twoArgs deString deNum vs)))

    MakeRef -> Impure $ \vs k -> IMakeRef (oneArg vs) $ \r -> k (VRef r)
    DeRef -> Impure $ \vs k -> IDeRef (deRef (oneArg vs)) k
    SetRef -> Impure $ \vs k -> do
      let (r,v) = twoArgs deRef id vs
      ISetRef r v (k unit)

    Crash -> Impure $ undefined
    LoadSec -> Impure $ undefined -- TODO: emulate
    StoreSec -> Impure $ undefined -- TODO: emulate
    FreeWords -> Impure $ \vs k -> case deUnit (oneArg vs) of () -> k (VNum 0)

    Wait_a_tick -> Impure $ undefined -- TODO: emulate
    Is_keyboard_ready -> Impure $ undefined -- TODO: emulate
    Get_keyboard_last_scancode -> Impure $ undefined -- TODO: emulate

  where
    unit = VCons tUnit []
    oneArg = \case [v] -> v; _ -> err
    twoArgs c1 c2 = \case [v1,v2] -> (c1 v1, c2 v2); _ -> err
    threeArgs c1 c2 c3 = \case [v1,v2,v3] -> (c1 v1, c2 v2, c3 v3); _ -> err
    deNum = \case VNum x -> x; _ -> err
    deChar = \case VChar x -> x; _ -> err
    deBytes = \case VBytes x -> x; _ -> err
    deString = \case VString x -> x; _ -> err
    deRef = \case VRef x -> x; _ -> err
    err :: a
    err = error (printf "Builtin.hs: error: %s" (show b))
