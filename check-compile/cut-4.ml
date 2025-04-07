(*Stage4 (CCF)*)
let k () = ()
let g2 = 0 in
let g3 = 0 in
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g2) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_CharChr(arg) in
      let k = [], fun [] arg -> arg g3 k in
      g1 t2 k in
  k t1 in
let g4 = 'X' in
let g5 = 52 in
let k = [], fun [] arg ->
  let k = [], fun [] arg ->
    let t1 = PRIM_PutChar(arg) in
    k t1 in
  arg g5 k in
g1 g4 k
