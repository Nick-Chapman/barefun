(*stage3; un-normalized*)
let k () = ()
let +_g1 = fun x_arg k ->
  let lam_2_0'0_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_1_0'0_t1 = PRIM_AddInt(x_f1,y_arg) in
    k prim_1_0'0_t1 in
  k lam_2_0'0_t1 in
let -_g2 = fun x_arg k ->
  let lam_4_0'0_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_3_0'0_t1 = PRIM_SubInt(x_f1,y_arg) in
    k prim_3_0'0_t1 in
  k lam_4_0'0_t1 in
let ( * )_g3 = fun x_arg k ->
  let lam_6_0'0_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_5_0'0_t1 = PRIM_MulInt(x_f1,y_arg) in
    k prim_5_0'0_t1 in
  k lam_6_0'0_t1 in
let /_g4 = fun x_arg k ->
  let lam_8_0'0_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_7_0'0_t1 = PRIM_DivInt(x_f1,y_arg) in
    k prim_7_0'0_t1 in
  k lam_8_0'0_t1 in
let %_g5 = fun x_arg k ->
  let lam_10_0'0_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_9_0'0_t1 = PRIM_ModInt(x_f1,y_arg) in
    k prim_9_0'0_t1 in
  k lam_10_0'0_t1 in
let <_g6 = fun x_arg k ->
  let lam_12_0'0_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_11_0'0_t1 = PRIM_LessInt(x_f1,y_arg) in
    k prim_11_0'0_t1 in
  k lam_12_0'0_t1 in
let =_g7 = fun x_arg k ->
  let lam_14_0'0_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_13_0'0_t1 = PRIM_EqInt(x_f1,y_arg) in
    k prim_13_0'0_t1 in
  k lam_14_0'0_t1 in
let eq_char_g8 = fun x_arg k ->
  let lam_16_0'0_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_15_0'0_t1 = PRIM_EqChar(x_f1,y_arg) in
    k prim_15_0'0_t1 in
  k lam_16_0'0_t1 in
let ord_g9 = fun x_arg k ->
  let prim_17_0'0_t1 = PRIM_CharOrd(x_arg) in
  k prim_17_0'0_t1 in
let chr_g10 = fun x_arg k ->
  let prim_18_0'0_t1 = PRIM_CharChr(x_arg) in
  k prim_18_0'0_t1 in
let explode_g11 = fun x_arg k ->
  let prim_19_0'0_t1 = PRIM_Explode(x_arg) in
  k prim_19_0'0_t1 in
let put_char_g12 = fun x_arg k ->
  let prim_20_0'0_t1 = PRIM_PutChar(x_arg) in
  k prim_20_0'0_t1 in
let get_char_g13 = fun x_arg k ->
  let prim_21_0'0_t1 = PRIM_GetChar(x_arg) in
  k prim_21_0'0_t1 in
let ::_g14 = fun x_arg k ->
  let lam_23_0'0_t1 = [x_arg], fun [x_f1] y_arg k ->
    let con_22_0'0_t1 = Cons1[x_f1,y_arg] in
    k con_22_0'0_t1 in
  k lam_23_0'0_t1 in
let not_g15 = fun b_arg k ->
  match b_arg with
  | true1 ->
    let con_24_4'12_t1 = false0 in
    k con_24_4'12_t1
  | false0 ->
    let con_25_5'13_t1 = true1 in
    k con_25_5'13_t1 in
let >_g16 = fun a_arg k ->
  let lam_27_7'10_t1 = [a_arg], fun [a_f1] b_arg k ->
    let k = [a_f1], fun [a_f1] app_26_7'16_arg -> app_26_7'16_arg a_f1 k in
    <_g6 b_arg k in
  k lam_27_7'10_t1 in
let <=_g17 = fun a_arg k ->
  let lam_30_8'11_t1 = [a_arg], fun [a_f1] b_arg k ->
    let k = [], fun [] app_28_8'24_arg -> not_g15 app_28_8'24_arg k in
    let k = [a_f1], fun [a_f1] app_29_8'22_arg -> app_29_8'22_arg a_f1 k in
    <_g6 b_arg k in
  k lam_30_8'11_t1 in
let >=_g18 = fun a_arg k ->
  let lam_33_9'11_t1 = [a_arg], fun [a_f1] b_arg k ->
    let k = [], fun [] app_31_9'24_arg -> not_g15 app_31_9'24_arg k in
    let k = [b_arg], fun [b_f1] app_32_9'22_arg -> app_32_9'22_arg b_f1 k in
    <_g6 a_f1 k in
  k lam_33_9'11_t1 in
