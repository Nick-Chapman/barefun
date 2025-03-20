module Top (main) where

import Interaction (runTerm)
import Parser (parseProg)
import Predefined (wrapPreDefs)
import Text.Printf (printf)
import System.Environment (getArgs)
import qualified Eval0 (executeProg)
import qualified Stage1 (compile,execute)
import qualified Stage2 (compile,execute)

main :: IO ()
main = do
  config <- parseCommandLine <$> getArgs
  let Config {paths,mode,stage} = config
  let path = case paths of [] -> error "no .fun"; [x] -> x; _ -> error "too much .fun"
  s <- readFile path
  let prog = wrapPreDefs (parseProg s)
  case (stage,mode) of
    (Stage0,Compile) -> do
      printf "[ast]\n----------\n%s\n----------\n" (show prog)
    (Stage0,Eval) -> do
      putStrLn "[stage0]"
      runTerm (Eval0.executeProg prog)
    (Stage1,Compile) -> do
      let e1 = Stage1.compile prog
      printf "[transform1]\n----------\n%s\n----------\n" (show e1)
    (Stage1,Eval) -> do
      putStrLn "[stage1]"
      let e1 = Stage1.compile prog
      runTerm (Stage1.execute e1)
    (Stage2,Compile) -> do
      let e1 = Stage1.compile prog
      let e2 = Stage2.compile e1
      printf "[transform2]\n----------\n%s\n----------\n" (show e2)
    (Stage2,Eval) -> do
      putStrLn "[stage2]"
      let e1 = Stage1.compile prog
      let e2 = Stage2.compile e1
      runTerm (Stage2.execute e2)

data Config = Config { paths :: [String], mode :: Mode, stage :: Stage }

data Mode = Compile | Eval

data Stage = Stage0 | Stage1 | Stage2

parseCommandLine :: [String] -> Config
parseCommandLine = loop config0
  where
    config0 = Config { paths = [], mode = Eval, stage = Stage2 }

    loop :: Config -> [String] -> Config
    loop config = \case
      [] -> config
      "-compile":xs     -> loop config { mode = Compile } xs
      "-eval":xs        -> loop config { mode = Eval } xs
      "-0":xs           -> loop config { stage = Stage0 } xs
      "-1":xs           -> loop config { stage = Stage1 } xs
      "-2":xs           -> loop config { stage = Stage2 } xs
      ('-':flag):_      -> error (show ("unknown flag",flag))
      x:xs              -> loop config { paths = paths config ++ [x] } xs
