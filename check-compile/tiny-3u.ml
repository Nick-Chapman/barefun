(*stage3; un-normalized*)
let k () = ()
let g12 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  k t1 in
let g13 = fun arg k ->
  let t1 = PRIM_GetChar(arg) in
  k t1 in
let g15 = Unit0 in
let g16 = Unit0 in
let g17 = fun me arg k ->
  let k = [me], fun [f1] arg ->
    let k = [f1,arg], fun [f1,f2] arg ->
      let k = [f1], fun [f1] arg -> f1 g16 k in
      g12 f2 k in
    g12 arg k in
  g13 g15 k in
let g18 = Unit0 in
let g17 = g17 in
g17 g18 k
