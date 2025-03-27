(*stage2; un-normalized*)
let k () = ()
let +_0'0 = fun [] x_0'0 k ->
  let lam_2_0'0 = fun [x_0'0] y_0'0 k ->
    let prim_1_0'0 = PRIM_AddInt(x_0'0,y_0'0) in
    k prim_1_0'0 in
  k lam_2_0'0 in
let -_0'0 = fun [] x_0'0 k ->
  let lam_4_0'0 = fun [x_0'0] y_0'0 k ->
    let prim_3_0'0 = PRIM_SubInt(x_0'0,y_0'0) in
    k prim_3_0'0 in
  k lam_4_0'0 in
let ( * )_0'0 = fun [] x_0'0 k ->
  let lam_6_0'0 = fun [x_0'0] y_0'0 k ->
    let prim_5_0'0 = PRIM_MulInt(x_0'0,y_0'0) in
    k prim_5_0'0 in
  k lam_6_0'0 in
let /_0'0 = fun [] x_0'0 k ->
  let lam_8_0'0 = fun [x_0'0] y_0'0 k ->
    let prim_7_0'0 = PRIM_DivInt(x_0'0,y_0'0) in
    k prim_7_0'0 in
  k lam_8_0'0 in
let %_0'0 = fun [] x_0'0 k ->
  let lam_10_0'0 = fun [x_0'0] y_0'0 k ->
    let prim_9_0'0 = PRIM_ModInt(x_0'0,y_0'0) in
    k prim_9_0'0 in
  k lam_10_0'0 in
let <_0'0 = fun [] x_0'0 k ->
  let lam_12_0'0 = fun [x_0'0] y_0'0 k ->
    let prim_11_0'0 = PRIM_LessInt(x_0'0,y_0'0) in
    k prim_11_0'0 in
  k lam_12_0'0 in
let =_0'0 = fun [] x_0'0 k ->
  let lam_14_0'0 = fun [x_0'0] y_0'0 k ->
    let prim_13_0'0 = PRIM_EqInt(x_0'0,y_0'0) in
    k prim_13_0'0 in
  k lam_14_0'0 in
let eq_char_0'0 = fun [] x_0'0 k ->
  let lam_16_0'0 = fun [x_0'0] y_0'0 k ->
    let prim_15_0'0 = PRIM_EqChar(x_0'0,y_0'0) in
    k prim_15_0'0 in
  k lam_16_0'0 in
let ord_0'0 = fun [] x_0'0 k ->
  let prim_17_0'0 = PRIM_CharOrd(x_0'0) in
  k prim_17_0'0 in
let chr_0'0 = fun [] x_0'0 k ->
  let prim_18_0'0 = PRIM_CharChr(x_0'0) in
  k prim_18_0'0 in
let explode_0'0 = fun [] x_0'0 k ->
  let prim_19_0'0 = PRIM_Explode(x_0'0) in
  k prim_19_0'0 in
let put_char_0'0 = fun [] x_0'0 k ->
  let prim_20_0'0 = PRIM_PutChar(x_0'0) in
  k prim_20_0'0 in
let get_char_0'0 = fun [] x_0'0 k ->
  let prim_21_0'0 = PRIM_GetChar(x_0'0) in
  k prim_21_0'0 in
let ::_0'0 = fun [] x_0'0 k ->
  let lam_23_0'0 = fun [x_0'0] y_0'0 k ->
    let con_22_0'0 = Cons1[x_0'0,y_0'0] in
    k con_22_0'0 in
  k lam_23_0'0 in
let put_chars_2'8 = fix (fun [put_char_0'0] put_chars_2'8 xs_2'18 k ->
  match xs_2'18 with
  | Nil0 ->
    let con_24_4'10 = Unit0 in
    k con_24_4'10
  | Cons1(x_5'4,xsMore_5'7) ->
    let k [put_chars_2'8,xsMore_5'7] __5'27 = put_chars_2'8 xsMore_5'7 k in
    put_char_0'0 x_5'4 k) in
