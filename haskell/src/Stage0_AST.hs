-- | Primary AST constructed by the ".fun" parser.
module Stage0_AST
  ( Prog(..),Def(..),Exp(..),Arm(..),Literal(..),Id(..),Cid(..),Bid(..)
  , mkUserId
  , execute,evalLit,apply,applyN
  ) where

import Primitive (Primitive,executePrimitive)
import Data.List (intercalate)
import Data.Map (Map)
import Lines (Lines,juxComma,bracket,onHead,onTail,jux,indented)
import Par4 (Position(..))
import Text.Printf (printf)
import Value (Interaction(..))
import Value (Value(..),Number,tUnit,tFalse,tTrue,tNil,tCons,deUnit,Ctag(..),Cid(..))
import Value (cUnit,cFalse,cTrue,cNil,cCons)
import qualified Data.Map as Map
import qualified Value as I (Tickable(Prim,App))

data Prog = Prog [Def]
data Def = ValDef Bid Exp | TypeDef [Cid]

data Exp
  = Var Position Id
  | Lit Position Literal
  | Con Position Cid [Exp]
  | Prim Position Primitive [Exp]
  | Lam Position Bid Exp
  | RecLam Position Bid Bid Exp
  | App Exp Position Exp
  | Let Position Bid Exp Exp
  | Match Position Exp [Arm]

data Arm = Arm Position Cid [Bid] Exp
data Literal = LitC Char | LitN Number | LitS String

data Id = Id { name :: String } deriving (Eq,Ord)

mkUserId :: String -> Id
mkUserId name = Id { name }

data Bid = Bid Position Id -- we always know the position of a bound identifier...
instance Show Bid where show (Bid _ x) = show x -- ...but we never show it!

----------------------------------------------------------------------
-- Show

instance Show Prog where show (Prog defs) = intercalate "\n" (map show defs)
instance Show Def where show = intercalate "\n" . prettyDef
instance Show Exp where show = intercalate "\n" . pretty

instance Show Id where
  show Id{name} = maybeBracket name
    where
      maybeBracket s = if needBracket s then printf "( %s )" s else s
      needBracket = \case "*" -> True; _ -> False

instance Show Literal where
  show = \case
    LitC c -> show c
    LitN n -> show n
    LitS s -> show s

prettyDef :: Def -> Lines
prettyDef = \case
  ValDef x rhs -> indented ("let " ++ show x ++ " =") (onTail (++ " in") (pretty rhs))
  TypeDef cids -> ["type _ = " ++ intercalate " | " (map show cids)]

pretty :: Exp -> Lines
pretty = \case
  Var _ x -> [show x]
  Lit _ x -> [show x]
  Con _ c [] -> [show c]
  Con _ c es -> onHead (show c ++) (bracket (foldl1 juxComma (map pretty es)))
  Prim _ p xs -> [printf "PRIM_%s(%s)" (show p) (intercalate "," (map show xs))]
  Lam _ x body -> bracket $ indented ("fun " ++ show x ++ " ->") (pretty body)
  RecLam _ f x body -> onHead ("fix "++) $ bracket $ indented ("fun " ++ show f ++ " " ++ show x ++ " ->") (pretty body)
  App e1 _ e2 -> bracket $ jux (pretty e1) (pretty e2)
  Let _ x rhs body -> indented ("let " ++ show x ++ " =") (onTail (++ " in") (pretty rhs)) ++ pretty body
  Match _ scrut arms -> (onHead ("match "++) . onTail (++ " with")) (pretty scrut) ++ concat (map prettyArm arms)

prettyArm :: Arm -> Lines
prettyArm (Arm _pos c xs rhs) = indented ("| " ++ prettyPat c xs ++ " ->") (pretty rhs)

prettyPat :: Cid -> [Bid] -> String
prettyPat c = \case
  [] -> show c
  xs -> printf "%s(%s)" (show c) (intercalate "," (map show xs))

----------------------------------------------------------------------
-- Execute

execute :: Prog -> Interaction
execute = executeProg

