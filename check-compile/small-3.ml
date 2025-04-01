(*stage3*)
let k () = ()
let g2 = Unit0 in
let g1 = fun arg k ->
  match arg with
  | Nil0 -> k g2
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g1 t2 k in
let g3 = 'L' in
let g4 = 'O' in
let g5 = 'A' in
let g6 = 'D' in
let g7 = '\n' in
let g8 = CID0 in
let g9 = CID1[g7,g8] in
let g10 = CID1[g6,g9] in
let g11 = CID1[g5,g10] in
let g12 = CID1[g4,g11] in
let g13 = CID1[g3,g12] in
let g15 = '>' in
let g16 = ' ' in
let g17 = CID0 in
let g18 = CID1[g16,g17] in
let g19 = CID1[g15,g18] in
let g22 = Unit0 in
let g23 = '\n' in
let g25 = '\n' in
let g26 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g26 t3 k in
  k t1 in
let g27 = Nil0 in
let g21 = fun arg k ->
  let t1 = PRIM_GetChar(g22) in
  let t2 = PRIM_EqChar(t1,g23) in
  match t2 with
  | true1 ->
    let t3 = PRIM_PutChar(g25) in
    let k = [arg], fun [f1] arg -> arg f1 k in
    g26 g27 k
  | false0 ->
    let t3 = PRIM_PutChar(t1) in
    let t4 = Cons1[t1,arg] in
    g21 t4 k in
let g28 = Nil0 in
let g30 = '\n' in
let g31 = Unit0 in
let g14 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let t1 = PRIM_PutChar(g30) in
        g14 g31 k in
      g1 arg k in
    g21 g28 k in
  g1 g19 k in
let g33 = 'R' in
let g34 = 'U' in
let g35 = 'N' in
let g36 = '\n' in
let g37 = CID0 in
let g38 = CID1[g36,g37] in
let g39 = CID1[g35,g38] in
let g40 = CID1[g34,g39] in
let g41 = CID1[g33,g40] in
let g42 = Unit0 in
let g43 = 'N' in
let g44 = 'E' in
let g45 = 'V' in
let g46 = 'E' in
let g47 = 'R' in
let g48 = '\n' in
let g49 = CID0 in
let g50 = CID1[g48,g49] in
let g51 = CID1[g47,g50] in
let g52 = CID1[g46,g51] in
let g53 = CID1[g45,g52] in
let g54 = CID1[g44,g53] in
let g55 = CID1[g43,g54] in
let k = [], fun [] arg ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg -> g1 g55 k in
    g14 g42 k in
  g1 g41 k in
g1 g13 k
