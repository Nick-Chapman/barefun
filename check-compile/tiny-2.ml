(*stage2*)
let k () = ()
let mainloop = fix (fun [] mainloop _ k ->
  let con_4'26 = CID0 in
  let gotten = PRIM_GetChar(con_4'26) in
  let _ = PRIM_PutChar(gotten) in
  let _ = PRIM_PutChar(gotten) in
  let con_7'13 = CID0 in
  mainloop con_7'13 k) in
let con_0'0 = CID0 in
mainloop con_0'0 k
