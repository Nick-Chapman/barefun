module Top (main) where

import Builtin (Builtin(..),evalBuiltin)
import Data.Map (Map)
import Exp1 (Exp(..),Arm(..),Id(..),Literal(..))
import Interaction (Interaction(..),runTerm)
import Par4 (Position)
import Parser (parse1)
import Text.Printf (printf)
import Value (Value(..), Cid(..), initCenv)
import qualified Data.Map as Map

main :: IO ()
main = do
  putStrLn "[haskell]"
  s <- readFile "../example.fun"
  let e0 = parse1 s
  let e = wrapPrimDefs e0
  --printf "----------\n%s\n----------\nexecuting...\n" (show e)
  runTerm (execute e)
  pure ()

wrapPrimDefs :: Exp -> Exp
wrapPrimDefs body0 = foldr (\(name,rhs) body -> Let (Id name) rhs body) body0 bindings

bindings :: [(String,Exp)]
bindings =
  [ ("put_char", Lam x (Prim PutChar [ex]))
  , ("get_char", Lam x (Prim GetChar [ex]))
  , ("eq_char", Lam x (Lam y (Prim EqChar [ex,ey])))
  , ("eq_int", Lam x (Lam y (Prim EqInt [ex,ey])))
  , ("less_int", Lam x (Lam y (Prim LessInt [ex,ey])))
  , ("+", Lam x (Lam y (Prim AddInt [ex,ey])))
  , ("%", Lam x (Lam y (Prim ModInt [ex,ey])))
  , ("/", Lam x (Lam y (Prim DivInt [ex,ey])))
  , ("ord", Lam x (Prim CharOrd [ex]))
  , ("chr", Lam x (Prim CharChr [ex]))
  ]
  where
    ex = Var Nothing x
    ey = Var Nothing y
    x = Id "x"
    y = Id "y"

execute :: Exp -> Interaction
execute exp = eval env0 exp k0
  where
    env0 = Env { venv = Map.empty, cenv = initCenv}
    k0 v =
      IDebug (printf "Final value: %s\n" (show v))
      $ IDone


data Env = Env { venv :: Map Id Value, cenv :: Map Cid Int }

evals :: Env -> [Exp] -> ([Value] -> Interaction) -> Interaction
evals env es k = case es of
  [] -> k []
  e:es -> do
    eval env e $ \v -> do
      evals env es $ \vs -> do
        k (v:vs)

eval :: Env -> Exp -> (Value -> Interaction) -> Interaction
eval env@Env{venv,cenv} = \case

  Let x e1 e2 -> \k -> do
    eval env e1 $ \v1 -> do
      eval env { venv = Map.insert x v1 venv } e2 k

  Lam x body -> \k -> do
    k (VFunc (\arg k -> eval env { venv = Map.insert x arg venv } body k))

  RecLam f x body -> \k -> do
    let me = VFunc (\arg k -> eval env { venv = Map.insert f me (Map.insert x arg venv) } body k)
    k me

  Var pos x -> \k -> do
    k (maybe err id $ Map.lookup x venv)
      where err = error (show ("var-lookup",x,pos))

  App e1 pos e2 -> \k -> do
    eval env e1 $ \v1 -> do
      eval env e2 $ \v2 -> do
        apply v1 pos v2 k

  Con cid es -> \k -> do
    evals env es $ \vs -> do
    let tag = maybe err id $ Map.lookup cid cenv
          where err = error (show ("cenv-lookup",cid))
    if tag /= tag then undefined else -- strictness hack -- TODO: how to do this properly?
      k (VCons tag vs)

  Lit literal -> \k -> do
    k (evalLit literal)

  Prim b es -> \k -> do
    evals env es $ \vs -> do
    evalBuiltin b vs k

  Case e arms0 -> \k -> do
    eval env e $ \case

      VCons tagActual vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] ->
              error "case match failure"

            Arm cid xs body : arms -> do
              let tag = maybe err id $ Map.lookup cid cenv
                    where err = error (show ("cenv-lookup",cid))
              if tag /= tagActual then dispatch arms else do
                if length xs /= length vArgs then error (show ("case arm mismatch",xs,vArgs)) else do
                  let env' = env { venv = foldr (uncurry Map.insert) venv (zip xs vArgs) }
                  eval env' body k

        dispatch arms0

      v ->
        error (printf "case/scrut not a constructed value: %s" (show v))

apply :: Value -> Position -> Value -> (Value -> Interaction) -> Interaction
apply func p arg k = do
  case func of
    VFunc f -> f arg k
    v -> error (show ("apply",v,p))

evalLit :: Literal -> Value
evalLit = \case
  LitC c -> VChar c
  LitN n -> VNum n
