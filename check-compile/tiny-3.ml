(*stage3*)
let k () = ()
let g2 = Unit0 in
let g3 = Unit0 in
let g1 = fun me arg k ->
  let t1 = PRIM_GetChar(g2) in
  let t2 = PRIM_PutChar(t1) in
  let t3 = PRIM_PutChar(t1) in
  me g3 k in
let g4 = Unit0 in
let g1 = g1 in
g1 g4 k
