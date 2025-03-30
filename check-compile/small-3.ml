(*stage3*)
let k () = ()
let con_1_4'10_g1 = Unit0 in
let put_chars_6_2'8_g2 = fun put_chars_2_2'8_me xs_1_2'18_arg k ->
  match xs_1_2'18_arg with
  | Nil0 -> k con_1_4'10_g1
  | Cons1(x_3_5'4_t1,xsMore_4_5'7_t2) ->
    let __5_5'27_t3 = PRIM_PutChar(x_3_5'4_t1) in
    put_chars_2_2'8_me xsMore_4_5'7_t2 k in
let s_7_7'15_g3 = "LOAD\n" in
let s_11_7'15_g4 = "> " in
let x_16_0'0_g5 = Unit0 in
let y_18_0'0_g6 = '\n' in
let x_20_0'0_g7 = '\n' in
let revloop_27_10'10_g8 = fun revloop_23_10'10_me acc_22_10'18_arg k ->
  let lam_8_10'22_t1 = [acc_22_10'18_arg,revloop_23_10'10_me], fun [acc_22_10'18_f1,revloop_23_10'10_f2] ys_24_10'22_arg k ->
    match ys_24_10'22_arg with
    | Nil0 -> k acc_22_10'18_f1
    | Cons1(y_25_13'6_t1,ysMore_26_13'9_t2) ->
      let con_7_0'0_t3 = Cons1[y_25_13'6_t1,acc_22_10'18_f1] in
      let k = [ysMore_26_13'9_t2], fun [ysMore_26_13'9_f1] app_6_13'27_arg -> app_6_13'27_arg ysMore_26_13'9_f1 k in
      revloop_23_10'10_f2 con_7_0'0_t3 k in
  k lam_8_10'22_t1 in
let con_10_15'10_g9 = Nil0 in
let readloop_29_20'10_g10 = fun readloop_15_20'10_me sofar_14_20'19_arg k ->
  let theChar_17_21'8_t1 = PRIM_GetChar(x_16_0'0_g5) in
  let uLET_5_0'0_t2 = PRIM_EqChar(theChar_17_21'8_t1,y_18_0'0_g6) in
  match uLET_5_0'0_t2 with
  | true1 ->
    let __21_23'42_t3 = PRIM_PutChar(x_20_0'0_g7) in
    let k = [sofar_14_20'19_arg], fun [sofar_14_20'19_f1] app_9_15'10_arg -> app_9_15'10_arg sofar_14_20'19_f1 k in
    revloop_27_10'10_g8 con_10_15'10_g9 k
  | false0 ->
    let __28_24'22_t3 = PRIM_PutChar(theChar_17_21'8_t1) in
    let con_11_0'0_t4 = Cons1[theChar_17_21'8_t1,sofar_14_20'19_arg] in
    readloop_15_20'10_me con_11_0'0_t4 k in
let con_12_26'11_g11 = Nil0 in
let x_32_0'0_g12 = '\n' in
let con_13_34'10_g13 = Unit0 in
let mainloop_34_30'8_g14 = fun mainloop_10_30'8_me __9_30'17_arg k ->
  let prim_3_0'0_t1 = PRIM_Explode(s_11_7'15_g4) in
  let k = [mainloop_10_30'8_me], fun [mainloop_10_30'8_f1] __12_31'17_arg ->
    let k = [mainloop_10_30'8_f1], fun [mainloop_10_30'8_f1] uLET_4_19'14_arg ->
      let k = [mainloop_10_30'8_f1], fun [mainloop_10_30'8_f1] __30_32'26_arg ->
        let __33_33'11_t1 = PRIM_PutChar(x_32_0'0_g12) in
        mainloop_10_30'8_f1 con_13_34'10_g13 k in
      put_chars_6_2'8_g2 uLET_4_19'14_arg k in
    readloop_29_20'10_g10 con_12_26'11_g11 k in
  put_chars_6_2'8_g2 prim_3_0'0_t1 k in
let s_36_7'15_g15 = "RUN\n" in
let con_15_38'20_g16 = Unit0 in
let s_39_7'15_g17 = "NEVER\n" in
let prim_2_0'0_t1 = PRIM_Explode(s_7_7'15_g3) in
let k = [], fun [] __8_28'4_arg ->
  let prim_14_0'0_t1 = PRIM_Explode(s_36_7'15_g15) in
  let k = [], fun [] __37_37'20_arg ->
    let k = [], fun [] __38_38'6_arg ->
      let prim_16_0'0_t1 = PRIM_Explode(s_39_7'15_g17) in
      put_chars_6_2'8_g2 prim_16_0'0_t1 k in
    mainloop_34_30'8_g14 con_15_38'20_g16 k in
  put_chars_6_2'8_g2 prim_14_0'0_t1 k in
put_chars_6_2'8_g2 prim_2_0'0_t1 k
