module Top (main) where

import Interaction (runTerm)
import Parser (parseProg)
import Predefined (wrapPreDefs)
import Text.Printf (printf)
import System.Environment (getArgs)
import qualified Eval1 (executeProg)
import qualified Transform1 (compile,execute)

main :: IO ()
main = do
  putStrLn "[haskell]"
  config <- parseCommandLine <$> getArgs
  let Config {path,mode} = config
  s <- readFile path
  case mode of

    JustParse1 -> do
      -- parse and print
      let prog = wrapPreDefs (parseProg s)
      printf "----------\n%s\n----------\n" (show prog)

    Eval1 -> do
      -- parse; execute Exp1 directly
      let prog = wrapPreDefs (parseProg s)
      runTerm (Eval1.executeProg prog)

    Compile2 -> do
      -- parse; transform to Exp2; then print
      let prog = wrapPreDefs (parseProg s)
      let e2 = Transform1.compile prog
      printf "----------\n%s\n----------\n" (show e2)

    Eval2 -> do
      -- parse; transform to Exp2; then execute
      let prog = wrapPreDefs (parseProg s)
      let e2 = Transform1.compile prog
      runTerm (Transform1.execute e2)

  pure ()

data Config = Config { path :: String, mode :: Mode }

data Mode
  = JustParse1 | Eval1
  | Compile2 | Eval2

parseCommandLine :: [String] -> Config
parseCommandLine = loop Eval2
  where
    loop :: Mode -> [String] -> Config
    loop mode = \case
      "-parse":xs -> loop JustParse1 xs
      "-eval1":xs -> loop Eval1 xs
      "-compile":xs -> loop Compile2 xs
      "-eval2":xs -> loop Eval2 xs
      [path] -> Config { path, mode }
      xs -> error (show ("parseCommandLine",xs))