let backspace_g19 = 8 in
let lit_38_16'17_g20 = '\n' in
let lit_41_17'13_g21 = 26 in
let lit_42_18'18_g22 = '^' in
let lit_49_18'42_g23 = 'A' in
let lit_50_18'52_g24 = 1 in
let put_char_g25 = fun c_arg k ->
  let k = [c_arg], fun [c_f1] n_arg ->
    let k = [c_f1,n_arg], fun [c_f1,n_f2] app_34_15'9_arg ->
      match app_34_15'9_arg with
      | true1 -> put_char_g12 c_f1 k
      | false0 ->
        let k = [c_f1,n_f2], fun [c_f1,n_f2] app_36_16'17_arg ->
          match app_36_16'17_arg with
          | true1 -> put_char_g12 c_f1 k
          | false0 ->
            let k = [c_f1,n_f2], fun [c_f1,n_f2] app_39_17'13_arg ->
              match app_39_17'13_arg with
              | true1 -> put_char_g12 c_f1 k
              | false0 ->
                let k = [n_f2], fun [n_f1] __arg ->
                  let k = [], fun [] app_43_18'37_arg -> put_char_g12 app_43_18'37_arg k in
                  let k = [], fun [] app_44_18'52_arg -> chr_g10 app_44_18'52_arg k in
                  let k = [], fun [] app_45_18'50_arg -> app_45_18'50_arg lit_50_18'52_g24 k in
                  let k = [], fun [] app_46_18'48_arg -> -_g2 app_46_18'48_arg k in
                  let k = [n_f1], fun [n_f1] app_47_18'46_arg -> app_47_18'46_arg n_f1 k in
                  let k = [], fun [] app_48_18'42_arg -> +_g1 app_48_18'42_arg k in
                  ord_g9 lit_49_18'42_g23 k in
                put_char_g12 lit_42_18'18_g22 k in
            let k = [], fun [] app_40_17'11_arg -> app_40_17'11_arg lit_41_17'13_g21 k in
            >_g16 n_f2 k in
        let k = [], fun [] app_37_16'15_arg -> app_37_16'15_arg lit_38_16'17_g20 k in
        eq_char_g8 c_f1 k in
    let k = [], fun [] app_35_15'7_arg -> app_35_15'7_arg backspace_g19 k in
    =_g7 n_arg k in
  ord_g9 c_arg k in
let lit_51_21'22_g26 = 8 in
let lit_52_24'11_g27 = ' ' in
let erase_char_g28 = fun __arg k ->
  let k = [], fun [] backspace_arg ->
    let k = [backspace_arg], fun [backspace_f1] __arg ->
      let k = [backspace_f1], fun [backspace_f1] __arg -> put_char_g25 backspace_f1 k in
      put_char_g25 lit_52_24'11_g27 k in
    put_char_g25 backspace_arg k in
  chr_g10 lit_51_21'22_g26 k in
let lit_56_30'22_g29 = '0' in
let lit_59_32'10_g30 = 0 in
let lit_62_32'25_g31 = 9 in
let parse_digit_g32 = fun c_arg k ->
  let k = [], fun [] n_arg ->
    let k = [n_arg], fun [n_f1] app_57_32'10_arg ->
      match app_57_32'10_arg with
      | true1 ->
        let k = [n_f1], fun [n_f1] app_60_32'25_arg ->
          match app_60_32'25_arg with
          | true1 ->
            let con_63_32'32_t1 = Some0[n_f1] in
            k con_63_32'32_t1
          | false0 ->
            let con_64_32'45_t1 = None1 in
            k con_64_32'45_t1 in
        let k = [], fun [] app_61_32'22_arg -> app_61_32'22_arg lit_62_32'25_g31 k in
        <=_g17 n_f1 k
      | false0 ->
        let con_65_32'55_t1 = None1 in
        k con_65_32'55_t1 in
    let k = [], fun [] app_58_32'7_arg -> app_58_32'7_arg lit_59_32'10_g30 k in
    >=_g18 n_arg k in
  let k = [], fun [] app_53_30'16_arg ->
    let k = [app_53_30'16_arg], fun [app_53_30'16_f1] app_55_30'22_arg -> app_53_30'16_f1 app_55_30'22_arg k in
    ord_g9 lit_56_30'22_g29 k in
  let k = [], fun [] app_54_30'14_arg -> -_g2 app_54_30'14_arg k in
  ord_g9 c_arg k in
let lit_74_41'26_g33 = 10 in
let loop_g34 = fun loop_me acc_arg k ->
  let lam_75_35'19_t1 = [acc_arg,loop_me], fun [acc_f1,loop_f2] xs_arg k ->
    match xs_arg with
    | Nil0 ->
      let con_66_37'12_t1 = Some0[acc_f1] in
      k con_66_37'12_t1
    | Cons1(x_t1,xs_t2) ->
      let k = [acc_f1,loop_f2,xs_t2], fun [acc_f1,loop_f2,xs_f3] app_67_39'26_arg ->
        match app_67_39'26_arg with
        | None1 ->
          let con_68_40'18_t1 = None1 in
          k con_68_40'18_t1
        | Some0(d_t1) ->
          let k = [xs_f3], fun [xs_f1] app_69_41'25_arg -> app_69_41'25_arg xs_f1 k in
          let k = [loop_f2], fun [loop_f1] app_70_41'37_arg -> loop_f1 app_70_41'37_arg k in
          let k = [d_t1], fun [d_f1] app_71_41'35_arg -> app_71_41'35_arg d_f1 k in
          let k = [], fun [] app_72_41'31_arg -> +_g1 app_72_41'31_arg k in
          let k = [acc_f1], fun [acc_f1] app_73_41'29_arg -> app_73_41'29_arg acc_f1 k in
          ( * )_g3 lit_74_41'26_g33 k in
      parse_digit_g32 x_t1 k in
  k lam_75_35'19_t1 in
let lit_77_43'7_g35 = 0 in
let parse_num_g36 = fun s_arg k ->
  let k = [s_arg], fun [s_f1] app_76_43'7_arg -> app_76_43'7_arg s_f1 k in
  loop_g34 lit_77_43'7_g35 k in
let cons_g37 = fun x_arg k ->
  let lam_79_45'11_t1 = [x_arg], fun [x_f1] xs_arg k ->
    let k = [xs_arg], fun [xs_f1] app_78_45'18_arg -> app_78_45'18_arg xs_f1 k in
    ::_g14 x_f1 k in
  k lam_79_45'11_t1 in
