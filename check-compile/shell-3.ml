(*stage3*)
let k () = ()
let +_g1 = fun x_arg k ->
  let lam_2_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_1_t1 = PRIM_AddInt(x_f1,y_arg) in
    k prim_1_t1 in
  k lam_2_t1 in
let -_g2 = fun x_arg k ->
  let lam_4_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_3_t1 = PRIM_SubInt(x_f1,y_arg) in
    k prim_3_t1 in
  k lam_4_t1 in
let ( * )_g3 = fun x_arg k ->
  let lam_6_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_5_t1 = PRIM_MulInt(x_f1,y_arg) in
    k prim_5_t1 in
  k lam_6_t1 in
let /_g4 = fun x_arg k ->
  let lam_8_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_7_t1 = PRIM_DivInt(x_f1,y_arg) in
    k prim_7_t1 in
  k lam_8_t1 in
let %_g5 = fun x_arg k ->
  let lam_10_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_9_t1 = PRIM_ModInt(x_f1,y_arg) in
    k prim_9_t1 in
  k lam_10_t1 in
let <_g6 = fun x_arg k ->
  let lam_12_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_11_t1 = PRIM_LessInt(x_f1,y_arg) in
    k prim_11_t1 in
  k lam_12_t1 in
let =_g7 = fun x_arg k ->
  let lam_14_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_13_t1 = PRIM_EqInt(x_f1,y_arg) in
    k prim_13_t1 in
  k lam_14_t1 in
let eq_char_g8 = fun x_arg k ->
  let lam_16_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_15_t1 = PRIM_EqChar(x_f1,y_arg) in
    k prim_15_t1 in
  k lam_16_t1 in
let ord_g9 = fun x_arg k ->
  let prim_17_t1 = PRIM_CharOrd(x_arg) in
  k prim_17_t1 in
let chr_g10 = fun x_arg k ->
  let prim_18_t1 = PRIM_CharChr(x_arg) in
  k prim_18_t1 in
let explode_g11 = fun x_arg k ->
  let prim_19_t1 = PRIM_Explode(x_arg) in
  k prim_19_t1 in
let put_char_g12 = fun x_arg k ->
  let prim_20_t1 = PRIM_PutChar(x_arg) in
  k prim_20_t1 in
let get_char_g13 = fun x_arg k ->
  let prim_21_t1 = PRIM_GetChar(x_arg) in
  k prim_21_t1 in
let ::_g14 = fun x_arg k ->
  let lam_23_t1 = [x_arg], fun [x_f1] y_arg k ->
    let con_22_t1 = Cons1[x_f1,y_arg] in
    k con_22_t1 in
  k lam_23_t1 in
let not_g15 = fun b_arg k ->
  match b_arg with
  | true1 ->
    let con_24_t1 = false0 in
    k con_24_t1
  | false0 ->
    let con_25_t1 = true1 in
    k con_25_t1 in
let >_g16 = fun a_arg k ->
  let lam_27_t1 = [a_arg], fun [a_f1] b_arg k ->
    let k = [a_f1], fun [a_f1] app_26_7'16_arg -> app_26_7'16_arg a_f1 k in
    <_g6 b_arg k in
  k lam_27_t1 in
let <=_g17 = fun a_arg k ->
  let lam_30_t1 = [a_arg], fun [a_f1] b_arg k ->
    let k = [], fun [] app_28_8'24_arg -> not_g15 app_28_8'24_arg k in
    let k = [a_f1], fun [a_f1] app_29_8'22_arg -> app_29_8'22_arg a_f1 k in
    <_g6 b_arg k in
  k lam_30_t1 in
let >=_g18 = fun a_arg k ->
  let lam_33_t1 = [a_arg], fun [a_f1] b_arg k ->
    let k = [], fun [] app_31_9'24_arg -> not_g15 app_31_9'24_arg k in
    let k = [b_arg], fun [b_f1] app_32_9'22_arg -> app_32_9'22_arg b_f1 k in
    <_g6 a_f1 k in
  k lam_33_t1 in
