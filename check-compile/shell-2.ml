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
let not_2'4 = fun [] b_2'8 k ->
  match b_2'8 with
  | true1 ->
    let con_24_4'12 = false0 in
    k con_24_4'12
  | false0 ->
    let con_25_5'13 = true1 in
    k con_25_5'13 in
let >_7'4 = fun [<_0'0] a_7'8 k ->
  let lam_27_7'10 = fun [<_0'0,a_7'8] b_7'10 k ->
    let k [a_7'8] app_26_7'16 = app_26_7'16 a_7'8 k in
    <_0'0 b_7'10 k in
  k lam_27_7'10 in
let <=_8'4 = fun [<_0'0,not_2'4] a_8'9 k ->
  let lam_30_8'11 = fun [<_0'0,not_2'4,a_8'9] b_8'11 k ->
    let k [not_2'4] app_28_8'24 = not_2'4 app_28_8'24 k in
    let k [a_8'9] app_29_8'22 = app_29_8'22 a_8'9 k in
    <_0'0 b_8'11 k in
  k lam_30_8'11 in
let >=_9'4 = fun [<_0'0,not_2'4] a_9'9 k ->
  let lam_33_9'11 = fun [<_0'0,not_2'4,a_9'9] b_9'11 k ->
    let k [not_2'4] app_31_9'24 = not_2'4 app_31_9'24 k in
    let k [b_9'11] app_32_9'22 = app_32_9'22 b_9'11 k in
    <_0'0 a_9'9 k in
  k lam_33_9'11 in
let put_char_12'4 = fun [+_0'0,-_0'0,=_0'0,chr_0'0,eq_char_0'0,ord_0'0,put_char_0'0,>_7'4] c_12'13 k ->
  let backspace_13'6 = 8 in
  let k [+_0'0,-_0'0,=_0'0,chr_0'0,eq_char_0'0,ord_0'0,put_char_0'0,>_7'4,c_12'13,backspace_13'6] n_14'6 =
    let k [+_0'0,-_0'0,chr_0'0,eq_char_0'0,ord_0'0,put_char_0'0,>_7'4,c_12'13,n_14'6] app_34_15'9 =
      match app_34_15'9 with
      | true1 -> put_char_0'0 c_12'13 k
      | false0 ->
        let k [+_0'0,-_0'0,chr_0'0,ord_0'0,put_char_0'0,>_7'4,c_12'13,n_14'6] app_36_16'17 =
          match app_36_16'17 with
          | true1 -> put_char_0'0 c_12'13 k
          | false0 ->
            let k [+_0'0,-_0'0,chr_0'0,ord_0'0,put_char_0'0,c_12'13,n_14'6] app_39_17'13 =
              match app_39_17'13 with
              | true1 -> put_char_0'0 c_12'13 k
              | false0 ->
                let k [+_0'0,-_0'0,chr_0'0,ord_0'0,put_char_0'0,n_14'6] __18'21 =
                  let k [put_char_0'0] app_43_18'37 = put_char_0'0 app_43_18'37 k in
                  let k [chr_0'0] app_44_18'52 = chr_0'0 app_44_18'52 k in
                  let k [] app_45_18'50 =
                    let lit_50_18'52 = 1 in
                    app_45_18'50 lit_50_18'52 k in
                  let k [-_0'0] app_46_18'48 = -_0'0 app_46_18'48 k in
                  let k [n_14'6] app_47_18'46 = app_47_18'46 n_14'6 k in
                  let k [+_0'0] app_48_18'42 = +_0'0 app_48_18'42 k in
                  let lit_49_18'42 = 'A' in
                  ord_0'0 lit_49_18'42 k in
                let lit_42_18'18 = '^' in
                put_char_0'0 lit_42_18'18 k in
            let k [] app_40_17'11 =
              let lit_41_17'13 = 26 in
              app_40_17'11 lit_41_17'13 k in
            >_7'4 n_14'6 k in
        let k [] app_37_16'15 =
          let lit_38_16'17 = '\n' in
          app_37_16'15 lit_38_16'17 k in
        eq_char_0'0 c_12'13 k in
    let k [backspace_13'6] app_35_15'7 = app_35_15'7 backspace_13'6 k in
    =_0'0 n_14'6 k in
  ord_0'0 c_12'13 k in
let erase_char_20'4 = fun [chr_0'0,put_char_12'4] __20'15 k ->
  let k [put_char_12'4] backspace_21'6 =
    let k [put_char_12'4,backspace_21'6] __23'20 =
      let k [put_char_12'4,backspace_21'6] __24'14 = put_char_12'4 backspace_21'6 k in
      let lit_52_24'11 = ' ' in
      put_char_12'4 lit_52_24'11 k in
    put_char_12'4 backspace_21'6 k in
  let lit_51_21'22 = 8 in
  chr_0'0 lit_51_21'22 k in
let parse_digit_29'4 = fun [-_0'0,ord_0'0,<=_8'4,>=_9'4] c_29'16 k ->
  let k [<=_8'4,>=_9'4] n_30'6 =
    let k [<=_8'4,n_30'6] app_57_32'10 =
      match app_57_32'10 with
      | true1 ->
        let k [n_30'6] app_60_32'25 =
          match app_60_32'25 with
          | true1 ->
            let con_63_32'32 = Some0[n_30'6] in
            k con_63_32'32
          | false0 ->
            let con_64_32'45 = None1 in
            k con_64_32'45 in
        let k [] app_61_32'22 =
          let lit_62_32'25 = 9 in
          app_61_32'22 lit_62_32'25 k in
        <=_8'4 n_30'6 k
      | false0 ->
        let con_65_32'55 = None1 in
        k con_65_32'55 in
    let k [] app_58_32'7 =
      let lit_59_32'10 = 0 in
      app_58_32'7 lit_59_32'10 k in
    >=_9'4 n_30'6 k in
  let k [ord_0'0] app_53_30'16 =
    let k [app_53_30'16] app_55_30'22 = app_53_30'16 app_55_30'22 k in
    let lit_56_30'22 = '0' in
    ord_0'0 lit_56_30'22 k in
  let k [-_0'0] app_54_30'14 = -_0'0 app_54_30'14 k in
  ord_0'0 c_29'16 k in
let parse_num_34'4 = fun [( * )_0'0,+_0'0,parse_digit_29'4] s_34'14 k ->
  let loop_35'10 = fix (fun [( * )_0'0,+_0'0,parse_digit_29'4] loop_35'10 acc_35'15 k ->
    let lam_75_35'19 = fun [( * )_0'0,+_0'0,parse_digit_29'4,loop_35'10,acc_35'15] xs_35'19 k ->
      match xs_35'19 with
      | Nil0 ->
        let con_66_37'12 = Some0[acc_35'15] in
        k con_66_37'12
      | Cons1(x_38'6,xs_38'9) ->
        let k [( * )_0'0,+_0'0,loop_35'10,acc_35'15,xs_38'9] app_67_39'26 =
          match app_67_39'26 with
          | None1 ->
            let con_68_40'18 = None1 in
            k con_68_40'18
          | Some0(d_41'15) ->
            let k [xs_38'9] app_69_41'25 = app_69_41'25 xs_38'9 k in
            let k [loop_35'10] app_70_41'37 = loop_35'10 app_70_41'37 k in
            let k [d_41'15] app_71_41'35 = app_71_41'35 d_41'15 k in
            let k [+_0'0] app_72_41'31 = +_0'0 app_72_41'31 k in
            let k [acc_35'15] app_73_41'29 = app_73_41'29 acc_35'15 k in
            let lit_74_41'26 = 10 in
            ( * )_0'0 lit_74_41'26 k in
        parse_digit_29'4 x_38'6 k in
    k lam_75_35'19) in
  let k [s_34'14] app_76_43'7 = app_76_43'7 s_34'14 k in
  let lit_77_43'7 = 0 in
  loop_35'10 lit_77_43'7 k in
let cons_45'4 = fun [::_0'0] x_45'9 k ->
  let lam_79_45'11 = fun [::_0'0,x_45'9] xs_45'11 k ->
    let k [xs_45'11] app_78_45'18 = app_78_45'18 xs_45'11 k in
    ::_0'0 x_45'9 k in
  k lam_79_45'11 in
let eq_list_47'8 = fix (fun [] eq_list_47'8 eq_47'16 k ->
  let lam_89_47'19 = fun [eq_list_47'8,eq_47'16] xs_47'19 k ->
    let lam_88_47'22 = fun [eq_list_47'8,eq_47'16,xs_47'19] ys_47'22 k ->
      match xs_47'19 with
      | Nil0 ->
        match ys_47'22 with
        | Nil0 ->
          let con_80_49'33 = true1 in
          k con_80_49'33
        | Cons1(__49'40,__49'43) ->
          let con_81_49'48 = false0 in
          k con_81_49'48
      | Cons1(x_50'4,xs_50'7) ->
        match ys_47'22 with
        | Nil0 ->
          let con_82_52'13 = false0 in
          k con_82_52'13
        | Cons1(y_53'7,ys_53'10) ->
          let k [eq_list_47'8,eq_47'16,xs_50'7,ys_53'10] app_83_54'16 =
            match app_83_54'16 with
            | true1 ->
              let k [ys_53'10] app_85_54'34 = app_85_54'34 ys_53'10 k in
              let k [xs_50'7] app_86_54'31 = app_86_54'31 xs_50'7 k in
              eq_list_47'8 eq_47'16 k
            | false0 ->
              let con_87_54'45 = false0 in
              k con_87_54'45 in
          let k [y_53'7] app_84_54'14 = app_84_54'14 y_53'7 k in
          eq_47'16 x_50'4 k in
    k lam_88_47'22 in
  k lam_89_47'19) in
let eq_char_list_56'4 = fun [eq_char_0'0,eq_list_47'8] a_56'17 k ->
  let lam_92_56'19 = fun [eq_char_0'0,eq_list_47'8,a_56'17] b_56'19 k ->
    let k [b_56'19] app_90_56'39 = app_90_56'39 b_56'19 k in
    let k [a_56'17] app_91_56'31 = app_91_56'31 a_56'17 k in
    eq_list_47'8 eq_char_0'0 k in
  k lam_92_56'19 in
let append_58'8 = fix (fun [cons_45'4] append_58'8 xs_58'15 k ->
  let lam_96_58'18 = fun [cons_45'4,append_58'8,xs_58'15] ys_58'18 k ->
    match xs_58'15 with
    | Nil0 -> k ys_58'18
    | Cons1(x_61'4,xs_61'7) ->
      let k [append_58'8,ys_58'18,xs_61'7] app_93_61'18 =
        let k [app_93_61'18] app_94_61'31 = app_93_61'18 app_94_61'31 k in
        let k [ys_58'18] app_95_61'28 = app_95_61'28 ys_58'18 k in
        append_58'8 xs_61'7 k in
      cons_45'4 x_61'4 k in
  k lam_96_58'18) in
let reverse_63'4 = fun [cons_45'4] xs_63'12 k ->
  let loop_64'10 = fix (fun [cons_45'4] loop_64'10 acc_64'15 k ->
    let lam_100_64'19 = fun [cons_45'4,loop_64'10,acc_64'15] xs_64'19 k ->
      match xs_64'19 with
      | Nil0 -> k acc_64'15
      | Cons1(x_67'6,xs_67'9) ->
        let k [xs_67'9] app_97_67'20 = app_97_67'20 xs_67'9 k in
        let k [loop_64'10] app_98_67'28 = loop_64'10 app_98_67'28 k in
        let k [acc_64'15] app_99_67'26 = app_99_67'26 acc_64'15 k in
        cons_45'4 x_67'6 k in
    k lam_100_64'19) in
  let k [xs_63'12] app_101_69'7 = app_101_69'7 xs_63'12 k in
  let con_102_69'7 = Nil0 in
  loop_64'10 con_102_69'7 k in
let map_71'8 = fix (fun [::_0'0] map_71'8 f_71'12 k ->
  let lam_108_71'14 = fun [::_0'0,map_71'8,f_71'12] xs_71'14 k ->
    match xs_71'14 with
    | Nil0 ->
      let con_103_73'10 = Nil0 in
      k con_103_73'10
    | Cons1(x_74'4,xs_74'7) ->
      let k [map_71'8,f_71'12,xs_74'7] app_104_74'17 =
        let k [app_104_74'17] app_106_74'26 = app_104_74'17 app_106_74'26 k in
        let k [xs_74'7] app_107_74'24 = app_107_74'24 xs_74'7 k in
        map_71'8 f_71'12 k in
      let k [::_0'0] app_105_74'15 = ::_0'0 app_105_74'15 k in
      f_71'12 x_74'4 k in
  k lam_108_71'14) in
let length_76'8 = fix (fun [+_0'0] length_76'8 xs_76'15 k ->
  match xs_76'15 with
  | Nil0 ->
    let lit_109_78'10 = 0 in
    k lit_109_78'10
  | Cons1(__79'4,xs_79'7) ->
    let k [length_76'8,xs_79'7] app_110_79'17 =
      let k [app_110_79'17] app_112_79'27 = app_110_79'17 app_112_79'27 k in
      length_76'8 xs_79'7 k in
    let lit_111_79'17 = 1 in
    +_0'0 lit_111_79'17 k) in
let chars_of_int_81'4 = fun [%_0'0,+_0'0,/_0'0,=_0'0,chr_0'0,ord_0'0,cons_45'4] i_81'17 k ->
  let k [%_0'0,+_0'0,/_0'0,=_0'0,chr_0'0,cons_45'4,i_81'17] ord0_82'6 =
    let char_of_digit_83'6 = fun [+_0'0,chr_0'0,ord0_82'6] c_83'20 k ->
      let k [chr_0'0] app_114_83'36 = chr_0'0 app_114_83'36 k in
      let k [c_83'20] app_115_83'34 = app_115_83'34 c_83'20 k in
      +_0'0 ord0_82'6 k in
    let loop_84'10 = fix (fun [%_0'0,/_0'0,=_0'0,cons_45'4,char_of_digit_83'6] loop_84'10 acc_84'15 k ->
      let lam_129_84'19 = fun [%_0'0,/_0'0,=_0'0,cons_45'4,char_of_digit_83'6,loop_84'10,acc_84'15] i_84'19 k ->
        let k [%_0'0,/_0'0,cons_45'4,char_of_digit_83'6,loop_84'10,acc_84'15,i_84'19] app_116_85'11 =
          match app_116_85'11 with
          | true1 -> k acc_84'15
          | false0 ->
            let k [/_0'0,i_84'19] app_119_86'11 =
              let k [app_119_86'11] app_126_86'48 = app_119_86'11 app_126_86'48 k in
              let k [] app_127_86'47 =
                let lit_128_86'48 = 10 in
                app_127_86'47 lit_128_86'48 k in
              /_0'0 i_84'19 k in
            let k [loop_84'10] app_120_86'40 = loop_84'10 app_120_86'40 k in
            let k [acc_84'15] app_121_86'17 = app_121_86'17 acc_84'15 k in
            let k [cons_45'4] app_122_86'32 = cons_45'4 app_122_86'32 k in
            let k [char_of_digit_83'6] app_123_86'35 = char_of_digit_83'6 app_123_86'35 k in
            let k [] app_124_86'34 =
              let lit_125_86'35 = 10 in
              app_124_86'34 lit_125_86'35 k in
            %_0'0 i_84'19 k in
        let k [] app_117_85'9 =
          let lit_118_85'11 = 0 in
          app_117_85'9 lit_118_85'11 k in
        =_0'0 i_84'19 k in
      k lam_129_84'19) in
    let k [cons_45'4,i_81'17,loop_84'10] app_130_88'9 =
      match app_130_88'9 with
      | true1 ->
        let k [] app_133_88'21 =
          let con_135_88'25 = Nil0 in
          app_133_88'21 con_135_88'25 k in
        let lit_134_88'21 = '0' in
        cons_45'4 lit_134_88'21 k
      | false0 ->
        let k [i_81'17] app_136_88'38 = app_136_88'38 i_81'17 k in
        let con_137_88'38 = Nil0 in
        loop_84'10 con_137_88'38 k in
    let k [] app_131_88'7 =
      let lit_132_88'9 = 0 in
      app_131_88'7 lit_132_88'9 k in
    =_0'0 i_81'17 k in
  let lit_113_82'17 = '0' in
  ord_0'0 lit_113_82'17 k in
let put_chars_90'8 = fix (fun [put_char_12'4] put_chars_90'8 xs_90'18 k ->
  match xs_90'18 with
  | Nil0 ->
    let con_138_92'10 = Unit0 in
    k con_138_92'10
  | Cons1(x_93'4,xs_93'7) ->
    let k [put_chars_90'8,xs_93'7] __93'23 = put_chars_90'8 xs_93'7 k in
    put_char_12'4 x_93'4 k) in
let put_string_95'4 = fun [explode_0'0,put_chars_90'8] s_95'15 k ->
  let k [put_chars_90'8] app_139_95'38 = put_chars_90'8 app_139_95'38 k in
  explode_0'0 s_95'15 k in
let put_int_97'4 = fun [chars_of_int_81'4,put_chars_90'8] i_97'12 k ->
  let k [put_chars_90'8] app_140_97'40 = put_chars_90'8 app_140_97'40 k in
  chars_of_int_81'4 i_97'12 k in
let newline_99'4 = fun [put_char_12'4] __99'12 k ->
  let lit_141_99'26 = '\n' in
  put_char_12'4 lit_141_99'26 k in
let put_string_newline_101'4 = fun [put_string_95'4,newline_99'4] s_101'23 k ->
  let k [newline_99'4] __102'14 =
    let con_142_103'10 = Unit0 in
    newline_99'4 con_142_103'10 k in
  put_string_95'4 s_101'23 k in
let read_line_105'4 = fun [::_0'0,=_0'0,chr_0'0,eq_char_0'0,get_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4] __105'14 k ->
  let k [::_0'0,=_0'0,eq_char_0'0,get_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4] controlD_106'6 =
    let loop_107'10 = fix (fun [::_0'0,=_0'0,eq_char_0'0,get_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4,controlD_106'6] loop_107'10 acc_107'15 k ->
      let k [::_0'0,=_0'0,eq_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4,controlD_106'6,loop_107'10,acc_107'15] c_108'8 =
        let k [::_0'0,=_0'0,eq_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4,controlD_106'6,loop_107'10,acc_107'15,c_108'8] n_109'8 =
          let k [::_0'0,=_0'0,eq_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4,controlD_106'6,loop_107'10,acc_107'15,c_108'8,n_109'8] app_145_110'17 =
            match app_145_110'17 with
            | true1 ->
              let k [reverse_63'4,acc_107'15] __110'37 = reverse_63'4 acc_107'15 k in
              let con_148_110'35 = Unit0 in
              newline_99'4 con_148_110'35 k
            | false0 ->
              let k [::_0'0,=_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4,controlD_106'6,loop_107'10,acc_107'15,c_108'8,n_109'8] app_149_111'19 =
                match app_149_111'19 with
                | true1 ->
                  let k [::_0'0,reverse_63'4,newline_99'4,controlD_106'6,acc_107'15] __111'44 =
                    let k [::_0'0,reverse_63'4,controlD_106'6,acc_107'15] __111'55 =
                      let k [reverse_63'4] app_152_111'78 = reverse_63'4 app_152_111'78 k in
                      let k [acc_107'15] app_153_111'75 = app_153_111'75 acc_107'15 k in
                      ::_0'0 controlD_106'6 k in
                    let con_151_111'53 = Unit0 in
                    newline_99'4 con_151_111'53 k in
                  put_char_12'4 c_108'8 k
                | false0 ->
                  let k [=_0'0,ord_0'0,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,loop_107'10,acc_107'15,c_108'8,n_109'8] app_154_112'15 =
                    match app_154_112'15 with
                    | true1 -> loop_107'10 acc_107'15 k
                    | false0 ->
                      let k [ord_0'0,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,loop_107'10,acc_107'15,c_108'8] app_157_113'17 =
                        match app_157_113'17 with
                        | true1 ->
                          match acc_107'15 with
                          | Nil0 -> loop_107'10 acc_107'15 k
                          | Cons1(c_116'14,tail_116'17) ->
                            let k [erase_char_20'4,loop_107'10,tail_116'17] __117'58 =
                              let k [loop_107'10,tail_116'17] __118'27 = loop_107'10 tail_116'17 k in
                              let con_166_118'25 = Unit0 in
                              erase_char_20'4 con_166_118'25 k in
                            let k [erase_char_20'4] app_160_117'28 =
                              match app_160_117'28 with
                              | true1 ->
                                let con_164_117'47 = Unit0 in
                                erase_char_20'4 con_164_117'47 k
                              | false0 ->
                                let con_165_117'55 = Unit0 in
                                k con_165_117'55 in
                            let k [] app_161_117'25 =
                              let lit_163_117'28 = 26 in
                              app_161_117'25 lit_163_117'28 k in
                            let k [<=_8'4] app_162_117'23 = <=_8'4 app_162_117'23 k in
                            ord_0'0 c_116'14 k
                        | false0 ->
                          let k [cons_45'4,loop_107'10,acc_107'15,c_108'8] __121'23 =
                            let k [loop_107'10] app_167_121'38 = loop_107'10 app_167_121'38 k in
                            let k [acc_107'15] app_168_121'36 = app_168_121'36 acc_107'15 k in
                            cons_45'4 c_108'8 k in
                          put_char_12'4 c_108'8 k in
                      let k [] app_158_113'15 =
                        let lit_159_113'17 = 127 in
                        app_158_113'15 lit_159_113'17 k in
                      =_0'0 n_109'8 k in
                  let k [] app_155_112'13 =
                    let lit_156_112'15 = 127 in
                    app_155_112'13 lit_156_112'15 k in
                  >_7'4 n_109'8 k in
              let k [controlD_106'6] app_150_111'17 = app_150_111'17 controlD_106'6 k in
              eq_char_0'0 c_108'8 k in
          let k [] app_146_110'15 =
            let lit_147_110'17 = '\n' in
            app_146_110'15 lit_147_110'17 k in
          eq_char_0'0 c_108'8 k in
        ord_0'0 c_108'8 k in
      let con_144_108'21 = Unit0 in
      get_char_0'0 con_144_108'21 k) in
    let con_169_123'7 = Nil0 in
    loop_107'10 con_169_123'7 k in
  let lit_143_106'21 = 4 in
  chr_0'0 lit_143_106'21 k in
let fib_125'8 = fix (fun [+_0'0,-_0'0,<_0'0] fib_125'8 n_125'12 k ->
  let k [+_0'0,-_0'0,fib_125'8,n_125'12] app_170_127'9 =
    match app_170_127'9 with
    | true1 -> k n_125'12
    | false0 ->
      let k [-_0'0,fib_125'8,n_125'12] app_173_127'33 =
        let k [app_173_127'33] app_178_127'39 = app_173_127'33 app_178_127'39 k in
        let k [fib_125'8] app_179_127'42 = fib_125'8 app_179_127'42 k in
        let k [] app_180_127'41 =
          let lit_181_127'42 = 2 in
          app_180_127'41 lit_181_127'42 k in
        -_0'0 n_125'12 k in
      let k [+_0'0] app_174_127'27 = +_0'0 app_174_127'27 k in
      let k [fib_125'8] app_175_127'30 = fib_125'8 app_175_127'30 k in
      let k [] app_176_127'29 =
        let lit_177_127'30 = 1 in
        app_176_127'29 lit_177_127'30 k in
      -_0'0 n_125'12 k in
  let k [] app_171_127'7 =
    let lit_172_127'9 = 2 in
    app_171_127'7 lit_172_127'9 k in
  <_0'0 n_125'12 k) in
let fact_129'8 = fix (fun [( * )_0'0,-_0'0,>=_9'4] fact_129'8 n_129'13 k ->
  let k [( * )_0'0,-_0'0,fact_129'8,n_129'13] app_182_131'10 =
    match app_182_131'10 with
    | true1 ->
      let k [n_129'13] app_185_131'28 = app_185_131'28 n_129'13 k in
      let k [( * )_0'0] app_186_131'22 = ( * )_0'0 app_186_131'22 k in
      let k [fact_129'8] app_187_131'25 = fact_129'8 app_187_131'25 k in
      let k [] app_188_131'24 =
        let lit_189_131'25 = 1 in
        app_188_131'24 lit_189_131'25 k in
      -_0'0 n_129'13 k
    | false0 ->
      let lit_190_131'37 = 1 in
      k lit_190_131'37 in
  let k [] app_183_131'7 =
    let lit_184_131'10 = 2 in
    app_183_131'7 lit_184_131'10 k in
  >=_9'4 n_129'13 k) in
let error_133'4 = fun [put_string_95'4,newline_99'4] s_133'10 k ->
  let k [put_string_95'4,newline_99'4,s_133'10] __133'34 =
    let k [newline_99'4] __133'48 =
      let con_192_133'58 = Unit0 in
      newline_99'4 con_192_133'58 k in
    put_string_95'4 s_133'10 k in
  let lit_191_133'25 = "ERROR: " in
  put_string_95'4 lit_191_133'25 k in
let runfib_135'4 = fun [parse_num_34'4,put_string_95'4,put_int_97'4,newline_99'4,fib_125'8,error_133'4] args_135'11 k ->
  let k [parse_num_34'4,put_string_95'4,put_int_97'4,newline_99'4,fib_125'8,error_133'4,args_135'11] __136'20 =
    match args_135'11 with
    | Nil0 ->
      let lit_194_138'16 = "expected an argument" in
      error_133'4 lit_194_138'16 k
    | Cons1(arg1_139'4,more_139'10) ->
      match more_139'10 with
      | Cons1(__141'7,__141'10) ->
        let lit_195_141'21 = "expected exactly one argument" in
        error_133'4 lit_195_141'21 k
      | Nil0 ->
        let k [put_string_95'4,put_int_97'4,newline_99'4,fib_125'8,error_133'4] app_196_143'24 =
          match app_196_143'24 with
          | None1 ->
            let lit_197_144'24 = "expected arg1 to be numeric" in
            error_133'4 lit_197_144'24 k
          | Some0(n_145'15) ->
            let k [put_string_95'4,put_int_97'4,newline_99'4,n_145'15] res_146'15 =
              let k [put_string_95'4,put_int_97'4,newline_99'4,res_146'15] __147'20 =
                let k [put_int_97'4,newline_99'4,res_146'15] __148'29 =
                  let k [newline_99'4] __149'22 =
                    let con_199_150'19 = Unit0 in
                    newline_99'4 con_199_150'19 k in
                  put_int_97'4 res_146'15 k in
                let lit_198_148'22 = " --> " in
                put_string_95'4 lit_198_148'22 k in
              put_int_97'4 n_145'15 k in
            fib_125'8 n_145'15 k in
        parse_num_34'4 arg1_139'4 k in
  let lit_193_136'13 = "fib: " in
  put_string_95'4 lit_193_136'13 k in
let runfact_152'4 = fun [parse_num_34'4,put_string_95'4,put_int_97'4,newline_99'4,fact_129'8,error_133'4] args_152'12 k ->
  let k [parse_num_34'4,put_string_95'4,put_int_97'4,newline_99'4,fact_129'8,error_133'4,args_152'12] __153'21 =
    match args_152'12 with
    | Nil0 ->
      let lit_201_155'16 = "expected an argument" in
      error_133'4 lit_201_155'16 k
    | Cons1(arg1_156'4,more_156'10) ->
      match more_156'10 with
      | Cons1(__158'7,__158'10) ->
        let lit_202_158'21 = "expected exactly one argument" in
        error_133'4 lit_202_158'21 k
      | Nil0 ->
        let k [put_string_95'4,put_int_97'4,newline_99'4,fact_129'8,error_133'4] app_203_160'24 =
          match app_203_160'24 with
          | None1 ->
            let lit_204_161'24 = "expected arg1 to be numeric" in
            error_133'4 lit_204_161'24 k
          | Some0(n_162'15) ->
            let k [put_string_95'4,put_int_97'4,newline_99'4,n_162'15] res_163'15 =
              let k [put_string_95'4,put_int_97'4,newline_99'4,res_163'15] __164'20 =
                let k [put_int_97'4,newline_99'4,res_163'15] __165'29 =
                  let k [newline_99'4] __166'22 =
                    let con_206_167'19 = Unit0 in
                    newline_99'4 con_206_167'19 k in
                  put_int_97'4 res_163'15 k in
                let lit_205_165'22 = " --> " in
                put_string_95'4 lit_205_165'22 k in
              put_int_97'4 n_162'15 k in
            fact_129'8 n_162'15 k in
        parse_num_34'4 arg1_156'4 k in
  let lit_200_153'13 = "fact: " in
  put_string_95'4 lit_200_153'13 k in
let k [::_0'0,eq_char_0'0,explode_0'0,put_char_12'4,eq_char_list_56'4,append_58'8,reverse_63'4,map_71'8,length_76'8,put_chars_90'8,put_int_97'4,newline_99'4,put_string_newline_101'4,read_line_105'4,error_133'4,runfib_135'4,runfact_152'4] single_controlD_170'4 =
  let rev_172'4 = fun [eq_char_list_56'4,reverse_63'4,put_chars_90'8,newline_99'4,read_line_105'4,single_controlD_170'4] __172'7 k ->
    let loop_173'10 = fix (fun [eq_char_list_56'4,reverse_63'4,put_chars_90'8,newline_99'4,read_line_105'4,single_controlD_170'4] loop_173'10 __173'14 k ->
      let k [eq_char_list_56'4,reverse_63'4,put_chars_90'8,newline_99'4,single_controlD_170'4,loop_173'10] xs_174'8 =
        let k [reverse_63'4,put_chars_90'8,newline_99'4,loop_173'10,xs_174'8] app_212_175'23 =
          match app_212_175'23 with
          | true1 ->
            let con_214_175'44 = Unit0 in
            k con_214_175'44
          | false0 ->
            let k [newline_99'4,loop_173'10] __176'29 =
              let k [loop_173'10] __176'40 =
                let con_217_176'46 = Unit0 in
                loop_173'10 con_217_176'46 k in
              let con_216_176'38 = Unit0 in
              newline_99'4 con_216_176'38 k in
            let k [put_chars_90'8] app_215_176'26 = put_chars_90'8 app_215_176'26 k in
            reverse_63'4 xs_174'8 k in
        let k [single_controlD_170'4] app_213_175'20 = app_213_175'20 single_controlD_170'4 k in
        eq_char_list_56'4 xs_174'8 k in
      let con_211_174'23 = Unit0 in
      read_line_105'4 con_211_174'23 k) in
    let con_218_178'6 = Unit0 in
    loop_173'10 con_218_178'6 k in
  let runrev_180'4 = fun [put_string_newline_101'4,error_133'4,rev_172'4] args_180'11 k ->
    match args_180'11 with
    | Cons1(__182'4,__182'7) ->
      let lit_219_182'18 = "rev: expected no arguments" in
      error_133'4 lit_219_182'18 k
    | Nil0 ->
      let k [rev_172'4] __184'56 =
        let con_221_185'8 = Unit0 in
        rev_172'4 con_221_185'8 k in
      let lit_220_184'24 = "(reverse typed lines until ^D)" in
      put_string_newline_101'4 lit_220_184'24 k in
  let fallback_187'4 = fun [eq_char_0'0,explode_0'0,put_char_12'4,append_58'8,map_71'8,length_76'8,put_chars_90'8,put_int_97'4,newline_99'4] line_187'13 k ->
    let k [explode_0'0,put_char_12'4,append_58'8,length_76'8,put_chars_90'8,put_int_97'4,newline_99'4,line_187'13] star_the_ohs_188'6 =
      let k [explode_0'0,put_char_12'4,append_58'8,put_chars_90'8,put_int_97'4,newline_99'4,line_187'13,star_the_ohs_188'6] n_189'6 =
        let k [put_char_12'4,put_int_97'4,newline_99'4,n_189'6] __190'64 =
          let k [put_char_12'4,put_int_97'4,newline_99'4,n_189'6] __191'14 =
            let k [put_char_12'4,put_int_97'4,newline_99'4,n_189'6] __192'14 =
              let k [put_char_12'4,newline_99'4] __193'11 =
                let k [newline_99'4] __194'14 =
                  let con_235_195'10 = Unit0 in
                  newline_99'4 con_235_195'10 k in
                let lit_234_194'11 = '}' in
                put_char_12'4 lit_234_194'11 k in
              put_int_97'4 n_189'6 k in
            let lit_233_192'11 = '{' in
            put_char_12'4 lit_233_192'11 k in
          let lit_232_191'11 = ' ' in
          put_char_12'4 lit_232_191'11 k in
        let k [put_chars_90'8] app_227_190'44 = put_chars_90'8 app_227_190'44 k in
        let k [line_187'13,star_the_ohs_188'6] app_228_190'20 =
          let k [app_228_190'20] app_231_190'58 = app_228_190'20 app_231_190'58 k in
          star_the_ohs_188'6 line_187'13 k in
        let k [append_58'8] app_229_190'29 = append_58'8 app_229_190'29 k in
        let lit_230_190'29 = "You wrote: " in
        explode_0'0 lit_230_190'29 k in
      length_76'8 line_187'13 k in
    let lam_222_188'30 = fun [eq_char_0'0] c_188'30 k ->
      let k [c_188'30] app_223_188'48 =
        match app_223_188'48 with
        | true1 ->
          let lit_226_188'57 = '*' in
          k lit_226_188'57
        | false0 -> k c_188'30 in
      let k [] app_224_188'46 =
        let lit_225_188'48 = 'o' in
        app_224_188'46 lit_225_188'48 k in
      eq_char_0'0 c_188'30 k in
    map_71'8 lam_222_188'30 k in
  let split_words_197'4 = fun [::_0'0,eq_char_0'0,reverse_63'4] s_197'16 k ->
    let loop_198'10 = fix (fun [::_0'0,eq_char_0'0,reverse_63'4] loop_198'10 accWs_198'15 k ->
      let lam_253_198'21 = fun [::_0'0,eq_char_0'0,reverse_63'4,loop_198'10,accWs_198'15] accCs_198'21 k ->
        let lam_252_198'27 = fun [::_0'0,eq_char_0'0,reverse_63'4,loop_198'10,accWs_198'15,accCs_198'21] xs_198'27 k ->
          match xs_198'27 with
          | Nil0 ->
            let k [reverse_63'4] app_236_200'38 = reverse_63'4 app_236_200'38 k in
            let k [accWs_198'15] app_237_200'35 = app_237_200'35 accWs_198'15 k in
            let k [::_0'0] app_238_200'29 = ::_0'0 app_238_200'29 k in
            reverse_63'4 accCs_198'21 k
          | Cons1(x_202'6,xs_202'9) ->
            let k [::_0'0,reverse_63'4,loop_198'10,accWs_198'15,accCs_198'21,x_202'6,xs_202'9] app_239_203'20 =
              match app_239_203'20 with
              | true1 ->
                let k [xs_202'9] app_242_203'59 = app_242_203'59 xs_202'9 k in
                let k [] app_243_203'34 =
                  let con_247_203'59 = Nil0 in
                  app_243_203'34 con_247_203'59 k in
                let k [loop_198'10] app_244_203'52 = loop_198'10 app_244_203'52 k in
                let k [accWs_198'15] app_245_203'49 = app_245_203'49 accWs_198'15 k in
                let k [::_0'0] app_246_203'43 = ::_0'0 app_246_203'43 k in
                reverse_63'4 accCs_198'21 k
              | false0 ->
                let k [xs_202'9] app_248_204'23 = app_248_204'23 xs_202'9 k in
                let k [::_0'0,accCs_198'21,x_202'6] app_249_204'17 =
                  let k [app_249_204'17] app_250_204'27 = app_249_204'17 app_250_204'27 k in
                  let k [accCs_198'21] app_251_204'25 = app_251_204'25 accCs_198'21 k in
                  ::_0'0 x_202'6 k in
                loop_198'10 accWs_198'15 k in
            let k [] app_240_203'18 =
              let lit_241_203'20 = ' ' in
              app_240_203'18 lit_241_203'20 k in
            eq_char_0'0 x_202'6 k in
        k lam_252_198'27 in
      k lam_253_198'21) in
    let k [s_197'16] app_254_206'10 = app_254_206'10 s_197'16 k in
    let k [] app_255_206'7 =
      let con_257_206'10 = Nil0 in
      app_255_206'7 con_257_206'10 k in
    let con_256_206'7 = Nil0 in
    loop_198'10 con_256_206'7 k in
  let execute_208'4 = fun [explode_0'0,eq_char_list_56'4,runfib_135'4,runfact_152'4,runrev_180'4,fallback_187'4,split_words_197'4] line_208'12 k ->
    let k [explode_0'0,eq_char_list_56'4,runfib_135'4,runfact_152'4,runrev_180'4,fallback_187'4,line_208'12] words_209'6 =
      match words_209'6 with
      | Nil0 ->
        let con_258_211'10 = Unit0 in
        k con_258_211'10
      | Cons1(command_212'4,args_212'13) ->
        let k [explode_0'0,eq_char_list_56'4,runfib_135'4,runfact_152'4,runrev_180'4,fallback_187'4,line_208'12,command_212'4,args_212'13] app_259_213'29 =
          match app_259_213'29 with
          | true1 -> runfib_135'4 args_212'13 k
          | false0 ->
            let k [explode_0'0,eq_char_list_56'4,runfact_152'4,runrev_180'4,fallback_187'4,line_208'12,command_212'4,args_212'13] app_263_214'31 =
              match app_263_214'31 with
              | true1 -> runfact_152'4 args_212'13 k
              | false0 ->
                let k [runrev_180'4,fallback_187'4,line_208'12,args_212'13] app_267_215'33 =
                  match app_267_215'33 with
                  | true1 -> runrev_180'4 args_212'13 k
                  | false0 -> fallback_187'4 line_208'12 k in
                let k [explode_0'0] app_268_215'25 =
                  let k [app_268_215'25] app_269_215'42 = app_268_215'25 app_269_215'42 k in
                  let lit_270_215'42 = "rev" in
                  explode_0'0 lit_270_215'42 k in
                eq_char_list_56'4 command_212'4 k in
            let k [explode_0'0] app_264_214'23 =
              let k [app_264_214'23] app_265_214'40 = app_264_214'23 app_265_214'40 k in
              let lit_266_214'40 = "fact" in
              explode_0'0 lit_266_214'40 k in
            eq_char_list_56'4 command_212'4 k in
        let k [explode_0'0] app_260_213'21 =
          let k [app_260_213'21] app_261_213'38 = app_260_213'21 app_261_213'38 k in
          let lit_262_213'38 = "fib" in
          explode_0'0 lit_262_213'38 k in
        eq_char_list_56'4 command_212'4 k in
    split_words_197'4 line_208'12 k in
  let mainloop_218'8 = fix (fun [put_char_12'4,eq_char_list_56'4,read_line_105'4,single_controlD_170'4,execute_208'4] mainloop_218'8 __218'17 k ->
    let k [put_char_12'4,eq_char_list_56'4,read_line_105'4,single_controlD_170'4,execute_208'4,mainloop_218'8] __219'14 =
      let k [eq_char_list_56'4,read_line_105'4,single_controlD_170'4,execute_208'4,mainloop_218'8] __220'14 =
        let k [eq_char_list_56'4,single_controlD_170'4,execute_208'4,mainloop_218'8] xs_221'6 =
          let k [execute_208'4,mainloop_218'8,xs_221'6] app_274_222'21 =
            match app_274_222'21 with
            | true1 ->
              let con_276_222'42 = Unit0 in
              k con_276_222'42
            | false0 ->
              let k [mainloop_218'8] __223'15 =
                let con_277_223'26 = Unit0 in
                mainloop_218'8 con_277_223'26 k in
              execute_208'4 xs_221'6 k in
          let k [single_controlD_170'4] app_275_222'18 = app_275_222'18 single_controlD_170'4 k in
          eq_char_list_56'4 xs_221'6 k in
        let con_273_221'21 = Unit0 in
        read_line_105'4 con_273_221'21 k in
      let lit_272_220'11 = ' ' in
      put_char_12'4 lit_272_220'11 k in
    let lit_271_219'11 = '>' in
    put_char_12'4 lit_271_219'11 k) in
  let main_225'4 = fun [put_string_newline_101'4,mainloop_218'8] __225'9 k ->
    let k [mainloop_218'8] __226'69 =
      let con_279_227'11 = Unit0 in
      mainloop_218'8 con_279_227'11 k in
    let lit_278_226'21 = "This is a shell prototype. Try: fib, fact, rev" in
    put_string_newline_101'4 lit_278_226'21 k in
  let con_280_0'0 = Unit0 in
  main_225'4 con_280_0'0 k in
let k [] app_207_170'28 =
  let con_210_170'31 = Nil0 in
  app_207_170'28 con_210_170'31 k in
let k [::_0'0] app_208_170'26 = ::_0'0 app_208_170'26 k in
let lit_209_170'26 = 4 in
chr_0'0 lit_209_170'26 k
