(*stage3*)
let k () = ()
let g2 = CID0 in
let g1 = fun arg k ->
  match arg with
  | Nil0 -> k g2
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g1 t2 k in
let g4 = 2 in
let g5 = 1 in
let g6 = 2 in
let g3 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g4) in
  match t1 with
  | true1 -> k arg
  | false0 ->
    let t2 = PRIM_SubInt(arg,g5) in
    let k = [arg], fun [f1] arg ->
      let t1 = PRIM_SubInt(f1,g6) in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      g3 t1 k in
    g3 t2 k in
let g7 = 20 in
let g8 = 'f' in
let g9 = 'i' in
let g10 = 'b' in
let g11 = ' ' in
let g12 = CID0 in
let g13 = CID1[g11,g12] in
let g14 = CID1[g10,g13] in
let g15 = CID1[g9,g14] in
let g16 = CID1[g8,g15] in
let g18 = 0 in
let g19 = 10 in
let g20 = 48 in
let g21 = 10 in
let g17 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g18) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g19) in
      let t3 = PRIM_AddInt(g20,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g21) in
        arg t1 k in
      g17 t5 k in
  k t1 in
let g22 = CID0 in
let g23 = 20 in
let g24 = ' ' in
let g25 = '-' in
let g26 = '-' in
let g27 = '>' in
let g28 = ' ' in
let g29 = CID0 in
let g30 = CID1[g28,g29] in
let g31 = CID1[g27,g30] in
let g32 = CID1[g26,g31] in
let g33 = CID1[g25,g32] in
let g34 = CID1[g24,g33] in
let g36 = 0 in
let g37 = 10 in
let g38 = 48 in
let g39 = 10 in
let g35 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g36) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g37) in
      let t3 = PRIM_AddInt(g38,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g39) in
        arg t1 k in
      g35 t5 k in
  k t1 in
let g40 = 0 in
let g41 = '0' in
let g42 = CID0 in
let g43 = CID1[g41,g42] in
let g44 = CID0 in
let g45 = '\n' in
let k = [], fun [] arg ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      let k = [f1], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let k = [f1], fun [f1] arg ->
            let t1 = PRIM_EqInt(f1,g40) in
            let k = [], fun [] arg ->
              let k = [], fun [] arg ->
                let t1 = PRIM_PutChar(g45) in
                k t1 in
              g1 arg k in
            match t1 with
            | true1 -> k g43
            | false0 ->
              let k = [f1], fun [f1] arg -> arg f1 k in
              g35 g44 k in
          g1 g34 k in
        g1 arg k in
      arg g23 k in
    g17 g22 k in
  g1 g16 k in
g3 g7 k