executeProg :: Prog -> Interaction
executeProg (Prog defs) = loop env0 defs
  where
    loop :: Env -> [Def] -> Interaction
    loop env@Env{cenv} = \case
      [] -> do
        eval env mainApp $ \v -> case deUnit v of () -> IDone
      ValDef x rhs : defs -> do
        eval env rhs $ \value -> do
          loop (insert x value env) defs
      TypeDef cids : defs -> do
        let pairs = zip cids [0::Number .. ]
        let f (name,tag) cenv = Map.insert name (Ctag name tag) cenv
        let cenv' = foldr f cenv pairs
        let env' = env { cenv = cenv' }
        loop env' defs

mainApp :: Exp
mainApp = App main noPos (Con noPos cUnit [])
  where
    noPos = Position 0 0
    main = Var noPos (mkUserId "main")

evals :: Env -> [Exp] -> ([Value] -> Interaction) -> Interaction
evals env es k = case es of
  [] -> k []
  e:es -> do
    eval env e $ \v -> do
      evals env es $ \vs -> do
        k (v:vs)

eval :: Env -> Exp -> (Value -> Interaction) -> Interaction
eval env@Env{venv,cenv} = \case
  Var pos x -> \k -> do
    k (maybe err id $ Map.lookup x venv)
      where err = error (show ("var-lookup",x,pos))
  Lit _ literal -> \k -> do
    k (evalLit literal)
  Con _ cid es -> \k -> do
    evals env es $ \vs -> do
    let tag = maybe err id $ Map.lookup cid cenv
          where err = error (show ("cenv-lookup",cid))
    k (VCons tag vs)
  Prim _ prim es -> \k -> do
    evals env es $ \vs -> ITick I.Prim $ do
      executePrimitive prim vs k
  Lam _ x body -> \k -> do
    k (VFunc (\arg k -> eval (insert x arg env) body k))
  RecLam _ f x body -> \k -> do
    let me = VFunc (\arg k -> eval (insert f me (insert x arg env)) body k)
    k me
  App e1 pos e2 -> \k -> do
    eval env e1 $ \v1 -> do
      eval env e2 $ \v2 -> do
        ITick I.App $ apply v1 pos v2 k
  Let _ x e1 e2 -> \k -> do
    eval env e1 $ \v1 -> do
      eval (insert x v1 env) e2 k
  Match _ e arms0 -> \k -> do
    eval env e $ \case
      VCons tagActual vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] ->
              error "case match failure"
            Arm pos cid xs body : arms -> do
              let tag = maybe err id $ Map.lookup cid cenv
                    where err = error (show ("cenv-lookup",cid))
              if tag /= tagActual then dispatch arms else do
                if length xs /= length vArgs then error (show ("case arm mismatch",pos,xs,vArgs)) else do
                  let env' = foldr (uncurry insert) env (zip xs vArgs)
                  eval env' body k
        dispatch arms0
      v ->
        error (printf "case/scrut not a constructed value: %s" (show v))

insert :: Bid -> Value -> Env -> Env
insert (Bid _ x) v env@Env{venv} = env { venv = Map.insert x v venv }

apply :: Value -> Position -> Value -> (Value -> Interaction) -> Interaction
apply func p arg k = do
  case func of
    VFunc f -> f arg k
    v -> error (show ("apply",v,p))

applyN :: Value -> Position -> [Value] -> (Value -> Interaction) -> Interaction
applyN func pos args k = do
  case args of
    [] -> k func
    arg:args -> apply func pos arg $ \fa -> applyN fa pos args k

evalLit :: Literal -> Value
evalLit = \case
  LitC c -> VChar c
  LitN n -> VNum n
  LitS s -> VString s

data Env = Env { venv :: Map Id Value, cenv :: Map Cid Ctag }

env0 :: Env
env0 = Env { venv = Map.empty, cenv = initCenv }

initCenv :: Map Cid Ctag
initCenv = Map.fromList
  [ (cUnit, tUnit)
  , (cFalse, tFalse)
  , (cTrue, tTrue)
  , (cNil, tNil)
  , (cCons, tCons)
  ]
