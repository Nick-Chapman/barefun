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
let chars_of_int_2'4 = fun [%_0'0,+_0'0,/_0'0,::_0'0,=_0'0,chr_0'0,ord_0'0] i_2'17 k ->
  let k [%_0'0,+_0'0,/_0'0,::_0'0,=_0'0,chr_0'0,i_2'17] ord0_3'6 =
    let char_of_digit_4'6 = fun [+_0'0,chr_0'0,ord0_3'6] c_4'20 k ->
      let k [chr_0'0] app_25_4'36 = chr_0'0 app_25_4'36 k in
      let k [c_4'20] app_26_4'34 = app_26_4'34 c_4'20 k in
      +_0'0 ord0_3'6 k in
    let loop_5'10 = fix (fun [%_0'0,/_0'0,::_0'0,=_0'0,char_of_digit_4'6] loop_5'10 acc_5'15 k ->
      let lam_40_5'19 = fun [%_0'0,/_0'0,::_0'0,=_0'0,char_of_digit_4'6,loop_5'10,acc_5'15] i_5'19 k ->
        let k [%_0'0,/_0'0,::_0'0,char_of_digit_4'6,loop_5'10,acc_5'15,i_5'19] app_27_6'11 =
          match app_27_6'11 with
          | true1 -> k acc_5'15
          | false0 ->
            let k [/_0'0,i_5'19] app_30_7'11 =
              let k [app_30_7'11] app_37_7'44 = app_30_7'11 app_37_7'44 k in
              let k [] app_38_7'43 =
                let lit_39_7'44 = 10 in
                app_38_7'43 lit_39_7'44 k in
              /_0'0 i_5'19 k in
            let k [loop_5'10] app_31_7'36 = loop_5'10 app_31_7'36 k in
            let k [acc_5'15] app_32_7'33 = app_32_7'33 acc_5'15 k in
            let k [::_0'0] app_33_7'26 = ::_0'0 app_33_7'26 k in
            let k [char_of_digit_4'6] app_34_7'29 = char_of_digit_4'6 app_34_7'29 k in
            let k [] app_35_7'28 =
              let lit_36_7'29 = 10 in
              app_35_7'28 lit_36_7'29 k in
            %_0'0 i_5'19 k in
        let k [] app_28_6'9 =
          let lit_29_6'11 = 0 in
          app_28_6'9 lit_29_6'11 k in
        =_0'0 i_5'19 k in
      k lam_40_5'19) in
    let k [i_2'17,loop_5'10] app_41_9'9 =
      match app_41_9'9 with
      | true1 ->
        let lit_44_9'17 = '0' in
        let con_45_9'20 = Nil0 in
        let con_46_9'17 = Cons1[lit_44_9'17,con_45_9'20] in
        k con_46_9'17
      | false0 ->
        let k [i_2'17] app_47_9'32 = app_47_9'32 i_2'17 k in
        let con_48_9'32 = Nil0 in
        loop_5'10 con_48_9'32 k in
    let k [] app_42_9'7 =
      let lit_43_9'9 = 0 in
      app_42_9'7 lit_43_9'9 k in
    =_0'0 i_2'17 k in
  let lit_24_3'17 = '0' in
  ord_0'0 lit_24_3'17 k in
let put_chars_11'8 = fix (fun [put_char_0'0] put_chars_11'8 xs_11'18 k ->
  match xs_11'18 with
  | Nil0 ->
    let con_49_13'10 = Unit0 in
    k con_49_13'10
  | Cons1(x_14'4,xs_14'7) ->
    let k [put_chars_11'8,xs_14'7] __14'23 = put_chars_11'8 xs_14'7 k in
    put_char_0'0 x_14'4 k) in
let put_string_16'4 = fun [explode_0'0,put_chars_11'8] s_16'15 k ->
  let k [put_chars_11'8] app_50_16'38 = put_chars_11'8 app_50_16'38 k in
  explode_0'0 s_16'15 k in
let put_int_18'4 = fun [chars_of_int_2'4,put_chars_11'8] i_18'12 k ->
  let k [put_chars_11'8] app_51_18'40 = put_chars_11'8 app_51_18'40 k in
  chars_of_int_2'4 i_18'12 k in
let newline_20'4 = fun [put_char_0'0] __20'12 k ->
  let lit_52_20'26 = '\n' in
  put_char_0'0 lit_52_20'26 k in
let fib_22'8 = fix (fun [+_0'0,-_0'0,<_0'0] fib_22'8 n_22'12 k ->
  let k [+_0'0,-_0'0,fib_22'8,n_22'12] app_53_24'9 =
    match app_53_24'9 with
    | true1 -> k n_22'12
    | false0 ->
      let k [-_0'0,fib_22'8,n_22'12] app_56_24'33 =
        let k [app_56_24'33] app_61_24'39 = app_56_24'33 app_61_24'39 k in
        let k [fib_22'8] app_62_24'42 = fib_22'8 app_62_24'42 k in
        let k [] app_63_24'41 =
          let lit_64_24'42 = 2 in
          app_63_24'41 lit_64_24'42 k in
        -_0'0 n_22'12 k in
      let k [+_0'0] app_57_24'27 = +_0'0 app_57_24'27 k in
      let k [fib_22'8] app_58_24'30 = fib_22'8 app_58_24'30 k in
      let k [] app_59_24'29 =
        let lit_60_24'30 = 1 in
        app_59_24'29 lit_60_24'30 k in
      -_0'0 n_22'12 k in
  let k [] app_54_24'7 =
    let lit_55_24'9 = 2 in
    app_54_24'7 lit_55_24'9 k in
  <_0'0 n_22'12 k) in
let runfib_26'4 = fun [put_string_16'4,put_int_18'4,newline_20'4,fib_22'8] n_26'11 k ->
  let k [put_string_16'4,put_int_18'4,newline_20'4,n_26'11] res_27'6 =
    let k [put_string_16'4,put_int_18'4,newline_20'4,n_26'11,res_27'6] __28'19 =
      let k [put_string_16'4,put_int_18'4,newline_20'4,res_27'6] __29'11 =
        let k [put_int_18'4,newline_20'4,res_27'6] __30'20 =
          let k [newline_20'4] __31'13 =
            let con_67_32'10 = Unit0 in
            newline_20'4 con_67_32'10 k in
          put_int_18'4 res_27'6 k in
        let lit_66_30'13 = " --> " in
        put_string_16'4 lit_66_30'13 k in
      put_int_18'4 n_26'11 k in
    let lit_65_28'13 = "fib " in
    put_string_16'4 lit_65_28'13 k in
  fib_22'8 n_26'11 k in
let main_34'4 = fun [runfib_26'4] __34'9 k ->
  let lit_68_34'21 = 20 in
  runfib_26'4 lit_68_34'21 k in
let con_69_0'0 = Unit0 in
main_34'4 con_69_0'0 k
