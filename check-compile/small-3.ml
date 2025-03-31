(*stage3*)
let k () = ()
let g1 = Unit0 in
let g2 = fun me arg k ->
  match arg with
  | Nil0 -> k g1
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    me t2 k in
let g3 = "LOAD\n" in
let g4 = "> " in
let g5 = Unit0 in
let g6 = '\n' in
let g7 = '\n' in
let g8 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g9 = Nil0 in
let g10 = fun me arg k ->
  let t1 = PRIM_GetChar(g5) in
  let t2 = PRIM_EqChar(t1,g6) in
  match t2 with
  | true1 ->
    let t3 = PRIM_PutChar(g7) in
    let k = [arg], fun [f1] arg -> arg f1 k in
    g8 g9 k
  | false0 ->
    let t3 = PRIM_PutChar(t1) in
    let t4 = Cons1[t1,arg] in
    me t4 k in
let g11 = Nil0 in
let g12 = '\n' in
let g13 = Unit0 in
let g14 = fun me arg k ->
  let t1 = PRIM_Explode(g4) in
  let k = [me], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      let k = [f1], fun [f1] arg ->
        let t1 = PRIM_PutChar(g12) in
        f1 g13 k in
      g2 arg k in
    g10 g11 k in
  g2 t1 k in
let g15 = "RUN\n" in
let g16 = Unit0 in
let g17 = "NEVER\n" in
let t1 = PRIM_Explode(g3) in
let k = [], fun [] arg ->
  let t1 = PRIM_Explode(g15) in
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let t1 = PRIM_Explode(g17) in
      g2 t1 k in
    g14 g16 k in
  g2 t1 k in
g2 t1 k
