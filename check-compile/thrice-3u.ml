(*stage3; un-normalized*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_AddInt(f1,arg) in
    k t1 in
  k t1 in
let g9 = fun arg k ->
  let t1 = PRIM_CharOrd(arg) in
  k t1 in
let g10 = fun arg k ->
  let t1 = PRIM_CharChr(arg) in
  k t1 in
let g12 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  k t1 in
let g15 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let k = [f1], fun [f1] arg ->
      let k = [f1], fun [f1] arg -> f1 arg k in
      f1 arg k in
    f1 arg k in
  k t1 in
let g16 = '@' in
let g17 = 1 in
let g18 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      let k = [], fun [] arg -> arg g17 k in
      g1 f1 k in
    g12 arg k in
  g10 arg k in
let g19 = '\n' in
let g20 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [arg], fun [f1] arg ->
        let k = [], fun [] arg ->
          let k = [], fun [] arg ->
            let k = [], fun [] arg -> g12 g19 k in
            g12 arg k in
          g10 arg k in
        f1 arg k in
      g9 g16 k in
    arg g18 k in
  g15 g15 k in
let g21 = Unit0 in
g20 g21 k
