(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  match arg with
  | Thing0(t1) ->
    let t2 = PRIM_PutChar(t1) in
    k t2 in
let t1 = Thing0['x'] in
g1 t1 k
