(*stage3; un-normalized*)
let k () = ()
let eq_char_0'0_g1 = fun x_0'0_arg k ->
  let lam_16_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_15_0'0_t1 = PRIM_EqChar(x_0'0_f1,y_0'0_arg) in
    k prim_15_0'0_t1 in
  k lam_16_0'0_t1 in
let explode_0'0_g2 = fun x_0'0_arg k ->
  let prim_19_0'0_t1 = PRIM_Explode(x_0'0_arg) in
  k prim_19_0'0_t1 in
let put_char_0'0_g3 = fun x_0'0_arg k ->
  let prim_20_0'0_t1 = PRIM_PutChar(x_0'0_arg) in
  k prim_20_0'0_t1 in
let get_char_0'0_g4 = fun x_0'0_arg k ->
  let prim_21_0'0_t1 = PRIM_GetChar(x_0'0_arg) in
  k prim_21_0'0_t1 in
let ::_0'0_g5 = fun x_0'0_arg k ->
  let lam_23_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let con_22_0'0_t1 = Cons1[x_0'0_f1,y_0'0_arg] in
    k con_22_0'0_t1 in
  k lam_23_0'0_t1 in
let put_chars_2'8_g6 = fun put_chars_2'8_me xs_2'18_arg k ->
  match xs_2'18_arg with
  | Nil0 ->
    let con_24_4'10_t1 = Unit0 in
    k con_24_4'10_t1
  | Cons1(x_5'4_t1,xsMore_5'7_t2) ->
    let k = [put_chars_2'8_me,xsMore_5'7_t2], fun [put_chars_2'8_f1,xsMore_5'7_f2] __5'27_arg -> put_chars_2'8_f1 xsMore_5'7_f2 k in
    put_char_0'0_g3 x_5'4_t1 k in
let put_string_7'4_g7 = fun s_7'15_arg k ->
  let k = [], fun [] app_25_7'38_arg -> put_chars_2'8_g6 app_25_7'38_arg k in
  explode_0'0_g2 s_7'15_arg k in
let revloop_10'10_g8 = fun revloop_10'10_me acc_10'18_arg k ->
  let lam_29_10'22_t1 = [revloop_10'10_me,acc_10'18_arg], fun [revloop_10'10_f1,acc_10'18_f2] ys_10'22_arg k ->
    match ys_10'22_arg with
    | Nil0 -> k acc_10'18_f2
    | Cons1(y_13'6_t1,ysMore_13'9_t2) ->
      let k = [ysMore_13'9_t2], fun [ysMore_13'9_f1] app_26_13'27_arg -> app_26_13'27_arg ysMore_13'9_f1 k in
      let k = [revloop_10'10_f1], fun [revloop_10'10_f1] app_27_13'33_arg -> revloop_10'10_f1 app_27_13'33_arg k in
      let k = [acc_10'18_f2], fun [acc_10'18_f1] app_28_13'30_arg -> app_28_13'30_arg acc_10'18_f1 k in
      ::_0'0_g5 y_13'6_t1 k in
  k lam_29_10'22_t1 in
let reverse_9'4_g9 = fun ysStart_9'12_arg k ->
  let k = [ysStart_9'12_arg], fun [ysStart_9'12_f1] app_30_15'10_arg -> app_30_15'10_arg ysStart_9'12_f1 k in
  let con_31_15'10_t1 = Nil0 in
  revloop_10'10_g8 con_31_15'10_t1 k in
let lit_32_17'26_g10 = '\n' in
let newline_17'4_g11 = fun __17'12_arg k -> put_char_0'0_g3 lit_32_17'26_g10 k in
let put_string_newline_19'4_g12 = fun s_19'23_arg k ->
  let k = [], fun [] __20'14_arg ->
    let con_33_21'10_t1 = Unit0 in
    newline_17'4_g11 con_33_21'10_t1 k in
  put_string_7'4_g7 s_19'23_arg k in
