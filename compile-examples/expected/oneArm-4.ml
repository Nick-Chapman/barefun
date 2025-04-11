(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  match arg with
  | Thing0(t1) ->
    let t2 = PRIM_PutChar(t1) in
    k t2 in
let g2 = 'x' in
let g3 = CID0[g2] in
g1 g3 k
