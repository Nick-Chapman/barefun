(*Stage4 (CCF)*)
let k () = ()
let g3 = Unit0 in
let g4 = Unit0 in
let g5 = Unit0 in
let g2 = fun arg k ->
  let t1 = PRIM_GetChar(g3) in
  let t2 = PRIM_PutChar(t1) in
  let t3 = PRIM_EqChar(t1,'\n') in
  match t3 with
  | true1 -> g1 g4 k
  | false0 -> g2 g5 k in
let g6 = Unit0 in
let g1 = fun arg k ->
  let t1 = PRIM_PutChar('%') in
  let t2 = PRIM_PutChar(' ') in
  g2 g6 k in
let g7 = Unit0 in
g1 g7 k
