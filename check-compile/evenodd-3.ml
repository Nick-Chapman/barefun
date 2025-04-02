(*stage3*)
let k () = ()
let g2 = 0 in
let g3 = CID1 in
let g4 = 1 in
let g5 = 0 in
let g6 = CID0 in
let g7 = 1 in
let g1 = fun arg k ->
  let t1 = PRIM_EqInt(arg,g2) in
  match t1 with
  | true1 -> k g3
  | false0 ->
    let t2 = PRIM_SubInt(arg,g4) in
    let t3 = PRIM_EqInt(t2,g5) in
    match t3 with
    | true1 -> k g6
    | false0 ->
      let t4 = PRIM_SubInt(t2,g7) in
      g1 t4 k in
let g8 = 42 in
let g9 = 'E' in
let g10 = 'O' in
let g11 = 13 in
let g12 = 'E' in
let g13 = 'O' in
let k = [], fun [] arg ->
  let k = [], fun [] arg ->
    let t1 = PRIM_PutChar(arg) in
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let t1 = PRIM_PutChar(arg) in
        k t1 in
      match arg with
      | true1 -> k g12
      | false0 -> k g13 in
    g1 g11 k in
  match arg with
  | true1 -> k g9
  | false0 -> k g10 in
g1 g8 k