let lit_37_14'22_g19 = '0' in
let lit_40_16'10_g20 = 0 in
let lit_43_16'25_g21 = 9 in
let parse_digit_g22 = fun c_arg k ->
  let k = [], fun [] n_arg ->
    let k = [n_arg], fun [n_f1] app_38_16'10_arg ->
      match app_38_16'10_arg with
      | true1 ->
        let k = [n_f1], fun [n_f1] app_41_16'25_arg ->
          match app_41_16'25_arg with
          | true1 ->
            let con_44_t1 = Some0[n_f1] in
            k con_44_t1
          | false0 ->
            let con_45_t1 = None1 in
            k con_45_t1 in
        let k = [], fun [] app_42_16'22_arg -> app_42_16'22_arg lit_43_16'25_g21 k in
        <=_g17 n_f1 k
      | false0 ->
        let con_46_t1 = None1 in
        k con_46_t1 in
    let k = [], fun [] app_39_16'7_arg -> app_39_16'7_arg lit_40_16'10_g20 k in
    >=_g18 n_arg k in
  let k = [], fun [] app_34_14'16_arg ->
    let k = [app_34_14'16_arg], fun [app_34_14'16_f1] app_36_14'22_arg -> app_34_14'16_f1 app_36_14'22_arg k in
    ord_g9 lit_37_14'22_g19 k in
  let k = [], fun [] app_35_14'14_arg -> -_g2 app_35_14'14_arg k in
  ord_g9 c_arg k in
let lit_55_25'26_g23 = 10 in
let loop_g24 = fun loop_me acc_arg k ->
  let lam_56_t1 = [acc_arg,loop_me], fun [acc_f1,loop_f2] xs_arg k ->
    match xs_arg with
    | Nil0 ->
      let con_47_t1 = Some0[acc_f1] in
      k con_47_t1
    | Cons1(x_t1,xs_t2) ->
      let k = [acc_f1,loop_f2,xs_t2], fun [acc_f1,loop_f2,xs_f3] app_48_23'26_arg ->
        match app_48_23'26_arg with
        | None1 ->
          let con_49_t1 = None1 in
          k con_49_t1
        | Some0(d_t1) ->
          let k = [xs_f3], fun [xs_f1] app_50_25'25_arg -> app_50_25'25_arg xs_f1 k in
          let k = [loop_f2], fun [loop_f1] app_51_25'37_arg -> loop_f1 app_51_25'37_arg k in
          let k = [d_t1], fun [d_f1] app_52_25'35_arg -> app_52_25'35_arg d_f1 k in
          let k = [], fun [] app_53_25'31_arg -> +_g1 app_53_25'31_arg k in
          let k = [acc_f1], fun [acc_f1] app_54_25'29_arg -> app_54_25'29_arg acc_f1 k in
          ( * )_g3 lit_55_25'26_g23 k in
      parse_digit_g22 x_t1 k in
  k lam_56_t1 in
let lit_58_27'7_g25 = 0 in
let parse_num_g26 = fun s_arg k ->
  let k = [s_arg], fun [s_f1] app_57_27'7_arg -> app_57_27'7_arg s_f1 k in
  loop_g24 lit_58_27'7_g25 k in
let cons_g27 = fun x_arg k ->
  let lam_60_t1 = [x_arg], fun [x_f1] xs_arg k ->
    let k = [xs_arg], fun [xs_f1] app_59_29'18_arg -> app_59_29'18_arg xs_f1 k in
    ::_g14 x_f1 k in
  k lam_60_t1 in
let eq_list_g28 = fun eq_list_me eq_arg k ->
  let lam_70_t1 = [eq_arg,eq_list_me], fun [eq_f1,eq_list_f2] xs_arg k ->
    let lam_69_t1 = [eq_f1,eq_list_f2,xs_arg], fun [eq_f1,eq_list_f2,xs_f3] ys_arg k ->
      match xs_f3 with
      | Nil0 ->
        match ys_arg with
        | Nil0 ->
          let con_61_t1 = true1 in
          k con_61_t1
        | Cons1(__t1,__t2) ->
          let con_62_t3 = false0 in
          k con_62_t3
      | Cons1(x_t1,xs_t2) ->
        match ys_arg with
        | Nil0 ->
          let con_63_t3 = false0 in
          k con_63_t3
        | Cons1(y_t3,ys_t4) ->
          let k = [eq_f1,eq_list_f2,xs_t2,ys_t4], fun [eq_f1,eq_list_f2,xs_f3,ys_f4] app_64_38'16_arg ->
            match app_64_38'16_arg with
            | true1 ->
              let k = [ys_f4], fun [ys_f1] app_66_38'34_arg -> app_66_38'34_arg ys_f1 k in
              let k = [xs_f3], fun [xs_f1] app_67_38'31_arg -> app_67_38'31_arg xs_f1 k in
              eq_list_f2 eq_f1 k
            | false0 ->
              let con_68_t1 = false0 in
              k con_68_t1 in
          let k = [y_t3], fun [y_f1] app_65_38'14_arg -> app_65_38'14_arg y_f1 k in
          eq_f1 x_t1 k in
    k lam_69_t1 in
  k lam_70_t1 in
