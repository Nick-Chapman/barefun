module Interaction ( Interaction(..), runTerm ) where

import Data.Char (showLitChar,ord)
import System.IO (stdin,stdout,hIsEOF,hFlush,hSetBuffering,hSetEcho,BufferMode(NoBuffering))
import Text.Printf (printf)

data Interaction
  = IDone
  | IDebug String Interaction
  | IPut Char Interaction
  | IGet (Char -> Interaction)

runTerm :: Interaction -> IO ()
runTerm i = do
  hSetEcho stdin False
  hSetBuffering stdin NoBuffering
  loop i
  where
    loop :: Interaction -> IO ()
    loop = \case
      IDone ->
        pure ()
      IDebug mes i -> do
        printf "[debug] %s" mes
        loop i
      IPut c i -> do
        let n = ord c
        let dontEscape = (32 <= n && n <= 126) || n == 8 || c == '\n'
        putStr (if dontEscape then [c] else showLitChar c "")
        hFlush stdout
        loop i
      IGet f -> do
        b <- hIsEOF stdin
        if b then putStrLn "[EOF]" else do
          c <- getChar
          loop (f c)
