(*stage3*)
let k () = ()
let g2 = Unit0 in
let g1 = fun me arg k ->
  match arg with
  | Nil0 -> k g2
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    me t2 k in
let g4 = 2 in
let g5 = 1 in
let g6 = 2 in
let g3 = fun me arg k ->
  let t1 = PRIM_LessInt(arg,g4) in
  match t1 with
  | true1 -> k arg
  | false0 ->
    let t2 = PRIM_SubInt(arg,g5) in
    let k = [arg,me], fun [f1,f2] arg ->
      let t1 = [arg], fun [f1] arg k ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      let t2 = PRIM_SubInt(f1,g6) in
      let k = [t1], fun [f1] arg -> f1 arg k in
      f2 t2 k in
    me t2 k in
let g8 = 20 in
let g9 = "fib " in
let g10 = '0' in
let g11 = 0 in
let g12 = 10 in
let g13 = 10 in
let g14 = 0 in
let g15 = '0' in
let g16 = Nil0 in
let g17 = Cons1[g15,g16] in
let g18 = Nil0 in
let g19 = " --> " in
let g20 = '0' in
let g21 = 0 in
let g22 = 10 in
let g23 = 10 in
let g24 = 0 in
let g25 = '0' in
let g26 = Nil0 in
let g27 = Cons1[g25,g26] in
let g28 = Nil0 in
let g30 = '\n' in
let k = [], fun [] arg ->
  let t1 = PRIM_Explode(g9) in
  let k = [arg], fun [f1] arg ->
    let t1 = PRIM_CharOrd(g10) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        let t1 = PRIM_EqInt(arg,g11) in
        match t1 with
        | true1 -> k f2
        | false0 ->
          let t2 = PRIM_ModInt(arg,g12) in
          let t3 = PRIM_AddInt(f1,t2) in
          let t4 = PRIM_CharChr(t3) in
          let t5 = [t4], fun [f1] arg k ->
            let t1 = Cons1[f1,arg] in
            k t1 in
          let k = [f3,arg], fun [f1,f2] arg ->
            let k = [f2], fun [f1] arg ->
              let t1 = PRIM_DivInt(f1,g13) in
              arg t1 k in
            f1 arg k in
          t5 f2 k in
      k t1 in
    let t3 = PRIM_EqInt(g8,g14) in
    let k = [f1], fun [f1] arg ->
      let k = [f1], fun [f1] arg ->
        let t1 = PRIM_Explode(g19) in
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_CharOrd(g20) in
          let t2 = [t1], fun [f1] me arg k ->
            let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
              let t1 = PRIM_EqInt(arg,g21) in
              match t1 with
              | true1 -> k f2
              | false0 ->
                let t2 = PRIM_ModInt(arg,g22) in
                let t3 = PRIM_AddInt(f1,t2) in
                let t4 = PRIM_CharChr(t3) in
                let t5 = [t4], fun [f1] arg k ->
                  let t1 = Cons1[f1,arg] in
                  k t1 in
                let k = [f3,arg], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg ->
                    let t1 = PRIM_DivInt(f1,g23) in
                    arg t1 k in
                  f1 arg k in
                t5 f2 k in
            k t1 in
          let t3 = PRIM_EqInt(f1,g24) in
          let k = [], fun [] arg ->
            let k = [], fun [] arg ->
              let t1 = PRIM_PutChar(g30) in
              k t1 in
            g1 arg k in
          match t3 with
          | true1 -> k g27
          | false0 ->
            let k = [f1], fun [f1] arg -> arg f1 k in
            t2 g28 k in
        g1 t1 k in
      g1 arg k in
    match t3 with
    | true1 -> k g17
    | false0 ->
      let k = [], fun [] arg -> arg g8 k in
      t2 g18 k in
  g1 t1 k in
g3 g8 k
