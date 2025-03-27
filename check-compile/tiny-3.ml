(*stage3*)
let k () = ()
let u_6_g1 = fun mainloop_2_3'10_me __1_3'19_arg k ->
  let k = [mainloop_2_3'10_me], fun [mainloop_2_3'10_f1] u_4_arg ->
    let u_5_t1 = PRIM_PutChar(u_4_arg) in
    let con_2_6'13_t2 = Unit0 in
    mainloop_2_3'10_f1 con_2_6'13_t2 k in
  let u_3_t1 = Unit0 in
  let prim_1_0'0_t2 = PRIM_GetChar(u_3_t1) in
  k prim_1_0'0_t2 in
let k = [], fun [] u_7_arg ->
  let con_3_0'0_t1 = Unit0 in
  u_7_arg con_3_0'0_t1 k in
k u_6_g1
