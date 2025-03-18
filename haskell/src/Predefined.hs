module Predefined (defs) where

import Builtin (Builtin(..))
import Exp1 (Def(..),Exp(..),Id(..))
import Value (cCons) -- TODO: avoid dep on Value by moving Cid into Exp1

defs :: [Def]
defs = [ ValDef (Id name) exp | (name,exp) <- bindings ]
  where
    bindings :: [(String,Exp)]
    bindings = -- TODO: capture common patterns
      [ ("put_char", Lam x (Prim PutChar [ex]))
      , ("get_char", Lam x (Prim GetChar [ex]))
      , ("eq_char", Lam x (Lam y (Prim EqChar [ex,ey])))
      , ("eq_int", Lam x (Lam y (Prim EqInt [ex,ey])))

      , ("less_int", Lam x (Lam y (Prim LessInt [ex,ey])))

      , ("+", Lam x (Lam y (Prim AddInt [ex,ey])))
      , ("-", Lam x (Lam y (Prim SubInt [ex,ey])))
      , ("%", Lam x (Lam y (Prim ModInt [ex,ey])))
      , ("/", Lam x (Lam y (Prim DivInt [ex,ey])))
      , ("*", Lam x (Lam y (Prim MulInt [ex,ey])))

      , ("ord", Lam x (Prim CharOrd [ex]))
      , ("chr", Lam x (Prim CharChr [ex]))
      , ("explode", Lam x (Prim Explode [ex]))

      -- not a primitive but an infix constructor
      , ("::", Lam x (Lam y (Con cCons [ex,ey])))
      ]
      where
        ex = Var Nothing x
        ey = Var Nothing y
        x = Id "x"
        y = Id "y"
