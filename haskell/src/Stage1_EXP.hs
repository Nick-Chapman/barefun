-- | Simplifed expression language. Constructor names replaced by tags.
module Stage1_EXP
  ( Exp(..),Arm(..),Ctag(..),Id(..), Name(..), provenanceExp, sizeExp
  , execute
  , compile
  ) where

import Builtin (Builtin,executeBuiltin)
import Data.List (intercalate)
import Data.Map (Map)
import Interaction (Interaction(..))
import Lines (Lines,juxComma,bracket,onHead,onTail,jux,indented)
import Par4 (Position(..))
import Stage0_AST (cUnit,cFalse,cTrue,cNil,cCons,evalLit,apply,Literal,Cid,Bid(..))
import Text.Printf (printf)
import Value (Value(..),Number,tUnit,tFalse,tTrue,tNil,tCons,deUnit)
import qualified Data.Map as Map
import qualified Interaction as I (Tickable(Prim,App))
import qualified Stage0_AST as SRC

type Transformed = Exp

data Exp
  = Var Position Id
  | Lit Position Literal
  | ConTag Position Ctag [Exp]
  | Prim Position Builtin [Exp]
  | Lam Position Id Exp
  | RecLam Position Id Id Exp
  | App Exp Position Exp
  | Let Position Id Exp Exp
  | Case Position Exp [Arm]

data Arm = ArmTag Position Ctag [Id] Exp
data Ctag = Ctag Cid Number

data Id = Id
  { optUnique :: Maybe Int
  , optPos :: Maybe Position
  , name :: Name
  } deriving (Eq,Ord)

data Name = UserName SRC.Id | GeneratedName String deriving (Eq,Ord)

----------------------------------------------------------------------
-- size

sizeExp :: Exp -> Int
sizeExp = \case
  Var{} -> 1
  Lit{} -> 1
  ConTag _ _ es -> 1 + sum (map sizeExp es)
  Prim _ _ es -> 1 + sum (map sizeExp es)
  Lam _ _ body -> 1 + sizeExp body
  RecLam _ _ _ body -> 2 + sizeExp body
  App e1 _ e2 -> sizeExp e1 + sizeExp e2
  Let _ _ rhs body -> 1 + sizeExp rhs + sizeExp body
  Case _ scrut arms -> sizeExp scrut + sum [ 1 + length xs + sizeExp rhs | ArmTag _pos _tag xs rhs <- arms ]

----------------------------------------------------------------------
-- provenance

provenanceExp :: Exp -> (String,Maybe Position)
provenanceExp = \case
  Var{} -> error "provenanceExp/Var" -- we never call on a Var
  App _ pos _ -> ("app", Just pos)
  Lit pos _ -> ("lit",Just pos)
  ConTag pos _ _ -> ("con",Just pos)
  Lam pos _ _ -> ("lam",Just pos)

  Let pos _ _ _ -> ("uLET", Just pos)
  Prim pos _ _ -> ("prim", Just pos)
  RecLam pos _ _ _ -> ("reclam",Just pos)
  Case pos _ _ -> ("case",Just pos)

----------------------------------------------------------------------
-- Show

instance Show Id where show = prettyId
instance Show Exp where show = intercalate "\n" . pretty
instance Show Ctag where show (Ctag cid n) = printf "%s%s" (show cid) (show n)

instance Show Name where
  show = \case
    UserName s -> show s
    GeneratedName s -> s

pretty :: Exp -> Lines
pretty = \case
  Var _ x -> [show x]
  Lit _ x -> [show x]
  ConTag _ tag [] -> [show tag]
  ConTag _ tag es -> onHead (show tag ++) (bracket (foldl1 juxComma (map pretty es)))
  Prim _ b xs -> [printf "PRIM_%s(%s)" (show b) (intercalate "," (map show xs))]
  Lam _ x body -> bracket $ indented ("fun " ++ show x ++ " ->") (pretty body)
  RecLam _ f x body -> onHead ("fix "++) $ bracket $ indented ("fun " ++ show f ++ " " ++ show x ++ " ->") (pretty body)
  App e1 _ e2 -> bracket $ jux (pretty e1) (pretty e2)
  Let _ x rhs body -> indented ("let " ++ show x ++ " =") (onTail (++ " in") (pretty rhs)) ++ pretty body
  Case _ scrut arms -> (onHead ("match "++) . onTail (++ " with")) (pretty scrut) ++ concat (map prettyArm arms)

