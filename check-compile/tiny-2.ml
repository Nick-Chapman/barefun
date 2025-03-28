(*stage2*)
let k () = ()
let u_6 = fix (fun [] mainloop_2_3'10 __1_3'19 k ->
  let u_3 = Unit0 in
  let u_4 = PRIM_GetChar(u_3) in
  let u_5 = PRIM_PutChar(u_4) in
  let con_1_6'13 = Unit0 in
  mainloop_2_3'10 con_1_6'13 k) in
let u_7 = u_6 in
let con_2_0'0 = Unit0 in
u_7 con_2_0'0 k
