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
    let k [not_2'4,a_8'9] app_29_8'22 =
      let k [not_2'4] app_28_8'24 = not_2'4 app_28_8'24 k in
      app_29_8'22 a_8'9 k in
    <_0'0 b_8'11 k in
  k lam_30_8'11 in
let >=_9'4 = fun [<_0'0,not_2'4] a_9'9 k ->
  let lam_33_9'11 = fun [<_0'0,not_2'4,a_9'9] b_9'11 k ->
    let k [not_2'4,b_9'11] app_32_9'22 =
      let k [not_2'4] app_31_9'24 = not_2'4 app_31_9'24 k in
      app_32_9'22 b_9'11 k in
    <_0'0 a_9'9 k in
  k lam_33_9'11 in
let put_char_12'4 = fun [+_0'0,-_0'0,=_0'0,chr_0'0,eq_char_0'0,ord_0'0,put_char_0'0,>_7'4] c_12'13 k ->
  let backspace_13'6 = 8 in
  let k [+_0'0,-_0'0,=_0'0,chr_0'0,eq_char_0'0,ord_0'0,put_char_0'0,>_7'4,c_12'13,backspace_13'6] n_14'6 =
    let k [+_0'0,-_0'0,chr_0'0,eq_char_0'0,ord_0'0,put_char_0'0,>_7'4,c_12'13,backspace_13'6,n_14'6] app_35_15'7 =
      let k [+_0'0,-_0'0,chr_0'0,eq_char_0'0,ord_0'0,put_char_0'0,>_7'4,c_12'13,n_14'6] app_34_15'9 =
        match app_34_15'9 with
        | true1 -> put_char_0'0 c_12'13 k
        | false0 ->
          let k [+_0'0,-_0'0,chr_0'0,ord_0'0,put_char_0'0,>_7'4,c_12'13,n_14'6] app_37_16'15 =
            let lit_38_16'17 = '\n' in
            let k [+_0'0,-_0'0,chr_0'0,ord_0'0,put_char_0'0,>_7'4,c_12'13,n_14'6] app_36_16'17 =
              match app_36_16'17 with
              | true1 -> put_char_0'0 c_12'13 k
              | false0 ->
                let k [+_0'0,-_0'0,chr_0'0,ord_0'0,put_char_0'0,c_12'13,n_14'6] app_40_17'11 =
                  let lit_41_17'13 = 26 in
                  let k [+_0'0,-_0'0,chr_0'0,ord_0'0,put_char_0'0,c_12'13,n_14'6] app_39_17'13 =
                    match app_39_17'13 with
                    | true1 -> put_char_0'0 c_12'13 k
                    | false0 ->
                      let lit_42_18'18 = '^' in
                      let k [+_0'0,-_0'0,chr_0'0,ord_0'0,put_char_0'0,n_14'6] __18'21 =
                        let lit_49_18'42 = 'A' in
                        let k [+_0'0,-_0'0,chr_0'0,put_char_0'0,n_14'6] app_48_18'42 =
                          let k [-_0'0,chr_0'0,put_char_0'0,n_14'6] app_47_18'46 =
                            let k [-_0'0,chr_0'0,put_char_0'0] app_46_18'48 =
                              let k [chr_0'0,put_char_0'0] app_45_18'50 =
                                let lit_50_18'52 = 1 in
                                let k [chr_0'0,put_char_0'0] app_44_18'52 =
                                  let k [put_char_0'0] app_43_18'37 = put_char_0'0 app_43_18'37 k in
                                  chr_0'0 app_44_18'52 k in
                                app_45_18'50 lit_50_18'52 k in
                              -_0'0 app_46_18'48 k in
                            app_47_18'46 n_14'6 k in
                          +_0'0 app_48_18'42 k in
                        ord_0'0 lit_49_18'42 k in
                      put_char_0'0 lit_42_18'18 k in
                  app_40_17'11 lit_41_17'13 k in
                >_7'4 n_14'6 k in
            app_37_16'15 lit_38_16'17 k in
          eq_char_0'0 c_12'13 k in
      app_35_15'7 backspace_13'6 k in
    =_0'0 n_14'6 k in
  ord_0'0 c_12'13 k in
let erase_char_20'4 = fun [chr_0'0,put_char_12'4] __20'15 k ->
  let lit_51_21'22 = 8 in
  let k [put_char_12'4] backspace_21'6 =
    let k [put_char_12'4,backspace_21'6] __23'20 =
      let lit_52_24'11 = ' ' in
      let k [put_char_12'4,backspace_21'6] __24'14 = put_char_12'4 backspace_21'6 k in
      put_char_12'4 lit_52_24'11 k in
    put_char_12'4 backspace_21'6 k in
  chr_0'0 lit_51_21'22 k in
let parse_digit_29'4 = fun [-_0'0,ord_0'0,<=_8'4,>=_9'4] c_29'16 k ->
  let k [-_0'0,ord_0'0,<=_8'4,>=_9'4] app_54_30'14 =
    let k [ord_0'0,<=_8'4,>=_9'4] app_53_30'16 =
      let lit_56_30'22 = '0' in
      let k [<=_8'4,>=_9'4,app_53_30'16] app_55_30'22 =
        let k [<=_8'4,>=_9'4] n_30'6 =
          let k [<=_8'4,n_30'6] app_58_32'7 =
            let lit_59_32'10 = 0 in
            let k [<=_8'4,n_30'6] app_57_32'10 =
              match app_57_32'10 with
              | true1 ->
                let k [n_30'6] app_61_32'22 =
                  let lit_62_32'25 = 9 in
                  let k [n_30'6] app_60_32'25 =
                    match app_60_32'25 with
                    | true1 ->
                      let con_63_32'32 = Some0[n_30'6] in
                      k con_63_32'32
                    | false0 ->
                      let con_64_32'45 = None1 in
                      k con_64_32'45 in
                  app_61_32'22 lit_62_32'25 k in
                <=_8'4 n_30'6 k
              | false0 ->
                let con_65_32'55 = None1 in
                k con_65_32'55 in
            app_58_32'7 lit_59_32'10 k in
          >=_9'4 n_30'6 k in
        app_53_30'16 app_55_30'22 k in
      ord_0'0 lit_56_30'22 k in
    -_0'0 app_54_30'14 k in
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
            let lit_74_41'26 = 10 in
            let k [+_0'0,loop_35'10,acc_35'15,xs_38'9,d_41'15] app_73_41'29 =
              let k [+_0'0,loop_35'10,xs_38'9,d_41'15] app_72_41'31 =
                let k [loop_35'10,xs_38'9,d_41'15] app_71_41'35 =
                  let k [loop_35'10,xs_38'9] app_70_41'37 =
                    let k [xs_38'9] app_69_41'25 = app_69_41'25 xs_38'9 k in
                    loop_35'10 app_70_41'37 k in
                  app_71_41'35 d_41'15 k in
                +_0'0 app_72_41'31 k in
              app_73_41'29 acc_35'15 k in
            ( * )_0'0 lit_74_41'26 k in
        parse_digit_29'4 x_38'6 k in
    k lam_75_35'19) in
  let lit_77_43'7 = 0 in
  let k [s_34'14] app_76_43'7 = app_76_43'7 s_34'14 k in
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
          let k [eq_list_47'8,eq_47'16,xs_50'7,y_53'7,ys_53'10] app_84_54'14 =
            let k [eq_list_47'8,eq_47'16,xs_50'7,ys_53'10] app_83_54'16 =
              match app_83_54'16 with
              | true1 ->
                let k [xs_50'7,ys_53'10] app_86_54'31 =
                  let k [ys_53'10] app_85_54'34 = app_85_54'34 ys_53'10 k in
                  app_86_54'31 xs_50'7 k in
                eq_list_47'8 eq_47'16 k
              | false0 ->
                let con_87_54'45 = false0 in
                k con_87_54'45 in
            app_84_54'14 y_53'7 k in
          eq_47'16 x_50'4 k in
    k lam_88_47'22 in
  k lam_89_47'19) in
let eq_char_list_56'4 = fun [eq_char_0'0,eq_list_47'8] a_56'17 k ->
  let lam_92_56'19 = fun [eq_char_0'0,eq_list_47'8,a_56'17] b_56'19 k ->
    let k [a_56'17,b_56'19] app_91_56'31 =
      let k [b_56'19] app_90_56'39 = app_90_56'39 b_56'19 k in
      app_91_56'31 a_56'17 k in
    eq_list_47'8 eq_char_0'0 k in
  k lam_92_56'19 in
let append_58'8 = fix (fun [cons_45'4] append_58'8 xs_58'15 k ->
  let lam_96_58'18 = fun [cons_45'4,append_58'8,xs_58'15] ys_58'18 k ->
    match xs_58'15 with
    | Nil0 -> k ys_58'18
    | Cons1(x_61'4,xs_61'7) ->
      let k [append_58'8,ys_58'18,xs_61'7] app_93_61'18 =
        let k [ys_58'18,app_93_61'18] app_95_61'28 =
          let k [app_93_61'18] app_94_61'31 = app_93_61'18 app_94_61'31 k in
          app_95_61'28 ys_58'18 k in
        append_58'8 xs_61'7 k in
      cons_45'4 x_61'4 k in
  k lam_96_58'18) in
let reverse_63'4 = fun [cons_45'4] xs_63'12 k ->
  let loop_64'10 = fix (fun [cons_45'4] loop_64'10 acc_64'15 k ->
    let lam_100_64'19 = fun [cons_45'4,loop_64'10,acc_64'15] xs_64'19 k ->
      match xs_64'19 with
      | Nil0 -> k acc_64'15
      | Cons1(x_67'6,xs_67'9) ->
        let k [loop_64'10,acc_64'15,xs_67'9] app_99_67'26 =
          let k [loop_64'10,xs_67'9] app_98_67'28 =
            let k [xs_67'9] app_97_67'20 = app_97_67'20 xs_67'9 k in
            loop_64'10 app_98_67'28 k in
          app_99_67'26 acc_64'15 k in
        cons_45'4 x_67'6 k in
    k lam_100_64'19) in
  let con_102_69'7 = Nil0 in
  let k [xs_63'12] app_101_69'7 = app_101_69'7 xs_63'12 k in
  loop_64'10 con_102_69'7 k in
let map_71'8 = fix (fun [::_0'0] map_71'8 f_71'12 k ->
  let lam_108_71'14 = fun [::_0'0,map_71'8,f_71'12] xs_71'14 k ->
    match xs_71'14 with
    | Nil0 ->
      let con_103_73'10 = Nil0 in
      k con_103_73'10
    | Cons1(x_74'4,xs_74'7) ->
      let k [::_0'0,map_71'8,f_71'12,xs_74'7] app_105_74'15 =
        let k [map_71'8,f_71'12,xs_74'7] app_104_74'17 =
          let k [xs_74'7,app_104_74'17] app_107_74'24 =
            let k [app_104_74'17] app_106_74'26 = app_104_74'17 app_106_74'26 k in
            app_107_74'24 xs_74'7 k in
          map_71'8 f_71'12 k in
        ::_0'0 app_105_74'15 k in
      f_71'12 x_74'4 k in
  k lam_108_71'14) in
let length_76'8 = fix (fun [+_0'0] length_76'8 xs_76'15 k ->
  match xs_76'15 with
  | Nil0 ->
    let lit_109_78'10 = 0 in
    k lit_109_78'10
  | Cons1(__79'4,xs_79'7) ->
    let lit_111_79'17 = 1 in
    let k [length_76'8,xs_79'7] app_110_79'17 =
      let k [app_110_79'17] app_112_79'27 = app_110_79'17 app_112_79'27 k in
      length_76'8 xs_79'7 k in
    +_0'0 lit_111_79'17 k) in
let chars_of_int_81'4 = fun [%_0'0,+_0'0,/_0'0,=_0'0,chr_0'0,ord_0'0,cons_45'4] i_81'17 k ->
  let lit_113_82'17 = '0' in
  let k [%_0'0,+_0'0,/_0'0,=_0'0,chr_0'0,cons_45'4,i_81'17] ord0_82'6 =
    let char_of_digit_83'6 = fun [+_0'0,chr_0'0,ord0_82'6] c_83'20 k ->
      let k [chr_0'0,c_83'20] app_115_83'34 =
        let k [chr_0'0] app_114_83'36 = chr_0'0 app_114_83'36 k in
        app_115_83'34 c_83'20 k in
      +_0'0 ord0_82'6 k in
    let loop_84'10 = fix (fun [%_0'0,/_0'0,=_0'0,cons_45'4,char_of_digit_83'6] loop_84'10 acc_84'15 k ->
      let lam_129_84'19 = fun [%_0'0,/_0'0,=_0'0,cons_45'4,char_of_digit_83'6,loop_84'10,acc_84'15] i_84'19 k ->
        let k [%_0'0,/_0'0,cons_45'4,char_of_digit_83'6,loop_84'10,acc_84'15,i_84'19] app_117_85'9 =
          let lit_118_85'11 = 0 in
          let k [%_0'0,/_0'0,cons_45'4,char_of_digit_83'6,loop_84'10,acc_84'15,i_84'19] app_116_85'11 =
            match app_116_85'11 with
            | true1 -> k acc_84'15
            | false0 ->
              let k [/_0'0,cons_45'4,char_of_digit_83'6,loop_84'10,acc_84'15,i_84'19] app_124_86'34 =
                let lit_125_86'35 = 10 in
                let k [/_0'0,cons_45'4,char_of_digit_83'6,loop_84'10,acc_84'15,i_84'19] app_123_86'35 =
                  let k [/_0'0,cons_45'4,loop_84'10,acc_84'15,i_84'19] app_122_86'32 =
                    let k [/_0'0,loop_84'10,acc_84'15,i_84'19] app_121_86'17 =
                      let k [/_0'0,loop_84'10,i_84'19] app_120_86'40 =
                        let k [/_0'0,i_84'19] app_119_86'11 =
                          let k [app_119_86'11] app_127_86'47 =
                            let lit_128_86'48 = 10 in
                            let k [app_119_86'11] app_126_86'48 = app_119_86'11 app_126_86'48 k in
                            app_127_86'47 lit_128_86'48 k in
                          /_0'0 i_84'19 k in
                        loop_84'10 app_120_86'40 k in
                      app_121_86'17 acc_84'15 k in
                    cons_45'4 app_122_86'32 k in
                  char_of_digit_83'6 app_123_86'35 k in
                app_124_86'34 lit_125_86'35 k in
              %_0'0 i_84'19 k in
          app_117_85'9 lit_118_85'11 k in
        =_0'0 i_84'19 k in
      k lam_129_84'19) in
    let k [cons_45'4,i_81'17,loop_84'10] app_131_88'7 =
      let lit_132_88'9 = 0 in
      let k [cons_45'4,i_81'17,loop_84'10] app_130_88'9 =
        match app_130_88'9 with
        | true1 ->
          let lit_134_88'21 = '0' in
          let k [] app_133_88'21 =
            let con_135_88'25 = Nil0 in
            app_133_88'21 con_135_88'25 k in
          cons_45'4 lit_134_88'21 k
        | false0 ->
          let con_137_88'38 = Nil0 in
          let k [i_81'17] app_136_88'38 = app_136_88'38 i_81'17 k in
          loop_84'10 con_137_88'38 k in
      app_131_88'7 lit_132_88'9 k in
    =_0'0 i_81'17 k in
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
let read_line_101'4 = fun [::_0'0,=_0'0,chr_0'0,eq_char_0'0,get_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4] __101'14 k ->
  let lit_142_102'21 = 4 in
  let k [::_0'0,=_0'0,eq_char_0'0,get_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4] controlD_102'6 =
    let loop_103'10 = fix (fun [::_0'0,=_0'0,eq_char_0'0,get_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4,controlD_102'6] loop_103'10 acc_103'15 k ->
      let con_143_104'21 = Unit0 in
      let k [::_0'0,=_0'0,eq_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4,controlD_102'6,loop_103'10,acc_103'15] c_104'8 =
        let k [::_0'0,=_0'0,eq_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4,controlD_102'6,loop_103'10,acc_103'15,c_104'8] n_105'8 =
          let k [::_0'0,=_0'0,eq_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4,controlD_102'6,loop_103'10,acc_103'15,c_104'8,n_105'8] app_145_106'15 =
            let lit_146_106'17 = '\n' in
            let k [::_0'0,=_0'0,eq_char_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4,controlD_102'6,loop_103'10,acc_103'15,c_104'8,n_105'8] app_144_106'17 =
              match app_144_106'17 with
              | true1 ->
                let con_147_106'35 = Unit0 in
                let k [reverse_63'4,acc_103'15] __106'37 = reverse_63'4 acc_103'15 k in
                newline_99'4 con_147_106'35 k
              | false0 ->
                let k [::_0'0,=_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4,controlD_102'6,loop_103'10,acc_103'15,c_104'8,n_105'8] app_149_107'17 =
                  let k [::_0'0,=_0'0,ord_0'0,>_7'4,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,reverse_63'4,newline_99'4,controlD_102'6,loop_103'10,acc_103'15,c_104'8,n_105'8] app_148_107'19 =
                    match app_148_107'19 with
                    | true1 ->
                      let k [::_0'0,reverse_63'4,newline_99'4,controlD_102'6,acc_103'15] __107'44 =
                        let con_150_107'53 = Unit0 in
                        let k [::_0'0,reverse_63'4,controlD_102'6,acc_103'15] __107'55 =
                          let k [reverse_63'4,acc_103'15] app_152_107'75 =
                            let k [reverse_63'4] app_151_107'78 = reverse_63'4 app_151_107'78 k in
                            app_152_107'75 acc_103'15 k in
                          ::_0'0 controlD_102'6 k in
                        newline_99'4 con_150_107'53 k in
                      put_char_12'4 c_104'8 k
                    | false0 ->
                      let k [=_0'0,ord_0'0,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,loop_103'10,acc_103'15,c_104'8,n_105'8] app_154_108'13 =
                        let lit_155_108'15 = 127 in
                        let k [=_0'0,ord_0'0,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,loop_103'10,acc_103'15,c_104'8,n_105'8] app_153_108'15 =
                          match app_153_108'15 with
                          | true1 -> loop_103'10 acc_103'15 k
                          | false0 ->
                            let k [ord_0'0,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,loop_103'10,acc_103'15,c_104'8] app_157_109'15 =
                              let lit_158_109'17 = 127 in
                              let k [ord_0'0,<=_8'4,put_char_12'4,erase_char_20'4,cons_45'4,loop_103'10,acc_103'15,c_104'8] app_156_109'17 =
                                match app_156_109'17 with
                                | true1 ->
                                  match acc_103'15 with
                                  | Nil0 -> loop_103'10 acc_103'15 k
                                  | Cons1(c_112'14,tail_112'17) ->
                                    let k [<=_8'4,erase_char_20'4,loop_103'10,tail_112'17] app_161_113'23 =
                                      let k [erase_char_20'4,loop_103'10,tail_112'17] app_160_113'25 =
                                        let lit_162_113'28 = 26 in
                                        let k [erase_char_20'4,loop_103'10,tail_112'17] app_159_113'28 =
                                          let k [erase_char_20'4,loop_103'10,tail_112'17] __113'58 =
                                            let con_165_114'25 = Unit0 in
                                            let k [loop_103'10,tail_112'17] __114'27 = loop_103'10 tail_112'17 k in
                                            erase_char_20'4 con_165_114'25 k in
                                          match app_159_113'28 with
                                          | true1 ->
                                            let con_163_113'47 = Unit0 in
                                            erase_char_20'4 con_163_113'47 k
                                          | false0 ->
                                            let con_164_113'55 = Unit0 in
                                            k con_164_113'55 in
                                        app_160_113'25 lit_162_113'28 k in
                                      <=_8'4 app_161_113'23 k in
                                    ord_0'0 c_112'14 k
                                | false0 ->
                                  let k [cons_45'4,loop_103'10,acc_103'15,c_104'8] __117'23 =
                                    let k [loop_103'10,acc_103'15] app_167_117'36 =
                                      let k [loop_103'10] app_166_117'38 = loop_103'10 app_166_117'38 k in
                                      app_167_117'36 acc_103'15 k in
                                    cons_45'4 c_104'8 k in
                                  put_char_12'4 c_104'8 k in
                              app_157_109'15 lit_158_109'17 k in
                            =_0'0 n_105'8 k in
                        app_154_108'13 lit_155_108'15 k in
                      >_7'4 n_105'8 k in
                  app_149_107'17 controlD_102'6 k in
                eq_char_0'0 c_104'8 k in
            app_145_106'15 lit_146_106'17 k in
          eq_char_0'0 c_104'8 k in
        ord_0'0 c_104'8 k in
      get_char_0'0 con_143_104'21 k) in
    let con_168_119'7 = Nil0 in
    loop_103'10 con_168_119'7 k in
  chr_0'0 lit_142_102'21 k in
let fib_121'8 = fix (fun [+_0'0,-_0'0,<_0'0] fib_121'8 n_121'12 k ->
  let k [+_0'0,-_0'0,fib_121'8,n_121'12] app_170_123'7 =
    let lit_171_123'9 = 2 in
    let k [+_0'0,-_0'0,fib_121'8,n_121'12] app_169_123'9 =
      match app_169_123'9 with
      | true1 -> k n_121'12
      | false0 ->
        let k [+_0'0,-_0'0,fib_121'8,n_121'12] app_175_123'29 =
          let lit_176_123'30 = 1 in
          let k [+_0'0,-_0'0,fib_121'8,n_121'12] app_174_123'30 =
            let k [+_0'0,-_0'0,fib_121'8,n_121'12] app_173_123'27 =
              let k [-_0'0,fib_121'8,n_121'12] app_172_123'33 =
                let k [fib_121'8,app_172_123'33] app_179_123'41 =
                  let lit_180_123'42 = 2 in
                  let k [fib_121'8,app_172_123'33] app_178_123'42 =
                    let k [app_172_123'33] app_177_123'39 = app_172_123'33 app_177_123'39 k in
                    fib_121'8 app_178_123'42 k in
                  app_179_123'41 lit_180_123'42 k in
                -_0'0 n_121'12 k in
              +_0'0 app_173_123'27 k in
            fib_121'8 app_174_123'30 k in
          app_175_123'29 lit_176_123'30 k in
        -_0'0 n_121'12 k in
    app_170_123'7 lit_171_123'9 k in
  <_0'0 n_121'12 k) in
let fact_125'8 = fix (fun [( * )_0'0,-_0'0,>=_9'4] fact_125'8 n_125'13 k ->
  let k [( * )_0'0,-_0'0,fact_125'8,n_125'13] app_182_127'7 =
    let lit_183_127'10 = 2 in
    let k [( * )_0'0,-_0'0,fact_125'8,n_125'13] app_181_127'10 =
      match app_181_127'10 with
      | true1 ->
        let k [( * )_0'0,fact_125'8,n_125'13] app_187_127'24 =
          let lit_188_127'25 = 1 in
          let k [( * )_0'0,fact_125'8,n_125'13] app_186_127'25 =
            let k [( * )_0'0,n_125'13] app_185_127'22 =
              let k [n_125'13] app_184_127'28 = app_184_127'28 n_125'13 k in
              ( * )_0'0 app_185_127'22 k in
            fact_125'8 app_186_127'25 k in
          app_187_127'24 lit_188_127'25 k in
        -_0'0 n_125'13 k
      | false0 ->
        let lit_189_127'37 = 1 in
        k lit_189_127'37 in
    app_182_127'7 lit_183_127'10 k in
  >=_9'4 n_125'13 k) in
let error_129'4 = fun [put_string_95'4,newline_99'4] s_129'10 k ->
  let lit_190_129'25 = "ERROR: " in
  let k [put_string_95'4,newline_99'4,s_129'10] __129'34 =
    let k [newline_99'4] __129'48 =
      let con_191_129'58 = Unit0 in
      newline_99'4 con_191_129'58 k in
    put_string_95'4 s_129'10 k in
  put_string_95'4 lit_190_129'25 k in
let runfib_131'4 = fun [parse_num_34'4,put_string_95'4,put_int_97'4,newline_99'4,fib_121'8,error_129'4] args_131'11 k ->
  let lit_192_132'13 = "fib: " in
  let k [parse_num_34'4,put_string_95'4,put_int_97'4,newline_99'4,fib_121'8,error_129'4,args_131'11] __132'20 =
    match args_131'11 with
    | Nil0 ->
      let lit_193_134'16 = "expected an argument" in
      error_129'4 lit_193_134'16 k
    | Cons1(arg1_135'4,more_135'10) ->
      match more_135'10 with
      | Cons1(__137'7,__137'10) ->
        let lit_194_137'21 = "expected exactly one argument" in
        error_129'4 lit_194_137'21 k
      | Nil0 ->
        let k [put_string_95'4,put_int_97'4,newline_99'4,fib_121'8,error_129'4] app_195_139'24 =
          match app_195_139'24 with
          | None1 ->
            let lit_196_140'24 = "expected arg1 to be numeric" in
            error_129'4 lit_196_140'24 k
          | Some0(n_141'15) ->
            let k [put_string_95'4,put_int_97'4,newline_99'4,n_141'15] res_142'15 =
              let k [put_string_95'4,put_int_97'4,newline_99'4,res_142'15] __143'20 =
                let lit_197_144'22 = " --> " in
                let k [put_int_97'4,newline_99'4,res_142'15] __144'29 =
                  let k [newline_99'4] __145'22 =
                    let con_198_146'19 = Unit0 in
                    newline_99'4 con_198_146'19 k in
                  put_int_97'4 res_142'15 k in
                put_string_95'4 lit_197_144'22 k in
              put_int_97'4 n_141'15 k in
            fib_121'8 n_141'15 k in
        parse_num_34'4 arg1_135'4 k in
  put_string_95'4 lit_192_132'13 k in
let runfact_148'4 = fun [parse_num_34'4,put_string_95'4,put_int_97'4,newline_99'4,fact_125'8,error_129'4] args_148'12 k ->
  let lit_199_149'13 = "fact: " in
  let k [parse_num_34'4,put_string_95'4,put_int_97'4,newline_99'4,fact_125'8,error_129'4,args_148'12] __149'21 =
    match args_148'12 with
    | Nil0 ->
      let lit_200_151'16 = "expected an argument" in
      error_129'4 lit_200_151'16 k
    | Cons1(arg1_152'4,more_152'10) ->
      match more_152'10 with
      | Cons1(__154'7,__154'10) ->
        let lit_201_154'21 = "expected exactly one argument" in
        error_129'4 lit_201_154'21 k
      | Nil0 ->
        let k [put_string_95'4,put_int_97'4,newline_99'4,fact_125'8,error_129'4] app_202_156'24 =
          match app_202_156'24 with
          | None1 ->
            let lit_203_157'24 = "expected arg1 to be numeric" in
            error_129'4 lit_203_157'24 k
          | Some0(n_158'15) ->
            let k [put_string_95'4,put_int_97'4,newline_99'4,n_158'15] res_159'15 =
              let k [put_string_95'4,put_int_97'4,newline_99'4,res_159'15] __160'20 =
                let lit_204_161'22 = " --> " in
                let k [put_int_97'4,newline_99'4,res_159'15] __161'29 =
                  let k [newline_99'4] __162'22 =
                    let con_205_163'19 = Unit0 in
                    newline_99'4 con_205_163'19 k in
                  put_int_97'4 res_159'15 k in
                put_string_95'4 lit_204_161'22 k in
              put_int_97'4 n_158'15 k in
            fact_125'8 n_158'15 k in
        parse_num_34'4 arg1_152'4 k in
  put_string_95'4 lit_199_149'13 k in
let lit_208_166'26 = 4 in
let k [::_0'0,eq_char_0'0,explode_0'0,eq_char_list_56'4,append_58'8,reverse_63'4,map_71'8,length_76'8,put_chars_90'8,put_string_95'4,put_int_97'4,newline_99'4,read_line_101'4,error_129'4,runfib_131'4,runfact_148'4] app_207_166'26 =
  let k [::_0'0,eq_char_0'0,explode_0'0,eq_char_list_56'4,append_58'8,reverse_63'4,map_71'8,length_76'8,put_chars_90'8,put_string_95'4,put_int_97'4,newline_99'4,read_line_101'4,error_129'4,runfib_131'4,runfact_148'4] app_206_166'28 =
    let con_209_166'31 = Nil0 in
    let k [::_0'0,eq_char_0'0,explode_0'0,eq_char_list_56'4,append_58'8,reverse_63'4,map_71'8,length_76'8,put_chars_90'8,put_string_95'4,put_int_97'4,newline_99'4,read_line_101'4,error_129'4,runfib_131'4,runfact_148'4] single_controlD_166'4 =
      let rev_168'4 = fun [eq_char_list_56'4,reverse_63'4,put_chars_90'8,newline_99'4,read_line_101'4,single_controlD_166'4] __168'7 k ->
        let loop_169'10 = fix (fun [eq_char_list_56'4,reverse_63'4,put_chars_90'8,newline_99'4,read_line_101'4,single_controlD_166'4] loop_169'10 __169'14 k ->
          let con_210_170'23 = Unit0 in
          let k [eq_char_list_56'4,reverse_63'4,put_chars_90'8,newline_99'4,single_controlD_166'4,loop_169'10] xs_170'8 =
            let k [reverse_63'4,put_chars_90'8,newline_99'4,single_controlD_166'4,loop_169'10,xs_170'8] app_212_171'20 =
              let k [reverse_63'4,put_chars_90'8,newline_99'4,loop_169'10,xs_170'8] app_211_171'23 =
                match app_211_171'23 with
                | true1 ->
                  let con_213_171'44 = Unit0 in
                  k con_213_171'44
                | false0 ->
                  let k [put_chars_90'8,newline_99'4,loop_169'10] app_214_172'26 =
                    let k [newline_99'4,loop_169'10] __172'29 =
                      let con_215_172'38 = Unit0 in
                      let k [loop_169'10] __172'40 =
                        let con_216_172'46 = Unit0 in
                        loop_169'10 con_216_172'46 k in
                      newline_99'4 con_215_172'38 k in
                    put_chars_90'8 app_214_172'26 k in
                  reverse_63'4 xs_170'8 k in
              app_212_171'20 single_controlD_166'4 k in
            eq_char_list_56'4 xs_170'8 k in
          read_line_101'4 con_210_170'23 k) in
        let con_217_174'6 = Unit0 in
        loop_169'10 con_217_174'6 k in
      let runrev_176'4 = fun [put_string_95'4,error_129'4,rev_168'4] args_176'11 k ->
        match args_176'11 with
        | Cons1(__178'4,__178'7) ->
          let lit_218_178'18 = "rev: expected no arguments" in
          error_129'4 lit_218_178'18 k
        | Nil0 ->
          let lit_219_180'16 = "(reverse typed lines until ^D)\n" in
          let k [rev_168'4] __180'50 =
            let con_220_181'8 = Unit0 in
            rev_168'4 con_220_181'8 k in
          put_string_95'4 lit_219_180'16 k in
      let fallback_183'4 = fun [eq_char_0'0,explode_0'0,append_58'8,map_71'8,length_76'8,put_chars_90'8,put_string_95'4,put_int_97'4,newline_99'4] line_183'13 k ->
        let lam_221_184'30 = fun [eq_char_0'0] c_184'30 k ->
          let k [c_184'30] app_223_184'46 =
            let lit_224_184'48 = 'o' in
            let k [c_184'30] app_222_184'48 =
              match app_222_184'48 with
              | true1 ->
                let lit_225_184'57 = '*' in
                k lit_225_184'57
              | false0 -> k c_184'30 in
            app_223_184'46 lit_224_184'48 k in
          eq_char_0'0 c_184'30 k in
        let k [explode_0'0,append_58'8,length_76'8,put_chars_90'8,put_string_95'4,put_int_97'4,newline_99'4,line_183'13] star_the_ohs_184'6 =
          let k [explode_0'0,append_58'8,put_chars_90'8,put_string_95'4,put_int_97'4,newline_99'4,line_183'13,star_the_ohs_184'6] n_185'6 =
            let lit_229_186'29 = "You wrote: \"" in
            let k [append_58'8,put_chars_90'8,put_string_95'4,put_int_97'4,newline_99'4,line_183'13,star_the_ohs_184'6,n_185'6] app_228_186'29 =
              let k [put_chars_90'8,put_string_95'4,put_int_97'4,newline_99'4,line_183'13,star_the_ohs_184'6,n_185'6] app_227_186'20 =
                let k [put_chars_90'8,put_string_95'4,put_int_97'4,newline_99'4,n_185'6,app_227_186'20] app_230_186'60 =
                  let k [put_chars_90'8,put_string_95'4,put_int_97'4,newline_99'4,n_185'6] app_226_186'46 =
                    let k [put_string_95'4,put_int_97'4,newline_99'4,n_185'6] __186'66 =
                      let lit_231_187'13 = "\" (" in
                      let k [put_string_95'4,put_int_97'4,newline_99'4,n_185'6] __187'19 =
                        let k [put_string_95'4,newline_99'4] __188'11 =
                          let lit_232_189'13 = " chars)" in
                          let k [newline_99'4] __189'22 =
                            let con_233_190'10 = Unit0 in
                            newline_99'4 con_233_190'10 k in
                          put_string_95'4 lit_232_189'13 k in
                        put_int_97'4 n_185'6 k in
                      put_string_95'4 lit_231_187'13 k in
                    put_chars_90'8 app_226_186'46 k in
                  app_227_186'20 app_230_186'60 k in
                star_the_ohs_184'6 line_183'13 k in
              append_58'8 app_228_186'29 k in
            explode_0'0 lit_229_186'29 k in
          length_76'8 line_183'13 k in
        map_71'8 lam_221_184'30 k in
      let split_words_192'4 = fun [::_0'0,eq_char_0'0,reverse_63'4] s_192'16 k ->
        let loop_193'10 = fix (fun [::_0'0,eq_char_0'0,reverse_63'4] loop_193'10 accWs_193'15 k ->
          let lam_251_193'21 = fun [::_0'0,eq_char_0'0,reverse_63'4,loop_193'10,accWs_193'15] accCs_193'21 k ->
            let lam_250_193'27 = fun [::_0'0,eq_char_0'0,reverse_63'4,loop_193'10,accWs_193'15,accCs_193'21] xs_193'27 k ->
              match xs_193'27 with
              | Nil0 ->
                let k [::_0'0,reverse_63'4,accWs_193'15] app_236_195'29 =
                  let k [reverse_63'4,accWs_193'15] app_235_195'35 =
                    let k [reverse_63'4] app_234_195'38 = reverse_63'4 app_234_195'38 k in
                    app_235_195'35 accWs_193'15 k in
                  ::_0'0 app_236_195'29 k in
                reverse_63'4 accCs_193'21 k
              | Cons1(x_197'6,xs_197'9) ->
                let k [::_0'0,reverse_63'4,loop_193'10,accWs_193'15,accCs_193'21,x_197'6,xs_197'9] app_238_198'18 =
                  let lit_239_198'20 = ' ' in
                  let k [::_0'0,reverse_63'4,loop_193'10,accWs_193'15,accCs_193'21,x_197'6,xs_197'9] app_237_198'20 =
                    match app_237_198'20 with
                    | true1 ->
                      let k [::_0'0,loop_193'10,accWs_193'15,xs_197'9] app_244_198'43 =
                        let k [loop_193'10,accWs_193'15,xs_197'9] app_243_198'49 =
                          let k [loop_193'10,xs_197'9] app_242_198'52 =
                            let k [xs_197'9] app_241_198'34 =
                              let con_245_198'59 = Nil0 in
                              let k [xs_197'9] app_240_198'59 = app_240_198'59 xs_197'9 k in
                              app_241_198'34 con_245_198'59 k in
                            loop_193'10 app_242_198'52 k in
                          app_243_198'49 accWs_193'15 k in
                        ::_0'0 app_244_198'43 k in
                      reverse_63'4 accCs_193'21 k
                    | false0 ->
                      let k [::_0'0,accCs_193'21,x_197'6,xs_197'9] app_247_199'17 =
                        let k [accCs_193'21,xs_197'9,app_247_199'17] app_249_199'25 =
                          let k [xs_197'9,app_247_199'17] app_248_199'27 =
                            let k [xs_197'9] app_246_199'23 = app_246_199'23 xs_197'9 k in
                            app_247_199'17 app_248_199'27 k in
                          app_249_199'25 accCs_193'21 k in
                        ::_0'0 x_197'6 k in
                      loop_193'10 accWs_193'15 k in
                  app_238_198'18 lit_239_198'20 k in
                eq_char_0'0 x_197'6 k in
            k lam_250_193'27 in
          k lam_251_193'21) in
        let con_254_201'7 = Nil0 in
        let k [s_192'16] app_253_201'7 =
          let con_255_201'10 = Nil0 in
          let k [s_192'16] app_252_201'10 = app_252_201'10 s_192'16 k in
          app_253_201'7 con_255_201'10 k in
        loop_193'10 con_254_201'7 k in
      let execute_203'4 = fun [explode_0'0,eq_char_list_56'4,runfib_131'4,runfact_148'4,runrev_176'4,fallback_183'4,split_words_192'4] line_203'12 k ->
        let k [explode_0'0,eq_char_list_56'4,runfib_131'4,runfact_148'4,runrev_176'4,fallback_183'4,line_203'12] words_204'6 =
          match words_204'6 with
          | Nil0 ->
            let con_256_206'10 = Unit0 in
            k con_256_206'10
          | Cons1(command_207'4,args_207'13) ->
            let k [explode_0'0,eq_char_list_56'4,runfib_131'4,runfact_148'4,runrev_176'4,fallback_183'4,line_203'12,command_207'4,args_207'13] app_258_208'21 =
              let lit_260_208'38 = "fib" in
              let k [explode_0'0,eq_char_list_56'4,runfib_131'4,runfact_148'4,runrev_176'4,fallback_183'4,line_203'12,command_207'4,args_207'13,app_258_208'21] app_259_208'38 =
                let k [explode_0'0,eq_char_list_56'4,runfib_131'4,runfact_148'4,runrev_176'4,fallback_183'4,line_203'12,command_207'4,args_207'13] app_257_208'29 =
                  match app_257_208'29 with
                  | true1 -> runfib_131'4 args_207'13 k
                  | false0 ->
                    let k [explode_0'0,eq_char_list_56'4,runfact_148'4,runrev_176'4,fallback_183'4,line_203'12,command_207'4,args_207'13] app_262_209'23 =
                      let lit_264_209'40 = "fact" in
                      let k [explode_0'0,eq_char_list_56'4,runfact_148'4,runrev_176'4,fallback_183'4,line_203'12,command_207'4,args_207'13,app_262_209'23] app_263_209'40 =
                        let k [explode_0'0,eq_char_list_56'4,runfact_148'4,runrev_176'4,fallback_183'4,line_203'12,command_207'4,args_207'13] app_261_209'31 =
                          match app_261_209'31 with
                          | true1 -> runfact_148'4 args_207'13 k
                          | false0 ->
                            let k [explode_0'0,runrev_176'4,fallback_183'4,line_203'12,args_207'13] app_266_210'25 =
                              let lit_268_210'42 = "rev" in
                              let k [runrev_176'4,fallback_183'4,line_203'12,args_207'13,app_266_210'25] app_267_210'42 =
                                let k [runrev_176'4,fallback_183'4,line_203'12,args_207'13] app_265_210'33 =
                                  match app_265_210'33 with
                                  | true1 -> runrev_176'4 args_207'13 k
                                  | false0 -> fallback_183'4 line_203'12 k in
                                app_266_210'25 app_267_210'42 k in
                              explode_0'0 lit_268_210'42 k in
                            eq_char_list_56'4 command_207'4 k in
                        app_262_209'23 app_263_209'40 k in
                      explode_0'0 lit_264_209'40 k in
                    eq_char_list_56'4 command_207'4 k in
                app_258_208'21 app_259_208'38 k in
              explode_0'0 lit_260_208'38 k in
            eq_char_list_56'4 command_207'4 k in
        split_words_192'4 line_203'12 k in
      let mainloop_213'8 = fix (fun [eq_char_list_56'4,put_chars_90'8,read_line_101'4,single_controlD_166'4,execute_203'4] mainloop_213'8 __213'17 k ->
        let lit_270_214'13 = '>' in
        let lit_272_214'17 = ' ' in
        let con_273_214'20 = Nil0 in
        let con_271_214'17 = Cons1[lit_272_214'17,con_273_214'20] in
        let con_269_214'13 = Cons1[lit_270_214'13,con_271_214'17] in
        let k [eq_char_list_56'4,read_line_101'4,single_controlD_166'4,execute_203'4,mainloop_213'8] __214'21 =
          let con_274_215'21 = Unit0 in
          let k [eq_char_list_56'4,single_controlD_166'4,execute_203'4,mainloop_213'8] xs_215'6 =
            let k [single_controlD_166'4,execute_203'4,mainloop_213'8,xs_215'6] app_276_216'18 =
              let k [execute_203'4,mainloop_213'8,xs_215'6] app_275_216'21 =
                match app_275_216'21 with
                | true1 ->
                  let con_277_216'42 = Unit0 in
                  k con_277_216'42
                | false0 ->
                  let k [mainloop_213'8] __217'15 =
                    let con_278_217'26 = Unit0 in
                    mainloop_213'8 con_278_217'26 k in
                  execute_203'4 xs_215'6 k in
              app_276_216'18 single_controlD_166'4 k in
            eq_char_list_56'4 xs_215'6 k in
          read_line_101'4 con_274_215'21 k in
        put_chars_90'8 con_269_214'13 k) in
      let main_219'4 = fun [put_string_95'4,mainloop_213'8] __219'9 k ->
        let lit_279_220'13 = "This is a shell prototype. Try: fib, fact, rev\n" in
        let k [mainloop_213'8] __220'63 =
          let con_280_221'11 = Unit0 in
          mainloop_213'8 con_280_221'11 k in
        put_string_95'4 lit_279_220'13 k in
      let con_281_0'0 = Unit0 in
      main_219'4 con_281_0'0 k in
    app_206_166'28 con_209_166'31 k in
  ::_0'0 app_207_166'26 k in
chr_0'0 lit_208_166'26 k
