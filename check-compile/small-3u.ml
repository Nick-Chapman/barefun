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
      let k = [revloop_10'10_f1,acc_10'18_f2,ysMore_13'9_t2], fun [revloop_10'10_f1,acc_10'18_f2,ysMore_13'9_f3] app_28_13'30_arg ->
        let k = [revloop_10'10_f1,ysMore_13'9_f3], fun [revloop_10'10_f1,ysMore_13'9_f2] app_27_13'33_arg ->
          let k = [ysMore_13'9_f2], fun [ysMore_13'9_f1] app_26_13'27_arg -> app_26_13'27_arg ysMore_13'9_f1 k in
          revloop_10'10_f1 app_27_13'33_arg k in
        app_28_13'30_arg acc_10'18_f2 k in
      ::_0'0_g5 y_13'6_t1 k in
  k lam_29_10'22_t1 in
let reverse_9'4_g9 = fun ysStart_9'12_arg k ->
  let con_31_15'10_t1 = Nil0 in
  let k = [ysStart_9'12_arg], fun [ysStart_9'12_f1] app_30_15'10_arg -> app_30_15'10_arg ysStart_9'12_f1 k in
  revloop_10'10_g8 con_31_15'10_t1 k in
let lit_32_17'26_g10 = '\n' in
let newline_17'4_g11 = fun __17'12_arg k -> put_char_0'0_g3 lit_32_17'26_g10 k in
let lit_36_23'22_g12 = '\n' in
let readloop_20'10_g13 = fun readloop_20'10_me sofar_20'19_arg k ->
  let con_33_21'27_t1 = Unit0 in
  let k = [readloop_20'10_me,sofar_20'19_arg], fun [readloop_20'10_f1,sofar_20'19_f2] theChar_21'8_arg ->
    let gotten_22'8_arg = theChar_21'8_arg in
    let k = [readloop_20'10_f1,sofar_20'19_f2,gotten_22'8_arg], fun [readloop_20'10_f1,sofar_20'19_f2,gotten_22'8_f3] app_35_23'15_arg ->
      let k = [readloop_20'10_f1,sofar_20'19_f2,gotten_22'8_f3], fun [readloop_20'10_f1,sofar_20'19_f2,gotten_22'8_f3] app_34_23'22_arg ->
        match app_34_23'22_arg with
        | true1 ->
          let con_37_23'40_t1 = Unit0 in
          let k = [sofar_20'19_f2], fun [sofar_20'19_f1] __23'42_arg -> reverse_9'4_g9 sofar_20'19_f1 k in
          newline_17'4_g11 con_37_23'40_t1 k
        | false0 ->
          let k = [readloop_20'10_f1,sofar_20'19_f2,gotten_22'8_f3], fun [readloop_20'10_f1,sofar_20'19_f2,gotten_22'8_f3] __24'22_arg ->
            let k = [readloop_20'10_f1,sofar_20'19_f2], fun [readloop_20'10_f1,sofar_20'19_f2] app_39_24'41_arg ->
              let k = [readloop_20'10_f1], fun [readloop_20'10_f1] app_38_24'44_arg -> readloop_20'10_f1 app_38_24'44_arg k in
              app_39_24'41_arg sofar_20'19_f2 k in
            ::_0'0_g5 gotten_22'8_f3 k in
          put_char_0'0_g3 gotten_22'8_f3 k in
      app_35_23'15_arg lit_36_23'22_g12 k in
    eq_char_0'0_g1 gotten_22'8_arg k in
  get_char_0'0_g4 con_33_21'27_t1 k in
let read_line_19'4_g14 = fun __19'14_arg k ->
  let con_40_26'11_t1 = Nil0 in
  readloop_20'10_g13 con_40_26'11_t1 k in
let lit_41_28'20_g15 = "LOAD\n" in
let lit_42_31'13_g16 = "> " in
let mainloop_30'8_g17 = fun mainloop_30'8_me __30'17_arg k ->
  let k = [mainloop_30'8_me], fun [mainloop_30'8_f1] __31'17_arg ->
    let con_44_32'23_t1 = Unit0 in
    let k = [mainloop_30'8_f1], fun [mainloop_30'8_f1] app_43_32'23_arg ->
      let k = [mainloop_30'8_f1], fun [mainloop_30'8_f1] __32'26_arg ->
        let con_45_33'9_t1 = Unit0 in
        let k = [mainloop_30'8_f1], fun [mainloop_30'8_f1] __33'11_arg ->
          let con_46_34'10_t1 = Unit0 in
          mainloop_30'8_f1 con_46_34'10_t1 k in
        newline_17'4_g11 con_45_33'9_t1 k in
      put_chars_2'8_g6 app_43_32'23_arg k in
    read_line_19'4_g14 con_44_32'23_t1 k in
  put_string_7'4_g7 lit_42_31'13_g16 k in
let lit_47_37'13_g18 = "RUN\n" in
let lit_49_39'13_g19 = "NEVER\n" in
let main_36'4_g20 = fun __36'9_arg k ->
  let k = [], fun [] __37'20_arg ->
    let con_48_38'20_t1 = Unit0 in
    let k = [], fun [] __38'6_arg -> put_string_7'4_g7 lit_49_39'13_g19 k in
    mainloop_30'8_g17 con_48_38'20_t1 k in
  put_string_7'4_g7 lit_47_37'13_g18 k in
let k = [], fun [] __28'4_arg ->
  let con_50_0'0_t1 = Unit0 in
  main_36'4_g20 con_50_0'0_t1 k in
put_string_7'4_g7 lit_41_28'20_g15 k
