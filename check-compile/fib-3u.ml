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
let g4 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_DivInt(f1,arg) in
    k t1 in
  k t1 in
let g5 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_ModInt(f1,arg) in
    k t1 in
  k t1 in
let g6 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(f1,arg) in
    k t1 in
  k t1 in
let g7 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(f1,arg) in
    k t1 in
  k t1 in
let g9 = fun arg k ->
  let t1 = PRIM_CharOrd(arg) in
  k t1 in
let g10 = fun arg k ->
  let t1 = PRIM_CharChr(arg) in
  k t1 in
let g11 = fun arg k ->
  let t1 = PRIM_Explode(arg) in
  k t1 in
let g12 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  k t1 in
let g14 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = Cons1[f1,arg] in
    k t1 in
  k t1 in
let g15 = '0' in
let g16 = 0 in
let g17 = 10 in
let g18 = 10 in
let g19 = 0 in
let g20 = '0' in
let g21 = Nil0 in
let g22 = Cons1[g20,g21] in
let g23 = Nil0 in
let g24 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let t1 = [arg], fun [f1] arg k ->
      let k = [arg], fun [f1] arg ->
        let k = [], fun [] arg -> g10 arg k in
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
                            arg g18 k in
                          g4 f1 k in
                        f1 arg k in
                      arg f2 k in
                    g14 arg k in
                  f1 arg k in
                arg g17 k in
              g5 f4 k in
          arg g16 k in
        g7 arg k in
      k t1 in
    let k = [f1,t2], fun [f1,f2] arg ->
      let k = [f1,f2], fun [f1,f2] arg ->
        match arg with
        | true1 -> k g22
        | false0 ->
          let k = [f1], fun [f1] arg -> arg f1 k in
          f2 g23 k in
      arg g19 k in
    g7 f1 k in
  g9 g15 k in
let g26 = Unit0 in
let g25 = fun arg k ->
  match arg with
  | Nil0 -> k g26
  | Cons1(t1,t2) ->
    let k = [t2], fun [f1] arg -> g25 f1 k in
    g12 t1 k in
let g27 = fun arg k ->
  let k = [], fun [] arg -> g25 arg k in
  g11 arg k in
let g28 = fun arg k ->
  let k = [], fun [] arg -> g25 arg k in
  g24 arg k in
let g29 = '\n' in
let g30 = fun arg k -> g12 g29 k in
let g32 = 2 in
let g33 = 1 in
let g34 = 2 in
let g31 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      match arg with
      | true1 -> k f1
      | false0 ->
        let k = [f1], fun [f1] arg ->
          let k = [f1], fun [f1] arg ->
            let k = [f1], fun [f1] arg ->
              let k = [f1], fun [f1] arg ->
                let k = [arg], fun [f1] arg ->
                  let k = [f1], fun [f1] arg ->
                    let k = [f1], fun [f1] arg -> f1 arg k in
                    g31 arg k in
                  arg g34 k in
                g2 f1 k in
              g1 arg k in
            g31 arg k in
          arg g33 k in
        g2 f1 k in
    arg g32 k in
  g6 arg k in
let g35 = "fib " in
let g36 = " --> " in
let g37 = Unit0 in
let g38 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1,arg], fun [f1,f2] arg ->
      let k = [f2], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let k = [], fun [] arg -> g30 g37 k in
          g28 f1 k in
        g27 g36 k in
      g28 f1 k in
    g27 g35 k in
  g31 arg k in
let g39 = 20 in
let g40 = fun arg k -> g38 g39 k in
let g41 = Unit0 in
g40 g41 k
