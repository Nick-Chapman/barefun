(*stage2*)
let k () = ()
let eq_list_11_47'8 = fix (fun [] eq_list_2_47'8 eq_1_47'16 k ->
  let lam_10_47'19 = fun [eq_1_47'16,eq_list_2_47'8] xs_3_47'19 k ->
    let lam_9_47'22 = fun [eq_1_47'16,eq_list_2_47'8,xs_3_47'19] ys_4_47'22 k ->
      match xs_3_47'19 with
      | Nil0 ->
        match ys_4_47'22 with
        | Nil0 ->
          let con_1_49'33 = true1 in
          k con_1_49'33
        | Cons1(__5_49'40,__6_49'43) ->
          let con_2_49'48 = false0 in
          k con_2_49'48
      | Cons1(x_7_50'4,xs_8_50'7) ->
        match ys_4_47'22 with
        | Nil0 ->
          let con_3_52'13 = false0 in
          k con_3_52'13
        | Cons1(y_9_53'7,ys_10_53'10) ->
          let k [eq_1_47'16,eq_list_2_47'8,xs_8_50'7,y_9_53'7,ys_10_53'10] app_5_54'14 =
            let k [eq_1_47'16,eq_list_2_47'8,xs_8_50'7,ys_10_53'10] app_4_54'16 =
              match app_4_54'16 with
              | true1 ->
                let k [xs_8_50'7,ys_10_53'10] app_7_54'31 =
                  let k [ys_10_53'10] app_6_54'34 = app_6_54'34 ys_10_53'10 k in
                  app_7_54'31 xs_8_50'7 k in
                eq_list_2_47'8 eq_1_47'16 k
              | false0 ->
                let con_8_54'45 = false0 in
                k con_8_54'45 in
            app_5_54'14 y_9_53'7 k in
          eq_1_47'16 x_7_50'4 k in
    k lam_9_47'22 in
  k lam_10_47'19) in
let append_18_58'8 = fix (fun [] append_13_58'8 xs_12_58'15 k ->
  let lam_13_58'18 = fun [xs_12_58'15,append_13_58'8] ys_14_58'18 k ->
    match xs_12_58'15 with
    | Nil0 -> k ys_14_58'18
    | Cons1(x_15_61'4,xs_16_61'7) ->
      let k [ys_14_58'18,x_15_61'4] app_11_61'28 =
        let k [x_15_61'4] xs_17_45'11 =
          let con_12_0'0 = Cons1[x_15_61'4,xs_17_45'11] in
          k con_12_0'0 in
        app_11_61'28 ys_14_58'18 k in
      append_13_58'8 xs_16_61'7 k in
  k lam_13_58'18) in
let map_26_71'8 = fix (fun [] map_20_71'8 f_19_71'12 k ->
  let lam_19_71'14 = fun [f_19_71'12,map_20_71'8] xs_21_71'14 k ->
    match xs_21_71'14 with
    | Nil0 ->
      let con_14_73'10 = Nil0 in
      k con_14_73'10
    | Cons1(x_22_74'4,xs_23_74'7) ->
      let k [f_19_71'12,map_20_71'8,xs_23_74'7] x_24_0'0 =
        let uLET_15_0'0 = fun [x_24_0'0] y_25_0'0 k ->
          let con_16_0'0 = Cons1[x_24_0'0,y_25_0'0] in
          k con_16_0'0 in
        let k [uLET_15_0'0,xs_23_74'7] app_18_74'24 =
          let k [uLET_15_0'0] app_17_74'26 = uLET_15_0'0 app_17_74'26 k in
          app_18_74'24 xs_23_74'7 k in
        map_20_71'8 f_19_71'12 k in
      f_19_71'12 x_22_74'4 k in
  k lam_19_71'14) in
let length_33_76'8 = fix (fun [] length_28_76'8 xs_27_76'15 k ->
  match xs_27_76'15 with
  | Nil0 ->
    let lit_20_78'10 = 0 in
    k lit_20_78'10
  | Cons1(__29_79'4,xs_30_79'7) ->
    let x_31_0'0 = 1 in
    let uLET_21_0'0 = fun [x_31_0'0] y_32_0'0 k ->
      let prim_22_0'0 = PRIM_AddInt(x_31_0'0,y_32_0'0) in
      k prim_22_0'0 in
    let k [uLET_21_0'0] app_23_79'27 = uLET_21_0'0 app_23_79'27 k in
    length_28_76'8 xs_30_79'7 k) in
let put_chars_52_90'8 = fix (fun [] put_chars_35_90'8 xs_34_90'18 k ->
  match xs_34_90'18 with
  | Nil0 ->
    let con_24_92'10 = Unit0 in
    k con_24_92'10
  | Cons1(x_36_93'4,xs_37_93'7) ->
    let backspace_38_13'6 = 8 in
    let n_39_14'6 = PRIM_CharOrd(x_36_93'4) in
    let prim_25_0'0 = PRIM_EqInt(n_39_14'6,backspace_38_13'6) in
    let k [put_chars_35_90'8,xs_37_93'7] __51_93'23 = put_chars_35_90'8 xs_37_93'7 k in
    match prim_25_0'0 with
    | true1 ->
      let prim_26_0'0 = PRIM_PutChar(x_36_93'4) in
      k prim_26_0'0
    | false0 ->
      let y_40_0'0 = '\n' in
      let uLET_27_0'0 = PRIM_EqChar(x_36_93'4,y_40_0'0) in
      match uLET_27_0'0 with
      | true1 ->
        let prim_28_0'0 = PRIM_PutChar(x_36_93'4) in
        k prim_28_0'0
      | false0 ->
        let b_41_7'10 = 26 in
        let uLET_29_7'10 = PRIM_LessInt(b_41_7'10,n_39_14'6) in
        match uLET_29_7'10 with
        | true1 ->
          let prim_30_0'0 = PRIM_PutChar(x_36_93'4) in
          k prim_30_0'0
        | false0 ->
          let x_42_0'0 = '^' in
          let __43_18'21 = PRIM_PutChar(x_42_0'0) in
          let x_44_0'0 = 'A' in
          let x_45_0'0 = PRIM_CharOrd(x_44_0'0) in
          let uLET_32_0'0 = fun [x_45_0'0] y_46_0'0 k ->
            let prim_33_0'0 = PRIM_AddInt(x_45_0'0,y_46_0'0) in
            k prim_33_0'0 in
          let k [] x_47_0'0 =
            let uLET_31_0'0 = fun [x_47_0'0] y_48_0'0 k ->
              let prim_34_0'0 = PRIM_SubInt(x_47_0'0,y_48_0'0) in
              k prim_34_0'0 in
            let lit_35_18'52 = 1 in
            let k [] x_49_0'0 =
              let x_50_0'0 = PRIM_CharChr(x_49_0'0) in
              let prim_36_0'0 = PRIM_PutChar(x_50_0'0) in
              k prim_36_0'0 in
            uLET_31_0'0 lit_35_18'52 k in
          uLET_32_0'0 n_39_14'6 k) in
let fib_60_121'8 = fix (fun [] fib_54_121'8 n_53_121'12 k ->
  let y_55_0'0 = 2 in
  let uLET_37_0'0 = PRIM_LessInt(n_53_121'12,y_55_0'0) in
  match uLET_37_0'0 with
  | true1 -> k n_53_121'12
  | false0 ->
    let y_56_0'0 = 1 in
    let uLET_39_0'0 = PRIM_SubInt(n_53_121'12,y_56_0'0) in
    let k [n_53_121'12,fib_54_121'8] x_57_0'0 =
      let uLET_38_0'0 = fun [x_57_0'0] y_58_0'0 k ->
        let prim_40_0'0 = PRIM_AddInt(x_57_0'0,y_58_0'0) in
        k prim_40_0'0 in
      let y_59_0'0 = 2 in
      let uLET_42_0'0 = PRIM_SubInt(n_53_121'12,y_59_0'0) in
      let k [uLET_38_0'0] app_41_123'39 = uLET_38_0'0 app_41_123'39 k in
      fib_54_121'8 uLET_42_0'0 k in
    fib_54_121'8 uLET_39_0'0 k) in
let fact_68_125'8 = fix (fun [] fact_62_125'8 n_61_125'13 k ->
  let b_63_9'11 = 2 in
  let b_64_2'8 = PRIM_LessInt(n_61_125'13,b_63_9'11) in
  let k [n_61_125'13,fact_62_125'8] uLET_43_9'11 =
    match uLET_43_9'11 with
    | true1 ->
      let y_65_0'0 = 1 in
      let uLET_47_0'0 = PRIM_SubInt(n_61_125'13,y_65_0'0) in
      let k [n_61_125'13] x_66_0'0 =
        let uLET_46_0'0 = fun [x_66_0'0] y_67_0'0 k ->
          let prim_48_0'0 = PRIM_MulInt(x_66_0'0,y_67_0'0) in
          k prim_48_0'0 in
        uLET_46_0'0 n_61_125'13 k in
      fact_62_125'8 uLET_47_0'0 k
    | false0 ->
      let lit_49_127'37 = 1 in
      k lit_49_127'37 in
  match b_64_2'8 with
  | true1 ->
    let con_44_4'12 = false0 in
    k con_44_4'12
  | false0 ->
    let con_45_5'13 = true1 in
    k con_45_5'13) in
let x_69_0'0 = 4 in
let x_70_0'0 = PRIM_CharChr(x_69_0'0) in
let uLET_50_0'0 = fun [x_70_0'0] y_71_0'0 k ->
  let con_51_0'0 = Cons1[x_70_0'0,y_71_0'0] in
  k con_51_0'0 in
