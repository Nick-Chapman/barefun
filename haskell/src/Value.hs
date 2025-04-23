module Value
  ( tUnit, tFalse, tTrue, tNil, tCons, cUnit, cFalse, cTrue, cNil, cCons
  , Value(..), Number, Ctag(..), Cid(..)
  , mkBool,mkList,deUnit
  , Interaction(..), runInteraction
  , Tickable(..)
  ) where

import Data.Char (showLitChar,ord)
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
  | IPut Char Interaction
  | IGet (Char -> Interaction)
  | IMakeBytes Int (Bytes -> Interaction)
  | IFreezeBytes Bytes (String -> Interaction)
  | IThawBytes String (Bytes -> Interaction)
  | ISetBytes Bytes Int Char Interaction
  | IGetBytes Bytes Int (Char -> Interaction)
  | IMakeRef Value (IORef Value -> Interaction)
  | IDeRef (IORef Value) (Value -> Interaction)
  | ISetRef (IORef Value) Value Interaction

runInteraction :: Interaction -> IO ()
runInteraction next = do
  hSetEcho stdin False
  hSetBuffering stdin NoBuffering
  loop state0 next
  where
    loop :: State -> Interaction -> IO ()
    loop state = \case
      ITick t k -> do
        let State{tm} = state
        loop state { tm = Map.insertWith (+) t 1 tm } k
      IDone -> do
        printf "[HALT:%s]\n" (show state)
      ITrace mes k -> do
        printf "%s" mes
        loop state k
      IPut c k -> do
        let n = ord c
        let dontEscape = (32 <= n && n <= 126) || n == 8 || c == '\n'
        putStr (if dontEscape then [c] else showLitChar c "")
        hFlush stdout
        loop state k
      IGet f -> do
        b <- hIsEOF stdin
        if b then printf "[EOF:%s]\n" (show state) else do
          c <- getChar
          loop state (f c)

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
  }

state0 :: State
state0 = State { tm = Map.empty, bm = Map.empty, u = 1 }

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
  deriving (Eq,Ord,Enum,Bounded)

instance Show Tickable where
  show = \case
    App -> "apps"
    PushContinuation -> "push-continuation"
    Enter -> "enter"
    Return -> "return"
    Prim -> "prim"
    Op -> "op"

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
