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
let g5 = "LOAD\n" in
let g6 = 1 in
let g3 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,g4) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g5,arg) in
      let t3 = CID1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g6) in
        arg t1 k in
      g3 t3 k in
  k t1 in
let g7 = CID0 in
let g8 = 4 in
let g11 = 0 in
let g12 = "> " in
let g13 = 1 in
let g10 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,g11) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g12,arg) in
      let t3 = CID1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g13) in
        arg t1 k in
      g10 t3 k in
  k t1 in
let g14 = CID0 in
let g15 = 1 in
let g17 = CID0 in
let g18 = '\n' in
let g19 = '\n' in
let g20 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g20 t3 k in
  k t1 in
let g21 = CID0 in
let g16 = fun arg k ->
  let t1 = PRIM_GetChar(g17) in
  let t2 = PRIM_EqChar(t1,g18) in
  match t2 with
  | true1 ->
    let t3 = PRIM_PutChar(g19) in
    let k = [arg], fun [f2] arg -> arg f2 k in
    g20 g21 k
  | false0 ->
    let t3 = PRIM_PutChar(t1) in
    let t4 = CID1[t1,arg] in
    g16 t4 k in
let g22 = CID0 in
let g23 = '\n' in
let g24 = CID0 in
let g9 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let k = [], fun [] arg ->
          let k = [], fun [] arg ->
            let t1 = PRIM_PutChar(g23) in
            g9 g24 k in
          g1 arg k in
        g16 g22 k in
      g1 arg k in
    arg g15 k in
  g10 g14 k in
let g26 = 0 in
let g27 = "RUN\n" in
let g28 = 1 in
let g25 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,g26) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g27,arg) in
      let t3 = CID1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g28) in
        arg t1 k in
      g25 t3 k in
  k t1 in
let g29 = CID0 in
let g30 = 3 in
let g31 = CID0 in
let g33 = 0 in
let g34 = "NEVER\n" in
let g35 = 1 in
let g32 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,g33) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g34,arg) in
      let t3 = CID1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,g35) in
        arg t1 k in
      g32 t3 k in
  k t1 in
let g36 = CID0 in
let g37 = 5 in
let k = [], fun [] arg ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let k = [], fun [] arg ->
          let k = [], fun [] arg ->
            let k = [], fun [] arg ->
              let k = [], fun [] arg ->
                let k = [], fun [] arg -> g1 arg k in
                arg g37 k in
              g32 g36 k in
            g9 g31 k in
          g1 arg k in
        arg g30 k in
      g25 g29 k in
    g1 arg k in
  arg g8 k in
g3 g7 k
