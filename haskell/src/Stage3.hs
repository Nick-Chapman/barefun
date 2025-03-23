-- | Locate identifier references at runtime; lift globals
module Stage3
  ( execute
  , compile
  ) where

import Builtin (Builtin,evalBuiltin)
--import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
--import Data.Set (Set,singleton,(\\),union)
import Interaction (Interaction(..))
import Lines (Lines,bracket,onHead,onTail,indented)
import Par4 (Position(..))
import Stage0 (evalLit,apply,Literal,Id(..))
import Stage1 (Ctag(..))
import Text.Printf (printf)
import Value (Value(..),deUnit)
import qualified Data.Map as Map

import qualified Stage2 as SRC --(Code(..),execute)

type Transformed = Code

-- TODO: Move from Using Id --> data Ref = Ref Loc Id
-- TODO: define GCode, for seq of LetAtomic(for Atomic glob-Contag/Literal & freevar-less-Lam/RecLamm)
-- TODO: data Loc = Global Int | InFrame Int | Local Int | Arg

data Code
  = Return Id
  | Tail Id Position Id
  | LetAtomic Id Atomic Code
  | PushContinuation Fvs (Id,Code) Code -- TODO: Not Fvs, but [Ref]
  | Case Id [Arm]

data Arm = ArmTag Ctag [Id] Code

data Atomic
  = Lit Literal -- TODO Never here
  | Prim Builtin [Id]
  | ConTag Ctag [Id]
  | Lam Fvs Id Code  -- TODO: Not Fvs, but [Ref]
  | RecLam Fvs Id Id Code  -- TODO: Not Fvs, but [Ref]

type Fvs = SRC.Fvs

----------------------------------------------------------------------
-- Show

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

compile :: SRC.Code -> Transformed
compile = walkC

walkC :: SRC.Code -> Code
walkC = \case
  SRC.Return x -> Return x
  SRC.Tail x1 pos x2 -> Tail x1 pos x2
  SRC.LetAtomic x a1 c2 -> LetAtomic x (walkA a1) (walkC c2)
  SRC.PushContinuation fvs (x,later) first -> PushContinuation fvs (x,walkC later) (walkC first)
  SRC.Case scrut arms -> Case scrut (map walkArm arms)

walkA :: SRC.Atomic -> Atomic
walkA = \case
  SRC.Lit literal -> Lit literal
  SRC.Prim b xs -> Prim b xs
  SRC.ConTag tag xs -> ConTag tag xs
  SRC.Lam fvs x body -> Lam fvs x (walkC body)
  SRC.RecLam fvs f x body -> RecLam fvs f x (walkC body)

walkArm :: SRC.Arm -> Arm
walkArm (SRC.ArmTag tag xs body) = ArmTag tag xs (walkC body)
