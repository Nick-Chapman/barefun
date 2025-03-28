(*stage3*)
let k () = ()
let u_6_g1 = fun put_chars_2_2'8_me xs_1_2'18_arg k ->
  match xs_1_2'18_arg with
  | Nil0 ->
    let con_1_4'10_t1 = Unit0 in
    k con_1_4'10_t1
  | Cons1(x_3_5'4_t1,xsMore_4_5'7_t2) ->
    let u_5_t3 = PRIM_PutChar(x_3_5'4_t1) in
    put_chars_2_2'8_me xsMore_4_5'7_t2 k in
let u_7_g2 = "LOAD\n" in
let u_11_g3 = "> " in
let u_18_g4 = '\n' in
let u_20_g5 = '\n' in
let u_27_g6 = fun revloop_23_10'10_me acc_22_10'18_arg k ->
  let lam_8_0'0_t1 = [acc_22_10'18_arg,revloop_23_10'10_me], fun [acc_22_10'18_f1,revloop_23_10'10_f2] f_24_arg k ->
    match f_24_arg with
    | Nil0 -> k acc_22_10'18_f1
    | Cons1(y_25_13'6_t1,ysMore_26_13'9_t2) ->
      let con_7_0'0_t3 = Cons1[y_25_13'6_t1,acc_22_10'18_f1] in
      let k = [ysMore_26_13'9_t2], fun [ysMore_26_13'9_f1] app_6_13'27_arg -> app_6_13'27_arg ysMore_26_13'9_f1 k in
      revloop_23_10'10_f2 con_7_0'0_t3 k in
  k lam_8_0'0_t1 in
let u_29_g7 = fun readloop_15_20'10_me sofar_14_20'19_arg k ->
  let u_16_t1 = Unit0 in
  let u_17_t2 = PRIM_GetChar(u_16_t1) in
  let uLET_5_0'0_t3 = PRIM_EqChar(u_17_t2,u_18_g4) in
  match uLET_5_0'0_t3 with
  | true1 ->
    let u_19_t4 = Unit0 in
    let u_21_t5 = PRIM_PutChar(u_20_g5) in
    let con_10_15'10_t6 = Nil0 in
    let k = [sofar_14_20'19_arg], fun [sofar_14_20'19_f1] app_9_15'10_arg -> app_9_15'10_arg sofar_14_20'19_f1 k in
    u_27_g6 con_10_15'10_t6 k
  | false0 ->
    let u_28_t4 = PRIM_PutChar(u_17_t2) in
    let con_11_0'0_t5 = Cons1[u_17_t2,sofar_14_20'19_arg] in
    readloop_15_20'10_me con_11_0'0_t5 k in
let u_32_g8 = '\n' in
let u_34_g9 = fun mainloop_10_30'8_me __9_30'17_arg k ->
  let prim_3_0'0_t1 = PRIM_Explode(u_11_g3) in
  let k = [mainloop_10_30'8_me], fun [mainloop_10_30'8_f1] u_12_arg ->
    let u_13_t1 = Unit0 in
    let con_12_26'11_t2 = Nil0 in
    let k = [mainloop_10_30'8_f1], fun [mainloop_10_30'8_f1] uLET_4_0'0_arg ->
      let k = [mainloop_10_30'8_f1], fun [mainloop_10_30'8_f1] u_30_arg ->
        let u_31_t1 = Unit0 in
        let u_33_t2 = PRIM_PutChar(u_32_g8) in
        let con_13_34'10_t3 = Unit0 in
        mainloop_10_30'8_f1 con_13_34'10_t3 k in
      u_6_g1 uLET_4_0'0_arg k in
    u_29_g7 con_12_26'11_t2 k in
  u_6_g1 prim_3_0'0_t1 k in
let u_36_g10 = "RUN\n" in
let u_39_g11 = "NEVER\n" in
let prim_2_0'0_t1 = PRIM_Explode(u_7_g2) in
let k = [], fun [] u_8_arg ->
  let u_35_t1 = Unit0 in
  let prim_14_0'0_t2 = PRIM_Explode(u_36_g10) in
  let k = [], fun [] u_37_arg ->
    let con_15_38'20_t1 = Unit0 in
    let k = [], fun [] u_38_arg ->
      let prim_16_0'0_t1 = PRIM_Explode(u_39_g11) in
      u_6_g1 prim_16_0'0_t1 k in
    u_34_g9 con_15_38'20_t1 k in
  u_6_g1 prim_14_0'0_t2 k in
u_6_g1 prim_2_0'0_t1 k
