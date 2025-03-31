(*stage3; un-normalized*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g2 = fun arg k ->
  let t1 = PRIM_Explode(arg) in
  k t1 in
let g3 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  k t1 in
let g4 = fun arg k ->
  let t1 = PRIM_GetChar(arg) in
  k t1 in
let g5 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = Cons1[f1,arg] in
    k t1 in
  k t1 in
let g6 = Unit0 in
let g7 = fun me arg k ->
  match arg with
  | Nil0 -> k g6
  | Cons1(t1,t2) ->
    let k = [me,t2], fun [f1,f2] arg -> f1 f2 k in
    g3 t1 k in
let g8 = fun arg k ->
  let k = [], fun [] arg -> g7 arg k in
  g2 arg k in
let g9 = fun me arg k ->
  let t1 = [me,arg], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f2
    | Cons1(t1,t2) ->
      let k = [f1,f2,t2], fun [f1,f2,f3] arg ->
        let k = [f1,f3], fun [f1,f2] arg ->
          let k = [f2], fun [f1] arg -> arg f1 k in
          f1 arg k in
        arg f2 k in
      g5 t1 k in
  k t1 in
let g10 = Nil0 in
let g11 = fun arg k ->
  let k = [arg], fun [f1] arg -> arg f1 k in
  g9 g10 k in
let g12 = '\n' in
let g13 = fun arg k -> g3 g12 k in
let g14 = Unit0 in
let g15 = '\n' in
let g16 = Unit0 in
let g17 = fun me arg k ->
  let k = [me,arg], fun [f1,f2] arg ->
    let arg = arg in
    let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
      let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
        match arg with
        | true1 ->
          let k = [f2], fun [f1] arg -> g11 f1 k in
          g13 g16 k
        | false0 ->
          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
            let k = [f1,f2], fun [f1,f2] arg ->
              let k = [f1], fun [f1] arg -> f1 arg k in
              arg f2 k in
            g5 f3 k in
          g3 f3 k in
      arg g15 k in
    g1 arg k in
  g4 g14 k in
let g18 = Nil0 in
let g19 = fun arg k -> g17 g18 k in
let g20 = "LOAD\n" in
let g21 = "> " in
let g22 = Unit0 in
let g23 = Unit0 in
let g24 = Unit0 in
let g25 = fun me arg k ->
  let k = [me], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      let k = [f1], fun [f1] arg ->
        let k = [f1], fun [f1] arg -> f1 g24 k in
        g13 g23 k in
      g7 arg k in
    g19 g22 k in
  g8 g21 k in
let g26 = "RUN\n" in
let g27 = Unit0 in
let g28 = "NEVER\n" in
let g29 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg -> g8 g28 k in
    g25 g27 k in
  g8 g26 k in
let g30 = Unit0 in
let k = [], fun [] arg -> g29 g30 k in
g8 g20 k
