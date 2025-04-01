(*stage3*)
let k () = ()
let g2 = Unit0 in
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
let g8 = 20 in
let g9 = 'f' in
let g10 = 'i' in
let g11 = 'b' in
let g12 = ' ' in
let g13 = CID0 in
let g14 = CID1[g12,g13] in
let g15 = CID1[g11,g14] in
let g16 = CID1[g10,g15] in
let g17 = CID1[g9,g16] in
let g19 = 0 in
let g20 = 10 in
let g21 = 48 in
let g22 = 10 in
let g18 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g19) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g20) in
      let t3 = PRIM_AddInt(g21,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g22) in
        arg t1 k in
      g18 t5 k in
  k t1 in
let g23 = Nil0 in
let g24 = 20 in
let g25 = ' ' in
let g26 = '-' in
let g27 = '-' in
let g28 = '>' in
let g29 = ' ' in
let g30 = CID0 in
let g31 = CID1[g29,g30] in
let g32 = CID1[g28,g31] in
let g33 = CID1[g27,g32] in
let g34 = CID1[g26,g33] in
let g35 = CID1[g25,g34] in
let g37 = 0 in
let g38 = 10 in
let g39 = 48 in
let g40 = 10 in
let g36 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g37) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g38) in
      let t3 = PRIM_AddInt(g39,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g40) in
        arg t1 k in
      g36 t5 k in
  k t1 in
let g41 = 0 in
let g42 = '0' in
let g43 = Nil0 in
let g44 = Cons1[g42,g43] in
let g45 = Nil0 in
let g47 = '\n' in
let k = [], fun [] arg ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      let k = [f1], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let k = [f1], fun [f1] arg ->
            let t1 = PRIM_EqInt(f1,g41) in
            let k = [], fun [] arg ->
              let k = [], fun [] arg ->
                let t1 = PRIM_PutChar(g47) in
                k t1 in
              g1 arg k in
            match t1 with
            | true1 -> k g44
            | false0 ->
              let k = [f1], fun [f1] arg -> arg f1 k in
              g36 g45 k in
          g1 g35 k in
        g1 arg k in
      arg g24 k in
    g18 g23 k in
  g1 g17 k in
g3 g8 k
