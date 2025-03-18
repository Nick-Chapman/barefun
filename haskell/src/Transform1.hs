module Transform1 (compile,execute) where

import Builtin (Builtin,evalBuiltin)
import Data.Map (Map)
import Exp1 (cUnit,cFalse,cTrue,cNil,cCons)
import Interaction (Interaction(..))
import Par4 (Position(..))
import Text.Printf (printf)
import Value (Value(..),tUnit,tFalse,tTrue,tNil,tCons)
import qualified Data.Map as Map
import qualified Exp1 as SRC

compile :: SRC.Prog -> Prog
compile = transProg initCenv

execute :: Prog -> Interaction
execute = executeProg

data Prog = Prog [Def] -- TODO: avoid Prog/defs by conversion to nested let-expressions
data Def = ValDef Id Exp

data Exp
  = Var (Maybe Position) Id
  | ConTag Ctag [Exp]
  | Lit Literal
  | App Exp Position Exp
  | Lam Id Exp
  | RecLam Id Id Exp
  | Let Id Exp Exp
  | Prim Builtin [Exp]
  | Case Exp [Arm]

data Arm = ArmTag Ctag [Id] Exp

type Ctag = Int
type Literal = SRC.Literal
type Id = SRC.Id
type Cid = SRC.Cid

transProg :: Cenv -> SRC.Prog -> Prog
transProg cenv (SRC.Prog defs) = Prog (walk cenv defs)
  where
    walk :: Cenv -> [SRC.Def] -> [Def]
    walk cenv = \case
      [] -> []
      SRC.ValDef name rhs : defs -> ValDef name (transExp cenv rhs) : walk cenv defs
      SRC.TypeDef cids : defs -> do
        let pairs = zip cids [0::Int .. ]
        let f (name,tag) cenv = Map.insert name tag cenv
        let cenv' = foldr f cenv pairs
        walk cenv' defs

transExp :: Cenv -> SRC.Exp -> Exp
transExp cenv e = trans e
  where
    transCid :: Cid -> Int
    transCid cid = maybe err id $ Map.lookup cid cenv
      where err = error (show ("Transform1.transCid",cid))

    trans :: SRC.Exp -> Exp
    trans = \case
      SRC.Let x rhs body -> Let x (trans rhs) (trans body)
      SRC.Lam x body -> Lam x (trans body)
      SRC.RecLam f x body -> RecLam f x (trans body)
      SRC.App e1 p e2 -> App (trans e1) p (trans e2)
      SRC.Var p x -> Var p x
      SRC.Con cid es -> ConTag (transCid cid) (map trans es)
      SRC.Lit x -> Lit x
      SRC.Case scrut arms -> Case (trans scrut) (map transArm arms)
      SRC.Prim b xs -> Prim b (map trans xs)

    transArm :: SRC.Arm -> Arm
    transArm (SRC.Arm cid xs e) = ArmTag (transCid cid) xs (trans e)

type Cenv = Map Cid Int

initCenv :: Cenv
initCenv = Map.fromList
  [ (cUnit, tUnit)
  , (cFalse, tFalse)
  , (cTrue, tTrue)
  , (cNil, tNil)
  , (cCons, tCons)
  ]


executeProg :: Prog -> Interaction
executeProg (Prog defs) = loop env0 defs
  where
    loop :: Env -> [Def] -> Interaction
    loop env@Env{venv} = \case

      [] -> do
        eval env mainApp $ \v ->
          IDebug (printf "Final value: %s\n" (show v))
          $ IDone

      ValDef name rhs : defs -> do
        eval env rhs $ \value -> do
          loop env { venv = Map.insert name value venv } defs

mainApp :: Exp
mainApp = App main noPos (ConTag tUnit [])
  where
    noPos = Position 0 0
    main = Var Nothing (SRC.Id "main")

evals :: Env -> [Exp] -> ([Value] -> Interaction) -> Interaction
evals env es k = case es of
  [] -> k []
  e:es -> do
    eval env e $ \v -> do
      evals env es $ \vs -> do
        k (v:vs)

eval :: Env -> Exp -> (Value -> Interaction) -> Interaction
eval env@Env{venv} = \case

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

  ConTag tag es -> \k -> do
    evals env es $ \vs -> do
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

            ArmTag tag xs body : arms -> do
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
  SRC.LitC c -> VChar c
  SRC.LitN n -> VNum n
  SRC.LitS s -> VString s

data Env = Env { venv :: Map Id Value }

env0 :: Env
env0 = Env { venv = Map.empty }
