module Top (main) where

import Interaction (runTerm)
import Parser (parseProg)
import Predefined (wrapPreDefs)
import Text.Printf (printf)
import System.Environment (getArgs)
import qualified Eval0 (executeProg)
import qualified Transform1 (compile,execute)

main :: IO ()
main = do
  putStrLn "[haskell]"
  config <- parseCommandLine <$> getArgs
  let Config {path,mode} = config
  s <- readFile path
  case mode of

    JustParse0 -> do
      -- parse and print
      let prog = wrapPreDefs (parseProg s)
      printf "----------\n%s\n----------\n" (show prog)

    Eval0 -> do
      -- parse; execute Exp0 directly
      let prog = wrapPreDefs (parseProg s)
      runTerm (Eval0.executeProg prog)

    Compile1 -> do
      -- parse; transform to Exp1; then print
      let prog = wrapPreDefs (parseProg s)
      let e2 = Transform1.compile prog
      printf "----------\n%s\n----------\n" (show e2)

    Eval1 -> do
      -- parse; transform to Exp1; then execute
      let prog = wrapPreDefs (parseProg s)
      let e2 = Transform1.compile prog
      runTerm (Transform1.execute e2)

  pure ()

data Config = Config { path :: String, mode :: Mode }

data Mode
  = JustParse0 | Eval0
  | Compile1 | Eval1

parseCommandLine :: [String] -> Config
parseCommandLine = loop Eval1
  where
    loop :: Mode -> [String] -> Config
    loop mode = \case
      "-parse":xs -> loop JustParse0 xs
      "-eval0":xs -> loop Eval0 xs
      "-compile":xs -> loop Compile1 xs
      "-eval1":xs -> loop Eval1 xs
      [path] -> Config { path, mode }
      xs -> error (show ("parseCommandLine",xs))
