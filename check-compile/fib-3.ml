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
let g23 = CID0 in
let g24 = '0' in
let g25 = Nil0 in
let g26 = Cons1[g24,g25] in
let g27 = Nil0 in
let g28 = 20 in
let g29 = ' ' in
let g30 = '-' in
let g31 = '-' in
let g32 = '>' in
let g33 = ' ' in
let g34 = CID0 in
let g35 = CID1[g33,g34] in
let g36 = CID1[g32,g35] in
let g37 = CID1[g31,g36] in
let g38 = CID1[g30,g37] in
let g39 = CID1[g29,g38] in
let g41 = 0 in
let g42 = 10 in
let g43 = 48 in
let g44 = 10 in
let g40 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g41) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g42) in
      let t3 = PRIM_AddInt(g43,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g44) in
        arg t1 k in
      g40 t5 k in
  k t1 in
let g45 = 0 in
let g46 = '0' in
let g47 = Nil0 in
let g48 = Cons1[g46,g47] in
let g49 = Nil0 in
let g51 = '\n' in
let k = [], fun [] arg ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      let k = [f1], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_EqInt(f1,g45) in
          let k = [], fun [] arg ->
            let k = [], fun [] arg ->
              let t1 = PRIM_PutChar(g51) in
              k t1 in
            g1 arg k in
          match t1 with
          | true1 -> k g48
          | false0 ->
            let k = [f1], fun [f1] arg -> arg f1 k in
            g40 g49 k in
        g1 g39 k in
      g1 arg k in
    match g23 with
    | true1 -> k g26
    | false0 ->
      let k = [], fun [] arg -> arg g28 k in
      g18 g27 k in
  g1 g17 k in
g3 g8 k
