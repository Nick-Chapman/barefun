(*Stage4 (CCF)*)
let k () = ()
let g2 = Unit in
let g1 = fun [arg0] k ->
  match arg0 with
  | Nil -> k g2
  | Cons(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g1 [t2] k in
let g4 = "Hello, world!\n" in
let g3 = fun [arg0,arg1] k ->
  let t1 = PRIM_LessInt(arg1,0) in
  match t1 with
  | true -> k arg0
  | false ->
    let t2 = PRIM_StringIndex(g4,arg1) in
    let t3 = PRIM_SubInt(arg1,1) in
    let t4 = Cons[t2,arg0] in
    g3 [t4,t3] k in
let g5 = Nil in
let k = [], fun [] arg0 -> g1 [arg0] k in
g3 [g5,13] k
