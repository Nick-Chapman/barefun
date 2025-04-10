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
      , ("%"            , prim2 ModInt)
      , ("*"            , prim2 MulInt)
      , ("-"            , prim2 SubInt)
      , ("/"            , prim2 DivInt)
      , ("::"           , construct2 cCons)
      , ("<"            , prim2 LessInt)
      , ("="            , prim2 EqInt)
      , ("chr"          , prim1 CharChr)
      , ("eq_char"      , prim2 EqChar)
      , ("get_char"     , prim1 GetChar)
      , ("ord"          , prim1 CharOrd)
      , ("put_char"     , prim1 PutChar)
      , ("string_index" , prim2 StringIndex)
      , ("string_length", prim1 StringLength)
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
