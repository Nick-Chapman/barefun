(*Stage4 (CCF)*)
let k () = ()
let g2 = CID0 in
let g1 = fun arg k ->
  match arg with
  | Nil0 -> k g2
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g1 t2 k in
let g4 = 0 in
let g5 = 1 in
let g6 = "LOAD\n" in
let g7 = 1 in
let g3 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g4) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_SubInt(arg,g5) in
      let t3 = PRIM_StringIndex(g6,t2) in
      let t4 = CID1[t3,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g7) in
        arg t1 k in
      g3 t4 k in
  k t1 in
let g8 = CID0 in
let g9 = 5 in
let g12 = 0 in
let g13 = 1 in
let g14 = "> " in
let g15 = 1 in
let g11 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g12) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_SubInt(arg,g13) in
      let t3 = PRIM_StringIndex(g14,t2) in
      let t4 = CID1[t3,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g15) in
        arg t1 k in
      g11 t4 k in
  k t1 in
let g16 = CID0 in
let g17 = 2 in
let g19 = CID0 in
let g20 = '\n' in
let g21 = '\n' in
let g22 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g22 t3 k in
  k t1 in
let g23 = CID0 in
let g18 = fun arg k ->
  let t1 = PRIM_GetChar(g19) in
  let t2 = PRIM_EqChar(t1,g20) in
  match t2 with
  | true1 ->
    let t3 = PRIM_PutChar(g21) in
    let k = [arg], fun [f2] arg -> arg f2 k in
    g22 g23 k
  | false0 ->
    let t3 = PRIM_PutChar(t1) in
    let t4 = CID1[t1,arg] in
    g18 t4 k in
let g24 = CID0 in
let g25 = '\n' in
let g26 = CID0 in
let g10 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let k = [], fun [] arg ->
          let k = [], fun [] arg ->
            let t1 = PRIM_PutChar(g25) in
            g10 g26 k in
          g1 arg k in
        g18 g24 k in
      g1 arg k in
    arg g17 k in
  g11 g16 k in
let g28 = 0 in
let g29 = 1 in
let g30 = "RUN\n" in
let g31 = 1 in
let g27 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g28) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_SubInt(arg,g29) in
      let t3 = PRIM_StringIndex(g30,t2) in
      let t4 = CID1[t3,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g31) in
        arg t1 k in
      g27 t4 k in
  k t1 in
let g32 = CID0 in
let g33 = 4 in
let g34 = CID0 in
let g36 = 0 in
let g37 = 1 in
let g38 = "NEVER\n" in
let g39 = 1 in
let g35 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g36) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_SubInt(arg,g37) in
      let t3 = PRIM_StringIndex(g38,t2) in
      let t4 = CID1[t3,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g39) in
        arg t1 k in
      g35 t4 k in
  k t1 in
let g40 = CID0 in
let g41 = 6 in
let k = [], fun [] arg ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let k = [], fun [] arg ->
          let k = [], fun [] arg ->
            let k = [], fun [] arg ->
              let k = [], fun [] arg ->
                let k = [], fun [] arg -> g1 arg k in
                arg g41 k in
              g35 g40 k in
            g10 g34 k in
          g1 arg k in
        arg g33 k in
      g27 g32 k in
    g1 arg k in
  arg g9 k in
g3 g8 k
