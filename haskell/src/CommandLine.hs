module CommandLine (main) where

import Interaction (runTerm)
import Parser (parseProg)
import Predefined (wrapPreDefs)
import System.Environment (getArgs)
import qualified Stage0 (execute)
import qualified Stage1 (compile,execute,sizeExp)
import qualified Stage2 (compile,execute)
import qualified Stage3 (compile,execute)
import Normalize (normalize)
import Text.Printf (printf)

main :: IO ()
main = do
  config <- parseCommandLine <$> getArgs
  let Config {paths,mode,stage} = config
  let path = case paths of [] -> error "no .fun"; [x] -> x; _ -> error "too much .fun"
  s <- readFile path

  let e0 = wrapPreDefs (parseProg s)
  let e1u = Stage1.compile e0
  let e1 = normalize e1u
  let e2 = Stage2.compile e1
  let e3 = Stage3.compile e2

  let
    tag = case stage of
      Stage0 -> "stage0"
      Stage1_u -> "stage1; un-normalized"
      Stage1 -> "stage1"
      Stage2 -> "stage2"
      Stage3 -> "stage3"

  let reachedNormStage = (stage >= Stage1)
  let
    tagZ :: String = if reachedNormStage then printf "; normalization: %d -> %d" sizeU sizeN else ""
      where sizeU = Stage1.sizeExp e1u
            sizeN = Stage1.sizeExp e1

  case (stage,mode) of
    (Stage0,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e0)
    (Stage1_u,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e1u)
    (Stage1,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e1)
    (Stage2,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e2)
    (Stage3,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e3)

    (Stage0,Eval) -> do printf "[%s]\n" tag; runTerm (Stage0.execute e0)
    (Stage1_u,Eval) -> do printf "[%s%s]\n" tag tagZ; runTerm (Stage1.execute e1u)
    (Stage1,Eval) -> do printf "[%s%s]\n" tag tagZ; runTerm (Stage1.execute e1)
    (Stage2,Eval) -> do printf "[%s%s]\n" tag tagZ; runTerm (Stage2.execute e2)
    (Stage3,Eval) -> do printf "[%s%s]\n" tag tagZ; runTerm (Stage3.execute e3)

data Config = Config { paths :: [String], mode :: Mode, stage :: Stage
                     -- , doNorm :: Bool -- TODO: reinstate; pass to Normalization
                     }

data Mode = Compile | Eval

data Stage = -- TODO: Add doc here to summarise the stages
  Stage0 | Stage1_u | Stage1 | Stage2 | Stage3 -- TODO: rename; bumping stage numbers
  deriving (Eq,Ord)

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
      "-1u":xs          -> loop config { stage = Stage1_u } xs
      "-1":xs           -> loop config { stage = Stage1 } xs
      "-2":xs           -> loop config { stage = Stage2 } xs
      "-3":xs           -> loop config { stage = Stage3 } xs
      ('-':flag):_      -> error (show ("unknown flag",flag))
      x:xs              -> loop config { paths = paths config ++ [x] } xs
