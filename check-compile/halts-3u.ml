(*stage3; un-normalized*)
let k () = ()
let g12 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  k t1 in
let g13 = fun arg k ->
  let t1 = PRIM_GetChar(arg) in
  k t1 in
let g15 = 'X' in
let g16 = Unit0 in
let g17 = 'Y' in
let g18 = Unit0 in
let g19 = 'Z' in
let g20 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let k = [], fun [] arg ->
          let k = [], fun [] arg ->
            let k = [], fun [] arg -> g12 g19 k in
            g12 arg k in
          g13 g18 k in
        g12 g17 k in
      g12 arg k in
    g13 g16 k in
  g12 g15 k in
let g21 = Unit0 in
g20 g21 k
