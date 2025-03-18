module Top (main) where

import Interaction (runTerm)
import Parser (parseProg)
import Predefined (wrapPreDefs)
import Text.Printf (printf)

import qualified Eval1 (executeProg)
import qualified Transform1 (compile,execute)

main :: IO ()
main = do
  putStrLn "[haskell]"
  s <- readFile "example.fun" -- TODO: take filename for .fun program on command line
  let prog = wrapPreDefs (parseProg s)
  let _no :: IO () = printf "----------\n%s\n----------\nexecuting...\n" (show prog)

  -- execute Exp1 directly
  let _ = runTerm (Eval1.executeProg prog)

  -- compile to Exp2; then execute
  let e2 = Transform1.compile prog
  runTerm (Transform1.execute e2)

  pure ()
