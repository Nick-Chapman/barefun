(*stage3*)
let k () = ()
let x_3_0'0_g1 = Unit0 in
let con_1_7'13_g2 = Unit0 in
let mainloop_7_3'10_g3 = fun mainloop_2_3'10_me __1_3'19_arg k ->
  let gotten_4_4'8_t1 = PRIM_GetChar(x_3_0'0_g1) in
  let __5_5'19_t2 = PRIM_PutChar(gotten_4_4'8_t1) in
  let __6_6'19_t3 = PRIM_PutChar(gotten_4_4'8_t1) in
  mainloop_2_3'10_me con_1_7'13_g2 k in
let con_2_0'0_g4 = Unit0 in
let main_8_2'4_g3 = mainloop_7_3'10_g3 in
main_8_2'4_g3 con_2_0'0_g4 k