let eq_list_g38 = fun eq_list_me eq_arg k ->
  let lam_89_47'19_t1 = [eq_arg,eq_list_me], fun [eq_f1,eq_list_f2] xs_arg k ->
    let lam_88_47'22_t1 = [eq_f1,eq_list_f2,xs_arg], fun [eq_f1,eq_list_f2,xs_f3] ys_arg k ->
      match xs_f3 with
      | Nil0 ->
        match ys_arg with
        | Nil0 ->
          let con_80_49'33_t1 = true1 in
          k con_80_49'33_t1
        | Cons1(__t1,__t2) ->
          let con_81_49'48_t3 = false0 in
          k con_81_49'48_t3
      | Cons1(x_t1,xs_t2) ->
        match ys_arg with
        | Nil0 ->
          let con_82_52'13_t3 = false0 in
          k con_82_52'13_t3
        | Cons1(y_t3,ys_t4) ->
          let k = [eq_f1,eq_list_f2,xs_t2,ys_t4], fun [eq_f1,eq_list_f2,xs_f3,ys_f4] app_83_54'16_arg ->
            match app_83_54'16_arg with
            | true1 ->
              let k = [ys_f4], fun [ys_f1] app_85_54'34_arg -> app_85_54'34_arg ys_f1 k in
              let k = [xs_f3], fun [xs_f1] app_86_54'31_arg -> app_86_54'31_arg xs_f1 k in
              eq_list_f2 eq_f1 k
            | false0 ->
              let con_87_54'45_t1 = false0 in
              k con_87_54'45_t1 in
          let k = [y_t3], fun [y_f1] app_84_54'14_arg -> app_84_54'14_arg y_f1 k in
          eq_f1 x_t1 k in
    k lam_88_47'22_t1 in
  k lam_89_47'19_t1 in
let eq_char_list_g39 = fun a_arg k ->
  let lam_92_56'19_t1 = [a_arg], fun [a_f1] b_arg k ->
    let k = [b_arg], fun [b_f1] app_90_56'39_arg -> app_90_56'39_arg b_f1 k in
    let k = [a_f1], fun [a_f1] app_91_56'31_arg -> app_91_56'31_arg a_f1 k in
    eq_list_g38 eq_char_g8 k in
  k lam_92_56'19_t1 in
let append_g40 = fun append_me xs_arg k ->
  let lam_96_58'18_t1 = [append_me,xs_arg], fun [append_f1,xs_f2] ys_arg k ->
    match xs_f2 with
    | Nil0 -> k ys_arg
    | Cons1(x_t1,xs_t2) ->
      let k = [append_f1,xs_t2,ys_arg], fun [append_f1,xs_f2,ys_f3] app_93_61'18_arg ->
        let k = [app_93_61'18_arg], fun [app_93_61'18_f1] app_94_61'31_arg -> app_93_61'18_f1 app_94_61'31_arg k in
        let k = [ys_f3], fun [ys_f1] app_95_61'28_arg -> app_95_61'28_arg ys_f1 k in
        append_f1 xs_f2 k in
      cons_g37 x_t1 k in
  k lam_96_58'18_t1 in
let loop_g41 = fun loop_me acc_arg k ->
  let lam_100_64'19_t1 = [acc_arg,loop_me], fun [acc_f1,loop_f2] xs_arg k ->
    match xs_arg with
    | Nil0 -> k acc_f1
    | Cons1(x_t1,xs_t2) ->
      let k = [xs_t2], fun [xs_f1] app_97_67'20_arg -> app_97_67'20_arg xs_f1 k in
      let k = [loop_f2], fun [loop_f1] app_98_67'28_arg -> loop_f1 app_98_67'28_arg k in
      let k = [acc_f1], fun [acc_f1] app_99_67'26_arg -> app_99_67'26_arg acc_f1 k in
      cons_g37 x_t1 k in
  k lam_100_64'19_t1 in
let reverse_g42 = fun xs_arg k ->
  let k = [xs_arg], fun [xs_f1] app_101_69'7_arg -> app_101_69'7_arg xs_f1 k in
  let con_102_69'7_t1 = Nil0 in
  loop_g41 con_102_69'7_t1 k in
let map_g43 = fun map_me f_arg k ->
  let lam_108_71'14_t1 = [f_arg,map_me], fun [f_f1,map_f2] xs_arg k ->
    match xs_arg with
    | Nil0 ->
      let con_103_73'10_t1 = Nil0 in
      k con_103_73'10_t1
    | Cons1(x_t1,xs_t2) ->
      let k = [f_f1,map_f2,xs_t2], fun [f_f1,map_f2,xs_f3] app_104_74'17_arg ->
        let k = [app_104_74'17_arg], fun [app_104_74'17_f1] app_106_74'26_arg -> app_104_74'17_f1 app_106_74'26_arg k in
        let k = [xs_f3], fun [xs_f1] app_107_74'24_arg -> app_107_74'24_arg xs_f1 k in
        map_f2 f_f1 k in
      let k = [], fun [] app_105_74'15_arg -> ::_g14 app_105_74'15_arg k in
      f_f1 x_t1 k in
  k lam_108_71'14_t1 in
let lit_109_78'10_g44 = 0 in
let lit_111_79'17_g45 = 1 in
let length_g46 = fun length_me xs_arg k ->
  match xs_arg with
  | Nil0 -> k lit_109_78'10_g44
  | Cons1(__t1,xs_t2) ->
    let k = [length_me,xs_t2], fun [length_f1,xs_f2] app_110_79'17_arg ->
      let k = [app_110_79'17_arg], fun [app_110_79'17_f1] app_112_79'27_arg -> app_110_79'17_f1 app_112_79'27_arg k in
      length_f1 xs_f2 k in
    +_g1 lit_111_79'17_g45 k in
