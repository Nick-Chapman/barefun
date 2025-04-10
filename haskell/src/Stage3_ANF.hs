-- | ANF style expressions. All sub-expressions named. Atomic/Compound expression forms distinguished.
module Stage3_ANF
  ( Code(..), Arm(..), Atomic(..), fvs
  , execute
  , compile
  ) where

import Builtin (Builtin,executeBuiltin)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Set (Set,singleton,(\\),union)
import Interaction (Interaction(..))
import Lines (Lines,bracket,onHead,onTail,indented)
import Par4 (Position(..))
import Stage0_AST (evalLit,apply,Literal)
import Stage1_EXP (Id(..),Name(GeneratedName),Ctag(..),provenanceExp)
import Text.Printf (printf)
import Value (Value(..),deUnit)
import qualified Data.Map as Map
import qualified Data.Set as Set (toList,fromList,unions,empty)
import qualified Interaction as I (Tickable(..))
import qualified Stage1_EXP as SRC

type Transformed = Code

data Code
  = Return Position Id
  | Tail Id Position Id
  | LetAlias Id Id Code
  | LetAtomic Id Atomic Code
  | PushContinuation Fvs (Id,Code) Code
  | Case Id [Arm]

data Arm = ArmTag Position Ctag [Id] Code

-- Atomic expressions cause only bounded evaluation.
data Atomic
  = Lit Position Literal
  | Prim Position Builtin [Id]
  | ConTag Position Ctag [Id]
  | Lam Position Fvs Id Code
  | RecLam Position Fvs Id Id Code

type Fvs = [Id]

----------------------------------------------------------------------
-- provenance

provenanceAtomic :: Atomic -> (String,Maybe Position)
provenanceAtomic = \case
  Lit pos _ -> ("lit",Just pos)
  Prim pos _ _ -> ("prim",Just pos)
  ConTag pos _ _ -> ("con",Just pos)
  Lam pos _ _ _ -> ("lam",Just pos)
  RecLam pos _ _ _ _ -> undefined $ ("reclam",Just pos)

----------------------------------------------------------------------
-- Show

instance Show Code where show = intercalate "\n" . ("let k () = ()":) . pretty

pretty :: Code -> Lines
pretty = \case
  Return _ x -> ["k " ++ show x]
  Tail x1 _pos x2 -> [printf "%s %s k" (show x1) (show x2)]
  LetAlias x y body -> ["let " ++ show x ++ " = " ++ show y ++ " in"] ++ pretty body
  LetAtomic x rhs body -> onHead (("let " ++ show x ++ " = ")++) (onTail (++ " in") (prettyA rhs)) ++ pretty body
  PushContinuation fvs (x,later) first -> indented ("let k " ++ show fvs ++ " " ++ show x ++ " =") (onTail (++ " in") (pretty later)) ++ pretty first
  Case scrut arms -> (onHead ("match "++) . onTail (++ " with")) [show scrut] ++ concat (map prettyArm arms)

prettyA :: Atomic -> Lines
prettyA = \case
  Lit _ x -> [show x]
  Prim _ b xs -> do [printf "PRIM_%s(%s)" (show b) (intercalate "," (map show xs))]
  ConTag _ tag [] -> [show tag]
  ConTag _ tag xs -> [printf "%s%s" (show tag) (show xs)]
  Lam _ fvs x body -> indented ("fun " ++ show fvs ++ " " ++ show x ++ " k ->") (pretty body)
  RecLam _ fvs f x body -> onHead ("fix "++) $ bracket $ indented ("fun " ++ show fvs ++ " " ++ show f ++ " " ++ show x ++ " k ->") (pretty body)

prettyArm :: Arm -> Lines
prettyArm = \case
  ArmTag _pos c xs rhs -> do
    indented ("| " ++ prettyPat c xs ++ " ->") (pretty rhs)

prettyPat :: Ctag -> [Id] -> String
prettyPat tag = \case
  [] -> show tag
  xs -> printf "%s(%s)" (show tag) (intercalate "," (map show xs))

