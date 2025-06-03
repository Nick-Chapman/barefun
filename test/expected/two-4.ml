(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_AddInt(f1,arg) in
    k t1 in
  k t1 in
let g2 = fun arg k -> k 60 in
let g3 = fun arg k -> k 5 in
let g4 = Unit0 in
let g5 = Unit0 in
let g6 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [arg], fun [f2] arg ->
      let k = [arg], fun [f2] arg ->
        let k = [], fun [] arg -> k arg in
        arg f2 k in
      g1 f2 k in
    g3 g5 k in
  g2 g4 k in
let g7 = Unit0 in
let k = [], fun [] arg ->
  let t1 = PRIM_CharChr(arg) in
  let t2 = PRIM_PutChar(t1) in
  k t2 in
g6 g7 k
