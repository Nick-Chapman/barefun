(*Stage4 (CCF)*)
let k () = ()
let g2 = ' ' in
let g3 = CID0 in
let g4 = '\n' in
let g5 = CID0 in
let g6 = CID0 in
let g1 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  let t2 = PRIM_PutChar(g2) in
  let t3 = [arg], fun [f1] me arg k ->
    let t1 = PRIM_GetChar(g3) in
    let t2 = PRIM_PutChar(t1) in
    let t3 = PRIM_EqChar(t1,g4) in
    match t3 with
    | true1 -> g1 f1 k
    | false0 -> me g5 k in
  t3 g6 k in
let g7 = '%' in
g1 g7 k
