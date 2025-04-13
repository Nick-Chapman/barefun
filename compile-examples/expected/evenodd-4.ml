(*Stage4 (CCF)*)
let k () = ()
let g2 = CID1 in
let g3 = CID0 in
let g1 = fun arg k ->
  let t1 = PRIM_EqInt(arg,0) in
  match t1 with
  | true1 -> k g2
  | false0 ->
    let t2 = PRIM_SubInt(arg,1) in
    let t3 = PRIM_EqInt(t2,0) in
    match t3 with
    | true1 -> k g3
    | false0 ->
      let t4 = PRIM_SubInt(t2,1) in
      g1 t4 k in
let k = [], fun [] arg ->
  let k = [], fun [] arg ->
    let t1 = PRIM_PutChar(arg) in
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let t1 = PRIM_PutChar(arg) in
        k t1 in
      match arg with
      | true1 -> k 'E'
      | false0 -> k 'O' in
    g1 13 k in
  match arg with
  | true1 -> k 'E'
  | false0 -> k 'O' in
g1 42 k
