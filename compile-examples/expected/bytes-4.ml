(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k -> f1 arg k in
  k t1 in
let g2 = fun arg k ->
  match arg with
  | Nil0 -> k 0
  | Cons1(t1,t2) ->
    let k = [], fun [] arg ->
      let t1 = PRIM_AddInt(1,arg) in
      k t1 in
    g2 t2 k in
let g3 = CID0 in
let g4 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g3
        | Cons1(t1,t2) ->
          let t3 = PRIM_SetBytes(f1,f2,t1) in
          let t4 = PRIM_AddInt(f2,1) in
          let k = [t2], fun [f2] arg -> arg f2 k in
          f3 t4 k in
      k t1 in
    let k = [f2,t1], fun [f2,f3] arg ->
      let k = [f3], fun [f2] arg ->
        let t1 = PRIM_FreezeBytes(f2) in
        k t1 in
      arg f2 k in
    t2 0 k in
  g2 arg k in
let g5 = CID0 in
let g6 = fun arg k ->
  let t1 = [arg], fun [f1] me arg k ->
    let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
      let t1 = PRIM_LessInt(arg,0) in
      match t1 with
      | true1 -> k f2
      | false0 ->
        let t2 = PRIM_StringIndex(f1,arg) in
        let t3 = CID1[t2,f2] in
        let k = [arg], fun [f2] arg ->
          let t1 = PRIM_SubInt(f2,1) in
          arg t1 k in
        f3 t3 k in
    k t1 in
  let t2 = PRIM_StringLength(arg) in
  let k = [t2], fun [f2] arg ->
    let t1 = PRIM_SubInt(f2,1) in
    arg t1 k in
  t1 g5 k in
let g8 = CID0 in
let g7 = fun arg k ->
  match arg with
  | Nil0 -> k g8
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g7 t2 k in
let g9 = "One\n" in
let g10 = CID0 in
let k = [], fun [] arg ->
  let k = [arg], fun [f2] arg ->
    let k = [f2,arg], fun [f2,f3] arg ->
      let k = [f2,f3], fun [f2,f3] arg ->
        let t1 = PRIM_MakeBytes(5) in
        let t2 = PRIM_FreezeBytes(t1) in
        let k = [f2,f3], fun [f2,f3] arg ->
          let k = [f2,f3], fun [f2,f3] arg ->
            let t1 = CID1['\n',g10] in
            let t2 = CID1['o',t1] in
            let t3 = CID1['w',t2] in
            let t4 = CID1['T',t3] in
            let k = [f3], fun [f2] arg ->
              let k = [], fun [] arg -> g7 arg k in
              f2 arg k in
            f2 t4 k in
          g7 arg k in
        f3 t2 k in
      g7 arg k in
    arg g9 k in
  g1 g6 k in
g1 g4 k
