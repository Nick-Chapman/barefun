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
let ( * )_0'0_g3 = fun x_0'0_arg k ->
  let lam_6_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_5_0'0_t1 = PRIM_MulInt(x_0'0_f1,y_0'0_arg) in
    k prim_5_0'0_t1 in
  k lam_6_0'0_t1 in
let /_0'0_g4 = fun x_0'0_arg k ->
  let lam_8_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_7_0'0_t1 = PRIM_DivInt(x_0'0_f1,y_0'0_arg) in
    k prim_7_0'0_t1 in
  k lam_8_0'0_t1 in
let %_0'0_g5 = fun x_0'0_arg k ->
  let lam_10_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_9_0'0_t1 = PRIM_ModInt(x_0'0_f1,y_0'0_arg) in
    k prim_9_0'0_t1 in
  k lam_10_0'0_t1 in
let <_0'0_g6 = fun x_0'0_arg k ->
  let lam_12_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_11_0'0_t1 = PRIM_LessInt(x_0'0_f1,y_0'0_arg) in
    k prim_11_0'0_t1 in
  k lam_12_0'0_t1 in
let =_0'0_g7 = fun x_0'0_arg k ->
  let lam_14_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_13_0'0_t1 = PRIM_EqInt(x_0'0_f1,y_0'0_arg) in
    k prim_13_0'0_t1 in
  k lam_14_0'0_t1 in
let eq_char_0'0_g8 = fun x_0'0_arg k ->
  let lam_16_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let prim_15_0'0_t1 = PRIM_EqChar(x_0'0_f1,y_0'0_arg) in
    k prim_15_0'0_t1 in
  k lam_16_0'0_t1 in
let ord_0'0_g9 = fun x_0'0_arg k ->
  let prim_17_0'0_t1 = PRIM_CharOrd(x_0'0_arg) in
  k prim_17_0'0_t1 in
let chr_0'0_g10 = fun x_0'0_arg k ->
  let prim_18_0'0_t1 = PRIM_CharChr(x_0'0_arg) in
  k prim_18_0'0_t1 in
let explode_0'0_g11 = fun x_0'0_arg k ->
  let prim_19_0'0_t1 = PRIM_Explode(x_0'0_arg) in
  k prim_19_0'0_t1 in
let put_char_0'0_g12 = fun x_0'0_arg k ->
  let prim_20_0'0_t1 = PRIM_PutChar(x_0'0_arg) in
  k prim_20_0'0_t1 in
let get_char_0'0_g13 = fun x_0'0_arg k ->
  let prim_21_0'0_t1 = PRIM_GetChar(x_0'0_arg) in
  k prim_21_0'0_t1 in
let ::_0'0_g14 = fun x_0'0_arg k ->
  let lam_23_0'0_t1 = [x_0'0_arg], fun [x_0'0_f1] y_0'0_arg k ->
    let con_22_0'0_t1 = Cons1[x_0'0_f1,y_0'0_arg] in
    k con_22_0'0_t1 in
  k lam_23_0'0_t1 in
let not_2'4_g15 = fun b_2'8_arg k ->
  match b_2'8_arg with
  | true1 ->
    let con_24_4'12_t1 = false0 in
    k con_24_4'12_t1
  | false0 ->
    let con_25_5'13_t1 = true1 in
    k con_25_5'13_t1 in
let >_7'4_g16 = fun a_7'8_arg k ->
  let lam_27_7'10_t1 = [a_7'8_arg], fun [a_7'8_f1] b_7'10_arg k ->
    let k = [a_7'8_f1], fun [a_7'8_f1] app_26_7'16_arg -> app_26_7'16_arg a_7'8_f1 k in
    <_0'0_g6 b_7'10_arg k in
  k lam_27_7'10_t1 in
let <=_8'4_g17 = fun a_8'9_arg k ->
  let lam_30_8'11_t1 = [a_8'9_arg], fun [a_8'9_f1] b_8'11_arg k ->
    let k = [a_8'9_f1], fun [a_8'9_f1] app_29_8'22_arg ->
      let k = [], fun [] app_28_8'24_arg -> not_2'4_g15 app_28_8'24_arg k in
      app_29_8'22_arg a_8'9_f1 k in
    <_0'0_g6 b_8'11_arg k in
  k lam_30_8'11_t1 in
let >=_9'4_g18 = fun a_9'9_arg k ->
  let lam_33_9'11_t1 = [a_9'9_arg], fun [a_9'9_f1] b_9'11_arg k ->
    let k = [b_9'11_arg], fun [b_9'11_f1] app_32_9'22_arg ->
      let k = [], fun [] app_31_9'24_arg -> not_2'4_g15 app_31_9'24_arg k in
      app_32_9'22_arg b_9'11_f1 k in
    <_0'0_g6 a_9'9_f1 k in
  k lam_33_9'11_t1 in
let backspace_13'6_g19 = 8 in
let lit_38_16'17_g20 = '\n' in
let lit_41_17'13_g21 = 26 in
let lit_42_18'18_g22 = '^' in
let lit_49_18'42_g23 = 'A' in
let lit_50_18'52_g24 = 1 in
let put_char_12'4_g25 = fun c_12'13_arg k ->
  let k = [c_12'13_arg], fun [c_12'13_f1] n_14'6_arg ->
    let k = [c_12'13_f1,n_14'6_arg], fun [c_12'13_f1,n_14'6_f2] app_35_15'7_arg ->
      let k = [c_12'13_f1,n_14'6_f2], fun [c_12'13_f1,n_14'6_f2] app_34_15'9_arg ->
        match app_34_15'9_arg with
        | true1 -> put_char_0'0_g12 c_12'13_f1 k
        | false0 ->
          let k = [c_12'13_f1,n_14'6_f2], fun [c_12'13_f1,n_14'6_f2] app_37_16'15_arg ->
            let k = [c_12'13_f1,n_14'6_f2], fun [c_12'13_f1,n_14'6_f2] app_36_16'17_arg ->
              match app_36_16'17_arg with
              | true1 -> put_char_0'0_g12 c_12'13_f1 k
              | false0 ->
                let k = [c_12'13_f1,n_14'6_f2], fun [c_12'13_f1,n_14'6_f2] app_40_17'11_arg ->
                  let k = [c_12'13_f1,n_14'6_f2], fun [c_12'13_f1,n_14'6_f2] app_39_17'13_arg ->
                    match app_39_17'13_arg with
                    | true1 -> put_char_0'0_g12 c_12'13_f1 k
                    | false0 ->
                      let k = [n_14'6_f2], fun [n_14'6_f1] __18'21_arg ->
                        let k = [n_14'6_f1], fun [n_14'6_f1] app_48_18'42_arg ->
                          let k = [n_14'6_f1], fun [n_14'6_f1] app_47_18'46_arg ->
                            let k = [], fun [] app_46_18'48_arg ->
                              let k = [], fun [] app_45_18'50_arg ->
                                let k = [], fun [] app_44_18'52_arg ->
                                  let k = [], fun [] app_43_18'37_arg -> put_char_0'0_g12 app_43_18'37_arg k in
                                  chr_0'0_g10 app_44_18'52_arg k in
                                app_45_18'50_arg lit_50_18'52_g24 k in
                              -_0'0_g2 app_46_18'48_arg k in
                            app_47_18'46_arg n_14'6_f1 k in
                          +_0'0_g1 app_48_18'42_arg k in
                        ord_0'0_g9 lit_49_18'42_g23 k in
                      put_char_0'0_g12 lit_42_18'18_g22 k in
                  app_40_17'11_arg lit_41_17'13_g21 k in
                >_7'4_g16 n_14'6_f2 k in
            app_37_16'15_arg lit_38_16'17_g20 k in
          eq_char_0'0_g8 c_12'13_f1 k in
      app_35_15'7_arg backspace_13'6_g19 k in
    =_0'0_g7 n_14'6_arg k in
  ord_0'0_g9 c_12'13_arg k in
let lit_51_21'22_g26 = 8 in
let lit_52_24'11_g27 = ' ' in
let erase_char_20'4_g28 = fun __20'15_arg k ->
  let k = [], fun [] backspace_21'6_arg ->
    let k = [backspace_21'6_arg], fun [backspace_21'6_f1] __23'20_arg ->
      let k = [backspace_21'6_f1], fun [backspace_21'6_f1] __24'14_arg -> put_char_12'4_g25 backspace_21'6_f1 k in
      put_char_12'4_g25 lit_52_24'11_g27 k in
    put_char_12'4_g25 backspace_21'6_arg k in
  chr_0'0_g10 lit_51_21'22_g26 k in
let lit_56_30'22_g29 = '0' in
let lit_59_32'10_g30 = 0 in
let lit_62_32'25_g31 = 9 in
let parse_digit_29'4_g32 = fun c_29'16_arg k ->
  let k = [], fun [] app_54_30'14_arg ->
    let k = [], fun [] app_53_30'16_arg ->
      let k = [app_53_30'16_arg], fun [app_53_30'16_f1] app_55_30'22_arg ->
        let k = [], fun [] n_30'6_arg ->
          let k = [n_30'6_arg], fun [n_30'6_f1] app_58_32'7_arg ->
            let k = [n_30'6_f1], fun [n_30'6_f1] app_57_32'10_arg ->
              match app_57_32'10_arg with
              | true1 ->
                let k = [n_30'6_f1], fun [n_30'6_f1] app_61_32'22_arg ->
                  let k = [n_30'6_f1], fun [n_30'6_f1] app_60_32'25_arg ->
                    match app_60_32'25_arg with
                    | true1 ->
                      let con_63_32'32_t1 = Some0[n_30'6_f1] in
                      k con_63_32'32_t1
                    | false0 ->
                      let con_64_32'45_t1 = None1 in
                      k con_64_32'45_t1 in
                  app_61_32'22_arg lit_62_32'25_g31 k in
                <=_8'4_g17 n_30'6_f1 k
              | false0 ->
                let con_65_32'55_t1 = None1 in
                k con_65_32'55_t1 in
            app_58_32'7_arg lit_59_32'10_g30 k in
          >=_9'4_g18 n_30'6_arg k in
        app_53_30'16_f1 app_55_30'22_arg k in
      ord_0'0_g9 lit_56_30'22_g29 k in
    -_0'0_g2 app_54_30'14_arg k in
  ord_0'0_g9 c_29'16_arg k in
