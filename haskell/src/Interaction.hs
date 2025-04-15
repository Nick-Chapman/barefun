module Interaction ( Interaction(..), runTerm, Tickable(..), Bytes ) where

import Data.Char (showLitChar,ord)
import Data.List (intercalate)
import Data.Map (Map)
import System.IO (stdin,stdout,hIsEOF,hFlush,hSetBuffering,hSetEcho,BufferMode(NoBuffering))
import Text.Printf (printf)
import qualified Data.Map as Map

data Interaction
  = IDone
  | ITick Tickable Interaction
  | ITrace String Interaction
  | IPut Char Interaction
  | IGet (Char -> Interaction)
  | IMakeBytes Int (Bytes -> Interaction)
  | IFreezeBytes Bytes (String -> Interaction)
  | ISetBytes Bytes Int Char Interaction

runTerm :: Interaction -> IO ()
runTerm next = do
  hSetEcho stdin False
  hSetBuffering stdin NoBuffering
  loop state0 next
  where
    loop :: State -> Interaction -> IO ()
    loop state= \case
      ITick t next -> do
        let State{tm} = state
        loop state { tm = Map.insertWith (+) t 1 tm } next
      IDone -> do
        printf "[HALT:%s]\n" (show state)
      ITrace mes next -> do
        printf "%s" mes
        loop state next
      IPut c next -> do
        let n = ord c
        let dontEscape = (32 <= n && n <= 126) || n == 8 || c == '\n'
        putStr (if dontEscape then [c] else showLitChar c "")
        hFlush stdout
        loop state next
      IGet f -> do
        b <- hIsEOF stdin
        if b then printf "[EOF:%s]\n" (show state) else do
          c <- getChar
          loop state (f c)

      IMakeBytes n f -> do
        let State{bm,u} = state
        let r = BytesRef u
        loop state { u = 1 + u, bm = Map.insert r (n,Map.empty) bm } (f (BytesRef u))

      IFreezeBytes r f -> do
        let State{bm} = state
        let (n,m) = maybe err id $ Map.lookup r bm where err = error (show ("IFreezeBytes",r))
        let string = [ maybe '\0' id $ Map.lookup i m | i <- [0..n-1] ]
        loop state (f string)

      ISetBytes r i c next -> do
        if i < 0 then error "ISetBytes:i<0" else do
          let State{bm} = state
          let (n,m) = maybe err id $ Map.lookup r bm where err = error (show ("ISetBytes",r))
          if i >= n then error "ISetBytes:i>=n" else do
            let bm' = Map.insert r (n,Map.insert i c m) bm
            loop state { bm = bm' } next

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
