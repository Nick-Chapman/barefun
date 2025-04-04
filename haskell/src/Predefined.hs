module Predefined
  ( wrapPreDefs
  ) where

import Builtin (Builtin(..))
import Par4 (Position(..))
import Stage0_AST (Prog(..),Def(..),Exp(..), cCons, mkUserId,Bid(..))

wrapPreDefs :: Prog -> Prog
wrapPreDefs (Prog defs) =
  Prog ([ ValDef (Bid noPos (mkUserId x)) exp | (x,exp) <- bindings ] ++ defs)
  where
    noPos = Position 0 0 -- TODO: can we do better than noPos?
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
        prim1 p1 = Lam noPos x (Prim noPos p1 [ex])
        prim2 p2 = Lam noPos x (Lam noPos y (Prim noPos p2 [ex,ey]))
        construct2 c2 = Lam noPos x (Lam noPos y (Con noPos c2 [ex,ey]))
        ex = Var noPos x'
        ey = Var noPos y'
        x = Bid noPos x'
        y = Bid noPos y'
        x' = mkUserId "x"
        y' = mkUserId "y"
