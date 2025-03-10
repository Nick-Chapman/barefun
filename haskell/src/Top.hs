module Top where

import Exp1 (Exp(..))
import Parser (parse1)
import Text.Printf (printf)

main :: IO ()
main = do
  putStrLn "*barefun*"
  s <- readFile "example.fun"
  let e = parse1 s
  printf "----------\n%s\n----------\n" (show e)
  let _ = run (exec e) -- TODO: reinstate after parse/PP is good
  pure ()

run :: Interaction -> IO ()
run i = loop i
  where
    loop = \case
      IPut c i -> undefined c i
      IGet f -> undefined f
      IDone -> undefined

data Interaction = IPut Char Interaction | IGet (Char -> Interaction) | IDone

exec :: Exp -> Interaction
exec exp0 = inner env0 exp0 k0
  where
    k0 = undefined
    env0 = undefined
    inner :: Env -> Exp -> (Value -> Interaction) -> Interaction
    inner q e k = case e of
      Var x -> undefined x q k
      Con c es -> undefined c es
      Lit x -> undefined x
      App e1 e2 -> undefined e1 e2
      Lam x e -> undefined x e
      Let x e1 e2 -> undefined x e1 e2
      Prim b es -> undefined b es
      Case e as -> undefined e as

data Env

data Value