let lit_37_27'22_g13 = '\n' in
let readloop_24'10_g14 = fun readloop_24'10_me sofar_24'19_arg k ->
  let k = [readloop_24'10_me,sofar_24'19_arg], fun [readloop_24'10_f1,sofar_24'19_f2] theChar_25'8_arg ->
    let gotten_26'8_arg = theChar_25'8_arg in
    let k = [readloop_24'10_f1,sofar_24'19_f2,gotten_26'8_arg], fun [readloop_24'10_f1,sofar_24'19_f2,gotten_26'8_f3] app_35_27'22_arg ->
      match app_35_27'22_arg with
      | true1 ->
        let k = [sofar_24'19_f2], fun [sofar_24'19_f1] __27'42_arg -> reverse_9'4_g9 sofar_24'19_f1 k in
        let con_38_27'40_t1 = Unit0 in
        newline_17'4_g11 con_38_27'40_t1 k
      | false0 ->
        let k = [readloop_24'10_f1,sofar_24'19_f2,gotten_26'8_f3], fun [readloop_24'10_f1,sofar_24'19_f2,gotten_26'8_f3] __28'22_arg ->
          let k = [readloop_24'10_f1], fun [readloop_24'10_f1] app_39_28'44_arg -> readloop_24'10_f1 app_39_28'44_arg k in
          let k = [sofar_24'19_f2], fun [sofar_24'19_f1] app_40_28'41_arg -> app_40_28'41_arg sofar_24'19_f1 k in
          ::_0'0_g5 gotten_26'8_f3 k in
        put_char_0'0_g3 gotten_26'8_f3 k in
    let k = [], fun [] app_36_27'15_arg -> app_36_27'15_arg lit_37_27'22_g13 k in
    eq_char_0'0_g1 gotten_26'8_arg k in
  let con_34_25'27_t1 = Unit0 in
  get_char_0'0_g4 con_34_25'27_t1 k in
let read_line_23'4_g15 = fun __23'14_arg k ->
  let con_41_30'11_t1 = Nil0 in
  readloop_24'10_g14 con_41_30'11_t1 k in
let lit_42_32'28_g16 = "LOAD" in
let lit_43_35'13_g17 = "> " in
let mainloop_34'8_g18 = fun mainloop_34'8_me __34'17_arg k ->
  let k = [mainloop_34'8_me], fun [mainloop_34'8_f1] __35'17_arg ->
    let k = [mainloop_34'8_f1], fun [mainloop_34'8_f1] __36'26_arg ->
      let k = [mainloop_34'8_f1], fun [mainloop_34'8_f1] __37'11_arg ->
        let con_47_38'10_t1 = Unit0 in
        mainloop_34'8_f1 con_47_38'10_t1 k in
      let con_46_37'9_t1 = Unit0 in
      newline_17'4_g11 con_46_37'9_t1 k in
    let k = [], fun [] app_44_36'23_arg -> put_chars_2'8_g6 app_44_36'23_arg k in
    let con_45_36'23_t1 = Unit0 in
    read_line_23'4_g15 con_45_36'23_t1 k in
  put_string_7'4_g7 lit_43_35'13_g17 k in
let lit_48_41'21_g19 = "RUN" in
let lit_50_43'21_g20 = "NEVER" in
let main_40'4_g21 = fun __40'9_arg k ->
  let k = [], fun [] __41'26_arg ->
    let k = [], fun [] __42'6_arg -> put_string_newline_19'4_g12 lit_50_43'21_g20 k in
    let con_49_42'20_t1 = Unit0 in
    mainloop_34'8_g18 con_49_42'20_t1 k in
  put_string_newline_19'4_g12 lit_48_41'21_g19 k in
let k = [], fun [] __32'4_arg ->
  let con_51_0'0_t1 = Unit0 in
  main_40'4_g21 con_51_0'0_t1 k in
put_string_newline_19'4_g12 lit_42_32'28_g16 k
