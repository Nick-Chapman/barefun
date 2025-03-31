(*stage3; un-normalized*)
let k () = ()
let g8 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g11 = fun arg k ->
  let t1 = PRIM_Explode(arg) in
  k t1 in
let g12 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  k t1 in
let g13 = fun arg k ->
  let t1 = PRIM_GetChar(arg) in
  k t1 in
let g14 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = Cons1[f1,arg] in
    k t1 in
  k t1 in
let g16 = Unit0 in
let g15 = fun arg k ->
  match arg with
  | Nil0 -> k g16
  | Cons1(t1,t2) ->
    let k = [t2], fun [f1] arg -> g15 f1 k in
    g12 t1 k in
let g17 = fun arg k ->
  let k = [], fun [] arg -> g15 arg k in
  g11 arg k in
let g18 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f1,f2] arg ->
        let k = [f2], fun [f1] arg ->
          let k = [f1], fun [f1] arg -> arg f1 k in
          g18 arg k in
        arg f1 k in
      g14 t1 k in
  k t1 in
let g19 = Nil0 in
let g20 = fun arg k ->
  let k = [arg], fun [f1] arg -> arg f1 k in
  g18 g19 k in
let g21 = '\n' in
let g22 = fun arg k -> g12 g21 k in
let g24 = Unit0 in
let g25 = '\n' in
let g26 = Unit0 in
let g23 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let arg = arg in
    let k = [f1,arg], fun [f1,f2] arg ->
      let k = [f1,f2], fun [f1,f2] arg ->
        match arg with
        | true1 ->
          let k = [f1], fun [f1] arg -> g20 f1 k in
          g22 g26 k
        | false0 ->
          let k = [f1,f2], fun [f1,f2] arg ->
            let k = [f1], fun [f1] arg ->
              let k = [], fun [] arg -> g23 arg k in
              arg f1 k in
            g14 f2 k in
          g12 f2 k in
      arg g25 k in
    g8 arg k in
  g13 g24 k in
let g27 = Nil0 in
let g28 = fun arg k -> g23 g27 k in
let g29 = "LOAD\n" in
let g31 = "> " in
let g32 = Unit0 in
let g33 = Unit0 in
let g34 = Unit0 in
let g30 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let k = [], fun [] arg -> g30 g34 k in
        g22 g33 k in
      g15 arg k in
    g28 g32 k in
  g17 g31 k in
let g35 = "RUN\n" in
let g36 = Unit0 in
let g37 = "NEVER\n" in
let g38 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg -> g17 g37 k in
    g30 g36 k in
  g17 g35 k in
let g39 = Unit0 in
let k = [], fun [] arg -> g38 g39 k in
g17 g29 k
