module Eval0 (executeProg) where

import Builtin (evalBuiltin)
import Data.Map (Map)
import Exp0 (Prog,Def,Exp,Arm,Literal,Id,Cid)
import Interaction (Interaction(..))
import Par4 (Position(..))
import Predefined (cUnit,cFalse,cTrue,cNil,cCons)
import Text.Printf (printf)
import Value (Value(..),tUnit,tFalse,tTrue,tNil,tCons)
import qualified Data.Map as Map
import qualified Exp0 as AST

executeProg :: Prog -> Interaction
executeProg (AST.Prog defs) = loop env0 defs
  where
    loop :: Env -> [Def] -> Interaction
    loop env@Env{venv,cenv} = \case

      [] -> do
        eval env mainApp $ \v ->
          IDebug (printf "Final value: %s\n" (show v))
          $ IDone

      AST.ValDef name rhs : defs -> do
        eval env rhs $ \value -> do
          loop env { venv = Map.insert name value venv } defs

      AST.TypeDef cids : defs -> do
        let pairs = zip cids [0::Int .. ]
        let f (name,tag) cenv = Map.insert name tag cenv
        let cenv' = foldr f cenv pairs
        let env' = env { cenv = cenv' }
        loop env' defs

mainApp :: Exp
mainApp = AST.App main noPos (AST.Con cUnit [])
  where
    noPos = Position 0 0
    main = AST.Var Nothing (AST.Id "main")

evals :: Env -> [Exp] -> ([Value] -> Interaction) -> Interaction
evals env es k = case es of
  [] -> k []
  e:es -> do
    eval env e $ \v -> do
      evals env es $ \vs -> do
        k (v:vs)

eval :: Env -> Exp -> (Value -> Interaction) -> Interaction
eval env@Env{venv,cenv} = \case

  AST.Let x e1 e2 -> \k -> do
    eval env e1 $ \v1 -> do
      eval env { venv = Map.insert x v1 venv } e2 k

  AST.Lam x body -> \k -> do
    k (VFunc (\arg k -> eval env { venv = Map.insert x arg venv } body k))

  AST.RecLam f x body -> \k -> do
    let me = VFunc (\arg k -> eval env { venv = Map.insert f me (Map.insert x arg venv) } body k)
    k me

  AST.Var pos x -> \k -> do
    k (maybe err id $ Map.lookup x venv)
      where err = error (show ("var-lookup",x,pos))

  AST.App e1 pos e2 -> \k -> do
    eval env e1 $ \v1 -> do
      eval env e2 $ \v2 -> do
        apply v1 pos v2 k

  AST.Con cid es -> \k -> do
    evals env es $ \vs -> do
    let tag = maybe err id $ Map.lookup cid cenv
          where err = error (show ("cenv-lookup",cid))
    k (VCons tag vs)

  AST.Lit literal -> \k -> do
    k (evalLit literal)

  AST.Prim b es -> \k -> do
    evals env es $ \vs -> do
    evalBuiltin b vs k

  AST.Case e arms0 -> \k -> do
    eval env e $ \case

      VCons tagActual vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] ->
              error "case match failure"

            AST.Arm cid xs body : arms -> do
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
  AST.LitC c -> VChar c
  AST.LitN n -> VNum n
  AST.LitS s -> VString s

data Env = Env { venv :: Map Id Value, cenv :: Map Cid Int }

env0 :: Env
env0 = Env { venv = Map.empty, cenv = initCenv}

initCenv :: Map Cid Int
initCenv = Map.fromList
  [ (cUnit, tUnit)
  , (cFalse, tFalse)
  , (cTrue, tTrue)
  , (cNil, tNil)
  , (cCons, tCons)
  ]
