module Predefined
  ( wrapPreDefs
  , cUnit,cFalse,cTrue,cNil,cCons
  ) where

import Builtin (Builtin(..))
import Exp1 (Prog(..),Def(..),Exp(..),Id(..), Cid(..))

wrapPreDefs :: Prog -> Prog
wrapPreDefs (Prog defs) =
  Prog ([ ValDef (Id name) exp | (name,exp) <- bindings ] ++ defs)
  where
    bindings :: [(String,Exp)]
    bindings =
      [ ("+"            , prim2 AddInt)
      , ("-"            , prim2 SubInt)
      , ("*"            , prim2 MulInt)
      , ("/"            , prim2 DivInt)
      , ("%"            , prim2 ModInt)
      , ("<"            , prim2 LessInt)
      , ("="            , prim2 EqInt)
      , ("eq_char"      , prim2 EqChar)
      , ("ord"          , prim1 CharOrd)
      , ("chr"          , prim1 CharChr)
      , ("explode"      , prim1 Explode)
      , ("put_char"     , prim1 PutChar)
      , ("get_char"     , prim1 GetChar)
      , ("::"           , construct2 cCons)
      ]
      where
        prim1 p1 = Lam x (Prim p1 [ex])
        prim2 p2 = Lam x (Lam y (Prim p2 [ex,ey]))
        construct2 c2 = Lam x (Lam y (Con c2 [ex,ey]))
        ex = Var Nothing x
        ey = Var Nothing y
        x = Id "x"
        y = Id "y"

cUnit,cFalse,cTrue,cNil,cCons :: Cid
cUnit = Cid "Unit"
cTrue = Cid "true"
cFalse = Cid "false"
cNil = Cid "[]"
cCons = Cid "::"
