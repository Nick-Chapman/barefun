(*Stage4 (CCF)*)
let k () = ()
let g2 = Unit0 in
let g1 = fun arg k ->
  match arg with
  | Nil0 -> k g2
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g1 t2 k in
let g5 = "sector:" in
let g4 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g5,arg) in
      let t3 = Cons1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,1) in
        arg t1 k in
      g4 t3 k in
  k t1 in
let g6 = Nil0 in
let g7 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g7 t5 k in
  k t1 in
let g8 = Nil0 in
let g9 = Nil0 in
let g10 = Unit0 in
let g3 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let k = [f2], fun [f2] arg ->
      let k = [f2], fun [f2] arg ->
        let t1 = PRIM_EqInt(f2,0) in
        let k = [f2], fun [f2] arg ->
          let k = [f2], fun [f2] arg ->
            let t1 = PRIM_PutChar('\n') in
            let t2 = PRIM_DumpSec(f2) in
            let t3 = PRIM_PutChar('\n') in
            let t4 = PRIM_GetChar(g10) in
            let t5 = PRIM_AddInt(f2,1) in
            g3 t5 k in
          g1 arg k in
        match t1 with
        | true1 ->
          let t2 = Cons1['0',g8] in
          k t2
        | false0 ->
          let k = [f2], fun [f2] arg -> arg f2 k in
          g7 g9 k in
      g1 arg k in
    arg 6 k in
  g4 g6 k in
g3 0 k
