module Top (main) where

import Builtin (Builtin(..),evalBuiltin)
import Data.Map (Map)
import Exp1 (Exp(..),Arm(..),Id(..),Literal(..))
import Interaction (Interaction(..),runTerm)
import Par4 (Position)
import Parser (parse1)
import Text.Printf (printf)
import Value (Value(..))
import qualified Data.Map as Map

main :: IO ()
main = do
  putStrLn "[haskell]"
  s <- readFile "../example.fun"
  let e0 = parse1 s
  let e = wrapPrimDefs e0
  --printf "----------\n%s\n----------\nexecuting...\n" (show e)
  runTerm (exec e)
  pure ()

wrapPrimDefs :: Exp -> Exp
wrapPrimDefs userExp =
  Let (Id "put_char") putCharExp $
  Let (Id "get_char") getCharExp $
  Let (Id "eq_char") eqCharExp $
  userExp
  where
    x = Id "x"
    y = Id "y"
    putCharExp = Lam x (Prim PutChar [x])
    getCharExp = Lam x (Prim GetChar [x])
    eqCharExp = Lam x (Lam y (Prim EqChar [x,y]))


type Env = Map Id Value

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
      e:es -> do
        eval env e $ \v -> do
          evals env es $ \vs -> do
            k (v:vs)

    eval :: Env -> Exp -> (Value -> Interaction) -> Interaction
    eval env = \case

      Let x e1 e2 -> \k -> do
        eval env e1 $ \v1 -> do
        eval (Map.insert x v1 env) e2 k

      Lam x body -> \k -> do
        k (VFunc (\arg k -> eval (Map.insert x arg env) body k))

      RecLam f x body -> \k -> do
        let me = VFunc (\arg k -> eval (Map.insert f me (Map.insert x arg env)) body k)
        k me

      Var pos x -> \k -> do
        k (maybe err id $ Map.lookup x env)
          where err = error (show ("var-lookup",x,pos))

      App e1 pos e2 -> \k -> do
        eval env e1 $ \v1 -> do
          eval env e2 $ \v2 -> do
            apply v1 pos v2 k

      Con c es -> \k -> do
        evals env es $ \vs -> do
        k (VCons c vs)

      Lit (LitC c) -> \k -> do
        k (VChar c)

      Prim b xs -> \k -> do
        let es = [ Var Nothing x | x <- xs ] -- TODO: wont be needed when Prim contains expressions
        evals env es $ \vs -> do
        evalBuiltin b vs k

      Case e arms0 -> \k -> do
        eval env e $ \v -> do
          case v of
            VCons cidActual vArgs -> do
              let
                dispatch :: [Arm] -> Interaction
                dispatch arms = case arms of
                  [] ->
                    error "case match failure"

                  Arm cid xs body : arms ->
                    if cid /= cidActual then dispatch arms else do
                      if length xs /= length vArgs then error (show ("case arm mismatch",xs,vArgs)) else do
                        let env' = foldr (uncurry Map.insert) env (zip xs vArgs)
                        eval env' body k

              dispatch arms0

            _ ->
              error "case/scrut not a constructed value"


    apply :: Value -> Position -> Value -> (Value -> Interaction) -> Interaction
    apply func p arg k = do
      --IDebug (printf "apply: %s @ %s\n" (show func) (show arg)) $ do
      let err tag = error (show ("apply",tag,p))
      case func of
        VCons{} -> err "cons"
        VChar{} -> err "char"
        VFunc f -> f arg k
