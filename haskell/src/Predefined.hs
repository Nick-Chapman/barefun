module Predefined
  ( wrapPreDefs
  ) where

import Primitive (Primitive(..))
import Par4 (Position(..))
import Stage0_AST (Prog(..),Def(..),Exp(..),mkUserId,Bid(..))
import Value (cCons)

wrapPreDefs :: Prog -> Prog
wrapPreDefs (Prog defs) =
  Prog ([ ValDef (Bid noPos (mkUserId x)) exp | (x,exp) <- bindings ] ++ defs)
  where
    noPos = Position 0 0
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
      , ("make_bytes"   , prim1 MakeBytes)
      , ("freeze_bytes" , prim1 FreezeBytes)
      , ("thaw_bytes"   , prim1 ThawBytes)
      , ("set_bytes"    , prim3 SetBytes)
      , ("get_bytes"    , prim2 GetBytes)
      , ("ref"          , prim1 MakeRef)
      , ("!"            , prim1 DeRef)
      , (":="           , prim2 SetRef)
      , ("crash"        , prim1 Crash)
      , ("load_sector"  , prim2 LoadSec)
      , ("store_sector" , prim2 StoreSec)
      , ("free_words"   , prim1 FreeWords)
      , ("get_ticks"  , prim1 Get_ticks)
      , ("init_interrupt_mode"  , prim1 Init_interrupt_mode)
      , ("wait_for_interrupt"  , prim1 Wait_for_interrupt)
      , ("is_keyboard_ready" , prim1 Is_keyboard_ready)
      , ("get_keyboard_last_scancode" , prim1 Get_keyboard_last_scancode)
      , ("noinline", prim1 Noinline)

      -- The arg-count and types of predefined names which wrap Primitive primitives must match:
      -- (a) The evaluation semantic defined in Primitive.hs
      -- (b) The stage5 compilation of the primitive given in Stage5_ASM_Compiler.hs
      ]
      where
        prim1 p1 = Lam noPos x (Prim noPos p1 [ex])
        prim2 p2 = Lam noPos x (Lam noPos y (Prim noPos p2 [ex,ey]))
        prim3 p3 = Lam noPos x (Lam noPos y (Lam noPos z (Prim noPos p3 [ex,ey,ez])))
        construct2 c2 = Lam noPos x (Lam noPos y (Con noPos c2 [ex,ey]))
        ex = Var noPos x'
        ey = Var noPos y'
        ez = Var noPos z'
        x = Bid noPos x'
        y = Bid noPos y'
        z = Bid noPos z'
        x' = mkUserId "x"
        y' = mkUserId "y"
        z' = mkUserId "z"
