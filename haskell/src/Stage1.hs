module Stage1
  ( Exp(..),Arm(..),Ctag(..),SRC.Literal(..),SRC.Id(..)
  , compile, execute, SRC.evalLit, SRC.apply
  ) where

import Builtin (Builtin,evalBuiltin)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Set (Set,member,union,(\\),singleton)
import Interaction (Interaction(..))
import Lines (Lines,juxComma,bracket,onHead,onTail,jux,indented)
import Par4 (Position(..))
import Stage0 (cUnit,cFalse,cTrue,cNil,cCons)
import Text.Printf (printf)
import Value (Value(..),tUnit,tFalse,tTrue,tNil,tCons)
import qualified Data.Map as Map
import qualified Data.Set as Set (fromList,unions,empty)
import qualified Stage0 as SRC

type Transformed = Exp

compile :: SRC.Prog -> Transformed
compile = transProg initCenv

execute :: Transformed -> Interaction
execute = executeExp

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

data Ctag = Ctag Int

type Literal = SRC.Literal
type Id = SRC.Id


transProg :: Cenv -> SRC.Prog -> Exp
transProg cenv (SRC.Prog defs) = walk cenv defs
  where
    walk :: Cenv -> [SRC.Def] -> Exp
    walk cenv = \case
      [] -> mainApp

      SRC.ValDef name rhs : defs -> do
        let body = walk cenv defs
        -- This looses top-level side effects, so should not really be done
        -- But in makes the examples small for compilation dev...
        if name `member` fvs body then Let name (transExp cenv rhs) body else body
        --Let name (transExp cenv rhs) body

      SRC.TypeDef cids : defs -> do
        let pairs = zip cids [0::Int .. ]
        let f (name,tag) cenv = Map.insert name tag cenv
        let cenv' = foldr f cenv pairs
        walk cenv' defs

    mainApp :: Exp
    mainApp = App main noPos (ConTag (Ctag tUnit) [])

    noPos = Position 0 0
    main = Var Nothing (SRC.Id "main")

transExp :: Cenv -> SRC.Exp -> Exp
transExp cenv e = trans e
  where
    transCid :: SRC.Cid -> Ctag
    transCid cid = Ctag $ maybe err id $ Map.lookup cid cenv
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

type Cenv = Map SRC.Cid Int

initCenv :: Cenv
initCenv = Map.fromList
  [ (cUnit, tUnit)
  , (cFalse, tFalse)
  , (cTrue, tTrue)
  , (cNil, tNil)
  , (cCons, tCons)
  ]


fvs :: Exp -> Set Id
fvs = \case
  Let x rhs body -> fvs rhs `union` (fvs body \\ singleton x)
  Lam x body -> fvs body \\ singleton x
  RecLam f x body -> fvs body \\ Set.fromList [f,x]
  App e1 _ e2 -> fvs e1 `union` fvs e2
  Var _ x -> singleton x
  ConTag _ es -> Set.unions (map fvs es)
  Lit _ -> Set.empty
  Case scrut arms -> fvs scrut `union` Set.unions (map fvsArm arms)
  Prim _ es -> Set.unions (map fvs es)
  where
    fvsArm (ArmTag _ xs exp) = fvs exp \\ Set.fromList xs


instance Show Exp where show = intercalate "\n" . pretty
instance Show Ctag where show (Ctag n) = printf "Tag_%d" n

pretty :: Exp -> Lines
pretty = \case
  Let x rhs body ->
    indented ("let " ++ show x ++ " =") (onTail (++ " in") (pretty rhs))
    ++ pretty body
  Lam x body ->
    bracket $
    indented ("fun " ++ show x ++ " ->") (pretty body)
  RecLam f x body ->
    onHead ("fix "++) $ bracket $
    indented ("fun " ++ show f ++ " " ++ show x ++ " ->") (pretty body)
  App e1 _ e2 ->
    bracket $
    jux (pretty e1) (pretty e2)
  Var _ x -> [show x]
  ConTag tag [] ->
    [show tag]
  ConTag tag es ->
    onHead (show tag ++) (bracket (foldl1 juxComma (map pretty es)))
  Lit x ->
    [show x]
  Case scrut arms ->
    (onHead ("match "++) . onTail (++ " with")) (pretty scrut)
    ++ concat (map prettyArm arms)
  Prim b xs -> do
    [printf "PRIM:%s%s" (show b) (show xs)]

prettyArm :: Arm -> Lines
prettyArm = \case
  ArmTag c xs rhs -> do
    indented ("| " ++ prettyPat c xs ++ " ->") (pretty rhs)

prettyPat :: Ctag -> [Id] -> String
prettyPat tag = \case
  [] -> show tag
  xs -> printf "%s(%s)" (show tag) (intercalate "," (map show xs))



executeExp :: Exp -> Interaction
executeExp exp =
  eval env0 exp $ \v ->
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
        SRC.apply v1 pos v2 k
  ConTag (Ctag tag) es -> \k -> do
    evals env es $ \vs -> do
      k (VCons tag vs)
  Lit literal -> \k -> do
    k (SRC.evalLit literal)
  Prim b es -> \k -> do
    evals env es $ \vs -> do
    evalBuiltin b vs k
  Case e arms0 -> \k -> do
    eval env e $ \case
      VCons tagActual vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] -> error "case match failure"
            ArmTag (Ctag tag) xs body : arms -> do
              if tag /= tagActual then dispatch arms else do
                if length xs /= length vArgs then error (show ("case arm mismatch",xs,vArgs)) else do
                  let env' = env { venv = foldr (uncurry Map.insert) venv (zip xs vArgs) }
                  eval env' body k
        dispatch arms0
      v ->
        error (printf "case/scrut not a constructed value: %s" (show v))

data Env = Env { venv :: Map Id Value }

env0 :: Env
env0 = Env { venv = Map.empty }