let lit_113_82'17_g47 = '0' in
let lit_118_85'11_g48 = 0 in
let lit_125_86'35_g49 = 10 in
let lit_128_86'48_g50 = 10 in
let lit_132_88'9_g51 = 0 in
let lit_134_88'21_g52 = '0' in
let chars_of_int_g53 = fun i_arg k ->
  let k = [i_arg], fun [i_f1] ord0_arg ->
    let char_of_digit_t1 = [ord0_arg], fun [ord0_f1] c_arg k ->
      let k = [], fun [] app_114_83'36_arg -> chr_g10 app_114_83'36_arg k in
      let k = [c_arg], fun [c_f1] app_115_83'34_arg -> app_115_83'34_arg c_f1 k in
      +_g1 ord0_f1 k in
    let loop_t2 = [char_of_digit_t1], fun [char_of_digit_f1] loop_me acc_arg k ->
      let lam_129_84'19_t1 = [acc_arg,char_of_digit_f1,loop_me], fun [acc_f1,char_of_digit_f2,loop_f3] i_arg k ->
        let k = [acc_f1,char_of_digit_f2,i_arg,loop_f3], fun [acc_f1,char_of_digit_f2,i_f3,loop_f4] app_116_85'11_arg ->
          match app_116_85'11_arg with
          | true1 -> k acc_f1
          | false0 ->
            let k = [i_f3], fun [i_f1] app_119_86'11_arg ->
              let k = [app_119_86'11_arg], fun [app_119_86'11_f1] app_126_86'48_arg -> app_119_86'11_f1 app_126_86'48_arg k in
              let k = [], fun [] app_127_86'47_arg -> app_127_86'47_arg lit_128_86'48_g50 k in
              /_g4 i_f1 k in
            let k = [loop_f4], fun [loop_f1] app_120_86'40_arg -> loop_f1 app_120_86'40_arg k in
            let k = [acc_f1], fun [acc_f1] app_121_86'17_arg -> app_121_86'17_arg acc_f1 k in
            let k = [], fun [] app_122_86'32_arg -> cons_g37 app_122_86'32_arg k in
            let k = [char_of_digit_f2], fun [char_of_digit_f1] app_123_86'35_arg -> char_of_digit_f1 app_123_86'35_arg k in
            let k = [], fun [] app_124_86'34_arg -> app_124_86'34_arg lit_125_86'35_g49 k in
            %_g5 i_f3 k in
        let k = [], fun [] app_117_85'9_arg -> app_117_85'9_arg lit_118_85'11_g48 k in
        =_g7 i_arg k in
      k lam_129_84'19_t1 in
    let k = [i_f1,loop_t2], fun [i_f1,loop_f2] app_130_88'9_arg ->
      match app_130_88'9_arg with
      | true1 ->
        let k = [], fun [] app_133_88'21_arg ->
          let con_135_88'25_t1 = Nil0 in
          app_133_88'21_arg con_135_88'25_t1 k in
        cons_g37 lit_134_88'21_g52 k
      | false0 ->
        let k = [i_f1], fun [i_f1] app_136_88'38_arg -> app_136_88'38_arg i_f1 k in
        let con_137_88'38_t1 = Nil0 in
        loop_f2 con_137_88'38_t1 k in
    let k = [], fun [] app_131_88'7_arg -> app_131_88'7_arg lit_132_88'9_g51 k in
    =_g7 i_f1 k in
  ord_g9 lit_113_82'17_g47 k in
let put_chars_g54 = fun put_chars_me xs_arg k ->
  match xs_arg with
  | Nil0 ->
    let con_138_92'10_t1 = Unit0 in
    k con_138_92'10_t1
  | Cons1(x_t1,xs_t2) ->
    let k = [put_chars_me,xs_t2], fun [put_chars_f1,xs_f2] __arg -> put_chars_f1 xs_f2 k in
    put_char_g25 x_t1 k in
let put_string_g55 = fun s_arg k ->
  let k = [], fun [] app_139_95'38_arg -> put_chars_g54 app_139_95'38_arg k in
  explode_g11 s_arg k in
let put_int_g56 = fun i_arg k ->
  let k = [], fun [] app_140_97'40_arg -> put_chars_g54 app_140_97'40_arg k in
  chars_of_int_g53 i_arg k in
let lit_141_99'26_g57 = '\n' in
let newline_g58 = fun __arg k -> put_char_g25 lit_141_99'26_g57 k in
let put_string_newline_g59 = fun s_arg k ->
  let k = [], fun [] __arg ->
    let con_142_103'10_t1 = Unit0 in
    newline_g58 con_142_103'10_t1 k in
  put_string_g55 s_arg k in
