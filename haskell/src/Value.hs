module Value
  ( tUnit, tFalse, tTrue, tNil, tCons, cUnit, cFalse, cTrue, cNil, cCons
  , Value(..), Number, Ctag(..), Cid(..)
  , mkBool,mkList,deUnit
  , Interaction(..), runInteraction
  , Tickable(..)
  ) where

import Data.Char (ord,chr)
import Data.IORef (IORef,newIORef,readIORef,writeIORef)
import Data.List (intercalate)
import Data.Map (Map)
import System.IO (stdin,stdout,hIsEOF,hFlush,hSetBuffering,hSetEcho,BufferMode(NoBuffering))
import Text.Printf (printf)
import qualified Data.Map as Map

data Value
  = VCons Ctag [Value]
  | VBytes Bytes
  | VString String
  | VChar Char
  | VNum Number
  | VFunc (Value -> (Value -> Interaction) -> Interaction)
  | VRef (IORef Value)

data Interaction
  = IDone
  | ITick Tickable Interaction
  | ITrace String Interaction
  | IIO (IO Interaction)
  | IPut Char Interaction
  | IGet (Char -> Interaction)
  | IGetScanCode (Char -> Interaction)
  | IMakeBytes Int (Bytes -> Interaction)
  | IFreezeBytes Bytes (String -> Interaction)
  | IThawBytes String (Bytes -> Interaction)
  | ISetBytes Bytes Int Char Interaction
  | IGetBytes Bytes Int (Char -> Interaction)
  | IMakeRef Value (IORef Value -> Interaction)
  | IDeRef (IORef Value) (Value -> Interaction)
  | ISetRef (IORef Value) Value Interaction

