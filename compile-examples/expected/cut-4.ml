(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_CharChr(arg) in
      let k = [], fun [] arg -> arg 0 k in
      g1 t2 k in
  k t1 in
let k = [], fun [] arg ->
  let k = [], fun [] arg ->
    let t1 = PRIM_PutChar(arg) in
    k t1 in
  arg 52 k in
g1 'X' k
