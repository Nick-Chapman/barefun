(*Stage4 (CCF)*)
let k () = ()
let g2 = CID0 in
let g1 = fun arg k ->
  match arg with
  | Nil0 -> k g2
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g1 t2 k in
let g4 = 0 in
let g5 = 10 in
let g6 = 48 in
let g7 = 10 in
let g3 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g4) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g5) in
      let t3 = PRIM_AddInt(g6,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g7) in
        arg t1 k in
      g3 t5 k in
  k t1 in
let g8 = CID0 in
let g9 = 42 in
let k = [], fun [] arg ->
  let k = [], fun [] arg -> g1 arg k in
  arg g9 k in
g3 g8 k
