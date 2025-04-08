module Interaction ( Interaction(..), runTerm, Tickable(..) ) where

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

runTerm :: Interaction -> IO ()
runTerm i = do
  hSetEcho stdin False
  hSetBuffering stdin NoBuffering
  loop counts0 i
  where
    loop :: Counts -> Interaction -> IO ()
    loop counts = \case
      ITick t i -> do
        loop (tick t counts) i
      IDone -> do
        printf "[HALT:%s]\n" (show counts)
      ITrace mes i -> do
        --printf "[trace] %s" mes
        printf "%s" mes
        loop counts i
      IPut c i -> do
        let n = ord c
        let dontEscape = (32 <= n && n <= 126) || n == 8 || c == '\n'
        putStr (if dontEscape then [c] else showLitChar c "")
        hFlush stdout
        loop counts i
      IGet f -> do
        b <- hIsEOF stdin
        if b then printf "[EOF:%s]\n" (show counts) else do
          c <- getChar
          loop counts (f c)

data Counts = Counts { m :: Map Tickable Int }

instance Show Counts where
  show Counts{m} =
    intercalate ", " [ printf "#%s=%d" (show t) v | t <- all, Just v <- [Map.lookup t m] ]
    where
      all = [App,PushContinuation,Enter,Return,Prim]

counts0 :: Counts
counts0 = Counts { m = Map.empty }

tick :: Tickable -> Counts -> Counts
tick t c@Counts{m} = c { m = Map.insert t (v+1) m }
  where v = maybe 0 id $ Map.lookup t m


data Tickable
  = App
  | PushContinuation | Enter | Return
  | Prim
  deriving (Eq,Ord)

instance Show Tickable where
  show = \case
    App -> "apps"
    PushContinuation -> "push-continuation"
    Enter -> "enter"
    Return -> "return"
    Prim -> "prim"
