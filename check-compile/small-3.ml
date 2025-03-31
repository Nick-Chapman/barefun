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
let g5 = "> " in
let g8 = Unit0 in
let g9 = '\n' in
let g11 = '\n' in
let g12 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g12 t3 k in
  k t1 in
let g13 = Nil0 in
let g7 = fun arg k ->
  let t1 = PRIM_GetChar(g8) in
  let t2 = PRIM_EqChar(t1,g9) in
  match t2 with
  | true1 ->
    let t3 = PRIM_PutChar(g11) in
    let k = [arg], fun [f1] arg -> arg f1 k in
    g12 g13 k
  | false0 ->
    let t3 = PRIM_PutChar(t1) in
    let t4 = Cons1[t1,arg] in
    g7 t4 k in
let g14 = Nil0 in
let g16 = '\n' in
let g17 = Unit0 in
let g4 = fun arg k ->
  let t1 = PRIM_Explode(g5) in
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let t1 = PRIM_PutChar(g16) in
        g4 g17 k in
      g1 arg k in
    g7 g14 k in
  g1 t1 k in
let g19 = "RUN\n" in
let g20 = Unit0 in
let g21 = "NEVER\n" in
let t1 = PRIM_Explode(g3) in
let k = [], fun [] arg ->
  let t1 = PRIM_Explode(g19) in
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let t1 = PRIM_Explode(g21) in
      g1 t1 k in
    g4 g20 k in
  g1 t1 k in
g1 t1 k
