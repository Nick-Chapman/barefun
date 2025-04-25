(*Stage4 (CCF)*)
let k () = ()
let g2 = Unit0 in
let g1 = fun arg k ->
  let t1 = PRIM_LessInt(255,arg) in
  match t1 with
  | true1 -> k g2
  | false0 ->
    let t2 = PRIM_PutChar(' ') in
    let t3 = PRIM_EqInt(arg,8) in
    let k = [arg], fun [f2] arg ->
      let t1 = PRIM_AddInt(f2,1) in
      g1 t1 k in
    match t3 with
    | true1 ->
      let t4 = PRIM_PutChar('[') in
      let t5 = PRIM_PutChar('D') in
      let t6 = PRIM_PutChar('E') in
      let t7 = PRIM_PutChar('L') in
      let t8 = PRIM_PutChar(']') in
      k t8
    | false0 ->
      let t4 = PRIM_EqInt(arg,10) in
      match t4 with
      | true1 ->
        let t5 = PRIM_PutChar('[') in
        let t6 = PRIM_PutChar('N') in
        let t7 = PRIM_PutChar('L') in
        let t8 = PRIM_PutChar(']') in
        k t8
      | false0 ->
        let t5 = PRIM_CharChr(arg) in
        let t6 = PRIM_PutChar(t5) in
        k t6 in
let k = [], fun [] arg ->
  let t1 = PRIM_PutChar('\n') in
  k t1 in
g1 0 k
