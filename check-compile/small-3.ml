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
  let lam_11_0'0_t1 = [acc_22_10'18_arg,revloop_23_10'10_me], fun [acc_22_10'18_f1,revloop_23_10'10_f2] f_24_arg k ->
    match f_24_arg with
    | Nil0 -> k acc_22_10'18_f1
    | Cons1(y_25_13'6_t1,ysMore_26_13'9_t2) ->
      let k = [ysMore_26_13'9_t2], fun [ysMore_26_13'9_f1] app_9_13'27_arg -> app_9_13'27_arg ysMore_26_13'9_f1 k in
      let con_10_0'0_t3 = Cons1[y_25_13'6_t1,acc_22_10'18_f1] in
      revloop_23_10'10_f2 con_10_0'0_t3 k in
  k lam_11_0'0_t1 in
let u_29_g7 = fun readloop_15_20'10_me sofar_14_20'19_arg k ->
  let k = [sofar_14_20'19_arg,readloop_15_20'10_me], fun [sofar_14_20'19_f1,readloop_15_20'10_f2] u_17_arg ->
    let k = [sofar_14_20'19_f1,readloop_15_20'10_f2,u_17_arg], fun [sofar_14_20'19_f1,readloop_15_20'10_f2,u_17_f3] uLET_6_0'0_arg ->
      match uLET_6_0'0_arg with
      | true1 ->
        let k = [sofar_14_20'19_f1], fun [sofar_14_20'19_f1] u_21_arg ->
          let k = [sofar_14_20'19_f1], fun [sofar_14_20'19_f1] app_12_15'10_arg -> app_12_15'10_arg sofar_14_20'19_f1 k in
          let con_13_15'10_t1 = Nil0 in
          u_27_g6 con_13_15'10_t1 k in
        let u_19_t1 = Unit0 in
        let prim_8_0'0_t2 = PRIM_PutChar(u_20_g5) in
        k prim_8_0'0_t2
      | false0 ->
        let u_28_t1 = PRIM_PutChar(u_17_f3) in
        let con_14_0'0_t2 = Cons1[u_17_f3,sofar_14_20'19_f1] in
        readloop_15_20'10_f2 con_14_0'0_t2 k in
    let prim_7_0'0_t1 = PRIM_EqChar(u_17_arg,u_18_g4) in
    k prim_7_0'0_t1 in
  let u_16_t1 = Unit0 in
  let prim_5_0'0_t2 = PRIM_GetChar(u_16_t1) in
  k prim_5_0'0_t2 in
let u_32_g8 = '\n' in
let u_34_g9 = fun mainloop_10_30'8_me __9_30'17_arg k ->
  let k = [mainloop_10_30'8_me], fun [mainloop_10_30'8_f1] u_12_arg ->
    let k = [mainloop_10_30'8_f1], fun [mainloop_10_30'8_f1] u_30_arg ->
      let k = [mainloop_10_30'8_f1], fun [mainloop_10_30'8_f1] u_33_arg ->
        let con_17_34'10_t1 = Unit0 in
        mainloop_10_30'8_f1 con_17_34'10_t1 k in
      let u_31_t1 = Unit0 in
      let prim_16_0'0_t2 = PRIM_PutChar(u_32_g8) in
      k prim_16_0'0_t2 in
    let k = [], fun [] uLET_4_0'0_arg -> u_6_g1 uLET_4_0'0_arg k in
    let u_13_t1 = Unit0 in
    let con_15_26'11_t2 = Nil0 in
    u_29_g7 con_15_26'11_t2 k in
  let prim_3_0'0_t1 = PRIM_Explode(u_11_g3) in
  u_6_g1 prim_3_0'0_t1 k in
let u_36_g10 = "RUN\n" in
let u_39_g11 = "NEVER\n" in
let k = [], fun [] u_8_arg ->
  let u_35_t1 = Unit0 in
  let k = [], fun [] u_37_arg ->
    let k = [], fun [] u_38_arg ->
      let prim_20_0'0_t1 = PRIM_Explode(u_39_g11) in
      u_6_g1 prim_20_0'0_t1 k in
    let con_19_38'20_t1 = Unit0 in
    u_34_g9 con_19_38'20_t1 k in
  let prim_18_0'0_t2 = PRIM_Explode(u_36_g10) in
  u_6_g1 prim_18_0'0_t2 k in
let prim_2_0'0_t1 = PRIM_Explode(u_7_g2) in
u_6_g1 prim_2_0'0_t1 k
