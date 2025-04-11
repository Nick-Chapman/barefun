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
let g5 = "Hello, world!\n" in
let g6 = 1 in
let g3 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,g4) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g5,arg) in
      let t3 = CID1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g6) in
        arg t1 k in
      g3 t3 k in
  k t1 in
let g7 = CID0 in
let g8 = 13 in
let k = [], fun [] arg ->
  let k = [], fun [] arg -> g1 arg k in
  arg g8 k in
g3 g7 k
