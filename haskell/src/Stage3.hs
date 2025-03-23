-- | Locate identifier references at runtime; lift globals
module Stage3
  ( execute
  , compile
  ) where

import Builtin (Builtin,evalBuiltin)
import Data.List (intercalate)
import Data.Map (Map)
import Interaction (Interaction(..))
import Lines (Lines,bracket,onHead,onTail,indented)
import Par4 (Position(..))
import Stage0 (evalLit,apply,Literal,Id(..))
import Stage1 (Ctag(..))
import Text.Printf (printf)
import Value (Value(..),deUnit)
import qualified Data.Map as Map
import qualified Stage2 as SRC (Code(..),Atomic(..),Arm(..))

type Transformed = Code

-- TODO: define GCode, for seq of LetAtomic(for Atomic glob-Contag/Literal & freevar-less-Lam/RecLamm)

data Code
  = Return Ref
  | Tail Ref Position Ref
  | LetAtomic Ref Atomic Code
  | PushContinuation [Ref] (Ref,Code) Code
  | Case Ref [Arm]

data Arm = ArmTag Ctag [Ref] Code

data Atomic
  = Lit Literal -- TODO Never here. Will always be lifted to a global
  | Prim Builtin [Ref]
  | ConTag Ctag [Ref]
  | Lam [Ref] Ref Code
  | RecLam [Ref] Ref Ref Code

data Location = Global Int | InFrame Int | Temp Int | TheFrame | TheArg deriving (Eq,Ord)
data Ref = Ref Id Location

firstFrameIndex,firstTempIndex :: Int
firstFrameIndex = 1
firstTempIndex = 1

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

prettyPat :: Ctag -> [Ref] -> String
prettyPat tag = \case
  [] -> show tag
  xs -> printf "%s(%s)" (show tag) (intercalate "," (map show xs))

instance Show Ref where show (Ref x loc) = show x ++ "_" ++ show loc

instance Show Location where
  show = \case
    Global n -> "g" ++ show n
    InFrame n -> "f" ++ show n
    Temp n -> "t" ++ show n
    TheArg -> "arg"
    TheFrame -> "me"


----------------------------------------------------------------------
-- Execute

execute :: Transformed -> Interaction
execute = evalCode0

evalCode0 :: Code -> Interaction
evalCode0 exp =
  evalCode env0 exp $ \v -> case deUnit v of () -> IDone

evalCode :: Env -> Code -> (Value -> Interaction) -> Interaction
evalCode env = \case
  Return x -> \k -> k (look x)
  Tail x1 pos x2 -> \k -> apply (look x1) pos (look x2) k
  LetAtomic x a1 c2 -> \k -> do
    evalA a1 $ \v1 -> do
      evalCode (insert x v1 env) c2 k
  PushContinuation fvs (x,later) first -> \k -> do
    evalCode env first $ \v1 -> do
      let env = mkFrameEnv look fvs
      evalCode (insert x v1 env) later k
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
                  let env' = foldr (uncurry insert) env (zip xs vArgs)
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

      Lam fvs x body -> \k -> do
        let env = mkFrameEnv look fvs
        k (VFunc (\arg k -> evalCode (insert x arg env) body k))

      RecLam fvs f x body -> \k -> do
        let env = mkFrameEnv look fvs
        let me = VFunc (\arg k -> do evalCode (insert x arg (insert f me env)) body k)
        k me

    look :: Ref -> Value
    look (Ref x loc) = do
      let Env{venv} = env
      maybe err id $ Map.lookup loc venv
        where err = error (show ("var-lookup",x,loc))

data Env = Env { venv :: Map Location Value }

env0 :: Env
env0 = Env { venv = Map.empty }

mkFrameEnv :: (Ref -> Value) -> [Ref] -> Env
mkFrameEnv look fvs =
  Env $ Map.fromList $ [ (InFrame n, look ref) | (n,ref) <- zip [firstFrameIndex..] fvs ]

insert :: Ref -> Value -> Env -> Env
insert (Ref _ loc) v Env{venv} = Env { venv = Map.insert loc v venv }

----------------------------------------------------------------------
-- Compile

compile :: SRC.Code -> Transformed
compile = compileC [] []

compileC :: [Id] -> [(Id,Ref)] -> SRC.Code -> Code
compileC fvs binds = walkC firstTempIndex (Map.fromList (binds ++ mkFreeCenv fvs))

  where
    walkC :: Int -> Cenv -> SRC.Code -> Code
    walkC nextTemp cenv = \case
      SRC.Return x -> Return (locate x)
      SRC.Tail x1 pos x2 -> Tail (locate x1) pos (locate x2)

      SRC.LetAtomic x a1 c2 -> do
        let ref = Ref x (Temp nextTemp)
        let cenv' = Map.insert x ref cenv
        LetAtomic ref (walkA a1) (walkC (nextTemp+1) cenv' c2)

      SRC.PushContinuation fvs (x,later) first -> do
        let ref = Ref x TheArg
        PushContinuation (map locate fvs) (ref,compileC fvs [(x,ref)] later) (walkC nextTemp cenv first)

      SRC.Case scrut arms ->
        Case (locate scrut) (map walkArm arms)

      where
        locate :: Id -> Ref
        locate x = maybe err id $ Map.lookup x cenv
          where err = error (show ("locate",x))

        walkA :: SRC.Atomic -> Atomic
        walkA = \case
          SRC.Lit literal -> Lit literal
          SRC.Prim b xs -> Prim b (map locate xs)
          SRC.ConTag tag xs -> ConTag tag (map locate xs)
          SRC.Lam fvs x body -> do
            let ref = Ref x TheArg
            Lam (map locate fvs) ref (compileC fvs [(x,ref)] body)
          SRC.RecLam fvs f x body -> do
            let fRef = Ref f TheFrame
            let xRef = Ref x TheArg
            RecLam (map locate fvs) fRef xRef (compileC fvs [(f,fRef),(x,xRef)]  body)

        walkArm :: SRC.Arm -> Arm
        walkArm (SRC.ArmTag tag xs body) = do
          let refs = [ Ref x (Temp n) | (x,n) <- zip xs [nextTemp..] ]
          let cenv' = foldr (uncurry Map.insert) cenv (zip xs refs)
          ArmTag tag refs (walkC (nextTemp + length xs) cenv' body)

mkFreeCenv :: [Id] -> [(Id,Ref)]
mkFreeCenv free = [ (x,Ref x (InFrame n)) | (x,n) <- zip free [firstFrameIndex..] ]

type Cenv = Map Id Ref -- TODO: keep global part separate, when implement global lifting
