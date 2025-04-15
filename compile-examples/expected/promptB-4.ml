(*Stage4 (CCF)*)
let k () = ()
let g2 = Unit0 in
let g3 = Unit0 in
let g4 = Unit0 in
let g1 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  let t2 = PRIM_PutChar(' ') in
  let t3 = [arg], fun [f1] me arg k ->
    let t1 = PRIM_GetChar(g2) in
    let t2 = PRIM_PutChar(t1) in
    let t3 = PRIM_EqChar(t1,'\n') in
    match t3 with
    | true1 -> g1 f1 k
    | false0 -> me g3 k in
  t3 g4 k in
g1 '%' k
