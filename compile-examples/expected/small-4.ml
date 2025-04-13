(*Stage4 (CCF)*)
let k () = ()
let g2 = CID0 in
let g1 = fun arg k ->
  match arg with
  | Nil0 -> k g2
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g1 t2 k in
let g4 = "LOAD\n" in
let g3 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g4,arg) in
      let t3 = CID1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,1) in
        arg t1 k in
      g3 t3 k in
  k t1 in
let g5 = CID0 in
let g8 = "> " in
let g7 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g8,arg) in
      let t3 = CID1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,1) in
        arg t1 k in
      g7 t3 k in
  k t1 in
let g9 = CID0 in
let g11 = CID0 in
let g12 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g12 t3 k in
  k t1 in
let g13 = CID0 in
let g10 = fun arg k ->
  let t1 = PRIM_GetChar(g11) in
  let t2 = PRIM_EqChar(t1,'\n') in
  match t2 with
  | true1 ->
    let t3 = PRIM_PutChar('\n') in
    let k = [arg], fun [f2] arg -> arg f2 k in
    g12 g13 k
  | false0 ->
    let t3 = PRIM_PutChar(t1) in
    let t4 = CID1[t1,arg] in
    g10 t4 k in
let g14 = CID0 in
let g15 = CID0 in
let g6 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let k = [], fun [] arg ->
          let k = [], fun [] arg ->
            let t1 = PRIM_PutChar('\n') in
            g6 g15 k in
          g1 arg k in
        g10 g14 k in
      g1 arg k in
    arg 1 k in
  g7 g9 k in
let g17 = "RUN\n" in
let g16 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g17,arg) in
      let t3 = CID1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,1) in
        arg t1 k in
      g16 t3 k in
  k t1 in
let g18 = CID0 in
let g19 = CID0 in
let g21 = "NEVER\n" in
let g20 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g21,arg) in
      let t3 = CID1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,1) in
        arg t1 k in
      g20 t3 k in
  k t1 in
let g22 = CID0 in
let k = [], fun [] arg ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let k = [], fun [] arg ->
          let k = [], fun [] arg ->
            let k = [], fun [] arg ->
              let k = [], fun [] arg ->
                let k = [], fun [] arg -> g1 arg k in
                arg 5 k in
              g20 g22 k in
            g6 g19 k in
          g1 arg k in
        arg 3 k in
      g16 g18 k in
    g1 arg k in
  arg 4 k in
g3 g5 k