let lit_143_106'21_g60 = 4 in
let lit_147_110'17_g61 = '\n' in
let lit_156_112'15_g62 = 127 in
let lit_159_113'17_g63 = 127 in
let lit_163_117'28_g64 = 26 in
let read_line_g65 = fun __arg k ->
  let k = [], fun [] controlD_arg ->
    let loop_t1 = [controlD_arg], fun [controlD_f1] loop_me acc_arg k ->
      let k = [acc_arg,controlD_f1,loop_me], fun [acc_f1,controlD_f2,loop_f3] c_arg ->
        let k = [acc_f1,c_arg,controlD_f2,loop_f3], fun [acc_f1,c_f2,controlD_f3,loop_f4] n_arg ->
          let k = [acc_f1,c_f2,controlD_f3,loop_f4,n_arg], fun [acc_f1,c_f2,controlD_f3,loop_f4,n_f5] app_145_110'17_arg ->
            match app_145_110'17_arg with
            | true1 ->
              let k = [acc_f1], fun [acc_f1] __arg -> reverse_g42 acc_f1 k in
              let con_148_110'35_t1 = Unit0 in
              newline_g58 con_148_110'35_t1 k
            | false0 ->
              let k = [acc_f1,c_f2,controlD_f3,loop_f4,n_f5], fun [acc_f1,c_f2,controlD_f3,loop_f4,n_f5] app_149_111'19_arg ->
                match app_149_111'19_arg with
                | true1 ->
                  let k = [acc_f1,controlD_f3], fun [acc_f1,controlD_f2] __arg ->
                    let k = [acc_f1,controlD_f2], fun [acc_f1,controlD_f2] __arg ->
                      let k = [], fun [] app_152_111'78_arg -> reverse_g42 app_152_111'78_arg k in
                      let k = [acc_f1], fun [acc_f1] app_153_111'75_arg -> app_153_111'75_arg acc_f1 k in
                      ::_g14 controlD_f2 k in
                    let con_151_111'53_t1 = Unit0 in
                    newline_g58 con_151_111'53_t1 k in
                  put_char_g25 c_f2 k
                | false0 ->
                  let k = [acc_f1,c_f2,loop_f4,n_f5], fun [acc_f1,c_f2,loop_f3,n_f4] app_154_112'15_arg ->
                    match app_154_112'15_arg with
                    | true1 -> loop_f3 acc_f1 k
                    | false0 ->
                      let k = [acc_f1,c_f2,loop_f3], fun [acc_f1,c_f2,loop_f3] app_157_113'17_arg ->
                        match app_157_113'17_arg with
                        | true1 ->
                          match acc_f1 with
                          | Nil0 -> loop_f3 acc_f1 k
                          | Cons1(c_t1,tail_t2) ->
                            let k = [loop_f3,tail_t2], fun [loop_f1,tail_f2] __arg ->
                              let k = [loop_f1,tail_f2], fun [loop_f1,tail_f2] __arg -> loop_f1 tail_f2 k in
                              let con_166_118'25_t1 = Unit0 in
                              erase_char_g28 con_166_118'25_t1 k in
                            let k = [], fun [] app_160_117'28_arg ->
                              match app_160_117'28_arg with
                              | true1 ->
                                let con_164_117'47_t1 = Unit0 in
                                erase_char_g28 con_164_117'47_t1 k
                              | false0 ->
                                let con_165_117'55_t1 = Unit0 in
                                k con_165_117'55_t1 in
                            let k = [], fun [] app_161_117'25_arg -> app_161_117'25_arg lit_163_117'28_g64 k in
                            let k = [], fun [] app_162_117'23_arg -> <=_g17 app_162_117'23_arg k in
                            ord_g9 c_t1 k
                        | false0 ->
                          let k = [acc_f1,c_f2,loop_f3], fun [acc_f1,c_f2,loop_f3] __arg ->
                            let k = [loop_f3], fun [loop_f1] app_167_121'38_arg -> loop_f1 app_167_121'38_arg k in
                            let k = [acc_f1], fun [acc_f1] app_168_121'36_arg -> app_168_121'36_arg acc_f1 k in
                            cons_g37 c_f2 k in
                          put_char_g25 c_f2 k in
                      let k = [], fun [] app_158_113'15_arg -> app_158_113'15_arg lit_159_113'17_g63 k in
                      =_g7 n_f4 k in
                  let k = [], fun [] app_155_112'13_arg -> app_155_112'13_arg lit_156_112'15_g62 k in
                  >_g16 n_f5 k in
              let k = [controlD_f3], fun [controlD_f1] app_150_111'17_arg -> app_150_111'17_arg controlD_f1 k in
              eq_char_g8 c_f2 k in
          let k = [], fun [] app_146_110'15_arg -> app_146_110'15_arg lit_147_110'17_g61 k in
          eq_char_g8 c_f2 k in
        ord_g9 c_arg k in
      let con_144_108'21_t1 = Unit0 in
      get_char_g13 con_144_108'21_t1 k in
    let con_169_123'7_t2 = Nil0 in
    loop_t1 con_169_123'7_t2 k in
  chr_g10 lit_143_106'21_g60 k in
let lit_172_127'9_g66 = 2 in
let lit_177_127'30_g67 = 1 in
let lit_181_127'42_g68 = 2 in
let fib_g69 = fun fib_me n_arg k ->
  let k = [fib_me,n_arg], fun [fib_f1,n_f2] app_170_127'9_arg ->
    match app_170_127'9_arg with
    | true1 -> k n_f2
    | false0 ->
      let k = [fib_f1,n_f2], fun [fib_f1,n_f2] app_173_127'33_arg ->
        let k = [app_173_127'33_arg], fun [app_173_127'33_f1] app_178_127'39_arg -> app_173_127'33_f1 app_178_127'39_arg k in
        let k = [fib_f1], fun [fib_f1] app_179_127'42_arg -> fib_f1 app_179_127'42_arg k in
        let k = [], fun [] app_180_127'41_arg -> app_180_127'41_arg lit_181_127'42_g68 k in
        -_g2 n_f2 k in
      let k = [], fun [] app_174_127'27_arg -> +_g1 app_174_127'27_arg k in
      let k = [fib_f1], fun [fib_f1] app_175_127'30_arg -> fib_f1 app_175_127'30_arg k in
      let k = [], fun [] app_176_127'29_arg -> app_176_127'29_arg lit_177_127'30_g67 k in
      -_g2 n_f2 k in
  let k = [], fun [] app_171_127'7_arg -> app_171_127'7_arg lit_172_127'9_g66 k in
  <_g6 n_arg k in
