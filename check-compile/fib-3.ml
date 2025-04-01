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
      let t1 = [arg], fun [f1] arg k ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      let t2 = PRIM_SubInt(f1,g6) in
      let k = [t1], fun [f1] arg -> f1 arg k in
      g3 t2 k in
    g3 t2 k in
let g8 = 20 in
let g9 = "fib " in
let g10 = PRIM_Explode(g9) in
let g11 = '0' in
let g12 = PRIM_CharOrd(g11) in
let g14 = 0 in
let g15 = 10 in
let g16 = 10 in
let g13 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g14) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g15) in
      let t3 = PRIM_AddInt(g12,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g16) in
          arg t1 k in
        g13 arg k in
      t5 f1 k in
  k t1 in
let g17 = 20 in
let g18 = 0 in
let g19 = PRIM_EqInt(g17,g18) in
let g20 = '0' in
let g21 = Nil0 in
let g22 = Cons1[g20,g21] in
let g23 = Nil0 in
let g24 = 20 in
let g25 = " --> " in
let g26 = PRIM_Explode(g25) in
let g27 = '0' in
let g28 = PRIM_CharOrd(g27) in
let g30 = 0 in
let g31 = 10 in
let g32 = 10 in
let g29 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g30) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g31) in
      let t3 = PRIM_AddInt(g28,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g32) in
          arg t1 k in
        g29 arg k in
      t5 f1 k in
  k t1 in
let g33 = 0 in
let g34 = '0' in
let g35 = Nil0 in
let g36 = Cons1[g34,g35] in
let g37 = Nil0 in
let g39 = '\n' in
let k = [], fun [] arg ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      let k = [f1], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_EqInt(f1,g33) in
          let k = [], fun [] arg ->
            let k = [], fun [] arg ->
              let t1 = PRIM_PutChar(g39) in
              k t1 in
            g1 arg k in
          match t1 with
          | true1 -> k g36
          | false0 ->
            let k = [f1], fun [f1] arg -> arg f1 k in
            g29 g37 k in
        g1 g26 k in
      g1 arg k in
    match g19 with
    | true1 -> k g22
    | false0 ->
      let k = [], fun [] arg -> arg g24 k in
      g13 g23 k in
  g1 g10 k in
g3 g8 k
