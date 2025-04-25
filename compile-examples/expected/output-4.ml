(*Stage4 (CCF)*)
let k () = ()
let g2 = Unit0 in
let g1 = fun arg k ->
  let t1 = PRIM_LessInt(255,arg) in
  match t1 with
  | true1 -> k g2
  | false0 ->
    let t2 = PRIM_PutChar(' ') in
    let t3 = PRIM_CharChr(arg) in
    let t4 = PRIM_PutChar(t3) in
    let t5 = PRIM_AddInt(arg,1) in
    g1 t5 k in
g1 0 k