let lit_74_41'26_g33 = 10 in
let loop_35'10_g34 = fun loop_35'10_me acc_35'15_arg k ->
  let lam_75_35'19_t1 = [loop_35'10_me,acc_35'15_arg], fun [loop_35'10_f1,acc_35'15_f2] xs_35'19_arg k ->
    match xs_35'19_arg with
    | Nil0 ->
      let con_66_37'12_t1 = Some0[acc_35'15_f2] in
      k con_66_37'12_t1
    | Cons1(x_38'6_t1,xs_38'9_t2) ->
      let k = [loop_35'10_f1,acc_35'15_f2,xs_38'9_t2], fun [loop_35'10_f1,acc_35'15_f2,xs_38'9_f3] app_67_39'26_arg ->
        match app_67_39'26_arg with
        | None1 ->
          let con_68_40'18_t1 = None1 in
          k con_68_40'18_t1
        | Some0(d_41'15_t1) ->
          let k = [loop_35'10_f1,acc_35'15_f2,xs_38'9_f3,d_41'15_t1], fun [loop_35'10_f1,acc_35'15_f2,xs_38'9_f3,d_41'15_f4] app_73_41'29_arg ->
            let k = [loop_35'10_f1,xs_38'9_f3,d_41'15_f4], fun [loop_35'10_f1,xs_38'9_f2,d_41'15_f3] app_72_41'31_arg ->
              let k = [loop_35'10_f1,xs_38'9_f2,d_41'15_f3], fun [loop_35'10_f1,xs_38'9_f2,d_41'15_f3] app_71_41'35_arg ->
                let k = [loop_35'10_f1,xs_38'9_f2], fun [loop_35'10_f1,xs_38'9_f2] app_70_41'37_arg ->
                  let k = [xs_38'9_f2], fun [xs_38'9_f1] app_69_41'25_arg -> app_69_41'25_arg xs_38'9_f1 k in
                  loop_35'10_f1 app_70_41'37_arg k in
                app_71_41'35_arg d_41'15_f3 k in
              +_0'0_g1 app_72_41'31_arg k in
            app_73_41'29_arg acc_35'15_f2 k in
          ( * )_0'0_g3 lit_74_41'26_g33 k in
      parse_digit_29'4_g32 x_38'6_t1 k in
  k lam_75_35'19_t1 in
let lit_77_43'7_g35 = 0 in
let parse_num_34'4_g36 = fun s_34'14_arg k ->
  let k = [s_34'14_arg], fun [s_34'14_f1] app_76_43'7_arg -> app_76_43'7_arg s_34'14_f1 k in
  loop_35'10_g34 lit_77_43'7_g35 k in
let cons_45'4_g37 = fun x_45'9_arg k ->
  let lam_79_45'11_t1 = [x_45'9_arg], fun [x_45'9_f1] xs_45'11_arg k ->
    let k = [xs_45'11_arg], fun [xs_45'11_f1] app_78_45'18_arg -> app_78_45'18_arg xs_45'11_f1 k in
    ::_0'0_g14 x_45'9_f1 k in
  k lam_79_45'11_t1 in
let eq_list_47'8_g38 = fun eq_list_47'8_me eq_47'16_arg k ->
  let lam_89_47'19_t1 = [eq_list_47'8_me,eq_47'16_arg], fun [eq_list_47'8_f1,eq_47'16_f2] xs_47'19_arg k ->
    let lam_88_47'22_t1 = [eq_list_47'8_f1,eq_47'16_f2,xs_47'19_arg], fun [eq_list_47'8_f1,eq_47'16_f2,xs_47'19_f3] ys_47'22_arg k ->
      match xs_47'19_f3 with
      | Nil0 ->
        match ys_47'22_arg with
        | Nil0 ->
          let con_80_49'33_t1 = true1 in
          k con_80_49'33_t1
        | Cons1(__49'40_t1,__49'43_t2) ->
          let con_81_49'48_t3 = false0 in
          k con_81_49'48_t3
      | Cons1(x_50'4_t1,xs_50'7_t2) ->
        match ys_47'22_arg with
        | Nil0 ->
          let con_82_52'13_t3 = false0 in
          k con_82_52'13_t3
        | Cons1(y_53'7_t3,ys_53'10_t4) ->
          let k = [eq_list_47'8_f1,eq_47'16_f2,xs_50'7_t2,y_53'7_t3,ys_53'10_t4], fun [eq_list_47'8_f1,eq_47'16_f2,xs_50'7_f3,y_53'7_f4,ys_53'10_f5] app_84_54'14_arg ->
            let k = [eq_list_47'8_f1,eq_47'16_f2,xs_50'7_f3,ys_53'10_f5], fun [eq_list_47'8_f1,eq_47'16_f2,xs_50'7_f3,ys_53'10_f4] app_83_54'16_arg ->
              match app_83_54'16_arg with
              | true1 ->
                let k = [xs_50'7_f3,ys_53'10_f4], fun [xs_50'7_f1,ys_53'10_f2] app_86_54'31_arg ->
                  let k = [ys_53'10_f2], fun [ys_53'10_f1] app_85_54'34_arg -> app_85_54'34_arg ys_53'10_f1 k in
                  app_86_54'31_arg xs_50'7_f1 k in
                eq_list_47'8_f1 eq_47'16_f2 k
              | false0 ->
                let con_87_54'45_t1 = false0 in
                k con_87_54'45_t1 in
            app_84_54'14_arg y_53'7_f4 k in
          eq_47'16_f2 x_50'4_t1 k in
    k lam_88_47'22_t1 in
  k lam_89_47'19_t1 in
let eq_char_list_56'4_g39 = fun a_56'17_arg k ->
  let lam_92_56'19_t1 = [a_56'17_arg], fun [a_56'17_f1] b_56'19_arg k ->
    let k = [a_56'17_f1,b_56'19_arg], fun [a_56'17_f1,b_56'19_f2] app_91_56'31_arg ->
      let k = [b_56'19_f2], fun [b_56'19_f1] app_90_56'39_arg -> app_90_56'39_arg b_56'19_f1 k in
      app_91_56'31_arg a_56'17_f1 k in
    eq_list_47'8_g38 eq_char_0'0_g8 k in
  k lam_92_56'19_t1 in
let append_58'8_g40 = fun append_58'8_me xs_58'15_arg k ->
  let lam_96_58'18_t1 = [append_58'8_me,xs_58'15_arg], fun [append_58'8_f1,xs_58'15_f2] ys_58'18_arg k ->
    match xs_58'15_f2 with
    | Nil0 -> k ys_58'18_arg
    | Cons1(x_61'4_t1,xs_61'7_t2) ->
      let k = [append_58'8_f1,ys_58'18_arg,xs_61'7_t2], fun [append_58'8_f1,ys_58'18_f2,xs_61'7_f3] app_93_61'18_arg ->
        let k = [ys_58'18_f2,app_93_61'18_arg], fun [ys_58'18_f1,app_93_61'18_f2] app_95_61'28_arg ->
          let k = [app_93_61'18_f2], fun [app_93_61'18_f1] app_94_61'31_arg -> app_93_61'18_f1 app_94_61'31_arg k in
          app_95_61'28_arg ys_58'18_f1 k in
        append_58'8_f1 xs_61'7_f3 k in
      cons_45'4_g37 x_61'4_t1 k in
  k lam_96_58'18_t1 in
let loop_64'10_g41 = fun loop_64'10_me acc_64'15_arg k ->
  let lam_100_64'19_t1 = [loop_64'10_me,acc_64'15_arg], fun [loop_64'10_f1,acc_64'15_f2] xs_64'19_arg k ->
    match xs_64'19_arg with
    | Nil0 -> k acc_64'15_f2
    | Cons1(x_67'6_t1,xs_67'9_t2) ->
      let k = [loop_64'10_f1,acc_64'15_f2,xs_67'9_t2], fun [loop_64'10_f1,acc_64'15_f2,xs_67'9_f3] app_99_67'26_arg ->
        let k = [loop_64'10_f1,xs_67'9_f3], fun [loop_64'10_f1,xs_67'9_f2] app_98_67'28_arg ->
          let k = [xs_67'9_f2], fun [xs_67'9_f1] app_97_67'20_arg -> app_97_67'20_arg xs_67'9_f1 k in
          loop_64'10_f1 app_98_67'28_arg k in
        app_99_67'26_arg acc_64'15_f2 k in
      cons_45'4_g37 x_67'6_t1 k in
  k lam_100_64'19_t1 in
let reverse_63'4_g42 = fun xs_63'12_arg k ->
  let con_102_69'7_t1 = Nil0 in
  let k = [xs_63'12_arg], fun [xs_63'12_f1] app_101_69'7_arg -> app_101_69'7_arg xs_63'12_f1 k in
  loop_64'10_g41 con_102_69'7_t1 k in
let map_71'8_g43 = fun map_71'8_me f_71'12_arg k ->
  let lam_108_71'14_t1 = [map_71'8_me,f_71'12_arg], fun [map_71'8_f1,f_71'12_f2] xs_71'14_arg k ->
    match xs_71'14_arg with
    | Nil0 ->
      let con_103_73'10_t1 = Nil0 in
      k con_103_73'10_t1
    | Cons1(x_74'4_t1,xs_74'7_t2) ->
      let k = [map_71'8_f1,f_71'12_f2,xs_74'7_t2], fun [map_71'8_f1,f_71'12_f2,xs_74'7_f3] app_105_74'15_arg ->
        let k = [map_71'8_f1,f_71'12_f2,xs_74'7_f3], fun [map_71'8_f1,f_71'12_f2,xs_74'7_f3] app_104_74'17_arg ->
          let k = [xs_74'7_f3,app_104_74'17_arg], fun [xs_74'7_f1,app_104_74'17_f2] app_107_74'24_arg ->
            let k = [app_104_74'17_f2], fun [app_104_74'17_f1] app_106_74'26_arg -> app_104_74'17_f1 app_106_74'26_arg k in
            app_107_74'24_arg xs_74'7_f1 k in
          map_71'8_f1 f_71'12_f2 k in
        ::_0'0_g14 app_105_74'15_arg k in
      f_71'12_f2 x_74'4_t1 k in
  k lam_108_71'14_t1 in
let lit_109_78'10_g44 = 0 in
let lit_111_79'17_g45 = 1 in
let length_76'8_g46 = fun length_76'8_me xs_76'15_arg k ->
  match xs_76'15_arg with
  | Nil0 -> k lit_109_78'10_g44
  | Cons1(__79'4_t1,xs_79'7_t2) ->
    let k = [length_76'8_me,xs_79'7_t2], fun [length_76'8_f1,xs_79'7_f2] app_110_79'17_arg ->
      let k = [app_110_79'17_arg], fun [app_110_79'17_f1] app_112_79'27_arg -> app_110_79'17_f1 app_112_79'27_arg k in
      length_76'8_f1 xs_79'7_f2 k in
    +_0'0_g1 lit_111_79'17_g45 k in
let lit_113_82'17_g47 = '0' in
let lit_118_85'11_g48 = 0 in
let lit_125_86'35_g49 = 10 in
let lit_128_86'48_g50 = 10 in
let lit_132_88'9_g51 = 0 in
let lit_134_88'21_g52 = '0' in
let chars_of_int_81'4_g53 = fun i_81'17_arg k ->
  let k = [i_81'17_arg], fun [i_81'17_f1] ord0_82'6_arg ->
    let char_of_digit_83'6_t1 = [ord0_82'6_arg], fun [ord0_82'6_f1] c_83'20_arg k ->
      let k = [c_83'20_arg], fun [c_83'20_f1] app_115_83'34_arg ->
        let k = [], fun [] app_114_83'36_arg -> chr_0'0_g10 app_114_83'36_arg k in
        app_115_83'34_arg c_83'20_f1 k in
      +_0'0_g1 ord0_82'6_f1 k in
    let loop_84'10_t2 = [char_of_digit_83'6_t1], fun [char_of_digit_83'6_f1] loop_84'10_me acc_84'15_arg k ->
      let lam_129_84'19_t1 = [char_of_digit_83'6_f1,loop_84'10_me,acc_84'15_arg], fun [char_of_digit_83'6_f1,loop_84'10_f2,acc_84'15_f3] i_84'19_arg k ->
        let k = [char_of_digit_83'6_f1,loop_84'10_f2,acc_84'15_f3,i_84'19_arg], fun [char_of_digit_83'6_f1,loop_84'10_f2,acc_84'15_f3,i_84'19_f4] app_117_85'9_arg ->
          let k = [char_of_digit_83'6_f1,loop_84'10_f2,acc_84'15_f3,i_84'19_f4], fun [char_of_digit_83'6_f1,loop_84'10_f2,acc_84'15_f3,i_84'19_f4] app_116_85'11_arg ->
            match app_116_85'11_arg with
            | true1 -> k acc_84'15_f3
            | false0 ->
              let k = [char_of_digit_83'6_f1,loop_84'10_f2,acc_84'15_f3,i_84'19_f4], fun [char_of_digit_83'6_f1,loop_84'10_f2,acc_84'15_f3,i_84'19_f4] app_124_86'34_arg ->
                let k = [char_of_digit_83'6_f1,loop_84'10_f2,acc_84'15_f3,i_84'19_f4], fun [char_of_digit_83'6_f1,loop_84'10_f2,acc_84'15_f3,i_84'19_f4] app_123_86'35_arg ->
                  let k = [loop_84'10_f2,acc_84'15_f3,i_84'19_f4], fun [loop_84'10_f1,acc_84'15_f2,i_84'19_f3] app_122_86'32_arg ->
                    let k = [loop_84'10_f1,acc_84'15_f2,i_84'19_f3], fun [loop_84'10_f1,acc_84'15_f2,i_84'19_f3] app_121_86'17_arg ->
                      let k = [loop_84'10_f1,i_84'19_f3], fun [loop_84'10_f1,i_84'19_f2] app_120_86'40_arg ->
                        let k = [i_84'19_f2], fun [i_84'19_f1] app_119_86'11_arg ->
                          let k = [app_119_86'11_arg], fun [app_119_86'11_f1] app_127_86'47_arg ->
                            let k = [app_119_86'11_f1], fun [app_119_86'11_f1] app_126_86'48_arg -> app_119_86'11_f1 app_126_86'48_arg k in
                            app_127_86'47_arg lit_128_86'48_g50 k in
                          /_0'0_g4 i_84'19_f1 k in
                        loop_84'10_f1 app_120_86'40_arg k in
                      app_121_86'17_arg acc_84'15_f2 k in
                    cons_45'4_g37 app_122_86'32_arg k in
                  char_of_digit_83'6_f1 app_123_86'35_arg k in
                app_124_86'34_arg lit_125_86'35_g49 k in
              %_0'0_g5 i_84'19_f4 k in
          app_117_85'9_arg lit_118_85'11_g48 k in
        =_0'0_g7 i_84'19_arg k in
      k lam_129_84'19_t1 in
    let k = [i_81'17_f1,loop_84'10_t2], fun [i_81'17_f1,loop_84'10_f2] app_131_88'7_arg ->
      let k = [i_81'17_f1,loop_84'10_f2], fun [i_81'17_f1,loop_84'10_f2] app_130_88'9_arg ->
        match app_130_88'9_arg with
        | true1 ->
          let k = [], fun [] app_133_88'21_arg ->
            let con_135_88'25_t1 = Nil0 in
            app_133_88'21_arg con_135_88'25_t1 k in
          cons_45'4_g37 lit_134_88'21_g52 k
        | false0 ->
          let con_137_88'38_t1 = Nil0 in
          let k = [i_81'17_f1], fun [i_81'17_f1] app_136_88'38_arg -> app_136_88'38_arg i_81'17_f1 k in
          loop_84'10_f2 con_137_88'38_t1 k in
      app_131_88'7_arg lit_132_88'9_g51 k in
    =_0'0_g7 i_81'17_f1 k in
  ord_0'0_g9 lit_113_82'17_g47 k in
let put_chars_90'8_g54 = fun put_chars_90'8_me xs_90'18_arg k ->
  match xs_90'18_arg with
  | Nil0 ->
    let con_138_92'10_t1 = Unit0 in
    k con_138_92'10_t1
  | Cons1(x_93'4_t1,xs_93'7_t2) ->
    let k = [put_chars_90'8_me,xs_93'7_t2], fun [put_chars_90'8_f1,xs_93'7_f2] __93'23_arg -> put_chars_90'8_f1 xs_93'7_f2 k in
    put_char_12'4_g25 x_93'4_t1 k in
let put_string_95'4_g55 = fun s_95'15_arg k ->
  let k = [], fun [] app_139_95'38_arg -> put_chars_90'8_g54 app_139_95'38_arg k in
  explode_0'0_g11 s_95'15_arg k in
let put_int_97'4_g56 = fun i_97'12_arg k ->
  let k = [], fun [] app_140_97'40_arg -> put_chars_90'8_g54 app_140_97'40_arg k in
  chars_of_int_81'4_g53 i_97'12_arg k in
let lit_141_99'26_g57 = '\n' in
let newline_99'4_g58 = fun __99'12_arg k -> put_char_12'4_g25 lit_141_99'26_g57 k in
let lit_142_102'21_g59 = 4 in
let lit_146_106'17_g60 = '\n' in
let lit_155_108'15_g61 = 127 in
let lit_158_109'17_g62 = 127 in
let lit_162_113'28_g63 = 26 in
let read_line_101'4_g64 = fun __101'14_arg k ->
  let k = [], fun [] controlD_102'6_arg ->
    let loop_103'10_t1 = [controlD_102'6_arg], fun [controlD_102'6_f1] loop_103'10_me acc_103'15_arg k ->
      let con_143_104'21_t1 = Unit0 in
      let k = [controlD_102'6_f1,loop_103'10_me,acc_103'15_arg], fun [controlD_102'6_f1,loop_103'10_f2,acc_103'15_f3] c_104'8_arg ->
        let k = [controlD_102'6_f1,loop_103'10_f2,acc_103'15_f3,c_104'8_arg], fun [controlD_102'6_f1,loop_103'10_f2,acc_103'15_f3,c_104'8_f4] n_105'8_arg ->
          let k = [controlD_102'6_f1,loop_103'10_f2,acc_103'15_f3,c_104'8_f4,n_105'8_arg], fun [controlD_102'6_f1,loop_103'10_f2,acc_103'15_f3,c_104'8_f4,n_105'8_f5] app_145_106'15_arg ->
            let k = [controlD_102'6_f1,loop_103'10_f2,acc_103'15_f3,c_104'8_f4,n_105'8_f5], fun [controlD_102'6_f1,loop_103'10_f2,acc_103'15_f3,c_104'8_f4,n_105'8_f5] app_144_106'17_arg ->
              match app_144_106'17_arg with
              | true1 ->
                let con_147_106'35_t1 = Unit0 in
                let k = [acc_103'15_f3], fun [acc_103'15_f1] __106'37_arg -> reverse_63'4_g42 acc_103'15_f1 k in
                newline_99'4_g58 con_147_106'35_t1 k
              | false0 ->
                let k = [controlD_102'6_f1,loop_103'10_f2,acc_103'15_f3,c_104'8_f4,n_105'8_f5], fun [controlD_102'6_f1,loop_103'10_f2,acc_103'15_f3,c_104'8_f4,n_105'8_f5] app_149_107'17_arg ->
                  let k = [controlD_102'6_f1,loop_103'10_f2,acc_103'15_f3,c_104'8_f4,n_105'8_f5], fun [controlD_102'6_f1,loop_103'10_f2,acc_103'15_f3,c_104'8_f4,n_105'8_f5] app_148_107'19_arg ->
                    match app_148_107'19_arg with
                    | true1 ->
                      let k = [controlD_102'6_f1,acc_103'15_f3], fun [controlD_102'6_f1,acc_103'15_f2] __107'44_arg ->
                        let con_150_107'53_t1 = Unit0 in
                        let k = [controlD_102'6_f1,acc_103'15_f2], fun [controlD_102'6_f1,acc_103'15_f2] __107'55_arg ->
                          let k = [acc_103'15_f2], fun [acc_103'15_f1] app_152_107'75_arg ->
                            let k = [], fun [] app_151_107'78_arg -> reverse_63'4_g42 app_151_107'78_arg k in
                            app_152_107'75_arg acc_103'15_f1 k in
                          ::_0'0_g14 controlD_102'6_f1 k in
                        newline_99'4_g58 con_150_107'53_t1 k in
                      put_char_12'4_g25 c_104'8_f4 k
                    | false0 ->
                      let k = [loop_103'10_f2,acc_103'15_f3,c_104'8_f4,n_105'8_f5], fun [loop_103'10_f1,acc_103'15_f2,c_104'8_f3,n_105'8_f4] app_154_108'13_arg ->
                        let k = [loop_103'10_f1,acc_103'15_f2,c_104'8_f3,n_105'8_f4], fun [loop_103'10_f1,acc_103'15_f2,c_104'8_f3,n_105'8_f4] app_153_108'15_arg ->
                          match app_153_108'15_arg with
                          | true1 -> loop_103'10_f1 acc_103'15_f2 k
                          | false0 ->
                            let k = [loop_103'10_f1,acc_103'15_f2,c_104'8_f3], fun [loop_103'10_f1,acc_103'15_f2,c_104'8_f3] app_157_109'15_arg ->
                              let k = [loop_103'10_f1,acc_103'15_f2,c_104'8_f3], fun [loop_103'10_f1,acc_103'15_f2,c_104'8_f3] app_156_109'17_arg ->
                                match app_156_109'17_arg with
                                | true1 ->
                                  match acc_103'15_f2 with
                                  | Nil0 -> loop_103'10_f1 acc_103'15_f2 k
                                  | Cons1(c_112'14_t1,tail_112'17_t2) ->
                                    let k = [loop_103'10_f1,tail_112'17_t2], fun [loop_103'10_f1,tail_112'17_f2] app_161_113'23_arg ->
                                      let k = [loop_103'10_f1,tail_112'17_f2], fun [loop_103'10_f1,tail_112'17_f2] app_160_113'25_arg ->
                                        let k = [loop_103'10_f1,tail_112'17_f2], fun [loop_103'10_f1,tail_112'17_f2] app_159_113'28_arg ->
                                          let k = [loop_103'10_f1,tail_112'17_f2], fun [loop_103'10_f1,tail_112'17_f2] __113'58_arg ->
                                            let con_165_114'25_t1 = Unit0 in
                                            let k = [loop_103'10_f1,tail_112'17_f2], fun [loop_103'10_f1,tail_112'17_f2] __114'27_arg -> loop_103'10_f1 tail_112'17_f2 k in
                                            erase_char_20'4_g28 con_165_114'25_t1 k in
                                          match app_159_113'28_arg with
                                          | true1 ->
                                            let con_163_113'47_t1 = Unit0 in
                                            erase_char_20'4_g28 con_163_113'47_t1 k
                                          | false0 ->
                                            let con_164_113'55_t1 = Unit0 in
                                            k con_164_113'55_t1 in
                                        app_160_113'25_arg lit_162_113'28_g63 k in
                                      <=_8'4_g17 app_161_113'23_arg k in
                                    ord_0'0_g9 c_112'14_t1 k
                                | false0 ->
                                  let k = [loop_103'10_f1,acc_103'15_f2,c_104'8_f3], fun [loop_103'10_f1,acc_103'15_f2,c_104'8_f3] __117'23_arg ->
                                    let k = [loop_103'10_f1,acc_103'15_f2], fun [loop_103'10_f1,acc_103'15_f2] app_167_117'36_arg ->
                                      let k = [loop_103'10_f1], fun [loop_103'10_f1] app_166_117'38_arg -> loop_103'10_f1 app_166_117'38_arg k in
                                      app_167_117'36_arg acc_103'15_f2 k in
                                    cons_45'4_g37 c_104'8_f3 k in
                                  put_char_12'4_g25 c_104'8_f3 k in
                              app_157_109'15_arg lit_158_109'17_g62 k in
                            =_0'0_g7 n_105'8_f4 k in
                        app_154_108'13_arg lit_155_108'15_g61 k in
                      >_7'4_g16 n_105'8_f5 k in
                  app_149_107'17_arg controlD_102'6_f1 k in
                eq_char_0'0_g8 c_104'8_f4 k in
            app_145_106'15_arg lit_146_106'17_g60 k in
          eq_char_0'0_g8 c_104'8_f4 k in
        ord_0'0_g9 c_104'8_arg k in
      get_char_0'0_g13 con_143_104'21_t1 k in
    let con_168_119'7_t2 = Nil0 in
    loop_103'10_t1 con_168_119'7_t2 k in
  chr_0'0_g10 lit_142_102'21_g59 k in
let lit_171_123'9_g65 = 2 in
let lit_176_123'30_g66 = 1 in
let lit_180_123'42_g67 = 2 in
let fib_121'8_g68 = fun fib_121'8_me n_121'12_arg k ->
  let k = [fib_121'8_me,n_121'12_arg], fun [fib_121'8_f1,n_121'12_f2] app_170_123'7_arg ->
    let k = [fib_121'8_f1,n_121'12_f2], fun [fib_121'8_f1,n_121'12_f2] app_169_123'9_arg ->
      match app_169_123'9_arg with
      | true1 -> k n_121'12_f2
      | false0 ->
        let k = [fib_121'8_f1,n_121'12_f2], fun [fib_121'8_f1,n_121'12_f2] app_175_123'29_arg ->
          let k = [fib_121'8_f1,n_121'12_f2], fun [fib_121'8_f1,n_121'12_f2] app_174_123'30_arg ->
            let k = [fib_121'8_f1,n_121'12_f2], fun [fib_121'8_f1,n_121'12_f2] app_173_123'27_arg ->
              let k = [fib_121'8_f1,n_121'12_f2], fun [fib_121'8_f1,n_121'12_f2] app_172_123'33_arg ->
                let k = [fib_121'8_f1,app_172_123'33_arg], fun [fib_121'8_f1,app_172_123'33_f2] app_179_123'41_arg ->
                  let k = [fib_121'8_f1,app_172_123'33_f2], fun [fib_121'8_f1,app_172_123'33_f2] app_178_123'42_arg ->
                    let k = [app_172_123'33_f2], fun [app_172_123'33_f1] app_177_123'39_arg -> app_172_123'33_f1 app_177_123'39_arg k in
                    fib_121'8_f1 app_178_123'42_arg k in
                  app_179_123'41_arg lit_180_123'42_g67 k in
                -_0'0_g2 n_121'12_f2 k in
              +_0'0_g1 app_173_123'27_arg k in
            fib_121'8_f1 app_174_123'30_arg k in
          app_175_123'29_arg lit_176_123'30_g66 k in
        -_0'0_g2 n_121'12_f2 k in
    app_170_123'7_arg lit_171_123'9_g65 k in
  <_0'0_g6 n_121'12_arg k in
let lit_183_127'10_g69 = 2 in
let lit_188_127'25_g70 = 1 in
let lit_189_127'37_g71 = 1 in
let fact_125'8_g72 = fun fact_125'8_me n_125'13_arg k ->
  let k = [fact_125'8_me,n_125'13_arg], fun [fact_125'8_f1,n_125'13_f2] app_182_127'7_arg ->
    let k = [fact_125'8_f1,n_125'13_f2], fun [fact_125'8_f1,n_125'13_f2] app_181_127'10_arg ->
      match app_181_127'10_arg with
      | true1 ->
        let k = [fact_125'8_f1,n_125'13_f2], fun [fact_125'8_f1,n_125'13_f2] app_187_127'24_arg ->
          let k = [fact_125'8_f1,n_125'13_f2], fun [fact_125'8_f1,n_125'13_f2] app_186_127'25_arg ->
            let k = [n_125'13_f2], fun [n_125'13_f1] app_185_127'22_arg ->
              let k = [n_125'13_f1], fun [n_125'13_f1] app_184_127'28_arg -> app_184_127'28_arg n_125'13_f1 k in
              ( * )_0'0_g3 app_185_127'22_arg k in
            fact_125'8_f1 app_186_127'25_arg k in
          app_187_127'24_arg lit_188_127'25_g70 k in
        -_0'0_g2 n_125'13_f2 k
      | false0 -> k lit_189_127'37_g71 in
    app_182_127'7_arg lit_183_127'10_g69 k in
  >=_9'4_g18 n_125'13_arg k in
let lit_190_129'25_g73 = "ERROR: " in
let error_129'4_g74 = fun s_129'10_arg k ->
  let k = [s_129'10_arg], fun [s_129'10_f1] __129'34_arg ->
    let k = [], fun [] __129'48_arg ->
      let con_191_129'58_t1 = Unit0 in
      newline_99'4_g58 con_191_129'58_t1 k in
    put_string_95'4_g55 s_129'10_f1 k in
  put_string_95'4_g55 lit_190_129'25_g73 k in
let lit_192_132'13_g75 = "fib: " in
let lit_193_134'16_g76 = "expected an argument" in
let lit_194_137'21_g77 = "expected exactly one argument" in
let lit_196_140'24_g78 = "expected arg1 to be numeric" in
let lit_197_144'22_g79 = " --> " in
let runfib_131'4_g80 = fun args_131'11_arg k ->
  let k = [args_131'11_arg], fun [args_131'11_f1] __132'20_arg ->
    match args_131'11_f1 with
    | Nil0 -> error_129'4_g74 lit_193_134'16_g76 k
    | Cons1(arg1_135'4_t1,more_135'10_t2) ->
      match more_135'10_t2 with
      | Cons1(__137'7_t3,__137'10_t4) -> error_129'4_g74 lit_194_137'21_g77 k
      | Nil0 ->
        let k = [], fun [] app_195_139'24_arg ->
          match app_195_139'24_arg with
          | None1 -> error_129'4_g74 lit_196_140'24_g78 k
          | Some0(n_141'15_t1) ->
            let k = [n_141'15_t1], fun [n_141'15_f1] res_142'15_arg ->
              let k = [res_142'15_arg], fun [res_142'15_f1] __143'20_arg ->
                let k = [res_142'15_f1], fun [res_142'15_f1] __144'29_arg ->
                  let k = [], fun [] __145'22_arg ->
                    let con_198_146'19_t1 = Unit0 in
                    newline_99'4_g58 con_198_146'19_t1 k in
                  put_int_97'4_g56 res_142'15_f1 k in
                put_string_95'4_g55 lit_197_144'22_g79 k in
              put_int_97'4_g56 n_141'15_f1 k in
            fib_121'8_g68 n_141'15_t1 k in
        parse_num_34'4_g36 arg1_135'4_t1 k in
  put_string_95'4_g55 lit_192_132'13_g75 k in
let lit_199_149'13_g81 = "fact: " in
let lit_200_151'16_g82 = "expected an argument" in
let lit_201_154'21_g83 = "expected exactly one argument" in
let lit_203_157'24_g84 = "expected arg1 to be numeric" in
let lit_204_161'22_g85 = " --> " in
let runfact_148'4_g86 = fun args_148'12_arg k ->
  let k = [args_148'12_arg], fun [args_148'12_f1] __149'21_arg ->
    match args_148'12_f1 with
    | Nil0 -> error_129'4_g74 lit_200_151'16_g82 k
    | Cons1(arg1_152'4_t1,more_152'10_t2) ->
      match more_152'10_t2 with
      | Cons1(__154'7_t3,__154'10_t4) -> error_129'4_g74 lit_201_154'21_g83 k
      | Nil0 ->
        let k = [], fun [] app_202_156'24_arg ->
          match app_202_156'24_arg with
          | None1 -> error_129'4_g74 lit_203_157'24_g84 k
          | Some0(n_158'15_t1) ->
            let k = [n_158'15_t1], fun [n_158'15_f1] res_159'15_arg ->
              let k = [res_159'15_arg], fun [res_159'15_f1] __160'20_arg ->
                let k = [res_159'15_f1], fun [res_159'15_f1] __161'29_arg ->
                  let k = [], fun [] __162'22_arg ->
                    let con_205_163'19_t1 = Unit0 in
                    newline_99'4_g58 con_205_163'19_t1 k in
                  put_int_97'4_g56 res_159'15_f1 k in
                put_string_95'4_g55 lit_204_161'22_g85 k in
              put_int_97'4_g56 n_158'15_f1 k in
            fact_125'8_g72 n_158'15_t1 k in
        parse_num_34'4_g36 arg1_152'4_t1 k in
  put_string_95'4_g55 lit_199_149'13_g81 k in
let lit_208_166'26_g87 = 4 in
let lit_218_178'18_g88 = "rev: expected no arguments" in
let lit_219_180'16_g89 = "(reverse typed lines until ^D)\n" in
let lit_224_184'48_g90 = 'o' in
let lit_225_184'57_g91 = '*' in
let lam_221_184'30_g92 = fun c_184'30_arg k ->
  let k = [c_184'30_arg], fun [c_184'30_f1] app_223_184'46_arg ->
    let k = [c_184'30_f1], fun [c_184'30_f1] app_222_184'48_arg ->
      match app_222_184'48_arg with
      | true1 -> k lit_225_184'57_g91
      | false0 -> k c_184'30_f1 in
    app_223_184'46_arg lit_224_184'48_g90 k in
  eq_char_0'0_g8 c_184'30_arg k in
let lit_229_186'29_g93 = "You wrote: \"" in
let lit_231_187'13_g94 = "\" (" in
let lit_232_189'13_g95 = " chars)" in
let fallback_183'4_g96 = fun line_183'13_arg k ->
  let k = [line_183'13_arg], fun [line_183'13_f1] star_the_ohs_184'6_arg ->
    let k = [line_183'13_f1,star_the_ohs_184'6_arg], fun [line_183'13_f1,star_the_ohs_184'6_f2] n_185'6_arg ->
      let k = [line_183'13_f1,star_the_ohs_184'6_f2,n_185'6_arg], fun [line_183'13_f1,star_the_ohs_184'6_f2,n_185'6_f3] app_228_186'29_arg ->
        let k = [line_183'13_f1,star_the_ohs_184'6_f2,n_185'6_f3], fun [line_183'13_f1,star_the_ohs_184'6_f2,n_185'6_f3] app_227_186'20_arg ->
          let k = [n_185'6_f3,app_227_186'20_arg], fun [n_185'6_f1,app_227_186'20_f2] app_230_186'60_arg ->
            let k = [n_185'6_f1], fun [n_185'6_f1] app_226_186'46_arg ->
              let k = [n_185'6_f1], fun [n_185'6_f1] __186'66_arg ->
                let k = [n_185'6_f1], fun [n_185'6_f1] __187'19_arg ->
                  let k = [], fun [] __188'11_arg ->
                    let k = [], fun [] __189'22_arg ->
                      let con_233_190'10_t1 = Unit0 in
                      newline_99'4_g58 con_233_190'10_t1 k in
                    put_string_95'4_g55 lit_232_189'13_g95 k in
                  put_int_97'4_g56 n_185'6_f1 k in
                put_string_95'4_g55 lit_231_187'13_g94 k in
              put_chars_90'8_g54 app_226_186'46_arg k in
            app_227_186'20_f2 app_230_186'60_arg k in
          star_the_ohs_184'6_f2 line_183'13_f1 k in
        append_58'8_g40 app_228_186'29_arg k in
      explode_0'0_g11 lit_229_186'29_g93 k in
    length_76'8_g46 line_183'13_f1 k in
  map_71'8_g43 lam_221_184'30_g92 k in
let lit_239_198'20_g97 = ' ' in
let loop_193'10_g98 = fun loop_193'10_me accWs_193'15_arg k ->
  let lam_251_193'21_t1 = [loop_193'10_me,accWs_193'15_arg], fun [loop_193'10_f1,accWs_193'15_f2] accCs_193'21_arg k ->
    let lam_250_193'27_t1 = [loop_193'10_f1,accWs_193'15_f2,accCs_193'21_arg], fun [loop_193'10_f1,accWs_193'15_f2,accCs_193'21_f3] xs_193'27_arg k ->
      match xs_193'27_arg with
      | Nil0 ->
        let k = [accWs_193'15_f2], fun [accWs_193'15_f1] app_236_195'29_arg ->
          let k = [accWs_193'15_f1], fun [accWs_193'15_f1] app_235_195'35_arg ->
            let k = [], fun [] app_234_195'38_arg -> reverse_63'4_g42 app_234_195'38_arg k in
            app_235_195'35_arg accWs_193'15_f1 k in
          ::_0'0_g14 app_236_195'29_arg k in
        reverse_63'4_g42 accCs_193'21_f3 k
      | Cons1(x_197'6_t1,xs_197'9_t2) ->
        let k = [loop_193'10_f1,accWs_193'15_f2,accCs_193'21_f3,x_197'6_t1,xs_197'9_t2], fun [loop_193'10_f1,accWs_193'15_f2,accCs_193'21_f3,x_197'6_f4,xs_197'9_f5] app_238_198'18_arg ->
          let k = [loop_193'10_f1,accWs_193'15_f2,accCs_193'21_f3,x_197'6_f4,xs_197'9_f5], fun [loop_193'10_f1,accWs_193'15_f2,accCs_193'21_f3,x_197'6_f4,xs_197'9_f5] app_237_198'20_arg ->
            match app_237_198'20_arg with
            | true1 ->
              let k = [loop_193'10_f1,accWs_193'15_f2,xs_197'9_f5], fun [loop_193'10_f1,accWs_193'15_f2,xs_197'9_f3] app_244_198'43_arg ->
                let k = [loop_193'10_f1,accWs_193'15_f2,xs_197'9_f3], fun [loop_193'10_f1,accWs_193'15_f2,xs_197'9_f3] app_243_198'49_arg ->
                  let k = [loop_193'10_f1,xs_197'9_f3], fun [loop_193'10_f1,xs_197'9_f2] app_242_198'52_arg ->
                    let k = [xs_197'9_f2], fun [xs_197'9_f1] app_241_198'34_arg ->
                      let con_245_198'59_t1 = Nil0 in
                      let k = [xs_197'9_f1], fun [xs_197'9_f1] app_240_198'59_arg -> app_240_198'59_arg xs_197'9_f1 k in
                      app_241_198'34_arg con_245_198'59_t1 k in
                    loop_193'10_f1 app_242_198'52_arg k in
                  app_243_198'49_arg accWs_193'15_f2 k in
                ::_0'0_g14 app_244_198'43_arg k in
              reverse_63'4_g42 accCs_193'21_f3 k
            | false0 ->
              let k = [accCs_193'21_f3,x_197'6_f4,xs_197'9_f5], fun [accCs_193'21_f1,x_197'6_f2,xs_197'9_f3] app_247_199'17_arg ->
                let k = [accCs_193'21_f1,xs_197'9_f3,app_247_199'17_arg], fun [accCs_193'21_f1,xs_197'9_f2,app_247_199'17_f3] app_249_199'25_arg ->
                  let k = [xs_197'9_f2,app_247_199'17_f3], fun [xs_197'9_f1,app_247_199'17_f2] app_248_199'27_arg ->
                    let k = [xs_197'9_f1], fun [xs_197'9_f1] app_246_199'23_arg -> app_246_199'23_arg xs_197'9_f1 k in
                    app_247_199'17_f2 app_248_199'27_arg k in
                  app_249_199'25_arg accCs_193'21_f1 k in
                ::_0'0_g14 x_197'6_f2 k in
              loop_193'10_f1 accWs_193'15_f2 k in
          app_238_198'18_arg lit_239_198'20_g97 k in
        eq_char_0'0_g8 x_197'6_t1 k in
    k lam_250_193'27_t1 in
  k lam_251_193'21_t1 in
let split_words_192'4_g99 = fun s_192'16_arg k ->
  let con_254_201'7_t1 = Nil0 in
  let k = [s_192'16_arg], fun [s_192'16_f1] app_253_201'7_arg ->
    let con_255_201'10_t1 = Nil0 in
    let k = [s_192'16_f1], fun [s_192'16_f1] app_252_201'10_arg -> app_252_201'10_arg s_192'16_f1 k in
    app_253_201'7_arg con_255_201'10_t1 k in
  loop_193'10_g98 con_254_201'7_t1 k in
let lit_260_208'38_g100 = "fib" in
let lit_264_209'40_g101 = "fact" in
let lit_268_210'42_g102 = "rev" in
let lit_270_214'13_g103 = '>' in
let lit_272_214'17_g104 = ' ' in
let lit_279_220'13_g105 = "This is a shell prototype. Try: fib, fact, rev\n" in
let k = [], fun [] app_207_166'26_arg ->
  let k = [], fun [] app_206_166'28_arg ->
    let con_209_166'31_t1 = Nil0 in
    let k = [], fun [] single_controlD_166'4_arg ->
      let rev_168'4_t1 = [single_controlD_166'4_arg], fun [single_controlD_166'4_f1] __168'7_arg k ->
        let loop_169'10_t1 = [single_controlD_166'4_f1], fun [single_controlD_166'4_f1] loop_169'10_me __169'14_arg k ->
          let con_210_170'23_t1 = Unit0 in
          let k = [single_controlD_166'4_f1,loop_169'10_me], fun [single_controlD_166'4_f1,loop_169'10_f2] xs_170'8_arg ->
            let k = [single_controlD_166'4_f1,loop_169'10_f2,xs_170'8_arg], fun [single_controlD_166'4_f1,loop_169'10_f2,xs_170'8_f3] app_212_171'20_arg ->
              let k = [loop_169'10_f2,xs_170'8_f3], fun [loop_169'10_f1,xs_170'8_f2] app_211_171'23_arg ->
                match app_211_171'23_arg with
                | true1 ->
                  let con_213_171'44_t1 = Unit0 in
                  k con_213_171'44_t1
                | false0 ->
                  let k = [loop_169'10_f1], fun [loop_169'10_f1] app_214_172'26_arg ->
                    let k = [loop_169'10_f1], fun [loop_169'10_f1] __172'29_arg ->
                      let con_215_172'38_t1 = Unit0 in
                      let k = [loop_169'10_f1], fun [loop_169'10_f1] __172'40_arg ->
                        let con_216_172'46_t1 = Unit0 in
                        loop_169'10_f1 con_216_172'46_t1 k in
                      newline_99'4_g58 con_215_172'38_t1 k in
                    put_chars_90'8_g54 app_214_172'26_arg k in
                  reverse_63'4_g42 xs_170'8_f2 k in
              app_212_171'20_arg single_controlD_166'4_f1 k in
            eq_char_list_56'4_g39 xs_170'8_arg k in
          read_line_101'4_g64 con_210_170'23_t1 k in
        let con_217_174'6_t2 = Unit0 in
        loop_169'10_t1 con_217_174'6_t2 k in
      let runrev_176'4_t2 = [rev_168'4_t1], fun [rev_168'4_f1] args_176'11_arg k ->
        match args_176'11_arg with
        | Cons1(__178'4_t1,__178'7_t2) -> error_129'4_g74 lit_218_178'18_g88 k
        | Nil0 ->
          let k = [rev_168'4_f1], fun [rev_168'4_f1] __180'50_arg ->
            let con_220_181'8_t1 = Unit0 in
            rev_168'4_f1 con_220_181'8_t1 k in
          put_string_95'4_g55 lit_219_180'16_g89 k in
      let execute_203'4_t3 = [runrev_176'4_t2], fun [runrev_176'4_f1] line_203'12_arg k ->
        let k = [runrev_176'4_f1,line_203'12_arg], fun [runrev_176'4_f1,line_203'12_f2] words_204'6_arg ->
          match words_204'6_arg with
          | Nil0 ->
            let con_256_206'10_t1 = Unit0 in
            k con_256_206'10_t1
          | Cons1(command_207'4_t1,args_207'13_t2) ->
            let k = [runrev_176'4_f1,line_203'12_f2,command_207'4_t1,args_207'13_t2], fun [runrev_176'4_f1,line_203'12_f2,command_207'4_f3,args_207'13_f4] app_258_208'21_arg ->
              let k = [runrev_176'4_f1,line_203'12_f2,command_207'4_f3,args_207'13_f4,app_258_208'21_arg], fun [runrev_176'4_f1,line_203'12_f2,command_207'4_f3,args_207'13_f4,app_258_208'21_f5] app_259_208'38_arg ->
                let k = [runrev_176'4_f1,line_203'12_f2,command_207'4_f3,args_207'13_f4], fun [runrev_176'4_f1,line_203'12_f2,command_207'4_f3,args_207'13_f4] app_257_208'29_arg ->
                  match app_257_208'29_arg with
                  | true1 -> runfib_131'4_g80 args_207'13_f4 k
                  | false0 ->
                    let k = [runrev_176'4_f1,line_203'12_f2,command_207'4_f3,args_207'13_f4], fun [runrev_176'4_f1,line_203'12_f2,command_207'4_f3,args_207'13_f4] app_262_209'23_arg ->
                      let k = [runrev_176'4_f1,line_203'12_f2,command_207'4_f3,args_207'13_f4,app_262_209'23_arg], fun [runrev_176'4_f1,line_203'12_f2,command_207'4_f3,args_207'13_f4,app_262_209'23_f5] app_263_209'40_arg ->
                        let k = [runrev_176'4_f1,line_203'12_f2,command_207'4_f3,args_207'13_f4], fun [runrev_176'4_f1,line_203'12_f2,command_207'4_f3,args_207'13_f4] app_261_209'31_arg ->
                          match app_261_209'31_arg with
                          | true1 -> runfact_148'4_g86 args_207'13_f4 k
                          | false0 ->
                            let k = [runrev_176'4_f1,line_203'12_f2,args_207'13_f4], fun [runrev_176'4_f1,line_203'12_f2,args_207'13_f3] app_266_210'25_arg ->
                              let k = [runrev_176'4_f1,line_203'12_f2,args_207'13_f3,app_266_210'25_arg], fun [runrev_176'4_f1,line_203'12_f2,args_207'13_f3,app_266_210'25_f4] app_267_210'42_arg ->
                                let k = [runrev_176'4_f1,line_203'12_f2,args_207'13_f3], fun [runrev_176'4_f1,line_203'12_f2,args_207'13_f3] app_265_210'33_arg ->
                                  match app_265_210'33_arg with
                                  | true1 -> runrev_176'4_f1 args_207'13_f3 k
                                  | false0 -> fallback_183'4_g96 line_203'12_f2 k in
                                app_266_210'25_f4 app_267_210'42_arg k in
                              explode_0'0_g11 lit_268_210'42_g102 k in
                            eq_char_list_56'4_g39 command_207'4_f3 k in
                        app_262_209'23_f5 app_263_209'40_arg k in
                      explode_0'0_g11 lit_264_209'40_g101 k in
                    eq_char_list_56'4_g39 command_207'4_f3 k in
                app_258_208'21_f5 app_259_208'38_arg k in
              explode_0'0_g11 lit_260_208'38_g100 k in
            eq_char_list_56'4_g39 command_207'4_t1 k in
        split_words_192'4_g99 line_203'12_arg k in
      let mainloop_213'8_t4 = [single_controlD_166'4_arg,execute_203'4_t3], fun [single_controlD_166'4_f1,execute_203'4_f2] mainloop_213'8_me __213'17_arg k ->
        let con_273_214'20_t1 = Nil0 in
        let con_271_214'17_t2 = Cons1[lit_272_214'17_g104,con_273_214'20_t1] in
        let con_269_214'13_t3 = Cons1[lit_270_214'13_g103,con_271_214'17_t2] in
        let k = [single_controlD_166'4_f1,execute_203'4_f2,mainloop_213'8_me], fun [single_controlD_166'4_f1,execute_203'4_f2,mainloop_213'8_f3] __214'21_arg ->
          let con_274_215'21_t1 = Unit0 in
          let k = [single_controlD_166'4_f1,execute_203'4_f2,mainloop_213'8_f3], fun [single_controlD_166'4_f1,execute_203'4_f2,mainloop_213'8_f3] xs_215'6_arg ->
            let k = [single_controlD_166'4_f1,execute_203'4_f2,mainloop_213'8_f3,xs_215'6_arg], fun [single_controlD_166'4_f1,execute_203'4_f2,mainloop_213'8_f3,xs_215'6_f4] app_276_216'18_arg ->
              let k = [execute_203'4_f2,mainloop_213'8_f3,xs_215'6_f4], fun [execute_203'4_f1,mainloop_213'8_f2,xs_215'6_f3] app_275_216'21_arg ->
                match app_275_216'21_arg with
                | true1 ->
                  let con_277_216'42_t1 = Unit0 in
                  k con_277_216'42_t1
                | false0 ->
                  let k = [mainloop_213'8_f2], fun [mainloop_213'8_f1] __217'15_arg ->
                    let con_278_217'26_t1 = Unit0 in
                    mainloop_213'8_f1 con_278_217'26_t1 k in
                  execute_203'4_f1 xs_215'6_f3 k in
              app_276_216'18_arg single_controlD_166'4_f1 k in
            eq_char_list_56'4_g39 xs_215'6_arg k in
          read_line_101'4_g64 con_274_215'21_t1 k in
        put_chars_90'8_g54 con_269_214'13_t3 k in
      let main_219'4_t5 = [mainloop_213'8_t4], fun [mainloop_213'8_f1] __219'9_arg k ->
        let k = [mainloop_213'8_f1], fun [mainloop_213'8_f1] __220'63_arg ->
          let con_280_221'11_t1 = Unit0 in
          mainloop_213'8_f1 con_280_221'11_t1 k in
        put_string_95'4_g55 lit_279_220'13_g105 k in
      let con_281_0'0_t6 = Unit0 in
      main_219'4_t5 con_281_0'0_t6 k in
    app_206_166'28_arg con_209_166'31_t1 k in
  ::_0'0_g14 app_207_166'26_arg k in
chr_0'0_g10 lit_208_166'26_g87 k