let lit_184_131'10_g70 = 2 in
let lit_189_131'25_g71 = 1 in
let lit_190_131'37_g72 = 1 in
let fact_g73 = fun fact_me n_arg k ->
  let k = [fact_me,n_arg], fun [fact_f1,n_f2] app_182_131'10_arg ->
    match app_182_131'10_arg with
    | true1 ->
      let k = [n_f2], fun [n_f1] app_185_131'28_arg -> app_185_131'28_arg n_f1 k in
      let k = [], fun [] app_186_131'22_arg -> ( * )_g3 app_186_131'22_arg k in
      let k = [fact_f1], fun [fact_f1] app_187_131'25_arg -> fact_f1 app_187_131'25_arg k in
      let k = [], fun [] app_188_131'24_arg -> app_188_131'24_arg lit_189_131'25_g71 k in
      -_g2 n_f2 k
    | false0 -> k lit_190_131'37_g72 in
  let k = [], fun [] app_183_131'7_arg -> app_183_131'7_arg lit_184_131'10_g70 k in
  >=_g18 n_arg k in
let lit_191_133'25_g74 = "ERROR: " in
let error_g75 = fun s_arg k ->
  let k = [s_arg], fun [s_f1] __arg ->
    let k = [], fun [] __arg ->
      let con_192_133'58_t1 = Unit0 in
      newline_g58 con_192_133'58_t1 k in
    put_string_g55 s_f1 k in
  put_string_g55 lit_191_133'25_g74 k in
let lit_193_136'13_g76 = "fib: " in
let lit_194_138'16_g77 = "expected an argument" in
let lit_195_141'21_g78 = "expected exactly one argument" in
let lit_197_144'24_g79 = "expected arg1 to be numeric" in
let lit_198_148'22_g80 = " --> " in
let runfib_g81 = fun args_arg k ->
  let k = [args_arg], fun [args_f1] __arg ->
    match args_f1 with
    | Nil0 -> error_g75 lit_194_138'16_g77 k
    | Cons1(arg1_t1,more_t2) ->
      match more_t2 with
      | Cons1(__t3,__t4) -> error_g75 lit_195_141'21_g78 k
      | Nil0 ->
        let k = [], fun [] app_196_143'24_arg ->
          match app_196_143'24_arg with
          | None1 -> error_g75 lit_197_144'24_g79 k
          | Some0(n_t1) ->
            let k = [n_t1], fun [n_f1] res_arg ->
              let k = [res_arg], fun [res_f1] __arg ->
                let k = [res_f1], fun [res_f1] __arg ->
                  let k = [], fun [] __arg ->
                    let con_199_150'19_t1 = Unit0 in
                    newline_g58 con_199_150'19_t1 k in
                  put_int_g56 res_f1 k in
                put_string_g55 lit_198_148'22_g80 k in
              put_int_g56 n_f1 k in
            fib_g69 n_t1 k in
        parse_num_g36 arg1_t1 k in
  put_string_g55 lit_193_136'13_g76 k in
let lit_200_153'13_g82 = "fact: " in
let lit_201_155'16_g83 = "expected an argument" in
let lit_202_158'21_g84 = "expected exactly one argument" in
let lit_204_161'24_g85 = "expected arg1 to be numeric" in
let lit_205_165'22_g86 = " --> " in
let runfact_g87 = fun args_arg k ->
  let k = [args_arg], fun [args_f1] __arg ->
    match args_f1 with
    | Nil0 -> error_g75 lit_201_155'16_g83 k
    | Cons1(arg1_t1,more_t2) ->
      match more_t2 with
      | Cons1(__t3,__t4) -> error_g75 lit_202_158'21_g84 k
      | Nil0 ->
        let k = [], fun [] app_203_160'24_arg ->
          match app_203_160'24_arg with
          | None1 -> error_g75 lit_204_161'24_g85 k
          | Some0(n_t1) ->
            let k = [n_t1], fun [n_f1] res_arg ->
              let k = [res_arg], fun [res_f1] __arg ->
                let k = [res_f1], fun [res_f1] __arg ->
                  let k = [], fun [] __arg ->
                    let con_206_167'19_t1 = Unit0 in
                    newline_g58 con_206_167'19_t1 k in
                  put_int_g56 res_f1 k in
                put_string_g55 lit_205_165'22_g86 k in
              put_int_g56 n_f1 k in
            fact_g73 n_t1 k in
        parse_num_g36 arg1_t1 k in
  put_string_g55 lit_200_153'13_g82 k in
let lit_209_170'26_g88 = 4 in
let lit_219_182'18_g89 = "rev: expected no arguments" in
let lit_220_184'24_g90 = "(reverse typed lines until ^D)" in
let lit_225_188'48_g91 = 'o' in
let lit_226_188'57_g92 = '*' in
let lam_222_188'30_g93 = fun c_arg k ->
  let k = [c_arg], fun [c_f1] app_223_188'48_arg ->
    match app_223_188'48_arg with
    | true1 -> k lit_226_188'57_g92
    | false0 -> k c_f1 in
  let k = [], fun [] app_224_188'46_arg -> app_224_188'46_arg lit_225_188'48_g91 k in
  eq_char_g8 c_arg k in
