-- | Normalize using NbE...
module Normalize (normalize) where

import Builtin (Builtin,isPure,evaluatePureBuiltin)
import Control.Monad (ap,liftM)
import Data.Map (Map)
import Par4 (Position(..))
import Stage0 (Literal(..),evalLit,Cid(..))
import Stage1 (Exp(..),Arm(..),Id(..),Ctag(..))
import Value (Value(..))
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
  | Macro Id (SemValue -> M SemValue)
  | Constant Position Value -- TODO: should only be base values here

posOfId :: Id -> Position
posOfId = \case Id{optPos=Just pos} -> pos; _ -> noPos -- TODO: mandatory pos in ident
  where noPos = Position 0 0

syn :: Id -> SemValue
syn x = Syntax (Var (posOfId x) x)

reifyValue :: Position -> Value -> Exp
reifyValue pos = \case
  VNum n -> Lit pos (LitN n)
  VChar c -> Lit pos (LitC c)
  VString s -> Lit pos (LitS s)
  VCons tag vs -> do
    let es = map (reifyValue pos) vs
    let cid = Cid "unknown-cid-because-of-normalization"
    ConTag pos (Ctag cid tag) es
  v@VFunc{} ->
    error (show ("refifyValue",pos,v))

reify :: SemValue -> M Exp
reify = \case
  Constant pos v -> pure (reifyValue pos v)
  Syntax e -> pure e
  Macro x f -> do
    x <- fresh x
    body <- Reset $ do
      let arg :: SemValue = syn x
      res :: SemValue <- f arg
      res :: Exp <- reify res
      pure res
    pure $ Lam (posOfId x) x body

_old_share :: Id -> SemValue -> (SemValue -> M SemValue) -> M SemValue -- TODO: kill
_old_share x sv k = do
  case sv of
    Constant{} -> k sv
    Macro{} -> k sv
    Syntax (Var{}) -> k sv
    Syntax{} -> do
      x <- fresh x
      rhs <- reify sv
      body <- k (syn x) >>= reify
      pure $ Syntax (Let (posOfId x) x rhs body)

_new_share :: Id -> SemValue -> M SemValue
_new_share x sv = do
  case sv of
    Constant{} -> pure sv
    Macro{} -> pure sv
    Syntax (Var{}) -> pure sv
    Syntax{} -> do
      x <- fresh x
      rhs <- reify sv
      Wrap (Let (posOfId x) x rhs) (pure (syn x))

apply :: SemValue -> Position -> SemValue -> M SemValue
apply fun p arg = do
  case fun of
    --Macro x fun -> _old_share x arg $ \arg -> fun arg -- inlining occurs here! -- OLD, TODO kill
    Macro x fun -> do arg <- _new_share x arg; fun arg -- inlining occurs here
    fun -> do
      fun <- reify fun
      arg <- reify arg
      pure $ Syntax (App fun p arg)

maybeAllConstant :: [SemValue] -> Maybe [Value]
maybeAllConstant svs = do
  let vs = [ v | Constant _ v <- svs ]
  if length vs == length svs then Just vs else Nothing

reflectBuiltin :: Position -> Builtin -> [SemValue] -> M SemValue
reflectBuiltin pos b es = do
  let enableConstantFolding = False -- TODO: enable it whne it works properly!

  if not enableConstantFolding || not (isPure b) then syntax else
    case maybeAllConstant es of
      Just vs -> do
        let res :: Value = evaluatePureBuiltin b vs
        pure $ Constant pos res
      Nothing -> syntax
  where
    syntax = do
      es <- mapM reify es
      pure $ Syntax $ Prim pos b es

reflect :: Env -> Exp -> M SemValue
reflect env = \case
  Var _pos x -> do
    pure (look env x)
  Lit pos x -> do
    pure $ Constant pos (evalLit x)
  ConTag p tag es -> do -- TODO: special case constants
    es <- mapM (norm env) es
    pure $ Syntax $ ConTag p tag es
  Prim p b es -> do
    es <- mapM (reflect env) es
    reflectBuiltin p b es
  Lam _pos x body -> do
    pure $ Macro x $ \arg -> do
      let env' = Map.insert x arg env
      reflect env' body
  RecLam pos f x body -> do
    x' <- fresh x
    f' <- fresh f
    let env' = Map.insert x (syn x') (Map.insert f (syn f') env)
    body <- Reset (norm env' body)
    pure $ Syntax $ RecLam pos f' x' body
  App e1 p e2 -> do
    e1 <- reflect env e1
    e2 <- reflect env e2
    apply e1 p e2
  Let p x rhs body -> do
    reflect env (App (Lam p x body) p rhs)
  Case pos scrut arms -> do
    scrut <- norm env scrut
    arms <- mapM (normArm env) arms
    pure $ Syntax $ Case pos scrut arms

normArm :: Env -> Arm -> M Arm
normArm env (ArmTag c xs body) = do
  xys <- sequence [ do y <- fresh x; pure (x,y) | x <- xs ]
  let env' = foldr (uncurry Map.insert) env [ (x,syn y) | (x,y) <- xys ]
  body <- Reset (norm env' body)
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
  Wrap :: (Exp -> Exp) -> M a -> M a
  Reset :: M Exp -> M Exp

runM :: M Exp -> Exp
runM m0 = snd $ loop 1 m0 k0
  where
    k0 = \u x -> (u,x)

    loop :: Int -> M a -> (Int -> a -> Res) -> Res
    loop u m k = case m of
      Ret x -> k u x
      Bind m f -> loop u m $ \u x -> loop u (f x) k
      Fresh -> k (u+1) u
      Wrap f m  -> (u', f x) where (u',x) = loop u m k
      Reset m -> k u' x where (u',x) = loop u m k0

type Res = (State,Exp)
type State = Int
