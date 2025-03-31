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
let g17 = 0 in
let g18 = PRIM_EqInt(g8,g17) in
let g19 = '0' in
let g20 = Nil0 in
let g21 = Cons1[g19,g20] in
let g22 = Nil0 in
let g23 = " --> " in
let g24 = PRIM_Explode(g23) in
let g25 = '0' in
let g26 = PRIM_CharOrd(g25) in
let g28 = 0 in
let g29 = 10 in
let g30 = 10 in
let g27 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g28) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g29) in
      let t3 = PRIM_AddInt(g26,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g30) in
          arg t1 k in
        g27 arg k in
      t5 f1 k in
  k t1 in
let g31 = 0 in
let g32 = '0' in
let g33 = Nil0 in
let g34 = Cons1[g32,g33] in
let g35 = Nil0 in
let g37 = '\n' in
let k = [], fun [] arg ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      let k = [f1], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_EqInt(f1,g31) in
          let k = [], fun [] arg ->
            let k = [], fun [] arg ->
              let t1 = PRIM_PutChar(g37) in
              k t1 in
            g1 arg k in
          match t1 with
          | true1 -> k g34
          | false0 ->
            let k = [f1], fun [f1] arg -> arg f1 k in
            g27 g35 k in
        g1 g24 k in
      g1 arg k in
    match g18 with
    | true1 -> k g21
    | false0 ->
      let k = [], fun [] arg -> arg g8 k in
      g13 g22 k in
  g1 g10 k in
g3 g8 k
