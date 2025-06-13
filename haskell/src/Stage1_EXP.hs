-- | Simplifed expression language. Constructor names replaced by tags.
module Stage1_EXP
  ( Exp(..),Arm(..),Ctag(..),Id(..), Name(..), provenanceExp, sizeExp
  , execute
  , compile
  , PPControl(..),PPPosFlag(..), PPUniqueFlag(..), pp
  ) where

import Primitive (Primitive,executePrimitive)
import Data.List (intercalate)
import Data.Map (Map)
import Lines (Lines,juxComma,bracket,onHead,onTail,jux,indented)
import Par4 (Position(..))
import Stage0_AST (evalLit,apply,apply2,Literal,Cid,Bid(..))
import Text.Printf (printf)
import Value (Interaction(..))
import Value (Value(..),Number,tUnit,tFalse,tTrue,tNil,tCons,deUnit,Ctag(..))
import Value (cUnit,cFalse,cTrue,cNil,cCons)
import qualified Data.Map as Map
import qualified Stage0_AST as SRC
import qualified Value as I (Tickable(Prim,App))

type Transformed = Exp

data Exp
  = Var Position Id
  | Lit Position Literal
  | ConTag Position Ctag [Exp]
  | Prim Position Primitive [Exp]
  | Lam Position Id Exp
  | Lam2 Position Id Id Exp -- TODO LamN
  | RecLam Position Id Id Exp
  | RecLam2 Position Id Id Id Exp -- TODO RecLamN
  | App Exp Position Exp
  | App2 Exp Position Exp Exp -- TODO AppN
  | Let Position Id Exp Exp
  | Match Position Exp [Arm]

data Arm = ArmTag Position Ctag [Id] Exp

