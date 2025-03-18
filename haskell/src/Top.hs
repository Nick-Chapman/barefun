module Top (main) where

import Eval1 (executeProg)
import Interaction (runTerm)
import Parser (parseProg)
import Predefined (wrapPreDefs)
import Text.Printf (printf)

main :: IO ()
main = do
  putStrLn "[haskell]"
  s <- readFile "example.fun" -- TODO: take filename for .fun program on command line
  let prog = wrapPreDefs (parseProg s)
  let _no :: IO () = printf "----------\n%s\n----------\nexecuting...\n" (show prog)
  runTerm (executeProg prog)
  pure ()
