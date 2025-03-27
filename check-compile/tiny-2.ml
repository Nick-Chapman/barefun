(*stage2*)
let k () = ()
let k [] u_7 =
  let con_3_0'0 = Unit0 in
  u_7 con_3_0'0 k in
let u_6 = fix (fun [] mainloop_2_3'10 __1_3'19 k ->
  let k [mainloop_2_3'10] u_4 =
    let u_5 = PRIM_PutChar(u_4) in
    let con_2_6'13 = Unit0 in
    mainloop_2_3'10 con_2_6'13 k in
  let u_3 = Unit0 in
  let prim_1_0'0 = PRIM_GetChar(u_3) in
  k prim_1_0'0) in
k u_6