runInteraction :: Bool -> Interaction -> IO ()
runInteraction measure next = do
  hSetEcho stdin False
  hSetBuffering stdin NoBuffering
  loop state0 next
  where
    loop :: State -> Interaction -> IO ()
    loop state = \case
      IIO io -> io >>= loop state
      ITick t k -> do
        let State{tm} = state
        loop state { tm = Map.insertWith (+) t 1 tm } k
      IDone -> do
        printf "[HALT%s]\n" (if measure then ":"++show state else "")
      ITrace mes k -> do
        printf "%s" mes
        loop state k
      IPut c k -> do
        let n = ord c
        let printable = n >= 32 && n <= 126
        let nl = (n == 10)
        let bs = (n == 8)
        putStr (if printable || nl || bs then [c] else printf "\\%02x" n)
        hFlush stdout
        loop state k
      IGet f -> do
        b <- hIsEOF stdin
        if b then printf "[EOF%s]\n" (if measure then ":"++show state else "") else do
          c <- getChar
          loop state (f c)

      interaction@(IGetScanCode f) -> do
        let State{pendingScanCodes} = state
        case pendingScanCodes of
          x:xs -> loop state { pendingScanCodes = xs } (f (chr x))
          [] -> do
            b <- hIsEOF stdin
            if b then printf "[EOF%s]\n" (if measure then ":"++show state else "") else do
              c <- getChar
              loop state { pendingScanCodes = scanCodesFromAscii c } interaction -- try again

      IMakeBytes n k -> do
        let State{bm,u} = state
        let r = BytesRef u
        let m = Map.empty
        loop state { u = 1 + u, bm = Map.insert r (n,m) bm } (k (BytesRef u))

      IFreezeBytes r k -> do
        let State{bm} = state
        let (n,m) = maybe err id $ Map.lookup r bm where err = error (show ("IFreezeBytes",r))
        let string = [ maybe '\0' id $ Map.lookup i m | i <- [0..n-1] ]
        loop state (k string)

      IThawBytes s k -> do
        let State{bm,u} = state
        let r = BytesRef u
        let m = Map.fromList [ (i,c) | (i,c) <- zip [0..] s ]
        let n = length s
        loop state { u = 1 + u, bm = Map.insert r (n,m) bm } (k (BytesRef u))

      ISetBytes r i c k -> do
        if i < 0 then error "ISetBytes:i<0" else do
          let State{bm} = state
          let (n,m) = maybe err id $ Map.lookup r bm where err = error (show ("ISetBytes",r))
          if i >= n then error "ISetBytes:i>=n" else do
            let bm' = Map.insert r (n,Map.insert i c m) bm
            loop state { bm = bm' } k

      IGetBytes r i k -> do
        if i < 0 then error "IGetBytes:i<0" else do
          let State{bm} = state
          let (n,m) = maybe err id $ Map.lookup r bm where err = error (show ("GettBytes",r))
          if i >= n then error "IGetBytes:i>=n" else do
            let c = maybe '\0' id $ Map.lookup i m
            loop state (k c)

      IMakeRef v k -> do
        r <- newIORef v
        loop state (k r)

      IDeRef r k -> do
        v <- readIORef r
        loop state (k v)

      ISetRef r v k -> do
        writeIORef r v
        loop state k

-- An Interaction supports primitives for manipualting mutable "bytes"
-- We implement functionally, with bytes being a reference into a Map of created bytes.
-- Without GC, this will leak over time!
-- This would be solved by switching to an IOArray based implementation
data Bytes = BytesRef Int deriving (Eq,Ord,Show)

data State = State
  { tm :: Map Tickable Int
  , bm :: Map Bytes (Int,Map Int Char)
  , u :: Int
  , pendingScanCodes :: [Int]
  }

state0 :: State
state0 = State { tm = Map.empty, bm = Map.empty, u = 1, pendingScanCodes = [] }

instance Show State where
  show State{tm} =
    intercalate ", " [ printf "#%s=%d" (show t) v | t <- all, Just v <- [Map.lookup t tm] ]
    where
      all = [minBound ..maxBound]

data Tickable
  = App
  | PushContinuation | Enter | Return
  | Prim
  | Op
  | Alloc -- counting bytes allocated on the heap
  | GC
  | Copied -- counting bytes copied by GC between Hemispaces
  deriving (Eq,Ord,Enum,Bounded)

instance Show Tickable where
  show = \case
    App -> "apps"
    PushContinuation -> "push-continuation"
    Enter -> "enter"
    Return -> "return"
    Prim -> "prim"
    Op -> "op"
    Alloc -> "alloc"
    GC -> "gc"
    Copied -> "copied"

newtype Number = Number Int deriving (Eq,Ord,Num,Integral,Real,Enum)

data Ctag = Ctag Cid Number deriving (Eq)
data Cid = Cid String deriving (Eq,Ord)

instance Show Number where show (Number n) = show n

instance Show Value where
  show = \case
    VCons tag vs -> printf "[construct:%s:%s]" (show tag) (show vs)
    VBytes b -> printf"[bytes:%s]" (show b)
    VString s -> printf"[string:%s]" (show s)
    VChar c -> printf"[char:%s]" (show c)
    VNum n -> printf"[number:%s]" (show n)
    VFunc{} -> "[function]"
    VRef{} -> "[ref]"

instance Show Ctag where show (Ctag cid n) = printf "%s%s" (show cid) (show n)
instance Show Cid where show (Cid s) = s

cUnit,cFalse,cTrue,cNil,cCons :: Cid
cUnit = Cid "Unit"
cTrue = Cid "true"
cFalse = Cid "false"
cNil = Cid "Nil"
cCons = Cid "Cons"

tUnit,tFalse,tTrue,tNil,tCons :: Ctag
tUnit = Ctag cUnit 0
tFalse = Ctag cFalse 0
tTrue = Ctag cTrue 1
tNil = Ctag cNil 0
tCons = Ctag cCons 1

mkBool :: Bool -> Value
mkBool = \case
  False -> false
  True -> true
  where
    false = VCons tFalse []
    true = VCons tTrue []

vNil :: Value
vNil = VCons tNil []

mkList :: [Value] -> Value
mkList = \case
  [] -> vNil
  v:vs -> VCons tCons [v, mkList vs]

deUnit :: Value -> ()
deUnit =
  \case VCons (Ctag _ tag) [] | tag == n -> (); _ -> error "deUnit"
  where Ctag _ n = tUnit

scanCodesFromAscii :: Char -> [Int]
scanCodesFromAscii c = do
  let n = ord c
  if n <= 26 then [ pressControl, shiftedPress (chr (n + ord '@')), releaseControl ] else do
    let code = normalPress c
    if code /= 0 then [ code ] else do
      let code = shiftedPress c
      if code /= 0 then [ pressShift, code, releaseShift ] else do
        []
  where
   pressShift = 42
   releaseShift = 170
   pressControl = 29
   releaseControl = 157

normalPress :: Char -> Int
normalPress = \case
  '1' -> 0x02
  '2' -> 0x03
  '3' -> 0x04
  '4' -> 0x05
  '5' -> 0x06
  '6' -> 0x07
  '7' -> 0x08
  '8' -> 0x09
  '9' -> 0x0a
  '0' -> 0x0b
  '-' -> 0x0c
  '=' -> 0x0d
  'q' -> 0x10
  'w' -> 0x11
  'e' -> 0x12
  'r' -> 0x13
  't' -> 0x14
  'y' -> 0x15
  'u' -> 0x16
  'i' -> 0x17
  'o' -> 0x18
  'p' -> 0x19
  '[' -> 0x1a
  ']' -> 0x1b
  'a' -> 0x1e
  's' -> 0x1f
  'd' -> 0x20
  'f' -> 0x21
  'g' -> 0x22
  'h' -> 0x23
  'j' -> 0x24
  'k' -> 0x25
  'l' -> 0x26
  ';' -> 0x27
  '\'' -> 0x28
  '`' -> 0x29
  '\\' -> 0x2b
  'z' -> 0x2c
  'x' -> 0x2d
  'c' -> 0x2e
  'v' -> 0x2f
  'b' -> 0x30
  'n' -> 0x31
  'm' -> 0x32
  ',' -> 0x33
  '.' -> 0x34
  '/' -> 0x35
  ' ' -> 0x39
  '\127' -> 0x0E -- from backspace key
  '\t' -> 0x0F
  '\n' -> 0x1C
  _ -> 0

shiftedPress :: Char -> Int
shiftedPress = \case
  '!' -> 0x02
  '@' -> 0x03
  '#' -> 0x04
  '$' -> 0x05
  '%' -> 0x06
  '^' -> 0x07
  '&' -> 0x08
  '*' -> 0x09
  '(' -> 0x0A
  ')' -> 0x0B
  '_' -> 0x0C
  '+' -> 0x0D
  'Q' -> 0x10
  'W' -> 0x11
  'E' -> 0x12
  'R' -> 0x13
  'T' -> 0x14
  'Y' -> 0x15
  'U' -> 0x16
  'I' -> 0x17
  'O' -> 0x18
  'P' -> 0x19
  '{' -> 0x1A
  '}' -> 0x1B
  'A' -> 0x1E
  'S' -> 0x1F
  'D' -> 0x20
  'F' -> 0x21
  'G' -> 0x22
  'H' -> 0x23
  'J' -> 0x24
  'K' -> 0x25
  'L' -> 0x26
  ':' -> 0x27
  '"' -> 0x28
  '~' -> 0x29
  '|' -> 0x2B
  'Z' -> 0x2C
  'X' -> 0x2D
  'C' -> 0x2E
  'V' -> 0x2F
  'B' -> 0x30
  'N' -> 0x31
  'M' -> 0x32
  '<' -> 0x33
  '>' -> 0x34
  '?' -> 0x35
  _ -> 0