let eq_char_list_g29 = fun a_arg k ->
  let lam_73_t1 = [a_arg], fun [a_f1] b_arg k ->
    let k = [b_arg], fun [b_f1] app_71_40'39_arg -> app_71_40'39_arg b_f1 k in
    let k = [a_f1], fun [a_f1] app_72_40'31_arg -> app_72_40'31_arg a_f1 k in
    eq_list_g28 eq_char_g8 k in
  k lam_73_t1 in
let append_g30 = fun append_me xs_arg k ->
  let lam_77_t1 = [append_me,xs_arg], fun [append_f1,xs_f2] ys_arg k ->
    match xs_f2 with
    | Nil0 -> k ys_arg
    | Cons1(x_t1,xs_t2) ->
      let k = [append_f1,xs_t2,ys_arg], fun [append_f1,xs_f2,ys_f3] app_74_45'18_arg ->
        let k = [app_74_45'18_arg], fun [app_74_45'18_f1] app_75_45'31_arg -> app_74_45'18_f1 app_75_45'31_arg k in
        let k = [ys_f3], fun [ys_f1] app_76_45'28_arg -> app_76_45'28_arg ys_f1 k in
        append_f1 xs_f2 k in
      cons_g27 x_t1 k in
  k lam_77_t1 in
let loop_g31 = fun loop_me acc_arg k ->
  let lam_81_t1 = [acc_arg,loop_me], fun [acc_f1,loop_f2] xs_arg k ->
    match xs_arg with
    | Nil0 -> k acc_f1
    | Cons1(x_t1,xs_t2) ->
      let k = [xs_t2], fun [xs_f1] app_78_51'20_arg -> app_78_51'20_arg xs_f1 k in
      let k = [loop_f2], fun [loop_f1] app_79_51'28_arg -> loop_f1 app_79_51'28_arg k in
      let k = [acc_f1], fun [acc_f1] app_80_51'26_arg -> app_80_51'26_arg acc_f1 k in
      cons_g27 x_t1 k in
  k lam_81_t1 in
let reverse_g32 = fun xs_arg k ->
  let k = [xs_arg], fun [xs_f1] app_82_53'7_arg -> app_82_53'7_arg xs_f1 k in
  let con_83_53'7_t1 = Nil0 in
  loop_g31 con_83_53'7_t1 k in
let map_g33 = fun map_me f_arg k ->
  let lam_89_t1 = [f_arg,map_me], fun [f_f1,map_f2] xs_arg k ->
    match xs_arg with
    | Nil0 ->
      let con_84_t1 = Nil0 in
      k con_84_t1
    | Cons1(x_t1,xs_t2) ->
      let k = [f_f1,map_f2,xs_t2], fun [f_f1,map_f2,xs_f3] app_85_58'17_arg ->
        let k = [app_85_58'17_arg], fun [app_85_58'17_f1] app_87_58'26_arg -> app_85_58'17_f1 app_87_58'26_arg k in
        let k = [xs_f3], fun [xs_f1] app_88_58'24_arg -> app_88_58'24_arg xs_f1 k in
        map_f2 f_f1 k in
      let k = [], fun [] app_86_58'15_arg -> ::_g14 app_86_58'15_arg k in
      f_f1 x_t1 k in
  k lam_89_t1 in
let lit_90_g34 = 0 in
let lit_92_63'17_g35 = 1 in
let length_g36 = fun length_me xs_arg k ->
  match xs_arg with
  | Nil0 -> k lit_90_g34
  | Cons1(__t1,xs_t2) ->
    let k = [length_me,xs_t2], fun [length_f1,xs_f2] app_91_63'17_arg ->
      let k = [app_91_63'17_arg], fun [app_91_63'17_f1] app_93_63'27_arg -> app_91_63'17_f1 app_93_63'27_arg k in
      length_f1 xs_f2 k in
    +_g1 lit_92_63'17_g35 k in
