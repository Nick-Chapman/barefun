-- | Normalize using NbE...
module Normalize (normalize) where

--import Builtin (Builtin,evalBuiltin)
--import Data.List (intercalate)
import Par4 (Position(..))

import Control.Monad (ap,liftM)
import Data.Map (Map)
import Stage0 (Id(..))
import Stage1 (Exp(..),Arm(..))
import qualified Data.Map as Map

----------------------------------------------------------------------
-- Normalize

normalize :: Exp -> Exp
normalize e = runM (walk env0 e)

type Env = Map Id Id

env0 :: Env
env0 = Map.empty

look :: Env -> Id -> Id
look env x = maybe err id $ Map.lookup x env
  where err = error (show ("Normalize.walk/Var",x))

walk :: Env -> Exp -> M Exp
walk env = \case
  Var pos x -> do
    pure $ Var pos (look env x)
  Lit p x -> do
    undefined $ Lit p x
  ConTag p tag es -> do
    es <- mapM (walk env) es
    pure $ ConTag p tag es
  Prim p b es -> do
    es <- mapM (walk env) es
    pure $ Prim p b es
  Lam p x body -> do
    x' <- fresh x
    let env' = Map.insert x x' env
    body <- walk env' body
    pure $ Lam p x' body
  RecLam f x body -> do
    x' <- fresh x
    f' <- fresh f
    let env' = Map.insert x x' (Map.insert f f' env)
    body <- walk env' body
    pure $ RecLam f' x' body
  App e1 p e2 -> do
    e1 <- walk env e1
    e2 <- walk env e2
    pure $ App e1 p e2
  Let p x rhs body -> do
    rhs <- walk env rhs
    x' <- fresh x
    let env' = Map.insert x x' env
    body <- walk env' body
    pure $ Let p x' rhs body
  Case scrut arms -> do
    scrut <- walk env scrut
    arms <- mapM (walkArm env) arms
    pure $ Case scrut arms

walkArm :: Env -> Arm -> M Arm
walkArm env (ArmTag c xs body) = undefined $ do
  -- TODO bind
  body <- walk env body
  pure $ ArmTag c xs body

fresh :: Id -> M Id
fresh Id{name,optPos} = do
  u <- Fresh
  let _optPos = Just (Position 8 9)
  let optUnique = Just u
  let y = Id { optUnique
             , optPos
             , name
             }
  pure y

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  Fresh :: M Int

runM :: M a -> a
runM m0 = loop 1 m0 $ \_ x -> x
  where
    loop :: Int -> M a -> (Int -> a -> b) -> b
    loop u m k = case m of
      Ret x -> k u x
      Bind m f -> loop u m $ \u x -> loop u (f x) k
      Fresh -> k (u+1) u