let lit_230_190'29_g94 = "You wrote: " in
let lit_232_191'11_g95 = ' ' in
let lit_233_192'11_g96 = '{' in
let lit_234_194'11_g97 = '}' in
let fallback_g98 = fun line_arg k ->
  let k = [line_arg], fun [line_f1] star_the_ohs_arg ->
    let k = [line_f1,star_the_ohs_arg], fun [line_f1,star_the_ohs_f2] n_arg ->
      let k = [n_arg], fun [n_f1] __arg ->
        let k = [n_f1], fun [n_f1] __arg ->
          let k = [n_f1], fun [n_f1] __arg ->
            let k = [], fun [] __arg ->
              let k = [], fun [] __arg ->
                let con_235_195'10_t1 = Unit0 in
                newline_g58 con_235_195'10_t1 k in
              put_char_g25 lit_234_194'11_g97 k in
            put_int_g56 n_f1 k in
          put_char_g25 lit_233_192'11_g96 k in
        put_char_g25 lit_232_191'11_g95 k in
      let k = [], fun [] app_227_190'44_arg -> put_chars_g54 app_227_190'44_arg k in
      let k = [line_f1,star_the_ohs_f2], fun [line_f1,star_the_ohs_f2] app_228_190'20_arg ->
        let k = [app_228_190'20_arg], fun [app_228_190'20_f1] app_231_190'58_arg -> app_228_190'20_f1 app_231_190'58_arg k in
        star_the_ohs_f2 line_f1 k in
      let k = [], fun [] app_229_190'29_arg -> append_g40 app_229_190'29_arg k in
      explode_g11 lit_230_190'29_g94 k in
    length_g46 line_f1 k in
  map_g43 lam_222_188'30_g93 k in
let lit_241_203'20_g99 = ' ' in
let loop_g100 = fun loop_me accWs_arg k ->
  let lam_253_198'21_t1 = [accWs_arg,loop_me], fun [accWs_f1,loop_f2] accCs_arg k ->
    let lam_252_198'27_t1 = [accCs_arg,accWs_f1,loop_f2], fun [accCs_f1,accWs_f2,loop_f3] xs_arg k ->
      match xs_arg with
      | Nil0 ->
        let k = [], fun [] app_236_200'38_arg -> reverse_g42 app_236_200'38_arg k in
        let k = [accWs_f2], fun [accWs_f1] app_237_200'35_arg -> app_237_200'35_arg accWs_f1 k in
        let k = [], fun [] app_238_200'29_arg -> ::_g14 app_238_200'29_arg k in
        reverse_g42 accCs_f1 k
      | Cons1(x_t1,xs_t2) ->
        let k = [accCs_f1,accWs_f2,loop_f3,x_t1,xs_t2], fun [accCs_f1,accWs_f2,loop_f3,x_f4,xs_f5] app_239_203'20_arg ->
          match app_239_203'20_arg with
          | true1 ->
            let k = [xs_f5], fun [xs_f1] app_242_203'59_arg -> app_242_203'59_arg xs_f1 k in
            let k = [], fun [] app_243_203'34_arg ->
              let con_247_203'59_t1 = Nil0 in
              app_243_203'34_arg con_247_203'59_t1 k in
            let k = [loop_f3], fun [loop_f1] app_244_203'52_arg -> loop_f1 app_244_203'52_arg k in
            let k = [accWs_f2], fun [accWs_f1] app_245_203'49_arg -> app_245_203'49_arg accWs_f1 k in
            let k = [], fun [] app_246_203'43_arg -> ::_g14 app_246_203'43_arg k in
            reverse_g42 accCs_f1 k
          | false0 ->
            let k = [xs_f5], fun [xs_f1] app_248_204'23_arg -> app_248_204'23_arg xs_f1 k in
            let k = [accCs_f1,x_f4], fun [accCs_f1,x_f2] app_249_204'17_arg ->
              let k = [app_249_204'17_arg], fun [app_249_204'17_f1] app_250_204'27_arg -> app_249_204'17_f1 app_250_204'27_arg k in
              let k = [accCs_f1], fun [accCs_f1] app_251_204'25_arg -> app_251_204'25_arg accCs_f1 k in
              ::_g14 x_f2 k in
            loop_f3 accWs_f2 k in
        let k = [], fun [] app_240_203'18_arg -> app_240_203'18_arg lit_241_203'20_g99 k in
        eq_char_g8 x_t1 k in
    k lam_252_198'27_t1 in
  k lam_253_198'21_t1 in
let split_words_g101 = fun s_arg k ->
  let k = [s_arg], fun [s_f1] app_254_206'10_arg -> app_254_206'10_arg s_f1 k in
  let k = [], fun [] app_255_206'7_arg ->
    let con_257_206'10_t1 = Nil0 in
    app_255_206'7_arg con_257_206'10_t1 k in
  let con_256_206'7_t1 = Nil0 in
  loop_g100 con_256_206'7_t1 k in
