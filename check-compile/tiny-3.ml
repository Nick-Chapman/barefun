(*stage3*)
let k () = ()
let g1 = Unit0 in
let g2 = Unit0 in
let g3 = fun me arg k ->
  let t1 = PRIM_GetChar(g1) in
  let t2 = PRIM_PutChar(t1) in
  let t3 = PRIM_PutChar(t1) in
  me g2 k in
let g4 = Unit0 in
let g3 = g3 in
g3 g4 k