let con_52_166'31 = Nil0 in
let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8] single_controlD_72_166'4 =
  let mainloop_855_213'8 = fix (fun [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8,single_controlD_72_166'4] mainloop_74_213'8 __73_213'17 k ->
    let lit_54_214'13 = '>' in
    let lit_56_214'17 = ' ' in
    let con_57_214'20 = Nil0 in
    let con_55_214'17 = Cons1[lit_56_214'17,con_57_214'20] in
    let con_53_214'13 = Cons1[lit_54_214'13,con_55_214'17] in
    let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8,single_controlD_72_166'4,mainloop_74_213'8] __75_214'21 =
      let __76_101'14 = Unit0 in
      let x_77_0'0 = 4 in
      let controlD_78_102'6 = PRIM_CharChr(x_77_0'0) in
      let loop_257_103'10 = fix (fun [controlD_78_102'6] loop_80_103'10 acc_79_103'15 k ->
        let x_81_0'0 = Unit0 in
        let c_82_104'8 = PRIM_GetChar(x_81_0'0) in
        let n_83_105'8 = PRIM_CharOrd(c_82_104'8) in
        let y_84_0'0 = '\n' in
        let uLET_58_0'0 = PRIM_EqChar(c_82_104'8,y_84_0'0) in
        match uLET_58_0'0 with
        | true1 ->
          let __85_99'12 = Unit0 in
          let c_86_12'13 = '\n' in
          let backspace_87_13'6 = 8 in
          let n_88_14'6 = PRIM_CharOrd(c_86_12'13) in
          let prim_59_0'0 = PRIM_EqInt(n_88_14'6,backspace_87_13'6) in
          let k [acc_79_103'15] __100_106'37 =
            let loop_106_64'10 = fix (fun [] loop_102_64'10 acc_101_64'15 k ->
              let lam_73_64'19 = fun [acc_101_64'15,loop_102_64'10] xs_103_64'19 k ->
                match xs_103_64'19 with
                | Nil0 -> k acc_101_64'15
                | Cons1(x_104_67'6,xs_105_67'9) ->
                  let con_72_0'0 = Cons1[x_104_67'6,acc_101_64'15] in
                  let k [xs_105_67'9] app_71_67'20 = app_71_67'20 xs_105_67'9 k in
                  loop_102_64'10 con_72_0'0 k in
              k lam_73_64'19) in
            let con_75_69'7 = Nil0 in
            let k [acc_79_103'15] app_74_69'7 = app_74_69'7 acc_79_103'15 k in
            loop_106_64'10 con_75_69'7 k in
          match prim_59_0'0 with
          | true1 ->
            let prim_60_0'0 = PRIM_PutChar(c_86_12'13) in
            k prim_60_0'0
          | false0 ->
            let y_89_0'0 = '\n' in
            let uLET_61_0'0 = PRIM_EqChar(c_86_12'13,y_89_0'0) in
            match uLET_61_0'0 with
            | true1 ->
              let prim_62_0'0 = PRIM_PutChar(c_86_12'13) in
              k prim_62_0'0
            | false0 ->
              let b_90_7'10 = 26 in
              let uLET_63_7'10 = PRIM_LessInt(b_90_7'10,n_88_14'6) in
              match uLET_63_7'10 with
              | true1 ->
                let prim_64_0'0 = PRIM_PutChar(c_86_12'13) in
                k prim_64_0'0
              | false0 ->
                let x_91_0'0 = '^' in
                let __92_18'21 = PRIM_PutChar(x_91_0'0) in
                let x_93_0'0 = 'A' in
                let x_94_0'0 = PRIM_CharOrd(x_93_0'0) in
                let uLET_66_0'0 = fun [x_94_0'0] y_95_0'0 k ->
                  let prim_67_0'0 = PRIM_AddInt(x_94_0'0,y_95_0'0) in
                  k prim_67_0'0 in
                let k [] x_96_0'0 =
                  let uLET_65_0'0 = fun [x_96_0'0] y_97_0'0 k ->
                    let prim_68_0'0 = PRIM_SubInt(x_96_0'0,y_97_0'0) in
                    k prim_68_0'0 in
                  let lit_69_18'52 = 1 in
                  let k [] x_98_0'0 =
                    let x_99_0'0 = PRIM_CharChr(x_98_0'0) in
                    let prim_70_0'0 = PRIM_PutChar(x_99_0'0) in
                    k prim_70_0'0 in
                  uLET_65_0'0 lit_69_18'52 k in
                uLET_66_0'0 n_88_14'6 k
        | false0 ->
          let prim_76_0'0 = PRIM_EqChar(c_82_104'8,controlD_78_102'6) in
          match prim_76_0'0 with
          | true1 ->
            let backspace_107_13'6 = 8 in
            let n_108_14'6 = PRIM_CharOrd(c_82_104'8) in
            let prim_77_0'0 = PRIM_EqInt(n_108_14'6,backspace_107_13'6) in
            let k [controlD_78_102'6,acc_79_103'15] __120_107'44 =
              let __121_99'12 = Unit0 in
              let c_122_12'13 = '\n' in
              let backspace_123_13'6 = 8 in
              let n_124_14'6 = PRIM_CharOrd(c_122_12'13) in
              let prim_89_0'0 = PRIM_EqInt(n_124_14'6,backspace_123_13'6) in
              let k [controlD_78_102'6,acc_79_103'15] __136_107'55 =
                let xs_137_63'12 = Cons1[controlD_78_102'6,acc_79_103'15] in
                let loop_143_64'10 = fix (fun [] loop_139_64'10 acc_138_64'15 k ->
                  let lam_103_64'19 = fun [acc_138_64'15,loop_139_64'10] xs_140_64'19 k ->
                    match xs_140_64'19 with
                    | Nil0 -> k acc_138_64'15
                    | Cons1(x_141_67'6,xs_142_67'9) ->
                      let con_102_0'0 = Cons1[x_141_67'6,acc_138_64'15] in
                      let k [xs_142_67'9] app_101_67'20 = app_101_67'20 xs_142_67'9 k in
                      loop_139_64'10 con_102_0'0 k in
                  k lam_103_64'19) in
                let con_105_69'7 = Nil0 in
                let k [xs_137_63'12] app_104_69'7 = app_104_69'7 xs_137_63'12 k in
                loop_143_64'10 con_105_69'7 k in
              match prim_89_0'0 with
              | true1 ->
                let prim_90_0'0 = PRIM_PutChar(c_122_12'13) in
                k prim_90_0'0
              | false0 ->
                let y_125_0'0 = '\n' in
                let uLET_91_0'0 = PRIM_EqChar(c_122_12'13,y_125_0'0) in
                match uLET_91_0'0 with
                | true1 ->
                  let prim_92_0'0 = PRIM_PutChar(c_122_12'13) in
                  k prim_92_0'0
                | false0 ->
                  let b_126_7'10 = 26 in
                  let uLET_93_7'10 = PRIM_LessInt(b_126_7'10,n_124_14'6) in
                  match uLET_93_7'10 with
                  | true1 ->
                    let prim_94_0'0 = PRIM_PutChar(c_122_12'13) in
                    k prim_94_0'0
                  | false0 ->
                    let x_127_0'0 = '^' in
                    let __128_18'21 = PRIM_PutChar(x_127_0'0) in
                    let x_129_0'0 = 'A' in
                    let x_130_0'0 = PRIM_CharOrd(x_129_0'0) in
                    let uLET_96_0'0 = fun [x_130_0'0] y_131_0'0 k ->
                      let prim_97_0'0 = PRIM_AddInt(x_130_0'0,y_131_0'0) in
                      k prim_97_0'0 in
                    let k [] x_132_0'0 =
                      let uLET_95_0'0 = fun [x_132_0'0] y_133_0'0 k ->
                        let prim_98_0'0 = PRIM_SubInt(x_132_0'0,y_133_0'0) in
                        k prim_98_0'0 in
                      let lit_99_18'52 = 1 in
                      let k [] x_134_0'0 =
                        let x_135_0'0 = PRIM_CharChr(x_134_0'0) in
                        let prim_100_0'0 = PRIM_PutChar(x_135_0'0) in
                        k prim_100_0'0 in
                      uLET_95_0'0 lit_99_18'52 k in
                    uLET_96_0'0 n_124_14'6 k in
            match prim_77_0'0 with
            | true1 ->
              let prim_78_0'0 = PRIM_PutChar(c_82_104'8) in
              k prim_78_0'0
            | false0 ->
              let y_109_0'0 = '\n' in
              let uLET_79_0'0 = PRIM_EqChar(c_82_104'8,y_109_0'0) in
              match uLET_79_0'0 with
              | true1 ->
                let prim_80_0'0 = PRIM_PutChar(c_82_104'8) in
                k prim_80_0'0
              | false0 ->
                let b_110_7'10 = 26 in
                let uLET_81_7'10 = PRIM_LessInt(b_110_7'10,n_108_14'6) in
                match uLET_81_7'10 with
                | true1 ->
                  let prim_82_0'0 = PRIM_PutChar(c_82_104'8) in
                  k prim_82_0'0
                | false0 ->
                  let x_111_0'0 = '^' in
                  let __112_18'21 = PRIM_PutChar(x_111_0'0) in
                  let x_113_0'0 = 'A' in
                  let x_114_0'0 = PRIM_CharOrd(x_113_0'0) in
                  let uLET_84_0'0 = fun [x_114_0'0] y_115_0'0 k ->
                    let prim_85_0'0 = PRIM_AddInt(x_114_0'0,y_115_0'0) in
                    k prim_85_0'0 in
                  let k [] x_116_0'0 =
                    let uLET_83_0'0 = fun [x_116_0'0] y_117_0'0 k ->
                      let prim_86_0'0 = PRIM_SubInt(x_116_0'0,y_117_0'0) in
                      k prim_86_0'0 in
                    let lit_87_18'52 = 1 in
                    let k [] x_118_0'0 =
                      let x_119_0'0 = PRIM_CharChr(x_118_0'0) in
                      let prim_88_0'0 = PRIM_PutChar(x_119_0'0) in
                      k prim_88_0'0 in
                    uLET_83_0'0 lit_87_18'52 k in
                  uLET_84_0'0 n_108_14'6 k
          | false0 ->
            let b_144_7'10 = 127 in
            let uLET_106_7'10 = PRIM_LessInt(b_144_7'10,n_83_105'8) in
            match uLET_106_7'10 with
            | true1 -> loop_80_103'10 acc_79_103'15 k
            | false0 ->
              let y_145_0'0 = 127 in
              let uLET_107_0'0 = PRIM_EqInt(n_83_105'8,y_145_0'0) in
              match uLET_107_0'0 with
              | true1 ->
                match acc_79_103'15 with
                | Nil0 -> loop_80_103'10 acc_79_103'15 k
                | Cons1(c_146_112'14,tail_147_112'17) ->
                  let a_148_8'9 = PRIM_CharOrd(c_146_112'14) in
                  let uLET_109_8'9 = fun [a_148_8'9] b_149_8'11 k ->
                    let b_150_2'8 = PRIM_LessInt(b_149_8'11,a_148_8'9) in
                    match b_150_2'8 with
                    | true1 ->
                      let con_110_4'12 = false0 in
                      k con_110_4'12
                    | false0 ->
                      let con_111_5'13 = true1 in
                      k con_111_5'13 in
                  let lit_112_113'28 = 26 in
                  let k [loop_80_103'10,tail_147_112'17] app_108_113'28 =
                    let k [loop_80_103'10,tail_147_112'17] __196_113'58 =
                      let __197_20'15 = Unit0 in
                      let x_198_0'0 = 8 in
                      let backspace_199_21'6 = PRIM_CharChr(x_198_0'0) in
                      let backspace_200_13'6 = 8 in
                      let n_201_14'6 = PRIM_CharOrd(backspace_199_21'6) in
                      let prim_150_0'0 = PRIM_EqInt(n_201_14'6,backspace_200_13'6) in
                      let k [loop_80_103'10,tail_147_112'17,backspace_199_21'6] __213_23'20 =
                        let c_214_12'13 = ' ' in
                        let backspace_215_13'6 = 8 in
                        let n_216_14'6 = PRIM_CharOrd(c_214_12'13) in
                        let prim_162_0'0 = PRIM_EqInt(n_216_14'6,backspace_215_13'6) in
                        let k [loop_80_103'10,tail_147_112'17,backspace_199_21'6] __228_24'14 =
                          let backspace_229_13'6 = 8 in
                          let n_230_14'6 = PRIM_CharOrd(backspace_199_21'6) in
                          let prim_174_0'0 = PRIM_EqInt(n_230_14'6,backspace_229_13'6) in
                          let k [loop_80_103'10,tail_147_112'17] __242_114'27 = loop_80_103'10 tail_147_112'17 k in
                          match prim_174_0'0 with
                          | true1 ->
                            let prim_175_0'0 = PRIM_PutChar(backspace_199_21'6) in
                            k prim_175_0'0
                          | false0 ->
                            let y_231_0'0 = '\n' in
                            let uLET_176_0'0 = PRIM_EqChar(backspace_199_21'6,y_231_0'0) in
                            match uLET_176_0'0 with
                            | true1 ->
                              let prim_177_0'0 = PRIM_PutChar(backspace_199_21'6) in
                              k prim_177_0'0
                            | false0 ->
                              let b_232_7'10 = 26 in
                              let uLET_178_7'10 = PRIM_LessInt(b_232_7'10,n_230_14'6) in
                              match uLET_178_7'10 with
                              | true1 ->
                                let prim_179_0'0 = PRIM_PutChar(backspace_199_21'6) in
                                k prim_179_0'0
                              | false0 ->
                                let x_233_0'0 = '^' in
                                let __234_18'21 = PRIM_PutChar(x_233_0'0) in
                                let x_235_0'0 = 'A' in
                                let x_236_0'0 = PRIM_CharOrd(x_235_0'0) in
                                let uLET_181_0'0 = fun [x_236_0'0] y_237_0'0 k ->
                                  let prim_182_0'0 = PRIM_AddInt(x_236_0'0,y_237_0'0) in
                                  k prim_182_0'0 in
                                let k [] x_238_0'0 =
                                  let uLET_180_0'0 = fun [x_238_0'0] y_239_0'0 k ->
                                    let prim_183_0'0 = PRIM_SubInt(x_238_0'0,y_239_0'0) in
                                    k prim_183_0'0 in
                                  let lit_184_18'52 = 1 in
                                  let k [] x_240_0'0 =
                                    let x_241_0'0 = PRIM_CharChr(x_240_0'0) in
                                    let prim_185_0'0 = PRIM_PutChar(x_241_0'0) in
                                    k prim_185_0'0 in
                                  uLET_180_0'0 lit_184_18'52 k in
                                uLET_181_0'0 n_230_14'6 k in
                        match prim_162_0'0 with
                        | true1 ->
                          let prim_163_0'0 = PRIM_PutChar(c_214_12'13) in
                          k prim_163_0'0
                        | false0 ->
                          let y_217_0'0 = '\n' in
                          let uLET_164_0'0 = PRIM_EqChar(c_214_12'13,y_217_0'0) in
                          match uLET_164_0'0 with
                          | true1 ->
                            let prim_165_0'0 = PRIM_PutChar(c_214_12'13) in
                            k prim_165_0'0
                          | false0 ->
                            let b_218_7'10 = 26 in
                            let uLET_166_7'10 = PRIM_LessInt(b_218_7'10,n_216_14'6) in
                            match uLET_166_7'10 with
                            | true1 ->
                              let prim_167_0'0 = PRIM_PutChar(c_214_12'13) in
                              k prim_167_0'0
                            | false0 ->
                              let x_219_0'0 = '^' in
                              let __220_18'21 = PRIM_PutChar(x_219_0'0) in
                              let x_221_0'0 = 'A' in
                              let x_222_0'0 = PRIM_CharOrd(x_221_0'0) in
                              let uLET_169_0'0 = fun [x_222_0'0] y_223_0'0 k ->
                                let prim_170_0'0 = PRIM_AddInt(x_222_0'0,y_223_0'0) in
                                k prim_170_0'0 in
                              let k [] x_224_0'0 =
                                let uLET_168_0'0 = fun [x_224_0'0] y_225_0'0 k ->
                                  let prim_171_0'0 = PRIM_SubInt(x_224_0'0,y_225_0'0) in
                                  k prim_171_0'0 in
                                let lit_172_18'52 = 1 in
                                let k [] x_226_0'0 =
                                  let x_227_0'0 = PRIM_CharChr(x_226_0'0) in
                                  let prim_173_0'0 = PRIM_PutChar(x_227_0'0) in
                                  k prim_173_0'0 in
                                uLET_168_0'0 lit_172_18'52 k in
                              uLET_169_0'0 n_216_14'6 k in
                      match prim_150_0'0 with
                      | true1 ->
                        let prim_151_0'0 = PRIM_PutChar(backspace_199_21'6) in
                        k prim_151_0'0
                      | false0 ->
                        let y_202_0'0 = '\n' in
                        let uLET_152_0'0 = PRIM_EqChar(backspace_199_21'6,y_202_0'0) in
                        match uLET_152_0'0 with
                        | true1 ->
                          let prim_153_0'0 = PRIM_PutChar(backspace_199_21'6) in
                          k prim_153_0'0
                        | false0 ->
                          let b_203_7'10 = 26 in
                          let uLET_154_7'10 = PRIM_LessInt(b_203_7'10,n_201_14'6) in
                          match uLET_154_7'10 with
                          | true1 ->
                            let prim_155_0'0 = PRIM_PutChar(backspace_199_21'6) in
                            k prim_155_0'0
                          | false0 ->
                            let x_204_0'0 = '^' in
                            let __205_18'21 = PRIM_PutChar(x_204_0'0) in
                            let x_206_0'0 = 'A' in
                            let x_207_0'0 = PRIM_CharOrd(x_206_0'0) in
                            let uLET_157_0'0 = fun [x_207_0'0] y_208_0'0 k ->
                              let prim_158_0'0 = PRIM_AddInt(x_207_0'0,y_208_0'0) in
                              k prim_158_0'0 in
                            let k [] x_209_0'0 =
                              let uLET_156_0'0 = fun [x_209_0'0] y_210_0'0 k ->
                                let prim_159_0'0 = PRIM_SubInt(x_209_0'0,y_210_0'0) in
                                k prim_159_0'0 in
                              let lit_160_18'52 = 1 in
                              let k [] x_211_0'0 =
                                let x_212_0'0 = PRIM_CharChr(x_211_0'0) in
                                let prim_161_0'0 = PRIM_PutChar(x_212_0'0) in
                                k prim_161_0'0 in
                              uLET_156_0'0 lit_160_18'52 k in
                            uLET_157_0'0 n_201_14'6 k in
                    match app_108_113'28 with
                    | true1 ->
                      let __151_20'15 = Unit0 in
                      let x_152_0'0 = 8 in
                      let backspace_153_21'6 = PRIM_CharChr(x_152_0'0) in
                      let backspace_154_13'6 = 8 in
                      let n_155_14'6 = PRIM_CharOrd(backspace_153_21'6) in
                      let prim_113_0'0 = PRIM_EqInt(n_155_14'6,backspace_154_13'6) in
                      let k [backspace_153_21'6] __167_23'20 =
                        let c_168_12'13 = ' ' in
                        let backspace_169_13'6 = 8 in
                        let n_170_14'6 = PRIM_CharOrd(c_168_12'13) in
                        let prim_125_0'0 = PRIM_EqInt(n_170_14'6,backspace_169_13'6) in
                        let k [backspace_153_21'6] __182_24'14 =
                          let backspace_183_13'6 = 8 in
                          let n_184_14'6 = PRIM_CharOrd(backspace_153_21'6) in
                          let prim_137_0'0 = PRIM_EqInt(n_184_14'6,backspace_183_13'6) in
                          match prim_137_0'0 with
                          | true1 ->
                            let prim_138_0'0 = PRIM_PutChar(backspace_153_21'6) in
                            k prim_138_0'0
                          | false0 ->
                            let y_185_0'0 = '\n' in
                            let uLET_139_0'0 = PRIM_EqChar(backspace_153_21'6,y_185_0'0) in
                            match uLET_139_0'0 with
                            | true1 ->
                              let prim_140_0'0 = PRIM_PutChar(backspace_153_21'6) in
                              k prim_140_0'0
                            | false0 ->
                              let b_186_7'10 = 26 in
                              let uLET_141_7'10 = PRIM_LessInt(b_186_7'10,n_184_14'6) in
                              match uLET_141_7'10 with
                              | true1 ->
                                let prim_142_0'0 = PRIM_PutChar(backspace_153_21'6) in
                                k prim_142_0'0
                              | false0 ->
                                let x_187_0'0 = '^' in
                                let __188_18'21 = PRIM_PutChar(x_187_0'0) in
                                let x_189_0'0 = 'A' in
                                let x_190_0'0 = PRIM_CharOrd(x_189_0'0) in
                                let uLET_144_0'0 = fun [x_190_0'0] y_191_0'0 k ->
                                  let prim_145_0'0 = PRIM_AddInt(x_190_0'0,y_191_0'0) in
                                  k prim_145_0'0 in
                                let k [] x_192_0'0 =
                                  let uLET_143_0'0 = fun [x_192_0'0] y_193_0'0 k ->
                                    let prim_146_0'0 = PRIM_SubInt(x_192_0'0,y_193_0'0) in
                                    k prim_146_0'0 in
                                  let lit_147_18'52 = 1 in
                                  let k [] x_194_0'0 =
                                    let x_195_0'0 = PRIM_CharChr(x_194_0'0) in
                                    let prim_148_0'0 = PRIM_PutChar(x_195_0'0) in
                                    k prim_148_0'0 in
                                  uLET_143_0'0 lit_147_18'52 k in
                                uLET_144_0'0 n_184_14'6 k in
                        match prim_125_0'0 with
                        | true1 ->
                          let prim_126_0'0 = PRIM_PutChar(c_168_12'13) in
                          k prim_126_0'0
                        | false0 ->
                          let y_171_0'0 = '\n' in
                          let uLET_127_0'0 = PRIM_EqChar(c_168_12'13,y_171_0'0) in
                          match uLET_127_0'0 with
                          | true1 ->
                            let prim_128_0'0 = PRIM_PutChar(c_168_12'13) in
                            k prim_128_0'0
                          | false0 ->
                            let b_172_7'10 = 26 in
                            let uLET_129_7'10 = PRIM_LessInt(b_172_7'10,n_170_14'6) in
                            match uLET_129_7'10 with
                            | true1 ->
                              let prim_130_0'0 = PRIM_PutChar(c_168_12'13) in
                              k prim_130_0'0
                            | false0 ->
                              let x_173_0'0 = '^' in
                              let __174_18'21 = PRIM_PutChar(x_173_0'0) in
                              let x_175_0'0 = 'A' in
                              let x_176_0'0 = PRIM_CharOrd(x_175_0'0) in
                              let uLET_132_0'0 = fun [x_176_0'0] y_177_0'0 k ->
                                let prim_133_0'0 = PRIM_AddInt(x_176_0'0,y_177_0'0) in
                                k prim_133_0'0 in
                              let k [] x_178_0'0 =
                                let uLET_131_0'0 = fun [x_178_0'0] y_179_0'0 k ->
                                  let prim_134_0'0 = PRIM_SubInt(x_178_0'0,y_179_0'0) in
                                  k prim_134_0'0 in
                                let lit_135_18'52 = 1 in
                                let k [] x_180_0'0 =
                                  let x_181_0'0 = PRIM_CharChr(x_180_0'0) in
                                  let prim_136_0'0 = PRIM_PutChar(x_181_0'0) in
                                  k prim_136_0'0 in
                                uLET_131_0'0 lit_135_18'52 k in
                              uLET_132_0'0 n_170_14'6 k in
                      match prim_113_0'0 with
                      | true1 ->
                        let prim_114_0'0 = PRIM_PutChar(backspace_153_21'6) in
                        k prim_114_0'0
                      | false0 ->
                        let y_156_0'0 = '\n' in
                        let uLET_115_0'0 = PRIM_EqChar(backspace_153_21'6,y_156_0'0) in
                        match uLET_115_0'0 with
                        | true1 ->
                          let prim_116_0'0 = PRIM_PutChar(backspace_153_21'6) in
                          k prim_116_0'0
                        | false0 ->
                          let b_157_7'10 = 26 in
                          let uLET_117_7'10 = PRIM_LessInt(b_157_7'10,n_155_14'6) in
                          match uLET_117_7'10 with
                          | true1 ->
                            let prim_118_0'0 = PRIM_PutChar(backspace_153_21'6) in
                            k prim_118_0'0
                          | false0 ->
                            let x_158_0'0 = '^' in
                            let __159_18'21 = PRIM_PutChar(x_158_0'0) in
                            let x_160_0'0 = 'A' in
                            let x_161_0'0 = PRIM_CharOrd(x_160_0'0) in
                            let uLET_120_0'0 = fun [x_161_0'0] y_162_0'0 k ->
                              let prim_121_0'0 = PRIM_AddInt(x_161_0'0,y_162_0'0) in
                              k prim_121_0'0 in
                            let k [] x_163_0'0 =
                              let uLET_119_0'0 = fun [x_163_0'0] y_164_0'0 k ->
                                let prim_122_0'0 = PRIM_SubInt(x_163_0'0,y_164_0'0) in
                                k prim_122_0'0 in
                              let lit_123_18'52 = 1 in
                              let k [] x_165_0'0 =
                                let x_166_0'0 = PRIM_CharChr(x_165_0'0) in
                                let prim_124_0'0 = PRIM_PutChar(x_166_0'0) in
                                k prim_124_0'0 in
                              uLET_119_0'0 lit_123_18'52 k in
                            uLET_120_0'0 n_155_14'6 k
                    | false0 ->
                      let con_149_113'55 = Unit0 in
                      k con_149_113'55 in
                  uLET_109_8'9 lit_112_113'28 k
              | false0 ->
                let backspace_243_13'6 = 8 in
                let n_244_14'6 = PRIM_CharOrd(c_82_104'8) in
                let prim_186_0'0 = PRIM_EqInt(n_244_14'6,backspace_243_13'6) in
                let k [acc_79_103'15,loop_80_103'10,c_82_104'8] __256_117'23 =
                  let con_198_0'0 = Cons1[c_82_104'8,acc_79_103'15] in
                  loop_80_103'10 con_198_0'0 k in
                match prim_186_0'0 with
                | true1 ->
                  let prim_187_0'0 = PRIM_PutChar(c_82_104'8) in
                  k prim_187_0'0
                | false0 ->
                  let y_245_0'0 = '\n' in
                  let uLET_188_0'0 = PRIM_EqChar(c_82_104'8,y_245_0'0) in
                  match uLET_188_0'0 with
                  | true1 ->
                    let prim_189_0'0 = PRIM_PutChar(c_82_104'8) in
                    k prim_189_0'0
                  | false0 ->
                    let b_246_7'10 = 26 in
                    let uLET_190_7'10 = PRIM_LessInt(b_246_7'10,n_244_14'6) in
                    match uLET_190_7'10 with
                    | true1 ->
                      let prim_191_0'0 = PRIM_PutChar(c_82_104'8) in
                      k prim_191_0'0
                    | false0 ->
                      let x_247_0'0 = '^' in
                      let __248_18'21 = PRIM_PutChar(x_247_0'0) in
                      let x_249_0'0 = 'A' in
                      let x_250_0'0 = PRIM_CharOrd(x_249_0'0) in
                      let uLET_193_0'0 = fun [x_250_0'0] y_251_0'0 k ->
                        let prim_194_0'0 = PRIM_AddInt(x_250_0'0,y_251_0'0) in
                        k prim_194_0'0 in
                      let k [] x_252_0'0 =
                        let uLET_192_0'0 = fun [x_252_0'0] y_253_0'0 k ->
                          let prim_195_0'0 = PRIM_SubInt(x_252_0'0,y_253_0'0) in
                          k prim_195_0'0 in
                        let lit_196_18'52 = 1 in
                        let k [] x_254_0'0 =
                          let x_255_0'0 = PRIM_CharChr(x_254_0'0) in
                          let prim_197_0'0 = PRIM_PutChar(x_255_0'0) in
                          k prim_197_0'0 in
                        uLET_192_0'0 lit_196_18'52 k in
                      uLET_193_0'0 n_244_14'6 k) in
      let con_199_119'7 = Nil0 in
      let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8,single_controlD_72_166'4,mainloop_74_213'8] xs_258_215'6 =
        let lam_203_0'0 = fun [] x_259_0'0 k ->
          let lam_205_0'0 = fun [x_259_0'0] y_260_0'0 k ->
            let prim_204_0'0 = PRIM_EqChar(x_259_0'0,y_260_0'0) in
            k prim_204_0'0 in
          k lam_205_0'0 in
        let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8,single_controlD_72_166'4,mainloop_74_213'8,xs_258_215'6] app_202_56'31 =
          let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8,single_controlD_72_166'4,mainloop_74_213'8,xs_258_215'6] app_201_56'39 =
            let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8,single_controlD_72_166'4,mainloop_74_213'8,xs_258_215'6] app_200_56'41 =
              match app_200_56'41 with
              | true1 ->
                let con_206_216'42 = Unit0 in
                k con_206_216'42
              | false0 ->
                let loop_291_193'10 = fix (fun [] loop_262_193'10 accWs_261_193'15 k ->
                  let lam_235_193'21 = fun [accWs_261_193'15,loop_262_193'10] accCs_263_193'21 k ->
                    let lam_234_193'27 = fun [accWs_261_193'15,loop_262_193'10,accCs_263_193'21] xs_264_193'27 k ->
                      match xs_264_193'27 with
                      | Nil0 ->
                        let loop_270_64'10 = fix (fun [] loop_266_64'10 acc_265_64'15 k ->
                          let lam_210_64'19 = fun [acc_265_64'15,loop_266_64'10] xs_267_64'19 k ->
                            match xs_267_64'19 with
                            | Nil0 -> k acc_265_64'15
                            | Cons1(x_268_67'6,xs_269_67'9) ->
                              let con_209_0'0 = Cons1[x_268_67'6,acc_265_64'15] in
                              let k [xs_269_67'9] app_208_67'20 = app_208_67'20 xs_269_67'9 k in
                              loop_266_64'10 con_209_0'0 k in
                          k lam_210_64'19) in
                        let con_212_69'7 = Nil0 in
                        let k [accWs_261_193'15,accCs_263_193'21] app_211_69'7 =
                          let k [accWs_261_193'15] x_271_0'0 =
                            let uLET_207_0'0 = fun [x_271_0'0] y_272_0'0 k ->
                              let con_213_0'0 = Cons1[x_271_0'0,y_272_0'0] in
                              k con_213_0'0 in
                            let k [] xs_273_63'12 =
                              let loop_279_64'10 = fix (fun [] loop_275_64'10 acc_274_64'15 k ->
                                let lam_216_64'19 = fun [acc_274_64'15,loop_275_64'10] xs_276_64'19 k ->
                                  match xs_276_64'19 with
                                  | Nil0 -> k acc_274_64'15
                                  | Cons1(x_277_67'6,xs_278_67'9) ->
                                    let con_215_0'0 = Cons1[x_277_67'6,acc_274_64'15] in
                                    let k [xs_278_67'9] app_214_67'20 = app_214_67'20 xs_278_67'9 k in
                                    loop_275_64'10 con_215_0'0 k in
                                k lam_216_64'19) in
                              let con_218_69'7 = Nil0 in
                              let k [xs_273_63'12] app_217_69'7 = app_217_69'7 xs_273_63'12 k in
                              loop_279_64'10 con_218_69'7 k in
                            uLET_207_0'0 accWs_261_193'15 k in
                          app_211_69'7 accCs_263_193'21 k in
                        loop_270_64'10 con_212_69'7 k
                      | Cons1(x_280_197'6,xs_281_197'9) ->
                        let y_282_0'0 = ' ' in
                        let uLET_219_0'0 = PRIM_EqChar(x_280_197'6,y_282_0'0) in
                        match uLET_219_0'0 with
                        | true1 ->
                          let loop_288_64'10 = fix (fun [] loop_284_64'10 acc_283_64'15 k ->
                            let lam_226_64'19 = fun [acc_283_64'15,loop_284_64'10] xs_285_64'19 k ->
                              match xs_285_64'19 with
                              | Nil0 -> k acc_283_64'15
                              | Cons1(x_286_67'6,xs_287_67'9) ->
                                let con_225_0'0 = Cons1[x_286_67'6,acc_283_64'15] in
                                let k [xs_287_67'9] app_224_67'20 = app_224_67'20 xs_287_67'9 k in
                                loop_284_64'10 con_225_0'0 k in
                            k lam_226_64'19) in
                          let con_228_69'7 = Nil0 in
                          let k [accWs_261_193'15,loop_262_193'10,accCs_263_193'21,xs_281_197'9] app_227_69'7 =
                            let k [accWs_261_193'15,loop_262_193'10,xs_281_197'9] x_289_0'0 =
                              let uLET_223_0'0 = fun [x_289_0'0] y_290_0'0 k ->
                                let con_229_0'0 = Cons1[x_289_0'0,y_290_0'0] in
                                k con_229_0'0 in
                              let k [loop_262_193'10,xs_281_197'9] app_222_198'52 =
                                let k [xs_281_197'9] app_221_198'34 =
                                  let con_230_198'59 = Nil0 in
                                  let k [xs_281_197'9] app_220_198'59 = app_220_198'59 xs_281_197'9 k in
                                  app_221_198'34 con_230_198'59 k in
                                loop_262_193'10 app_222_198'52 k in
                              uLET_223_0'0 accWs_261_193'15 k in
                            app_227_69'7 accCs_263_193'21 k in
                          loop_288_64'10 con_228_69'7 k
                        | false0 ->
                          let k [accCs_263_193'21,x_280_197'6,xs_281_197'9] app_232_199'17 =
                            let con_233_0'0 = Cons1[x_280_197'6,accCs_263_193'21] in
                            let k [xs_281_197'9] app_231_199'23 = app_231_199'23 xs_281_197'9 k in
                            app_232_199'17 con_233_0'0 k in
                          loop_262_193'10 accWs_261_193'15 k in
                    k lam_234_193'27 in
                  k lam_235_193'21) in
                let con_238_201'7 = Nil0 in
                let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8,single_controlD_72_166'4,mainloop_74_213'8,xs_258_215'6] app_237_201'7 =
                  let con_239_201'10 = Nil0 in
                  let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8,single_controlD_72_166'4,mainloop_74_213'8,xs_258_215'6] app_236_201'10 =
                    let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8,single_controlD_72_166'4,mainloop_74_213'8,xs_258_215'6] words_292_204'6 =
                      let k [mainloop_74_213'8] __854_217'15 =
                        let con_696_217'26 = Unit0 in
                        mainloop_74_213'8 con_696_217'26 k in
                      match words_292_204'6 with
                      | Nil0 ->
                        let con_240_206'10 = Unit0 in
                        k con_240_206'10
                      | Cons1(command_293_207'4,args_294_207'13) ->
                        let x_295_0'0 = "fib" in
                        let b_296_56'19 = PRIM_Explode(x_295_0'0) in
                        let lam_244_0'0 = fun [] x_297_0'0 k ->
                          let lam_246_0'0 = fun [x_297_0'0] y_298_0'0 k ->
                            let prim_245_0'0 = PRIM_EqChar(x_297_0'0,y_298_0'0) in
                            k prim_245_0'0 in
                          k lam_246_0'0 in
                        let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8,single_controlD_72_166'4,xs_258_215'6,command_293_207'4,args_294_207'13,b_296_56'19] app_243_56'31 =
                          let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8,single_controlD_72_166'4,xs_258_215'6,command_293_207'4,args_294_207'13,b_296_56'19] app_242_56'39 =
                            let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fib_60_121'8,fact_68_125'8,single_controlD_72_166'4,xs_258_215'6,command_293_207'4,args_294_207'13] uLET_241_56'19 =
                              match uLET_241_56'19 with
                              | true1 ->
                                let s_299_95'15 = "fib: " in
                                let prim_247_0'0 = PRIM_Explode(s_299_95'15) in
                                let k [put_chars_52_90'8,fib_60_121'8,args_294_207'13] __300_132'20 =
                                  match args_294_207'13 with
                                  | Nil0 ->
                                    let s_301_129'10 = "expected an argument" in
                                    let s_302_95'15 = "ERROR: " in
                                    let prim_248_0'0 = PRIM_Explode(s_302_95'15) in
                                    let k [put_chars_52_90'8,s_301_129'10] __303_129'34 =
                                      let prim_249_0'0 = PRIM_Explode(s_301_129'10) in
                                      let k [] __304_129'48 =
                                        let __305_99'12 = Unit0 in
                                        let c_306_12'13 = '\n' in
                                        let backspace_307_13'6 = 8 in
                                        let n_308_14'6 = PRIM_CharOrd(c_306_12'13) in
                                        let prim_250_0'0 = PRIM_EqInt(n_308_14'6,backspace_307_13'6) in
                                        match prim_250_0'0 with
                                        | true1 ->
                                          let prim_251_0'0 = PRIM_PutChar(c_306_12'13) in
                                          k prim_251_0'0
                                        | false0 ->
                                          let y_309_0'0 = '\n' in
                                          let uLET_252_0'0 = PRIM_EqChar(c_306_12'13,y_309_0'0) in
                                          match uLET_252_0'0 with
                                          | true1 ->
                                            let prim_253_0'0 = PRIM_PutChar(c_306_12'13) in
                                            k prim_253_0'0
                                          | false0 ->
                                            let b_310_7'10 = 26 in
                                            let uLET_254_7'10 = PRIM_LessInt(b_310_7'10,n_308_14'6) in
                                            match uLET_254_7'10 with
                                            | true1 ->
                                              let prim_255_0'0 = PRIM_PutChar(c_306_12'13) in
                                              k prim_255_0'0
                                            | false0 ->
                                              let x_311_0'0 = '^' in
                                              let __312_18'21 = PRIM_PutChar(x_311_0'0) in
                                              let x_313_0'0 = 'A' in
                                              let x_314_0'0 = PRIM_CharOrd(x_313_0'0) in
                                              let uLET_257_0'0 = fun [x_314_0'0] y_315_0'0 k ->
                                                let prim_258_0'0 = PRIM_AddInt(x_314_0'0,y_315_0'0) in
                                                k prim_258_0'0 in
                                              let k [] x_316_0'0 =
                                                let uLET_256_0'0 = fun [x_316_0'0] y_317_0'0 k ->
                                                  let prim_259_0'0 = PRIM_SubInt(x_316_0'0,y_317_0'0) in
                                                  k prim_259_0'0 in
                                                let lit_260_18'52 = 1 in
                                                let k [] x_318_0'0 =
                                                  let x_319_0'0 = PRIM_CharChr(x_318_0'0) in
                                                  let prim_261_0'0 = PRIM_PutChar(x_319_0'0) in
                                                  k prim_261_0'0 in
                                                uLET_256_0'0 lit_260_18'52 k in
                                              uLET_257_0'0 n_308_14'6 k in
                                      put_chars_52_90'8 prim_249_0'0 k in
                                    put_chars_52_90'8 prim_248_0'0 k
                                  | Cons1(arg1_320_135'4,more_321_135'10) ->
                                    match more_321_135'10 with
                                    | Cons1(__322_137'7,__323_137'10) ->
                                      let s_324_129'10 = "expected exactly one argument" in
                                      let s_325_95'15 = "ERROR: " in
                                      let prim_262_0'0 = PRIM_Explode(s_325_95'15) in
                                      let k [put_chars_52_90'8,s_324_129'10] __326_129'34 =
                                        let prim_263_0'0 = PRIM_Explode(s_324_129'10) in
                                        let k [] __327_129'48 =
                                          let __328_99'12 = Unit0 in
                                          let c_329_12'13 = '\n' in
                                          let backspace_330_13'6 = 8 in
                                          let n_331_14'6 = PRIM_CharOrd(c_329_12'13) in
                                          let prim_264_0'0 = PRIM_EqInt(n_331_14'6,backspace_330_13'6) in
                                          match prim_264_0'0 with
                                          | true1 ->
                                            let prim_265_0'0 = PRIM_PutChar(c_329_12'13) in
                                            k prim_265_0'0
                                          | false0 ->
                                            let y_332_0'0 = '\n' in
                                            let uLET_266_0'0 = PRIM_EqChar(c_329_12'13,y_332_0'0) in
                                            match uLET_266_0'0 with
                                            | true1 ->
                                              let prim_267_0'0 = PRIM_PutChar(c_329_12'13) in
                                              k prim_267_0'0
                                            | false0 ->
                                              let b_333_7'10 = 26 in
                                              let uLET_268_7'10 = PRIM_LessInt(b_333_7'10,n_331_14'6) in
                                              match uLET_268_7'10 with
                                              | true1 ->
                                                let prim_269_0'0 = PRIM_PutChar(c_329_12'13) in
                                                k prim_269_0'0
                                              | false0 ->
                                                let x_334_0'0 = '^' in
                                                let __335_18'21 = PRIM_PutChar(x_334_0'0) in
                                                let x_336_0'0 = 'A' in
                                                let x_337_0'0 = PRIM_CharOrd(x_336_0'0) in
                                                let uLET_271_0'0 = fun [x_337_0'0] y_338_0'0 k ->
                                                  let prim_272_0'0 = PRIM_AddInt(x_337_0'0,y_338_0'0) in
                                                  k prim_272_0'0 in
                                                let k [] x_339_0'0 =
                                                  let uLET_270_0'0 = fun [x_339_0'0] y_340_0'0 k ->
                                                    let prim_273_0'0 = PRIM_SubInt(x_339_0'0,y_340_0'0) in
                                                    k prim_273_0'0 in
                                                  let lit_274_18'52 = 1 in
                                                  let k [] x_341_0'0 =
                                                    let x_342_0'0 = PRIM_CharChr(x_341_0'0) in
                                                    let prim_275_0'0 = PRIM_PutChar(x_342_0'0) in
                                                    k prim_275_0'0 in
                                                  uLET_270_0'0 lit_274_18'52 k in
                                                uLET_271_0'0 n_331_14'6 k in
                                        put_chars_52_90'8 prim_263_0'0 k in
                                      put_chars_52_90'8 prim_262_0'0 k
                                    | Nil0 ->
                                      let loop_361_35'10 = fix (fun [] loop_344_35'10 acc_343_35'15 k ->
                                        let lam_298_35'19 = fun [acc_343_35'15,loop_344_35'10] xs_345_35'19 k ->
                                          match xs_345_35'19 with
                                          | Nil0 ->
                                            let con_277_37'12 = Some0[acc_343_35'15] in
                                            k con_277_37'12
                                          | Cons1(x_346_38'6,xs_347_38'9) ->
                                            let x_348_0'0 = PRIM_CharOrd(x_346_38'6) in
                                            let uLET_279_0'0 = fun [x_348_0'0] y_349_0'0 k ->
                                              let prim_280_0'0 = PRIM_SubInt(x_348_0'0,y_349_0'0) in
                                              k prim_280_0'0 in
                                            let x_350_0'0 = '0' in
                                            let uLET_281_0'0 = PRIM_CharOrd(x_350_0'0) in
                                            let k [acc_343_35'15,loop_344_35'10,xs_347_38'9] n_351_30'6 =
                                              let b_352_9'11 = 0 in
                                              let b_353_2'8 = PRIM_LessInt(n_351_30'6,b_352_9'11) in
                                              let k [acc_343_35'15,loop_344_35'10,xs_347_38'9,n_351_30'6] uLET_282_9'11 =
                                                let k [acc_343_35'15,loop_344_35'10,xs_347_38'9] uLET_278_30'6 =
                                                  match uLET_278_30'6 with
                                                  | None1 ->
                                                    let con_291_40'18 = None1 in
                                                    k con_291_40'18
                                                  | Some0(d_356_41'15) ->
                                                    let x_357_0'0 = 10 in
                                                    let uLET_295_0'0 = fun [x_357_0'0] y_358_0'0 k ->
                                                      let prim_296_0'0 = PRIM_MulInt(x_357_0'0,y_358_0'0) in
                                                      k prim_296_0'0 in
                                                    let k [loop_344_35'10,xs_347_38'9,d_356_41'15] x_359_0'0 =
                                                      let uLET_294_0'0 = fun [x_359_0'0] y_360_0'0 k ->
                                                        let prim_297_0'0 = PRIM_AddInt(x_359_0'0,y_360_0'0) in
                                                        k prim_297_0'0 in
                                                      let k [loop_344_35'10,xs_347_38'9] app_293_41'37 =
                                                        let k [xs_347_38'9] app_292_41'25 = app_292_41'25 xs_347_38'9 k in
                                                        loop_344_35'10 app_293_41'37 k in
                                                      uLET_294_0'0 d_356_41'15 k in
                                                    uLET_295_0'0 acc_343_35'15 k in
                                                match uLET_282_9'11 with
                                                | true1 ->
                                                  let b_354_8'11 = 9 in
                                                  let b_355_2'8 = PRIM_LessInt(b_354_8'11,n_351_30'6) in
                                                  let k [n_351_30'6] uLET_285_8'11 =
                                                    match uLET_285_8'11 with
                                                    | true1 ->
                                                      let con_288_32'32 = Some0[n_351_30'6] in
                                                      k con_288_32'32
                                                    | false0 ->
                                                      let con_289_32'45 = None1 in
                                                      k con_289_32'45 in
                                                  match b_355_2'8 with
                                                  | true1 ->
                                                    let con_286_4'12 = false0 in
                                                    k con_286_4'12
                                                  | false0 ->
                                                    let con_287_5'13 = true1 in
                                                    k con_287_5'13
                                                | false0 ->
                                                  let con_290_32'55 = None1 in
                                                  k con_290_32'55 in
                                              match b_353_2'8 with
                                              | true1 ->
                                                let con_283_4'12 = false0 in
                                                k con_283_4'12
                                              | false0 ->
                                                let con_284_5'13 = true1 in
                                                k con_284_5'13 in
                                            uLET_279_0'0 uLET_281_0'0 k in
                                        k lam_298_35'19) in
                                      let lit_300_43'7 = 0 in
                                      let k [put_chars_52_90'8,fib_60_121'8,arg1_320_135'4] app_299_43'7 =
                                        let k [put_chars_52_90'8,fib_60_121'8] uLET_276_35'10 =
                                          match uLET_276_35'10 with
                                          | None1 ->
                                            let s_362_129'10 = "expected arg1 to be numeric" in
                                            let s_363_95'15 = "ERROR: " in
                                            let prim_301_0'0 = PRIM_Explode(s_363_95'15) in
                                            let k [put_chars_52_90'8,s_362_129'10] __364_129'34 =
                                              let prim_302_0'0 = PRIM_Explode(s_362_129'10) in
                                              let k [] __365_129'48 =
                                                let __366_99'12 = Unit0 in
                                                let c_367_12'13 = '\n' in
                                                let backspace_368_13'6 = 8 in
                                                let n_369_14'6 = PRIM_CharOrd(c_367_12'13) in
                                                let prim_303_0'0 = PRIM_EqInt(n_369_14'6,backspace_368_13'6) in
                                                match prim_303_0'0 with
                                                | true1 ->
                                                  let prim_304_0'0 = PRIM_PutChar(c_367_12'13) in
                                                  k prim_304_0'0
                                                | false0 ->
                                                  let y_370_0'0 = '\n' in
                                                  let uLET_305_0'0 = PRIM_EqChar(c_367_12'13,y_370_0'0) in
                                                  match uLET_305_0'0 with
                                                  | true1 ->
                                                    let prim_306_0'0 = PRIM_PutChar(c_367_12'13) in
                                                    k prim_306_0'0
                                                  | false0 ->
                                                    let b_371_7'10 = 26 in
                                                    let uLET_307_7'10 = PRIM_LessInt(b_371_7'10,n_369_14'6) in
                                                    match uLET_307_7'10 with
                                                    | true1 ->
                                                      let prim_308_0'0 = PRIM_PutChar(c_367_12'13) in
                                                      k prim_308_0'0
                                                    | false0 ->
                                                      let x_372_0'0 = '^' in
                                                      let __373_18'21 = PRIM_PutChar(x_372_0'0) in
                                                      let x_374_0'0 = 'A' in
                                                      let x_375_0'0 = PRIM_CharOrd(x_374_0'0) in
                                                      let uLET_310_0'0 = fun [x_375_0'0] y_376_0'0 k ->
                                                        let prim_311_0'0 = PRIM_AddInt(x_375_0'0,y_376_0'0) in
                                                        k prim_311_0'0 in
                                                      let k [] x_377_0'0 =
                                                        let uLET_309_0'0 = fun [x_377_0'0] y_378_0'0 k ->
                                                          let prim_312_0'0 = PRIM_SubInt(x_377_0'0,y_378_0'0) in
                                                          k prim_312_0'0 in
                                                        let lit_313_18'52 = 1 in
                                                        let k [] x_379_0'0 =
                                                          let x_380_0'0 = PRIM_CharChr(x_379_0'0) in
                                                          let prim_314_0'0 = PRIM_PutChar(x_380_0'0) in
                                                          k prim_314_0'0 in
                                                        uLET_309_0'0 lit_313_18'52 k in
                                                      uLET_310_0'0 n_369_14'6 k in
                                              put_chars_52_90'8 prim_302_0'0 k in
                                            put_chars_52_90'8 prim_301_0'0 k
                                          | Some0(n_381_141'15) ->
                                            let k [put_chars_52_90'8,n_381_141'15] res_382_142'15 =
                                              let x_383_0'0 = '0' in
                                              let ord0_384_82'6 = PRIM_CharOrd(x_383_0'0) in
                                              let loop_395_84'10 = fix (fun [ord0_384_82'6] loop_386_84'10 acc_385_84'15 k ->
                                                let lam_322_84'19 = fun [ord0_384_82'6,acc_385_84'15,loop_386_84'10] i_387_84'19 k ->
                                                  let y_388_0'0 = 0 in
                                                  let uLET_316_0'0 = PRIM_EqInt(i_387_84'19,y_388_0'0) in
                                                  match uLET_316_0'0 with
                                                  | true1 -> k acc_385_84'15
                                                  | false0 ->
                                                    let y_389_0'0 = 10 in
                                                    let c_390_83'20 = PRIM_ModInt(i_387_84'19,y_389_0'0) in
                                                    let x_391_0'0 = PRIM_AddInt(ord0_384_82'6,c_390_83'20) in
                                                    let x_392_45'9 = PRIM_CharChr(x_391_0'0) in
                                                    let uLET_319_45'9 = fun [x_392_45'9] xs_393_45'11 k ->
                                                      let con_320_0'0 = Cons1[x_392_45'9,xs_393_45'11] in
                                                      k con_320_0'0 in
                                                    let k [loop_386_84'10,i_387_84'19] app_318_86'40 =
                                                      let k [i_387_84'19] app_317_86'11 =
                                                        let y_394_0'0 = 10 in
                                                        let uLET_321_0'0 = PRIM_DivInt(i_387_84'19,y_394_0'0) in
                                                        app_317_86'11 uLET_321_0'0 k in
                                                      loop_386_84'10 app_318_86'40 k in
                                                    uLET_319_45'9 acc_385_84'15 k in
                                                k lam_322_84'19) in
                                              let y_396_0'0 = 0 in
                                              let uLET_323_0'0 = PRIM_EqInt(n_381_141'15,y_396_0'0) in
                                              let k [put_chars_52_90'8,res_382_142'15] uLET_315_82'6 =
                                                let k [put_chars_52_90'8,res_382_142'15] __399_143'20 =
                                                  let s_400_95'15 = " --> " in
                                                  let prim_329_0'0 = PRIM_Explode(s_400_95'15) in
                                                  let k [put_chars_52_90'8,res_382_142'15] __401_144'29 =
                                                    let x_402_0'0 = '0' in
                                                    let ord0_403_82'6 = PRIM_CharOrd(x_402_0'0) in
                                                    let loop_414_84'10 = fix (fun [ord0_403_82'6] loop_405_84'10 acc_404_84'15 k ->
                                                      let lam_337_84'19 = fun [ord0_403_82'6,acc_404_84'15,loop_405_84'10] i_406_84'19 k ->
                                                        let y_407_0'0 = 0 in
                                                        let uLET_331_0'0 = PRIM_EqInt(i_406_84'19,y_407_0'0) in
                                                        match uLET_331_0'0 with
                                                        | true1 -> k acc_404_84'15
                                                        | false0 ->
                                                          let y_408_0'0 = 10 in
                                                          let c_409_83'20 = PRIM_ModInt(i_406_84'19,y_408_0'0) in
                                                          let x_410_0'0 = PRIM_AddInt(ord0_403_82'6,c_409_83'20) in
                                                          let x_411_45'9 = PRIM_CharChr(x_410_0'0) in
                                                          let uLET_334_45'9 = fun [x_411_45'9] xs_412_45'11 k ->
                                                            let con_335_0'0 = Cons1[x_411_45'9,xs_412_45'11] in
                                                            k con_335_0'0 in
                                                          let k [loop_405_84'10,i_406_84'19] app_333_86'40 =
                                                            let k [i_406_84'19] app_332_86'11 =
                                                              let y_413_0'0 = 10 in
                                                              let uLET_336_0'0 = PRIM_DivInt(i_406_84'19,y_413_0'0) in
                                                              app_332_86'11 uLET_336_0'0 k in
                                                            loop_405_84'10 app_333_86'40 k in
                                                          uLET_334_45'9 acc_404_84'15 k in
                                                      k lam_337_84'19) in
                                                    let y_415_0'0 = 0 in
                                                    let uLET_338_0'0 = PRIM_EqInt(res_382_142'15,y_415_0'0) in
                                                    let k [put_chars_52_90'8] uLET_330_82'6 =
                                                      let k [] __418_145'22 =
                                                        let __419_99'12 = Unit0 in
                                                        let c_420_12'13 = '\n' in
                                                        let backspace_421_13'6 = 8 in
                                                        let n_422_14'6 = PRIM_CharOrd(c_420_12'13) in
                                                        let prim_344_0'0 = PRIM_EqInt(n_422_14'6,backspace_421_13'6) in
                                                        match prim_344_0'0 with
                                                        | true1 ->
                                                          let prim_345_0'0 = PRIM_PutChar(c_420_12'13) in
                                                          k prim_345_0'0
                                                        | false0 ->
                                                          let y_423_0'0 = '\n' in
                                                          let uLET_346_0'0 = PRIM_EqChar(c_420_12'13,y_423_0'0) in
                                                          match uLET_346_0'0 with
                                                          | true1 ->
                                                            let prim_347_0'0 = PRIM_PutChar(c_420_12'13) in
                                                            k prim_347_0'0
                                                          | false0 ->
                                                            let b_424_7'10 = 26 in
                                                            let uLET_348_7'10 = PRIM_LessInt(b_424_7'10,n_422_14'6) in
                                                            match uLET_348_7'10 with
                                                            | true1 ->
                                                              let prim_349_0'0 = PRIM_PutChar(c_420_12'13) in
                                                              k prim_349_0'0
                                                            | false0 ->
                                                              let x_425_0'0 = '^' in
                                                              let __426_18'21 = PRIM_PutChar(x_425_0'0) in
                                                              let x_427_0'0 = 'A' in
                                                              let x_428_0'0 = PRIM_CharOrd(x_427_0'0) in
                                                              let uLET_351_0'0 = fun [x_428_0'0] y_429_0'0 k ->
                                                                let prim_352_0'0 = PRIM_AddInt(x_428_0'0,y_429_0'0) in
                                                                k prim_352_0'0 in
                                                              let k [] x_430_0'0 =
                                                                let uLET_350_0'0 = fun [x_430_0'0] y_431_0'0 k ->
                                                                  let prim_353_0'0 = PRIM_SubInt(x_430_0'0,y_431_0'0) in
                                                                  k prim_353_0'0 in
                                                                let lit_354_18'52 = 1 in
                                                                let k [] x_432_0'0 =
                                                                  let x_433_0'0 = PRIM_CharChr(x_432_0'0) in
                                                                  let prim_355_0'0 = PRIM_PutChar(x_433_0'0) in
                                                                  k prim_355_0'0 in
                                                                uLET_350_0'0 lit_354_18'52 k in
                                                              uLET_351_0'0 n_422_14'6 k in
                                                      put_chars_52_90'8 uLET_330_82'6 k in
                                                    match uLET_338_0'0 with
                                                    | true1 ->
                                                      let x_416_45'9 = '0' in
                                                      let uLET_339_45'9 = fun [x_416_45'9] xs_417_45'11 k ->
                                                        let con_340_0'0 = Cons1[x_416_45'9,xs_417_45'11] in
                                                        k con_340_0'0 in
                                                      let con_341_88'25 = Nil0 in
                                                      uLET_339_45'9 con_341_88'25 k
                                                    | false0 ->
                                                      let con_343_88'38 = Nil0 in
                                                      let k [res_382_142'15] app_342_88'38 = app_342_88'38 res_382_142'15 k in
                                                      loop_414_84'10 con_343_88'38 k in
                                                  put_chars_52_90'8 prim_329_0'0 k in
                                                put_chars_52_90'8 uLET_315_82'6 k in
                                              match uLET_323_0'0 with
                                              | true1 ->
                                                let x_397_45'9 = '0' in
                                                let uLET_324_45'9 = fun [x_397_45'9] xs_398_45'11 k ->
                                                  let con_325_0'0 = Cons1[x_397_45'9,xs_398_45'11] in
                                                  k con_325_0'0 in
                                                let con_326_88'25 = Nil0 in
                                                uLET_324_45'9 con_326_88'25 k
                                              | false0 ->
                                                let con_328_88'38 = Nil0 in
                                                let k [n_381_141'15] app_327_88'38 = app_327_88'38 n_381_141'15 k in
                                                loop_395_84'10 con_328_88'38 k in
                                            fib_60_121'8 n_381_141'15 k in
                                        app_299_43'7 arg1_320_135'4 k in
                                      loop_361_35'10 lit_300_43'7 k in
                                put_chars_52_90'8 prim_247_0'0 k
                              | false0 ->
                                let x_434_0'0 = "fact" in
                                let b_435_56'19 = PRIM_Explode(x_434_0'0) in
                                let lam_359_0'0 = fun [] x_436_0'0 k ->
                                  let lam_361_0'0 = fun [x_436_0'0] y_437_0'0 k ->
                                    let prim_360_0'0 = PRIM_EqChar(x_436_0'0,y_437_0'0) in
                                    k prim_360_0'0 in
                                  k lam_361_0'0 in
                                let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fact_68_125'8,single_controlD_72_166'4,xs_258_215'6,command_293_207'4,args_294_207'13,b_435_56'19] app_358_56'31 =
                                  let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fact_68_125'8,single_controlD_72_166'4,xs_258_215'6,command_293_207'4,args_294_207'13,b_435_56'19] app_357_56'39 =
                                    let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,fact_68_125'8,single_controlD_72_166'4,xs_258_215'6,command_293_207'4,args_294_207'13] uLET_356_56'19 =
                                      match uLET_356_56'19 with
                                      | true1 ->
                                        let s_438_95'15 = "fact: " in
                                        let prim_362_0'0 = PRIM_Explode(s_438_95'15) in
                                        let k [put_chars_52_90'8,fact_68_125'8,args_294_207'13] __439_149'21 =
                                          match args_294_207'13 with
                                          | Nil0 ->
                                            let s_440_129'10 = "expected an argument" in
                                            let s_441_95'15 = "ERROR: " in
                                            let prim_363_0'0 = PRIM_Explode(s_441_95'15) in
                                            let k [put_chars_52_90'8,s_440_129'10] __442_129'34 =
                                              let prim_364_0'0 = PRIM_Explode(s_440_129'10) in
                                              let k [] __443_129'48 =
                                                let __444_99'12 = Unit0 in
                                                let c_445_12'13 = '\n' in
                                                let backspace_446_13'6 = 8 in
                                                let n_447_14'6 = PRIM_CharOrd(c_445_12'13) in
                                                let prim_365_0'0 = PRIM_EqInt(n_447_14'6,backspace_446_13'6) in
                                                match prim_365_0'0 with
                                                | true1 ->
                                                  let prim_366_0'0 = PRIM_PutChar(c_445_12'13) in
                                                  k prim_366_0'0
                                                | false0 ->
                                                  let y_448_0'0 = '\n' in
                                                  let uLET_367_0'0 = PRIM_EqChar(c_445_12'13,y_448_0'0) in
                                                  match uLET_367_0'0 with
                                                  | true1 ->
                                                    let prim_368_0'0 = PRIM_PutChar(c_445_12'13) in
                                                    k prim_368_0'0
                                                  | false0 ->
                                                    let b_449_7'10 = 26 in
                                                    let uLET_369_7'10 = PRIM_LessInt(b_449_7'10,n_447_14'6) in
                                                    match uLET_369_7'10 with
                                                    | true1 ->
                                                      let prim_370_0'0 = PRIM_PutChar(c_445_12'13) in
                                                      k prim_370_0'0
                                                    | false0 ->
                                                      let x_450_0'0 = '^' in
                                                      let __451_18'21 = PRIM_PutChar(x_450_0'0) in
                                                      let x_452_0'0 = 'A' in
                                                      let x_453_0'0 = PRIM_CharOrd(x_452_0'0) in
                                                      let uLET_372_0'0 = fun [x_453_0'0] y_454_0'0 k ->
                                                        let prim_373_0'0 = PRIM_AddInt(x_453_0'0,y_454_0'0) in
                                                        k prim_373_0'0 in
                                                      let k [] x_455_0'0 =
                                                        let uLET_371_0'0 = fun [x_455_0'0] y_456_0'0 k ->
                                                          let prim_374_0'0 = PRIM_SubInt(x_455_0'0,y_456_0'0) in
                                                          k prim_374_0'0 in
                                                        let lit_375_18'52 = 1 in
                                                        let k [] x_457_0'0 =
                                                          let x_458_0'0 = PRIM_CharChr(x_457_0'0) in
                                                          let prim_376_0'0 = PRIM_PutChar(x_458_0'0) in
                                                          k prim_376_0'0 in
                                                        uLET_371_0'0 lit_375_18'52 k in
                                                      uLET_372_0'0 n_447_14'6 k in
                                              put_chars_52_90'8 prim_364_0'0 k in
                                            put_chars_52_90'8 prim_363_0'0 k
                                          | Cons1(arg1_459_152'4,more_460_152'10) ->
                                            match more_460_152'10 with
                                            | Cons1(__461_154'7,__462_154'10) ->
                                              let s_463_129'10 = "expected exactly one argument" in
                                              let s_464_95'15 = "ERROR: " in
                                              let prim_377_0'0 = PRIM_Explode(s_464_95'15) in
                                              let k [put_chars_52_90'8,s_463_129'10] __465_129'34 =
                                                let prim_378_0'0 = PRIM_Explode(s_463_129'10) in
                                                let k [] __466_129'48 =
                                                  let __467_99'12 = Unit0 in
                                                  let c_468_12'13 = '\n' in
                                                  let backspace_469_13'6 = 8 in
                                                  let n_470_14'6 = PRIM_CharOrd(c_468_12'13) in
                                                  let prim_379_0'0 = PRIM_EqInt(n_470_14'6,backspace_469_13'6) in
                                                  match prim_379_0'0 with
                                                  | true1 ->
                                                    let prim_380_0'0 = PRIM_PutChar(c_468_12'13) in
                                                    k prim_380_0'0
                                                  | false0 ->
                                                    let y_471_0'0 = '\n' in
                                                    let uLET_381_0'0 = PRIM_EqChar(c_468_12'13,y_471_0'0) in
                                                    match uLET_381_0'0 with
                                                    | true1 ->
                                                      let prim_382_0'0 = PRIM_PutChar(c_468_12'13) in
                                                      k prim_382_0'0
                                                    | false0 ->
                                                      let b_472_7'10 = 26 in
                                                      let uLET_383_7'10 = PRIM_LessInt(b_472_7'10,n_470_14'6) in
                                                      match uLET_383_7'10 with
                                                      | true1 ->
                                                        let prim_384_0'0 = PRIM_PutChar(c_468_12'13) in
                                                        k prim_384_0'0
                                                      | false0 ->
                                                        let x_473_0'0 = '^' in
                                                        let __474_18'21 = PRIM_PutChar(x_473_0'0) in
                                                        let x_475_0'0 = 'A' in
                                                        let x_476_0'0 = PRIM_CharOrd(x_475_0'0) in
                                                        let uLET_386_0'0 = fun [x_476_0'0] y_477_0'0 k ->
                                                          let prim_387_0'0 = PRIM_AddInt(x_476_0'0,y_477_0'0) in
                                                          k prim_387_0'0 in
                                                        let k [] x_478_0'0 =
                                                          let uLET_385_0'0 = fun [x_478_0'0] y_479_0'0 k ->
                                                            let prim_388_0'0 = PRIM_SubInt(x_478_0'0,y_479_0'0) in
                                                            k prim_388_0'0 in
                                                          let lit_389_18'52 = 1 in
                                                          let k [] x_480_0'0 =
                                                            let x_481_0'0 = PRIM_CharChr(x_480_0'0) in
                                                            let prim_390_0'0 = PRIM_PutChar(x_481_0'0) in
                                                            k prim_390_0'0 in
                                                          uLET_385_0'0 lit_389_18'52 k in
                                                        uLET_386_0'0 n_470_14'6 k in
                                                put_chars_52_90'8 prim_378_0'0 k in
                                              put_chars_52_90'8 prim_377_0'0 k
                                            | Nil0 ->
                                              let loop_500_35'10 = fix (fun [] loop_483_35'10 acc_482_35'15 k ->
                                                let lam_413_35'19 = fun [acc_482_35'15,loop_483_35'10] xs_484_35'19 k ->
                                                  match xs_484_35'19 with
                                                  | Nil0 ->
                                                    let con_392_37'12 = Some0[acc_482_35'15] in
                                                    k con_392_37'12
                                                  | Cons1(x_485_38'6,xs_486_38'9) ->
                                                    let x_487_0'0 = PRIM_CharOrd(x_485_38'6) in
                                                    let uLET_394_0'0 = fun [x_487_0'0] y_488_0'0 k ->
                                                      let prim_395_0'0 = PRIM_SubInt(x_487_0'0,y_488_0'0) in
                                                      k prim_395_0'0 in
                                                    let x_489_0'0 = '0' in
                                                    let uLET_396_0'0 = PRIM_CharOrd(x_489_0'0) in
                                                    let k [acc_482_35'15,loop_483_35'10,xs_486_38'9] n_490_30'6 =
                                                      let b_491_9'11 = 0 in
                                                      let b_492_2'8 = PRIM_LessInt(n_490_30'6,b_491_9'11) in
                                                      let k [acc_482_35'15,loop_483_35'10,xs_486_38'9,n_490_30'6] uLET_397_9'11 =
                                                        let k [acc_482_35'15,loop_483_35'10,xs_486_38'9] uLET_393_30'6 =
                                                          match uLET_393_30'6 with
                                                          | None1 ->
                                                            let con_406_40'18 = None1 in
                                                            k con_406_40'18
                                                          | Some0(d_495_41'15) ->
                                                            let x_496_0'0 = 10 in
                                                            let uLET_410_0'0 = fun [x_496_0'0] y_497_0'0 k ->
                                                              let prim_411_0'0 = PRIM_MulInt(x_496_0'0,y_497_0'0) in
                                                              k prim_411_0'0 in
                                                            let k [loop_483_35'10,xs_486_38'9,d_495_41'15] x_498_0'0 =
                                                              let uLET_409_0'0 = fun [x_498_0'0] y_499_0'0 k ->
                                                                let prim_412_0'0 = PRIM_AddInt(x_498_0'0,y_499_0'0) in
                                                                k prim_412_0'0 in
                                                              let k [loop_483_35'10,xs_486_38'9] app_408_41'37 =
                                                                let k [xs_486_38'9] app_407_41'25 = app_407_41'25 xs_486_38'9 k in
                                                                loop_483_35'10 app_408_41'37 k in
                                                              uLET_409_0'0 d_495_41'15 k in
                                                            uLET_410_0'0 acc_482_35'15 k in
                                                        match uLET_397_9'11 with
                                                        | true1 ->
                                                          let b_493_8'11 = 9 in
                                                          let b_494_2'8 = PRIM_LessInt(b_493_8'11,n_490_30'6) in
                                                          let k [n_490_30'6] uLET_400_8'11 =
                                                            match uLET_400_8'11 with
                                                            | true1 ->
                                                              let con_403_32'32 = Some0[n_490_30'6] in
                                                              k con_403_32'32
                                                            | false0 ->
                                                              let con_404_32'45 = None1 in
                                                              k con_404_32'45 in
                                                          match b_494_2'8 with
                                                          | true1 ->
                                                            let con_401_4'12 = false0 in
                                                            k con_401_4'12
                                                          | false0 ->
                                                            let con_402_5'13 = true1 in
                                                            k con_402_5'13
                                                        | false0 ->
                                                          let con_405_32'55 = None1 in
                                                          k con_405_32'55 in
                                                      match b_492_2'8 with
                                                      | true1 ->
                                                        let con_398_4'12 = false0 in
                                                        k con_398_4'12
                                                      | false0 ->
                                                        let con_399_5'13 = true1 in
                                                        k con_399_5'13 in
                                                    uLET_394_0'0 uLET_396_0'0 k in
                                                k lam_413_35'19) in
                                              let lit_415_43'7 = 0 in
                                              let k [put_chars_52_90'8,fact_68_125'8,arg1_459_152'4] app_414_43'7 =
                                                let k [put_chars_52_90'8,fact_68_125'8] uLET_391_35'10 =
                                                  match uLET_391_35'10 with
                                                  | None1 ->
                                                    let s_501_129'10 = "expected arg1 to be numeric" in
                                                    let s_502_95'15 = "ERROR: " in
                                                    let prim_416_0'0 = PRIM_Explode(s_502_95'15) in
                                                    let k [put_chars_52_90'8,s_501_129'10] __503_129'34 =
                                                      let prim_417_0'0 = PRIM_Explode(s_501_129'10) in
                                                      let k [] __504_129'48 =
                                                        let __505_99'12 = Unit0 in
                                                        let c_506_12'13 = '\n' in
                                                        let backspace_507_13'6 = 8 in
                                                        let n_508_14'6 = PRIM_CharOrd(c_506_12'13) in
                                                        let prim_418_0'0 = PRIM_EqInt(n_508_14'6,backspace_507_13'6) in
                                                        match prim_418_0'0 with
                                                        | true1 ->
                                                          let prim_419_0'0 = PRIM_PutChar(c_506_12'13) in
                                                          k prim_419_0'0
                                                        | false0 ->
                                                          let y_509_0'0 = '\n' in
                                                          let uLET_420_0'0 = PRIM_EqChar(c_506_12'13,y_509_0'0) in
                                                          match uLET_420_0'0 with
                                                          | true1 ->
                                                            let prim_421_0'0 = PRIM_PutChar(c_506_12'13) in
                                                            k prim_421_0'0
                                                          | false0 ->
                                                            let b_510_7'10 = 26 in
                                                            let uLET_422_7'10 = PRIM_LessInt(b_510_7'10,n_508_14'6) in
                                                            match uLET_422_7'10 with
                                                            | true1 ->
                                                              let prim_423_0'0 = PRIM_PutChar(c_506_12'13) in
                                                              k prim_423_0'0
                                                            | false0 ->
                                                              let x_511_0'0 = '^' in
                                                              let __512_18'21 = PRIM_PutChar(x_511_0'0) in
                                                              let x_513_0'0 = 'A' in
                                                              let x_514_0'0 = PRIM_CharOrd(x_513_0'0) in
                                                              let uLET_425_0'0 = fun [x_514_0'0] y_515_0'0 k ->
                                                                let prim_426_0'0 = PRIM_AddInt(x_514_0'0,y_515_0'0) in
                                                                k prim_426_0'0 in
                                                              let k [] x_516_0'0 =
                                                                let uLET_424_0'0 = fun [x_516_0'0] y_517_0'0 k ->
                                                                  let prim_427_0'0 = PRIM_SubInt(x_516_0'0,y_517_0'0) in
                                                                  k prim_427_0'0 in
                                                                let lit_428_18'52 = 1 in
                                                                let k [] x_518_0'0 =
                                                                  let x_519_0'0 = PRIM_CharChr(x_518_0'0) in
                                                                  let prim_429_0'0 = PRIM_PutChar(x_519_0'0) in
                                                                  k prim_429_0'0 in
                                                                uLET_424_0'0 lit_428_18'52 k in
                                                              uLET_425_0'0 n_508_14'6 k in
                                                      put_chars_52_90'8 prim_417_0'0 k in
                                                    put_chars_52_90'8 prim_416_0'0 k
                                                  | Some0(n_520_158'15) ->
                                                    let k [put_chars_52_90'8,n_520_158'15] res_521_159'15 =
                                                      let x_522_0'0 = '0' in
                                                      let ord0_523_82'6 = PRIM_CharOrd(x_522_0'0) in
                                                      let loop_534_84'10 = fix (fun [ord0_523_82'6] loop_525_84'10 acc_524_84'15 k ->
                                                        let lam_437_84'19 = fun [ord0_523_82'6,acc_524_84'15,loop_525_84'10] i_526_84'19 k ->
                                                          let y_527_0'0 = 0 in
                                                          let uLET_431_0'0 = PRIM_EqInt(i_526_84'19,y_527_0'0) in
                                                          match uLET_431_0'0 with
                                                          | true1 -> k acc_524_84'15
                                                          | false0 ->
                                                            let y_528_0'0 = 10 in
                                                            let c_529_83'20 = PRIM_ModInt(i_526_84'19,y_528_0'0) in
                                                            let x_530_0'0 = PRIM_AddInt(ord0_523_82'6,c_529_83'20) in
                                                            let x_531_45'9 = PRIM_CharChr(x_530_0'0) in
                                                            let uLET_434_45'9 = fun [x_531_45'9] xs_532_45'11 k ->
                                                              let con_435_0'0 = Cons1[x_531_45'9,xs_532_45'11] in
                                                              k con_435_0'0 in
                                                            let k [loop_525_84'10,i_526_84'19] app_433_86'40 =
                                                              let k [i_526_84'19] app_432_86'11 =
                                                                let y_533_0'0 = 10 in
                                                                let uLET_436_0'0 = PRIM_DivInt(i_526_84'19,y_533_0'0) in
                                                                app_432_86'11 uLET_436_0'0 k in
                                                              loop_525_84'10 app_433_86'40 k in
                                                            uLET_434_45'9 acc_524_84'15 k in
                                                        k lam_437_84'19) in
                                                      let y_535_0'0 = 0 in
                                                      let uLET_438_0'0 = PRIM_EqInt(n_520_158'15,y_535_0'0) in
                                                      let k [put_chars_52_90'8,res_521_159'15] uLET_430_82'6 =
                                                        let k [put_chars_52_90'8,res_521_159'15] __538_160'20 =
                                                          let s_539_95'15 = " --> " in
                                                          let prim_444_0'0 = PRIM_Explode(s_539_95'15) in
                                                          let k [put_chars_52_90'8,res_521_159'15] __540_161'29 =
                                                            let x_541_0'0 = '0' in
                                                            let ord0_542_82'6 = PRIM_CharOrd(x_541_0'0) in
                                                            let loop_553_84'10 = fix (fun [ord0_542_82'6] loop_544_84'10 acc_543_84'15 k ->
                                                              let lam_452_84'19 = fun [ord0_542_82'6,acc_543_84'15,loop_544_84'10] i_545_84'19 k ->
                                                                let y_546_0'0 = 0 in
                                                                let uLET_446_0'0 = PRIM_EqInt(i_545_84'19,y_546_0'0) in
                                                                match uLET_446_0'0 with
                                                                | true1 -> k acc_543_84'15
                                                                | false0 ->
                                                                  let y_547_0'0 = 10 in
                                                                  let c_548_83'20 = PRIM_ModInt(i_545_84'19,y_547_0'0) in
                                                                  let x_549_0'0 = PRIM_AddInt(ord0_542_82'6,c_548_83'20) in
                                                                  let x_550_45'9 = PRIM_CharChr(x_549_0'0) in
                                                                  let uLET_449_45'9 = fun [x_550_45'9] xs_551_45'11 k ->
                                                                    let con_450_0'0 = Cons1[x_550_45'9,xs_551_45'11] in
                                                                    k con_450_0'0 in
                                                                  let k [loop_544_84'10,i_545_84'19] app_448_86'40 =
                                                                    let k [i_545_84'19] app_447_86'11 =
                                                                      let y_552_0'0 = 10 in
                                                                      let uLET_451_0'0 = PRIM_DivInt(i_545_84'19,y_552_0'0) in
                                                                      app_447_86'11 uLET_451_0'0 k in
                                                                    loop_544_84'10 app_448_86'40 k in
                                                                  uLET_449_45'9 acc_543_84'15 k in
                                                              k lam_452_84'19) in
                                                            let y_554_0'0 = 0 in
                                                            let uLET_453_0'0 = PRIM_EqInt(res_521_159'15,y_554_0'0) in
                                                            let k [put_chars_52_90'8] uLET_445_82'6 =
                                                              let k [] __557_162'22 =
                                                                let __558_99'12 = Unit0 in
                                                                let c_559_12'13 = '\n' in
                                                                let backspace_560_13'6 = 8 in
                                                                let n_561_14'6 = PRIM_CharOrd(c_559_12'13) in
                                                                let prim_459_0'0 = PRIM_EqInt(n_561_14'6,backspace_560_13'6) in
                                                                match prim_459_0'0 with
                                                                | true1 ->
                                                                  let prim_460_0'0 = PRIM_PutChar(c_559_12'13) in
                                                                  k prim_460_0'0
                                                                | false0 ->
                                                                  let y_562_0'0 = '\n' in
                                                                  let uLET_461_0'0 = PRIM_EqChar(c_559_12'13,y_562_0'0) in
                                                                  match uLET_461_0'0 with
                                                                  | true1 ->
                                                                    let prim_462_0'0 = PRIM_PutChar(c_559_12'13) in
                                                                    k prim_462_0'0
                                                                  | false0 ->
                                                                    let b_563_7'10 = 26 in
                                                                    let uLET_463_7'10 = PRIM_LessInt(b_563_7'10,n_561_14'6) in
                                                                    match uLET_463_7'10 with
                                                                    | true1 ->
                                                                      let prim_464_0'0 = PRIM_PutChar(c_559_12'13) in
                                                                      k prim_464_0'0
                                                                    | false0 ->
                                                                      let x_564_0'0 = '^' in
                                                                      let __565_18'21 = PRIM_PutChar(x_564_0'0) in
                                                                      let x_566_0'0 = 'A' in
                                                                      let x_567_0'0 = PRIM_CharOrd(x_566_0'0) in
                                                                      let uLET_466_0'0 = fun [x_567_0'0] y_568_0'0 k ->
                                                                        let prim_467_0'0 = PRIM_AddInt(x_567_0'0,y_568_0'0) in
                                                                        k prim_467_0'0 in
                                                                      let k [] x_569_0'0 =
                                                                        let uLET_465_0'0 = fun [x_569_0'0] y_570_0'0 k ->
                                                                          let prim_468_0'0 = PRIM_SubInt(x_569_0'0,y_570_0'0) in
                                                                          k prim_468_0'0 in
                                                                        let lit_469_18'52 = 1 in
                                                                        let k [] x_571_0'0 =
                                                                          let x_572_0'0 = PRIM_CharChr(x_571_0'0) in
                                                                          let prim_470_0'0 = PRIM_PutChar(x_572_0'0) in
                                                                          k prim_470_0'0 in
                                                                        uLET_465_0'0 lit_469_18'52 k in
                                                                      uLET_466_0'0 n_561_14'6 k in
                                                              put_chars_52_90'8 uLET_445_82'6 k in
                                                            match uLET_453_0'0 with
                                                            | true1 ->
                                                              let x_555_45'9 = '0' in
                                                              let uLET_454_45'9 = fun [x_555_45'9] xs_556_45'11 k ->
                                                                let con_455_0'0 = Cons1[x_555_45'9,xs_556_45'11] in
                                                                k con_455_0'0 in
                                                              let con_456_88'25 = Nil0 in
                                                              uLET_454_45'9 con_456_88'25 k
                                                            | false0 ->
                                                              let con_458_88'38 = Nil0 in
                                                              let k [res_521_159'15] app_457_88'38 = app_457_88'38 res_521_159'15 k in
                                                              loop_553_84'10 con_458_88'38 k in
                                                          put_chars_52_90'8 prim_444_0'0 k in
                                                        put_chars_52_90'8 uLET_430_82'6 k in
                                                      match uLET_438_0'0 with
                                                      | true1 ->
                                                        let x_536_45'9 = '0' in
                                                        let uLET_439_45'9 = fun [x_536_45'9] xs_537_45'11 k ->
                                                          let con_440_0'0 = Cons1[x_536_45'9,xs_537_45'11] in
                                                          k con_440_0'0 in
                                                        let con_441_88'25 = Nil0 in
                                                        uLET_439_45'9 con_441_88'25 k
                                                      | false0 ->
                                                        let con_443_88'38 = Nil0 in
                                                        let k [n_520_158'15] app_442_88'38 = app_442_88'38 n_520_158'15 k in
                                                        loop_534_84'10 con_443_88'38 k in
                                                    fact_68_125'8 n_520_158'15 k in
                                                app_414_43'7 arg1_459_152'4 k in
                                              loop_500_35'10 lit_415_43'7 k in
                                        put_chars_52_90'8 prim_362_0'0 k
                                      | false0 ->
                                        let x_573_0'0 = "rev" in
                                        let b_574_56'19 = PRIM_Explode(x_573_0'0) in
                                        let lam_474_0'0 = fun [] x_575_0'0 k ->
                                          let lam_476_0'0 = fun [x_575_0'0] y_576_0'0 k ->
                                            let prim_475_0'0 = PRIM_EqChar(x_575_0'0,y_576_0'0) in
                                            k prim_475_0'0 in
                                          k lam_476_0'0 in
                                        let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,single_controlD_72_166'4,xs_258_215'6,command_293_207'4,args_294_207'13,b_574_56'19] app_473_56'31 =
                                          let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,single_controlD_72_166'4,xs_258_215'6,args_294_207'13,b_574_56'19] app_472_56'39 =
                                            let k [eq_list_11_47'8,append_18_58'8,map_26_71'8,length_33_76'8,put_chars_52_90'8,single_controlD_72_166'4,xs_258_215'6,args_294_207'13] uLET_471_56'19 =
                                              match uLET_471_56'19 with
                                              | true1 ->
                                                match args_294_207'13 with
                                                | Cons1(__577_178'4,__578_178'7) ->
                                                  let s_579_129'10 = "rev: expected no arguments" in
                                                  let s_580_95'15 = "ERROR: " in
                                                  let prim_477_0'0 = PRIM_Explode(s_580_95'15) in
                                                  let k [put_chars_52_90'8,s_579_129'10] __581_129'34 =
                                                    let prim_478_0'0 = PRIM_Explode(s_579_129'10) in
                                                    let k [] __582_129'48 =
                                                      let __583_99'12 = Unit0 in
                                                      let c_584_12'13 = '\n' in
                                                      let backspace_585_13'6 = 8 in
                                                      let n_586_14'6 = PRIM_CharOrd(c_584_12'13) in
                                                      let prim_479_0'0 = PRIM_EqInt(n_586_14'6,backspace_585_13'6) in
                                                      match prim_479_0'0 with
                                                      | true1 ->
                                                        let prim_480_0'0 = PRIM_PutChar(c_584_12'13) in
                                                        k prim_480_0'0
                                                      | false0 ->
                                                        let y_587_0'0 = '\n' in
                                                        let uLET_481_0'0 = PRIM_EqChar(c_584_12'13,y_587_0'0) in
                                                        match uLET_481_0'0 with
                                                        | true1 ->
                                                          let prim_482_0'0 = PRIM_PutChar(c_584_12'13) in
                                                          k prim_482_0'0
                                                        | false0 ->
                                                          let b_588_7'10 = 26 in
                                                          let uLET_483_7'10 = PRIM_LessInt(b_588_7'10,n_586_14'6) in
                                                          match uLET_483_7'10 with
                                                          | true1 ->
                                                            let prim_484_0'0 = PRIM_PutChar(c_584_12'13) in
                                                            k prim_484_0'0
                                                          | false0 ->
                                                            let x_589_0'0 = '^' in
                                                            let __590_18'21 = PRIM_PutChar(x_589_0'0) in
                                                            let x_591_0'0 = 'A' in
                                                            let x_592_0'0 = PRIM_CharOrd(x_591_0'0) in
                                                            let uLET_486_0'0 = fun [x_592_0'0] y_593_0'0 k ->
                                                              let prim_487_0'0 = PRIM_AddInt(x_592_0'0,y_593_0'0) in
                                                              k prim_487_0'0 in
                                                            let k [] x_594_0'0 =
                                                              let uLET_485_0'0 = fun [x_594_0'0] y_595_0'0 k ->
                                                                let prim_488_0'0 = PRIM_SubInt(x_594_0'0,y_595_0'0) in
                                                                k prim_488_0'0 in
                                                              let lit_489_18'52 = 1 in
                                                              let k [] x_596_0'0 =
                                                                let x_597_0'0 = PRIM_CharChr(x_596_0'0) in
                                                                let prim_490_0'0 = PRIM_PutChar(x_597_0'0) in
                                                                k prim_490_0'0 in
                                                              uLET_485_0'0 lit_489_18'52 k in
                                                            uLET_486_0'0 n_586_14'6 k in
                                                    put_chars_52_90'8 prim_478_0'0 k in
                                                  put_chars_52_90'8 prim_477_0'0 k
                                                | Nil0 ->
                                                  let s_598_95'15 = "(reverse typed lines until ^D)\n" in
                                                  let prim_491_0'0 = PRIM_Explode(s_598_95'15) in
                                                  let k [eq_list_11_47'8,put_chars_52_90'8,single_controlD_72_166'4] __599_180'50 =
                                                    let __600_168'7 = Unit0 in
                                                    let loop_811_169'10 = fix (fun [eq_list_11_47'8,put_chars_52_90'8,single_controlD_72_166'4] loop_602_169'10 __601_169'14 k ->
                                                      let __603_101'14 = Unit0 in
                                                      let x_604_0'0 = 4 in
                                                      let controlD_605_102'6 = PRIM_CharChr(x_604_0'0) in
                                                      let loop_784_103'10 = fix (fun [controlD_605_102'6] loop_607_103'10 acc_606_103'15 k ->
                                                        let x_608_0'0 = Unit0 in
                                                        let c_609_104'8 = PRIM_GetChar(x_608_0'0) in
                                                        let n_610_105'8 = PRIM_CharOrd(c_609_104'8) in
                                                        let y_611_0'0 = '\n' in
                                                        let uLET_492_0'0 = PRIM_EqChar(c_609_104'8,y_611_0'0) in
                                                        match uLET_492_0'0 with
                                                        | true1 ->
                                                          let __612_99'12 = Unit0 in
                                                          let c_613_12'13 = '\n' in
                                                          let backspace_614_13'6 = 8 in
                                                          let n_615_14'6 = PRIM_CharOrd(c_613_12'13) in
                                                          let prim_493_0'0 = PRIM_EqInt(n_615_14'6,backspace_614_13'6) in
                                                          let k [acc_606_103'15] __627_106'37 =
                                                            let loop_633_64'10 = fix (fun [] loop_629_64'10 acc_628_64'15 k ->
                                                              let lam_507_64'19 = fun [acc_628_64'15,loop_629_64'10] xs_630_64'19 k ->
                                                                match xs_630_64'19 with
                                                                | Nil0 -> k acc_628_64'15
                                                                | Cons1(x_631_67'6,xs_632_67'9) ->
                                                                  let con_506_0'0 = Cons1[x_631_67'6,acc_628_64'15] in
                                                                  let k [xs_632_67'9] app_505_67'20 = app_505_67'20 xs_632_67'9 k in
                                                                  loop_629_64'10 con_506_0'0 k in
                                                              k lam_507_64'19) in
                                                            let con_509_69'7 = Nil0 in
                                                            let k [acc_606_103'15] app_508_69'7 = app_508_69'7 acc_606_103'15 k in
                                                            loop_633_64'10 con_509_69'7 k in
                                                          match prim_493_0'0 with
                                                          | true1 ->
                                                            let prim_494_0'0 = PRIM_PutChar(c_613_12'13) in
                                                            k prim_494_0'0
                                                          | false0 ->
                                                            let y_616_0'0 = '\n' in
                                                            let uLET_495_0'0 = PRIM_EqChar(c_613_12'13,y_616_0'0) in
                                                            match uLET_495_0'0 with
                                                            | true1 ->
                                                              let prim_496_0'0 = PRIM_PutChar(c_613_12'13) in
                                                              k prim_496_0'0
                                                            | false0 ->
                                                              let b_617_7'10 = 26 in
                                                              let uLET_497_7'10 = PRIM_LessInt(b_617_7'10,n_615_14'6) in
                                                              match uLET_497_7'10 with
                                                              | true1 ->
                                                                let prim_498_0'0 = PRIM_PutChar(c_613_12'13) in
                                                                k prim_498_0'0
                                                              | false0 ->
                                                                let x_618_0'0 = '^' in
                                                                let __619_18'21 = PRIM_PutChar(x_618_0'0) in
                                                                let x_620_0'0 = 'A' in
                                                                let x_621_0'0 = PRIM_CharOrd(x_620_0'0) in
                                                                let uLET_500_0'0 = fun [x_621_0'0] y_622_0'0 k ->
                                                                  let prim_501_0'0 = PRIM_AddInt(x_621_0'0,y_622_0'0) in
                                                                  k prim_501_0'0 in
                                                                let k [] x_623_0'0 =
                                                                  let uLET_499_0'0 = fun [x_623_0'0] y_624_0'0 k ->
                                                                    let prim_502_0'0 = PRIM_SubInt(x_623_0'0,y_624_0'0) in
                                                                    k prim_502_0'0 in
                                                                  let lit_503_18'52 = 1 in
                                                                  let k [] x_625_0'0 =
                                                                    let x_626_0'0 = PRIM_CharChr(x_625_0'0) in
                                                                    let prim_504_0'0 = PRIM_PutChar(x_626_0'0) in
                                                                    k prim_504_0'0 in
                                                                  uLET_499_0'0 lit_503_18'52 k in
                                                                uLET_500_0'0 n_615_14'6 k
                                                        | false0 ->
                                                          let prim_510_0'0 = PRIM_EqChar(c_609_104'8,controlD_605_102'6) in
                                                          match prim_510_0'0 with
                                                          | true1 ->
                                                            let backspace_634_13'6 = 8 in
                                                            let n_635_14'6 = PRIM_CharOrd(c_609_104'8) in
                                                            let prim_511_0'0 = PRIM_EqInt(n_635_14'6,backspace_634_13'6) in
                                                            let k [controlD_605_102'6,acc_606_103'15] __647_107'44 =
                                                              let __648_99'12 = Unit0 in
                                                              let c_649_12'13 = '\n' in
                                                              let backspace_650_13'6 = 8 in
                                                              let n_651_14'6 = PRIM_CharOrd(c_649_12'13) in
                                                              let prim_523_0'0 = PRIM_EqInt(n_651_14'6,backspace_650_13'6) in
                                                              let k [controlD_605_102'6,acc_606_103'15] __663_107'55 =
                                                                let xs_664_63'12 = Cons1[controlD_605_102'6,acc_606_103'15] in
                                                                let loop_670_64'10 = fix (fun [] loop_666_64'10 acc_665_64'15 k ->
                                                                  let lam_537_64'19 = fun [acc_665_64'15,loop_666_64'10] xs_667_64'19 k ->
                                                                    match xs_667_64'19 with
                                                                    | Nil0 -> k acc_665_64'15
                                                                    | Cons1(x_668_67'6,xs_669_67'9) ->
                                                                      let con_536_0'0 = Cons1[x_668_67'6,acc_665_64'15] in
                                                                      let k [xs_669_67'9] app_535_67'20 = app_535_67'20 xs_669_67'9 k in
                                                                      loop_666_64'10 con_536_0'0 k in
                                                                  k lam_537_64'19) in
                                                                let con_539_69'7 = Nil0 in
                                                                let k [xs_664_63'12] app_538_69'7 = app_538_69'7 xs_664_63'12 k in
                                                                loop_670_64'10 con_539_69'7 k in
                                                              match prim_523_0'0 with
                                                              | true1 ->
                                                                let prim_524_0'0 = PRIM_PutChar(c_649_12'13) in
                                                                k prim_524_0'0
                                                              | false0 ->
                                                                let y_652_0'0 = '\n' in
                                                                let uLET_525_0'0 = PRIM_EqChar(c_649_12'13,y_652_0'0) in
                                                                match uLET_525_0'0 with
                                                                | true1 ->
                                                                  let prim_526_0'0 = PRIM_PutChar(c_649_12'13) in
                                                                  k prim_526_0'0
                                                                | false0 ->
                                                                  let b_653_7'10 = 26 in
                                                                  let uLET_527_7'10 = PRIM_LessInt(b_653_7'10,n_651_14'6) in
                                                                  match uLET_527_7'10 with
                                                                  | true1 ->
                                                                    let prim_528_0'0 = PRIM_PutChar(c_649_12'13) in
                                                                    k prim_528_0'0
                                                                  | false0 ->
                                                                    let x_654_0'0 = '^' in
                                                                    let __655_18'21 = PRIM_PutChar(x_654_0'0) in
                                                                    let x_656_0'0 = 'A' in
                                                                    let x_657_0'0 = PRIM_CharOrd(x_656_0'0) in
                                                                    let uLET_530_0'0 = fun [x_657_0'0] y_658_0'0 k ->
                                                                      let prim_531_0'0 = PRIM_AddInt(x_657_0'0,y_658_0'0) in
                                                                      k prim_531_0'0 in
                                                                    let k [] x_659_0'0 =
                                                                      let uLET_529_0'0 = fun [x_659_0'0] y_660_0'0 k ->
                                                                        let prim_532_0'0 = PRIM_SubInt(x_659_0'0,y_660_0'0) in
                                                                        k prim_532_0'0 in
                                                                      let lit_533_18'52 = 1 in
                                                                      let k [] x_661_0'0 =
                                                                        let x_662_0'0 = PRIM_CharChr(x_661_0'0) in
                                                                        let prim_534_0'0 = PRIM_PutChar(x_662_0'0) in
                                                                        k prim_534_0'0 in
                                                                      uLET_529_0'0 lit_533_18'52 k in
                                                                    uLET_530_0'0 n_651_14'6 k in
                                                            match prim_511_0'0 with
                                                            | true1 ->
                                                              let prim_512_0'0 = PRIM_PutChar(c_609_104'8) in
                                                              k prim_512_0'0
                                                            | false0 ->
                                                              let y_636_0'0 = '\n' in
                                                              let uLET_513_0'0 = PRIM_EqChar(c_609_104'8,y_636_0'0) in
                                                              match uLET_513_0'0 with
                                                              | true1 ->
                                                                let prim_514_0'0 = PRIM_PutChar(c_609_104'8) in
                                                                k prim_514_0'0
                                                              | false0 ->
                                                                let b_637_7'10 = 26 in
                                                                let uLET_515_7'10 = PRIM_LessInt(b_637_7'10,n_635_14'6) in
                                                                match uLET_515_7'10 with
                                                                | true1 ->
                                                                  let prim_516_0'0 = PRIM_PutChar(c_609_104'8) in
                                                                  k prim_516_0'0
                                                                | false0 ->
                                                                  let x_638_0'0 = '^' in
                                                                  let __639_18'21 = PRIM_PutChar(x_638_0'0) in
                                                                  let x_640_0'0 = 'A' in
                                                                  let x_641_0'0 = PRIM_CharOrd(x_640_0'0) in
                                                                  let uLET_518_0'0 = fun [x_641_0'0] y_642_0'0 k ->
                                                                    let prim_519_0'0 = PRIM_AddInt(x_641_0'0,y_642_0'0) in
                                                                    k prim_519_0'0 in
                                                                  let k [] x_643_0'0 =
                                                                    let uLET_517_0'0 = fun [x_643_0'0] y_644_0'0 k ->
                                                                      let prim_520_0'0 = PRIM_SubInt(x_643_0'0,y_644_0'0) in
                                                                      k prim_520_0'0 in
                                                                    let lit_521_18'52 = 1 in
                                                                    let k [] x_645_0'0 =
                                                                      let x_646_0'0 = PRIM_CharChr(x_645_0'0) in
                                                                      let prim_522_0'0 = PRIM_PutChar(x_646_0'0) in
                                                                      k prim_522_0'0 in
                                                                    uLET_517_0'0 lit_521_18'52 k in
                                                                  uLET_518_0'0 n_635_14'6 k
                                                          | false0 ->
                                                            let b_671_7'10 = 127 in
                                                            let uLET_540_7'10 = PRIM_LessInt(b_671_7'10,n_610_105'8) in
                                                            match uLET_540_7'10 with
                                                            | true1 -> loop_607_103'10 acc_606_103'15 k
                                                            | false0 ->
                                                              let y_672_0'0 = 127 in
                                                              let uLET_541_0'0 = PRIM_EqInt(n_610_105'8,y_672_0'0) in
                                                              match uLET_541_0'0 with
                                                              | true1 ->
                                                                match acc_606_103'15 with
                                                                | Nil0 -> loop_607_103'10 acc_606_103'15 k
                                                                | Cons1(c_673_112'14,tail_674_112'17) ->
                                                                  let a_675_8'9 = PRIM_CharOrd(c_673_112'14) in
                                                                  let uLET_543_8'9 = fun [a_675_8'9] b_676_8'11 k ->
                                                                    let b_677_2'8 = PRIM_LessInt(b_676_8'11,a_675_8'9) in
                                                                    match b_677_2'8 with
                                                                    | true1 ->
                                                                      let con_544_4'12 = false0 in
                                                                      k con_544_4'12
                                                                    | false0 ->
                                                                      let con_545_5'13 = true1 in
                                                                      k con_545_5'13 in
                                                                  let lit_546_113'28 = 26 in
                                                                  let k [loop_607_103'10,tail_674_112'17] app_542_113'28 =
                                                                    let k [loop_607_103'10,tail_674_112'17] __723_113'58 =
                                                                      let __724_20'15 = Unit0 in
                                                                      let x_725_0'0 = 8 in
                                                                      let backspace_726_21'6 = PRIM_CharChr(x_725_0'0) in
                                                                      let backspace_727_13'6 = 8 in
                                                                      let n_728_14'6 = PRIM_CharOrd(backspace_726_21'6) in
                                                                      let prim_584_0'0 = PRIM_EqInt(n_728_14'6,backspace_727_13'6) in
                                                                      let k [loop_607_103'10,tail_674_112'17,backspace_726_21'6] __740_23'20 =
                                                                        let c_741_12'13 = ' ' in
                                                                        let backspace_742_13'6 = 8 in
                                                                        let n_743_14'6 = PRIM_CharOrd(c_741_12'13) in
                                                                        let prim_596_0'0 = PRIM_EqInt(n_743_14'6,backspace_742_13'6) in
                                                                        let k [loop_607_103'10,tail_674_112'17,backspace_726_21'6] __755_24'14 =
                                                                          let backspace_756_13'6 = 8 in
                                                                          let n_757_14'6 = PRIM_CharOrd(backspace_726_21'6) in
                                                                          let prim_608_0'0 = PRIM_EqInt(n_757_14'6,backspace_756_13'6) in
                                                                          let k [loop_607_103'10,tail_674_112'17] __769_114'27 = loop_607_103'10 tail_674_112'17 k in
                                                                          match prim_608_0'0 with
                                                                          | true1 ->
                                                                            let prim_609_0'0 = PRIM_PutChar(backspace_726_21'6) in
                                                                            k prim_609_0'0
                                                                          | false0 ->
                                                                            let y_758_0'0 = '\n' in
                                                                            let uLET_610_0'0 = PRIM_EqChar(backspace_726_21'6,y_758_0'0) in
                                                                            match uLET_610_0'0 with
                                                                            | true1 ->
                                                                              let prim_611_0'0 = PRIM_PutChar(backspace_726_21'6) in
                                                                              k prim_611_0'0
                                                                            | false0 ->
                                                                              let b_759_7'10 = 26 in
                                                                              let uLET_612_7'10 = PRIM_LessInt(b_759_7'10,n_757_14'6) in
                                                                              match uLET_612_7'10 with
                                                                              | true1 ->
                                                                                let prim_613_0'0 = PRIM_PutChar(backspace_726_21'6) in
                                                                                k prim_613_0'0
                                                                              | false0 ->
                                                                                let x_760_0'0 = '^' in
                                                                                let __761_18'21 = PRIM_PutChar(x_760_0'0) in
                                                                                let x_762_0'0 = 'A' in
                                                                                let x_763_0'0 = PRIM_CharOrd(x_762_0'0) in
                                                                                let uLET_615_0'0 = fun [x_763_0'0] y_764_0'0 k ->
                                                                                  let prim_616_0'0 = PRIM_AddInt(x_763_0'0,y_764_0'0) in
                                                                                  k prim_616_0'0 in
                                                                                let k [] x_765_0'0 =
                                                                                  let uLET_614_0'0 = fun [x_765_0'0] y_766_0'0 k ->
                                                                                    let prim_617_0'0 = PRIM_SubInt(x_765_0'0,y_766_0'0) in
                                                                                    k prim_617_0'0 in
                                                                                  let lit_618_18'52 = 1 in
                                                                                  let k [] x_767_0'0 =
                                                                                    let x_768_0'0 = PRIM_CharChr(x_767_0'0) in
                                                                                    let prim_619_0'0 = PRIM_PutChar(x_768_0'0) in
                                                                                    k prim_619_0'0 in
                                                                                  uLET_614_0'0 lit_618_18'52 k in
                                                                                uLET_615_0'0 n_757_14'6 k in
                                                                        match prim_596_0'0 with
                                                                        | true1 ->
                                                                          let prim_597_0'0 = PRIM_PutChar(c_741_12'13) in
                                                                          k prim_597_0'0
                                                                        | false0 ->
                                                                          let y_744_0'0 = '\n' in
                                                                          let uLET_598_0'0 = PRIM_EqChar(c_741_12'13,y_744_0'0) in
                                                                          match uLET_598_0'0 with
                                                                          | true1 ->
                                                                            let prim_599_0'0 = PRIM_PutChar(c_741_12'13) in
                                                                            k prim_599_0'0
                                                                          | false0 ->
                                                                            let b_745_7'10 = 26 in
                                                                            let uLET_600_7'10 = PRIM_LessInt(b_745_7'10,n_743_14'6) in
                                                                            match uLET_600_7'10 with
                                                                            | true1 ->
                                                                              let prim_601_0'0 = PRIM_PutChar(c_741_12'13) in
                                                                              k prim_601_0'0
                                                                            | false0 ->
                                                                              let x_746_0'0 = '^' in
                                                                              let __747_18'21 = PRIM_PutChar(x_746_0'0) in
                                                                              let x_748_0'0 = 'A' in
                                                                              let x_749_0'0 = PRIM_CharOrd(x_748_0'0) in
                                                                              let uLET_603_0'0 = fun [x_749_0'0] y_750_0'0 k ->
                                                                                let prim_604_0'0 = PRIM_AddInt(x_749_0'0,y_750_0'0) in
                                                                                k prim_604_0'0 in
                                                                              let k [] x_751_0'0 =
                                                                                let uLET_602_0'0 = fun [x_751_0'0] y_752_0'0 k ->
                                                                                  let prim_605_0'0 = PRIM_SubInt(x_751_0'0,y_752_0'0) in
                                                                                  k prim_605_0'0 in
                                                                                let lit_606_18'52 = 1 in
                                                                                let k [] x_753_0'0 =
                                                                                  let x_754_0'0 = PRIM_CharChr(x_753_0'0) in
                                                                                  let prim_607_0'0 = PRIM_PutChar(x_754_0'0) in
                                                                                  k prim_607_0'0 in
                                                                                uLET_602_0'0 lit_606_18'52 k in
                                                                              uLET_603_0'0 n_743_14'6 k in
                                                                      match prim_584_0'0 with
                                                                      | true1 ->
                                                                        let prim_585_0'0 = PRIM_PutChar(backspace_726_21'6) in
                                                                        k prim_585_0'0
                                                                      | false0 ->
                                                                        let y_729_0'0 = '\n' in
                                                                        let uLET_586_0'0 = PRIM_EqChar(backspace_726_21'6,y_729_0'0) in
                                                                        match uLET_586_0'0 with
                                                                        | true1 ->
                                                                          let prim_587_0'0 = PRIM_PutChar(backspace_726_21'6) in
                                                                          k prim_587_0'0
                                                                        | false0 ->
                                                                          let b_730_7'10 = 26 in
                                                                          let uLET_588_7'10 = PRIM_LessInt(b_730_7'10,n_728_14'6) in
                                                                          match uLET_588_7'10 with
                                                                          | true1 ->
                                                                            let prim_589_0'0 = PRIM_PutChar(backspace_726_21'6) in
                                                                            k prim_589_0'0
                                                                          | false0 ->
                                                                            let x_731_0'0 = '^' in
                                                                            let __732_18'21 = PRIM_PutChar(x_731_0'0) in
                                                                            let x_733_0'0 = 'A' in
                                                                            let x_734_0'0 = PRIM_CharOrd(x_733_0'0) in
                                                                            let uLET_591_0'0 = fun [x_734_0'0] y_735_0'0 k ->
                                                                              let prim_592_0'0 = PRIM_AddInt(x_734_0'0,y_735_0'0) in
                                                                              k prim_592_0'0 in
                                                                            let k [] x_736_0'0 =
                                                                              let uLET_590_0'0 = fun [x_736_0'0] y_737_0'0 k ->
                                                                                let prim_593_0'0 = PRIM_SubInt(x_736_0'0,y_737_0'0) in
                                                                                k prim_593_0'0 in
                                                                              let lit_594_18'52 = 1 in
                                                                              let k [] x_738_0'0 =
                                                                                let x_739_0'0 = PRIM_CharChr(x_738_0'0) in
                                                                                let prim_595_0'0 = PRIM_PutChar(x_739_0'0) in
                                                                                k prim_595_0'0 in
                                                                              uLET_590_0'0 lit_594_18'52 k in
                                                                            uLET_591_0'0 n_728_14'6 k in
                                                                    match app_542_113'28 with
                                                                    | true1 ->
                                                                      let __678_20'15 = Unit0 in
                                                                      let x_679_0'0 = 8 in
                                                                      let backspace_680_21'6 = PRIM_CharChr(x_679_0'0) in
                                                                      let backspace_681_13'6 = 8 in
                                                                      let n_682_14'6 = PRIM_CharOrd(backspace_680_21'6) in
                                                                      let prim_547_0'0 = PRIM_EqInt(n_682_14'6,backspace_681_13'6) in
                                                                      let k [backspace_680_21'6] __694_23'20 =
                                                                        let c_695_12'13 = ' ' in
                                                                        let backspace_696_13'6 = 8 in
                                                                        let n_697_14'6 = PRIM_CharOrd(c_695_12'13) in
                                                                        let prim_559_0'0 = PRIM_EqInt(n_697_14'6,backspace_696_13'6) in
                                                                        let k [backspace_680_21'6] __709_24'14 =
                                                                          let backspace_710_13'6 = 8 in
                                                                          let n_711_14'6 = PRIM_CharOrd(backspace_680_21'6) in
                                                                          let prim_571_0'0 = PRIM_EqInt(n_711_14'6,backspace_710_13'6) in
                                                                          match prim_571_0'0 with
                                                                          | true1 ->
                                                                            let prim_572_0'0 = PRIM_PutChar(backspace_680_21'6) in
                                                                            k prim_572_0'0
                                                                          | false0 ->
                                                                            let y_712_0'0 = '\n' in
                                                                            let uLET_573_0'0 = PRIM_EqChar(backspace_680_21'6,y_712_0'0) in
                                                                            match uLET_573_0'0 with
                                                                            | true1 ->
                                                                              let prim_574_0'0 = PRIM_PutChar(backspace_680_21'6) in
                                                                              k prim_574_0'0
                                                                            | false0 ->
                                                                              let b_713_7'10 = 26 in
                                                                              let uLET_575_7'10 = PRIM_LessInt(b_713_7'10,n_711_14'6) in
                                                                              match uLET_575_7'10 with
                                                                              | true1 ->
                                                                                let prim_576_0'0 = PRIM_PutChar(backspace_680_21'6) in
                                                                                k prim_576_0'0
                                                                              | false0 ->
                                                                                let x_714_0'0 = '^' in
                                                                                let __715_18'21 = PRIM_PutChar(x_714_0'0) in
                                                                                let x_716_0'0 = 'A' in
                                                                                let x_717_0'0 = PRIM_CharOrd(x_716_0'0) in
                                                                                let uLET_578_0'0 = fun [x_717_0'0] y_718_0'0 k ->
                                                                                  let prim_579_0'0 = PRIM_AddInt(x_717_0'0,y_718_0'0) in
                                                                                  k prim_579_0'0 in
                                                                                let k [] x_719_0'0 =
                                                                                  let uLET_577_0'0 = fun [x_719_0'0] y_720_0'0 k ->
                                                                                    let prim_580_0'0 = PRIM_SubInt(x_719_0'0,y_720_0'0) in
                                                                                    k prim_580_0'0 in
                                                                                  let lit_581_18'52 = 1 in
                                                                                  let k [] x_721_0'0 =
                                                                                    let x_722_0'0 = PRIM_CharChr(x_721_0'0) in
                                                                                    let prim_582_0'0 = PRIM_PutChar(x_722_0'0) in
                                                                                    k prim_582_0'0 in
                                                                                  uLET_577_0'0 lit_581_18'52 k in
                                                                                uLET_578_0'0 n_711_14'6 k in
                                                                        match prim_559_0'0 with
                                                                        | true1 ->
                                                                          let prim_560_0'0 = PRIM_PutChar(c_695_12'13) in
                                                                          k prim_560_0'0
                                                                        | false0 ->
                                                                          let y_698_0'0 = '\n' in
                                                                          let uLET_561_0'0 = PRIM_EqChar(c_695_12'13,y_698_0'0) in
                                                                          match uLET_561_0'0 with
                                                                          | true1 ->
                                                                            let prim_562_0'0 = PRIM_PutChar(c_695_12'13) in
                                                                            k prim_562_0'0
                                                                          | false0 ->
                                                                            let b_699_7'10 = 26 in
                                                                            let uLET_563_7'10 = PRIM_LessInt(b_699_7'10,n_697_14'6) in
                                                                            match uLET_563_7'10 with
                                                                            | true1 ->
                                                                              let prim_564_0'0 = PRIM_PutChar(c_695_12'13) in
                                                                              k prim_564_0'0
                                                                            | false0 ->
                                                                              let x_700_0'0 = '^' in
                                                                              let __701_18'21 = PRIM_PutChar(x_700_0'0) in
                                                                              let x_702_0'0 = 'A' in
                                                                              let x_703_0'0 = PRIM_CharOrd(x_702_0'0) in
                                                                              let uLET_566_0'0 = fun [x_703_0'0] y_704_0'0 k ->
                                                                                let prim_567_0'0 = PRIM_AddInt(x_703_0'0,y_704_0'0) in
                                                                                k prim_567_0'0 in
                                                                              let k [] x_705_0'0 =
                                                                                let uLET_565_0'0 = fun [x_705_0'0] y_706_0'0 k ->
                                                                                  let prim_568_0'0 = PRIM_SubInt(x_705_0'0,y_706_0'0) in
                                                                                  k prim_568_0'0 in
                                                                                let lit_569_18'52 = 1 in
                                                                                let k [] x_707_0'0 =
                                                                                  let x_708_0'0 = PRIM_CharChr(x_707_0'0) in
                                                                                  let prim_570_0'0 = PRIM_PutChar(x_708_0'0) in
                                                                                  k prim_570_0'0 in
                                                                                uLET_565_0'0 lit_569_18'52 k in
                                                                              uLET_566_0'0 n_697_14'6 k in
                                                                      match prim_547_0'0 with
                                                                      | true1 ->
                                                                        let prim_548_0'0 = PRIM_PutChar(backspace_680_21'6) in
                                                                        k prim_548_0'0
                                                                      | false0 ->
                                                                        let y_683_0'0 = '\n' in
                                                                        let uLET_549_0'0 = PRIM_EqChar(backspace_680_21'6,y_683_0'0) in
                                                                        match uLET_549_0'0 with
                                                                        | true1 ->
                                                                          let prim_550_0'0 = PRIM_PutChar(backspace_680_21'6) in
                                                                          k prim_550_0'0
                                                                        | false0 ->
                                                                          let b_684_7'10 = 26 in
                                                                          let uLET_551_7'10 = PRIM_LessInt(b_684_7'10,n_682_14'6) in
                                                                          match uLET_551_7'10 with
                                                                          | true1 ->
                                                                            let prim_552_0'0 = PRIM_PutChar(backspace_680_21'6) in
                                                                            k prim_552_0'0
                                                                          | false0 ->
                                                                            let x_685_0'0 = '^' in
                                                                            let __686_18'21 = PRIM_PutChar(x_685_0'0) in
                                                                            let x_687_0'0 = 'A' in
                                                                            let x_688_0'0 = PRIM_CharOrd(x_687_0'0) in
                                                                            let uLET_554_0'0 = fun [x_688_0'0] y_689_0'0 k ->
                                                                              let prim_555_0'0 = PRIM_AddInt(x_688_0'0,y_689_0'0) in
                                                                              k prim_555_0'0 in
                                                                            let k [] x_690_0'0 =
                                                                              let uLET_553_0'0 = fun [x_690_0'0] y_691_0'0 k ->
                                                                                let prim_556_0'0 = PRIM_SubInt(x_690_0'0,y_691_0'0) in
                                                                                k prim_556_0'0 in
                                                                              let lit_557_18'52 = 1 in
                                                                              let k [] x_692_0'0 =
                                                                                let x_693_0'0 = PRIM_CharChr(x_692_0'0) in
                                                                                let prim_558_0'0 = PRIM_PutChar(x_693_0'0) in
                                                                                k prim_558_0'0 in
                                                                              uLET_553_0'0 lit_557_18'52 k in
                                                                            uLET_554_0'0 n_682_14'6 k
                                                                    | false0 ->
                                                                      let con_583_113'55 = Unit0 in
                                                                      k con_583_113'55 in
                                                                  uLET_543_8'9 lit_546_113'28 k
                                                              | false0 ->
                                                                let backspace_770_13'6 = 8 in
                                                                let n_771_14'6 = PRIM_CharOrd(c_609_104'8) in
                                                                let prim_620_0'0 = PRIM_EqInt(n_771_14'6,backspace_770_13'6) in
                                                                let k [acc_606_103'15,loop_607_103'10,c_609_104'8] __783_117'23 =
                                                                  let con_632_0'0 = Cons1[c_609_104'8,acc_606_103'15] in
                                                                  loop_607_103'10 con_632_0'0 k in
                                                                match prim_620_0'0 with
                                                                | true1 ->
                                                                  let prim_621_0'0 = PRIM_PutChar(c_609_104'8) in
                                                                  k prim_621_0'0
                                                                | false0 ->
                                                                  let y_772_0'0 = '\n' in
                                                                  let uLET_622_0'0 = PRIM_EqChar(c_609_104'8,y_772_0'0) in
                                                                  match uLET_622_0'0 with
                                                                  | true1 ->
                                                                    let prim_623_0'0 = PRIM_PutChar(c_609_104'8) in
                                                                    k prim_623_0'0
                                                                  | false0 ->
                                                                    let b_773_7'10 = 26 in
                                                                    let uLET_624_7'10 = PRIM_LessInt(b_773_7'10,n_771_14'6) in
                                                                    match uLET_624_7'10 with
                                                                    | true1 ->
                                                                      let prim_625_0'0 = PRIM_PutChar(c_609_104'8) in
                                                                      k prim_625_0'0
                                                                    | false0 ->
                                                                      let x_774_0'0 = '^' in
                                                                      let __775_18'21 = PRIM_PutChar(x_774_0'0) in
                                                                      let x_776_0'0 = 'A' in
                                                                      let x_777_0'0 = PRIM_CharOrd(x_776_0'0) in
                                                                      let uLET_627_0'0 = fun [x_777_0'0] y_778_0'0 k ->
                                                                        let prim_628_0'0 = PRIM_AddInt(x_777_0'0,y_778_0'0) in
                                                                        k prim_628_0'0 in
                                                                      let k [] x_779_0'0 =
                                                                        let uLET_626_0'0 = fun [x_779_0'0] y_780_0'0 k ->
                                                                          let prim_629_0'0 = PRIM_SubInt(x_779_0'0,y_780_0'0) in
                                                                          k prim_629_0'0 in
                                                                        let lit_630_18'52 = 1 in
                                                                        let k [] x_781_0'0 =
                                                                          let x_782_0'0 = PRIM_CharChr(x_781_0'0) in
                                                                          let prim_631_0'0 = PRIM_PutChar(x_782_0'0) in
                                                                          k prim_631_0'0 in
                                                                        uLET_626_0'0 lit_630_18'52 k in
                                                                      uLET_627_0'0 n_771_14'6 k) in
                                                      let con_633_119'7 = Nil0 in
                                                      let k [eq_list_11_47'8,put_chars_52_90'8,single_controlD_72_166'4,loop_602_169'10] xs_785_170'8 =
                                                        let lam_637_0'0 = fun [] x_786_0'0 k ->
                                                          let lam_639_0'0 = fun [x_786_0'0] y_787_0'0 k ->
                                                            let prim_638_0'0 = PRIM_EqChar(x_786_0'0,y_787_0'0) in
                                                            k prim_638_0'0 in
                                                          k lam_639_0'0 in
                                                        let k [put_chars_52_90'8,single_controlD_72_166'4,loop_602_169'10,xs_785_170'8] app_636_56'31 =
                                                          let k [put_chars_52_90'8,single_controlD_72_166'4,loop_602_169'10,xs_785_170'8] app_635_56'39 =
                                                            let k [put_chars_52_90'8,loop_602_169'10,xs_785_170'8] app_634_56'41 =
                                                              match app_634_56'41 with
                                                              | true1 ->
                                                                let con_640_171'44 = Unit0 in
                                                                k con_640_171'44
                                                              | false0 ->
                                                                let loop_793_64'10 = fix (fun [] loop_789_64'10 acc_788_64'15 k ->
                                                                  let lam_644_64'19 = fun [acc_788_64'15,loop_789_64'10] xs_790_64'19 k ->
                                                                    match xs_790_64'19 with
                                                                    | Nil0 -> k acc_788_64'15
                                                                    | Cons1(x_791_67'6,xs_792_67'9) ->
                                                                      let con_643_0'0 = Cons1[x_791_67'6,acc_788_64'15] in
                                                                      let k [xs_792_67'9] app_642_67'20 = app_642_67'20 xs_792_67'9 k in
                                                                      loop_789_64'10 con_643_0'0 k in
                                                                  k lam_644_64'19) in
                                                                let con_646_69'7 = Nil0 in
                                                                let k [put_chars_52_90'8,loop_602_169'10,xs_785_170'8] app_645_69'7 =
                                                                  let k [put_chars_52_90'8,loop_602_169'10] uLET_641_64'10 =
                                                                    let k [loop_602_169'10] __794_172'29 =
                                                                      let __795_99'12 = Unit0 in
                                                                      let c_796_12'13 = '\n' in
                                                                      let backspace_797_13'6 = 8 in
                                                                      let n_798_14'6 = PRIM_CharOrd(c_796_12'13) in
                                                                      let prim_647_0'0 = PRIM_EqInt(n_798_14'6,backspace_797_13'6) in
                                                                      let k [loop_602_169'10] __810_172'40 =
                                                                        let con_659_172'46 = Unit0 in
                                                                        loop_602_169'10 con_659_172'46 k in
                                                                      match prim_647_0'0 with
                                                                      | true1 ->
                                                                        let prim_648_0'0 = PRIM_PutChar(c_796_12'13) in
                                                                        k prim_648_0'0
                                                                      | false0 ->
                                                                        let y_799_0'0 = '\n' in
                                                                        let uLET_649_0'0 = PRIM_EqChar(c_796_12'13,y_799_0'0) in
                                                                        match uLET_649_0'0 with
                                                                        | true1 ->
                                                                          let prim_650_0'0 = PRIM_PutChar(c_796_12'13) in
                                                                          k prim_650_0'0
                                                                        | false0 ->
                                                                          let b_800_7'10 = 26 in
                                                                          let uLET_651_7'10 = PRIM_LessInt(b_800_7'10,n_798_14'6) in
                                                                          match uLET_651_7'10 with
                                                                          | true1 ->
                                                                            let prim_652_0'0 = PRIM_PutChar(c_796_12'13) in
                                                                            k prim_652_0'0
                                                                          | false0 ->
                                                                            let x_801_0'0 = '^' in
                                                                            let __802_18'21 = PRIM_PutChar(x_801_0'0) in
                                                                            let x_803_0'0 = 'A' in
                                                                            let x_804_0'0 = PRIM_CharOrd(x_803_0'0) in
                                                                            let uLET_654_0'0 = fun [x_804_0'0] y_805_0'0 k ->
                                                                              let prim_655_0'0 = PRIM_AddInt(x_804_0'0,y_805_0'0) in
                                                                              k prim_655_0'0 in
                                                                            let k [] x_806_0'0 =
                                                                              let uLET_653_0'0 = fun [x_806_0'0] y_807_0'0 k ->
                                                                                let prim_656_0'0 = PRIM_SubInt(x_806_0'0,y_807_0'0) in
                                                                                k prim_656_0'0 in
                                                                              let lit_657_18'52 = 1 in
                                                                              let k [] x_808_0'0 =
                                                                                let x_809_0'0 = PRIM_CharChr(x_808_0'0) in
                                                                                let prim_658_0'0 = PRIM_PutChar(x_809_0'0) in
                                                                                k prim_658_0'0 in
                                                                              uLET_653_0'0 lit_657_18'52 k in
                                                                            uLET_654_0'0 n_798_14'6 k in
                                                                    put_chars_52_90'8 uLET_641_64'10 k in
                                                                  app_645_69'7 xs_785_170'8 k in
                                                                loop_793_64'10 con_646_69'7 k in
                                                            app_635_56'39 single_controlD_72_166'4 k in
                                                          app_636_56'31 xs_785_170'8 k in
                                                        eq_list_11_47'8 lam_637_0'0 k in
                                                      loop_784_103'10 con_633_119'7 k) in
                                                    let con_660_174'6 = Unit0 in
                                                    loop_811_169'10 con_660_174'6 k in
                                                  put_chars_52_90'8 prim_491_0'0 k
                                              | false0 ->
                                                let lam_661_184'30 = fun [] c_812_184'30 k ->
                                                  let y_813_0'0 = 'o' in
                                                  let uLET_662_0'0 = PRIM_EqChar(c_812_184'30,y_813_0'0) in
                                                  match uLET_662_0'0 with
                                                  | true1 ->
                                                    let lit_663_184'57 = '*' in
                                                    k lit_663_184'57
                                                  | false0 -> k c_812_184'30 in
                                                let k [append_18_58'8,length_33_76'8,put_chars_52_90'8,xs_258_215'6] star_the_ohs_814_184'6 =
                                                  let k [append_18_58'8,put_chars_52_90'8,xs_258_215'6,star_the_ohs_814_184'6] n_815_185'6 =
                                                    let x_816_0'0 = "You wrote: \"" in
                                                    let uLET_666_0'0 = PRIM_Explode(x_816_0'0) in
                                                    let k [put_chars_52_90'8,xs_258_215'6,star_the_ohs_814_184'6,n_815_185'6] app_665_186'20 =
                                                      let k [put_chars_52_90'8,app_665_186'20,n_815_185'6] app_667_186'60 =
                                                        let k [put_chars_52_90'8,n_815_185'6] app_664_186'46 =
                                                          let k [put_chars_52_90'8,n_815_185'6] __817_186'66 =
                                                            let s_818_95'15 = "\" (" in
                                                            let prim_668_0'0 = PRIM_Explode(s_818_95'15) in
                                                            let k [put_chars_52_90'8,n_815_185'6] __819_187'19 =
                                                              let x_820_0'0 = '0' in
                                                              let ord0_821_82'6 = PRIM_CharOrd(x_820_0'0) in
                                                              let loop_832_84'10 = fix (fun [ord0_821_82'6] loop_823_84'10 acc_822_84'15 k ->
                                                                let lam_676_84'19 = fun [ord0_821_82'6,acc_822_84'15,loop_823_84'10] i_824_84'19 k ->
                                                                  let y_825_0'0 = 0 in
                                                                  let uLET_670_0'0 = PRIM_EqInt(i_824_84'19,y_825_0'0) in
                                                                  match uLET_670_0'0 with
                                                                  | true1 -> k acc_822_84'15
                                                                  | false0 ->
                                                                    let y_826_0'0 = 10 in
                                                                    let c_827_83'20 = PRIM_ModInt(i_824_84'19,y_826_0'0) in
                                                                    let x_828_0'0 = PRIM_AddInt(ord0_821_82'6,c_827_83'20) in
                                                                    let x_829_45'9 = PRIM_CharChr(x_828_0'0) in
                                                                    let uLET_673_45'9 = fun [x_829_45'9] xs_830_45'11 k ->
                                                                      let con_674_0'0 = Cons1[x_829_45'9,xs_830_45'11] in
                                                                      k con_674_0'0 in
                                                                    let k [loop_823_84'10,i_824_84'19] app_672_86'40 =
                                                                      let k [i_824_84'19] app_671_86'11 =
                                                                        let y_831_0'0 = 10 in
                                                                        let uLET_675_0'0 = PRIM_DivInt(i_824_84'19,y_831_0'0) in
                                                                        app_671_86'11 uLET_675_0'0 k in
                                                                      loop_823_84'10 app_672_86'40 k in
                                                                    uLET_673_45'9 acc_822_84'15 k in
                                                                k lam_676_84'19) in
                                                              let y_833_0'0 = 0 in
                                                              let uLET_677_0'0 = PRIM_EqInt(n_815_185'6,y_833_0'0) in
                                                              let k [put_chars_52_90'8] uLET_669_82'6 =
                                                                let k [put_chars_52_90'8] __836_188'11 =
                                                                  let s_837_95'15 = " chars)" in
                                                                  let prim_683_0'0 = PRIM_Explode(s_837_95'15) in
                                                                  let k [] __838_189'22 =
                                                                    let __839_99'12 = Unit0 in
                                                                    let c_840_12'13 = '\n' in
                                                                    let backspace_841_13'6 = 8 in
                                                                    let n_842_14'6 = PRIM_CharOrd(c_840_12'13) in
                                                                    let prim_684_0'0 = PRIM_EqInt(n_842_14'6,backspace_841_13'6) in
                                                                    match prim_684_0'0 with
                                                                    | true1 ->
                                                                      let prim_685_0'0 = PRIM_PutChar(c_840_12'13) in
                                                                      k prim_685_0'0
                                                                    | false0 ->
                                                                      let y_843_0'0 = '\n' in
                                                                      let uLET_686_0'0 = PRIM_EqChar(c_840_12'13,y_843_0'0) in
                                                                      match uLET_686_0'0 with
                                                                      | true1 ->
                                                                        let prim_687_0'0 = PRIM_PutChar(c_840_12'13) in
                                                                        k prim_687_0'0
                                                                      | false0 ->
                                                                        let b_844_7'10 = 26 in
                                                                        let uLET_688_7'10 = PRIM_LessInt(b_844_7'10,n_842_14'6) in
                                                                        match uLET_688_7'10 with
                                                                        | true1 ->
                                                                          let prim_689_0'0 = PRIM_PutChar(c_840_12'13) in
                                                                          k prim_689_0'0
                                                                        | false0 ->
                                                                          let x_845_0'0 = '^' in
                                                                          let __846_18'21 = PRIM_PutChar(x_845_0'0) in
                                                                          let x_847_0'0 = 'A' in
                                                                          let x_848_0'0 = PRIM_CharOrd(x_847_0'0) in
                                                                          let uLET_691_0'0 = fun [x_848_0'0] y_849_0'0 k ->
                                                                            let prim_692_0'0 = PRIM_AddInt(x_848_0'0,y_849_0'0) in
                                                                            k prim_692_0'0 in
                                                                          let k [] x_850_0'0 =
                                                                            let uLET_690_0'0 = fun [x_850_0'0] y_851_0'0 k ->
                                                                              let prim_693_0'0 = PRIM_SubInt(x_850_0'0,y_851_0'0) in
                                                                              k prim_693_0'0 in
                                                                            let lit_694_18'52 = 1 in
                                                                            let k [] x_852_0'0 =
                                                                              let x_853_0'0 = PRIM_CharChr(x_852_0'0) in
                                                                              let prim_695_0'0 = PRIM_PutChar(x_853_0'0) in
                                                                              k prim_695_0'0 in
                                                                            uLET_690_0'0 lit_694_18'52 k in
                                                                          uLET_691_0'0 n_842_14'6 k in
                                                                  put_chars_52_90'8 prim_683_0'0 k in
                                                                put_chars_52_90'8 uLET_669_82'6 k in
                                                              match uLET_677_0'0 with
                                                              | true1 ->
                                                                let x_834_45'9 = '0' in
                                                                let uLET_678_45'9 = fun [x_834_45'9] xs_835_45'11 k ->
                                                                  let con_679_0'0 = Cons1[x_834_45'9,xs_835_45'11] in
                                                                  k con_679_0'0 in
                                                                let con_680_88'25 = Nil0 in
                                                                uLET_678_45'9 con_680_88'25 k
                                                              | false0 ->
                                                                let con_682_88'38 = Nil0 in
                                                                let k [n_815_185'6] app_681_88'38 = app_681_88'38 n_815_185'6 k in
                                                                loop_832_84'10 con_682_88'38 k in
                                                            put_chars_52_90'8 prim_668_0'0 k in
                                                          put_chars_52_90'8 app_664_186'46 k in
                                                        app_665_186'20 app_667_186'60 k in
                                                      star_the_ohs_814_184'6 xs_258_215'6 k in
                                                    append_18_58'8 uLET_666_0'0 k in
                                                  length_33_76'8 xs_258_215'6 k in
                                                map_26_71'8 lam_661_184'30 k in
                                            app_472_56'39 b_574_56'19 k in
                                          app_473_56'31 command_293_207'4 k in
                                        eq_list_11_47'8 lam_474_0'0 k in
                                    app_357_56'39 b_435_56'19 k in
                                  app_358_56'31 command_293_207'4 k in
                                eq_list_11_47'8 lam_359_0'0 k in
                            app_242_56'39 b_296_56'19 k in
                          app_243_56'31 command_293_207'4 k in
                        eq_list_11_47'8 lam_244_0'0 k in
                    app_236_201'10 xs_258_215'6 k in
                  app_237_201'7 con_239_201'10 k in
                loop_291_193'10 con_238_201'7 k in
            app_201_56'39 single_controlD_72_166'4 k in
          app_202_56'31 xs_258_215'6 k in
        eq_list_11_47'8 lam_203_0'0 k in
      loop_257_103'10 con_199_119'7 k in
    put_chars_52_90'8 con_53_214'13 k) in
  let __856_219'9 = Unit0 in
  let s_857_95'15 = "This is a shell prototype. Try: fib, fact, rev\n" in
  let prim_697_0'0 = PRIM_Explode(s_857_95'15) in
  let k [mainloop_855_213'8] __858_220'63 =
    let con_698_221'11 = Unit0 in
    mainloop_855_213'8 con_698_221'11 k in
  put_chars_52_90'8 prim_697_0'0 k in
uLET_50_0'0 con_52_166'31 k
