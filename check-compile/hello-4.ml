(*Stage4 (CCF)*)
let k () = ()
let g2 = CID0 in
let g1 = fun arg k ->
  match arg with
  | Nil0 -> k g2
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g1 t2 k in
let g3 = fun arg k -> k arg in
let g4 = "Hello, world!\n" in
let k = [], fun [] arg ->
  let t1 = PRIM_Explode(arg) in
  g1 t1 k in
g3 g4 k
