module Top where

import Exp1 (Exp(..),Id(..))
import Parser (parse1)
import Text.Printf (printf)

import Data.Map (Map)
import qualified Data.Map as Map

main :: IO ()
main = do
  putStrLn "*barefun*"
  s <- readFile "example.fun"
  let e = parse1 s
  --let _no :: IO () =
  printf "----------\n%s\n----------\n" (show e)
  putStrLn "executing..."
  run (exec e) -- TODO: reinstate after parse/PP is good
  pure ()

run :: Interaction -> IO ()
run i = loop i
  where
    loop = \case
      IPut c i -> undefined c i
      IGet f -> undefined f
      IDone -> pure ()
      IDebug mes i -> do
        printf "debug: %s" mes
        loop i

data Interaction
  = IPut Char Interaction
  | IGet (Char -> Interaction)
  | IDone
  | IDebug String Interaction

exec :: Exp -> Interaction
exec exp0 =
  inner env0 exp0 k0 -- TODO: apply to unit at the top level
  where
    k0 v =
      IDebug (printf "Final value: %s\n" (show v))
      $ IDone

    env0 = Map.empty

    inner :: Env -> Exp -> (Value -> Interaction) -> Interaction
    inner q e k = case e of

      Let x e1 e2 ->
        inner q e1 $ \v1 -> do
        let q' = Map.insert x v1 q
        inner q' e2 k

      Lam x e -> do
        let v = Closure q x e
        k v

      Var pos x -> do
        let v = maybe err id $ Map.lookup x q
              where err = error (show ("exec",x,pos)) -- TODO: show location of the var reference
        k v

      Con c es -> undefined c es
      Lit x -> undefined x
      App e1 e2 -> undefined e1 e2

      Prim b es -> undefined b es
      Case e as -> undefined e as

type Env = Map Id Value

data Value
  = Closure Env Id Exp

instance Show Value where
  show = \case
    Closure{} -> "<closure>"
