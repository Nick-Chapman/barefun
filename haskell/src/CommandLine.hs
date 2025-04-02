module CommandLine (main) where

import Interaction (runTerm)
import Parser (parseProg)
import Predefined (wrapPreDefs)
import System.Environment (getArgs)
import qualified Stage0_AST as Stage0 (execute)
import qualified Stage1_EXP as Stage1 (compile,execute,sizeExp)
import qualified Stage2_NBE as Stage2 (compile,execute)
import qualified Stage3_ANF as Stage3 (compile,execute)
import qualified Stage4_CCF as Stage4 (compile,execute)
import Text.Printf (printf)

main :: IO ()
main = do
  config <- parseCommandLine <$> getArgs
  let Config {paths,mode,stage} = config
  let path = case paths of [] -> error "no .fun"; [x] -> x; _ -> error "too much .fun"
  s <- readFile path

  let e0 = wrapPreDefs (parseProg s)
  let e1 = Stage1.compile e0
  let e2 = Stage2.compile e1
  let e3 = Stage3.compile e2
  let e4 = Stage4.compile e3

  let
    tag = case stage of
      Stage0 -> "Stage0 (AST)"
      Stage1 -> "Stage1 (Exp)"
      Stage2 -> "Stage2 (NbE)"
      Stage3 -> "Stage3 (ANF)"
      Stage4 -> "Stage4 (CCF)" --Closure converted form; Globals lifted; free-vars located)

  let reachedNormStage = (stage >= Stage2)
  let
    tagZ :: String = if reachedNormStage then printf "; normalization: %d -> %d" sizeU sizeN else ""
      where sizeU = Stage1.sizeExp e1
            sizeN = Stage1.sizeExp e2

  case (stage,mode) of
    (Stage0,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e0)
    (Stage1,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e1)
    (Stage2,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e2)
    (Stage3,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e3)
    (Stage4,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e4)

    (Stage0,Eval) -> do printf "[%s]\n" tag; runTerm (Stage0.execute e0)
    (Stage1,Eval) -> do printf "[%s%s]\n" tag tagZ; runTerm (Stage1.execute e1)
    (Stage2,Eval) -> do printf "[%s%s]\n" tag tagZ; runTerm (Stage2.execute e2)
    (Stage3,Eval) -> do printf "[%s%s]\n" tag tagZ; runTerm (Stage3.execute e3)
    (Stage4,Eval) -> do printf "[%s%s]\n" tag tagZ; runTerm (Stage4.execute e4)

data Config = Config { paths :: [String], mode :: Mode, stage :: Stage }

data Mode = Compile | Eval

data Stage
  = Stage0 -- AST: Built by the parser.
  | Stage1 -- EXP: Simplified expression language.
  | Stage2 -- NBE: Result of "Normalization by Evaluation".
  | Stage3 -- AST: A-Normal Form; free-vars identified.
  | Stage4 -- CCF: Closure-converted form; Runtime locations chosen (Global,Frame,Arg,Temp)
  deriving (Eq,Ord)

parseCommandLine :: [String] -> Config
parseCommandLine = loop config0
  where
    config0 = Config { paths = [], mode = Eval, stage = Stage4 }

    loop :: Config -> [String] -> Config
    loop config = \case
      [] -> config
      "-compile":xs     -> loop config { mode = Compile } xs
      "-eval":xs        -> loop config { mode = Eval } xs
      "-0":xs           -> loop config { stage = Stage0 } xs
      "-1":xs           -> loop config { stage = Stage1 } xs
      "-2":xs           -> loop config { stage = Stage2 } xs
      "-3":xs           -> loop config { stage = Stage3 } xs
      "-4":xs           -> loop config { stage = Stage4 } xs
      ('-':flag):_      -> error (show ("unknown flag",flag))
      x:xs              -> loop config { paths = paths config ++ [x] } xs