let lit_94_66'17_g37 = '0' in
let lit_99_69'11_g38 = 0 in
let lit_106_70'35_g39 = 10 in
let lit_109_70'48_g40 = 10 in
let lit_113_72'9_g41 = 0 in
let lit_115_72'21_g42 = '0' in
let chars_of_int_g43 = fun i_arg k ->
  let k = [i_arg], fun [i_f1] ord0_arg ->
    let char_of_digit_t1 = [ord0_arg], fun [ord0_f1] c_arg k ->
      let k = [], fun [] app_95_67'36_arg -> chr_g10 app_95_67'36_arg k in
      let k = [c_arg], fun [c_f1] app_96_67'34_arg -> app_96_67'34_arg c_f1 k in
      +_g1 ord0_f1 k in
    let loop_t2 = [char_of_digit_t1], fun [char_of_digit_f1] loop_me acc_arg k ->
      let lam_110_t1 = [acc_arg,char_of_digit_f1,loop_me], fun [acc_f1,char_of_digit_f2,loop_f3] i_arg k ->
        let k = [acc_f1,char_of_digit_f2,i_arg,loop_f3], fun [acc_f1,char_of_digit_f2,i_f3,loop_f4] app_97_69'11_arg ->
          match app_97_69'11_arg with
          | true1 -> k acc_f1
          | false0 ->
            let k = [i_f3], fun [i_f1] app_100_70'11_arg ->
              let k = [app_100_70'11_arg], fun [app_100_70'11_f1] app_107_70'48_arg -> app_100_70'11_f1 app_107_70'48_arg k in
              let k = [], fun [] app_108_70'47_arg -> app_108_70'47_arg lit_109_70'48_g40 k in
              /_g4 i_f1 k in
            let k = [loop_f4], fun [loop_f1] app_101_70'40_arg -> loop_f1 app_101_70'40_arg k in
            let k = [acc_f1], fun [acc_f1] app_102_70'17_arg -> app_102_70'17_arg acc_f1 k in
            let k = [], fun [] app_103_70'32_arg -> cons_g27 app_103_70'32_arg k in
            let k = [char_of_digit_f2], fun [char_of_digit_f1] app_104_70'35_arg -> char_of_digit_f1 app_104_70'35_arg k in
            let k = [], fun [] app_105_70'34_arg -> app_105_70'34_arg lit_106_70'35_g39 k in
            %_g5 i_f3 k in
        let k = [], fun [] app_98_69'9_arg -> app_98_69'9_arg lit_99_69'11_g38 k in
        =_g7 i_arg k in
      k lam_110_t1 in
    let k = [i_f1,loop_t2], fun [i_f1,loop_f2] app_111_72'9_arg ->
      match app_111_72'9_arg with
      | true1 ->
        let k = [], fun [] app_114_72'21_arg ->
          let con_116_72'25_t1 = Nil0 in
          app_114_72'21_arg con_116_72'25_t1 k in
        cons_g27 lit_115_72'21_g42 k
      | false0 ->
        let k = [i_f1], fun [i_f1] app_117_72'38_arg -> app_117_72'38_arg i_f1 k in
        let con_118_72'38_t1 = Nil0 in
        loop_f2 con_118_72'38_t1 k in
    let k = [], fun [] app_112_72'7_arg -> app_112_72'7_arg lit_113_72'9_g41 k in
    =_g7 i_f1 k in
  ord_g9 lit_94_66'17_g37 k in
let put_chars_g44 = fun put_chars_me xs_arg k ->
  match xs_arg with
  | Nil0 ->
    let con_119_t1 = Unit0 in
    k con_119_t1
  | Cons1(x_t1,xs_t2) ->
    let k = [put_chars_me,xs_t2], fun [put_chars_f1,xs_f2] __arg -> put_chars_f1 xs_f2 k in
    put_char_g12 x_t1 k in
let put_string_g45 = fun s_arg k ->
  let k = [], fun [] app_120_79'38_arg -> put_chars_g44 app_120_79'38_arg k in
  explode_g11 s_arg k in
let put_int_g46 = fun i_arg k ->
  let k = [], fun [] app_121_81'40_arg -> put_chars_g44 app_121_81'40_arg k in
  chars_of_int_g43 i_arg k in
let lit_122_83'26_g47 = '\n' in
let newline_g48 = fun __arg k -> put_char_g12 lit_122_83'26_g47 k in
let put_string_newline_g49 = fun s_arg k ->
  let k = [], fun [] __arg ->
    let con_123_87'10_t1 = Unit0 in
    newline_g48 con_123_87'10_t1 k in
  put_string_g45 s_arg k in