let put_string_7'4 = fun [explode_0'0,put_chars_2'8] s_7'15 k ->
  let k [put_chars_2'8] app_25_7'38 = put_chars_2'8 app_25_7'38 k in
  explode_0'0 s_7'15 k in
let reverse_9'4 = fun [::_0'0] ysStart_9'12 k ->
  let revloop_10'10 = fix (fun [::_0'0] revloop_10'10 acc_10'18 k ->
    let lam_29_10'22 = fun [::_0'0,revloop_10'10,acc_10'18] ys_10'22 k ->
      match ys_10'22 with
      | Nil0 -> k acc_10'18
      | Cons1(y_13'6,ysMore_13'9) ->
        let k [ysMore_13'9] app_26_13'27 = app_26_13'27 ysMore_13'9 k in
        let k [revloop_10'10] app_27_13'33 = revloop_10'10 app_27_13'33 k in
        let k [acc_10'18] app_28_13'30 = app_28_13'30 acc_10'18 k in
        ::_0'0 y_13'6 k in
    k lam_29_10'22) in
  let k [ysStart_9'12] app_30_15'10 = app_30_15'10 ysStart_9'12 k in
  let con_31_15'10 = Nil0 in
  revloop_10'10 con_31_15'10 k in
let newline_17'4 = fun [put_char_0'0] __17'12 k ->
  let lit_32_17'26 = '\n' in
  put_char_0'0 lit_32_17'26 k in
let read_line_19'4 = fun [::_0'0,eq_char_0'0,get_char_0'0,put_char_0'0,reverse_9'4,newline_17'4] __19'14 k ->
  let readloop_20'10 = fix (fun [::_0'0,eq_char_0'0,get_char_0'0,put_char_0'0,reverse_9'4,newline_17'4] readloop_20'10 sofar_20'19 k ->
    let k [::_0'0,eq_char_0'0,put_char_0'0,reverse_9'4,newline_17'4,readloop_20'10,sofar_20'19] theChar_21'8 =
      let gotten_22'8 = theChar_21'8 in
      let k [::_0'0,put_char_0'0,reverse_9'4,newline_17'4,readloop_20'10,sofar_20'19,gotten_22'8] app_34_23'22 =
        match app_34_23'22 with
        | true1 ->
          let k [reverse_9'4,sofar_20'19] __23'42 = reverse_9'4 sofar_20'19 k in
          let con_37_23'40 = Unit0 in
          newline_17'4 con_37_23'40 k
        | false0 ->
          let k [::_0'0,readloop_20'10,sofar_20'19,gotten_22'8] __24'22 =
            let k [readloop_20'10] app_38_24'44 = readloop_20'10 app_38_24'44 k in
            let k [sofar_20'19] app_39_24'41 = app_39_24'41 sofar_20'19 k in
            ::_0'0 gotten_22'8 k in
          put_char_0'0 gotten_22'8 k in
      let k [] app_35_23'15 =
        let lit_36_23'22 = '\n' in
        app_35_23'15 lit_36_23'22 k in
      eq_char_0'0 gotten_22'8 k in
    let con_33_21'27 = Unit0 in
    get_char_0'0 con_33_21'27 k) in
  let con_40_26'11 = Nil0 in
  readloop_20'10 con_40_26'11 k in
let k [put_chars_2'8,put_string_7'4,newline_17'4,read_line_19'4] __28'4 =
  let mainloop_30'8 = fix (fun [put_chars_2'8,put_string_7'4,newline_17'4,read_line_19'4] mainloop_30'8 __30'17 k ->
    let k [put_chars_2'8,newline_17'4,read_line_19'4,mainloop_30'8] __31'17 =
      let k [newline_17'4,mainloop_30'8] __32'26 =
        let k [mainloop_30'8] __33'11 =
          let con_46_34'10 = Unit0 in
          mainloop_30'8 con_46_34'10 k in
        let con_45_33'9 = Unit0 in
        newline_17'4 con_45_33'9 k in
      let k [put_chars_2'8] app_43_32'23 = put_chars_2'8 app_43_32'23 k in
      let con_44_32'23 = Unit0 in
      read_line_19'4 con_44_32'23 k in
    let lit_42_31'13 = "> " in
    put_string_7'4 lit_42_31'13 k) in
  let main_36'4 = fun [put_string_7'4,mainloop_30'8] __36'9 k ->
    let k [put_string_7'4,mainloop_30'8] __37'20 =
      let k [put_string_7'4] __38'6 =
        let lit_49_39'13 = "NEVER\n" in
        put_string_7'4 lit_49_39'13 k in
      let con_48_38'20 = Unit0 in
      mainloop_30'8 con_48_38'20 k in
    let lit_47_37'13 = "RUN\n" in
    put_string_7'4 lit_47_37'13 k in
  let con_50_0'0 = Unit0 in
  main_36'4 con_50_0'0 k in
let lit_41_28'20 = "LOAD\n" in
put_string_7'4 lit_41_28'20 k
