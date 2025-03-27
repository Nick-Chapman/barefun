-- | Normalize using NbE...
module Normalize (normalize) where

import Control.Monad (ap,liftM)
import Data.Map (Map)
import Par4 (Position(..))
import Stage1 (Exp(..),Arm(..),Id(..),Name(GeneratedName))
import qualified Data.Map as Map

----------------------------------------------------------------------
-- Normalize

normalize :: Exp -> Exp
normalize e = runM (norm env0 e)

norm :: Env -> Exp -> M Exp
norm env e =
  reflect env e >>= reify

data SemValue
  = Syntax Exp
  | Macro (SemValue -> M SemValue)

syn :: Id -> SemValue
syn x = Syntax (Var noPos x)
  where noPos = Position 0 0

reify :: SemValue -> M Exp
reify = \case
  Syntax e -> pure e
  Macro f -> do
    let noPos = Position 0 0
    x :: Id <- fresh Id {name = GeneratedName "f", optPos = Nothing, optUnique = Nothing }
    let arg :: SemValue = syn x
    res :: SemValue <- f arg
    res :: Exp <- reify res
    pure $ Lam noPos x res

share :: SemValue -> (SemValue -> M SemValue) -> M SemValue
share sv k = do
  let noPos = Position 0 0
  case sv of
    Macro{} -> k sv
    Syntax (Var{}) -> k sv
    _ -> do
      x :: Id <- fresh Id {name = GeneratedName "u", optPos = Nothing, optUnique = Nothing }
      rhs <- reify sv
      body <- k (syn x) >>= reify
      pure $ Syntax (Let noPos x rhs body)

apply :: SemValue -> Position -> SemValue -> M SemValue
apply fun p arg = do
  case fun of
    Macro fun -> do
      share arg $ \arg -> do
        fun arg -- inlining occurs here!
    fun -> do
      fun <- reify fun
      arg <- reify arg
      pure $ Syntax (App fun p arg)

reflect :: Env -> Exp -> M SemValue
reflect env = \case
  Var _pos x -> do
    pure (look env x)
  Lit p x -> do
    pure $ Syntax $ Lit p x
  ConTag p tag es -> do
    es <- mapM (norm env) es
    pure $ Syntax $ ConTag p tag es
  Prim p b es -> do
    es <- mapM (norm env) es
    pure $ Syntax $ Prim p b es
  Lam _pos x body -> do
    pure $ Macro $ \arg -> do
      let env' = Map.insert x arg env
      reflect env' body
  RecLam f x body -> do
    x' <- fresh x
    f' <- fresh f
    let env' = Map.insert x (syn x') (Map.insert f (syn f') env)
    body <- norm env' body
    pure $ Syntax $ RecLam f' x' body
  App e1 p e2 -> do
    e1 <- reflect env e1
    e2 <- reflect env e2
    apply e1 p e2
  Let p x rhs body -> do
    reflect env (App (Lam p x body) p rhs)
  Case scrut arms -> do
    scrut <- norm env scrut
    arms <- mapM (normArm env) arms
    pure $ Syntax $ Case scrut arms

normArm :: Env -> Arm -> M Arm
normArm env (ArmTag c xs body) = do
  xys <- sequence [ do y <- fresh x; pure (x,y) | x <- xs ]
  let env' = foldr (uncurry Map.insert) env [ (x,syn y) | (x,y) <- xys ]
  body <- norm env' body
  pure $ ArmTag c (map snd xys) body

type Env = Map Id SemValue

env0 :: Env
env0 = Map.empty

look :: Env -> Id -> SemValue
look env x = maybe err id $ Map.lookup x env
  where err = error (show ("Normalize.walk/Var",x))

fresh :: Id -> M Id
fresh Id{name,optPos} = do
  u <- Fresh
  let optUnique = Just u
  let y = Id { optUnique, optPos, name}
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