let lit_127_93'17_g50 = '\n' in
let lit_131_94'14_g51 = 31 in
let lit_134_95'15_g52 = 127 in
let lit_137_96'17_g53 = 127 in
let lit_139_101'29_g54 = 8 in
let lit_140_102'24_g55 = ' ' in
let lit_142_103'29_g56 = 8 in
let loop_g57 = fun loop_me acc_arg k ->
  let k = [acc_arg,loop_me], fun [acc_f1,loop_f2] c_arg ->
    let k = [acc_f1,c_arg,loop_f2], fun [acc_f1,c_f2,loop_f3] n_arg ->
      let k = [acc_f1,c_f2,loop_f3,n_arg], fun [acc_f1,c_f2,loop_f3,n_f4] app_125_93'17_arg ->
        match app_125_93'17_arg with
        | true1 ->
          let k = [acc_f1], fun [acc_f1] __arg -> reverse_g32 acc_f1 k in
          let con_128_93'35_t1 = Unit0 in
          newline_g48 con_128_93'35_t1 k
        | false0 ->
          let k = [acc_f1,c_f2,loop_f3,n_f4], fun [acc_f1,c_f2,loop_f3,n_f4] app_129_94'14_arg ->
            match app_129_94'14_arg with
            | true1 -> loop_f3 acc_f1 k
            | false0 ->
              let k = [acc_f1,c_f2,loop_f3,n_f4], fun [acc_f1,c_f2,loop_f3,n_f4] app_132_95'15_arg ->
                match app_132_95'15_arg with
                | true1 -> loop_f3 acc_f1 k
                | false0 ->
                  let k = [acc_f1,c_f2,loop_f3], fun [acc_f1,c_f2,loop_f3] app_135_96'17_arg ->
                    match app_135_96'17_arg with
                    | true1 ->
                      match acc_f1 with
                      | Nil0 -> loop_f3 acc_f1 k
                      | Cons1(__t1,tail_t2) ->
                        let k = [loop_f3,tail_t2], fun [loop_f1,tail_f2] __arg ->
                          let k = [loop_f1,tail_f2], fun [loop_f1,tail_f2] __arg ->
                            let k = [loop_f1,tail_f2], fun [loop_f1,tail_f2] __arg -> loop_f1 tail_f2 k in
                            let k = [], fun [] app_141_103'29_arg -> put_char_g12 app_141_103'29_arg k in
                            chr_g10 lit_142_103'29_g56 k in
                          put_char_g12 lit_140_102'24_g55 k in
                        let k = [], fun [] app_138_101'29_arg -> put_char_g12 app_138_101'29_arg k in
                        chr_g10 lit_139_101'29_g54 k
                    | false0 ->
                      let k = [acc_f1,c_f2,loop_f3], fun [acc_f1,c_f2,loop_f3] __arg ->
                        let k = [loop_f3], fun [loop_f1] app_143_106'38_arg -> loop_f1 app_143_106'38_arg k in
                        let k = [acc_f1], fun [acc_f1] app_144_106'36_arg -> app_144_106'36_arg acc_f1 k in
                        cons_g27 c_f2 k in
                      put_char_g12 c_f2 k in
                  let k = [], fun [] app_136_96'15_arg -> app_136_96'15_arg lit_137_96'17_g53 k in
                  =_g7 n_f4 k in
              let k = [], fun [] app_133_95'13_arg -> app_133_95'13_arg lit_134_95'15_g52 k in
              >_g16 n_f4 k in
          let k = [], fun [] app_130_94'11_arg -> app_130_94'11_arg lit_131_94'14_g51 k in
          <=_g17 n_f4 k in
      let k = [], fun [] app_126_93'15_arg -> app_126_93'15_arg lit_127_93'17_g50 k in
      eq_char_g8 c_f2 k in
    ord_g9 c_arg k in
  let con_124_91'21_t1 = Unit0 in
  get_char_g13 con_124_91'21_t1 k in
let read_line_g58 = fun __arg k ->
  let con_145_108'7_t1 = Nil0 in
  loop_g57 con_145_108'7_t1 k in
let lit_148_112'9_g59 = 2 in
let lit_153_112'30_g60 = 1 in
let lit_157_112'42_g61 = 2 in
let fib_g62 = fun fib_me n_arg k ->
  let k = [fib_me,n_arg], fun [fib_f1,n_f2] app_146_112'9_arg ->
    match app_146_112'9_arg with
    | true1 -> k n_f2
    | false0 ->
      let k = [fib_f1,n_f2], fun [fib_f1,n_f2] app_149_112'33_arg ->
        let k = [app_149_112'33_arg], fun [app_149_112'33_f1] app_154_112'39_arg -> app_149_112'33_f1 app_154_112'39_arg k in
        let k = [fib_f1], fun [fib_f1] app_155_112'42_arg -> fib_f1 app_155_112'42_arg k in
        let k = [], fun [] app_156_112'41_arg -> app_156_112'41_arg lit_157_112'42_g61 k in
        -_g2 n_f2 k in
      let k = [], fun [] app_150_112'27_arg -> +_g1 app_150_112'27_arg k in
      let k = [fib_f1], fun [fib_f1] app_151_112'30_arg -> fib_f1 app_151_112'30_arg k in
      let k = [], fun [] app_152_112'29_arg -> app_152_112'29_arg lit_153_112'30_g60 k in
      -_g2 n_f2 k in
  let k = [], fun [] app_147_112'7_arg -> app_147_112'7_arg lit_148_112'9_g59 k in
  <_g6 n_arg k in
