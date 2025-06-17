(*Stage4 (CCF)*)
let k () = ()
let g1 = fun [arg0,arg1] k ->
  let t1 = PRIM_SubInt(arg1,arg0) in
  k t1 in
let g2 = fun [arg0,arg1] k ->
  let k = [arg0], fun [f2] arg0 ->
    let k = [f2], fun [f2] arg0 -> f2 [arg0] k in
    f2 [arg0] k in
  arg0 [arg1] k in
let g3 = fun [arg0,arg1] k ->
  let k = [arg0], fun [f2] arg0 ->
    let k = [f2], fun [f2] arg0 -> f2 [arg0] k in
    f2 [arg0] k in
  arg0 [arg1] k in
let k = [], fun [] arg0 ->
  let k = [], fun [] arg0 ->
    let t1 = PRIM_CharChr(arg0) in
    let t2 = PRIM_PutChar(t1) in
    k t2 in
  g2 [g3,arg0,92] k in
g1 [1] k
