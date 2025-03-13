module Interaction ( Interaction(..), runTerm ) where

import Text.Printf (printf)
import System.IO (stdin,stdout,hIsEOF,hFlush,hSetBuffering,hSetEcho,BufferMode(NoBuffering))

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
        printf "%c" c -- TODO: show non-printable
        hFlush stdout
        loop i
      IGet f -> do
        b <- hIsEOF stdin
        if b then printf "[EOF]\n" else do
          c <- getChar
          loop (f c)
