module Top (main) where

import Exp1 (Exp(..),Arm(..),Id(..),Cid(..),Literal(..),Builtin(..))
import Parser (parse1)
import Text.Printf (printf)
import Par4 (Position)

import Data.Map (Map)
import qualified Data.Map as Map

main :: IO ()
main = do
  putStrLn "*barefun*"
  s <- readFile "example.fun"
  let e0 = parse1 s
  let e = wrapPrimDefs e0
  printf "----------\n%s\n----------\n" (show e)
  putStrLn "executing..."
  let input = "hello\nworld\n"
  run input (exec e) -- TODO: reinstate after parse/PP is good
  pure ()


wrapPrimDefs :: Exp -> Exp
wrapPrimDefs userExp =
  Let (Id "put_char") putCharExp $
  Let (Id "get_char") getCharExp $
  Let (Id "eq_char") eqCharExp $
  userExp
  where
    x = Id "x"
    y = Id "y"
    putCharExp = Lam x (Prim PutChar [x])
    getCharExp = Lam x (Prim GetChar [x])
    eqCharExp = Lam x (Lam y (Prim EqChar [x,y]))

run :: String -> Interaction -> IO ()
run = loop
  where
    loop :: String -> Interaction -> IO ()
    loop input = \case
      IDone ->
        pure ()
      IDebug mes i -> do
        printf "debug: %s" mes
        loop input i
      IPut c i -> do
        printf "Put: %s\n" (show c)
        loop input i
      IGet f ->
        case input of
          [] -> undefined
          c:input -> do
            printf "Get: %s\n" (show c)
            loop input (f c)


data Interaction
  = IDone
  | IDebug String Interaction
  | IPut Char Interaction
  | IGet (Char -> Interaction)

exec :: Exp -> Interaction
exec exp0 =
  eval Map.empty exp0 k0
  where
    k0 v =
      IDebug (printf "Final value: %s\n" (show v))
      $ IDone

    evals :: Env -> [Exp] -> ([Value] -> Interaction) -> Interaction
    evals env es k = case es of
      [] -> k []
      e:es -> do
        eval env e $ \v -> do
          evals env es $ \vs -> do
            k (v:vs)

    eval :: Env -> Exp -> (Value -> Interaction) -> Interaction
    eval env e k = case e of -- TODO: move \k into each branch to be sure it is always called

      Let x e1 e2 -> do
        eval env e1 $ \v1 -> do
        eval (Map.insert x v1 env) e2 k

      Lam x e -> do
        k (VClosure env x e)

      Var pos x -> do
        k (maybe err id $ Map.lookup x env)
          where err = error (show ("var-lookup",x,pos))

      App e1 pos e2 -> do
        eval env e1 $ \v1 -> do
          eval env e2 $ \v2 -> do
            apply v1 pos v2 k

      Con c es ->
        evals env es $ \vs -> do
        k (VCons c vs)

      Lit (LitC c) ->
        k (VChar c)

      Prim PutChar [x] -> do
        let e = Var Nothing x
        eval env e $ \v -> do
          case v of
            VChar c -> IPut c (k VUnit)
            _ -> error "PutChar/expected char"

      Prim GetChar [x] -> do
        let e = Var Nothing x
        eval env e $ \v -> do
          case v of
            VCons (Cid "Unit") [] -> IGet (\c -> k (VChar c))
            v -> error (show ("GetChar/expected unit",v))

      Prim EqChar [x1,x2] -> do
        let e1 = Var Nothing x1
        let e2 = Var Nothing x2
        eval env e1 $ \v1 -> do
          eval env e2 $ \v2 -> do
            case (v1,v2) of
              (VChar c1,VChar c2) -> do
                let b = (c1 == c2)
                let vTrue = VCons (Cid "True") []
                let vFalse = VCons (Cid "False") []
                let v = if b then vTrue else vFalse
                k v
              _ ->
                error (show ("GetChar/expected char/char",v1,v2))

      Prim b xs ->
        error (show ("prim/unsupported",b,length xs))

      Case e arms0 -> do
        eval env e $ \v -> do
          case v of
            VCons cidActual vArgs -> do
              let
                dispatch :: [Arm] -> Interaction
                dispatch arms = case arms of
                  [] ->
                    error "case match failure; no more arms!"

                  Arm cid xs body : arms ->
                    --IDebug (printf "arm?: %s ~ %s\n" (show cidActual) (show cid)) $ do
                    if cid /= cidActual then dispatch arms else do
                      if length xs /= length vArgs then error (show ("case arm bind length mismatch",xs,vArgs)) else do
                        --let e2 = Map.fromList (zip xs vArgs)
                        --let env' = Map.union e2 env
                        eval env body k -- TODO


              dispatch arms0

            _ -> error "case/scrut-expression not a constructed value"


    apply :: Value -> Position -> Value -> (Value -> Interaction) -> Interaction
    apply func p arg k = do
      --IDebug (printf "apply: %s @ %s\n" (show func) (show arg)) $ do
      let err tag = error (show ("apply",tag,p))
      case func of
        VUnit -> err "unit"
        VCons{} -> err "cons"
        VChar{} -> err "char"
        VClosure env x body -> do
          eval (Map.insert x arg env) body k


type Env = Map Id Value

data Value
  = VUnit -- TODO: fix confusion. A unit is a VCons value
  | VCons Cid [Value]
  | VChar Char
  | VClosure Env Id Exp

instance Show Value where
  show = \case
    VUnit -> "[unit]"
    VCons c vs -> printf "[vcons:%s:%s]" (show c) (show vs)
    VChar c -> printf"[char:%s]" (show c)
    VClosure{} -> "[closure]"
