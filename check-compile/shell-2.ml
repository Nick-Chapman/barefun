(*stage2*)
let k () = ()
let u_11 = fix (fun [] eq_list_2_47'8 eq_1_47'16 k ->
  let lam_10_0'0 = fun [eq_1_47'16,eq_list_2_47'8] f_3 k ->
    let lam_9_0'0 = fun [eq_1_47'16,eq_list_2_47'8,f_3] f_4 k ->
      match f_3 with
      | Nil0 ->
        match f_4 with
        | Nil0 ->
          let con_1_49'33 = true1 in
          k con_1_49'33
        | Cons1(__5_49'40,__6_49'43) ->
          let con_2_49'48 = false0 in
          k con_2_49'48
      | Cons1(x_7_50'4,xs_8_50'7) ->
        match f_4 with
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
    k lam_9_0'0 in
  k lam_10_0'0) in
let u_18 = fix (fun [] append_13_58'8 xs_12_58'15 k ->
  let lam_13_0'0 = fun [xs_12_58'15,append_13_58'8] f_14 k ->
    match xs_12_58'15 with
    | Nil0 -> k f_14
    | Cons1(x_15_61'4,xs_16_61'7) ->
      let k [f_14,x_15_61'4] app_11_61'28 =
        let k [x_15_61'4] u_17 =
          let con_12_0'0 = Cons1[x_15_61'4,u_17] in
          k con_12_0'0 in
        app_11_61'28 f_14 k in
      append_13_58'8 xs_16_61'7 k in
  k lam_13_0'0) in
let u_26 = fix (fun [] map_20_71'8 f_19_71'12 k ->
  let lam_19_0'0 = fun [f_19_71'12,map_20_71'8] f_21 k ->
    match f_21 with
    | Nil0 ->
      let con_14_73'10 = Nil0 in
      k con_14_73'10
    | Cons1(x_22_74'4,xs_23_74'7) ->
      let k [f_19_71'12,map_20_71'8,xs_23_74'7] u_24 =
        let uLET_15_0'0 = fun [u_24] f_25 k ->
          let con_16_0'0 = Cons1[u_24,f_25] in
          k con_16_0'0 in
        let k [uLET_15_0'0,xs_23_74'7] app_18_74'24 =
          let k [uLET_15_0'0] app_17_74'26 = uLET_15_0'0 app_17_74'26 k in
          app_18_74'24 xs_23_74'7 k in
        map_20_71'8 f_19_71'12 k in
      f_19_71'12 x_22_74'4 k in
  k lam_19_0'0) in
let u_33 = fix (fun [] length_28_76'8 xs_27_76'15 k ->
  match xs_27_76'15 with
  | Nil0 ->
    let lit_20_78'10 = 0 in
    k lit_20_78'10
  | Cons1(__29_79'4,xs_30_79'7) ->
    let u_31 = 1 in
    let uLET_21_0'0 = fun [u_31] f_32 k ->
      let prim_22_0'0 = PRIM_AddInt(u_31,f_32) in
      k prim_22_0'0 in
    let k [uLET_21_0'0] app_23_79'27 = uLET_21_0'0 app_23_79'27 k in
    length_28_76'8 xs_30_79'7 k) in
let u_52 = fix (fun [] put_chars_35_90'8 xs_34_90'18 k ->
  match xs_34_90'18 with
  | Nil0 ->
    let con_24_92'10 = Unit0 in
    k con_24_92'10
  | Cons1(x_36_93'4,xs_37_93'7) ->
    let u_38 = 8 in
    let u_39 = PRIM_CharOrd(x_36_93'4) in
    let prim_25_0'0 = PRIM_EqInt(u_39,u_38) in
    let k [put_chars_35_90'8,xs_37_93'7] u_51 = put_chars_35_90'8 xs_37_93'7 k in
    match prim_25_0'0 with
    | true1 ->
      let prim_26_0'0 = PRIM_PutChar(x_36_93'4) in
      k prim_26_0'0
    | false0 ->
      let u_40 = '\n' in
      let uLET_27_0'0 = PRIM_EqChar(x_36_93'4,u_40) in
      match uLET_27_0'0 with
      | true1 ->
        let prim_28_0'0 = PRIM_PutChar(x_36_93'4) in
        k prim_28_0'0
      | false0 ->
        let u_41 = 26 in
        let uLET_29_0'0 = PRIM_LessInt(u_41,u_39) in
        match uLET_29_0'0 with
        | true1 ->
          let prim_30_0'0 = PRIM_PutChar(x_36_93'4) in
          k prim_30_0'0
        | false0 ->
          let u_42 = '^' in
          let u_43 = PRIM_PutChar(u_42) in
          let u_44 = 'A' in
          let u_45 = PRIM_CharOrd(u_44) in
          let uLET_32_0'0 = fun [u_45] f_46 k ->
            let prim_33_0'0 = PRIM_AddInt(u_45,f_46) in
            k prim_33_0'0 in
          let k [] u_47 =
            let uLET_31_0'0 = fun [u_47] f_48 k ->
              let prim_34_0'0 = PRIM_SubInt(u_47,f_48) in
              k prim_34_0'0 in
            let lit_35_18'52 = 1 in
            let k [] u_49 =
              let u_50 = PRIM_CharChr(u_49) in
              let prim_36_0'0 = PRIM_PutChar(u_50) in
              k prim_36_0'0 in
            uLET_31_0'0 lit_35_18'52 k in
          uLET_32_0'0 u_39 k) in
let u_60 = fix (fun [] fib_54_121'8 n_53_121'12 k ->
  let u_55 = 2 in
  let uLET_37_0'0 = PRIM_LessInt(n_53_121'12,u_55) in
  match uLET_37_0'0 with
  | true1 -> k n_53_121'12
  | false0 ->
    let u_56 = 1 in
    let uLET_39_0'0 = PRIM_SubInt(n_53_121'12,u_56) in
    let k [n_53_121'12,fib_54_121'8] u_57 =
      let uLET_38_0'0 = fun [u_57] f_58 k ->
        let prim_40_0'0 = PRIM_AddInt(u_57,f_58) in
        k prim_40_0'0 in
      let u_59 = 2 in
      let uLET_42_0'0 = PRIM_SubInt(n_53_121'12,u_59) in
      let k [uLET_38_0'0] app_41_123'39 = uLET_38_0'0 app_41_123'39 k in
      fib_54_121'8 uLET_42_0'0 k in
    fib_54_121'8 uLET_39_0'0 k) in
let u_68 = fix (fun [] fact_62_125'8 n_61_125'13 k ->
  let u_63 = 2 in
  let u_64 = PRIM_LessInt(n_61_125'13,u_63) in
  let k [n_61_125'13,fact_62_125'8] uLET_43_0'0 =
    match uLET_43_0'0 with
    | true1 ->
      let u_65 = 1 in
      let uLET_47_0'0 = PRIM_SubInt(n_61_125'13,u_65) in
      let k [n_61_125'13] u_66 =
        let uLET_46_0'0 = fun [u_66] f_67 k ->
          let prim_48_0'0 = PRIM_MulInt(u_66,f_67) in
          k prim_48_0'0 in
        uLET_46_0'0 n_61_125'13 k in
      fact_62_125'8 uLET_47_0'0 k
    | false0 ->
      let lit_49_127'37 = 1 in
      k lit_49_127'37 in
  match u_64 with
  | true1 ->
    let con_44_4'12 = false0 in
    k con_44_4'12
  | false0 ->
    let con_45_5'13 = true1 in
    k con_45_5'13) in
let u_69 = 4 in
let u_70 = PRIM_CharChr(u_69) in
let uLET_50_0'0 = fun [u_70] f_71 k ->
  let con_51_0'0 = Cons1[u_70,f_71] in
  k con_51_0'0 in
let con_52_166'31 = Nil0 in
let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68] u_72 =
  let u_855 = fix (fun [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72] mainloop_74_213'8 __73_213'17 k ->
    let lit_54_214'13 = '>' in
    let lit_56_214'17 = ' ' in
    let con_57_214'20 = Nil0 in
    let con_55_214'17 = Cons1[lit_56_214'17,con_57_214'20] in
    let con_53_214'13 = Cons1[lit_54_214'13,con_55_214'17] in
    let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,mainloop_74_213'8] u_75 =
      let u_76 = Unit0 in
      let u_77 = 4 in
      let u_78 = PRIM_CharChr(u_77) in
      let u_257 = fix (fun [u_78] loop_80_103'10 acc_79_103'15 k ->
        let u_81 = Unit0 in
        let u_82 = PRIM_GetChar(u_81) in
        let u_83 = PRIM_CharOrd(u_82) in
        let u_84 = '\n' in
        let uLET_58_0'0 = PRIM_EqChar(u_82,u_84) in
        match uLET_58_0'0 with
        | true1 ->
          let u_85 = Unit0 in
          let u_86 = '\n' in
          let u_87 = 8 in
          let u_88 = PRIM_CharOrd(u_86) in
          let prim_59_0'0 = PRIM_EqInt(u_88,u_87) in
          let k [acc_79_103'15] u_100 =
            let u_106 = fix (fun [] loop_102_64'10 acc_101_64'15 k ->
              let lam_73_0'0 = fun [acc_101_64'15,loop_102_64'10] f_103 k ->
                match f_103 with
                | Nil0 -> k acc_101_64'15
                | Cons1(x_104_67'6,xs_105_67'9) ->
                  let con_72_0'0 = Cons1[x_104_67'6,acc_101_64'15] in
                  let k [xs_105_67'9] app_71_67'20 = app_71_67'20 xs_105_67'9 k in
                  loop_102_64'10 con_72_0'0 k in
              k lam_73_0'0) in
            let con_75_69'7 = Nil0 in
            let k [acc_79_103'15] app_74_69'7 = app_74_69'7 acc_79_103'15 k in
            u_106 con_75_69'7 k in
          match prim_59_0'0 with
          | true1 ->
            let prim_60_0'0 = PRIM_PutChar(u_86) in
            k prim_60_0'0
          | false0 ->
            let u_89 = '\n' in
            let uLET_61_0'0 = PRIM_EqChar(u_86,u_89) in
            match uLET_61_0'0 with
            | true1 ->
              let prim_62_0'0 = PRIM_PutChar(u_86) in
              k prim_62_0'0
            | false0 ->
              let u_90 = 26 in
              let uLET_63_0'0 = PRIM_LessInt(u_90,u_88) in
              match uLET_63_0'0 with
              | true1 ->
                let prim_64_0'0 = PRIM_PutChar(u_86) in
                k prim_64_0'0
              | false0 ->
                let u_91 = '^' in
                let u_92 = PRIM_PutChar(u_91) in
                let u_93 = 'A' in
                let u_94 = PRIM_CharOrd(u_93) in
                let uLET_66_0'0 = fun [u_94] f_95 k ->
                  let prim_67_0'0 = PRIM_AddInt(u_94,f_95) in
                  k prim_67_0'0 in
                let k [] u_96 =
                  let uLET_65_0'0 = fun [u_96] f_97 k ->
                    let prim_68_0'0 = PRIM_SubInt(u_96,f_97) in
                    k prim_68_0'0 in
                  let lit_69_18'52 = 1 in
                  let k [] u_98 =
                    let u_99 = PRIM_CharChr(u_98) in
                    let prim_70_0'0 = PRIM_PutChar(u_99) in
                    k prim_70_0'0 in
                  uLET_65_0'0 lit_69_18'52 k in
                uLET_66_0'0 u_88 k
        | false0 ->
          let prim_76_0'0 = PRIM_EqChar(u_82,u_78) in
          match prim_76_0'0 with
          | true1 ->
            let u_107 = 8 in
            let u_108 = PRIM_CharOrd(u_82) in
            let prim_77_0'0 = PRIM_EqInt(u_108,u_107) in
            let k [u_78,acc_79_103'15] u_120 =
              let u_121 = Unit0 in
              let u_122 = '\n' in
              let u_123 = 8 in
              let u_124 = PRIM_CharOrd(u_122) in
              let prim_89_0'0 = PRIM_EqInt(u_124,u_123) in
              let k [u_78,acc_79_103'15] u_136 =
                let u_137 = Cons1[u_78,acc_79_103'15] in
                let u_143 = fix (fun [] loop_139_64'10 acc_138_64'15 k ->
                  let lam_103_0'0 = fun [acc_138_64'15,loop_139_64'10] f_140 k ->
                    match f_140 with
                    | Nil0 -> k acc_138_64'15
                    | Cons1(x_141_67'6,xs_142_67'9) ->
                      let con_102_0'0 = Cons1[x_141_67'6,acc_138_64'15] in
                      let k [xs_142_67'9] app_101_67'20 = app_101_67'20 xs_142_67'9 k in
                      loop_139_64'10 con_102_0'0 k in
                  k lam_103_0'0) in
                let con_105_69'7 = Nil0 in
                let k [u_137] app_104_69'7 = app_104_69'7 u_137 k in
                u_143 con_105_69'7 k in
              match prim_89_0'0 with
              | true1 ->
                let prim_90_0'0 = PRIM_PutChar(u_122) in
                k prim_90_0'0
              | false0 ->
                let u_125 = '\n' in
                let uLET_91_0'0 = PRIM_EqChar(u_122,u_125) in
                match uLET_91_0'0 with
                | true1 ->
                  let prim_92_0'0 = PRIM_PutChar(u_122) in
                  k prim_92_0'0
                | false0 ->
                  let u_126 = 26 in
                  let uLET_93_0'0 = PRIM_LessInt(u_126,u_124) in
                  match uLET_93_0'0 with
                  | true1 ->
                    let prim_94_0'0 = PRIM_PutChar(u_122) in
                    k prim_94_0'0
                  | false0 ->
                    let u_127 = '^' in
                    let u_128 = PRIM_PutChar(u_127) in
                    let u_129 = 'A' in
                    let u_130 = PRIM_CharOrd(u_129) in
                    let uLET_96_0'0 = fun [u_130] f_131 k ->
                      let prim_97_0'0 = PRIM_AddInt(u_130,f_131) in
                      k prim_97_0'0 in
                    let k [] u_132 =
                      let uLET_95_0'0 = fun [u_132] f_133 k ->
                        let prim_98_0'0 = PRIM_SubInt(u_132,f_133) in
                        k prim_98_0'0 in
                      let lit_99_18'52 = 1 in
                      let k [] u_134 =
                        let u_135 = PRIM_CharChr(u_134) in
                        let prim_100_0'0 = PRIM_PutChar(u_135) in
                        k prim_100_0'0 in
                      uLET_95_0'0 lit_99_18'52 k in
                    uLET_96_0'0 u_124 k in
            match prim_77_0'0 with
            | true1 ->
              let prim_78_0'0 = PRIM_PutChar(u_82) in
              k prim_78_0'0
            | false0 ->
              let u_109 = '\n' in
              let uLET_79_0'0 = PRIM_EqChar(u_82,u_109) in
              match uLET_79_0'0 with
              | true1 ->
                let prim_80_0'0 = PRIM_PutChar(u_82) in
                k prim_80_0'0
              | false0 ->
                let u_110 = 26 in
                let uLET_81_0'0 = PRIM_LessInt(u_110,u_108) in
                match uLET_81_0'0 with
                | true1 ->
                  let prim_82_0'0 = PRIM_PutChar(u_82) in
                  k prim_82_0'0
                | false0 ->
                  let u_111 = '^' in
                  let u_112 = PRIM_PutChar(u_111) in
                  let u_113 = 'A' in
                  let u_114 = PRIM_CharOrd(u_113) in
                  let uLET_84_0'0 = fun [u_114] f_115 k ->
                    let prim_85_0'0 = PRIM_AddInt(u_114,f_115) in
                    k prim_85_0'0 in
                  let k [] u_116 =
                    let uLET_83_0'0 = fun [u_116] f_117 k ->
                      let prim_86_0'0 = PRIM_SubInt(u_116,f_117) in
                      k prim_86_0'0 in
                    let lit_87_18'52 = 1 in
                    let k [] u_118 =
                      let u_119 = PRIM_CharChr(u_118) in
                      let prim_88_0'0 = PRIM_PutChar(u_119) in
                      k prim_88_0'0 in
                    uLET_83_0'0 lit_87_18'52 k in
                  uLET_84_0'0 u_108 k
          | false0 ->
            let u_144 = 127 in
            let uLET_106_0'0 = PRIM_LessInt(u_144,u_83) in
            match uLET_106_0'0 with
            | true1 -> loop_80_103'10 acc_79_103'15 k
            | false0 ->
              let u_145 = 127 in
              let uLET_107_0'0 = PRIM_EqInt(u_83,u_145) in
              match uLET_107_0'0 with
              | true1 ->
                match acc_79_103'15 with
                | Nil0 -> loop_80_103'10 acc_79_103'15 k
                | Cons1(c_146_112'14,tail_147_112'17) ->
                  let u_148 = PRIM_CharOrd(c_146_112'14) in
                  let uLET_109_0'0 = fun [u_148] f_149 k ->
                    let u_150 = PRIM_LessInt(f_149,u_148) in
                    match u_150 with
                    | true1 ->
                      let con_110_4'12 = false0 in
                      k con_110_4'12
                    | false0 ->
                      let con_111_5'13 = true1 in
                      k con_111_5'13 in
                  let lit_112_113'28 = 26 in
                  let k [loop_80_103'10,tail_147_112'17] app_108_113'28 =
                    let k [loop_80_103'10,tail_147_112'17] u_196 =
                      let u_197 = Unit0 in
                      let u_198 = 8 in
                      let u_199 = PRIM_CharChr(u_198) in
                      let u_200 = 8 in
                      let u_201 = PRIM_CharOrd(u_199) in
                      let prim_150_0'0 = PRIM_EqInt(u_201,u_200) in
                      let k [loop_80_103'10,tail_147_112'17,u_199] u_213 =
                        let u_214 = ' ' in
                        let u_215 = 8 in
                        let u_216 = PRIM_CharOrd(u_214) in
                        let prim_162_0'0 = PRIM_EqInt(u_216,u_215) in
                        let k [loop_80_103'10,tail_147_112'17,u_199] u_228 =
                          let u_229 = 8 in
                          let u_230 = PRIM_CharOrd(u_199) in
                          let prim_174_0'0 = PRIM_EqInt(u_230,u_229) in
                          let k [loop_80_103'10,tail_147_112'17] u_242 = loop_80_103'10 tail_147_112'17 k in
                          match prim_174_0'0 with
                          | true1 ->
                            let prim_175_0'0 = PRIM_PutChar(u_199) in
                            k prim_175_0'0
                          | false0 ->
                            let u_231 = '\n' in
                            let uLET_176_0'0 = PRIM_EqChar(u_199,u_231) in
                            match uLET_176_0'0 with
                            | true1 ->
                              let prim_177_0'0 = PRIM_PutChar(u_199) in
                              k prim_177_0'0
                            | false0 ->
                              let u_232 = 26 in
                              let uLET_178_0'0 = PRIM_LessInt(u_232,u_230) in
                              match uLET_178_0'0 with
                              | true1 ->
                                let prim_179_0'0 = PRIM_PutChar(u_199) in
                                k prim_179_0'0
                              | false0 ->
                                let u_233 = '^' in
                                let u_234 = PRIM_PutChar(u_233) in
                                let u_235 = 'A' in
                                let u_236 = PRIM_CharOrd(u_235) in
                                let uLET_181_0'0 = fun [u_236] f_237 k ->
                                  let prim_182_0'0 = PRIM_AddInt(u_236,f_237) in
                                  k prim_182_0'0 in
                                let k [] u_238 =
                                  let uLET_180_0'0 = fun [u_238] f_239 k ->
                                    let prim_183_0'0 = PRIM_SubInt(u_238,f_239) in
                                    k prim_183_0'0 in
                                  let lit_184_18'52 = 1 in
                                  let k [] u_240 =
                                    let u_241 = PRIM_CharChr(u_240) in
                                    let prim_185_0'0 = PRIM_PutChar(u_241) in
                                    k prim_185_0'0 in
                                  uLET_180_0'0 lit_184_18'52 k in
                                uLET_181_0'0 u_230 k in
                        match prim_162_0'0 with
                        | true1 ->
                          let prim_163_0'0 = PRIM_PutChar(u_214) in
                          k prim_163_0'0
                        | false0 ->
                          let u_217 = '\n' in
                          let uLET_164_0'0 = PRIM_EqChar(u_214,u_217) in
                          match uLET_164_0'0 with
                          | true1 ->
                            let prim_165_0'0 = PRIM_PutChar(u_214) in
                            k prim_165_0'0
                          | false0 ->
                            let u_218 = 26 in
                            let uLET_166_0'0 = PRIM_LessInt(u_218,u_216) in
                            match uLET_166_0'0 with
                            | true1 ->
                              let prim_167_0'0 = PRIM_PutChar(u_214) in
                              k prim_167_0'0
                            | false0 ->
                              let u_219 = '^' in
                              let u_220 = PRIM_PutChar(u_219) in
                              let u_221 = 'A' in
                              let u_222 = PRIM_CharOrd(u_221) in
                              let uLET_169_0'0 = fun [u_222] f_223 k ->
                                let prim_170_0'0 = PRIM_AddInt(u_222,f_223) in
                                k prim_170_0'0 in
                              let k [] u_224 =
                                let uLET_168_0'0 = fun [u_224] f_225 k ->
                                  let prim_171_0'0 = PRIM_SubInt(u_224,f_225) in
                                  k prim_171_0'0 in
                                let lit_172_18'52 = 1 in
                                let k [] u_226 =
                                  let u_227 = PRIM_CharChr(u_226) in
                                  let prim_173_0'0 = PRIM_PutChar(u_227) in
                                  k prim_173_0'0 in
                                uLET_168_0'0 lit_172_18'52 k in
                              uLET_169_0'0 u_216 k in
                      match prim_150_0'0 with
                      | true1 ->
                        let prim_151_0'0 = PRIM_PutChar(u_199) in
                        k prim_151_0'0
                      | false0 ->
                        let u_202 = '\n' in
                        let uLET_152_0'0 = PRIM_EqChar(u_199,u_202) in
                        match uLET_152_0'0 with
                        | true1 ->
                          let prim_153_0'0 = PRIM_PutChar(u_199) in
                          k prim_153_0'0
                        | false0 ->
                          let u_203 = 26 in
                          let uLET_154_0'0 = PRIM_LessInt(u_203,u_201) in
                          match uLET_154_0'0 with
                          | true1 ->
                            let prim_155_0'0 = PRIM_PutChar(u_199) in
                            k prim_155_0'0
                          | false0 ->
                            let u_204 = '^' in
                            let u_205 = PRIM_PutChar(u_204) in
                            let u_206 = 'A' in
                            let u_207 = PRIM_CharOrd(u_206) in
                            let uLET_157_0'0 = fun [u_207] f_208 k ->
                              let prim_158_0'0 = PRIM_AddInt(u_207,f_208) in
                              k prim_158_0'0 in
                            let k [] u_209 =
                              let uLET_156_0'0 = fun [u_209] f_210 k ->
                                let prim_159_0'0 = PRIM_SubInt(u_209,f_210) in
                                k prim_159_0'0 in
                              let lit_160_18'52 = 1 in
                              let k [] u_211 =
                                let u_212 = PRIM_CharChr(u_211) in
                                let prim_161_0'0 = PRIM_PutChar(u_212) in
                                k prim_161_0'0 in
                              uLET_156_0'0 lit_160_18'52 k in
                            uLET_157_0'0 u_201 k in
                    match app_108_113'28 with
                    | true1 ->
                      let u_151 = Unit0 in
                      let u_152 = 8 in
                      let u_153 = PRIM_CharChr(u_152) in
                      let u_154 = 8 in
                      let u_155 = PRIM_CharOrd(u_153) in
                      let prim_113_0'0 = PRIM_EqInt(u_155,u_154) in
                      let k [u_153] u_167 =
                        let u_168 = ' ' in
                        let u_169 = 8 in
                        let u_170 = PRIM_CharOrd(u_168) in
                        let prim_125_0'0 = PRIM_EqInt(u_170,u_169) in
                        let k [u_153] u_182 =
                          let u_183 = 8 in
                          let u_184 = PRIM_CharOrd(u_153) in
                          let prim_137_0'0 = PRIM_EqInt(u_184,u_183) in
                          match prim_137_0'0 with
                          | true1 ->
                            let prim_138_0'0 = PRIM_PutChar(u_153) in
                            k prim_138_0'0
                          | false0 ->
                            let u_185 = '\n' in
                            let uLET_139_0'0 = PRIM_EqChar(u_153,u_185) in
                            match uLET_139_0'0 with
                            | true1 ->
                              let prim_140_0'0 = PRIM_PutChar(u_153) in
                              k prim_140_0'0
                            | false0 ->
                              let u_186 = 26 in
                              let uLET_141_0'0 = PRIM_LessInt(u_186,u_184) in
                              match uLET_141_0'0 with
                              | true1 ->
                                let prim_142_0'0 = PRIM_PutChar(u_153) in
                                k prim_142_0'0
                              | false0 ->
                                let u_187 = '^' in
                                let u_188 = PRIM_PutChar(u_187) in
                                let u_189 = 'A' in
                                let u_190 = PRIM_CharOrd(u_189) in
                                let uLET_144_0'0 = fun [u_190] f_191 k ->
                                  let prim_145_0'0 = PRIM_AddInt(u_190,f_191) in
                                  k prim_145_0'0 in
                                let k [] u_192 =
                                  let uLET_143_0'0 = fun [u_192] f_193 k ->
                                    let prim_146_0'0 = PRIM_SubInt(u_192,f_193) in
                                    k prim_146_0'0 in
                                  let lit_147_18'52 = 1 in
                                  let k [] u_194 =
                                    let u_195 = PRIM_CharChr(u_194) in
                                    let prim_148_0'0 = PRIM_PutChar(u_195) in
                                    k prim_148_0'0 in
                                  uLET_143_0'0 lit_147_18'52 k in
                                uLET_144_0'0 u_184 k in
                        match prim_125_0'0 with
                        | true1 ->
                          let prim_126_0'0 = PRIM_PutChar(u_168) in
                          k prim_126_0'0
                        | false0 ->
                          let u_171 = '\n' in
                          let uLET_127_0'0 = PRIM_EqChar(u_168,u_171) in
                          match uLET_127_0'0 with
                          | true1 ->
                            let prim_128_0'0 = PRIM_PutChar(u_168) in
                            k prim_128_0'0
                          | false0 ->
                            let u_172 = 26 in
                            let uLET_129_0'0 = PRIM_LessInt(u_172,u_170) in
                            match uLET_129_0'0 with
                            | true1 ->
                              let prim_130_0'0 = PRIM_PutChar(u_168) in
                              k prim_130_0'0
                            | false0 ->
                              let u_173 = '^' in
                              let u_174 = PRIM_PutChar(u_173) in
                              let u_175 = 'A' in
                              let u_176 = PRIM_CharOrd(u_175) in
                              let uLET_132_0'0 = fun [u_176] f_177 k ->
                                let prim_133_0'0 = PRIM_AddInt(u_176,f_177) in
                                k prim_133_0'0 in
                              let k [] u_178 =
                                let uLET_131_0'0 = fun [u_178] f_179 k ->
                                  let prim_134_0'0 = PRIM_SubInt(u_178,f_179) in
                                  k prim_134_0'0 in
                                let lit_135_18'52 = 1 in
                                let k [] u_180 =
                                  let u_181 = PRIM_CharChr(u_180) in
                                  let prim_136_0'0 = PRIM_PutChar(u_181) in
                                  k prim_136_0'0 in
                                uLET_131_0'0 lit_135_18'52 k in
                              uLET_132_0'0 u_170 k in
                      match prim_113_0'0 with
                      | true1 ->
                        let prim_114_0'0 = PRIM_PutChar(u_153) in
                        k prim_114_0'0
                      | false0 ->
                        let u_156 = '\n' in
                        let uLET_115_0'0 = PRIM_EqChar(u_153,u_156) in
                        match uLET_115_0'0 with
                        | true1 ->
                          let prim_116_0'0 = PRIM_PutChar(u_153) in
                          k prim_116_0'0
                        | false0 ->
                          let u_157 = 26 in
                          let uLET_117_0'0 = PRIM_LessInt(u_157,u_155) in
                          match uLET_117_0'0 with
                          | true1 ->
                            let prim_118_0'0 = PRIM_PutChar(u_153) in
                            k prim_118_0'0
                          | false0 ->
                            let u_158 = '^' in
                            let u_159 = PRIM_PutChar(u_158) in
                            let u_160 = 'A' in
                            let u_161 = PRIM_CharOrd(u_160) in
                            let uLET_120_0'0 = fun [u_161] f_162 k ->
                              let prim_121_0'0 = PRIM_AddInt(u_161,f_162) in
                              k prim_121_0'0 in
                            let k [] u_163 =
                              let uLET_119_0'0 = fun [u_163] f_164 k ->
                                let prim_122_0'0 = PRIM_SubInt(u_163,f_164) in
                                k prim_122_0'0 in
                              let lit_123_18'52 = 1 in
                              let k [] u_165 =
                                let u_166 = PRIM_CharChr(u_165) in
                                let prim_124_0'0 = PRIM_PutChar(u_166) in
                                k prim_124_0'0 in
                              uLET_119_0'0 lit_123_18'52 k in
                            uLET_120_0'0 u_155 k
                    | false0 ->
                      let con_149_113'55 = Unit0 in
                      k con_149_113'55 in
                  uLET_109_0'0 lit_112_113'28 k
              | false0 ->
                let u_243 = 8 in
                let u_244 = PRIM_CharOrd(u_82) in
                let prim_186_0'0 = PRIM_EqInt(u_244,u_243) in
                let k [acc_79_103'15,loop_80_103'10,u_82] u_256 =
                  let con_198_0'0 = Cons1[u_82,acc_79_103'15] in
                  loop_80_103'10 con_198_0'0 k in
                match prim_186_0'0 with
                | true1 ->
                  let prim_187_0'0 = PRIM_PutChar(u_82) in
                  k prim_187_0'0
                | false0 ->
                  let u_245 = '\n' in
                  let uLET_188_0'0 = PRIM_EqChar(u_82,u_245) in
                  match uLET_188_0'0 with
                  | true1 ->
                    let prim_189_0'0 = PRIM_PutChar(u_82) in
                    k prim_189_0'0
                  | false0 ->
                    let u_246 = 26 in
                    let uLET_190_0'0 = PRIM_LessInt(u_246,u_244) in
                    match uLET_190_0'0 with
                    | true1 ->
                      let prim_191_0'0 = PRIM_PutChar(u_82) in
                      k prim_191_0'0
                    | false0 ->
                      let u_247 = '^' in
                      let u_248 = PRIM_PutChar(u_247) in
                      let u_249 = 'A' in
                      let u_250 = PRIM_CharOrd(u_249) in
                      let uLET_193_0'0 = fun [u_250] f_251 k ->
                        let prim_194_0'0 = PRIM_AddInt(u_250,f_251) in
                        k prim_194_0'0 in
                      let k [] u_252 =
                        let uLET_192_0'0 = fun [u_252] f_253 k ->
                          let prim_195_0'0 = PRIM_SubInt(u_252,f_253) in
                          k prim_195_0'0 in
                        let lit_196_18'52 = 1 in
                        let k [] u_254 =
                          let u_255 = PRIM_CharChr(u_254) in
                          let prim_197_0'0 = PRIM_PutChar(u_255) in
                          k prim_197_0'0 in
                        uLET_192_0'0 lit_196_18'52 k in
                      uLET_193_0'0 u_244 k) in
      let con_199_119'7 = Nil0 in
      let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,mainloop_74_213'8] u_258 =
        let lam_203_0'0 = fun [] f_259 k ->
          let lam_205_0'0 = fun [f_259] f_260 k ->
            let prim_204_0'0 = PRIM_EqChar(f_259,f_260) in
            k prim_204_0'0 in
          k lam_205_0'0 in
        let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,mainloop_74_213'8,u_258] app_202_56'31 =
          let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,mainloop_74_213'8,u_258] app_201_56'39 =
            let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,mainloop_74_213'8,u_258] app_200_56'41 =
              match app_200_56'41 with
              | true1 ->
                let con_206_216'42 = Unit0 in
                k con_206_216'42
              | false0 ->
                let u_291 = fix (fun [] loop_262_193'10 accWs_261_193'15 k ->
                  let lam_235_0'0 = fun [accWs_261_193'15,loop_262_193'10] f_263 k ->
                    let lam_234_0'0 = fun [accWs_261_193'15,loop_262_193'10,f_263] f_264 k ->
                      match f_264 with
                      | Nil0 ->
                        let u_270 = fix (fun [] loop_266_64'10 acc_265_64'15 k ->
                          let lam_210_0'0 = fun [acc_265_64'15,loop_266_64'10] f_267 k ->
                            match f_267 with
                            | Nil0 -> k acc_265_64'15
                            | Cons1(x_268_67'6,xs_269_67'9) ->
                              let con_209_0'0 = Cons1[x_268_67'6,acc_265_64'15] in
                              let k [xs_269_67'9] app_208_67'20 = app_208_67'20 xs_269_67'9 k in
                              loop_266_64'10 con_209_0'0 k in
                          k lam_210_0'0) in
                        let con_212_69'7 = Nil0 in
                        let k [accWs_261_193'15,f_263] app_211_69'7 =
                          let k [accWs_261_193'15] u_271 =
                            let uLET_207_0'0 = fun [u_271] f_272 k ->
                              let con_213_0'0 = Cons1[u_271,f_272] in
                              k con_213_0'0 in
                            let k [] u_273 =
                              let u_279 = fix (fun [] loop_275_64'10 acc_274_64'15 k ->
                                let lam_216_0'0 = fun [acc_274_64'15,loop_275_64'10] f_276 k ->
                                  match f_276 with
                                  | Nil0 -> k acc_274_64'15
                                  | Cons1(x_277_67'6,xs_278_67'9) ->
                                    let con_215_0'0 = Cons1[x_277_67'6,acc_274_64'15] in
                                    let k [xs_278_67'9] app_214_67'20 = app_214_67'20 xs_278_67'9 k in
                                    loop_275_64'10 con_215_0'0 k in
                                k lam_216_0'0) in
                              let con_218_69'7 = Nil0 in
                              let k [u_273] app_217_69'7 = app_217_69'7 u_273 k in
                              u_279 con_218_69'7 k in
                            uLET_207_0'0 accWs_261_193'15 k in
                          app_211_69'7 f_263 k in
                        u_270 con_212_69'7 k
                      | Cons1(x_280_197'6,xs_281_197'9) ->
                        let u_282 = ' ' in
                        let uLET_219_0'0 = PRIM_EqChar(x_280_197'6,u_282) in
                        match uLET_219_0'0 with
                        | true1 ->
                          let u_288 = fix (fun [] loop_284_64'10 acc_283_64'15 k ->
                            let lam_226_0'0 = fun [acc_283_64'15,loop_284_64'10] f_285 k ->
                              match f_285 with
                              | Nil0 -> k acc_283_64'15
                              | Cons1(x_286_67'6,xs_287_67'9) ->
                                let con_225_0'0 = Cons1[x_286_67'6,acc_283_64'15] in
                                let k [xs_287_67'9] app_224_67'20 = app_224_67'20 xs_287_67'9 k in
                                loop_284_64'10 con_225_0'0 k in
                            k lam_226_0'0) in
                          let con_228_69'7 = Nil0 in
                          let k [accWs_261_193'15,loop_262_193'10,f_263,xs_281_197'9] app_227_69'7 =
                            let k [accWs_261_193'15,loop_262_193'10,xs_281_197'9] u_289 =
                              let uLET_223_0'0 = fun [u_289] f_290 k ->
                                let con_229_0'0 = Cons1[u_289,f_290] in
                                k con_229_0'0 in
                              let k [loop_262_193'10,xs_281_197'9] app_222_198'52 =
                                let k [xs_281_197'9] app_221_198'34 =
                                  let con_230_198'59 = Nil0 in
                                  let k [xs_281_197'9] app_220_198'59 = app_220_198'59 xs_281_197'9 k in
                                  app_221_198'34 con_230_198'59 k in
                                loop_262_193'10 app_222_198'52 k in
                              uLET_223_0'0 accWs_261_193'15 k in
                            app_227_69'7 f_263 k in
                          u_288 con_228_69'7 k
                        | false0 ->
                          let k [f_263,x_280_197'6,xs_281_197'9] app_232_199'17 =
                            let con_233_0'0 = Cons1[x_280_197'6,f_263] in
                            let k [xs_281_197'9] app_231_199'23 = app_231_199'23 xs_281_197'9 k in
                            app_232_199'17 con_233_0'0 k in
                          loop_262_193'10 accWs_261_193'15 k in
                    k lam_234_0'0 in
                  k lam_235_0'0) in
                let con_238_201'7 = Nil0 in
                let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,mainloop_74_213'8,u_258] app_237_201'7 =
                  let con_239_201'10 = Nil0 in
                  let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,mainloop_74_213'8,u_258] app_236_201'10 =
                    let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,mainloop_74_213'8,u_258] u_292 =
                      let k [mainloop_74_213'8] u_854 =
                        let con_696_217'26 = Unit0 in
                        mainloop_74_213'8 con_696_217'26 k in
                      match u_292 with
                      | Nil0 ->
                        let con_240_206'10 = Unit0 in
                        k con_240_206'10
                      | Cons1(command_293_207'4,args_294_207'13) ->
                        let u_295 = "fib" in
                        let u_296 = PRIM_Explode(u_295) in
                        let lam_244_0'0 = fun [] f_297 k ->
                          let lam_246_0'0 = fun [f_297] f_298 k ->
                            let prim_245_0'0 = PRIM_EqChar(f_297,f_298) in
                            k prim_245_0'0 in
                          k lam_246_0'0 in
                        let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,u_258,command_293_207'4,args_294_207'13,u_296] app_243_56'31 =
                          let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,u_258,command_293_207'4,args_294_207'13,u_296] app_242_56'39 =
                            let k [u_11,u_18,u_26,u_33,u_52,u_60,u_68,u_72,u_258,command_293_207'4,args_294_207'13] uLET_241_0'0 =
                              match uLET_241_0'0 with
                              | true1 ->
                                let u_299 = "fib: " in
                                let prim_247_0'0 = PRIM_Explode(u_299) in
                                let k [u_52,u_60,args_294_207'13] u_300 =
                                  match args_294_207'13 with
                                  | Nil0 ->
                                    let u_301 = "expected an argument" in
                                    let u_302 = "ERROR: " in
                                    let prim_248_0'0 = PRIM_Explode(u_302) in
                                    let k [u_52,u_301] u_303 =
                                      let prim_249_0'0 = PRIM_Explode(u_301) in
                                      let k [] u_304 =
                                        let u_305 = Unit0 in
                                        let u_306 = '\n' in
                                        let u_307 = 8 in
                                        let u_308 = PRIM_CharOrd(u_306) in
                                        let prim_250_0'0 = PRIM_EqInt(u_308,u_307) in
                                        match prim_250_0'0 with
                                        | true1 ->
                                          let prim_251_0'0 = PRIM_PutChar(u_306) in
                                          k prim_251_0'0
                                        | false0 ->
                                          let u_309 = '\n' in
                                          let uLET_252_0'0 = PRIM_EqChar(u_306,u_309) in
                                          match uLET_252_0'0 with
                                          | true1 ->
                                            let prim_253_0'0 = PRIM_PutChar(u_306) in
                                            k prim_253_0'0
                                          | false0 ->
                                            let u_310 = 26 in
                                            let uLET_254_0'0 = PRIM_LessInt(u_310,u_308) in
                                            match uLET_254_0'0 with
                                            | true1 ->
                                              let prim_255_0'0 = PRIM_PutChar(u_306) in
                                              k prim_255_0'0
                                            | false0 ->
                                              let u_311 = '^' in
                                              let u_312 = PRIM_PutChar(u_311) in
                                              let u_313 = 'A' in
                                              let u_314 = PRIM_CharOrd(u_313) in
                                              let uLET_257_0'0 = fun [u_314] f_315 k ->
                                                let prim_258_0'0 = PRIM_AddInt(u_314,f_315) in
                                                k prim_258_0'0 in
                                              let k [] u_316 =
                                                let uLET_256_0'0 = fun [u_316] f_317 k ->
                                                  let prim_259_0'0 = PRIM_SubInt(u_316,f_317) in
                                                  k prim_259_0'0 in
                                                let lit_260_18'52 = 1 in
                                                let k [] u_318 =
                                                  let u_319 = PRIM_CharChr(u_318) in
                                                  let prim_261_0'0 = PRIM_PutChar(u_319) in
                                                  k prim_261_0'0 in
                                                uLET_256_0'0 lit_260_18'52 k in
                                              uLET_257_0'0 u_308 k in
                                      u_52 prim_249_0'0 k in
                                    u_52 prim_248_0'0 k
                                  | Cons1(arg1_320_135'4,more_321_135'10) ->
                                    match more_321_135'10 with
                                    | Cons1(__322_137'7,__323_137'10) ->
                                      let u_324 = "expected exactly one argument" in
                                      let u_325 = "ERROR: " in
                                      let prim_262_0'0 = PRIM_Explode(u_325) in
                                      let k [u_52,u_324] u_326 =
                                        let prim_263_0'0 = PRIM_Explode(u_324) in
                                        let k [] u_327 =
                                          let u_328 = Unit0 in
                                          let u_329 = '\n' in
                                          let u_330 = 8 in
                                          let u_331 = PRIM_CharOrd(u_329) in
                                          let prim_264_0'0 = PRIM_EqInt(u_331,u_330) in
                                          match prim_264_0'0 with
                                          | true1 ->
                                            let prim_265_0'0 = PRIM_PutChar(u_329) in
                                            k prim_265_0'0
                                          | false0 ->
                                            let u_332 = '\n' in
                                            let uLET_266_0'0 = PRIM_EqChar(u_329,u_332) in
                                            match uLET_266_0'0 with
                                            | true1 ->
                                              let prim_267_0'0 = PRIM_PutChar(u_329) in
                                              k prim_267_0'0
                                            | false0 ->
                                              let u_333 = 26 in
                                              let uLET_268_0'0 = PRIM_LessInt(u_333,u_331) in
                                              match uLET_268_0'0 with
                                              | true1 ->
                                                let prim_269_0'0 = PRIM_PutChar(u_329) in
                                                k prim_269_0'0
                                              | false0 ->
                                                let u_334 = '^' in
                                                let u_335 = PRIM_PutChar(u_334) in
                                                let u_336 = 'A' in
                                                let u_337 = PRIM_CharOrd(u_336) in
                                                let uLET_271_0'0 = fun [u_337] f_338 k ->
                                                  let prim_272_0'0 = PRIM_AddInt(u_337,f_338) in
                                                  k prim_272_0'0 in
                                                let k [] u_339 =
                                                  let uLET_270_0'0 = fun [u_339] f_340 k ->
                                                    let prim_273_0'0 = PRIM_SubInt(u_339,f_340) in
                                                    k prim_273_0'0 in
                                                  let lit_274_18'52 = 1 in
                                                  let k [] u_341 =
                                                    let u_342 = PRIM_CharChr(u_341) in
                                                    let prim_275_0'0 = PRIM_PutChar(u_342) in
                                                    k prim_275_0'0 in
                                                  uLET_270_0'0 lit_274_18'52 k in
                                                uLET_271_0'0 u_331 k in
                                        u_52 prim_263_0'0 k in
                                      u_52 prim_262_0'0 k
                                    | Nil0 ->
                                      let u_361 = fix (fun [] loop_344_35'10 acc_343_35'15 k ->
                                        let lam_298_0'0 = fun [acc_343_35'15,loop_344_35'10] f_345 k ->
                                          match f_345 with
                                          | Nil0 ->
                                            let con_277_37'12 = Some0[acc_343_35'15] in
                                            k con_277_37'12
                                          | Cons1(x_346_38'6,xs_347_38'9) ->
                                            let u_348 = PRIM_CharOrd(x_346_38'6) in
                                            let uLET_279_0'0 = fun [u_348] f_349 k ->
                                              let prim_280_0'0 = PRIM_SubInt(u_348,f_349) in
                                              k prim_280_0'0 in
                                            let u_350 = '0' in
                                            let uLET_281_0'0 = PRIM_CharOrd(u_350) in
                                            let k [acc_343_35'15,loop_344_35'10,xs_347_38'9] u_351 =
                                              let u_352 = 0 in
                                              let u_353 = PRIM_LessInt(u_351,u_352) in
                                              let k [acc_343_35'15,loop_344_35'10,xs_347_38'9,u_351] uLET_282_0'0 =
                                                let k [acc_343_35'15,loop_344_35'10,xs_347_38'9] uLET_278_0'0 =
                                                  match uLET_278_0'0 with
                                                  | None1 ->
                                                    let con_291_40'18 = None1 in
                                                    k con_291_40'18
                                                  | Some0(d_356_41'15) ->
                                                    let u_357 = 10 in
                                                    let uLET_295_0'0 = fun [u_357] f_358 k ->
                                                      let prim_296_0'0 = PRIM_MulInt(u_357,f_358) in
                                                      k prim_296_0'0 in
                                                    let k [loop_344_35'10,xs_347_38'9,d_356_41'15] u_359 =
                                                      let uLET_294_0'0 = fun [u_359] f_360 k ->
                                                        let prim_297_0'0 = PRIM_AddInt(u_359,f_360) in
                                                        k prim_297_0'0 in
                                                      let k [loop_344_35'10,xs_347_38'9] app_293_41'37 =
                                                        let k [xs_347_38'9] app_292_41'25 = app_292_41'25 xs_347_38'9 k in
                                                        loop_344_35'10 app_293_41'37 k in
                                                      uLET_294_0'0 d_356_41'15 k in
                                                    uLET_295_0'0 acc_343_35'15 k in
                                                match uLET_282_0'0 with
                                                | true1 ->
                                                  let u_354 = 9 in
                                                  let u_355 = PRIM_LessInt(u_354,u_351) in
                                                  let k [u_351] uLET_285_0'0 =
                                                    match uLET_285_0'0 with
                                                    | true1 ->
                                                      let con_288_32'32 = Some0[u_351] in
                                                      k con_288_32'32
                                                    | false0 ->
                                                      let con_289_32'45 = None1 in
                                                      k con_289_32'45 in
                                                  match u_355 with
                                                  | true1 ->
                                                    let con_286_4'12 = false0 in
                                                    k con_286_4'12
                                                  | false0 ->
                                                    let con_287_5'13 = true1 in
                                                    k con_287_5'13
                                                | false0 ->
                                                  let con_290_32'55 = None1 in
                                                  k con_290_32'55 in
                                              match u_353 with
                                              | true1 ->
                                                let con_283_4'12 = false0 in
                                                k con_283_4'12
                                              | false0 ->
                                                let con_284_5'13 = true1 in
                                                k con_284_5'13 in
                                            uLET_279_0'0 uLET_281_0'0 k in
                                        k lam_298_0'0) in
                                      let lit_300_43'7 = 0 in
                                      let k [u_52,u_60,arg1_320_135'4] app_299_43'7 =
                                        let k [u_52,u_60] uLET_276_0'0 =
                                          match uLET_276_0'0 with
                                          | None1 ->
                                            let u_362 = "expected arg1 to be numeric" in
                                            let u_363 = "ERROR: " in
                                            let prim_301_0'0 = PRIM_Explode(u_363) in
                                            let k [u_52,u_362] u_364 =
                                              let prim_302_0'0 = PRIM_Explode(u_362) in
                                              let k [] u_365 =
                                                let u_366 = Unit0 in
                                                let u_367 = '\n' in
                                                let u_368 = 8 in
                                                let u_369 = PRIM_CharOrd(u_367) in
                                                let prim_303_0'0 = PRIM_EqInt(u_369,u_368) in
                                                match prim_303_0'0 with
                                                | true1 ->
                                                  let prim_304_0'0 = PRIM_PutChar(u_367) in
                                                  k prim_304_0'0
                                                | false0 ->
                                                  let u_370 = '\n' in
                                                  let uLET_305_0'0 = PRIM_EqChar(u_367,u_370) in
                                                  match uLET_305_0'0 with
                                                  | true1 ->
                                                    let prim_306_0'0 = PRIM_PutChar(u_367) in
                                                    k prim_306_0'0
                                                  | false0 ->
                                                    let u_371 = 26 in
                                                    let uLET_307_0'0 = PRIM_LessInt(u_371,u_369) in
                                                    match uLET_307_0'0 with
                                                    | true1 ->
                                                      let prim_308_0'0 = PRIM_PutChar(u_367) in
                                                      k prim_308_0'0
                                                    | false0 ->
                                                      let u_372 = '^' in
                                                      let u_373 = PRIM_PutChar(u_372) in
                                                      let u_374 = 'A' in
                                                      let u_375 = PRIM_CharOrd(u_374) in
                                                      let uLET_310_0'0 = fun [u_375] f_376 k ->
                                                        let prim_311_0'0 = PRIM_AddInt(u_375,f_376) in
                                                        k prim_311_0'0 in
                                                      let k [] u_377 =
                                                        let uLET_309_0'0 = fun [u_377] f_378 k ->
                                                          let prim_312_0'0 = PRIM_SubInt(u_377,f_378) in
                                                          k prim_312_0'0 in
                                                        let lit_313_18'52 = 1 in
                                                        let k [] u_379 =
                                                          let u_380 = PRIM_CharChr(u_379) in
                                                          let prim_314_0'0 = PRIM_PutChar(u_380) in
                                                          k prim_314_0'0 in
                                                        uLET_309_0'0 lit_313_18'52 k in
                                                      uLET_310_0'0 u_369 k in
                                              u_52 prim_302_0'0 k in
                                            u_52 prim_301_0'0 k
                                          | Some0(n_381_141'15) ->
                                            let k [u_52,n_381_141'15] u_382 =
                                              let u_383 = '0' in
                                              let u_384 = PRIM_CharOrd(u_383) in
                                              let u_395 = fix (fun [u_384] loop_386_84'10 acc_385_84'15 k ->
                                                let lam_322_0'0 = fun [u_384,acc_385_84'15,loop_386_84'10] f_387 k ->
                                                  let u_388 = 0 in
                                                  let uLET_316_0'0 = PRIM_EqInt(f_387,u_388) in
                                                  match uLET_316_0'0 with
                                                  | true1 -> k acc_385_84'15
                                                  | false0 ->
                                                    let u_389 = 10 in
                                                    let u_390 = PRIM_ModInt(f_387,u_389) in
                                                    let u_391 = PRIM_AddInt(u_384,u_390) in
                                                    let u_392 = PRIM_CharChr(u_391) in
                                                    let uLET_319_0'0 = fun [u_392] f_393 k ->
                                                      let con_320_0'0 = Cons1[u_392,f_393] in
                                                      k con_320_0'0 in
                                                    let k [loop_386_84'10,f_387] app_318_86'40 =
                                                      let k [f_387] app_317_86'11 =
                                                        let u_394 = 10 in
                                                        let uLET_321_0'0 = PRIM_DivInt(f_387,u_394) in
                                                        app_317_86'11 uLET_321_0'0 k in
                                                      loop_386_84'10 app_318_86'40 k in
                                                    uLET_319_0'0 acc_385_84'15 k in
                                                k lam_322_0'0) in
                                              let u_396 = 0 in
                                              let uLET_323_0'0 = PRIM_EqInt(n_381_141'15,u_396) in
                                              let k [u_52,u_382] uLET_315_0'0 =
                                                let k [u_52,u_382] u_399 =
                                                  let u_400 = " --> " in
                                                  let prim_329_0'0 = PRIM_Explode(u_400) in
                                                  let k [u_52,u_382] u_401 =
                                                    let u_402 = '0' in
                                                    let u_403 = PRIM_CharOrd(u_402) in
                                                    let u_414 = fix (fun [u_403] loop_405_84'10 acc_404_84'15 k ->
                                                      let lam_337_0'0 = fun [u_403,acc_404_84'15,loop_405_84'10] f_406 k ->
                                                        let u_407 = 0 in
                                                        let uLET_331_0'0 = PRIM_EqInt(f_406,u_407) in
                                                        match uLET_331_0'0 with
                                                        | true1 -> k acc_404_84'15
                                                        | false0 ->
                                                          let u_408 = 10 in
                                                          let u_409 = PRIM_ModInt(f_406,u_408) in
                                                          let u_410 = PRIM_AddInt(u_403,u_409) in
                                                          let u_411 = PRIM_CharChr(u_410) in
                                                          let uLET_334_0'0 = fun [u_411] f_412 k ->
                                                            let con_335_0'0 = Cons1[u_411,f_412] in
                                                            k con_335_0'0 in
                                                          let k [loop_405_84'10,f_406] app_333_86'40 =
                                                            let k [f_406] app_332_86'11 =
                                                              let u_413 = 10 in
                                                              let uLET_336_0'0 = PRIM_DivInt(f_406,u_413) in
                                                              app_332_86'11 uLET_336_0'0 k in
                                                            loop_405_84'10 app_333_86'40 k in
                                                          uLET_334_0'0 acc_404_84'15 k in
                                                      k lam_337_0'0) in
                                                    let u_415 = 0 in
                                                    let uLET_338_0'0 = PRIM_EqInt(u_382,u_415) in
                                                    let k [u_52] uLET_330_0'0 =
                                                      let k [] u_418 =
                                                        let u_419 = Unit0 in
                                                        let u_420 = '\n' in
                                                        let u_421 = 8 in
                                                        let u_422 = PRIM_CharOrd(u_420) in
                                                        let prim_344_0'0 = PRIM_EqInt(u_422,u_421) in
                                                        match prim_344_0'0 with
                                                        | true1 ->
                                                          let prim_345_0'0 = PRIM_PutChar(u_420) in
                                                          k prim_345_0'0
                                                        | false0 ->
                                                          let u_423 = '\n' in
                                                          let uLET_346_0'0 = PRIM_EqChar(u_420,u_423) in
                                                          match uLET_346_0'0 with
                                                          | true1 ->
                                                            let prim_347_0'0 = PRIM_PutChar(u_420) in
                                                            k prim_347_0'0
                                                          | false0 ->
                                                            let u_424 = 26 in
                                                            let uLET_348_0'0 = PRIM_LessInt(u_424,u_422) in
                                                            match uLET_348_0'0 with
                                                            | true1 ->
                                                              let prim_349_0'0 = PRIM_PutChar(u_420) in
                                                              k prim_349_0'0
                                                            | false0 ->
                                                              let u_425 = '^' in
                                                              let u_426 = PRIM_PutChar(u_425) in
                                                              let u_427 = 'A' in
                                                              let u_428 = PRIM_CharOrd(u_427) in
                                                              let uLET_351_0'0 = fun [u_428] f_429 k ->
                                                                let prim_352_0'0 = PRIM_AddInt(u_428,f_429) in
                                                                k prim_352_0'0 in
                                                              let k [] u_430 =
                                                                let uLET_350_0'0 = fun [u_430] f_431 k ->
                                                                  let prim_353_0'0 = PRIM_SubInt(u_430,f_431) in
                                                                  k prim_353_0'0 in
                                                                let lit_354_18'52 = 1 in
                                                                let k [] u_432 =
                                                                  let u_433 = PRIM_CharChr(u_432) in
                                                                  let prim_355_0'0 = PRIM_PutChar(u_433) in
                                                                  k prim_355_0'0 in
                                                                uLET_350_0'0 lit_354_18'52 k in
                                                              uLET_351_0'0 u_422 k in
                                                      u_52 uLET_330_0'0 k in
                                                    match uLET_338_0'0 with
                                                    | true1 ->
                                                      let u_416 = '0' in
                                                      let uLET_339_0'0 = fun [u_416] f_417 k ->
                                                        let con_340_0'0 = Cons1[u_416,f_417] in
                                                        k con_340_0'0 in
                                                      let con_341_88'25 = Nil0 in
                                                      uLET_339_0'0 con_341_88'25 k
                                                    | false0 ->
                                                      let con_343_88'38 = Nil0 in
                                                      let k [u_382] app_342_88'38 = app_342_88'38 u_382 k in
                                                      u_414 con_343_88'38 k in
                                                  u_52 prim_329_0'0 k in
                                                u_52 uLET_315_0'0 k in
                                              match uLET_323_0'0 with
                                              | true1 ->
                                                let u_397 = '0' in
                                                let uLET_324_0'0 = fun [u_397] f_398 k ->
                                                  let con_325_0'0 = Cons1[u_397,f_398] in
                                                  k con_325_0'0 in
                                                let con_326_88'25 = Nil0 in
                                                uLET_324_0'0 con_326_88'25 k
                                              | false0 ->
                                                let con_328_88'38 = Nil0 in
                                                let k [n_381_141'15] app_327_88'38 = app_327_88'38 n_381_141'15 k in
                                                u_395 con_328_88'38 k in
                                            u_60 n_381_141'15 k in
                                        app_299_43'7 arg1_320_135'4 k in
                                      u_361 lit_300_43'7 k in
                                u_52 prim_247_0'0 k
                              | false0 ->
                                let u_434 = "fact" in
                                let u_435 = PRIM_Explode(u_434) in
                                let lam_359_0'0 = fun [] f_436 k ->
                                  let lam_361_0'0 = fun [f_436] f_437 k ->
                                    let prim_360_0'0 = PRIM_EqChar(f_436,f_437) in
                                    k prim_360_0'0 in
                                  k lam_361_0'0 in
                                let k [u_11,u_18,u_26,u_33,u_52,u_68,u_72,u_258,command_293_207'4,args_294_207'13,u_435] app_358_56'31 =
                                  let k [u_11,u_18,u_26,u_33,u_52,u_68,u_72,u_258,command_293_207'4,args_294_207'13,u_435] app_357_56'39 =
                                    let k [u_11,u_18,u_26,u_33,u_52,u_68,u_72,u_258,command_293_207'4,args_294_207'13] uLET_356_0'0 =
                                      match uLET_356_0'0 with
                                      | true1 ->
                                        let u_438 = "fact: " in
                                        let prim_362_0'0 = PRIM_Explode(u_438) in
                                        let k [u_52,u_68,args_294_207'13] u_439 =
                                          match args_294_207'13 with
                                          | Nil0 ->
                                            let u_440 = "expected an argument" in
                                            let u_441 = "ERROR: " in
                                            let prim_363_0'0 = PRIM_Explode(u_441) in
                                            let k [u_52,u_440] u_442 =
                                              let prim_364_0'0 = PRIM_Explode(u_440) in
                                              let k [] u_443 =
                                                let u_444 = Unit0 in
                                                let u_445 = '\n' in
                                                let u_446 = 8 in
                                                let u_447 = PRIM_CharOrd(u_445) in
                                                let prim_365_0'0 = PRIM_EqInt(u_447,u_446) in
                                                match prim_365_0'0 with
                                                | true1 ->
                                                  let prim_366_0'0 = PRIM_PutChar(u_445) in
                                                  k prim_366_0'0
                                                | false0 ->
                                                  let u_448 = '\n' in
                                                  let uLET_367_0'0 = PRIM_EqChar(u_445,u_448) in
                                                  match uLET_367_0'0 with
                                                  | true1 ->
                                                    let prim_368_0'0 = PRIM_PutChar(u_445) in
                                                    k prim_368_0'0
                                                  | false0 ->
                                                    let u_449 = 26 in
                                                    let uLET_369_0'0 = PRIM_LessInt(u_449,u_447) in
                                                    match uLET_369_0'0 with
                                                    | true1 ->
                                                      let prim_370_0'0 = PRIM_PutChar(u_445) in
                                                      k prim_370_0'0
                                                    | false0 ->
                                                      let u_450 = '^' in
                                                      let u_451 = PRIM_PutChar(u_450) in
                                                      let u_452 = 'A' in
                                                      let u_453 = PRIM_CharOrd(u_452) in
                                                      let uLET_372_0'0 = fun [u_453] f_454 k ->
                                                        let prim_373_0'0 = PRIM_AddInt(u_453,f_454) in
                                                        k prim_373_0'0 in
                                                      let k [] u_455 =
                                                        let uLET_371_0'0 = fun [u_455] f_456 k ->
                                                          let prim_374_0'0 = PRIM_SubInt(u_455,f_456) in
                                                          k prim_374_0'0 in
                                                        let lit_375_18'52 = 1 in
                                                        let k [] u_457 =
                                                          let u_458 = PRIM_CharChr(u_457) in
                                                          let prim_376_0'0 = PRIM_PutChar(u_458) in
                                                          k prim_376_0'0 in
                                                        uLET_371_0'0 lit_375_18'52 k in
                                                      uLET_372_0'0 u_447 k in
                                              u_52 prim_364_0'0 k in
                                            u_52 prim_363_0'0 k
                                          | Cons1(arg1_459_152'4,more_460_152'10) ->
                                            match more_460_152'10 with
                                            | Cons1(__461_154'7,__462_154'10) ->
                                              let u_463 = "expected exactly one argument" in
                                              let u_464 = "ERROR: " in
                                              let prim_377_0'0 = PRIM_Explode(u_464) in
                                              let k [u_52,u_463] u_465 =
                                                let prim_378_0'0 = PRIM_Explode(u_463) in
                                                let k [] u_466 =
                                                  let u_467 = Unit0 in
                                                  let u_468 = '\n' in
                                                  let u_469 = 8 in
                                                  let u_470 = PRIM_CharOrd(u_468) in
                                                  let prim_379_0'0 = PRIM_EqInt(u_470,u_469) in
                                                  match prim_379_0'0 with
                                                  | true1 ->
                                                    let prim_380_0'0 = PRIM_PutChar(u_468) in
                                                    k prim_380_0'0
                                                  | false0 ->
                                                    let u_471 = '\n' in
                                                    let uLET_381_0'0 = PRIM_EqChar(u_468,u_471) in
                                                    match uLET_381_0'0 with
                                                    | true1 ->
                                                      let prim_382_0'0 = PRIM_PutChar(u_468) in
                                                      k prim_382_0'0
                                                    | false0 ->
                                                      let u_472 = 26 in
                                                      let uLET_383_0'0 = PRIM_LessInt(u_472,u_470) in
                                                      match uLET_383_0'0 with
                                                      | true1 ->
                                                        let prim_384_0'0 = PRIM_PutChar(u_468) in
                                                        k prim_384_0'0
                                                      | false0 ->
                                                        let u_473 = '^' in
                                                        let u_474 = PRIM_PutChar(u_473) in
                                                        let u_475 = 'A' in
                                                        let u_476 = PRIM_CharOrd(u_475) in
                                                        let uLET_386_0'0 = fun [u_476] f_477 k ->
                                                          let prim_387_0'0 = PRIM_AddInt(u_476,f_477) in
                                                          k prim_387_0'0 in
                                                        let k [] u_478 =
                                                          let uLET_385_0'0 = fun [u_478] f_479 k ->
                                                            let prim_388_0'0 = PRIM_SubInt(u_478,f_479) in
                                                            k prim_388_0'0 in
                                                          let lit_389_18'52 = 1 in
                                                          let k [] u_480 =
                                                            let u_481 = PRIM_CharChr(u_480) in
                                                            let prim_390_0'0 = PRIM_PutChar(u_481) in
                                                            k prim_390_0'0 in
                                                          uLET_385_0'0 lit_389_18'52 k in
                                                        uLET_386_0'0 u_470 k in
                                                u_52 prim_378_0'0 k in
                                              u_52 prim_377_0'0 k
                                            | Nil0 ->
                                              let u_500 = fix (fun [] loop_483_35'10 acc_482_35'15 k ->
                                                let lam_413_0'0 = fun [acc_482_35'15,loop_483_35'10] f_484 k ->
                                                  match f_484 with
                                                  | Nil0 ->
                                                    let con_392_37'12 = Some0[acc_482_35'15] in
                                                    k con_392_37'12
                                                  | Cons1(x_485_38'6,xs_486_38'9) ->
                                                    let u_487 = PRIM_CharOrd(x_485_38'6) in
                                                    let uLET_394_0'0 = fun [u_487] f_488 k ->
                                                      let prim_395_0'0 = PRIM_SubInt(u_487,f_488) in
                                                      k prim_395_0'0 in
                                                    let u_489 = '0' in
                                                    let uLET_396_0'0 = PRIM_CharOrd(u_489) in
                                                    let k [acc_482_35'15,loop_483_35'10,xs_486_38'9] u_490 =
                                                      let u_491 = 0 in
                                                      let u_492 = PRIM_LessInt(u_490,u_491) in
                                                      let k [acc_482_35'15,loop_483_35'10,xs_486_38'9,u_490] uLET_397_0'0 =
                                                        let k [acc_482_35'15,loop_483_35'10,xs_486_38'9] uLET_393_0'0 =
                                                          match uLET_393_0'0 with
                                                          | None1 ->
                                                            let con_406_40'18 = None1 in
                                                            k con_406_40'18
                                                          | Some0(d_495_41'15) ->
                                                            let u_496 = 10 in
                                                            let uLET_410_0'0 = fun [u_496] f_497 k ->
                                                              let prim_411_0'0 = PRIM_MulInt(u_496,f_497) in
                                                              k prim_411_0'0 in
                                                            let k [loop_483_35'10,xs_486_38'9,d_495_41'15] u_498 =
                                                              let uLET_409_0'0 = fun [u_498] f_499 k ->
                                                                let prim_412_0'0 = PRIM_AddInt(u_498,f_499) in
                                                                k prim_412_0'0 in
                                                              let k [loop_483_35'10,xs_486_38'9] app_408_41'37 =
                                                                let k [xs_486_38'9] app_407_41'25 = app_407_41'25 xs_486_38'9 k in
                                                                loop_483_35'10 app_408_41'37 k in
                                                              uLET_409_0'0 d_495_41'15 k in
                                                            uLET_410_0'0 acc_482_35'15 k in
                                                        match uLET_397_0'0 with
                                                        | true1 ->
                                                          let u_493 = 9 in
                                                          let u_494 = PRIM_LessInt(u_493,u_490) in
                                                          let k [u_490] uLET_400_0'0 =
                                                            match uLET_400_0'0 with
                                                            | true1 ->
                                                              let con_403_32'32 = Some0[u_490] in
                                                              k con_403_32'32
                                                            | false0 ->
                                                              let con_404_32'45 = None1 in
                                                              k con_404_32'45 in
                                                          match u_494 with
                                                          | true1 ->
                                                            let con_401_4'12 = false0 in
                                                            k con_401_4'12
                                                          | false0 ->
                                                            let con_402_5'13 = true1 in
                                                            k con_402_5'13
                                                        | false0 ->
                                                          let con_405_32'55 = None1 in
                                                          k con_405_32'55 in
                                                      match u_492 with
                                                      | true1 ->
                                                        let con_398_4'12 = false0 in
                                                        k con_398_4'12
                                                      | false0 ->
                                                        let con_399_5'13 = true1 in
                                                        k con_399_5'13 in
                                                    uLET_394_0'0 uLET_396_0'0 k in
                                                k lam_413_0'0) in
                                              let lit_415_43'7 = 0 in
                                              let k [u_52,u_68,arg1_459_152'4] app_414_43'7 =
                                                let k [u_52,u_68] uLET_391_0'0 =
                                                  match uLET_391_0'0 with
                                                  | None1 ->
                                                    let u_501 = "expected arg1 to be numeric" in
                                                    let u_502 = "ERROR: " in
                                                    let prim_416_0'0 = PRIM_Explode(u_502) in
                                                    let k [u_52,u_501] u_503 =
                                                      let prim_417_0'0 = PRIM_Explode(u_501) in
                                                      let k [] u_504 =
                                                        let u_505 = Unit0 in
                                                        let u_506 = '\n' in
                                                        let u_507 = 8 in
                                                        let u_508 = PRIM_CharOrd(u_506) in
                                                        let prim_418_0'0 = PRIM_EqInt(u_508,u_507) in
                                                        match prim_418_0'0 with
                                                        | true1 ->
                                                          let prim_419_0'0 = PRIM_PutChar(u_506) in
                                                          k prim_419_0'0
                                                        | false0 ->
                                                          let u_509 = '\n' in
                                                          let uLET_420_0'0 = PRIM_EqChar(u_506,u_509) in
                                                          match uLET_420_0'0 with
                                                          | true1 ->
                                                            let prim_421_0'0 = PRIM_PutChar(u_506) in
                                                            k prim_421_0'0
                                                          | false0 ->
                                                            let u_510 = 26 in
                                                            let uLET_422_0'0 = PRIM_LessInt(u_510,u_508) in
                                                            match uLET_422_0'0 with
                                                            | true1 ->
                                                              let prim_423_0'0 = PRIM_PutChar(u_506) in
                                                              k prim_423_0'0
                                                            | false0 ->
                                                              let u_511 = '^' in
                                                              let u_512 = PRIM_PutChar(u_511) in
                                                              let u_513 = 'A' in
                                                              let u_514 = PRIM_CharOrd(u_513) in
                                                              let uLET_425_0'0 = fun [u_514] f_515 k ->
                                                                let prim_426_0'0 = PRIM_AddInt(u_514,f_515) in
                                                                k prim_426_0'0 in
                                                              let k [] u_516 =
                                                                let uLET_424_0'0 = fun [u_516] f_517 k ->
                                                                  let prim_427_0'0 = PRIM_SubInt(u_516,f_517) in
                                                                  k prim_427_0'0 in
                                                                let lit_428_18'52 = 1 in
                                                                let k [] u_518 =
                                                                  let u_519 = PRIM_CharChr(u_518) in
                                                                  let prim_429_0'0 = PRIM_PutChar(u_519) in
                                                                  k prim_429_0'0 in
                                                                uLET_424_0'0 lit_428_18'52 k in
                                                              uLET_425_0'0 u_508 k in
                                                      u_52 prim_417_0'0 k in
                                                    u_52 prim_416_0'0 k
                                                  | Some0(n_520_158'15) ->
                                                    let k [u_52,n_520_158'15] u_521 =
                                                      let u_522 = '0' in
                                                      let u_523 = PRIM_CharOrd(u_522) in
                                                      let u_534 = fix (fun [u_523] loop_525_84'10 acc_524_84'15 k ->
                                                        let lam_437_0'0 = fun [u_523,acc_524_84'15,loop_525_84'10] f_526 k ->
                                                          let u_527 = 0 in
                                                          let uLET_431_0'0 = PRIM_EqInt(f_526,u_527) in
                                                          match uLET_431_0'0 with
                                                          | true1 -> k acc_524_84'15
                                                          | false0 ->
                                                            let u_528 = 10 in
                                                            let u_529 = PRIM_ModInt(f_526,u_528) in
                                                            let u_530 = PRIM_AddInt(u_523,u_529) in
                                                            let u_531 = PRIM_CharChr(u_530) in
                                                            let uLET_434_0'0 = fun [u_531] f_532 k ->
                                                              let con_435_0'0 = Cons1[u_531,f_532] in
                                                              k con_435_0'0 in
                                                            let k [loop_525_84'10,f_526] app_433_86'40 =
                                                              let k [f_526] app_432_86'11 =
                                                                let u_533 = 10 in
                                                                let uLET_436_0'0 = PRIM_DivInt(f_526,u_533) in
                                                                app_432_86'11 uLET_436_0'0 k in
                                                              loop_525_84'10 app_433_86'40 k in
                                                            uLET_434_0'0 acc_524_84'15 k in
                                                        k lam_437_0'0) in
                                                      let u_535 = 0 in
                                                      let uLET_438_0'0 = PRIM_EqInt(n_520_158'15,u_535) in
                                                      let k [u_52,u_521] uLET_430_0'0 =
                                                        let k [u_52,u_521] u_538 =
                                                          let u_539 = " --> " in
                                                          let prim_444_0'0 = PRIM_Explode(u_539) in
                                                          let k [u_52,u_521] u_540 =
                                                            let u_541 = '0' in
                                                            let u_542 = PRIM_CharOrd(u_541) in
                                                            let u_553 = fix (fun [u_542] loop_544_84'10 acc_543_84'15 k ->
                                                              let lam_452_0'0 = fun [u_542,acc_543_84'15,loop_544_84'10] f_545 k ->
                                                                let u_546 = 0 in
                                                                let uLET_446_0'0 = PRIM_EqInt(f_545,u_546) in
                                                                match uLET_446_0'0 with
                                                                | true1 -> k acc_543_84'15
                                                                | false0 ->
                                                                  let u_547 = 10 in
                                                                  let u_548 = PRIM_ModInt(f_545,u_547) in
                                                                  let u_549 = PRIM_AddInt(u_542,u_548) in
                                                                  let u_550 = PRIM_CharChr(u_549) in
                                                                  let uLET_449_0'0 = fun [u_550] f_551 k ->
                                                                    let con_450_0'0 = Cons1[u_550,f_551] in
                                                                    k con_450_0'0 in
                                                                  let k [loop_544_84'10,f_545] app_448_86'40 =
                                                                    let k [f_545] app_447_86'11 =
                                                                      let u_552 = 10 in
                                                                      let uLET_451_0'0 = PRIM_DivInt(f_545,u_552) in
                                                                      app_447_86'11 uLET_451_0'0 k in
                                                                    loop_544_84'10 app_448_86'40 k in
                                                                  uLET_449_0'0 acc_543_84'15 k in
                                                              k lam_452_0'0) in
                                                            let u_554 = 0 in
                                                            let uLET_453_0'0 = PRIM_EqInt(u_521,u_554) in
                                                            let k [u_52] uLET_445_0'0 =
                                                              let k [] u_557 =
                                                                let u_558 = Unit0 in
                                                                let u_559 = '\n' in
                                                                let u_560 = 8 in
                                                                let u_561 = PRIM_CharOrd(u_559) in
                                                                let prim_459_0'0 = PRIM_EqInt(u_561,u_560) in
                                                                match prim_459_0'0 with
                                                                | true1 ->
                                                                  let prim_460_0'0 = PRIM_PutChar(u_559) in
                                                                  k prim_460_0'0
                                                                | false0 ->
                                                                  let u_562 = '\n' in
                                                                  let uLET_461_0'0 = PRIM_EqChar(u_559,u_562) in
                                                                  match uLET_461_0'0 with
                                                                  | true1 ->
                                                                    let prim_462_0'0 = PRIM_PutChar(u_559) in
                                                                    k prim_462_0'0
                                                                  | false0 ->
                                                                    let u_563 = 26 in
                                                                    let uLET_463_0'0 = PRIM_LessInt(u_563,u_561) in
                                                                    match uLET_463_0'0 with
                                                                    | true1 ->
                                                                      let prim_464_0'0 = PRIM_PutChar(u_559) in
                                                                      k prim_464_0'0
                                                                    | false0 ->
                                                                      let u_564 = '^' in
                                                                      let u_565 = PRIM_PutChar(u_564) in
                                                                      let u_566 = 'A' in
                                                                      let u_567 = PRIM_CharOrd(u_566) in
                                                                      let uLET_466_0'0 = fun [u_567] f_568 k ->
                                                                        let prim_467_0'0 = PRIM_AddInt(u_567,f_568) in
                                                                        k prim_467_0'0 in
                                                                      let k [] u_569 =
                                                                        let uLET_465_0'0 = fun [u_569] f_570 k ->
                                                                          let prim_468_0'0 = PRIM_SubInt(u_569,f_570) in
                                                                          k prim_468_0'0 in
                                                                        let lit_469_18'52 = 1 in
                                                                        let k [] u_571 =
                                                                          let u_572 = PRIM_CharChr(u_571) in
                                                                          let prim_470_0'0 = PRIM_PutChar(u_572) in
                                                                          k prim_470_0'0 in
                                                                        uLET_465_0'0 lit_469_18'52 k in
                                                                      uLET_466_0'0 u_561 k in
                                                              u_52 uLET_445_0'0 k in
                                                            match uLET_453_0'0 with
                                                            | true1 ->
                                                              let u_555 = '0' in
                                                              let uLET_454_0'0 = fun [u_555] f_556 k ->
                                                                let con_455_0'0 = Cons1[u_555,f_556] in
                                                                k con_455_0'0 in
                                                              let con_456_88'25 = Nil0 in
                                                              uLET_454_0'0 con_456_88'25 k
                                                            | false0 ->
                                                              let con_458_88'38 = Nil0 in
                                                              let k [u_521] app_457_88'38 = app_457_88'38 u_521 k in
                                                              u_553 con_458_88'38 k in
                                                          u_52 prim_444_0'0 k in
                                                        u_52 uLET_430_0'0 k in
                                                      match uLET_438_0'0 with
                                                      | true1 ->
                                                        let u_536 = '0' in
                                                        let uLET_439_0'0 = fun [u_536] f_537 k ->
                                                          let con_440_0'0 = Cons1[u_536,f_537] in
                                                          k con_440_0'0 in
                                                        let con_441_88'25 = Nil0 in
                                                        uLET_439_0'0 con_441_88'25 k
                                                      | false0 ->
                                                        let con_443_88'38 = Nil0 in
                                                        let k [n_520_158'15] app_442_88'38 = app_442_88'38 n_520_158'15 k in
                                                        u_534 con_443_88'38 k in
                                                    u_68 n_520_158'15 k in
                                                app_414_43'7 arg1_459_152'4 k in
                                              u_500 lit_415_43'7 k in
                                        u_52 prim_362_0'0 k
                                      | false0 ->
                                        let u_573 = "rev" in
                                        let u_574 = PRIM_Explode(u_573) in
                                        let lam_474_0'0 = fun [] f_575 k ->
                                          let lam_476_0'0 = fun [f_575] f_576 k ->
                                            let prim_475_0'0 = PRIM_EqChar(f_575,f_576) in
                                            k prim_475_0'0 in
                                          k lam_476_0'0 in
                                        let k [u_11,u_18,u_26,u_33,u_52,u_72,u_258,command_293_207'4,args_294_207'13,u_574] app_473_56'31 =
                                          let k [u_11,u_18,u_26,u_33,u_52,u_72,u_258,args_294_207'13,u_574] app_472_56'39 =
                                            let k [u_11,u_18,u_26,u_33,u_52,u_72,u_258,args_294_207'13] uLET_471_0'0 =
                                              match uLET_471_0'0 with
                                              | true1 ->
                                                match args_294_207'13 with
                                                | Cons1(__577_178'4,__578_178'7) ->
                                                  let u_579 = "rev: expected no arguments" in
                                                  let u_580 = "ERROR: " in
                                                  let prim_477_0'0 = PRIM_Explode(u_580) in
                                                  let k [u_52,u_579] u_581 =
                                                    let prim_478_0'0 = PRIM_Explode(u_579) in
                                                    let k [] u_582 =
                                                      let u_583 = Unit0 in
                                                      let u_584 = '\n' in
                                                      let u_585 = 8 in
                                                      let u_586 = PRIM_CharOrd(u_584) in
                                                      let prim_479_0'0 = PRIM_EqInt(u_586,u_585) in
                                                      match prim_479_0'0 with
                                                      | true1 ->
                                                        let prim_480_0'0 = PRIM_PutChar(u_584) in
                                                        k prim_480_0'0
                                                      | false0 ->
                                                        let u_587 = '\n' in
                                                        let uLET_481_0'0 = PRIM_EqChar(u_584,u_587) in
                                                        match uLET_481_0'0 with
                                                        | true1 ->
                                                          let prim_482_0'0 = PRIM_PutChar(u_584) in
                                                          k prim_482_0'0
                                                        | false0 ->
                                                          let u_588 = 26 in
                                                          let uLET_483_0'0 = PRIM_LessInt(u_588,u_586) in
                                                          match uLET_483_0'0 with
                                                          | true1 ->
                                                            let prim_484_0'0 = PRIM_PutChar(u_584) in
                                                            k prim_484_0'0
                                                          | false0 ->
                                                            let u_589 = '^' in
                                                            let u_590 = PRIM_PutChar(u_589) in
                                                            let u_591 = 'A' in
                                                            let u_592 = PRIM_CharOrd(u_591) in
                                                            let uLET_486_0'0 = fun [u_592] f_593 k ->
                                                              let prim_487_0'0 = PRIM_AddInt(u_592,f_593) in
                                                              k prim_487_0'0 in
                                                            let k [] u_594 =
                                                              let uLET_485_0'0 = fun [u_594] f_595 k ->
                                                                let prim_488_0'0 = PRIM_SubInt(u_594,f_595) in
                                                                k prim_488_0'0 in
                                                              let lit_489_18'52 = 1 in
                                                              let k [] u_596 =
                                                                let u_597 = PRIM_CharChr(u_596) in
                                                                let prim_490_0'0 = PRIM_PutChar(u_597) in
                                                                k prim_490_0'0 in
                                                              uLET_485_0'0 lit_489_18'52 k in
                                                            uLET_486_0'0 u_586 k in
                                                    u_52 prim_478_0'0 k in
                                                  u_52 prim_477_0'0 k
                                                | Nil0 ->
                                                  let u_598 = "(reverse typed lines until ^D)\n" in
                                                  let prim_491_0'0 = PRIM_Explode(u_598) in
                                                  let k [u_11,u_52,u_72] u_599 =
                                                    let u_600 = Unit0 in
                                                    let u_811 = fix (fun [u_11,u_52,u_72] loop_602_169'10 __601_169'14 k ->
                                                      let u_603 = Unit0 in
                                                      let u_604 = 4 in
                                                      let u_605 = PRIM_CharChr(u_604) in
                                                      let u_784 = fix (fun [u_605] loop_607_103'10 acc_606_103'15 k ->
                                                        let u_608 = Unit0 in
                                                        let u_609 = PRIM_GetChar(u_608) in
                                                        let u_610 = PRIM_CharOrd(u_609) in
                                                        let u_611 = '\n' in
                                                        let uLET_492_0'0 = PRIM_EqChar(u_609,u_611) in
                                                        match uLET_492_0'0 with
                                                        | true1 ->
                                                          let u_612 = Unit0 in
                                                          let u_613 = '\n' in
                                                          let u_614 = 8 in
                                                          let u_615 = PRIM_CharOrd(u_613) in
                                                          let prim_493_0'0 = PRIM_EqInt(u_615,u_614) in
                                                          let k [acc_606_103'15] u_627 =
                                                            let u_633 = fix (fun [] loop_629_64'10 acc_628_64'15 k ->
                                                              let lam_507_0'0 = fun [acc_628_64'15,loop_629_64'10] f_630 k ->
                                                                match f_630 with
                                                                | Nil0 -> k acc_628_64'15
                                                                | Cons1(x_631_67'6,xs_632_67'9) ->
                                                                  let con_506_0'0 = Cons1[x_631_67'6,acc_628_64'15] in
                                                                  let k [xs_632_67'9] app_505_67'20 = app_505_67'20 xs_632_67'9 k in
                                                                  loop_629_64'10 con_506_0'0 k in
                                                              k lam_507_0'0) in
                                                            let con_509_69'7 = Nil0 in
                                                            let k [acc_606_103'15] app_508_69'7 = app_508_69'7 acc_606_103'15 k in
                                                            u_633 con_509_69'7 k in
                                                          match prim_493_0'0 with
                                                          | true1 ->
                                                            let prim_494_0'0 = PRIM_PutChar(u_613) in
                                                            k prim_494_0'0
                                                          | false0 ->
                                                            let u_616 = '\n' in
                                                            let uLET_495_0'0 = PRIM_EqChar(u_613,u_616) in
                                                            match uLET_495_0'0 with
                                                            | true1 ->
                                                              let prim_496_0'0 = PRIM_PutChar(u_613) in
                                                              k prim_496_0'0
                                                            | false0 ->
                                                              let u_617 = 26 in
                                                              let uLET_497_0'0 = PRIM_LessInt(u_617,u_615) in
                                                              match uLET_497_0'0 with
                                                              | true1 ->
                                                                let prim_498_0'0 = PRIM_PutChar(u_613) in
                                                                k prim_498_0'0
                                                              | false0 ->
                                                                let u_618 = '^' in
                                                                let u_619 = PRIM_PutChar(u_618) in
                                                                let u_620 = 'A' in
                                                                let u_621 = PRIM_CharOrd(u_620) in
                                                                let uLET_500_0'0 = fun [u_621] f_622 k ->
                                                                  let prim_501_0'0 = PRIM_AddInt(u_621,f_622) in
                                                                  k prim_501_0'0 in
                                                                let k [] u_623 =
                                                                  let uLET_499_0'0 = fun [u_623] f_624 k ->
                                                                    let prim_502_0'0 = PRIM_SubInt(u_623,f_624) in
                                                                    k prim_502_0'0 in
                                                                  let lit_503_18'52 = 1 in
                                                                  let k [] u_625 =
                                                                    let u_626 = PRIM_CharChr(u_625) in
                                                                    let prim_504_0'0 = PRIM_PutChar(u_626) in
                                                                    k prim_504_0'0 in
                                                                  uLET_499_0'0 lit_503_18'52 k in
                                                                uLET_500_0'0 u_615 k
                                                        | false0 ->
                                                          let prim_510_0'0 = PRIM_EqChar(u_609,u_605) in
                                                          match prim_510_0'0 with
                                                          | true1 ->
                                                            let u_634 = 8 in
                                                            let u_635 = PRIM_CharOrd(u_609) in
                                                            let prim_511_0'0 = PRIM_EqInt(u_635,u_634) in
                                                            let k [u_605,acc_606_103'15] u_647 =
                                                              let u_648 = Unit0 in
                                                              let u_649 = '\n' in
                                                              let u_650 = 8 in
                                                              let u_651 = PRIM_CharOrd(u_649) in
                                                              let prim_523_0'0 = PRIM_EqInt(u_651,u_650) in
                                                              let k [u_605,acc_606_103'15] u_663 =
                                                                let u_664 = Cons1[u_605,acc_606_103'15] in
                                                                let u_670 = fix (fun [] loop_666_64'10 acc_665_64'15 k ->
                                                                  let lam_537_0'0 = fun [acc_665_64'15,loop_666_64'10] f_667 k ->
                                                                    match f_667 with
                                                                    | Nil0 -> k acc_665_64'15
                                                                    | Cons1(x_668_67'6,xs_669_67'9) ->
                                                                      let con_536_0'0 = Cons1[x_668_67'6,acc_665_64'15] in
                                                                      let k [xs_669_67'9] app_535_67'20 = app_535_67'20 xs_669_67'9 k in
                                                                      loop_666_64'10 con_536_0'0 k in
                                                                  k lam_537_0'0) in
                                                                let con_539_69'7 = Nil0 in
                                                                let k [u_664] app_538_69'7 = app_538_69'7 u_664 k in
                                                                u_670 con_539_69'7 k in
                                                              match prim_523_0'0 with
                                                              | true1 ->
                                                                let prim_524_0'0 = PRIM_PutChar(u_649) in
                                                                k prim_524_0'0
                                                              | false0 ->
                                                                let u_652 = '\n' in
                                                                let uLET_525_0'0 = PRIM_EqChar(u_649,u_652) in
                                                                match uLET_525_0'0 with
                                                                | true1 ->
                                                                  let prim_526_0'0 = PRIM_PutChar(u_649) in
                                                                  k prim_526_0'0
                                                                | false0 ->
                                                                  let u_653 = 26 in
                                                                  let uLET_527_0'0 = PRIM_LessInt(u_653,u_651) in
                                                                  match uLET_527_0'0 with
                                                                  | true1 ->
                                                                    let prim_528_0'0 = PRIM_PutChar(u_649) in
                                                                    k prim_528_0'0
                                                                  | false0 ->
                                                                    let u_654 = '^' in
                                                                    let u_655 = PRIM_PutChar(u_654) in
                                                                    let u_656 = 'A' in
                                                                    let u_657 = PRIM_CharOrd(u_656) in
                                                                    let uLET_530_0'0 = fun [u_657] f_658 k ->
                                                                      let prim_531_0'0 = PRIM_AddInt(u_657,f_658) in
                                                                      k prim_531_0'0 in
                                                                    let k [] u_659 =
                                                                      let uLET_529_0'0 = fun [u_659] f_660 k ->
                                                                        let prim_532_0'0 = PRIM_SubInt(u_659,f_660) in
                                                                        k prim_532_0'0 in
                                                                      let lit_533_18'52 = 1 in
                                                                      let k [] u_661 =
                                                                        let u_662 = PRIM_CharChr(u_661) in
                                                                        let prim_534_0'0 = PRIM_PutChar(u_662) in
                                                                        k prim_534_0'0 in
                                                                      uLET_529_0'0 lit_533_18'52 k in
                                                                    uLET_530_0'0 u_651 k in
                                                            match prim_511_0'0 with
                                                            | true1 ->
                                                              let prim_512_0'0 = PRIM_PutChar(u_609) in
                                                              k prim_512_0'0
                                                            | false0 ->
                                                              let u_636 = '\n' in
                                                              let uLET_513_0'0 = PRIM_EqChar(u_609,u_636) in
                                                              match uLET_513_0'0 with
                                                              | true1 ->
                                                                let prim_514_0'0 = PRIM_PutChar(u_609) in
                                                                k prim_514_0'0
                                                              | false0 ->
                                                                let u_637 = 26 in
                                                                let uLET_515_0'0 = PRIM_LessInt(u_637,u_635) in
                                                                match uLET_515_0'0 with
                                                                | true1 ->
                                                                  let prim_516_0'0 = PRIM_PutChar(u_609) in
                                                                  k prim_516_0'0
                                                                | false0 ->
                                                                  let u_638 = '^' in
                                                                  let u_639 = PRIM_PutChar(u_638) in
                                                                  let u_640 = 'A' in
                                                                  let u_641 = PRIM_CharOrd(u_640) in
                                                                  let uLET_518_0'0 = fun [u_641] f_642 k ->
                                                                    let prim_519_0'0 = PRIM_AddInt(u_641,f_642) in
                                                                    k prim_519_0'0 in
                                                                  let k [] u_643 =
                                                                    let uLET_517_0'0 = fun [u_643] f_644 k ->
                                                                      let prim_520_0'0 = PRIM_SubInt(u_643,f_644) in
                                                                      k prim_520_0'0 in
                                                                    let lit_521_18'52 = 1 in
                                                                    let k [] u_645 =
                                                                      let u_646 = PRIM_CharChr(u_645) in
                                                                      let prim_522_0'0 = PRIM_PutChar(u_646) in
                                                                      k prim_522_0'0 in
                                                                    uLET_517_0'0 lit_521_18'52 k in
                                                                  uLET_518_0'0 u_635 k
                                                          | false0 ->
                                                            let u_671 = 127 in
                                                            let uLET_540_0'0 = PRIM_LessInt(u_671,u_610) in
                                                            match uLET_540_0'0 with
                                                            | true1 -> loop_607_103'10 acc_606_103'15 k
                                                            | false0 ->
                                                              let u_672 = 127 in
                                                              let uLET_541_0'0 = PRIM_EqInt(u_610,u_672) in
                                                              match uLET_541_0'0 with
                                                              | true1 ->
                                                                match acc_606_103'15 with
                                                                | Nil0 -> loop_607_103'10 acc_606_103'15 k
                                                                | Cons1(c_673_112'14,tail_674_112'17) ->
                                                                  let u_675 = PRIM_CharOrd(c_673_112'14) in
                                                                  let uLET_543_0'0 = fun [u_675] f_676 k ->
                                                                    let u_677 = PRIM_LessInt(f_676,u_675) in
                                                                    match u_677 with
                                                                    | true1 ->
                                                                      let con_544_4'12 = false0 in
                                                                      k con_544_4'12
                                                                    | false0 ->
                                                                      let con_545_5'13 = true1 in
                                                                      k con_545_5'13 in
                                                                  let lit_546_113'28 = 26 in
                                                                  let k [loop_607_103'10,tail_674_112'17] app_542_113'28 =
                                                                    let k [loop_607_103'10,tail_674_112'17] u_723 =
                                                                      let u_724 = Unit0 in
                                                                      let u_725 = 8 in
                                                                      let u_726 = PRIM_CharChr(u_725) in
                                                                      let u_727 = 8 in
                                                                      let u_728 = PRIM_CharOrd(u_726) in
                                                                      let prim_584_0'0 = PRIM_EqInt(u_728,u_727) in
                                                                      let k [loop_607_103'10,tail_674_112'17,u_726] u_740 =
                                                                        let u_741 = ' ' in
                                                                        let u_742 = 8 in
                                                                        let u_743 = PRIM_CharOrd(u_741) in
                                                                        let prim_596_0'0 = PRIM_EqInt(u_743,u_742) in
                                                                        let k [loop_607_103'10,tail_674_112'17,u_726] u_755 =
                                                                          let u_756 = 8 in
                                                                          let u_757 = PRIM_CharOrd(u_726) in
                                                                          let prim_608_0'0 = PRIM_EqInt(u_757,u_756) in
                                                                          let k [loop_607_103'10,tail_674_112'17] u_769 = loop_607_103'10 tail_674_112'17 k in
                                                                          match prim_608_0'0 with
                                                                          | true1 ->
                                                                            let prim_609_0'0 = PRIM_PutChar(u_726) in
                                                                            k prim_609_0'0
                                                                          | false0 ->
                                                                            let u_758 = '\n' in
                                                                            let uLET_610_0'0 = PRIM_EqChar(u_726,u_758) in
                                                                            match uLET_610_0'0 with
                                                                            | true1 ->
                                                                              let prim_611_0'0 = PRIM_PutChar(u_726) in
                                                                              k prim_611_0'0
                                                                            | false0 ->
                                                                              let u_759 = 26 in
                                                                              let uLET_612_0'0 = PRIM_LessInt(u_759,u_757) in
                                                                              match uLET_612_0'0 with
                                                                              | true1 ->
                                                                                let prim_613_0'0 = PRIM_PutChar(u_726) in
                                                                                k prim_613_0'0
                                                                              | false0 ->
                                                                                let u_760 = '^' in
                                                                                let u_761 = PRIM_PutChar(u_760) in
                                                                                let u_762 = 'A' in
                                                                                let u_763 = PRIM_CharOrd(u_762) in
                                                                                let uLET_615_0'0 = fun [u_763] f_764 k ->
                                                                                  let prim_616_0'0 = PRIM_AddInt(u_763,f_764) in
                                                                                  k prim_616_0'0 in
                                                                                let k [] u_765 =
                                                                                  let uLET_614_0'0 = fun [u_765] f_766 k ->
                                                                                    let prim_617_0'0 = PRIM_SubInt(u_765,f_766) in
                                                                                    k prim_617_0'0 in
                                                                                  let lit_618_18'52 = 1 in
                                                                                  let k [] u_767 =
                                                                                    let u_768 = PRIM_CharChr(u_767) in
                                                                                    let prim_619_0'0 = PRIM_PutChar(u_768) in
                                                                                    k prim_619_0'0 in
                                                                                  uLET_614_0'0 lit_618_18'52 k in
                                                                                uLET_615_0'0 u_757 k in
                                                                        match prim_596_0'0 with
                                                                        | true1 ->
                                                                          let prim_597_0'0 = PRIM_PutChar(u_741) in
                                                                          k prim_597_0'0
                                                                        | false0 ->
                                                                          let u_744 = '\n' in
                                                                          let uLET_598_0'0 = PRIM_EqChar(u_741,u_744) in
                                                                          match uLET_598_0'0 with
                                                                          | true1 ->
                                                                            let prim_599_0'0 = PRIM_PutChar(u_741) in
                                                                            k prim_599_0'0
                                                                          | false0 ->
                                                                            let u_745 = 26 in
                                                                            let uLET_600_0'0 = PRIM_LessInt(u_745,u_743) in
                                                                            match uLET_600_0'0 with
                                                                            | true1 ->
                                                                              let prim_601_0'0 = PRIM_PutChar(u_741) in
                                                                              k prim_601_0'0
                                                                            | false0 ->
                                                                              let u_746 = '^' in
                                                                              let u_747 = PRIM_PutChar(u_746) in
                                                                              let u_748 = 'A' in
                                                                              let u_749 = PRIM_CharOrd(u_748) in
                                                                              let uLET_603_0'0 = fun [u_749] f_750 k ->
                                                                                let prim_604_0'0 = PRIM_AddInt(u_749,f_750) in
                                                                                k prim_604_0'0 in
                                                                              let k [] u_751 =
                                                                                let uLET_602_0'0 = fun [u_751] f_752 k ->
                                                                                  let prim_605_0'0 = PRIM_SubInt(u_751,f_752) in
                                                                                  k prim_605_0'0 in
                                                                                let lit_606_18'52 = 1 in
                                                                                let k [] u_753 =
                                                                                  let u_754 = PRIM_CharChr(u_753) in
                                                                                  let prim_607_0'0 = PRIM_PutChar(u_754) in
                                                                                  k prim_607_0'0 in
                                                                                uLET_602_0'0 lit_606_18'52 k in
                                                                              uLET_603_0'0 u_743 k in
                                                                      match prim_584_0'0 with
                                                                      | true1 ->
                                                                        let prim_585_0'0 = PRIM_PutChar(u_726) in
                                                                        k prim_585_0'0
                                                                      | false0 ->
                                                                        let u_729 = '\n' in
                                                                        let uLET_586_0'0 = PRIM_EqChar(u_726,u_729) in
                                                                        match uLET_586_0'0 with
                                                                        | true1 ->
                                                                          let prim_587_0'0 = PRIM_PutChar(u_726) in
                                                                          k prim_587_0'0
                                                                        | false0 ->
                                                                          let u_730 = 26 in
                                                                          let uLET_588_0'0 = PRIM_LessInt(u_730,u_728) in
                                                                          match uLET_588_0'0 with
                                                                          | true1 ->
                                                                            let prim_589_0'0 = PRIM_PutChar(u_726) in
                                                                            k prim_589_0'0
                                                                          | false0 ->
                                                                            let u_731 = '^' in
                                                                            let u_732 = PRIM_PutChar(u_731) in
                                                                            let u_733 = 'A' in
                                                                            let u_734 = PRIM_CharOrd(u_733) in
                                                                            let uLET_591_0'0 = fun [u_734] f_735 k ->
                                                                              let prim_592_0'0 = PRIM_AddInt(u_734,f_735) in
                                                                              k prim_592_0'0 in
                                                                            let k [] u_736 =
                                                                              let uLET_590_0'0 = fun [u_736] f_737 k ->
                                                                                let prim_593_0'0 = PRIM_SubInt(u_736,f_737) in
                                                                                k prim_593_0'0 in
                                                                              let lit_594_18'52 = 1 in
                                                                              let k [] u_738 =
                                                                                let u_739 = PRIM_CharChr(u_738) in
                                                                                let prim_595_0'0 = PRIM_PutChar(u_739) in
                                                                                k prim_595_0'0 in
                                                                              uLET_590_0'0 lit_594_18'52 k in
                                                                            uLET_591_0'0 u_728 k in
                                                                    match app_542_113'28 with
                                                                    | true1 ->
                                                                      let u_678 = Unit0 in
                                                                      let u_679 = 8 in
                                                                      let u_680 = PRIM_CharChr(u_679) in
                                                                      let u_681 = 8 in
                                                                      let u_682 = PRIM_CharOrd(u_680) in
                                                                      let prim_547_0'0 = PRIM_EqInt(u_682,u_681) in
                                                                      let k [u_680] u_694 =
                                                                        let u_695 = ' ' in
                                                                        let u_696 = 8 in
                                                                        let u_697 = PRIM_CharOrd(u_695) in
                                                                        let prim_559_0'0 = PRIM_EqInt(u_697,u_696) in
                                                                        let k [u_680] u_709 =
                                                                          let u_710 = 8 in
                                                                          let u_711 = PRIM_CharOrd(u_680) in
                                                                          let prim_571_0'0 = PRIM_EqInt(u_711,u_710) in
                                                                          match prim_571_0'0 with
                                                                          | true1 ->
                                                                            let prim_572_0'0 = PRIM_PutChar(u_680) in
                                                                            k prim_572_0'0
                                                                          | false0 ->
                                                                            let u_712 = '\n' in
                                                                            let uLET_573_0'0 = PRIM_EqChar(u_680,u_712) in
                                                                            match uLET_573_0'0 with
                                                                            | true1 ->
                                                                              let prim_574_0'0 = PRIM_PutChar(u_680) in
                                                                              k prim_574_0'0
                                                                            | false0 ->
                                                                              let u_713 = 26 in
                                                                              let uLET_575_0'0 = PRIM_LessInt(u_713,u_711) in
                                                                              match uLET_575_0'0 with
                                                                              | true1 ->
                                                                                let prim_576_0'0 = PRIM_PutChar(u_680) in
                                                                                k prim_576_0'0
                                                                              | false0 ->
                                                                                let u_714 = '^' in
                                                                                let u_715 = PRIM_PutChar(u_714) in
                                                                                let u_716 = 'A' in
                                                                                let u_717 = PRIM_CharOrd(u_716) in
                                                                                let uLET_578_0'0 = fun [u_717] f_718 k ->
                                                                                  let prim_579_0'0 = PRIM_AddInt(u_717,f_718) in
                                                                                  k prim_579_0'0 in
                                                                                let k [] u_719 =
                                                                                  let uLET_577_0'0 = fun [u_719] f_720 k ->
                                                                                    let prim_580_0'0 = PRIM_SubInt(u_719,f_720) in
                                                                                    k prim_580_0'0 in
                                                                                  let lit_581_18'52 = 1 in
                                                                                  let k [] u_721 =
                                                                                    let u_722 = PRIM_CharChr(u_721) in
                                                                                    let prim_582_0'0 = PRIM_PutChar(u_722) in
                                                                                    k prim_582_0'0 in
                                                                                  uLET_577_0'0 lit_581_18'52 k in
                                                                                uLET_578_0'0 u_711 k in
                                                                        match prim_559_0'0 with
                                                                        | true1 ->
                                                                          let prim_560_0'0 = PRIM_PutChar(u_695) in
                                                                          k prim_560_0'0
                                                                        | false0 ->
                                                                          let u_698 = '\n' in
                                                                          let uLET_561_0'0 = PRIM_EqChar(u_695,u_698) in
                                                                          match uLET_561_0'0 with
                                                                          | true1 ->
                                                                            let prim_562_0'0 = PRIM_PutChar(u_695) in
                                                                            k prim_562_0'0
                                                                          | false0 ->
                                                                            let u_699 = 26 in
                                                                            let uLET_563_0'0 = PRIM_LessInt(u_699,u_697) in
                                                                            match uLET_563_0'0 with
                                                                            | true1 ->
                                                                              let prim_564_0'0 = PRIM_PutChar(u_695) in
                                                                              k prim_564_0'0
                                                                            | false0 ->
                                                                              let u_700 = '^' in
                                                                              let u_701 = PRIM_PutChar(u_700) in
                                                                              let u_702 = 'A' in
                                                                              let u_703 = PRIM_CharOrd(u_702) in
                                                                              let uLET_566_0'0 = fun [u_703] f_704 k ->
                                                                                let prim_567_0'0 = PRIM_AddInt(u_703,f_704) in
                                                                                k prim_567_0'0 in
                                                                              let k [] u_705 =
                                                                                let uLET_565_0'0 = fun [u_705] f_706 k ->
                                                                                  let prim_568_0'0 = PRIM_SubInt(u_705,f_706) in
                                                                                  k prim_568_0'0 in
                                                                                let lit_569_18'52 = 1 in
                                                                                let k [] u_707 =
                                                                                  let u_708 = PRIM_CharChr(u_707) in
                                                                                  let prim_570_0'0 = PRIM_PutChar(u_708) in
                                                                                  k prim_570_0'0 in
                                                                                uLET_565_0'0 lit_569_18'52 k in
                                                                              uLET_566_0'0 u_697 k in
                                                                      match prim_547_0'0 with
                                                                      | true1 ->
                                                                        let prim_548_0'0 = PRIM_PutChar(u_680) in
                                                                        k prim_548_0'0
                                                                      | false0 ->
                                                                        let u_683 = '\n' in
                                                                        let uLET_549_0'0 = PRIM_EqChar(u_680,u_683) in
                                                                        match uLET_549_0'0 with
                                                                        | true1 ->
                                                                          let prim_550_0'0 = PRIM_PutChar(u_680) in
                                                                          k prim_550_0'0
                                                                        | false0 ->
                                                                          let u_684 = 26 in
                                                                          let uLET_551_0'0 = PRIM_LessInt(u_684,u_682) in
                                                                          match uLET_551_0'0 with
                                                                          | true1 ->
                                                                            let prim_552_0'0 = PRIM_PutChar(u_680) in
                                                                            k prim_552_0'0
                                                                          | false0 ->
                                                                            let u_685 = '^' in
                                                                            let u_686 = PRIM_PutChar(u_685) in
                                                                            let u_687 = 'A' in
                                                                            let u_688 = PRIM_CharOrd(u_687) in
                                                                            let uLET_554_0'0 = fun [u_688] f_689 k ->
                                                                              let prim_555_0'0 = PRIM_AddInt(u_688,f_689) in
                                                                              k prim_555_0'0 in
                                                                            let k [] u_690 =
                                                                              let uLET_553_0'0 = fun [u_690] f_691 k ->
                                                                                let prim_556_0'0 = PRIM_SubInt(u_690,f_691) in
                                                                                k prim_556_0'0 in
                                                                              let lit_557_18'52 = 1 in
                                                                              let k [] u_692 =
                                                                                let u_693 = PRIM_CharChr(u_692) in
                                                                                let prim_558_0'0 = PRIM_PutChar(u_693) in
                                                                                k prim_558_0'0 in
                                                                              uLET_553_0'0 lit_557_18'52 k in
                                                                            uLET_554_0'0 u_682 k
                                                                    | false0 ->
                                                                      let con_583_113'55 = Unit0 in
                                                                      k con_583_113'55 in
                                                                  uLET_543_0'0 lit_546_113'28 k
                                                              | false0 ->
                                                                let u_770 = 8 in
                                                                let u_771 = PRIM_CharOrd(u_609) in
                                                                let prim_620_0'0 = PRIM_EqInt(u_771,u_770) in
                                                                let k [acc_606_103'15,loop_607_103'10,u_609] u_783 =
                                                                  let con_632_0'0 = Cons1[u_609,acc_606_103'15] in
                                                                  loop_607_103'10 con_632_0'0 k in
                                                                match prim_620_0'0 with
                                                                | true1 ->
                                                                  let prim_621_0'0 = PRIM_PutChar(u_609) in
                                                                  k prim_621_0'0
                                                                | false0 ->
                                                                  let u_772 = '\n' in
                                                                  let uLET_622_0'0 = PRIM_EqChar(u_609,u_772) in
                                                                  match uLET_622_0'0 with
                                                                  | true1 ->
                                                                    let prim_623_0'0 = PRIM_PutChar(u_609) in
                                                                    k prim_623_0'0
                                                                  | false0 ->
                                                                    let u_773 = 26 in
                                                                    let uLET_624_0'0 = PRIM_LessInt(u_773,u_771) in
                                                                    match uLET_624_0'0 with
                                                                    | true1 ->
                                                                      let prim_625_0'0 = PRIM_PutChar(u_609) in
                                                                      k prim_625_0'0
                                                                    | false0 ->
                                                                      let u_774 = '^' in
                                                                      let u_775 = PRIM_PutChar(u_774) in
                                                                      let u_776 = 'A' in
                                                                      let u_777 = PRIM_CharOrd(u_776) in
                                                                      let uLET_627_0'0 = fun [u_777] f_778 k ->
                                                                        let prim_628_0'0 = PRIM_AddInt(u_777,f_778) in
                                                                        k prim_628_0'0 in
                                                                      let k [] u_779 =
                                                                        let uLET_626_0'0 = fun [u_779] f_780 k ->
                                                                          let prim_629_0'0 = PRIM_SubInt(u_779,f_780) in
                                                                          k prim_629_0'0 in
                                                                        let lit_630_18'52 = 1 in
                                                                        let k [] u_781 =
                                                                          let u_782 = PRIM_CharChr(u_781) in
                                                                          let prim_631_0'0 = PRIM_PutChar(u_782) in
                                                                          k prim_631_0'0 in
                                                                        uLET_626_0'0 lit_630_18'52 k in
                                                                      uLET_627_0'0 u_771 k) in
                                                      let con_633_119'7 = Nil0 in
                                                      let k [u_11,u_52,u_72,loop_602_169'10] u_785 =
                                                        let lam_637_0'0 = fun [] f_786 k ->
                                                          let lam_639_0'0 = fun [f_786] f_787 k ->
                                                            let prim_638_0'0 = PRIM_EqChar(f_786,f_787) in
                                                            k prim_638_0'0 in
                                                          k lam_639_0'0 in
                                                        let k [u_52,u_72,loop_602_169'10,u_785] app_636_56'31 =
                                                          let k [u_52,u_72,loop_602_169'10,u_785] app_635_56'39 =
                                                            let k [u_52,loop_602_169'10,u_785] app_634_56'41 =
                                                              match app_634_56'41 with
                                                              | true1 ->
                                                                let con_640_171'44 = Unit0 in
                                                                k con_640_171'44
                                                              | false0 ->
                                                                let u_793 = fix (fun [] loop_789_64'10 acc_788_64'15 k ->
                                                                  let lam_644_0'0 = fun [acc_788_64'15,loop_789_64'10] f_790 k ->
                                                                    match f_790 with
                                                                    | Nil0 -> k acc_788_64'15
                                                                    | Cons1(x_791_67'6,xs_792_67'9) ->
                                                                      let con_643_0'0 = Cons1[x_791_67'6,acc_788_64'15] in
                                                                      let k [xs_792_67'9] app_642_67'20 = app_642_67'20 xs_792_67'9 k in
                                                                      loop_789_64'10 con_643_0'0 k in
                                                                  k lam_644_0'0) in
                                                                let con_646_69'7 = Nil0 in
                                                                let k [u_52,loop_602_169'10,u_785] app_645_69'7 =
                                                                  let k [u_52,loop_602_169'10] uLET_641_0'0 =
                                                                    let k [loop_602_169'10] u_794 =
                                                                      let u_795 = Unit0 in
                                                                      let u_796 = '\n' in
                                                                      let u_797 = 8 in
                                                                      let u_798 = PRIM_CharOrd(u_796) in
                                                                      let prim_647_0'0 = PRIM_EqInt(u_798,u_797) in
                                                                      let k [loop_602_169'10] u_810 =
                                                                        let con_659_172'46 = Unit0 in
                                                                        loop_602_169'10 con_659_172'46 k in
                                                                      match prim_647_0'0 with
                                                                      | true1 ->
                                                                        let prim_648_0'0 = PRIM_PutChar(u_796) in
                                                                        k prim_648_0'0
                                                                      | false0 ->
                                                                        let u_799 = '\n' in
                                                                        let uLET_649_0'0 = PRIM_EqChar(u_796,u_799) in
                                                                        match uLET_649_0'0 with
                                                                        | true1 ->
                                                                          let prim_650_0'0 = PRIM_PutChar(u_796) in
                                                                          k prim_650_0'0
                                                                        | false0 ->
                                                                          let u_800 = 26 in
                                                                          let uLET_651_0'0 = PRIM_LessInt(u_800,u_798) in
                                                                          match uLET_651_0'0 with
                                                                          | true1 ->
                                                                            let prim_652_0'0 = PRIM_PutChar(u_796) in
                                                                            k prim_652_0'0
                                                                          | false0 ->
                                                                            let u_801 = '^' in
                                                                            let u_802 = PRIM_PutChar(u_801) in
                                                                            let u_803 = 'A' in
                                                                            let u_804 = PRIM_CharOrd(u_803) in
                                                                            let uLET_654_0'0 = fun [u_804] f_805 k ->
                                                                              let prim_655_0'0 = PRIM_AddInt(u_804,f_805) in
                                                                              k prim_655_0'0 in
                                                                            let k [] u_806 =
                                                                              let uLET_653_0'0 = fun [u_806] f_807 k ->
                                                                                let prim_656_0'0 = PRIM_SubInt(u_806,f_807) in
                                                                                k prim_656_0'0 in
                                                                              let lit_657_18'52 = 1 in
                                                                              let k [] u_808 =
                                                                                let u_809 = PRIM_CharChr(u_808) in
                                                                                let prim_658_0'0 = PRIM_PutChar(u_809) in
                                                                                k prim_658_0'0 in
                                                                              uLET_653_0'0 lit_657_18'52 k in
                                                                            uLET_654_0'0 u_798 k in
                                                                    u_52 uLET_641_0'0 k in
                                                                  app_645_69'7 u_785 k in
                                                                u_793 con_646_69'7 k in
                                                            app_635_56'39 u_72 k in
                                                          app_636_56'31 u_785 k in
                                                        u_11 lam_637_0'0 k in
                                                      u_784 con_633_119'7 k) in
                                                    let con_660_174'6 = Unit0 in
                                                    u_811 con_660_174'6 k in
                                                  u_52 prim_491_0'0 k
                                              | false0 ->
                                                let lam_661_0'0 = fun [] f_812 k ->
                                                  let u_813 = 'o' in
                                                  let uLET_662_0'0 = PRIM_EqChar(f_812,u_813) in
                                                  match uLET_662_0'0 with
                                                  | true1 ->
                                                    let lit_663_184'57 = '*' in
                                                    k lit_663_184'57
                                                  | false0 -> k f_812 in
                                                let k [u_18,u_33,u_52,u_258] u_814 =
                                                  let k [u_18,u_52,u_258,u_814] u_815 =
                                                    let u_816 = "You wrote: \"" in
                                                    let uLET_666_0'0 = PRIM_Explode(u_816) in
                                                    let k [u_52,u_258,u_814,u_815] app_665_186'20 =
                                                      let k [u_52,app_665_186'20,u_815] app_667_186'60 =
                                                        let k [u_52,u_815] app_664_186'46 =
                                                          let k [u_52,u_815] u_817 =
                                                            let u_818 = "\" (" in
                                                            let prim_668_0'0 = PRIM_Explode(u_818) in
                                                            let k [u_52,u_815] u_819 =
                                                              let u_820 = '0' in
                                                              let u_821 = PRIM_CharOrd(u_820) in
                                                              let u_832 = fix (fun [u_821] loop_823_84'10 acc_822_84'15 k ->
                                                                let lam_676_0'0 = fun [u_821,acc_822_84'15,loop_823_84'10] f_824 k ->
                                                                  let u_825 = 0 in
                                                                  let uLET_670_0'0 = PRIM_EqInt(f_824,u_825) in
                                                                  match uLET_670_0'0 with
                                                                  | true1 -> k acc_822_84'15
                                                                  | false0 ->
                                                                    let u_826 = 10 in
                                                                    let u_827 = PRIM_ModInt(f_824,u_826) in
                                                                    let u_828 = PRIM_AddInt(u_821,u_827) in
                                                                    let u_829 = PRIM_CharChr(u_828) in
                                                                    let uLET_673_0'0 = fun [u_829] f_830 k ->
                                                                      let con_674_0'0 = Cons1[u_829,f_830] in
                                                                      k con_674_0'0 in
                                                                    let k [loop_823_84'10,f_824] app_672_86'40 =
                                                                      let k [f_824] app_671_86'11 =
                                                                        let u_831 = 10 in
                                                                        let uLET_675_0'0 = PRIM_DivInt(f_824,u_831) in
                                                                        app_671_86'11 uLET_675_0'0 k in
                                                                      loop_823_84'10 app_672_86'40 k in
                                                                    uLET_673_0'0 acc_822_84'15 k in
                                                                k lam_676_0'0) in
                                                              let u_833 = 0 in
                                                              let uLET_677_0'0 = PRIM_EqInt(u_815,u_833) in
                                                              let k [u_52] uLET_669_0'0 =
                                                                let k [u_52] u_836 =
                                                                  let u_837 = " chars)" in
                                                                  let prim_683_0'0 = PRIM_Explode(u_837) in
                                                                  let k [] u_838 =
                                                                    let u_839 = Unit0 in
                                                                    let u_840 = '\n' in
                                                                    let u_841 = 8 in
                                                                    let u_842 = PRIM_CharOrd(u_840) in
                                                                    let prim_684_0'0 = PRIM_EqInt(u_842,u_841) in
                                                                    match prim_684_0'0 with
                                                                    | true1 ->
                                                                      let prim_685_0'0 = PRIM_PutChar(u_840) in
                                                                      k prim_685_0'0
                                                                    | false0 ->
                                                                      let u_843 = '\n' in
                                                                      let uLET_686_0'0 = PRIM_EqChar(u_840,u_843) in
                                                                      match uLET_686_0'0 with
                                                                      | true1 ->
                                                                        let prim_687_0'0 = PRIM_PutChar(u_840) in
                                                                        k prim_687_0'0
                                                                      | false0 ->
                                                                        let u_844 = 26 in
                                                                        let uLET_688_0'0 = PRIM_LessInt(u_844,u_842) in
                                                                        match uLET_688_0'0 with
                                                                        | true1 ->
                                                                          let prim_689_0'0 = PRIM_PutChar(u_840) in
                                                                          k prim_689_0'0
                                                                        | false0 ->
                                                                          let u_845 = '^' in
                                                                          let u_846 = PRIM_PutChar(u_845) in
                                                                          let u_847 = 'A' in
                                                                          let u_848 = PRIM_CharOrd(u_847) in
                                                                          let uLET_691_0'0 = fun [u_848] f_849 k ->
                                                                            let prim_692_0'0 = PRIM_AddInt(u_848,f_849) in
                                                                            k prim_692_0'0 in
                                                                          let k [] u_850 =
                                                                            let uLET_690_0'0 = fun [u_850] f_851 k ->
                                                                              let prim_693_0'0 = PRIM_SubInt(u_850,f_851) in
                                                                              k prim_693_0'0 in
                                                                            let lit_694_18'52 = 1 in
                                                                            let k [] u_852 =
                                                                              let u_853 = PRIM_CharChr(u_852) in
                                                                              let prim_695_0'0 = PRIM_PutChar(u_853) in
                                                                              k prim_695_0'0 in
                                                                            uLET_690_0'0 lit_694_18'52 k in
                                                                          uLET_691_0'0 u_842 k in
                                                                  u_52 prim_683_0'0 k in
                                                                u_52 uLET_669_0'0 k in
                                                              match uLET_677_0'0 with
                                                              | true1 ->
                                                                let u_834 = '0' in
                                                                let uLET_678_0'0 = fun [u_834] f_835 k ->
                                                                  let con_679_0'0 = Cons1[u_834,f_835] in
                                                                  k con_679_0'0 in
                                                                let con_680_88'25 = Nil0 in
                                                                uLET_678_0'0 con_680_88'25 k
                                                              | false0 ->
                                                                let con_682_88'38 = Nil0 in
                                                                let k [u_815] app_681_88'38 = app_681_88'38 u_815 k in
                                                                u_832 con_682_88'38 k in
                                                            u_52 prim_668_0'0 k in
                                                          u_52 app_664_186'46 k in
                                                        app_665_186'20 app_667_186'60 k in
                                                      u_814 u_258 k in
                                                    u_18 uLET_666_0'0 k in
                                                  u_33 u_258 k in
                                                u_26 lam_661_0'0 k in
                                            app_472_56'39 u_574 k in
                                          app_473_56'31 command_293_207'4 k in
                                        u_11 lam_474_0'0 k in
                                    app_357_56'39 u_435 k in
                                  app_358_56'31 command_293_207'4 k in
                                u_11 lam_359_0'0 k in
                            app_242_56'39 u_296 k in
                          app_243_56'31 command_293_207'4 k in
                        u_11 lam_244_0'0 k in
                    app_236_201'10 u_258 k in
                  app_237_201'7 con_239_201'10 k in
                u_291 con_238_201'7 k in
            app_201_56'39 u_72 k in
          app_202_56'31 u_258 k in
        u_11 lam_203_0'0 k in
      u_257 con_199_119'7 k in
    u_52 con_53_214'13 k) in
  let u_856 = Unit0 in
  let u_857 = "This is a shell prototype. Try: fib, fact, rev\n" in
  let prim_697_0'0 = PRIM_Explode(u_857) in
  let k [u_855] u_858 =
    let con_698_221'11 = Unit0 in
    u_855 con_698_221'11 k in
  u_52 prim_697_0'0 k in
uLET_50_0'0 con_52_166'31 k
