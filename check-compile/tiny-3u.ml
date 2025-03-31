(*stage3; un-normalized*)
let k () = ()
let g12 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  k t1 in
let g13 = fun arg k ->
  let t1 = PRIM_GetChar(arg) in
  k t1 in
let g16 = Unit0 in
let g17 = Unit0 in
let g15 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [arg], fun [f1] arg ->
      let k = [], fun [] arg -> g15 g17 k in
      g12 f1 k in
    g12 arg k in
  g13 g16 k in
let g18 = Unit0 in
let g15 = g15 in
g15 g18 k
