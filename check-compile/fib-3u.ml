(*stage3; un-normalized*)
let k () = ()
let +_0'0_g1 = fun x_0'0_arg k ->
  let lam_2_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_1_0'0_t1 = PRIM_AddInt(x_0'0_f1,y_0'0_arg) in
    k prim_1_0'0_t1 in
  k lam_2_0'0_t1 in
let -_0'0_g2 = fun x_0'0_arg k ->
  let lam_4_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_3_0'0_t1 = PRIM_SubInt(x_0'0_f1,y_0'0_arg) in
    k prim_3_0'0_t1 in
  k lam_4_0'0_t1 in
let /_0'0_g3 = fun x_0'0_arg k ->
  let lam_8_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_7_0'0_t1 = PRIM_DivInt(x_0'0_f1,y_0'0_arg) in
    k prim_7_0'0_t1 in
  k lam_8_0'0_t1 in
let %_0'0_g4 = fun x_0'0_arg k ->
  let lam_10_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_9_0'0_t1 = PRIM_ModInt(x_0'0_f1,y_0'0_arg) in
    k prim_9_0'0_t1 in
  k lam_10_0'0_t1 in
let <_0'0_g5 = fun x_0'0_arg k ->
  let lam_12_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_11_0'0_t1 = PRIM_LessInt(x_0'0_f1,y_0'0_arg) in
    k prim_11_0'0_t1 in
  k lam_12_0'0_t1 in
let =_0'0_g6 = fun x_0'0_arg k ->
  let lam_14_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_13_0'0_t1 = PRIM_EqInt(x_0'0_f1,y_0'0_arg) in
    k prim_13_0'0_t1 in
  k lam_14_0'0_t1 in
let ord_0'0_g7 = fun x_0'0_arg k ->
  let prim_17_0'0_t1 = PRIM_CharOrd(x_0'0_arg) in
  k prim_17_0'0_t1 in
let chr_0'0_g8 = fun x_0'0_arg k ->
  let prim_18_0'0_t1 = PRIM_CharChr(x_0'0_arg) in
  k prim_18_0'0_t1 in
let explode_0'0_g9 = fun x_0'0_arg k ->
  let prim_19_0'0_t1 = PRIM_Explode(x_0'0_arg) in
  k prim_19_0'0_t1 in
let put_char_0'0_g10 = fun x_0'0_arg k ->
  let prim_20_0'0_t1 = PRIM_PutChar(x_0'0_arg) in
  k prim_20_0'0_t1 in
let ::_0'0_g11 = fun x_0'0_arg k ->
  let lam_23_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let con_22_0'0_t1 = Cons1[x_0'0_f1,y_0'0_arg] in
    k con_22_0'0_t1 in
  k lam_23_0'0_t1 in