let lit_262_213'38_g102 = "fib" in
let lit_266_214'40_g103 = "fact" in
let lit_270_215'42_g104 = "rev" in
let lit_271_219'11_g105 = '>' in
let lit_272_220'11_g106 = ' ' in
let lit_278_226'21_g107 = "This is a shell prototype. Try: fib, fact, rev" in
let k = [], fun [] single_controlD_arg ->
  let rev_t1 = [single_controlD_arg], fun [single_controlD_f1] __arg k ->
    let loop_t1 = [single_controlD_f1], fun [single_controlD_f1] loop_me __arg k ->
      let k = [loop_me,single_controlD_f1], fun [loop_f1,single_controlD_f2] xs_arg ->
        let k = [loop_f1,xs_arg], fun [loop_f1,xs_f2] app_212_175'23_arg ->
          match app_212_175'23_arg with
          | true1 ->
            let con_214_175'44_t1 = Unit0 in
            k con_214_175'44_t1
          | false0 ->
            let k = [loop_f1], fun [loop_f1] __arg ->
              let k = [loop_f1], fun [loop_f1] __arg ->
                let con_217_176'46_t1 = Unit0 in
                loop_f1 con_217_176'46_t1 k in
              let con_216_176'38_t1 = Unit0 in
              newline_g58 con_216_176'38_t1 k in
            let k = [], fun [] app_215_176'26_arg -> put_chars_g54 app_215_176'26_arg k in
            reverse_g42 xs_f2 k in
        let k = [single_controlD_f2], fun [single_controlD_f1] app_213_175'20_arg -> app_213_175'20_arg single_controlD_f1 k in
        eq_char_list_g39 xs_arg k in
      let con_211_174'23_t1 = Unit0 in
      read_line_g65 con_211_174'23_t1 k in
    let con_218_178'6_t2 = Unit0 in
    loop_t1 con_218_178'6_t2 k in
  let runrev_t2 = [rev_t1], fun [rev_f1] args_arg k ->
    match args_arg with
    | Cons1(__t1,__t2) -> error_g75 lit_219_182'18_g89 k
    | Nil0 ->
      let k = [rev_f1], fun [rev_f1] __arg ->
        let con_221_185'8_t1 = Unit0 in
        rev_f1 con_221_185'8_t1 k in
      put_string_newline_g59 lit_220_184'24_g90 k in
  let execute_t3 = [runrev_t2], fun [runrev_f1] line_arg k ->
    let k = [line_arg,runrev_f1], fun [line_f1,runrev_f2] words_arg ->
      match words_arg with
      | Nil0 ->
        let con_258_211'10_t1 = Unit0 in
        k con_258_211'10_t1
      | Cons1(command_t1,args_t2) ->
        let k = [args_t2,command_t1,line_f1,runrev_f2], fun [args_f1,command_f2,line_f3,runrev_f4] app_259_213'29_arg ->
          match app_259_213'29_arg with
          | true1 -> runfib_g81 args_f1 k
          | false0 ->
            let k = [args_f1,command_f2,line_f3,runrev_f4], fun [args_f1,command_f2,line_f3,runrev_f4] app_263_214'31_arg ->
              match app_263_214'31_arg with
              | true1 -> runfact_g87 args_f1 k
              | false0 ->
                let k = [args_f1,line_f3,runrev_f4], fun [args_f1,line_f2,runrev_f3] app_267_215'33_arg ->
                  match app_267_215'33_arg with
                  | true1 -> runrev_f3 args_f1 k
                  | false0 -> fallback_g98 line_f2 k in
                let k = [], fun [] app_268_215'25_arg ->
                  let k = [app_268_215'25_arg], fun [app_268_215'25_f1] app_269_215'42_arg -> app_268_215'25_f1 app_269_215'42_arg k in
                  explode_g11 lit_270_215'42_g104 k in
                eq_char_list_g39 command_f2 k in
            let k = [], fun [] app_264_214'23_arg ->
              let k = [app_264_214'23_arg], fun [app_264_214'23_f1] app_265_214'40_arg -> app_264_214'23_f1 app_265_214'40_arg k in
              explode_g11 lit_266_214'40_g103 k in
            eq_char_list_g39 command_f2 k in
        let k = [], fun [] app_260_213'21_arg ->
          let k = [app_260_213'21_arg], fun [app_260_213'21_f1] app_261_213'38_arg -> app_260_213'21_f1 app_261_213'38_arg k in
          explode_g11 lit_262_213'38_g102 k in
        eq_char_list_g39 command_t1 k in
    split_words_g101 line_arg k in
  let mainloop_t4 = [execute_t3,single_controlD_arg], fun [execute_f1,single_controlD_f2] mainloop_me __arg k ->
    let k = [execute_f1,mainloop_me,single_controlD_f2], fun [execute_f1,mainloop_f2,single_controlD_f3] __arg ->
      let k = [execute_f1,mainloop_f2,single_controlD_f3], fun [execute_f1,mainloop_f2,single_controlD_f3] __arg ->
        let k = [execute_f1,mainloop_f2,single_controlD_f3], fun [execute_f1,mainloop_f2,single_controlD_f3] xs_arg ->
          let k = [execute_f1,mainloop_f2,xs_arg], fun [execute_f1,mainloop_f2,xs_f3] app_274_222'21_arg ->
            match app_274_222'21_arg with
            | true1 ->
              let con_276_222'42_t1 = Unit0 in
              k con_276_222'42_t1
            | false0 ->
              let k = [mainloop_f2], fun [mainloop_f1] __arg ->
                let con_277_223'26_t1 = Unit0 in
                mainloop_f1 con_277_223'26_t1 k in
              execute_f1 xs_f3 k in
          let k = [single_controlD_f3], fun [single_controlD_f1] app_275_222'18_arg -> app_275_222'18_arg single_controlD_f1 k in
          eq_char_list_g39 xs_arg k in
        let con_273_221'21_t1 = Unit0 in
        read_line_g65 con_273_221'21_t1 k in
      put_char_g25 lit_272_220'11_g106 k in
    put_char_g25 lit_271_219'11_g105 k in
  let main_t5 = [mainloop_t4], fun [mainloop_f1] __arg k ->
    let k = [mainloop_f1], fun [mainloop_f1] __arg ->
      let con_279_227'11_t1 = Unit0 in
      mainloop_f1 con_279_227'11_t1 k in
    put_string_newline_g59 lit_278_226'21_g107 k in
  let con_280_0'0_t6 = Unit0 in
  main_t5 con_280_0'0_t6 k in
let k = [], fun [] app_207_170'28_arg ->
  let con_210_170'31_t1 = Nil0 in
  app_207_170'28_arg con_210_170'31_t1 k in
let k = [], fun [] app_208_170'26_arg -> ::_g14 app_208_170'26_arg k in
chr_g10 lit_209_170'26_g88 k
