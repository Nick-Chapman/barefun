(*stage3; un-normalized*)
let k () = ()
let g1 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  k t1 in
let g2 = fun arg k ->
  let t1 = PRIM_GetChar(arg) in
  k t1 in
let g3 = Unit0 in
let g4 = Unit0 in
let g5 = fun me arg k ->
  let k = [me], fun [f1] arg ->
    let k = [f1,arg], fun [f1,f2] arg ->
      let k = [f1], fun [f1] arg -> f1 g4 k in
      g1 f2 k in
    g1 arg k in
  g2 g3 k in
let g6 = Unit0 in
let g5 = g5 in
g5 g6 k