let lit_160_116'10_g63 = 2 in
let lit_165_116'25_g64 = 1 in
let lit_166_g65 = 1 in
let fact_g66 = fun fact_me n_arg k ->
  let k = [fact_me,n_arg], fun [fact_f1,n_f2] app_158_116'10_arg ->
    match app_158_116'10_arg with
    | true1 ->
      let k = [n_f2], fun [n_f1] app_161_116'28_arg -> app_161_116'28_arg n_f1 k in
      let k = [], fun [] app_162_116'22_arg -> ( * )_g3 app_162_116'22_arg k in
      let k = [fact_f1], fun [fact_f1] app_163_116'25_arg -> fact_f1 app_163_116'25_arg k in
      let k = [], fun [] app_164_116'24_arg -> app_164_116'24_arg lit_165_116'25_g64 k in
      -_g2 n_f2 k
    | false0 -> k lit_166_g65 in
  let k = [], fun [] app_159_116'7_arg -> app_159_116'7_arg lit_160_116'10_g63 k in
  >=_g18 n_arg k in
let lit_167_118'25_g67 = "ERROR: " in
let error_g68 = fun s_arg k ->
  let k = [s_arg], fun [s_f1] __arg ->
    let k = [], fun [] __arg ->
      let con_168_118'58_t1 = Unit0 in
      newline_g48 con_168_118'58_t1 k in
    put_string_g45 s_f1 k in
  put_string_g45 lit_167_118'25_g67 k in
let lit_169_121'13_g69 = "fib: " in
let lit_170_123'16_g70 = "expected an argument" in
let lit_171_126'21_g71 = "expected exactly one argument" in
let lit_173_129'24_g72 = "expected arg1 to be numeric" in
let lit_174_133'22_g73 = " --> " in
let runfib_g74 = fun args_arg k ->
  let k = [args_arg], fun [args_f1] __arg ->
    match args_f1 with
    | Nil0 -> error_g68 lit_170_123'16_g70 k
    | Cons1(arg1_t1,more_t2) ->
      match more_t2 with
      | Cons1(__t3,__t4) -> error_g68 lit_171_126'21_g71 k
      | Nil0 ->
        let k = [], fun [] app_172_128'24_arg ->
          match app_172_128'24_arg with
          | None1 -> error_g68 lit_173_129'24_g72 k
          | Some0(n_t1) ->
            let k = [n_t1], fun [n_f1] res_arg ->
              let k = [res_arg], fun [res_f1] __arg ->
                let k = [res_f1], fun [res_f1] __arg ->
                  let k = [], fun [] __arg ->
                    let con_175_135'19_t1 = Unit0 in
                    newline_g48 con_175_135'19_t1 k in
                  put_int_g46 res_f1 k in
                put_string_g45 lit_174_133'22_g73 k in
              put_int_g46 n_f1 k in
            fib_g62 n_t1 k in
        parse_num_g26 arg1_t1 k in
  put_string_g45 lit_169_121'13_g69 k in
let lit_176_138'13_g75 = "fact: " in
let lit_177_140'16_g76 = "expected an argument" in
let lit_178_143'21_g77 = "expected exactly one argument" in
let lit_180_146'24_g78 = "expected arg1 to be numeric" in
let lit_181_150'22_g79 = " --> " in
let runfact_g80 = fun args_arg k ->
  let k = [args_arg], fun [args_f1] __arg ->
    match args_f1 with
    | Nil0 -> error_g68 lit_177_140'16_g76 k
    | Cons1(arg1_t1,more_t2) ->
      match more_t2 with
      | Cons1(__t3,__t4) -> error_g68 lit_178_143'21_g77 k
      | Nil0 ->
        let k = [], fun [] app_179_145'24_arg ->
          match app_179_145'24_arg with
          | None1 -> error_g68 lit_180_146'24_g78 k
          | Some0(n_t1) ->
            let k = [n_t1], fun [n_f1] res_arg ->
              let k = [res_arg], fun [res_f1] __arg ->
                let k = [res_f1], fun [res_f1] __arg ->
                  let k = [], fun [] __arg ->
                    let con_182_152'19_t1 = Unit0 in
                    newline_g48 con_182_152'19_t1 k in
                  put_int_g46 res_f1 k in
                put_string_g45 lit_181_150'22_g79 k in
              put_int_g46 n_f1 k in
            fact_g66 n_t1 k in
        parse_num_g26 arg1_t1 k in
  put_string_g45 lit_176_138'13_g75 k in
