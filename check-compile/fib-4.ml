(*Stage4 (CCF)*)
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
    let k = [arg], fun [f2] arg ->
      let t1 = PRIM_SubInt(f2,g6) in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_AddInt(f2,arg) in
        k t1 in
      g3 t1 k in
    g3 t2 k in
let g7 = 20 in
let g9 = 0 in
let g10 = 1 in
let g11 = "fib " in
let g12 = 1 in
let g8 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g9) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_SubInt(arg,g10) in
      let t3 = PRIM_StringIndex(g11,t2) in
      let t4 = CID1[t3,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g12) in
        arg t1 k in
      g8 t4 k in
  k t1 in
let g13 = CID0 in
let g14 = 4 in
let g16 = 0 in
let g17 = 10 in
let g18 = 48 in
let g19 = 10 in
let g15 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g16) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g17) in
      let t3 = PRIM_AddInt(g18,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g19) in
        arg t1 k in
      g15 t5 k in
  k t1 in
let g20 = CID0 in
let g21 = 20 in
let g23 = 0 in
let g24 = 1 in
let g25 = " --> " in
let g26 = 1 in
let g22 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g23) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_SubInt(arg,g24) in
      let t3 = PRIM_StringIndex(g25,t2) in
      let t4 = CID1[t3,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g26) in
        arg t1 k in
      g22 t4 k in
  k t1 in
let g27 = CID0 in
let g28 = 5 in
let g30 = 0 in
let g31 = 10 in
let g32 = 48 in
let g33 = 10 in
let g29 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g30) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g31) in
      let t3 = PRIM_AddInt(g32,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g33) in
        arg t1 k in
      g29 t5 k in
  k t1 in
let g34 = 0 in
let g35 = '0' in
let g36 = CID0 in
let g37 = CID1[g35,g36] in
let g38 = CID0 in
let g39 = '\n' in
let k = [], fun [] arg ->
  let k = [arg], fun [f2] arg ->
    let k = [f2], fun [f2] arg ->
      let k = [f2], fun [f2] arg ->
        let k = [f2], fun [f2] arg ->
          let k = [f2], fun [f2] arg ->
            let k = [f2], fun [f2] arg ->
              let k = [f2], fun [f2] arg ->
                let k = [f2], fun [f2] arg ->
                  let k = [f2], fun [f2] arg ->
                    let t1 = PRIM_EqInt(f2,g34) in
                    let k = [], fun [] arg ->
                      let k = [], fun [] arg ->
                        let t1 = PRIM_PutChar(g39) in
                        k t1 in
                      g1 arg k in
                    match t1 with
                    | true1 -> k g37
                    | false0 ->
                      let k = [f2], fun [f2] arg -> arg f2 k in
                      g29 g38 k in
                  g1 arg k in
                arg g28 k in
              g22 g27 k in
            g1 arg k in
          arg g21 k in
        g15 g20 k in
      g1 arg k in
    arg g14 k in
  g8 g13 k in
g3 g7 k
