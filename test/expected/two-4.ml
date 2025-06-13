(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg0 k ->
  let t1 = [arg0], fun [f1] arg0 k ->
    let t1 = PRIM_AddInt(f1,arg0) in
    k t1 in
  k t1 in
let g2 = fun arg0 k -> k 60 in
let g3 = fun arg0 k -> k 5 in
let g4 = Unit0 in
let g5 = Unit0 in
let g6 = fun arg0 k ->
  let k = [], fun [] arg0 ->
    let k = [arg0], fun [f2] arg0 ->
      let k = [arg0], fun [f2] arg0 ->
        let k = [], fun [] arg0 -> k arg0 in
        arg0 f2 k in
      g1 f2 k in
    g3 g5 k in
  g2 g4 k in
let g7 = Unit0 in
let k = [], fun [] arg0 ->
  let t1 = PRIM_CharChr(arg0) in
  let t2 = PRIM_PutChar(t1) in
  k t2 in
g6 g7 k
