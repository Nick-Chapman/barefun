(*Stage4 (CCF)*)
let k () = ()
let g2 = Unit0 in
let g3 = Unit0 in
let g1 = fun arg k ->
  let t1 = PRIM_GetChar(g2) in
  let t2 = PRIM_PutChar(t1) in
  let t3 = PRIM_PutChar(t1) in
  g1 g3 k in
let g4 = Unit0 in
g1 g4 k
