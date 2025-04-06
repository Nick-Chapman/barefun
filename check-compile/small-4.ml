(*Stage4 (CCF)*)
let k () = ()
let g2 = CID0 in
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
let g21 = CID0 in
let g22 = '\n' in
let g23 = '\n' in
let g24 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g24 t3 k in
  k t1 in
let g25 = CID0 in
let g20 = fun arg k ->
  let t1 = PRIM_GetChar(g21) in
  let t2 = PRIM_EqChar(t1,g22) in
  match t2 with
  | true1 ->
    let t3 = PRIM_PutChar(g23) in
    let k = [arg], fun [f2] arg -> arg f2 k in
    g24 g25 k
  | false0 ->
    let t3 = PRIM_PutChar(t1) in
    let t4 = CID1[t1,arg] in
    g20 t4 k in
let g26 = CID0 in
let g27 = '\n' in
let g28 = CID0 in
let g14 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let t1 = PRIM_PutChar(g27) in
        g14 g28 k in
      g1 arg k in
    g20 g26 k in
  g1 g19 k in
let g29 = 'R' in
let g30 = 'U' in
let g31 = 'N' in
let g32 = '\n' in
let g33 = CID0 in
let g34 = CID1[g32,g33] in
let g35 = CID1[g31,g34] in
let g36 = CID1[g30,g35] in
let g37 = CID1[g29,g36] in
let g38 = CID0 in
let g39 = 'N' in
let g40 = 'E' in
let g41 = 'V' in
let g42 = 'E' in
let g43 = 'R' in
let g44 = '\n' in
let g45 = CID0 in
let g46 = CID1[g44,g45] in
let g47 = CID1[g43,g46] in
let g48 = CID1[g42,g47] in
let g49 = CID1[g41,g48] in
let g50 = CID1[g40,g49] in
let g51 = CID1[g39,g50] in
let k = [], fun [] arg ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg -> g1 g51 k in
    g14 g38 k in
  g1 g37 k in
g1 g13 k
