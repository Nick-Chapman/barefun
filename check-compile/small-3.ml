(*stage3*)
let k () = ()
let g2 = Unit0 in
let g1 = fun arg k ->
  match arg with
  | Nil0 -> k g2
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g1 t2 k in
let g3 = "LOAD\n" in
let g4 = PRIM_Explode(g3) in
let g6 = "> " in
let g7 = PRIM_Explode(g6) in
let g10 = Unit0 in
let g11 = '\n' in
let g13 = '\n' in
let g14 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g14 t3 k in
  k t1 in
let g15 = Nil0 in
let g9 = fun arg k ->
  let t1 = PRIM_GetChar(g10) in
  let t2 = PRIM_EqChar(t1,g11) in
  match t2 with
  | true1 ->
    let t3 = PRIM_PutChar(g13) in
    let k = [arg], fun [f1] arg -> arg f1 k in
    g14 g15 k
  | false0 ->
    let t3 = PRIM_PutChar(t1) in
    let t4 = Cons1[t1,arg] in
    g9 t4 k in
let g16 = Nil0 in
let g18 = '\n' in
let g19 = Unit0 in
let g5 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let t1 = PRIM_PutChar(g18) in
        g5 g19 k in
      g1 arg k in
    g9 g16 k in
  g1 g7 k in
let g21 = "RUN\n" in
let g22 = PRIM_Explode(g21) in
let g23 = Unit0 in
let g24 = "NEVER\n" in
let g25 = PRIM_Explode(g24) in
let k = [], fun [] arg ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg -> g1 g25 k in
    g5 g23 k in
  g1 g22 k in
g1 g4 k
