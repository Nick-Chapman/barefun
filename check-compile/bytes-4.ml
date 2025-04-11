(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k -> f1 arg k in
  k t1 in
let g3 = 0 in
let g4 = 1 in
let g2 = fun arg k ->
  match arg with
  | Nil0 -> k g3
  | Cons1(t1,t2) ->
    let k = [], fun [] arg ->
      let t1 = PRIM_AddInt(g4,arg) in
      k t1 in
    g2 t2 k in
let g5 = CID0 in
let g6 = 1 in
let g7 = 0 in
let g8 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g5
        | Cons1(t1,t2) ->
          let t3 = PRIM_SetBytes(f1,f2,t1) in
          let t4 = PRIM_AddInt(f2,g6) in
          let k = [t2], fun [f2] arg -> arg f2 k in
          f3 t4 k in
      k t1 in
    let k = [f2,t1], fun [f2,f3] arg ->
      let k = [f3], fun [f2] arg ->
        let t1 = PRIM_FreezeBytes(f2) in
        k t1 in
      arg f2 k in
    t2 g7 k in
  g2 arg k in
let g9 = 0 in
let g10 = 1 in
let g11 = CID0 in
let g12 = 1 in
let g13 = fun arg k ->
  let t1 = [arg], fun [f1] me arg k ->
    let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
      let t1 = PRIM_LessInt(arg,g9) in
      match t1 with
      | true1 -> k f2
      | false0 ->
        let t2 = PRIM_StringIndex(f1,arg) in
        let t3 = CID1[t2,f2] in
        let k = [arg], fun [f2] arg ->
          let t1 = PRIM_SubInt(f2,g10) in
          arg t1 k in
        f3 t3 k in
    k t1 in
  let t2 = PRIM_StringLength(arg) in
  let k = [t2], fun [f2] arg ->
    let t1 = PRIM_SubInt(f2,g12) in
    arg t1 k in
  t1 g11 k in
let g15 = CID0 in
let g14 = fun arg k ->
  match arg with
  | Nil0 -> k g15
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g14 t2 k in
let g16 = "One\n" in
let g17 = 5 in
let g18 = 'T' in
let g19 = 'w' in
let g20 = 'o' in
let g21 = '\n' in
let g22 = CID0 in
let g23 = CID1[g21,g22] in
let g24 = CID1[g20,g23] in
let g25 = CID1[g19,g24] in
let g26 = CID1[g18,g25] in
let k = [], fun [] arg ->
  let k = [arg], fun [f2] arg ->
    let k = [f2,arg], fun [f2,f3] arg ->
      let k = [f2,f3], fun [f2,f3] arg ->
        let t1 = PRIM_MakeBytes(g17) in
        let t2 = PRIM_FreezeBytes(t1) in
        let k = [f2,f3], fun [f2,f3] arg ->
          let k = [f2,f3], fun [f2,f3] arg ->
            let k = [f3], fun [f2] arg ->
              let k = [], fun [] arg -> g14 arg k in
              f2 arg k in
            f2 g26 k in
          g14 arg k in
        f3 t2 k in
      g14 arg k in
    arg g16 k in
  g1 g13 k in
g1 g8 k
