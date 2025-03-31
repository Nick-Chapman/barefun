(*stage3; un-normalized*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_AddInt(f1,arg) in
    k t1 in
  k t1 in
let g2 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_SubInt(f1,arg) in
    k t1 in
  k t1 in
let g3 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_DivInt(f1,arg) in
    k t1 in
  k t1 in
let g4 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_ModInt(f1,arg) in
    k t1 in
  k t1 in
let g5 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(f1,arg) in
    k t1 in
  k t1 in
let g6 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(f1,arg) in
    k t1 in
  k t1 in
let g7 = fun arg k ->
  let t1 = PRIM_CharOrd(arg) in
  k t1 in
let g8 = fun arg k ->
  let t1 = PRIM_CharChr(arg) in
  k t1 in
let g9 = fun arg k ->
  let t1 = PRIM_Explode(arg) in
  k t1 in
let g10 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  k t1 in
let g11 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = Cons1[f1,arg] in
    k t1 in
  k t1 in
let g12 = '0' in
let g13 = 0 in
let g14 = 10 in
let g15 = 10 in
let g16 = 0 in
let g17 = '0' in
let g18 = Nil0 in
let g19 = Cons1[g17,g18] in
let g20 = Nil0 in
let g21 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let t1 = [arg], fun [f1] arg k ->
      let k = [arg], fun [f1] arg ->
        let k = [], fun [] arg -> g8 arg k in
        arg f1 k in
      g1 f1 k in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,me,arg], fun [f1,f2,f3] arg k ->
        let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
          let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
            match arg with
            | true1 -> k f3
            | false0 ->
              let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                  let k = [f2,f3,f4], fun [f1,f2,f3] arg ->
                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                      let k = [f1,f3], fun [f1,f2] arg ->
                        let k = [f2], fun [f1] arg ->
                          let k = [arg], fun [f1] arg ->
                            let k = [f1], fun [f1] arg -> f1 arg k in
                            arg g15 k in
                          g3 f1 k in
                        f1 arg k in
                      arg f2 k in
                    g11 arg k in
                  f1 arg k in
                arg g14 k in
              g4 f4 k in
          arg g13 k in
        g6 arg k in
      k t1 in
    let k = [f1,t2], fun [f1,f2] arg ->
      let k = [f1,f2], fun [f1,f2] arg ->
        match arg with
        | true1 -> k g19
        | false0 ->
          let k = [f1], fun [f1] arg -> arg f1 k in
          f2 g20 k in
      arg g16 k in
    g6 f1 k in
  g7 g12 k in
let g22 = Unit0 in
let g23 = fun me arg k ->
  match arg with
  | Nil0 -> k g22
  | Cons1(t1,t2) ->
    let k = [me,t2], fun [f1,f2] arg -> f1 f2 k in
    g10 t1 k in
let g24 = fun arg k ->
  let k = [], fun [] arg -> g23 arg k in
  g9 arg k in
let g25 = fun arg k ->
  let k = [], fun [] arg -> g23 arg k in
  g21 arg k in
let g26 = '\n' in
let g27 = fun arg k -> g10 g26 k in
let g28 = 2 in
let g29 = 1 in
let g30 = 2 in
let g31 = fun me arg k ->
  let k = [me,arg], fun [f1,f2] arg ->
    let k = [f1,f2], fun [f1,f2] arg ->
      match arg with
      | true1 -> k f2
      | false0 ->
        let k = [f1,f2], fun [f1,f2] arg ->
          let k = [f1,f2], fun [f1,f2] arg ->
            let k = [f1,f2], fun [f1,f2] arg ->
              let k = [f1,f2], fun [f1,f2] arg ->
                let k = [f1,arg], fun [f1,f2] arg ->
                  let k = [f1,f2], fun [f1,f2] arg ->
                    let k = [f2], fun [f1] arg -> f1 arg k in
                    f1 arg k in
                  arg g30 k in
                g2 f2 k in
              g1 arg k in
            f1 arg k in
          arg g29 k in
        g2 f2 k in
    arg g28 k in
  g5 arg k in
let g32 = "fib " in
let g33 = " --> " in
let g34 = Unit0 in
let g35 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1,arg], fun [f1,f2] arg ->
      let k = [f2], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let k = [], fun [] arg -> g27 g34 k in
          g25 f1 k in
        g24 g33 k in
      g25 f1 k in
    g24 g32 k in
  g31 arg k in
let g36 = 20 in
let g37 = fun arg k -> g35 g36 k in
let g38 = Unit0 in
g37 g38 k
