module Top (main) where

import Interaction (runTerm)
import Parser (parseProg)
import Predefined (wrapPreDefs)
import System.Environment (getArgs)
import qualified Stage0 (execute)
import qualified Stage1 (compile,execute)
import qualified Stage2 (compile,execute)
import qualified Stage3 (compile,execute)

main :: IO ()
main = do
  config <- parseCommandLine <$> getArgs
  let Config {paths,mode,stage} = config
  let path = case paths of [] -> error "no .fun"; [x] -> x; _ -> error "too much .fun"
  s <- readFile path
  let e0 = wrapPreDefs (parseProg s)
  case (stage,mode) of
    (Stage0,Compile) -> do
      putStrLn "(*stage0*)"; putStrLn (show e0)
    (Stage0,Eval) -> do
      putStrLn "[stage0]"
      runTerm (Stage0.execute e0)
    (Stage1,Compile) -> do
      let e1 = Stage1.compile e0
      putStrLn "(*stage1*)"; putStrLn (show e1)
    (Stage1,Eval) -> do
      putStrLn "[stage1]"
      let e1 = Stage1.compile e0
      runTerm (Stage1.execute e1)
    (Stage2,Compile) -> do
      let e1 = Stage1.compile e0
      let e2 = Stage2.compile e1
      putStrLn "(*stage2*)"; putStrLn (show e2)
    (Stage2,Eval) -> do
      putStrLn "[stage2]"
      let e1 = Stage1.compile e0
      let e2 = Stage2.compile e1
      runTerm (Stage2.execute e2)

    (Stage3,Compile) -> do
      let e1 = Stage1.compile e0
      let e2 = Stage2.compile e1
      let e3 = Stage3.compile e2
      putStrLn "(*stage3*)"; putStrLn (show e3)
    (Stage3,Eval) -> do
      putStrLn "[stage3]"
      let e1 = Stage1.compile e0
      let e2 = Stage2.compile e1
      let e3 = Stage3.compile e2
      runTerm (Stage3.execute e3)

data Config = Config { paths :: [String], mode :: Mode, stage :: Stage }

data Mode = Compile | Eval

data Stage = Stage0 | Stage1 | Stage2 | Stage3

parseCommandLine :: [String] -> Config
parseCommandLine = loop config0
  where
    config0 = Config { paths = [], mode = Eval, stage = Stage3 }

    loop :: Config -> [String] -> Config
    loop config = \case
      [] -> config
      "-compile":xs     -> loop config { mode = Compile } xs
      "-eval":xs        -> loop config { mode = Eval } xs
      "-0":xs           -> loop config { stage = Stage0 } xs
      "-1":xs           -> loop config { stage = Stage1 } xs
      "-2":xs           -> loop config { stage = Stage2 } xs
      "-3":xs           -> loop config { stage = Stage3 } xs
      ('-':flag):_      -> error (show ("unknown flag",flag))
      x:xs              -> loop config { paths = paths config ++ [x] } xs
