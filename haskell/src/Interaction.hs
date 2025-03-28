module Interaction ( Interaction(..), runTerm ) where

import Data.Char (showLitChar,ord)
import System.IO (stdin,stdout,hIsEOF,hFlush,hSetBuffering,hSetEcho,BufferMode(NoBuffering))
import Text.Printf (printf)

data Interaction
  = IDone
  | ITickApp Interaction
  | IDebug String Interaction
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
      ITickApp i -> do
        loop (tickApp counts) i
      IDone -> do
        printf "[HALT:%s]" (show counts)
      IDebug mes i -> do
        printf "[debug] %s" mes
        loop counts i
      IPut c i -> do
        let n = ord c
        let dontEscape = (32 <= n && n <= 126) || n == 8 || c == '\n'
        putStr (if dontEscape then [c] else showLitChar c "")
        hFlush stdout
        loop counts i
      IGet f -> do
        b <- hIsEOF stdin
        if b then printf "[EOF:%s]" (show counts) else do
          c <- getChar
          loop counts (f c)

data Counts = Counts { nApps :: Int }

instance Show Counts where show Counts{nApps} = printf "#apps=%d" nApps

counts0 :: Counts
counts0 = Counts { nApps = 0 }

tickApp :: Counts -> Counts
tickApp c@Counts{nApps} = c { nApps = 1 + nApps }