----------------------------------------------------------------------
-- Execute

execute :: Transformed -> Interaction
execute = evalCode0

evalCode0 :: Code -> Interaction
evalCode0 exp =
  evalCode env0 exp $ \v -> case deUnit v of () -> IDone

evalCode :: Env -> Code -> (Value -> Interaction) -> Interaction
evalCode env = \case
  Return _ x -> \k -> ITick I.Return $ k (look x)
  Tail x1 pos x2 -> \k -> ITick I.Enter $ apply (look x1) pos (look x2) k
  LetAlias x y body -> \k -> do
    let v = look y
    evalCode (insert x v env) body k
  LetAtomic x a1 c2 -> \k -> do
    evalA a1 $ \v1 -> do
      evalCode (insert x v1 env) c2 k
  PushContinuation fvs (x,later) first -> \k -> ITick I.PushContinuation $ do
    evalCode env first $ \v1 -> do
      evalCode (insert x v1 (limit fvs env)) later k
  Case scrut arms0 -> \k -> do
    case (look scrut) of
      VCons tagActual vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] -> error "case match failure"
            ArmTag pos (Ctag _ tag) xs body : arms -> do
              if tag /= tagActual then dispatch arms else do
                if length xs /= length vArgs then error (show ("case arm mismatch",pos,xs,vArgs)) else do
                  let env' = foldr (uncurry insert) env (zip xs vArgs)
                  evalCode env' body k
        dispatch arms0
      v ->
        error (printf "case/scrut not a constructed value: %s" (show v))
  where
    evalA :: Atomic -> (Value -> Interaction) -> Interaction
    evalA = \case
      Lit _ literal -> \k -> k (evalLit literal)
      Prim _ b xs -> \k -> ITick I.Prim $ executeBuiltin b (map look xs) k
      ConTag _ (Ctag _ tag) xs -> \k -> k (VCons tag (map look xs))
      Lam _ fvs x body -> \k -> do
        k (VFunc (\arg k -> evalCode (insert x arg (limit fvs env)) body k))
      RecLam _ fvs f x body -> \k -> do
        let me = VFunc (\arg k -> evalCode (insert f me (insert x arg (limit fvs env))) body k)
        k me

    look :: Id -> Value
    look x = do
      let Env{venv} = env
      maybe err id $ Map.lookup x venv
        where err = error (show ("var-lookup",x))

data Env = Env { venv :: Map Id Value }

limit :: [Id] -> Env -> Env
limit fvs Env{venv} = Env $ Map.fromList [ (x,v) | (x,v) <- Map.toList venv, x `elem` fvs ]

insert :: Id -> Value -> Env -> Env
insert x v Env{venv} = Env { venv = Map.insert x v venv }

env0 :: Env
env0 = Env { venv = Map.empty }

----------------------------------------------------------------------
-- Compile

-- | Convert to ANF. Generate name for all sub expressions, and code-returns.
-- | Distinguish binding of Atomic/Compound expressions.

compile :: SRC.Exp -> Transformed
compile e = runM (compileTop e)

compileTop :: SRC.Exp -> M Code
compileTop e = compileExp e pure >>= nameAtomic

data AC = Compound Code | Atomic Atomic

nameAtomic :: AC -> M Code
nameAtomic = \case
  Compound code -> pure code
  Atomic a -> do
    let (what,optPos) = provenanceAtomic a
    u <- Fresh optPos what
    let noPos = Position 0 0
    pure $ LetAtomic u a (Return noPos u)