let lit_186_155'48_g81 = 'o' in
let lit_187_g82 = '*' in
let lam_183_g83 = fun c_arg k ->
  let k = [c_arg], fun [c_f1] app_184_155'48_arg ->
    match app_184_155'48_arg with
    | true1 -> k lit_187_g82
    | false0 -> k c_f1 in
  let k = [], fun [] app_185_155'46_arg -> app_185_155'46_arg lit_186_155'48_g81 k in
  eq_char_g8 c_arg k in
let lit_189_156'10_g84 = 100 in
let lit_194_157'29_g85 = "You wrote: " in
let lit_196_158'11_g86 = ' ' in
let lit_197_159'11_g87 = '{' in
let lit_198_161'11_g88 = '}' in
let fallback_g89 = fun line_arg k ->
  let k = [line_arg], fun [line_f1] star_the_ohs_arg ->
    let k = [line_f1,star_the_ohs_arg], fun [line_f1,star_the_ohs_f2] n_arg ->
      let k = [n_arg], fun [n_f1] __arg ->
        let k = [n_f1], fun [n_f1] __arg ->
          let k = [n_f1], fun [n_f1] __arg ->
            let k = [], fun [] __arg ->
              let k = [], fun [] __arg ->
                let con_199_162'10_t1 = Unit0 in
                newline_g48 con_199_162'10_t1 k in
              put_char_g12 lit_198_161'11_g88 k in
            put_int_g46 n_f1 k in
          put_char_g12 lit_197_159'11_g87 k in
        put_char_g12 lit_196_158'11_g86 k in
      let k = [], fun [] app_191_157'44_arg -> put_chars_g44 app_191_157'44_arg k in
      let k = [line_f1,star_the_ohs_f2], fun [line_f1,star_the_ohs_f2] app_192_157'20_arg ->
        let k = [app_192_157'20_arg], fun [app_192_157'20_f1] app_195_157'58_arg -> app_192_157'20_f1 app_195_157'58_arg k in
        star_the_ohs_f2 line_f1 k in
      let k = [], fun [] app_193_157'29_arg -> append_g30 app_193_157'29_arg k in
      explode_g11 lit_194_157'29_g85 k in
    let k = [line_f1], fun [line_f1] app_188_156'14_arg ->
      let k = [app_188_156'14_arg], fun [app_188_156'14_f1] app_190_156'23_arg -> app_188_156'14_f1 app_190_156'23_arg k in
      length_g36 line_f1 k in
    +_g1 lit_189_156'10_g84 k in
  map_g33 lam_183_g83 k in
let lit_205_170'20_g90 = ' ' in
let loop_g91 = fun loop_me accWs_arg k ->
  let lam_217_t1 = [accWs_arg,loop_me], fun [accWs_f1,loop_f2] accCs_arg k ->
    let lam_216_t1 = [accCs_arg,accWs_f1,loop_f2], fun [accCs_f1,accWs_f2,loop_f3] xs_arg k ->
      match xs_arg with
      | Nil0 ->
        let k = [], fun [] app_200_167'38_arg -> reverse_g32 app_200_167'38_arg k in
        let k = [accWs_f2], fun [accWs_f1] app_201_167'35_arg -> app_201_167'35_arg accWs_f1 k in
        let k = [], fun [] app_202_167'29_arg -> ::_g14 app_202_167'29_arg k in
        reverse_g32 accCs_f1 k
      | Cons1(x_t1,xs_t2) ->
        let k = [accCs_f1,accWs_f2,loop_f3,x_t1,xs_t2], fun [accCs_f1,accWs_f2,loop_f3,x_f4,xs_f5] app_203_170'20_arg ->
          match app_203_170'20_arg with
          | true1 ->
            let k = [xs_f5], fun [xs_f1] app_206_170'59_arg -> app_206_170'59_arg xs_f1 k in
            let k = [], fun [] app_207_170'34_arg ->
              let con_211_170'59_t1 = Nil0 in
              app_207_170'34_arg con_211_170'59_t1 k in
            let k = [loop_f3], fun [loop_f1] app_208_170'52_arg -> loop_f1 app_208_170'52_arg k in
            let k = [accWs_f2], fun [accWs_f1] app_209_170'49_arg -> app_209_170'49_arg accWs_f1 k in
            let k = [], fun [] app_210_170'43_arg -> ::_g14 app_210_170'43_arg k in
            reverse_g32 accCs_f1 k
          | false0 ->
            let k = [xs_f5], fun [xs_f1] app_212_171'23_arg -> app_212_171'23_arg xs_f1 k in
            let k = [accCs_f1,x_f4], fun [accCs_f1,x_f2] app_213_171'17_arg ->
              let k = [app_213_171'17_arg], fun [app_213_171'17_f1] app_214_171'27_arg -> app_213_171'17_f1 app_214_171'27_arg k in
              let k = [accCs_f1], fun [accCs_f1] app_215_171'25_arg -> app_215_171'25_arg accCs_f1 k in
              ::_g14 x_f2 k in
            loop_f3 accWs_f2 k in
        let k = [], fun [] app_204_170'18_arg -> app_204_170'18_arg lit_205_170'20_g90 k in
        eq_char_g8 x_t1 k in
    k lam_216_t1 in
  k lam_217_t1 in