prettyArm :: Arm -> Lines
prettyArm (ArmTag _pos c xs rhs) = indented ("| " ++ prettyPat c xs ++ " ->") (pretty rhs)

prettyPat :: Ctag -> [Id] -> String
prettyPat c = \case
  [] -> show c
  xs -> printf "%s(%s)" (show c) (intercalate "," (map show xs))

prettyId :: Id -> String
prettyId Id{name,optUnique,optPos} =
  maybePos (maybeTag (maybeBracket (show name)))
  where
    verbose = False
    maybePos s =
      case name of
        UserName{} ->
          if not verbose then s else
            case optPos of
              Nothing -> printf "%s_NoPos" s
              Just pos -> printf "%s_%s" s (show pos)
        GeneratedName{} ->
          case optPos of
            Nothing -> printf "%s_NoPos" s
            Just pos -> printf "%s_%s" s (show pos)

    maybeTag s =
      case optUnique of
        Nothing -> s
        Just n ->
          if not verbose then s else
            printf "%s_%d" s n

    maybeBracket s = if needBracket s then printf "( %s )" s else s
    needBracket = \case "*" -> True; _ -> False

----------------------------------------------------------------------
-- Execute

execute :: Transformed -> Interaction
execute = eval0

eval0 :: Exp -> Interaction
eval0 exp = eval env0 exp $ \v -> case deUnit v of () -> IDone

evals :: Env -> [Exp] -> ([Value] -> Interaction) -> Interaction
evals env es k = case es of
  [] -> k []
  e:es -> do
    eval env e $ \v -> do
      evals env es $ \vs -> do
        k (v:vs)

eval :: Env -> Exp -> (Value -> Interaction) -> Interaction
eval env@Env{venv} = \case
  Var pos x -> \k -> do
    k (maybe err id $ Map.lookup x venv)
      where err = error (show ("var-lookup",x,pos))
  Lit _ literal -> \k -> do
    k (evalLit literal)
  ConTag _ (Ctag _ tag) es -> \k -> do
    evals env es $ \vs -> do
      k (VCons tag vs)
  Prim _ b es -> \k -> do
    evals env es $ \vs -> ITick I.Prim $ do
      executeBuiltin b vs k
  Lam _ x body -> \k -> do
    k (VFunc (\arg k -> eval env { venv = Map.insert x arg venv } body k))
  RecLam _ f x body -> \k -> do
    let me = VFunc (\arg k -> eval env { venv = Map.insert f me (Map.insert x arg venv) } body k)
    k me
  App e1 pos e2 -> \k -> do
    eval env e1 $ \v1 -> do
      eval env e2 $ \v2 -> do
        ITick I.App $ apply v1 pos v2 k
  Let _ x e1 e2 -> \k -> do
    eval env e1 $ \v1 -> do
      eval env { venv = Map.insert x v1 venv } e2 k
  Case _ e arms0 -> \k -> do
    eval env e $ \case
      VCons tagActual vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] -> error "case match failure"
            ArmTag pos (Ctag _ tag) xs body : arms -> do
              if tag /= tagActual then dispatch arms else do
                if length xs /= length vArgs then error (show ("case arm mismatch",pos,xs,vArgs)) else do
                  let env' = env { venv = foldr (uncurry Map.insert) venv (zip xs vArgs) }
                  eval env' body k
        dispatch arms0
      v ->
        error (printf "case/scrut not a constructed value: %s" (show v))

data Env = Env { venv :: Map Id Value }

env0 :: Env
env0 = Env { venv = Map.empty }

----------------------------------------------------------------------
-- Compile

