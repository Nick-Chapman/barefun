module Top (main) where

import Exp1 (Exp(..),Id(..),Cid,Literal(..),Builtin(..))
import Parser (parse1)
import Text.Printf (printf)
import Par4 (Position)

import Data.Map (Map)
import qualified Data.Map as Map

main :: IO ()
main = do
  putStrLn "*barefun*"
  s <- readFile "example.fun"
  let e0 = parse1 s
  let e = wrapPrimDefs e0
  printf "----------\n%s\n----------\n" (show e)
  putStrLn "executing..."
  run (exec e) -- TODO: reinstate after parse/PP is good
  pure ()


wrapPrimDefs :: Exp -> Exp
wrapPrimDefs userExp =
  Let (Id "put_char") putCharExp userExp

putCharExp :: Exp
putCharExp = Lam x (Prim PutChar [x])
  where x = Id "x"

run :: Interaction -> IO ()
run i = loop i
  where
    loop = \case
      IPut c i -> do
        printf "Put: %s\n" (show c)
        loop i
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
  eval Map.empty exp0 k0
  where
    k0 v =
      IDebug (printf "Final value: %s\n" (show v))
      $ IDone

    evals :: Env -> [Exp] -> ([Value] -> Interaction) -> Interaction
    evals env es k = case es of
      [] -> k []
      e:es -> undefined e es env

    eval :: Env -> Exp -> (Value -> Interaction) -> Interaction
    eval env e k = case e of

      Let x e1 e2 -> do
        eval env e1 $ \v1 -> do
        eval (Map.insert x v1 env) e2 k

      Lam x e -> do
        k (VClosure env x e)

      Var pos x -> do
        k (maybe err id $ Map.lookup x env)
          where err = error (show ("var-lookup",x,pos))

      App e1 pos e2 -> do
        eval env e1 $ \v1 -> do
          eval env e2 $ \v2 -> do
            apply v1 pos v2 k

      Con c es ->
        evals env es $ \vs -> do
        k (VCons c vs)

      Lit (LitC c) ->
        k (VChar c)

      Prim PutChar [x] -> do
        let e = Var Nothing x
        eval env e $ \v -> do
          case v of
            VChar c -> IPut c (k VUnit)
            _ -> error "PutChar/expected char"

      Prim b xs ->
        error (show ("prim/wrong#args",b,length xs))

      Case e as ->
        undefined e as


    apply :: Value -> Position -> Value -> (Value -> Interaction) -> Interaction
    apply func p arg k = do
      let err tag = error (show ("apply",tag,p))
      case func of
        VUnit -> err "unit"
        VCons{} -> err "cons"
        VChar{} -> err "char"
        VClosure env x body -> do
          eval (Map.insert x arg env) body k


type Env = Map Id Value

data Value
  = VUnit
  | VCons Cid [Value]
  | VChar Char
  | VClosure Env Id Exp

instance Show Value where
  show = \case
    VUnit -> "[unit]"
    VCons c vs -> printf "[vcons:%s:%s]" (show c) (show vs)
    VChar c -> printf"[char:%c]" (show c)
    VClosure{} -> "[closure]"
