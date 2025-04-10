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
let g10 = "fib " in
let g11 = 1 in
let g8 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,g9) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g10,arg) in
      let t3 = CID1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g11) in
        arg t1 k in
      g8 t3 k in
  k t1 in
let g12 = CID0 in
let g13 = 3 in
let g15 = 0 in
let g16 = 10 in
let g17 = 48 in
let g18 = 10 in
let g14 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g15) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g16) in
      let t3 = PRIM_AddInt(g17,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g18) in
        arg t1 k in
      g14 t5 k in
  k t1 in
let g19 = CID0 in
let g20 = 20 in
let g22 = 0 in
let g23 = " --> " in
let g24 = 1 in
let g21 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,g22) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g23,arg) in
      let t3 = CID1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g24) in
        arg t1 k in
      g21 t3 k in
  k t1 in
let g25 = CID0 in
let g26 = 4 in
let g28 = 0 in
let g29 = 10 in
let g30 = 48 in
let g31 = 10 in
let g27 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g28) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g29) in
      let t3 = PRIM_AddInt(g30,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g31) in
        arg t1 k in
      g27 t5 k in
  k t1 in
let g32 = 0 in
let g33 = '0' in
let g34 = CID0 in
let g35 = CID1[g33,g34] in
let g36 = CID0 in
let g37 = '\n' in
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
                    let t1 = PRIM_EqInt(f2,g32) in
                    let k = [], fun [] arg ->
                      let k = [], fun [] arg ->
                        let t1 = PRIM_PutChar(g37) in
                        k t1 in
                      g1 arg k in
                    match t1 with
                    | true1 -> k g35
                    | false0 ->
                      let k = [f2], fun [f2] arg -> arg f2 k in
                      g27 g36 k in
                  g1 arg k in
                arg g26 k in
              g21 g25 k in
            g1 arg k in
          arg g20 k in
        g14 g19 k in
      g1 arg k in
    arg g13 k in
  g8 g12 k in
g3 g7 k