compileExp :: SRC.Exp -> (AC -> M AC) -> M AC
compileExp = \case
  SRC.Var pos x -> \k -> do
    k $ Compound $ Return pos x
  SRC.Lit pos x -> \k -> do
    k $ Atomic $ Lit pos x
  SRC.ConTag pos tag es -> \k -> do
    compileAsIds es $ \xs ->
      k $ Atomic $ ConTag pos tag xs
  SRC.Prim pos b es -> \k -> do
    compileAsIds es $ \xs ->
      k $ Atomic $ Prim pos b xs
  SRC.Lam pos x body -> \k -> do
    body <- compileTop body
    k $ Atomic $ mkLam pos x body
  SRC.RecLam pos f x body -> \k -> do
    body <- compileTop body
    k $ Atomic $ mkRecLam pos f x body
  SRC.App e1 p e2 -> \k -> do
    compileAsId e1 $ \x1 -> do
      compileAsId e2 $ \x2 -> do
        k $ Compound $ Tail x1 p x2
  SRC.Let _pos x rhs body -> \k -> do
    compileExp rhs $ \rhs -> do
      body <- compileExp body k >>= nameAtomic
      pure $ Compound $ mkBind x rhs body
  SRC.Case _pos scrut arms -> \k -> do
    compileAsId scrut $ \scrut -> do
      arms <- mapM compileArm arms
      k $ Compound $ Case scrut arms

compileArm :: SRC.Arm -> M Arm
compileArm (SRC.ArmTag pos tag xs exp) = do
  exp <- compileTop exp
  pure $ ArmTag pos tag xs exp

compileAsIds :: [SRC.Exp] -> ([Id] -> M AC) -> M AC
compileAsIds es k = case es of
  [] -> k []
  e:es -> do
    compileAsId e $ \x -> do
      compileAsIds es $ \xs ->
        k (x:xs)

compileAsId :: SRC.Exp -> (Id -> M AC) -> M AC
compileAsId = \case
  SRC.Var _pos x -> \k -> k x
  e -> \k -> do
    let (what,optPos) = provenanceExp e
    u <- Fresh optPos what
    compileExp e $ \code -> do
      body <- (k u >>= nameAtomic)
      pure $ Compound $ mkBind u code body

mkBind :: Id -> AC -> Code -> Code
mkBind x rhs body = case rhs of
  Compound (Return _ y) -> LetAlias x y body
  Compound rhs -> mkPushContinuation (x,body) rhs
  Atomic rhs -> LetAtomic x rhs body

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  Fresh :: Maybe Position -> String -> M Id

runM :: M a -> a
runM m0 = loop 1 m0 $ \_ x -> x
  where
    loop :: Int -> M a -> (Int -> a -> b) -> b
    loop u m k = case m of
      Ret x -> k u x
      Bind m f -> loop u m $ \u x -> loop u (f x) k
      Fresh optPos tag -> do
        let x = Id { optUnique = Just u
                   , optPos
                   , name = GeneratedName tag
                   }
        k (u+1) x

----------------------------------------------------------------------
-- Free Vars

mkLam :: Position -> Id -> Code -> Atomic
mkLam pos x code = Lam pos (Set.toList (fvs code \\ singleton x)) x code

mkRecLam :: Position -> Id -> Id -> Code -> Atomic
mkRecLam pos f x code = RecLam pos (Set.toList (fvs code \\ Set.fromList [f,x])) f x code

mkPushContinuation :: (Id,Code) -> Code -> Code
mkPushContinuation (x,later) first =
  PushContinuation (Set.toList (fvs later \\ singleton x)) (x,later) first

fvs :: Code -> Set Id
fvs = \case
  Return _ x -> singleton x
  Tail x1 _ x2 -> Set.fromList [x1,x2]
  LetAlias x y body -> singleton y `union` (fvs body \\ singleton x)
  LetAtomic x rhs body -> fvsA rhs `union` (fvs body \\ singleton x)
  PushContinuation frame _ rhs -> fvs rhs `union` Set.fromList frame
  Case scrut arms -> singleton scrut `union` Set.unions (map fvsArm arms)
  where
    fvsArm (ArmTag _pos _cid xs exp) = fvs exp \\ Set.fromList xs

fvsA :: Atomic -> Set Id
fvsA = \case
  Lit _ _ -> Set.empty
  ConTag _ _ xs -> Set.fromList xs
  Prim _ _ xs -> Set.fromList xs
  Lam _ fvs _ _ -> Set.fromList fvs
  RecLam _ fvs _ _ _ -> Set.fromList fvs