let lit_24_3'17_g12 = '0' in
let lit_29_6'11_g13 = 0 in
let lit_36_7'29_g14 = 10 in
let lit_39_7'44_g15 = 10 in
let lit_43_9'9_g16 = 0 in
let lit_44_9'17_g17 = '0' in
let chars_of_int_2'4_g18 = fun i_2'17_arg k ->
  let k = [i_2'17_arg], fun [i_2'17_f1] ord0_3'6_arg ->
    let char_of_digit_4'6_t1 = [ord0_3'6_arg], fun [ord0_3'6_f1] c_4'20_arg k ->
      let k = [], fun [] app_25_4'36_arg -> chr_0'0_g8 app_25_4'36_arg k in
      let k = [c_4'20_arg], fun [c_4'20_f1] app_26_4'34_arg -> app_26_4'34_arg c_4'20_f1 k in
      +_0'0_g1 ord0_3'6_f1 k in
    let loop_5'10_t2 = [char_of_digit_4'6_t1], fun [char_of_digit_4'6_f1] loop_5'10_me acc_5'15_arg k ->
      let lam_40_5'19_t1 = [char_of_digit_4'6_f1,loop_5'10_me,acc_5'15_arg], fun [char_of_digit_4'6_f1,loop_5'10_f2,acc_5'15_f3] i_5'19_arg k ->
        let k = [char_of_digit_4'6_f1,loop_5'10_f2,acc_5'15_f3,i_5'19_arg], fun [char_of_digit_4'6_f1,loop_5'10_f2,acc_5'15_f3,i_5'19_f4] app_27_6'11_arg ->
          match app_27_6'11_arg with
          | true1 -> k acc_5'15_f3
          | false0 ->
            let k = [i_5'19_f4], fun [i_5'19_f1] app_30_7'11_arg ->
              let k = [app_30_7'11_arg], fun [app_30_7'11_f1] app_37_7'44_arg -> app_30_7'11_f1 app_37_7'44_arg k in
              let k = [], fun [] app_38_7'43_arg -> app_38_7'43_arg lit_39_7'44_g15 k in
              /_0'0_g3 i_5'19_f1 k in
            let k = [loop_5'10_f2], fun [loop_5'10_f1] app_31_7'36_arg -> loop_5'10_f1 app_31_7'36_arg k in
            let k = [acc_5'15_f3], fun [acc_5'15_f1] app_32_7'33_arg -> app_32_7'33_arg acc_5'15_f1 k in
            let k = [], fun [] app_33_7'26_arg -> ::_0'0_g11 app_33_7'26_arg k in
            let k = [char_of_digit_4'6_f1], fun [char_of_digit_4'6_f1] app_34_7'29_arg -> char_of_digit_4'6_f1 app_34_7'29_arg k in
            let k = [], fun [] app_35_7'28_arg -> app_35_7'28_arg lit_36_7'29_g14 k in
            %_0'0_g4 i_5'19_f4 k in
        let k = [], fun [] app_28_6'9_arg -> app_28_6'9_arg lit_29_6'11_g13 k in
        =_0'0_g6 i_5'19_arg k in
      k lam_40_5'19_t1 in
    let k = [i_2'17_f1,loop_5'10_t2], fun [i_2'17_f1,loop_5'10_f2] app_41_9'9_arg ->
      match app_41_9'9_arg with
      | true1 ->
        let con_45_9'20_t1 = Nil0 in
        let con_46_9'17_t2 = Cons1[lit_44_9'17_g17,con_45_9'20_t1] in
        k con_46_9'17_t2
      | false0 ->
        let k = [i_2'17_f1], fun [i_2'17_f1] app_47_9'32_arg -> app_47_9'32_arg i_2'17_f1 k in
        let con_48_9'32_t1 = Nil0 in
        loop_5'10_f2 con_48_9'32_t1 k in
    let k = [], fun [] app_42_9'7_arg -> app_42_9'7_arg lit_43_9'9_g16 k in
    =_0'0_g6 i_2'17_f1 k in
  ord_0'0_g7 lit_24_3'17_g12 k in
let put_chars_11'8_g19 = fun put_chars_11'8_me xs_11'18_arg k ->
  match xs_11'18_arg with
  | Nil0 ->
    let con_49_13'10_t1 = Unit0 in
    k con_49_13'10_t1
  | Cons1(x_14'4_t1,xs_14'7_t2) ->
    let k = [put_chars_11'8_me,xs_14'7_t2], fun [put_chars_11'8_f1,xs_14'7_f2] __14'23_arg -> put_chars_11'8_f1 xs_14'7_f2 k in
    put_char_0'0_g10 x_14'4_t1 k in
let put_string_16'4_g20 = fun s_16'15_arg k ->
  let k = [], fun [] app_50_16'38_arg -> put_chars_11'8_g19 app_50_16'38_arg k in
  explode_0'0_g9 s_16'15_arg k in
let put_int_18'4_g21 = fun i_18'12_arg k ->
  let k = [], fun [] app_51_18'40_arg -> put_chars_11'8_g19 app_51_18'40_arg k in
  chars_of_int_2'4_g18 i_18'12_arg k in
let lit_52_20'26_g22 = '\n' in
let newline_20'4_g23 = fun __20'12_arg k -> put_char_0'0_g10 lit_52_20'26_g22 k in
let lit_55_24'9_g24 = 2 in
let lit_60_24'30_g25 = 1 in
let lit_64_24'42_g26 = 2 in
let fib_22'8_g27 = fun fib_22'8_me n_22'12_arg k ->
  let k = [fib_22'8_me,n_22'12_arg], fun [fib_22'8_f1,n_22'12_f2] app_53_24'9_arg ->
    match app_53_24'9_arg with
    | true1 -> k n_22'12_f2
    | false0 ->
      let k = [fib_22'8_f1,n_22'12_f2], fun [fib_22'8_f1,n_22'12_f2] app_56_24'33_arg ->
        let k = [app_56_24'33_arg], fun [app_56_24'33_f1] app_61_24'39_arg -> app_56_24'33_f1 app_61_24'39_arg k in
        let k = [fib_22'8_f1], fun [fib_22'8_f1] app_62_24'42_arg -> fib_22'8_f1 app_62_24'42_arg k in
        let k = [], fun [] app_63_24'41_arg -> app_63_24'41_arg lit_64_24'42_g26 k in
        -_0'0_g2 n_22'12_f2 k in
      let k = [], fun [] app_57_24'27_arg -> +_0'0_g1 app_57_24'27_arg k in
      let k = [fib_22'8_f1], fun [fib_22'8_f1] app_58_24'30_arg -> fib_22'8_f1 app_58_24'30_arg k in
      let k = [], fun [] app_59_24'29_arg -> app_59_24'29_arg lit_60_24'30_g25 k in
      -_0'0_g2 n_22'12_f2 k in
  let k = [], fun [] app_54_24'7_arg -> app_54_24'7_arg lit_55_24'9_g24 k in
  <_0'0_g5 n_22'12_arg k in
let lit_65_28'13_g28 = "fib " in
let lit_66_30'13_g29 = " --> " in
let runfib_26'4_g30 = fun n_26'11_arg k ->
  let k = [n_26'11_arg], fun [n_26'11_f1] res_27'6_arg ->
    let k = [n_26'11_f1,res_27'6_arg], fun [n_26'11_f1,res_27'6_f2] __28'19_arg ->
      let k = [res_27'6_f2], fun [res_27'6_f1] __29'11_arg ->
        let k = [res_27'6_f1], fun [res_27'6_f1] __30'20_arg ->
          let k = [], fun [] __31'13_arg ->
            let con_67_32'10_t1 = Unit0 in
            newline_20'4_g23 con_67_32'10_t1 k in
          put_int_18'4_g21 res_27'6_f1 k in
        put_string_16'4_g20 lit_66_30'13_g29 k in
      put_int_18'4_g21 n_26'11_f1 k in
    put_string_16'4_g20 lit_65_28'13_g28 k in
  fib_22'8_g27 n_26'11_arg k in
let lit_68_34'21_g31 = 20 in
let main_34'4_g32 = fun __34'9_arg k -> runfib_26'4_g30 lit_68_34'21_g31 k in
let con_69_0'0_t1 = Unit0 in
main_34'4_g32 con_69_0'0_t1 k
