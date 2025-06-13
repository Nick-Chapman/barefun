(*Stage4 (CCF)*)
let k () = ()
let g2 = Unit0 in
let g1 = fun arg0 k ->
  match arg0 with
  | Nil0 -> k g2
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g1 t2 k in
let g4 = "Hello, world!\n" in
let g3 = fun arg0 k ->
  let t1 = [arg0], fun [f1] arg0 k ->
    let t1 = PRIM_LessInt(arg0,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g4,arg0) in
      let t3 = PRIM_SubInt(arg0,1) in
      let t4 = Cons1[t2,f1] in
      let k = [t3], fun [f2] arg0 -> arg0 f2 k in
      g3 t4 k in
  k t1 in
let g5 = Nil0 in
let k = [], fun [] arg0 ->
  let k = [], fun [] arg0 -> g1 arg0 k in
  arg0 13 k in
g3 g5 k
