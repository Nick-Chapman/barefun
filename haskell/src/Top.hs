module Top (main) where -- TODO: rename CommandLine

import Interaction (runTerm)
import Parser (parseProg)
import Predefined (wrapPreDefs)
import System.Environment (getArgs)
import qualified Stage0 (execute)
import qualified Stage1 (compile,execute)
import qualified Stage2 (compile,execute)
import qualified Stage3 (compile,execute)
import Normalize (normalize)
import Text.Printf (printf)

main :: IO ()
main = do
  config <- parseCommandLine <$> getArgs
  let Config {paths,mode,stage,doNorm} = config
  let path = case paths of [] -> error "no .fun"; [x] -> x; _ -> error "too much .fun"
  s <- readFile path
  let
    tag = (case stage of
      Stage0 -> "stage0"
      Stage1 -> "stage1"
      Stage2 -> "stage2"
      Stage3 -> "stage3") ++ if doNorm then "" else "; un-normalized"

  let e0 = wrapPreDefs (parseProg s)
  let e1u = Stage1.compile e0
  let e2u = Stage2.compile e1u
  let e3u = Stage3.compile e2u

  let e1n = normalize e1u
  let e2n = Stage2.compile e1n
  let e3n = Stage3.compile e2n

  let e1 = if doNorm then e1n else e1u
  let e2 = if doNorm then e2n else e2u
  let e3 = if doNorm then e3n else e3u

  case (stage,mode) of
    (Stage0,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e0)
    (Stage1,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e1)
    (Stage2,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e2)
    (Stage3,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e3)

    (Stage0,Eval) -> do printf "[%s]\n" tag; runTerm (Stage0.execute e0)
    (Stage1,Eval) -> do printf "[%s]\n" tag; runTerm (Stage1.execute e1)
    (Stage2,Eval) -> do printf "[%s]\n" tag; runTerm (Stage2.execute e2)
    (Stage3,Eval) -> do printf "[%s]\n" tag; runTerm (Stage3.execute e3)

data Config = Config { paths :: [String], mode :: Mode, stage :: Stage, doNorm :: Bool}

data Mode = Compile | Eval

data Stage = Stage0 | Stage1 | Stage2 | Stage3

parseCommandLine :: [String] -> Config
parseCommandLine = loop config0
  where
    config0 = Config { paths = [], mode = Eval, stage = Stage3, doNorm = True }

    loop :: Config -> [String] -> Config
    loop config = \case
      [] -> config
      "-compile":xs     -> loop config { mode = Compile } xs
      "-eval":xs        -> loop config { mode = Eval } xs
      "-0":xs           -> loop config { stage = Stage0 } xs
      "-1":xs           -> loop config { stage = Stage1 } xs
      "-2":xs           -> loop config { stage = Stage2 } xs
      "-3":xs           -> loop config { stage = Stage3 } xs
      "-1u":xs          -> loop config { stage = Stage1, doNorm = False } xs
      "-2u":xs          -> loop config { stage = Stage2, doNorm = False } xs
      "-3u":xs          -> loop config { stage = Stage3, doNorm = False } xs
      ('-':flag):_      -> error (show ("unknown flag",flag))
      x:xs              -> loop config { paths = paths config ++ [x] } xs
