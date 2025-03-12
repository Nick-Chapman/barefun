module Interaction ( Interaction(..), runTerm, runFixedInput ) where

import Text.Printf (printf)
import System.IO (stdin,stdout,hFlush,hSetBuffering,hSetEcho,BufferMode(NoBuffering))

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
        printf "debug: %s" mes
        loop i
      IPut c i -> do
        printf "%c" c
        hFlush stdout
        loop i
      IGet f -> do
        c <- getChar
        loop (f c)

runFixedInput :: String -> Interaction -> IO ()
runFixedInput = loop
  where
    loop :: String -> Interaction -> IO ()
    loop input = \case
      IDone ->
        pure ()
      IDebug mes i -> do
        printf "debug: %s" mes
        loop input i
      IPut c i -> do
        --printf "[%s]" (show c)
        printf "%c" c
        loop input i
      IGet f ->
        case input of
          [] -> do
            printf "Get -- Input exhaused\n";
            pure ()
          c:input -> do
            --printf "{%s}" (show c)
            loop input (f c)
