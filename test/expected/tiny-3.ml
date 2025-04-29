(*Stage3 (ANF)*)
let k () = ()
let mainloop = fix (fun [] mainloop _ k ->
  let con = Unit0 in
  let gotten = PRIM_GetChar(con) in
  let _ = PRIM_PutChar(gotten) in
  let _ = PRIM_PutChar(gotten) in
  let con = Unit0 in
  mainloop con k) in
let con = Unit0 in
mainloop con k