-- | Convert constructor names to integer tags,
-- | Convert definitions to let-expressions.

compile :: SRC.Prog -> Transformed
compile = transProg cenv0

transProg :: Cenv -> SRC.Prog -> Exp
transProg cenv0 (SRC.Prog defs) = walk cenv0 defs
  where
    walk :: Cenv -> [SRC.Def] -> Exp
    walk cenv = \case
      [] -> do
        let mainId = transId cenv (SRC.mkUserId "main")
        let noPos = Position 0 0
        let main = Var noPos mainId
        App main noPos (ConTag noPos (Ctag cUnit tUnit) [])

      SRC.ValDef x@(Bid pos _) rhs : defs -> do
        let (x1,cenv1) = posProp x cenv
        Let pos x1 (trans cenv rhs) (walk cenv1 defs)

      SRC.TypeDef cids : defs -> do
        let pairs = zip cids [0::Number .. ]
        let cenv' = foldr (uncurry insertCid) cenv pairs
        walk cenv' defs

trans :: Cenv -> SRC.Exp -> Exp
trans cenv = \case
  SRC.Var p x -> Var p (transId cenv x)
  SRC.Lit p x -> Lit p x
  SRC.Con p cid es -> ConTag p (transCid cenv cid) (map (trans cenv) es)
  SRC.Prim pos b xs -> Prim pos b (map (trans cenv) xs)
  SRC.Lam p x body -> do
    let (x',cenv1) = posProp x cenv
    Lam p x' (trans cenv1 body)
  SRC.RecLam p f x body -> do
    let (f',cenv1) = posProp f cenv
    let (x',cenv2) = posProp x cenv1
    RecLam p f' x' (trans cenv2 body)
  SRC.App e1 p e2 -> App (trans cenv e1) p (trans cenv e2)
  SRC.Let pos x rhs body -> do
    let (x',cenv1) = posProp x cenv
    Let pos x' (trans cenv rhs) (trans cenv1 body)
  SRC.Case p scrut arms -> Case p (trans cenv scrut) (map transArm arms)
    where
      transArm :: SRC.Arm -> Arm
      transArm (SRC.Arm pos cid xs e) = do
        let (xs',cenv1) = posPropList xs cenv
        ArmTag pos (transCid cenv cid) xs' (trans cenv1 e)

transId :: Cenv -> SRC.Id -> Id
transId Cenv{xmap} x = maybe err id $ Map.lookup x xmap
  where err = error (printf "Stage1: unknown identifier: %s" (show x))

transCid :: Cenv -> Cid -> Ctag
transCid Cenv{cmap} cid = Ctag cid $ maybe err id $ Map.lookup cid cmap
  where err = error (printf "Stage1: unknown constructor: %s" (show cid))

data Cenv = Cenv { cmap :: Map Cid Number, xmap :: Map SRC.Id Id }

insertCid :: Cid -> Number -> Cenv -> Cenv
insertCid c tag cenv@Cenv{cmap} = cenv { cmap = Map.insert c tag cmap }

posPropList :: [Bid] -> Cenv -> ([Id],Cenv)
posPropList = \case
  [] -> \cenv -> ([],cenv)
  b:bs -> \cenv -> do
    let (x,cenv1) = posProp b cenv
    let (xs,cenv2) = posPropList bs cenv1
    (x:xs, cenv2)

posProp :: Bid -> Cenv -> (Id,Cenv)
posProp (Bid pos x) cenv = do
  let x' = Id { optPos = Just pos, optUnique = Nothing, name = UserName x }
  (x', insertId x x' cenv)

insertId :: SRC.Id -> Id -> Cenv -> Cenv
insertId x y cenv@Cenv{xmap} = cenv { xmap = Map.insert x y xmap }

cenv0 :: Cenv
cenv0 = Cenv { cmap, xmap = Map.empty }
  where
    cmap = Map.fromList
      [ (cUnit, tUnit)
      , (cFalse, tFalse)
      , (cTrue, tTrue)
      , (cNil, tNil)
      , (cCons, tCons)
      ]
