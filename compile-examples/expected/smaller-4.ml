(*Stage4 (CCF)*)
let k () = ()
let g2 = Unit0 in
let g1 = fun arg k ->
  match arg with
  | Nil0 -> k g2
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g1 t2 k in
let g5 = Unit0 in
let g6 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g6 t3 k in
  k t1 in
let g7 = Nil0 in
let g4 = fun arg k ->
  let t1 = PRIM_GetChar(g5) in
  let t2 = PRIM_EqChar(t1,'\n') in
  match t2 with
  | true1 ->
    let t3 = PRIM_PutChar('\n') in
    let k = [arg], fun [f2] arg -> arg f2 k in
    g6 g7 k
  | false0 ->
    let t3 = PRIM_PutChar(t1) in
    let t4 = Cons1[t1,arg] in
    g4 t4 k in
let g8 = Nil0 in
let g9 = Unit0 in
let g3 = fun arg k ->
  let t1 = PRIM_PutChar('%') in
  let t2 = PRIM_PutChar(' ') in
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let t1 = PRIM_PutChar('\n') in
      g3 g9 k in
    g1 arg k in
  g4 g8 k in
let g10 = Unit0 in
g3 g10 k
