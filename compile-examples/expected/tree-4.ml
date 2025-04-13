(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g1 t5 k in
  k t1 in
let g3 = CID0 in
let g2 = fun arg k ->
  match arg with
  | Nil0 -> k g3
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g2 t2 k in
let g4 = fun arg k ->
  match arg with
  | Num0(t1) -> k t1
  | Add1(t1,t2) ->
    let k = [t2], fun [f2] arg ->
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_AddInt(f2,arg) in
        k t1 in
      g4 f2 k in
    g4 t1 k
  | Sub2(t1,t2) ->
    let k = [t2], fun [f2] arg ->
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,arg) in
        k t1 in
      g4 f2 k in
    g4 t1 k in
let g5 = CID0 in
let g6 = CID0 in
let t1 = CID0[1000] in
let t2 = CID0[42] in
let t3 = CID0[3] in
let t4 = CID1[t2,t3] in
let t5 = CID2[t1,t4] in
let k = [], fun [] arg ->
  let t1 = PRIM_EqInt(arg,0) in
  let k = [], fun [] arg -> g2 arg k in
  match t1 with
  | true1 ->
    let t2 = CID1['0',g5] in
    k t2
  | false0 ->
    let k = [arg], fun [f2] arg -> arg f2 k in
    g1 g6 k in
g4 t5 k
