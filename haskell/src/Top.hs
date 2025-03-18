module Top (main) where

import Interaction (runTerm)
import Parser (parseProg)
import Predefined (wrapPreDefs)
import Text.Printf (printf)
import System.Environment (getArgs)
import qualified Eval1 (executeProg)
import qualified Transform1 (compile,execute)

data Mode = M1 | M2

main :: IO ()
main = do
  putStrLn "[haskell]"
  path <- parseCommandLine <$> getArgs
  s <- readFile path

  let prog = wrapPreDefs (parseProg s)
  let _no :: IO () = printf "----------\n%s\n----------\nexecuting...\n" (show prog)

  let mode = M2
  case mode of

    M1 -> do
      -- execute Exp1 directly
      runTerm (Eval1.executeProg prog)

    M2 -> do
      -- compile to Exp2; then execute
      let e2 = Transform1.compile prog
      runTerm (Transform1.execute e2)

  pure ()

parseCommandLine :: [String] -> String
parseCommandLine = \case
  [path] -> path
  xs -> error (show ("parseCommandLine",xs))
