(*Stage4 (CCF)*)
let k () = ()
let g2 = Unit0 in
let g3 = Unit0 in
let g4 = Unit0 in
let g5 = Unit0 in
let g1 = fun arg k ->
  let t1 = PRIM_Wait_for_interrupt(g2) in
  let t2 = PRIM_Is_keyboard_ready(g3) in
  match t2 with
  | true1 ->
    let t3 = PRIM_Get_keyboard_last_scancode(g4) in
    k t3
  | false0 -> g1 g5 k in
let g7 = Unit0 in
let g8 = Unit0 in
let g6 = fun arg k ->
  let k = [], fun [] arg ->
    let t1 = PRIM_CharOrd(arg) in
    let t2 = PRIM_ModInt(t1,10) in
    let t3 = PRIM_DivInt(t1,10) in
    let t4 = PRIM_ModInt(t3,10) in
    let t5 = PRIM_DivInt(t3,10) in
    let t6 = PRIM_PutChar('{') in
    let t7 = PRIM_AddInt(t5,48) in
    let t8 = PRIM_CharChr(t7) in
    let t9 = PRIM_PutChar(t8) in
    let t10 = PRIM_AddInt(t4,48) in
    let t11 = PRIM_CharChr(t10) in
    let t12 = PRIM_PutChar(t11) in
    let t13 = PRIM_AddInt(t2,48) in
    let t14 = PRIM_CharChr(t13) in
    let t15 = PRIM_PutChar(t14) in
    let t16 = PRIM_PutChar('}') in
    let t17 = PRIM_PutChar(' ') in
    g6 g8 k in
  g1 g7 k in
let g10 = "Press/release keys; see the scan codes...\n" in
let g11 = Unit0 in
let g9 = fun arg k ->
  let t1 = PRIM_LessInt(arg,42) in
  match t1 with
  | true1 ->
    let t2 = PRIM_StringIndex(g10,arg) in
    let t3 = PRIM_PutChar(t2) in
    let t4 = PRIM_AddInt(arg,1) in
    g9 t4 k
  | false0 -> k g11 in
let g12 = Unit0 in
let g13 = Unit0 in
let k = [], fun [] arg ->
  let t1 = PRIM_Init_interrupt_mode(g12) in
  g6 g13 k in
g9 0 k
