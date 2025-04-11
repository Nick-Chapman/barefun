(*Stage4 (CCF)*)
let k () = ()
let g2 = '%' in
let g3 = ' ' in
let g5 = CID0 in
let g6 = '\n' in
let g7 = CID0 in
let g8 = CID0 in
let g4 = fun arg k ->
  let t1 = PRIM_GetChar(g5) in
  let t2 = PRIM_PutChar(t1) in
  let t3 = PRIM_EqChar(t1,g6) in
  match t3 with
  | true1 -> g1 g7 k
  | false0 -> g4 g8 k in
let g9 = CID0 in
let g1 = fun arg k ->
  let t1 = PRIM_PutChar(g2) in
  let t2 = PRIM_PutChar(g3) in
  g4 g9 k in
let g10 = CID0 in
g1 g10 k