let split_words_g92 = fun s_arg k ->
  let k = [s_arg], fun [s_f1] app_218_173'10_arg -> app_218_173'10_arg s_f1 k in
  let k = [], fun [] app_219_173'7_arg ->
    let con_221_173'10_t1 = Nil0 in
    app_219_173'7_arg con_221_173'10_t1 k in
  let con_220_173'7_t1 = Nil0 in
  loop_g91 con_220_173'7_t1 k in
let lit_226_180'38_g93 = "fib" in
let lit_230_181'40_g94 = "fact" in
let execute_g95 = fun line_arg k ->
  let k = [line_arg], fun [line_f1] words_arg ->
    match words_arg with
    | Nil0 ->
      let con_222_t1 = Unit0 in
      k con_222_t1
    | Cons1(command_t1,args_t2) ->
      let k = [args_t2,command_t1,line_f1], fun [args_f1,command_f2,line_f3] app_223_180'29_arg ->
        match app_223_180'29_arg with
        | true1 -> runfib_g74 args_f1 k
        | false0 ->
          let k = [args_f1,line_f3], fun [args_f1,line_f2] app_227_181'31_arg ->
            match app_227_181'31_arg with
            | true1 -> runfact_g80 args_f1 k
            | false0 -> fallback_g89 line_f2 k in
          let k = [], fun [] app_228_181'23_arg ->
            let k = [app_228_181'23_arg], fun [app_228_181'23_f1] app_229_181'40_arg -> app_228_181'23_f1 app_229_181'40_arg k in
            explode_g11 lit_230_181'40_g94 k in
          eq_char_list_g29 command_f2 k in
      let k = [], fun [] app_224_180'21_arg ->
        let k = [app_224_180'21_arg], fun [app_224_180'21_f1] app_225_180'38_arg -> app_224_180'21_f1 app_225_180'38_arg k in
        explode_g11 lit_226_180'38_g93 k in
      eq_char_list_g29 command_t1 k in
  split_words_g92 line_arg k in
let lit_231_185'11_g96 = '>' in
let lit_232_186'11_g97 = ' ' in
let mainloop_g98 = fun mainloop_me __arg k ->
  let k = [mainloop_me], fun [mainloop_f1] __arg ->
    let k = [mainloop_f1], fun [mainloop_f1] __arg ->
      let k = [mainloop_f1], fun [mainloop_f1] xs_arg ->
        let k = [mainloop_f1], fun [mainloop_f1] __arg ->
          let con_234_189'11_t1 = Unit0 in
          mainloop_f1 con_234_189'11_t1 k in
        execute_g95 xs_arg k in
      let con_233_187'21_t1 = Unit0 in
      read_line_g58 con_233_187'21_t1 k in
    put_char_g12 lit_232_186'11_g97 k in
  put_char_g12 lit_231_185'11_g96 k in
let lit_235_191'28_g99 = "LOAD" in
let lit_236_194'21_g100 = "RUN" in
let lit_238_196'21_g101 = "NEVER" in
let main_g102 = fun __arg k ->
  let k = [], fun [] __arg ->
    let k = [], fun [] __arg -> put_string_newline_g49 lit_238_196'21_g101 k in
    let con_237_195'20_t1 = Unit0 in
    mainloop_g98 con_237_195'20_t1 k in
  put_string_newline_g49 lit_236_194'21_g100 k in
let k = [], fun [] __arg ->
  let con_239_0'0_t1 = Unit0 in
  main_g102 con_239_0'0_t1 k in
put_string_newline_g49 lit_235_191'28_g99 k
