module Top (main) where

import Interaction (runTerm)
import Parser (parseProg)
import Predefined (wrapPreDefs)
import Text.Printf (printf)
import System.Environment (getArgs)
import qualified Eval0 (executeProg)
import qualified Transform1 (compile,execute)
import qualified Transform2 (compile,execute)

main :: IO ()
main = do
  let defaultMode = Eval2
  config <- parseCommandLine defaultMode <$> getArgs
  let Config {path,mode} = config
  s <- readFile path
  let prog = wrapPreDefs (parseProg s)
  case mode of
    JustParse0 -> do
      printf "[ast]\n----------\n%s\n----------\n" (show prog)
    Eval0 -> do
      putStrLn "[stage0]"
      runTerm (Eval0.executeProg prog)
    Compile1 -> do
      let e1 = Transform1.compile prog
      printf "[transform1]\n----------\n%s\n----------\n" (show e1)
    Eval1 -> do
      putStrLn "[stage1]"
      let e1 = Transform1.compile prog
      runTerm (Transform1.execute e1)
    Compile2 -> do
      let e1 = Transform1.compile prog
      let e2 = Transform2.compile e1
      printf "[transform2]\n----------\n%s\n----------\n" (show e2)
    Eval2 -> do
      putStrLn "[stage2]"
      let e1 = Transform1.compile prog
      let e2 = Transform2.compile e1
      runTerm (Transform2.execute e2)

data Config = Config { path :: String, mode :: Mode }

data Mode
  = JustParse0 | Eval0
  | Compile1 | Eval1
  | Compile2 | Eval2

parseCommandLine :: Mode -> [String] -> Config
parseCommandLine = loop
  where
    defaultCompilationMode = Compile2
    loop :: Mode -> [String] -> Config
    loop mode = \case
      "-compile":xs -> loop defaultCompilationMode xs
      "-parse":xs -> loop JustParse0 xs
      "-eval0":xs -> loop Eval0 xs
      "-compile1":xs -> loop Compile1 xs
      "-eval1":xs -> loop Eval1 xs
      "-compile2":xs -> loop Compile2 xs
      "-eval2":xs -> loop Eval2 xs
      [path] -> Config { path, mode }
      xs -> error (show ("parseCommandLine",xs))
