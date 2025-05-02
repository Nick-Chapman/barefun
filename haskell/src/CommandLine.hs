module CommandLine (main) where

import Parser (parseProg)
import Predefined (wrapPreDefs)
import System.Environment (getArgs)
import Text.Printf (printf)
import Value (runInteraction)
import qualified Stage0_AST as Stage0 (execute)
import qualified Stage1_EXP as Stage1 (compile,execute,sizeExp,pp,PPControl(..),PPPosFlag(..),PPUniqueFlag(..))
import qualified Stage2_NBE as Stage2 (compile,execute)
import qualified Stage3_ANF as Stage3 (compile,execute)
import qualified Stage4_CCF as Stage4 (compile,execute)

import qualified Stage5_ASM_Compiler as Stage5 (compile)
import qualified Stage5_ASM_Emulation as Stage5 (execute,TraceFlag(..),DebugFlag(..))

main :: IO ()
main = do
  config <- parseCommandLine <$> getArgs
  let Config {paths,mode,stage,trace,debug,measure,ppp,ppu} = config
  let ppc = Stage1.PPControl {ppp,ppu}
  let path = case paths of [] -> error "no .fun"; [x] -> x; _ -> error "too much .fun"
  s <- readFile path

  let e0 = wrapPreDefs (parseProg s)
  let e1 = Stage1.compile e0
  let e2 = Stage2.compile e1
  let e3 = Stage3.compile e2
  let e4 = Stage4.compile e3
  let e5 = Stage5.compile e4

  let
    tag = case stage of
      Stage0 -> "Stage0 (AST)"
      Stage1 -> "Stage1 (Exp)"
      Stage2 -> "Stage2 (NbE)"
      Stage3 -> "Stage3 (ANF)"
      Stage4 -> "Stage4 (CCF)"
      Stage5 -> "Stage5 (ASM)"

  let reachedNormStage = (stage >= Stage2)
  let
    tagZ = if reachedNormStage then printf "; post normalization size: %d" sizeN else ""
      where sizeN = Stage1.sizeExp e2

  -- flag "-no-measure" suppresses printing the opening whoami banner and the final instumention
  let whoami = if measure then printf "[%s%s]\n" tag tagZ else ""
  let runInteraction = Value.runInteraction measure

  case (stage,mode) of
    (Stage0,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e0)
    (Stage1,Compile) -> do printf "(*%s*)\n" tag; putStrLn (Stage1.pp ppc e1)
    (Stage2,Compile) -> do printf "(*%s*)\n" tag; putStrLn (Stage1.pp ppc e2)
    (Stage3,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e3)
    (Stage4,Compile) -> do printf "(*%s*)\n" tag; putStrLn (show e4)
    (Stage5,Compile) -> do putStrLn (show e5)

    (Stage0,Eval) -> do putStr whoami; runInteraction (Stage0.execute e0)
    (Stage1,Eval) -> do putStr whoami; runInteraction (Stage1.execute e1)
    (Stage2,Eval) -> do putStr whoami; runInteraction (Stage2.execute e2)
    (Stage3,Eval) -> do putStr whoami; runInteraction (Stage3.execute e3)
    (Stage4,Eval) -> do putStr whoami; runInteraction (Stage4.execute e4)
    (Stage5,Eval) -> do putStr whoami; runInteraction (Stage5.execute e5 trace debug)

data Config = Config
  { paths :: [String]
  , mode :: Mode
  , stage :: Stage
  , trace :: Stage5.TraceFlag
  , debug :: Stage5.DebugFlag
  , measure :: Bool
  , ppp :: Stage1.PPPosFlag
  , ppu :: Stage1.PPUniqueFlag
  }

data Mode = Compile | Eval

data Stage
  = Stage0 -- AST: Built by the parser.
  | Stage1 -- EXP: Simplified expression language.
  | Stage2 -- NBE: Result of "Normalization by Evaluation".
  | Stage3 -- AST: A-Normal Form; free-vars identified.
  | Stage4 -- CCF: Closure-converted form; Runtime locations chosen (Global,Frame,Arg,Temp)
  | Stage5 -- ASM: Asm image (WIP)
  deriving (Eq,Ord)

parseCommandLine :: [String] -> Config
parseCommandLine = loop config0
  where
    config0 = Config { paths = [], mode = Eval
                     , stage = Stage5
                     , trace = Stage5.TraceOff
                     , debug = Stage5.DebugOff
                     , measure = False
                     , ppp = Stage1.PPPosOff
                     , ppu = Stage1.PPUniqueOff
                     }

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
      "-5":xs           -> loop config { stage = Stage5 } xs
      "-trace":xs       -> loop config { trace = Stage5.TraceOn } xs
      "-debug":xs       -> loop config { debug = Stage5.DebugOn } xs
      "-measure":xs     -> loop config { measure = True } xs
      "-ppp":xs         -> loop config { ppp = Stage1.PPPosOn } xs
      "-ppu":xs         -> loop config { ppu = Stage1.PPUniqueOn } xs
      ('-':flag):_      -> error (show ("unknown flag",flag))
      x:xs              -> loop config { paths = paths config ++ [x] } xs
