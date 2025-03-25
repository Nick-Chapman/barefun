-- | Primary AST for the .fun language. As constructed by Parser
module Stage0
  ( Prog(..),Def(..),Exp(..),Arm(..),Literal(..),Id(..),Cid(..)
  , cUnit,cFalse,cTrue,cNil,cCons,mkUserId
  , execute,evalLit,apply
  ) where

import Builtin (Builtin,evalBuiltin)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Word (Word16)
import Interaction (Interaction(..))
import Lines (Lines,juxComma,bracket,onHead,onTail,jux,indented)
import Par4 (Position(..))
import Text.Printf (printf)
import Value (Value(..),tUnit,tFalse,tTrue,tNil,tCons,deUnit)
import qualified Data.Map as Map

data Prog = Prog [Def]
data Def = ValDef Id Exp | TypeDef [Cid]

data Exp
  = Var Position Id
  | Lit Literal
  | Con Cid [Exp]
  | Prim Builtin [Exp]
  | Lam Id Exp
  | RecLam Id Id Exp
  | App Exp Position Exp
  | Let Id Exp Exp
  | Case Exp [Arm]

data Arm = Arm Cid [Id] Exp
data Cid = Cid String deriving (Eq,Ord)
data Literal = LitC Char | LitN Word16 | LitS String

data Id = Id
  { optUniqueForGeneratedNames :: Maybe Int
  , optPosForGenNames :: Maybe Position
  , userGivenName :: String
  } deriving (Eq,Ord)

cUnit,cFalse,cTrue,cNil,cCons :: Cid
cUnit = Cid "Unit"
cTrue = Cid "true"
cFalse = Cid "false"
cNil = Cid "Nil"
cCons = Cid "Cons"


mkUserId :: String -> Id
mkUserId userGivenName =
  Id { optUniqueForGeneratedNames = Nothing, optPosForGenNames = Nothing, userGivenName }

----------------------------------------------------------------------
-- Show

instance Show Prog where show (Prog defs) = intercalate "\n" (map show defs)
instance Show Def where show = intercalate "\n" . prettyDef
instance Show Exp where show = intercalate "\n" . pretty
instance Show Id where show = prettyId

instance Show Cid where show (Cid s) = s
instance Show Literal where
  show = \case
    LitC c -> show c
    LitN n -> show n
    LitS s -> show s

prettyId :: Id -> String
prettyId Id{userGivenName,optUniqueForGeneratedNames} =
  maybeTag (maybeBracket userGivenName)
  where
    maybeTag s = case optUniqueForGeneratedNames of Nothing -> s; Just n -> printf "%s%d" s n
    maybeBracket s = if needBracket s then printf "( %s )" s else s
    needBracket = \case "*" -> True; _ -> False -- TODO: all infixes?

prettyDef :: Def -> Lines
prettyDef = \case
  ValDef x rhs -> onHead (("let " ++ show x ++ " = ")++) (onTail (++ " in") (pretty rhs))
  TypeDef cids -> ["type _ = " ++ intercalate " | " (map show cids)]

pretty :: Exp -> Lines
pretty = \case
  Var _ x -> [show x]
  Lit x -> [show x]
  Con c [] -> [show c]
  Con c es -> onHead (show c ++) (bracket (foldl1 juxComma (map pretty es)))
  Prim b xs -> [printf "PRIM_%s(%s)" (show b) (intercalate "," (map show xs))]
  Lam x body -> bracket $ indented ("fun " ++ show x ++ " ->") (pretty body)
  RecLam f x body -> onHead ("fix "++) $ bracket $ indented ("fun " ++ show f ++ " " ++ show x ++ " ->") (pretty body)
  App e1 _ e2 -> bracket $ jux (pretty e1) (pretty e2)
  Let x rhs body -> onHead (("let " ++ show x ++ " = ")++) (onTail (++ " in") (pretty rhs)) ++ pretty body
  Case scrut arms -> (onHead ("match "++) . onTail (++ " with")) (pretty scrut) ++ concat (map prettyArm arms)

prettyArm :: Arm -> Lines
prettyArm (Arm c xs rhs) = indented ("| " ++ prettyPat c xs ++ " ->") (pretty rhs)

prettyPat :: Cid -> [Id] -> String
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
    loop env@Env{venv,cenv} = \case
      [] -> do
        eval env mainApp $ \v -> case deUnit v of () -> IDone
      ValDef name rhs : defs -> do
        eval env rhs $ \value -> do
          loop env { venv = Map.insert name value venv } defs
      TypeDef cids : defs -> do
        let pairs = zip cids [0::Int .. ]
        let f (name,tag) cenv = Map.insert name tag cenv
        let cenv' = foldr f cenv pairs
        let env' = env { cenv = cenv' }
        loop env' defs

mainApp :: Exp
mainApp = App main noPos (Con cUnit [])
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
  Lit literal -> \k -> do
    k (evalLit literal)
  Con cid es -> \k -> do
    evals env es $ \vs -> do
    let tag = maybe err id $ Map.lookup cid cenv
          where err = error (show ("cenv-lookup",cid))
    k (VCons tag vs)
  Prim b es -> \k -> do
    evals env es $ \vs -> do
    evalBuiltin b vs k
  Lam x body -> \k -> do
    k (VFunc (\arg k -> eval env { venv = Map.insert x arg venv } body k))
  RecLam f x body -> \k -> do
    let me = VFunc (\arg k -> eval env { venv = Map.insert f me (Map.insert x arg venv) } body k)
    k me
  App e1 pos e2 -> \k -> do
    eval env e1 $ \v1 -> do
      eval env e2 $ \v2 -> do
        apply v1 pos v2 k
  Let x e1 e2 -> \k -> do
    eval env e1 $ \v1 -> do
      eval env { venv = Map.insert x v1 venv } e2 k
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
  LitS s -> VString s

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