data Id = Id
  { optUnique :: Maybe Int
  , pos :: Position
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
  Lam2 _ _ _ body -> 2 + sizeExp body
  RecLam _ _ _ body -> 2 + sizeExp body
  RecLam2 _ _ _ _ body -> 3 + sizeExp body
  App fun _ arg -> sizeExp fun + sizeExp arg
  App2 fun _ arg1 arg2 -> sizeExp fun + sizeExp arg1 + sizeExp arg2
  Let _ _ rhs body -> 1 + sizeExp rhs + sizeExp body
  Match _ scrut arms -> sizeExp scrut + sum [ 1 + length xs + sizeExp rhs | ArmTag _pos _tag xs rhs <- arms ]

----------------------------------------------------------------------
-- provenance

provenanceExp :: Exp -> (String,Position)
provenanceExp = \case
  Var{} -> error "provenanceExp/Var" -- we never call on a Var
  App _ pos _ -> ("app", pos)
  App2 _ pos _ _ -> ("app2",pos)
  Lit pos _ -> ("lit",pos)
  ConTag pos _ _ -> ("con",pos)
  Lam pos _ _ -> ("lam",pos)
  Lam2 pos _ _ _ -> ("lam2",pos)

  Let pos _ _ _ -> ("uLET", pos)
  Prim pos _ _ -> ("prim", pos)
  RecLam pos _ _ _ -> undefined ("reclam",pos) -- never seen these
  RecLam2 pos _ _ _ _ -> undefined ("reclam2",pos)
  Match pos _ _ -> ("case",pos)

----------------------------------------------------------------------
-- Show

data PPUniqueFlag = PPUniqueOn | PPUniqueOff
data PPPosFlag = PPPosOn | PPPosOff

data PPControl = PPControl { ppp :: PPPosFlag, ppu :: PPUniqueFlag }

instance Show Id where show = prettyId0 PPControl { ppp = PPPosOff, ppu = PPUniqueOff }

instance Show Name where
  show = \case
    UserName s -> show s
    GeneratedName s -> s

pp :: PPControl -> Exp -> String
pp control = intercalate "\n" . prettyTop control

prettyTop :: PPControl -> Exp -> Lines
prettyTop control = pretty
  where
    prettyId = prettyId0 control

    pretty :: Exp -> Lines
    pretty = \case
      Var _ x -> [prettyId x]
      Lit _ x -> [show x]
      ConTag _ tag [] -> [show tag]
      ConTag _ tag es -> onHead (show tag ++) (bracket (foldl1 juxComma (map pretty es)))
      Prim _ prim xs -> onHead (printf "PRIM_%s" (show prim) ++) (bracket (foldl1 juxComma (map pretty xs)))
      Lam _ x body -> bracket $ indented ("fun " ++ prettyId x ++ " ->") (pretty body)
      Lam2 _ x1 x2 body -> bracket $ indented ("fun [" ++ prettyId x1 ++ "," ++ prettyId x2 ++ "] ->") (pretty body)

      RecLam _ f x body -> onHead ("fix "++) $ bracket $ indented ("fun " ++ prettyId f ++ " " ++ prettyId x ++ " ->") (pretty body)
      RecLam2 _ f x0 x1 body -> onHead ("fix "++) $ bracket $ indented ("fun " ++ prettyId f ++ " [" ++ prettyId x0 ++ "," ++ prettyId x1 ++ "] ->") (pretty body)
      App func _ arg -> bracket $ jux (pretty func) (pretty arg)
      App2 func _ arg1 arg2 -> bracket $ jux (pretty func) (jux (pretty arg1) (pretty arg2))
      Let _ x rhs body -> indented ("let " ++ prettyId x ++ " =") (onTail (++ " in") (pretty rhs)) ++ pretty body
      Match _ scrut arms -> (onHead ("match "++) . onTail (++ " with")) (pretty scrut) ++ concat (map prettyArm arms)

    prettyArm :: Arm -> Lines
    prettyArm (ArmTag _pos c xs rhs) = indented ("| " ++ prettyPat c xs ++ " ->") (pretty rhs)

    prettyPat :: Ctag -> [Id] -> String
    prettyPat c = \case
      [] -> show c
      xs -> printf "%s(%s)" (show c) (intercalate "," (map prettyId xs))

prettyId0 :: PPControl -> Id -> String
prettyId0 control Id{name,optUnique,pos} =
  maybePos (maybeTag (maybeBracket (show name)))
  where
    maybePos s =
      case ppp control of
        PPPosOn -> printf "%s_%s" s (show pos)
        PPPosOff -> s

    maybeTag s =
      case optUnique of
        Nothing -> s
        Just n ->
          case ppu control of
            PPUniqueOn -> printf "%s_%d" s n
            PPUniqueOff -> s

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
  ConTag _ tag es -> \k -> do
    evals env es $ \vs -> do
      k (VCons tag vs)
  Prim _ prim es -> \k -> do
    evals env es $ \vs -> ITick I.Prim $ do
      executePrimitive prim vs k
  Lam _ x body -> \k -> do
    k (VFunc (\arg k -> eval env { venv = Map.insert x arg venv } body k))
  Lam2 _ x1 x2 body -> \k -> do
    k (VFunc (\arg1 k -> k $ VFunc (\arg2 k -> eval env { venv = Map.insert x1 arg1 (Map.insert x2 arg2 venv) } body k)))

  RecLam _ f x body -> \k -> do
    let me = VFunc (\arg k -> eval env { venv = Map.insert f me (Map.insert x arg venv) } body k)
    k me
  RecLam2 _ f x0 x1 body -> \k -> do
    let me = VFunc (\arg0 k -> k $ VFunc (\arg1 k -> eval env { venv = Map.insert f me $ Map.insert x0 arg0 $ Map.insert x1 arg1 venv } body k))
    k me

  App2 eFunc pos eArg1 eArg2 -> \k -> do -- right->left eval order
    eval env eArg2 $ \arg2 -> do
      eval env eArg1 $ \arg1 -> do
        eval env eFunc $ \func -> do
          ITick I.App $ ITick I.App $ apply2 func pos arg1 arg2 k
  App eFunc pos eArg -> \k -> do
    eval env eArg $ \arg -> do
      eval env eFunc $ \func -> do
        ITick I.App $ apply func pos arg k
  Let _ x e1 e2 -> \k -> do
    eval env e1 $ \v1 -> do
      eval env { venv = Map.insert x v1 venv } e2 k
  Match _ e arms0 -> \k -> do
    eval env e $ \case
      VCons (Ctag _ tagActual) vArgs -> do
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
        App main noPos (ConTag noPos tUnit [])

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
  SRC.Prim pos prim xs -> Prim pos prim (map (trans cenv) xs)
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
  SRC.Match p scrut arms -> Match p (trans cenv scrut) (map transArm arms)
    where
      transArm :: SRC.Arm -> Arm
      transArm (SRC.Arm pos cid xs e) = do
        let (xs',cenv1) = posPropList xs cenv
        ArmTag pos (transCid cenv cid) xs' (trans cenv1 e)

transId :: Cenv -> SRC.Id -> Id
transId Cenv{xmap} x = maybe err id $ Map.lookup x xmap
  where err = error (printf "Stage1: unknown identifier: %s" (show x))

transCid :: Cenv -> Cid -> Ctag
transCid Cenv{cmap} cid = maybe err id $ Map.lookup cid cmap
  where err = error (printf "Stage1: unknown constructor: %s" (show cid))

data Cenv = Cenv { cmap :: Map Cid Ctag, xmap :: Map SRC.Id Id }

insertCid :: Cid -> Number -> Cenv -> Cenv
insertCid c tag cenv@Cenv{cmap} = cenv { cmap = Map.insert c (Ctag c tag) cmap }

posPropList :: [Bid] -> Cenv -> ([Id],Cenv)
posPropList = \case
  [] -> \cenv -> ([],cenv)
  b:bs -> \cenv -> do
    let (x,cenv1) = posProp b cenv
    let (xs,cenv2) = posPropList bs cenv1
    (x:xs, cenv2)

posProp :: Bid -> Cenv -> (Id,Cenv)
posProp (Bid pos x) cenv = do
  let x' = Id { pos, optUnique = Nothing, name = UserName x }
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
