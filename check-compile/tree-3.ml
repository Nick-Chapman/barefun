(*stage3*)
let k () = ()
let g2 = 0 in
let g3 = 10 in
let g4 = 48 in
let g5 = 10 in
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g2) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g3) in
      let t3 = PRIM_AddInt(g4,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g5) in
        arg t1 k in
      g1 t5 k in
  k t1 in
let g7 = CID0 in
let g6 = fun arg k ->
  match arg with
  | Nil0 -> k g7
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g6 t2 k in
let g8 = fun arg k ->
  match arg with
  | Num0(t1) -> k t1
  | Add1(t1,t2) ->
    let k = [t2], fun [f1] arg ->
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      g8 f1 k in
    g8 t1 k
  | Sub2(t1,t2) ->
    let k = [t2], fun [f1] arg ->
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_SubInt(f1,arg) in
        k t1 in
      g8 f1 k in
    g8 t1 k in
let g9 = 1000 in
let g10 = CID0[g9] in
let g11 = 42 in
let g12 = CID0[g11] in
let g13 = 3 in
let g14 = CID0[g13] in
let g15 = CID1[g12,g14] in
let g16 = CID2[g10,g15] in
let g17 = 0 in
let g18 = '0' in
let g19 = CID0 in
let g20 = CID1[g18,g19] in
let g21 = CID0 in
let k = [], fun [] arg ->
  let t1 = PRIM_EqInt(arg,g17) in
  let k = [], fun [] arg -> g6 arg k in
  match t1 with
  | true1 -> k g20
  | false0 ->
    let k = [arg], fun [f1] arg -> arg f1 k in
    g1 g21 k in
g8 g16 k
