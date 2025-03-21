-- | ANF style expressions. All sub-expressions named. Atomic/Compound expression forms distinguished.
module Stage2
  ( execute
  , compile
  ) where

import Builtin (Builtin,evalBuiltin)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Set (Set,singleton,(\\),union)
import Interaction (Interaction(..))
import Lines (Lines,bracket,onHead,onTail,indented)
import Par4 (Position(..))
import Stage0 (evalLit,apply,Literal,Id(..))
import Stage1 (Ctag(..))
import Text.Printf (printf)
import Value (Value(..),deUnit)
import qualified Data.Map as Map
import qualified Data.Set as Set (toList,fromList,unions,empty)
import qualified Stage1 as SRC

type Transformed = Code

data Code
  = Return Id
  | Tail Id Position Id
  | LetAtomic Id Atomic Code
  | PushContinuation Fvs (Id,Code) Code
  | Case Id [Arm]

data Arm = ArmTag Ctag [Id] Code

-- Atomic expressions cause only bounded evaluation.
data Atomic
  = Lit Literal
  | Prim Builtin [Id]
  | ConTag Ctag [Id]
  | Lam Fvs Id Code
  | RecLam Fvs Id Id Code

newtype Fvs = Fvs (Set Id)

----------------------------------------------------------------------
-- Show

instance Show Fvs where
  show (Fvs set) =
    "{" ++ intercalate "," (map show (Set.toList set)) ++ "}"

instance Show Code where show = intercalate "\n" . ("let k () = ()":) . pretty

pretty :: Code -> Lines
pretty = \case
  Return x -> ["k "++show x]
  Tail x1 _pos x2 -> [printf "%s %s k" (show x1) (show x2)]
  LetAtomic x rhs body -> indented ("let " ++ show x ++ " =") (onTail (++ " in") (prettyA rhs)) ++ pretty body
  PushContinuation fvs (x,later) first -> indented ("let k " ++ show fvs ++ " " ++ show x ++ " =") (onTail (++ " in") (pretty later)) ++ pretty first
  Case scrut arms -> (onHead ("match "++) . onTail (++ " with")) [show scrut] ++ concat (map prettyArm arms)

prettyA :: Atomic -> Lines
prettyA = \case
  Lit x -> [show x]
  Prim b xs -> do [printf "PRIM_%s%s" (show b) (show xs)]
  ConTag tag [] -> [show tag]
  ConTag tag xs -> [printf "%s%s" (show tag) (show xs)]
  Lam fvs x body -> bracket $ indented ("fun" ++ show fvs ++ " " ++ show x ++ " k ->") (pretty body)
  RecLam fvs f x body -> onHead ("fix "++) $ bracket $ indented ("fun" ++ show fvs ++ " " ++ show f ++ " " ++ show x ++ " k ->") (pretty body)

prettyArm :: Arm -> Lines
prettyArm = \case
  ArmTag c xs rhs -> do
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
evalCode env@Env{venv} = \case
  Return x -> \k -> k (look x)
  Tail x1 pos x2 -> \k -> apply (look x1) pos (look x2) k
  LetAtomic x a1 c2 -> \k -> do
    evalA a1 $ \v1 -> do
      evalCode env { venv = Map.insert x v1 venv } c2 k
  PushContinuation _ (x,later) first -> \k -> do
    evalCode env first $ \v1 -> do
      evalCode env { venv = Map.insert x v1 venv } later k
  Case scrut arms0 -> \k -> do
    case (look scrut) of
      VCons tagActual vArgs -> do
        let
          dispatch :: [Arm] -> Interaction
          dispatch arms = case arms of
            [] -> error "case match failure"
            ArmTag (Ctag tag) xs body : arms -> do
              if tag /= tagActual then dispatch arms else do
                if length xs /= length vArgs then error (show ("case arm mismatch",xs,vArgs)) else do
                  let env' = env { venv = foldr (uncurry Map.insert) venv (zip xs vArgs) }
                  evalCode env' body k
        dispatch arms0
      v ->
        error (printf "case/scrut not a constructed value: %s" (show v))
  where
    evalA :: Atomic -> (Value -> Interaction) -> Interaction
    evalA = \case
      Lit literal -> \k -> k (evalLit literal)
      Prim b xs -> \k -> evalBuiltin b (map look xs) k
      ConTag (Ctag tag) xs -> \k -> k (VCons tag (map look xs))
      Lam _fvs x body -> \k -> do
        k (VFunc (\arg k -> evalCode env { venv = Map.insert x arg venv } body k))
      RecLam _fvs f x body -> \k -> do
        let me = VFunc (\arg k -> evalCode env { venv = Map.insert f me (Map.insert x arg venv) } body k)
        k me

    look :: Id -> Value
    look x = do
      maybe err id $ Map.lookup x venv
        where err = error (show ("var-lookup",x))

