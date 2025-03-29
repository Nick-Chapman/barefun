(*stage2*)
let k () = ()
let mainloop_7_3'10 = fix (fun [] mainloop_2_3'10 __1_3'19 k ->
  let x_3_0'0 = Unit0 in
  let gotten_4_4'8 = PRIM_GetChar(x_3_0'0) in
  let __5_5'19 = PRIM_PutChar(gotten_4_4'8) in
  let __6_6'19 = PRIM_PutChar(gotten_4_4'8) in
  let con_1_7'13 = Unit0 in
  mainloop_2_3'10 con_1_7'13 k) in
let main_8_2'4 = mainloop_7_3'10 in
let con_2_0'0 = Unit0 in
main_8_2'4 con_2_0'0 k
