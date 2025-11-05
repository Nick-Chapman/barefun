module Primitive ( Primitive(..), executePrimitive, isPure, evaluatePurePrimitive ) where

import Text.Printf (printf)
import Value (Value(..),tUnit,tTrue,mkBool,deUnit,Interaction(..))
import qualified Data.Char as Char (chr,ord)

data Primitive
  = Crash
  | Noinline
  | IsComptimeKnown
  | PutChar | GetChar
  | AddInt | SubInt | MulInt | DivInt | ModInt | LessInt | EqInt
  | EqChar | CharOrd | CharChr
  | MakeRef | DeRef | SetRef
  | StringLength | StringIndex
  | MakeBytes | SetBytes | GetBytes
  | FreezeBytes | ThawBytes
  | LoadSec | StoreSec
  | FreeWords
  | Get_ticks
  | Init_interrupt_mode
  | Wait_for_interrupt -- wrapper for x86 "hlt" opcode
  | Is_keyboard_ready
  | Get_keyboard_last_scancode

  deriving (Show)

data Semantics
  = Pure ([Value] -> Value)
  | Impure ([Value] -> (Value -> Interaction) -> Interaction)

isPure :: Primitive -> Bool
isPure b =
  case definePrimitive b of
    Pure{} -> True
    Impure{} -> False

evaluatePurePrimitive :: Primitive -> [Value] -> Value
evaluatePurePrimitive b args =
  case definePrimitive b of
    Impure{} -> error "evaluatePurePrimitive/Impure"
    Pure f -> f args

executePrimitive :: Primitive -> [Value] -> (Value -> Interaction) -> Interaction
executePrimitive b args =
  case definePrimitive b of
    Impure f -> f args
    Pure f -> \k -> k (f args)

definePrimitive :: Primitive -> Semantics
definePrimitive b =
  case b of
    Noinline -> Impure $ \vs k -> k (oneArg vs)
    IsComptimeKnown -> Pure (\_ -> mkBool False)
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
    CharChr -> Pure (\vs -> VChar ((Char.chr . (`mod` 256) . fromIntegral) (deNum (oneArg vs))))

    MakeBytes -> Impure $ \vs k -> IMakeBytes (deNum (oneArg vs)) (\b -> k (VBytes b))
    SetBytes -> Impure $ \vs k -> do
      let (b,n,c) = threeArgs deBytes deNum deChar vs
      ISetBytes b n c (k unit)
    GetBytes -> Impure $ \vs k -> do
      let (b,n) = twoArgs deBytes deNum vs
      IGetBytes b n $ \c -> k (VChar c)

    FreezeBytes -> Impure $ \vs k -> IFreezeBytes (deBytes (oneArg vs)) (\s -> k (VString s))
    ThawBytes -> Impure $ \vs k -> IThawBytes (deString (oneArg vs)) (\b -> k (VBytes b))

    StringLength -> Pure (\vs -> VNum (fromIntegral $ length (deString (oneArg vs))))
    StringIndex -> Pure (\vs -> VChar ((\(s,i) -> s!!(fromIntegral i)) $ (twoArgs deString deNum vs)))

    MakeRef -> Impure $ \vs k -> IMakeRef (oneArg vs) $ \r -> k (VRef r)
    DeRef -> Impure $ \vs k -> IDeRef (deRef (oneArg vs)) k
    SetRef -> Impure $ \vs k -> do
      let (r,v) = twoArgs deRef id vs
      ISetRef r v (k unit)

    FreeWords -> Impure $ \vs k -> case deUnit (oneArg vs) of () -> k (VNum 0)

    Crash -> Impure $ \vs _k -> do
      let s = deString (oneArg vs)
      iPut s IDone

    Init_interrupt_mode ->
      Impure $ \vs k -> case deUnit (oneArg vs) of () -> k unit

    Get_ticks -> Impure undefined -- TODO: no reason we can't emulate time in the haskell evaluators

    Wait_for_interrupt ->
      Impure $ \vs k -> case deUnit (oneArg vs) of () -> k unit

    Is_keyboard_ready ->
      Impure $ \vs k -> case deUnit (oneArg vs) of () -> k true

    Get_keyboard_last_scancode ->
      Impure $ \vs k -> case deUnit (oneArg vs) of () -> IGetScanCode (\c -> k (VChar c))

    LoadSec ->
      Impure $ \vs k -> do
      let (i,b) = twoArgs deNum deBytes vs
      IReadSector i $ \s -> do
        ISetBytesFromString b s $ do
        k unit

    StoreSec ->
      Impure $ \vs k -> do
      let (i,s) = twoArgs deNum deString vs
      IWriteSector i s (k unit)

  where
    unit = VCons tUnit []
    true = VCons tTrue []
    oneArg = \case [v] -> v; _ -> err
    twoArgs c1 c2 = \case [v1,v2] -> (c1 v1, c2 v2); _ -> err
    threeArgs c1 c2 c3 = \case [v1,v2,v3] -> (c1 v1, c2 v2, c3 v3); _ -> err
    deNum = \case VNum x -> x; _ -> err
    deChar = \case VChar x -> x; _ -> err
    deBytes = \case VBytes x -> x; _ -> err
    deString = \case VString x -> x; _ -> err
    deRef = \case VRef x -> x; _ -> err
    err :: a
    err = error (printf "Primitive.hs: error: %s" (show b))


iPut :: String -> Interaction -> Interaction
iPut s k = loop s
  where
    loop = \case
      [] -> k
      c:s -> IPut c (loop s)