data Env = Env { venv :: Map Id Value }

env0 :: Env
env0 = Env { venv = Map.empty }

----------------------------------------------------------------------
-- Compile

-- | Convert to ANF. Generate name for all sub expressions, and code-returns.
-- | Distinguish binding of Atomic/Compound expressions.

compile :: SRC.Exp -> Transformed
compile e = runM (trans0 e)

trans0 :: SRC.Exp -> M Code
trans0 e = trans1 e >>= nameAtomic

data AC = Compound Code | Atomic Atomic

nameAtomic :: AC -> M Code
nameAtomic = \case
  Compound code -> pure code
  Atomic a -> do
    u <- Fresh "v" -- maybe name after the kind of atom being bound
    pure $ LetAtomic u a (Return u)

trans1 :: SRC.Exp -> M AC
trans1 = \case
  SRC.Var _pos x -> do
    pure $ Compound $ Return x
  SRC.Lit x -> do
    pure $ Atomic $ Lit x
  SRC.ConTag tag es -> do
    transIds es $ \xs ->
      pure $ Atomic $ ConTag tag xs
  SRC.Prim b es -> do
    transIds es $ \xs ->
      pure $ Atomic $ Prim b xs
  SRC.Lam x body -> (Atomic . mkLam x) <$> trans0 body
  SRC.RecLam f x body -> (Atomic . mkRecLam f x) <$> trans0 body
  SRC.App e1 p e2 -> do
    transId e1 $ \x1 -> do
      transId e2 $ \x2 -> do
        pure $ Compound $ Tail x1 p x2
  SRC.Let x rhs body -> do
    rhs <- trans1 rhs
    body <- trans0 body
    pure $ Compound $ mkBind x rhs body
  SRC.Case scrut arms -> do
    transId scrut $ \scrut -> do
      arms <- mapM transArm arms
      pure $ Compound $ Case scrut arms

mkBind :: Id -> AC -> Code -> Code
mkBind x rhs body = case rhs of
  Compound rhs -> mkPushContinuation (x,body) rhs
  Atomic rhs -> LetAtomic x rhs body

transArm :: SRC.Arm -> M Arm
transArm (SRC.ArmTag tag xs exp) = do
  exp <- trans0 exp
  pure $ ArmTag tag xs exp

transId :: SRC.Exp -> (Id -> M AC) -> M AC
transId = \case
  SRC.Var _pos x -> \k -> k x
  e -> \k -> do
    u <- Fresh "u"
    code <- trans1 e
    body <- (k u >>= nameAtomic)
    pure $ Compound $ mkBind u code body

transIds :: [SRC.Exp] -> ([Id] -> M AC) -> M AC
transIds es k = case es of
  [] -> k []
  e:es -> do
    transId e $ \x -> do
      transIds es $ \xs ->
        k (x:xs)

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  Fresh :: String -> M Id

runM :: M a -> a
runM m0 = loop 1 m0 $ \_ x -> x
  where
    loop :: Int -> M a -> (Int -> a -> b) -> b
    loop u m k = case m of
      Ret x -> k u x
      Bind m f -> loop u m $ \u x -> loop u (f x) k
      Fresh tag -> k (u+1) (Id (printf "%s%d" tag u))


----------------------------------------------------------------------
-- Free Vars

mkLam :: Id -> Code -> Atomic
mkLam x code = Lam (Fvs (fvs code \\ singleton x)) x code

mkRecLam :: Id -> Id -> Code -> Atomic
mkRecLam f x code = RecLam (Fvs (fvs code \\ Set.fromList [f,x])) f x code

mkPushContinuation :: (Id,Code) -> Code -> Code
mkPushContinuation (x,body) rhs =
  PushContinuation (Fvs (fvs rhs `union` (fvs body \\ singleton x))) (x,body) rhs

fvs :: Code -> Set Id
fvs = \case
  Return x -> singleton x
  Tail x1 _ x2 -> Set.fromList [x1,x2]
  LetAtomic x rhs body-> fvsA rhs `union` (fvs body \\ singleton x)
  PushContinuation (Fvs set) _ _ -> set
  Case scrut arms -> singleton scrut `union` Set.unions (map fvsArm arms)
  where
    fvsArm (ArmTag _ xs exp) = fvs exp \\ Set.fromList xs

fvsA :: Atomic -> Set Id
fvsA = \case
  Lit _ -> Set.empty
  ConTag _ xs -> Set.fromList xs
  Prim _ xs -> Set.fromList xs
  Lam (Fvs set) _ _ -> set
  RecLam (Fvs set) _ _ _ -> set
