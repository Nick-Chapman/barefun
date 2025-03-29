(*stage3*)
let k () = ()
let put_chars_6_2'8_g1 = fun put_chars_2_2'8_me xs_1_2'18_arg k ->
  match xs_1_2'18_arg with
  | Nil0 ->
    let con_1_4'10_t1 = Unit0 in
    k con_1_4'10_t1
  | Cons1(x_3_5'4_t1,xsMore_4_5'7_t2) ->
    let __5_5'27_t3 = PRIM_PutChar(x_3_5'4_t1) in
    put_chars_2_2'8_me xsMore_4_5'7_t2 k in
let s_7_7'15_g2 = "LOAD\n" in
let s_11_7'15_g3 = "> " in
let y_18_0'0_g4 = '\n' in
let x_20_0'0_g5 = '\n' in
let revloop_27_10'10_g6 = fun revloop_23_10'10_me acc_22_10'18_arg k ->
  let lam_8_10'22_t1 = [acc_22_10'18_arg,revloop_23_10'10_me], fun [acc_22_10'18_f1,revloop_23_10'10_f2] ys_24_10'22_arg k ->
    match ys_24_10'22_arg with
    | Nil0 -> k acc_22_10'18_f1
    | Cons1(y_25_13'6_t1,ysMore_26_13'9_t2) ->
      let con_7_0'0_t3 = Cons1[y_25_13'6_t1,acc_22_10'18_f1] in
      let k = [ysMore_26_13'9_t2], fun [ysMore_26_13'9_f1] app_6_13'27_arg -> app_6_13'27_arg ysMore_26_13'9_f1 k in
      revloop_23_10'10_f2 con_7_0'0_t3 k in
  k lam_8_10'22_t1 in
let readloop_29_20'10_g7 = fun readloop_15_20'10_me sofar_14_20'19_arg k ->
  let x_16_0'0_t1 = Unit0 in
  let theChar_17_21'8_t2 = PRIM_GetChar(x_16_0'0_t1) in
  let uLET_5_0'0_t3 = PRIM_EqChar(theChar_17_21'8_t2,y_18_0'0_g4) in
  match uLET_5_0'0_t3 with
  | true1 ->
    let __19_17'12_t4 = Unit0 in
    let __21_23'42_t5 = PRIM_PutChar(x_20_0'0_g5) in
    let con_10_15'10_t6 = Nil0 in
    let k = [sofar_14_20'19_arg], fun [sofar_14_20'19_f1] app_9_15'10_arg -> app_9_15'10_arg sofar_14_20'19_f1 k in
    revloop_27_10'10_g6 con_10_15'10_t6 k
  | false0 ->
    let __28_24'22_t4 = PRIM_PutChar(theChar_17_21'8_t2) in
    let con_11_0'0_t5 = Cons1[theChar_17_21'8_t2,sofar_14_20'19_arg] in
    readloop_15_20'10_me con_11_0'0_t5 k in
let x_32_0'0_g8 = '\n' in
let mainloop_34_30'8_g9 = fun mainloop_10_30'8_me __9_30'17_arg k ->
  let prim_3_0'0_t1 = PRIM_Explode(s_11_7'15_g3) in
  let k = [mainloop_10_30'8_me], fun [mainloop_10_30'8_f1] __12_31'17_arg ->
    let __13_19'14_t1 = Unit0 in
    let con_12_26'11_t2 = Nil0 in
    let k = [mainloop_10_30'8_f1], fun [mainloop_10_30'8_f1] uLET_4_19'14_arg ->
      let k = [mainloop_10_30'8_f1], fun [mainloop_10_30'8_f1] __30_32'26_arg ->
        let __31_17'12_t1 = Unit0 in
        let __33_33'11_t2 = PRIM_PutChar(x_32_0'0_g8) in
        let con_13_34'10_t3 = Unit0 in
        mainloop_10_30'8_f1 con_13_34'10_t3 k in
      put_chars_6_2'8_g1 uLET_4_19'14_arg k in
    readloop_29_20'10_g7 con_12_26'11_t2 k in
  put_chars_6_2'8_g1 prim_3_0'0_t1 k in
let s_36_7'15_g10 = "RUN\n" in
let s_39_7'15_g11 = "NEVER\n" in
let prim_2_0'0_t1 = PRIM_Explode(s_7_7'15_g2) in
let k = [], fun [] __8_28'4_arg ->
  let __35_36'9_t1 = Unit0 in
  let prim_14_0'0_t2 = PRIM_Explode(s_36_7'15_g10) in
  let k = [], fun [] __37_37'20_arg ->
    let con_15_38'20_t1 = Unit0 in
    let k = [], fun [] __38_38'6_arg ->
      let prim_16_0'0_t1 = PRIM_Explode(s_39_7'15_g11) in
      put_chars_6_2'8_g1 prim_16_0'0_t1 k in
    mainloop_34_30'8_g9 con_15_38'20_t1 k in
  put_chars_6_2'8_g1 prim_14_0'0_t2 k in
put_chars_6_2'8_g1 prim_2_0'0_t1 k
