(*stage3*)
let k () = ()
let g1 = Unit0 in
let g2 = fun me arg k ->
  match arg with
  | Nil0 -> k g1
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    me t2 k in
let g3 = 2 in
let g4 = 1 in
let g5 = 2 in
let g6 = fun me arg k ->
  let t1 = PRIM_LessInt(arg,g3) in
  match t1 with
  | true1 -> k arg
  | false0 ->
    let t2 = PRIM_SubInt(arg,g4) in
    let k = [arg,me], fun [f1,f2] arg ->
      let t1 = [arg], fun [f1] arg k ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      let t2 = PRIM_SubInt(f1,g5) in
      let k = [t1], fun [f1] arg -> f1 arg k in
      f2 t2 k in
    me t2 k in
let g7 = 20 in
let g8 = "fib " in
let g9 = '0' in
let g10 = 0 in
let g11 = 10 in
let g12 = 10 in
let g13 = 0 in
let g14 = '0' in
let g15 = Nil0 in
let g16 = Cons1[g14,g15] in
let g17 = Nil0 in
let g18 = " --> " in
let g19 = '0' in
let g20 = 0 in
let g21 = 10 in
let g22 = 10 in
let g23 = 0 in
let g24 = '0' in
let g25 = Nil0 in
let g26 = Cons1[g24,g25] in
let g27 = Nil0 in
let g28 = '\n' in
let k = [], fun [] arg ->
  let t1 = PRIM_Explode(g8) in
  let k = [arg], fun [f1] arg ->
    let t1 = PRIM_CharOrd(g9) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        let t1 = PRIM_EqInt(arg,g10) in
        match t1 with
        | true1 -> k f2
        | false0 ->
          let t2 = PRIM_ModInt(arg,g11) in
          let t3 = PRIM_AddInt(f1,t2) in
          let t4 = PRIM_CharChr(t3) in
          let t5 = [t4], fun [f1] arg k ->
            let t1 = Cons1[f1,arg] in
            k t1 in
          let k = [f3,arg], fun [f1,f2] arg ->
            let k = [f2], fun [f1] arg ->
              let t1 = PRIM_DivInt(f1,g12) in
              arg t1 k in
            f1 arg k in
          t5 f2 k in
      k t1 in
    let t3 = PRIM_EqInt(g7,g13) in
    let k = [f1], fun [f1] arg ->
      let k = [f1], fun [f1] arg ->
        let t1 = PRIM_Explode(g18) in
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_CharOrd(g19) in
          let t2 = [t1], fun [f1] me arg k ->
            let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
              let t1 = PRIM_EqInt(arg,g20) in
              match t1 with
              | true1 -> k f2
              | false0 ->
                let t2 = PRIM_ModInt(arg,g21) in
                let t3 = PRIM_AddInt(f1,t2) in
                let t4 = PRIM_CharChr(t3) in
                let t5 = [t4], fun [f1] arg k ->
                  let t1 = Cons1[f1,arg] in
                  k t1 in
                let k = [f3,arg], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg ->
                    let t1 = PRIM_DivInt(f1,g22) in
                    arg t1 k in
                  f1 arg k in
                t5 f2 k in
            k t1 in
          let t3 = PRIM_EqInt(f1,g23) in
          let k = [], fun [] arg ->
            let k = [], fun [] arg ->
              let t1 = PRIM_PutChar(g28) in
              k t1 in
            g2 arg k in
          match t3 with
          | true1 -> k g26
          | false0 ->
            let k = [f1], fun [f1] arg -> arg f1 k in
            t2 g27 k in
        g2 t1 k in
      g2 arg k in
    match t3 with
    | true1 -> k g16
    | false0 ->
      let k = [], fun [] arg -> arg g7 k in
      t2 g17 k in
  g2 t1 k in
g6 g7 k
