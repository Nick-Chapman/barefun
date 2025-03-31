(*stage3; un-normalized*)
let k () = ()
let g1 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  k t1 in
let g2 = fun arg k ->
  let t1 = PRIM_GetChar(arg) in
  k t1 in
let g3 = 'X' in
let g4 = Unit0 in
let g5 = 'Y' in
let g6 = Unit0 in
let g7 = 'Z' in
let g8 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let k = [], fun [] arg ->
          let k = [], fun [] arg ->
            let k = [], fun [] arg -> g1 g7 k in
            g1 arg k in
          g2 g6 k in
        g1 g5 k in
      g1 arg k in
    g2 g4 k in
  g1 g3 k in
let g9 = Unit0 in
g8 g9 k
