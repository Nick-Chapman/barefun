(*stage1*)
let eq_list_11_47'8 =
  fix (fun eq_list_2_47'8 eq_1_47'16 ->
    (fun xs_3_47'19 ->
      (fun ys_4_47'22 ->
        match xs_3_47'19 with
        | Nil0 ->
          match ys_4_47'22 with
          | Nil0 -> true1
          | Cons1(__5_49'40,__6_49'43) -> false0
        | Cons1(x_7_50'4,xs_8_50'7) ->
          match ys_4_47'22 with
          | Nil0 -> false0
          | Cons1(y_9_53'7,ys_10_53'10) ->
            match ((eq_1_47'16 x_7_50'4) y_9_53'7) with
            | true1 -> (((eq_list_2_47'8 eq_1_47'16) xs_8_50'7) ys_10_53'10)
            | false0 -> false0))) in
let append_18_58'8 =
  fix (fun append_13_58'8 xs_12_58'15 ->
    (fun ys_14_58'18 ->
      match xs_12_58'15 with
      | Nil0 -> ys_14_58'18
      | Cons1(x_15_61'4,xs_16_61'7) ->
        let xs_17_45'11 = ((append_13_58'8 xs_16_61'7) ys_14_58'18) in
        Cons1(x_15_61'4, xs_17_45'11))) in
let map_26_71'8 =
  fix (fun map_20_71'8 f_19_71'12 ->
    (fun xs_21_71'14 ->
      match xs_21_71'14 with
      | Nil0 -> Nil0
      | Cons1(x_22_74'4,xs_23_74'7) ->
        (let x_24_0'0 = (f_19_71'12 x_22_74'4) in
        (fun y_25_0'0 -> Cons1(x_24_0'0, y_25_0'0))
        ((map_20_71'8 f_19_71'12) xs_23_74'7)))) in
let length_33_76'8 =
  fix (fun length_28_76'8 xs_27_76'15 ->
    match xs_27_76'15 with
    | Nil0 -> 0
    | Cons1(__29_79'4,xs_30_79'7) ->
      (let x_31_0'0 = 1 in
      (fun y_32_0'0 -> PRIM_AddInt(x_31_0'0,y_32_0'0))
      (length_28_76'8 xs_30_79'7))) in
let put_chars_52_90'8 =
  fix (fun put_chars_35_90'8 xs_34_90'18 ->
    match xs_34_90'18 with
    | Nil0 -> Unit0
    | Cons1(x_36_93'4,xs_37_93'7) ->
      let __51_93'23 =
        let backspace_38_13'6 = 8 in
        let n_39_14'6 = PRIM_CharOrd(x_36_93'4) in
        match PRIM_EqInt(n_39_14'6,backspace_38_13'6) with
        | true1 -> PRIM_PutChar(x_36_93'4)
        | false0 ->
          match let y_40_0'0 = '\n' in
          PRIM_EqChar(x_36_93'4,y_40_0'0) with
          | true1 -> PRIM_PutChar(x_36_93'4)
          | false0 ->
            match let b_41_7'10 = 26 in
            PRIM_LessInt(b_41_7'10,n_39_14'6) with
            | true1 -> PRIM_PutChar(x_36_93'4)
            | false0 ->
              let __43_18'21 =
                let x_42_0'0 = '^' in
                PRIM_PutChar(x_42_0'0) in
              let x_50_0'0 =
                let x_49_0'0 =
                  (let x_47_0'0 =
                    (let x_45_0'0 =
                      let x_44_0'0 = 'A' in
                      PRIM_CharOrd(x_44_0'0) in
                    (fun y_46_0'0 -> PRIM_AddInt(x_45_0'0,y_46_0'0))
                    n_39_14'6) in
                  (fun y_48_0'0 -> PRIM_SubInt(x_47_0'0,y_48_0'0))
                  1) in
                PRIM_CharChr(x_49_0'0) in
              PRIM_PutChar(x_50_0'0) in
      (put_chars_35_90'8 xs_37_93'7)) in
let fib_60_121'8 =
  fix (fun fib_54_121'8 n_53_121'12 ->
    match let y_55_0'0 = 2 in
    PRIM_LessInt(n_53_121'12,y_55_0'0) with
    | true1 -> n_53_121'12
    | false0 ->
      (let x_57_0'0 =
        (fib_54_121'8
        let y_56_0'0 = 1 in
        PRIM_SubInt(n_53_121'12,y_56_0'0)) in
      (fun y_58_0'0 -> PRIM_AddInt(x_57_0'0,y_58_0'0))
      (fib_54_121'8
      let y_59_0'0 = 2 in
      PRIM_SubInt(n_53_121'12,y_59_0'0)))) in
let fact_68_125'8 =
  fix (fun fact_62_125'8 n_61_125'13 ->
    match let b_63_9'11 = 2 in
    let b_64_2'8 = PRIM_LessInt(n_61_125'13,b_63_9'11) in
    match b_64_2'8 with
    | true1 -> false0
    | false0 -> true1 with
    | true1 ->
      (let x_66_0'0 =
        (fact_62_125'8
        let y_65_0'0 = 1 in
        PRIM_SubInt(n_61_125'13,y_65_0'0)) in
      (fun y_67_0'0 -> PRIM_MulInt(x_66_0'0,y_67_0'0))
      n_61_125'13)
    | false0 -> 1) in
let single_controlD_72_166'4 =
  (let x_70_0'0 =
    let x_69_0'0 = 4 in
    PRIM_CharChr(x_69_0'0) in
  (fun y_71_0'0 -> Cons1(x_70_0'0, y_71_0'0))
  Nil0) in
let mainloop_855_213'8 =
  fix (fun mainloop_74_213'8 __73_213'17 ->
    let __75_214'21 = (put_chars_52_90'8 Cons1('>', Cons1(' ', Nil0))) in
    let xs_258_215'6 =
      let __76_101'14 = Unit0 in
      let controlD_78_102'6 =
        let x_77_0'0 = 4 in
        PRIM_CharChr(x_77_0'0) in
      let loop_257_103'10 =
        fix (fun loop_80_103'10 acc_79_103'15 ->
          let c_82_104'8 =
            let x_81_0'0 = Unit0 in
            PRIM_GetChar(x_81_0'0) in
          let n_83_105'8 = PRIM_CharOrd(c_82_104'8) in
          match let y_84_0'0 = '\n' in
          PRIM_EqChar(c_82_104'8,y_84_0'0) with
          | true1 ->
            let __100_106'37 =
              let __85_99'12 = Unit0 in
              let c_86_12'13 = '\n' in
              let backspace_87_13'6 = 8 in
              let n_88_14'6 = PRIM_CharOrd(c_86_12'13) in
              match PRIM_EqInt(n_88_14'6,backspace_87_13'6) with
              | true1 -> PRIM_PutChar(c_86_12'13)
              | false0 ->
                match let y_89_0'0 = '\n' in
                PRIM_EqChar(c_86_12'13,y_89_0'0) with
                | true1 -> PRIM_PutChar(c_86_12'13)
                | false0 ->
                  match let b_90_7'10 = 26 in
                  PRIM_LessInt(b_90_7'10,n_88_14'6) with
                  | true1 -> PRIM_PutChar(c_86_12'13)
                  | false0 ->
                    let __92_18'21 =
                      let x_91_0'0 = '^' in
                      PRIM_PutChar(x_91_0'0) in
                    let x_99_0'0 =
                      let x_98_0'0 =
                        (let x_96_0'0 =
                          (let x_94_0'0 =
                            let x_93_0'0 = 'A' in
                            PRIM_CharOrd(x_93_0'0) in
                          (fun y_95_0'0 -> PRIM_AddInt(x_94_0'0,y_95_0'0))
                          n_88_14'6) in
                        (fun y_97_0'0 -> PRIM_SubInt(x_96_0'0,y_97_0'0))
                        1) in
                      PRIM_CharChr(x_98_0'0) in
                    PRIM_PutChar(x_99_0'0) in
            let loop_106_64'10 =
              fix (fun loop_102_64'10 acc_101_64'15 ->
                (fun xs_103_64'19 ->
                  match xs_103_64'19 with
                  | Nil0 -> acc_101_64'15
                  | Cons1(x_104_67'6,xs_105_67'9) -> ((loop_102_64'10 Cons1(x_104_67'6, acc_101_64'15)) xs_105_67'9))) in
            ((loop_106_64'10 Nil0) acc_79_103'15)
          | false0 ->
            match PRIM_EqChar(c_82_104'8,controlD_78_102'6) with
            | true1 ->
              let __120_107'44 =
                let backspace_107_13'6 = 8 in
                let n_108_14'6 = PRIM_CharOrd(c_82_104'8) in
                match PRIM_EqInt(n_108_14'6,backspace_107_13'6) with
                | true1 -> PRIM_PutChar(c_82_104'8)
                | false0 ->
                  match let y_109_0'0 = '\n' in
                  PRIM_EqChar(c_82_104'8,y_109_0'0) with
                  | true1 -> PRIM_PutChar(c_82_104'8)
                  | false0 ->
                    match let b_110_7'10 = 26 in
                    PRIM_LessInt(b_110_7'10,n_108_14'6) with
                    | true1 -> PRIM_PutChar(c_82_104'8)
                    | false0 ->
                      let __112_18'21 =
                        let x_111_0'0 = '^' in
                        PRIM_PutChar(x_111_0'0) in
                      let x_119_0'0 =
                        let x_118_0'0 =
                          (let x_116_0'0 =
                            (let x_114_0'0 =
                              let x_113_0'0 = 'A' in
                              PRIM_CharOrd(x_113_0'0) in
                            (fun y_115_0'0 -> PRIM_AddInt(x_114_0'0,y_115_0'0))
                            n_108_14'6) in
                          (fun y_117_0'0 -> PRIM_SubInt(x_116_0'0,y_117_0'0))
                          1) in
                        PRIM_CharChr(x_118_0'0) in
                      PRIM_PutChar(x_119_0'0) in
              let __136_107'55 =
                let __121_99'12 = Unit0 in
                let c_122_12'13 = '\n' in
                let backspace_123_13'6 = 8 in
                let n_124_14'6 = PRIM_CharOrd(c_122_12'13) in
                match PRIM_EqInt(n_124_14'6,backspace_123_13'6) with
                | true1 -> PRIM_PutChar(c_122_12'13)
                | false0 ->
                  match let y_125_0'0 = '\n' in
                  PRIM_EqChar(c_122_12'13,y_125_0'0) with
                  | true1 -> PRIM_PutChar(c_122_12'13)
                  | false0 ->
                    match let b_126_7'10 = 26 in
                    PRIM_LessInt(b_126_7'10,n_124_14'6) with
                    | true1 -> PRIM_PutChar(c_122_12'13)
                    | false0 ->
                      let __128_18'21 =
                        let x_127_0'0 = '^' in
                        PRIM_PutChar(x_127_0'0) in
                      let x_135_0'0 =
                        let x_134_0'0 =
                          (let x_132_0'0 =
                            (let x_130_0'0 =
                              let x_129_0'0 = 'A' in
                              PRIM_CharOrd(x_129_0'0) in
                            (fun y_131_0'0 -> PRIM_AddInt(x_130_0'0,y_131_0'0))
                            n_124_14'6) in
                          (fun y_133_0'0 -> PRIM_SubInt(x_132_0'0,y_133_0'0))
                          1) in
                        PRIM_CharChr(x_134_0'0) in
                      PRIM_PutChar(x_135_0'0) in
              let xs_137_63'12 = Cons1(controlD_78_102'6, acc_79_103'15) in
              let loop_143_64'10 =
                fix (fun loop_139_64'10 acc_138_64'15 ->
                  (fun xs_140_64'19 ->
                    match xs_140_64'19 with
                    | Nil0 -> acc_138_64'15
                    | Cons1(x_141_67'6,xs_142_67'9) -> ((loop_139_64'10 Cons1(x_141_67'6, acc_138_64'15)) xs_142_67'9))) in
              ((loop_143_64'10 Nil0) xs_137_63'12)
            | false0 ->
              match let b_144_7'10 = 127 in
              PRIM_LessInt(b_144_7'10,n_83_105'8) with
              | true1 -> (loop_80_103'10 acc_79_103'15)
              | false0 ->
                match let y_145_0'0 = 127 in
                PRIM_EqInt(n_83_105'8,y_145_0'0) with
                | true1 ->
                  match acc_79_103'15 with
                  | Nil0 -> (loop_80_103'10 acc_79_103'15)
                  | Cons1(c_146_112'14,tail_147_112'17) ->
                    let __196_113'58 =
                      match (let a_148_8'9 = PRIM_CharOrd(c_146_112'14) in
                      (fun b_149_8'11 ->
                        let b_150_2'8 = PRIM_LessInt(b_149_8'11,a_148_8'9) in
                        match b_150_2'8 with
                        | true1 -> false0
                        | false0 -> true1)
                      26) with
                      | true1 ->
                        let __151_20'15 = Unit0 in
                        let backspace_153_21'6 =
                          let x_152_0'0 = 8 in
                          PRIM_CharChr(x_152_0'0) in
                        let __167_23'20 =
                          let backspace_154_13'6 = 8 in
                          let n_155_14'6 = PRIM_CharOrd(backspace_153_21'6) in
                          match PRIM_EqInt(n_155_14'6,backspace_154_13'6) with
                          | true1 -> PRIM_PutChar(backspace_153_21'6)
                          | false0 ->
                            match let y_156_0'0 = '\n' in
                            PRIM_EqChar(backspace_153_21'6,y_156_0'0) with
                            | true1 -> PRIM_PutChar(backspace_153_21'6)
                            | false0 ->
                              match let b_157_7'10 = 26 in
                              PRIM_LessInt(b_157_7'10,n_155_14'6) with
                              | true1 -> PRIM_PutChar(backspace_153_21'6)
                              | false0 ->
                                let __159_18'21 =
                                  let x_158_0'0 = '^' in
                                  PRIM_PutChar(x_158_0'0) in
                                let x_166_0'0 =
                                  let x_165_0'0 =
                                    (let x_163_0'0 =
                                      (let x_161_0'0 =
                                        let x_160_0'0 = 'A' in
                                        PRIM_CharOrd(x_160_0'0) in
                                      (fun y_162_0'0 -> PRIM_AddInt(x_161_0'0,y_162_0'0))
                                      n_155_14'6) in
                                    (fun y_164_0'0 -> PRIM_SubInt(x_163_0'0,y_164_0'0))
                                    1) in
                                  PRIM_CharChr(x_165_0'0) in
                                PRIM_PutChar(x_166_0'0) in
                        let __182_24'14 =
                          let c_168_12'13 = ' ' in
                          let backspace_169_13'6 = 8 in
                          let n_170_14'6 = PRIM_CharOrd(c_168_12'13) in
                          match PRIM_EqInt(n_170_14'6,backspace_169_13'6) with
                          | true1 -> PRIM_PutChar(c_168_12'13)
                          | false0 ->
                            match let y_171_0'0 = '\n' in
                            PRIM_EqChar(c_168_12'13,y_171_0'0) with
                            | true1 -> PRIM_PutChar(c_168_12'13)
                            | false0 ->
                              match let b_172_7'10 = 26 in
                              PRIM_LessInt(b_172_7'10,n_170_14'6) with
                              | true1 -> PRIM_PutChar(c_168_12'13)
                              | false0 ->
                                let __174_18'21 =
                                  let x_173_0'0 = '^' in
                                  PRIM_PutChar(x_173_0'0) in
                                let x_181_0'0 =
                                  let x_180_0'0 =
                                    (let x_178_0'0 =
                                      (let x_176_0'0 =
                                        let x_175_0'0 = 'A' in
                                        PRIM_CharOrd(x_175_0'0) in
                                      (fun y_177_0'0 -> PRIM_AddInt(x_176_0'0,y_177_0'0))
                                      n_170_14'6) in
                                    (fun y_179_0'0 -> PRIM_SubInt(x_178_0'0,y_179_0'0))
                                    1) in
                                  PRIM_CharChr(x_180_0'0) in
                                PRIM_PutChar(x_181_0'0) in
                        let backspace_183_13'6 = 8 in
                        let n_184_14'6 = PRIM_CharOrd(backspace_153_21'6) in
                        match PRIM_EqInt(n_184_14'6,backspace_183_13'6) with
                        | true1 -> PRIM_PutChar(backspace_153_21'6)
                        | false0 ->
                          match let y_185_0'0 = '\n' in
                          PRIM_EqChar(backspace_153_21'6,y_185_0'0) with
                          | true1 -> PRIM_PutChar(backspace_153_21'6)
                          | false0 ->
                            match let b_186_7'10 = 26 in
                            PRIM_LessInt(b_186_7'10,n_184_14'6) with
                            | true1 -> PRIM_PutChar(backspace_153_21'6)
                            | false0 ->
                              let __188_18'21 =
                                let x_187_0'0 = '^' in
                                PRIM_PutChar(x_187_0'0) in
                              let x_195_0'0 =
                                let x_194_0'0 =
                                  (let x_192_0'0 =
                                    (let x_190_0'0 =
                                      let x_189_0'0 = 'A' in
                                      PRIM_CharOrd(x_189_0'0) in
                                    (fun y_191_0'0 -> PRIM_AddInt(x_190_0'0,y_191_0'0))
                                    n_184_14'6) in
                                  (fun y_193_0'0 -> PRIM_SubInt(x_192_0'0,y_193_0'0))
                                  1) in
                                PRIM_CharChr(x_194_0'0) in
                              PRIM_PutChar(x_195_0'0)
                      | false0 -> Unit0 in
                    let __242_114'27 =
                      let __197_20'15 = Unit0 in
                      let backspace_199_21'6 =
                        let x_198_0'0 = 8 in
                        PRIM_CharChr(x_198_0'0) in
                      let __213_23'20 =
                        let backspace_200_13'6 = 8 in
                        let n_201_14'6 = PRIM_CharOrd(backspace_199_21'6) in
                        match PRIM_EqInt(n_201_14'6,backspace_200_13'6) with
                        | true1 -> PRIM_PutChar(backspace_199_21'6)
                        | false0 ->
                          match let y_202_0'0 = '\n' in
                          PRIM_EqChar(backspace_199_21'6,y_202_0'0) with
                          | true1 -> PRIM_PutChar(backspace_199_21'6)
                          | false0 ->
                            match let b_203_7'10 = 26 in
                            PRIM_LessInt(b_203_7'10,n_201_14'6) with
                            | true1 -> PRIM_PutChar(backspace_199_21'6)
                            | false0 ->
                              let __205_18'21 =
                                let x_204_0'0 = '^' in
                                PRIM_PutChar(x_204_0'0) in
                              let x_212_0'0 =
                                let x_211_0'0 =
                                  (let x_209_0'0 =
                                    (let x_207_0'0 =
                                      let x_206_0'0 = 'A' in
                                      PRIM_CharOrd(x_206_0'0) in
                                    (fun y_208_0'0 -> PRIM_AddInt(x_207_0'0,y_208_0'0))
                                    n_201_14'6) in
                                  (fun y_210_0'0 -> PRIM_SubInt(x_209_0'0,y_210_0'0))
                                  1) in
                                PRIM_CharChr(x_211_0'0) in
                              PRIM_PutChar(x_212_0'0) in
                      let __228_24'14 =
                        let c_214_12'13 = ' ' in
                        let backspace_215_13'6 = 8 in
                        let n_216_14'6 = PRIM_CharOrd(c_214_12'13) in
                        match PRIM_EqInt(n_216_14'6,backspace_215_13'6) with
                        | true1 -> PRIM_PutChar(c_214_12'13)
                        | false0 ->
                          match let y_217_0'0 = '\n' in
                          PRIM_EqChar(c_214_12'13,y_217_0'0) with
                          | true1 -> PRIM_PutChar(c_214_12'13)
                          | false0 ->
                            match let b_218_7'10 = 26 in
                            PRIM_LessInt(b_218_7'10,n_216_14'6) with
                            | true1 -> PRIM_PutChar(c_214_12'13)
                            | false0 ->
                              let __220_18'21 =
                                let x_219_0'0 = '^' in
                                PRIM_PutChar(x_219_0'0) in
                              let x_227_0'0 =
                                let x_226_0'0 =
                                  (let x_224_0'0 =
                                    (let x_222_0'0 =
                                      let x_221_0'0 = 'A' in
                                      PRIM_CharOrd(x_221_0'0) in
                                    (fun y_223_0'0 -> PRIM_AddInt(x_222_0'0,y_223_0'0))
                                    n_216_14'6) in
                                  (fun y_225_0'0 -> PRIM_SubInt(x_224_0'0,y_225_0'0))
                                  1) in
                                PRIM_CharChr(x_226_0'0) in
                              PRIM_PutChar(x_227_0'0) in
                      let backspace_229_13'6 = 8 in
                      let n_230_14'6 = PRIM_CharOrd(backspace_199_21'6) in
                      match PRIM_EqInt(n_230_14'6,backspace_229_13'6) with
                      | true1 -> PRIM_PutChar(backspace_199_21'6)
                      | false0 ->
                        match let y_231_0'0 = '\n' in
                        PRIM_EqChar(backspace_199_21'6,y_231_0'0) with
                        | true1 -> PRIM_PutChar(backspace_199_21'6)
                        | false0 ->
                          match let b_232_7'10 = 26 in
                          PRIM_LessInt(b_232_7'10,n_230_14'6) with
                          | true1 -> PRIM_PutChar(backspace_199_21'6)
                          | false0 ->
                            let __234_18'21 =
                              let x_233_0'0 = '^' in
                              PRIM_PutChar(x_233_0'0) in
                            let x_241_0'0 =
                              let x_240_0'0 =
                                (let x_238_0'0 =
                                  (let x_236_0'0 =
                                    let x_235_0'0 = 'A' in
                                    PRIM_CharOrd(x_235_0'0) in
                                  (fun y_237_0'0 -> PRIM_AddInt(x_236_0'0,y_237_0'0))
                                  n_230_14'6) in
                                (fun y_239_0'0 -> PRIM_SubInt(x_238_0'0,y_239_0'0))
                                1) in
                              PRIM_CharChr(x_240_0'0) in
                            PRIM_PutChar(x_241_0'0) in
                    (loop_80_103'10 tail_147_112'17)
                | false0 ->
                  let __256_117'23 =
                    let backspace_243_13'6 = 8 in
                    let n_244_14'6 = PRIM_CharOrd(c_82_104'8) in
                    match PRIM_EqInt(n_244_14'6,backspace_243_13'6) with
                    | true1 -> PRIM_PutChar(c_82_104'8)
                    | false0 ->
                      match let y_245_0'0 = '\n' in
                      PRIM_EqChar(c_82_104'8,y_245_0'0) with
                      | true1 -> PRIM_PutChar(c_82_104'8)
                      | false0 ->
                        match let b_246_7'10 = 26 in
                        PRIM_LessInt(b_246_7'10,n_244_14'6) with
                        | true1 -> PRIM_PutChar(c_82_104'8)
                        | false0 ->
                          let __248_18'21 =
                            let x_247_0'0 = '^' in
                            PRIM_PutChar(x_247_0'0) in
                          let x_255_0'0 =
                            let x_254_0'0 =
                              (let x_252_0'0 =
                                (let x_250_0'0 =
                                  let x_249_0'0 = 'A' in
                                  PRIM_CharOrd(x_249_0'0) in
                                (fun y_251_0'0 -> PRIM_AddInt(x_250_0'0,y_251_0'0))
                                n_244_14'6) in
                              (fun y_253_0'0 -> PRIM_SubInt(x_252_0'0,y_253_0'0))
                              1) in
                            PRIM_CharChr(x_254_0'0) in
                          PRIM_PutChar(x_255_0'0) in
                  (loop_80_103'10 Cons1(c_82_104'8, acc_79_103'15))) in
      (loop_257_103'10 Nil0) in
    match (((eq_list_11_47'8 (fun x_259_0'0 -> (fun y_260_0'0 -> PRIM_EqChar(x_259_0'0,y_260_0'0)))) xs_258_215'6) single_controlD_72_166'4) with
    | true1 -> Unit0
    | false0 ->
      let __854_217'15 =
        let words_292_204'6 =
          let loop_291_193'10 =
            fix (fun loop_262_193'10 accWs_261_193'15 ->
              (fun accCs_263_193'21 ->
                (fun xs_264_193'27 ->
                  match xs_264_193'27 with
                  | Nil0 ->
                    let xs_273_63'12 =
                      (let x_271_0'0 =
                        let loop_270_64'10 =
                          fix (fun loop_266_64'10 acc_265_64'15 ->
                            (fun xs_267_64'19 ->
                              match xs_267_64'19 with
                              | Nil0 -> acc_265_64'15
                              | Cons1(x_268_67'6,xs_269_67'9) -> ((loop_266_64'10 Cons1(x_268_67'6, acc_265_64'15)) xs_269_67'9))) in
                        ((loop_270_64'10 Nil0) accCs_263_193'21) in
                      (fun y_272_0'0 -> Cons1(x_271_0'0, y_272_0'0))
                      accWs_261_193'15) in
                    let loop_279_64'10 =
                      fix (fun loop_275_64'10 acc_274_64'15 ->
                        (fun xs_276_64'19 ->
                          match xs_276_64'19 with
                          | Nil0 -> acc_274_64'15
                          | Cons1(x_277_67'6,xs_278_67'9) -> ((loop_275_64'10 Cons1(x_277_67'6, acc_274_64'15)) xs_278_67'9))) in
                    ((loop_279_64'10 Nil0) xs_273_63'12)
                  | Cons1(x_280_197'6,xs_281_197'9) ->
                    match let y_282_0'0 = ' ' in
                    PRIM_EqChar(x_280_197'6,y_282_0'0) with
                    | true1 ->
                      (((loop_262_193'10
                      (let x_289_0'0 =
                        let loop_288_64'10 =
                          fix (fun loop_284_64'10 acc_283_64'15 ->
                            (fun xs_285_64'19 ->
                              match xs_285_64'19 with
                              | Nil0 -> acc_283_64'15
                              | Cons1(x_286_67'6,xs_287_67'9) -> ((loop_284_64'10 Cons1(x_286_67'6, acc_283_64'15)) xs_287_67'9))) in
                        ((loop_288_64'10 Nil0) accCs_263_193'21) in
                      (fun y_290_0'0 -> Cons1(x_289_0'0, y_290_0'0))
                      accWs_261_193'15))
                      Nil0)
                      xs_281_197'9)
                    | false0 -> (((loop_262_193'10 accWs_261_193'15) Cons1(x_280_197'6, accCs_263_193'21)) xs_281_197'9)))) in
          (((loop_291_193'10 Nil0) Nil0) xs_258_215'6) in
        match words_292_204'6 with
        | Nil0 -> Unit0
        | Cons1(command_293_207'4,args_294_207'13) ->
          match let b_296_56'19 =
            let x_295_0'0 = "fib" in
            PRIM_Explode(x_295_0'0) in
          (((eq_list_11_47'8 (fun x_297_0'0 -> (fun y_298_0'0 -> PRIM_EqChar(x_297_0'0,y_298_0'0)))) command_293_207'4) b_296_56'19) with
          | true1 ->
            let __300_132'20 =
              let s_299_95'15 = "fib: " in
              (put_chars_52_90'8 PRIM_Explode(s_299_95'15)) in
            match args_294_207'13 with
            | Nil0 ->
              let s_301_129'10 = "expected an argument" in
              let __303_129'34 =
                let s_302_95'15 = "ERROR: " in
                (put_chars_52_90'8 PRIM_Explode(s_302_95'15)) in
              let __304_129'48 = (put_chars_52_90'8 PRIM_Explode(s_301_129'10)) in
              let __305_99'12 = Unit0 in
              let c_306_12'13 = '\n' in
              let backspace_307_13'6 = 8 in
              let n_308_14'6 = PRIM_CharOrd(c_306_12'13) in
              match PRIM_EqInt(n_308_14'6,backspace_307_13'6) with
              | true1 -> PRIM_PutChar(c_306_12'13)
              | false0 ->
                match let y_309_0'0 = '\n' in
                PRIM_EqChar(c_306_12'13,y_309_0'0) with
                | true1 -> PRIM_PutChar(c_306_12'13)
                | false0 ->
                  match let b_310_7'10 = 26 in
                  PRIM_LessInt(b_310_7'10,n_308_14'6) with
                  | true1 -> PRIM_PutChar(c_306_12'13)
                  | false0 ->
                    let __312_18'21 =
                      let x_311_0'0 = '^' in
                      PRIM_PutChar(x_311_0'0) in
                    let x_319_0'0 =
                      let x_318_0'0 =
                        (let x_316_0'0 =
                          (let x_314_0'0 =
                            let x_313_0'0 = 'A' in
                            PRIM_CharOrd(x_313_0'0) in
                          (fun y_315_0'0 -> PRIM_AddInt(x_314_0'0,y_315_0'0))
                          n_308_14'6) in
                        (fun y_317_0'0 -> PRIM_SubInt(x_316_0'0,y_317_0'0))
                        1) in
                      PRIM_CharChr(x_318_0'0) in
                    PRIM_PutChar(x_319_0'0)
            | Cons1(arg1_320_135'4,more_321_135'10) ->
              match more_321_135'10 with
              | Cons1(__322_137'7,__323_137'10) ->
                let s_324_129'10 = "expected exactly one argument" in
                let __326_129'34 =
                  let s_325_95'15 = "ERROR: " in
                  (put_chars_52_90'8 PRIM_Explode(s_325_95'15)) in
                let __327_129'48 = (put_chars_52_90'8 PRIM_Explode(s_324_129'10)) in
                let __328_99'12 = Unit0 in
                let c_329_12'13 = '\n' in
                let backspace_330_13'6 = 8 in
                let n_331_14'6 = PRIM_CharOrd(c_329_12'13) in
                match PRIM_EqInt(n_331_14'6,backspace_330_13'6) with
                | true1 -> PRIM_PutChar(c_329_12'13)
                | false0 ->
                  match let y_332_0'0 = '\n' in
                  PRIM_EqChar(c_329_12'13,y_332_0'0) with
                  | true1 -> PRIM_PutChar(c_329_12'13)
                  | false0 ->
                    match let b_333_7'10 = 26 in
                    PRIM_LessInt(b_333_7'10,n_331_14'6) with
                    | true1 -> PRIM_PutChar(c_329_12'13)
                    | false0 ->
                      let __335_18'21 =
                        let x_334_0'0 = '^' in
                        PRIM_PutChar(x_334_0'0) in
                      let x_342_0'0 =
                        let x_341_0'0 =
                          (let x_339_0'0 =
                            (let x_337_0'0 =
                              let x_336_0'0 = 'A' in
                              PRIM_CharOrd(x_336_0'0) in
                            (fun y_338_0'0 -> PRIM_AddInt(x_337_0'0,y_338_0'0))
                            n_331_14'6) in
                          (fun y_340_0'0 -> PRIM_SubInt(x_339_0'0,y_340_0'0))
                          1) in
                        PRIM_CharChr(x_341_0'0) in
                      PRIM_PutChar(x_342_0'0)
              | Nil0 ->
                match let loop_361_35'10 =
                  fix (fun loop_344_35'10 acc_343_35'15 ->
                    (fun xs_345_35'19 ->
                      match xs_345_35'19 with
                      | Nil0 -> Some0(acc_343_35'15)
                      | Cons1(x_346_38'6,xs_347_38'9) ->
                        match let n_351_30'6 =
                          (let x_348_0'0 = PRIM_CharOrd(x_346_38'6) in
                          (fun y_349_0'0 -> PRIM_SubInt(x_348_0'0,y_349_0'0))
                          let x_350_0'0 = '0' in
                          PRIM_CharOrd(x_350_0'0)) in
                        match let b_352_9'11 = 0 in
                        let b_353_2'8 = PRIM_LessInt(n_351_30'6,b_352_9'11) in
                        match b_353_2'8 with
                        | true1 -> false0
                        | false0 -> true1 with
                        | true1 ->
                          match let b_354_8'11 = 9 in
                          let b_355_2'8 = PRIM_LessInt(b_354_8'11,n_351_30'6) in
                          match b_355_2'8 with
                          | true1 -> false0
                          | false0 -> true1 with
                          | true1 -> Some0(n_351_30'6)
                          | false0 -> None1
                        | false0 -> None1 with
                        | None1 -> None1
                        | Some0(d_356_41'15) ->
                          ((loop_344_35'10
                          (let x_359_0'0 =
                            (let x_357_0'0 = 10 in
                            (fun y_358_0'0 -> PRIM_MulInt(x_357_0'0,y_358_0'0))
                            acc_343_35'15) in
                          (fun y_360_0'0 -> PRIM_AddInt(x_359_0'0,y_360_0'0))
                          d_356_41'15))
                          xs_347_38'9))) in
                ((loop_361_35'10 0) arg1_320_135'4) with
                | None1 ->
                  let s_362_129'10 = "expected arg1 to be numeric" in
                  let __364_129'34 =
                    let s_363_95'15 = "ERROR: " in
                    (put_chars_52_90'8 PRIM_Explode(s_363_95'15)) in
                  let __365_129'48 = (put_chars_52_90'8 PRIM_Explode(s_362_129'10)) in
                  let __366_99'12 = Unit0 in
                  let c_367_12'13 = '\n' in
                  let backspace_368_13'6 = 8 in
                  let n_369_14'6 = PRIM_CharOrd(c_367_12'13) in
                  match PRIM_EqInt(n_369_14'6,backspace_368_13'6) with
                  | true1 -> PRIM_PutChar(c_367_12'13)
                  | false0 ->
                    match let y_370_0'0 = '\n' in
                    PRIM_EqChar(c_367_12'13,y_370_0'0) with
                    | true1 -> PRIM_PutChar(c_367_12'13)
                    | false0 ->
                      match let b_371_7'10 = 26 in
                      PRIM_LessInt(b_371_7'10,n_369_14'6) with
                      | true1 -> PRIM_PutChar(c_367_12'13)
                      | false0 ->
                        let __373_18'21 =
                          let x_372_0'0 = '^' in
                          PRIM_PutChar(x_372_0'0) in
                        let x_380_0'0 =
                          let x_379_0'0 =
                            (let x_377_0'0 =
                              (let x_375_0'0 =
                                let x_374_0'0 = 'A' in
                                PRIM_CharOrd(x_374_0'0) in
                              (fun y_376_0'0 -> PRIM_AddInt(x_375_0'0,y_376_0'0))
                              n_369_14'6) in
                            (fun y_378_0'0 -> PRIM_SubInt(x_377_0'0,y_378_0'0))
                            1) in
                          PRIM_CharChr(x_379_0'0) in
                        PRIM_PutChar(x_380_0'0)
                | Some0(n_381_141'15) ->
                  let res_382_142'15 = (fib_60_121'8 n_381_141'15) in
                  let __399_143'20 =
                    (put_chars_52_90'8
                    let ord0_384_82'6 =
                      let x_383_0'0 = '0' in
                      PRIM_CharOrd(x_383_0'0) in
                    let loop_395_84'10 =
                      fix (fun loop_386_84'10 acc_385_84'15 ->
                        (fun i_387_84'19 ->
                          match let y_388_0'0 = 0 in
                          PRIM_EqInt(i_387_84'19,y_388_0'0) with
                          | true1 -> acc_385_84'15
                          | false0 ->
                            ((loop_386_84'10
                            (let x_392_45'9 =
                              let c_390_83'20 =
                                let y_389_0'0 = 10 in
                                PRIM_ModInt(i_387_84'19,y_389_0'0) in
                              let x_391_0'0 = PRIM_AddInt(ord0_384_82'6,c_390_83'20) in
                              PRIM_CharChr(x_391_0'0) in
                            (fun xs_393_45'11 -> Cons1(x_392_45'9, xs_393_45'11))
                            acc_385_84'15))
                            let y_394_0'0 = 10 in
                            PRIM_DivInt(i_387_84'19,y_394_0'0)))) in
                    match let y_396_0'0 = 0 in
                    PRIM_EqInt(n_381_141'15,y_396_0'0) with
                    | true1 ->
                      (let x_397_45'9 = '0' in
                      (fun xs_398_45'11 -> Cons1(x_397_45'9, xs_398_45'11))
                      Nil0)
                    | false0 -> ((loop_395_84'10 Nil0) n_381_141'15)) in
                  let __401_144'29 =
                    let s_400_95'15 = " --> " in
                    (put_chars_52_90'8 PRIM_Explode(s_400_95'15)) in
                  let __418_145'22 =
                    (put_chars_52_90'8
                    let ord0_403_82'6 =
                      let x_402_0'0 = '0' in
                      PRIM_CharOrd(x_402_0'0) in
                    let loop_414_84'10 =
                      fix (fun loop_405_84'10 acc_404_84'15 ->
                        (fun i_406_84'19 ->
                          match let y_407_0'0 = 0 in
                          PRIM_EqInt(i_406_84'19,y_407_0'0) with
                          | true1 -> acc_404_84'15
                          | false0 ->
                            ((loop_405_84'10
                            (let x_411_45'9 =
                              let c_409_83'20 =
                                let y_408_0'0 = 10 in
                                PRIM_ModInt(i_406_84'19,y_408_0'0) in
                              let x_410_0'0 = PRIM_AddInt(ord0_403_82'6,c_409_83'20) in
                              PRIM_CharChr(x_410_0'0) in
                            (fun xs_412_45'11 -> Cons1(x_411_45'9, xs_412_45'11))
                            acc_404_84'15))
                            let y_413_0'0 = 10 in
                            PRIM_DivInt(i_406_84'19,y_413_0'0)))) in
                    match let y_415_0'0 = 0 in
                    PRIM_EqInt(res_382_142'15,y_415_0'0) with
                    | true1 ->
                      (let x_416_45'9 = '0' in
                      (fun xs_417_45'11 -> Cons1(x_416_45'9, xs_417_45'11))
                      Nil0)
                    | false0 -> ((loop_414_84'10 Nil0) res_382_142'15)) in
                  let __419_99'12 = Unit0 in
                  let c_420_12'13 = '\n' in
                  let backspace_421_13'6 = 8 in
                  let n_422_14'6 = PRIM_CharOrd(c_420_12'13) in
                  match PRIM_EqInt(n_422_14'6,backspace_421_13'6) with
                  | true1 -> PRIM_PutChar(c_420_12'13)
                  | false0 ->
                    match let y_423_0'0 = '\n' in
                    PRIM_EqChar(c_420_12'13,y_423_0'0) with
                    | true1 -> PRIM_PutChar(c_420_12'13)
                    | false0 ->
                      match let b_424_7'10 = 26 in
                      PRIM_LessInt(b_424_7'10,n_422_14'6) with
                      | true1 -> PRIM_PutChar(c_420_12'13)
                      | false0 ->
                        let __426_18'21 =
                          let x_425_0'0 = '^' in
                          PRIM_PutChar(x_425_0'0) in
                        let x_433_0'0 =
                          let x_432_0'0 =
                            (let x_430_0'0 =
                              (let x_428_0'0 =
                                let x_427_0'0 = 'A' in
                                PRIM_CharOrd(x_427_0'0) in
                              (fun y_429_0'0 -> PRIM_AddInt(x_428_0'0,y_429_0'0))
                              n_422_14'6) in
                            (fun y_431_0'0 -> PRIM_SubInt(x_430_0'0,y_431_0'0))
                            1) in
                          PRIM_CharChr(x_432_0'0) in
                        PRIM_PutChar(x_433_0'0)
          | false0 ->
            match let b_435_56'19 =
              let x_434_0'0 = "fact" in
              PRIM_Explode(x_434_0'0) in
            (((eq_list_11_47'8 (fun x_436_0'0 -> (fun y_437_0'0 -> PRIM_EqChar(x_436_0'0,y_437_0'0)))) command_293_207'4) b_435_56'19) with
            | true1 ->
              let __439_149'21 =
                let s_438_95'15 = "fact: " in
                (put_chars_52_90'8 PRIM_Explode(s_438_95'15)) in
              match args_294_207'13 with
              | Nil0 ->
                let s_440_129'10 = "expected an argument" in
                let __442_129'34 =
                  let s_441_95'15 = "ERROR: " in
                  (put_chars_52_90'8 PRIM_Explode(s_441_95'15)) in
                let __443_129'48 = (put_chars_52_90'8 PRIM_Explode(s_440_129'10)) in
                let __444_99'12 = Unit0 in
                let c_445_12'13 = '\n' in
                let backspace_446_13'6 = 8 in
                let n_447_14'6 = PRIM_CharOrd(c_445_12'13) in
                match PRIM_EqInt(n_447_14'6,backspace_446_13'6) with
                | true1 -> PRIM_PutChar(c_445_12'13)
                | false0 ->
                  match let y_448_0'0 = '\n' in
                  PRIM_EqChar(c_445_12'13,y_448_0'0) with
                  | true1 -> PRIM_PutChar(c_445_12'13)
                  | false0 ->
                    match let b_449_7'10 = 26 in
                    PRIM_LessInt(b_449_7'10,n_447_14'6) with
                    | true1 -> PRIM_PutChar(c_445_12'13)
                    | false0 ->
                      let __451_18'21 =
                        let x_450_0'0 = '^' in
                        PRIM_PutChar(x_450_0'0) in
                      let x_458_0'0 =
                        let x_457_0'0 =
                          (let x_455_0'0 =
                            (let x_453_0'0 =
                              let x_452_0'0 = 'A' in
                              PRIM_CharOrd(x_452_0'0) in
                            (fun y_454_0'0 -> PRIM_AddInt(x_453_0'0,y_454_0'0))
                            n_447_14'6) in
                          (fun y_456_0'0 -> PRIM_SubInt(x_455_0'0,y_456_0'0))
                          1) in
                        PRIM_CharChr(x_457_0'0) in
                      PRIM_PutChar(x_458_0'0)
              | Cons1(arg1_459_152'4,more_460_152'10) ->
                match more_460_152'10 with
                | Cons1(__461_154'7,__462_154'10) ->
                  let s_463_129'10 = "expected exactly one argument" in
                  let __465_129'34 =
                    let s_464_95'15 = "ERROR: " in
                    (put_chars_52_90'8 PRIM_Explode(s_464_95'15)) in
                  let __466_129'48 = (put_chars_52_90'8 PRIM_Explode(s_463_129'10)) in
                  let __467_99'12 = Unit0 in
                  let c_468_12'13 = '\n' in
                  let backspace_469_13'6 = 8 in
                  let n_470_14'6 = PRIM_CharOrd(c_468_12'13) in
                  match PRIM_EqInt(n_470_14'6,backspace_469_13'6) with
                  | true1 -> PRIM_PutChar(c_468_12'13)
                  | false0 ->
                    match let y_471_0'0 = '\n' in
                    PRIM_EqChar(c_468_12'13,y_471_0'0) with
                    | true1 -> PRIM_PutChar(c_468_12'13)
                    | false0 ->
                      match let b_472_7'10 = 26 in
                      PRIM_LessInt(b_472_7'10,n_470_14'6) with
                      | true1 -> PRIM_PutChar(c_468_12'13)
                      | false0 ->
                        let __474_18'21 =
                          let x_473_0'0 = '^' in
                          PRIM_PutChar(x_473_0'0) in
                        let x_481_0'0 =
                          let x_480_0'0 =
                            (let x_478_0'0 =
                              (let x_476_0'0 =
                                let x_475_0'0 = 'A' in
                                PRIM_CharOrd(x_475_0'0) in
                              (fun y_477_0'0 -> PRIM_AddInt(x_476_0'0,y_477_0'0))
                              n_470_14'6) in
                            (fun y_479_0'0 -> PRIM_SubInt(x_478_0'0,y_479_0'0))
                            1) in
                          PRIM_CharChr(x_480_0'0) in
                        PRIM_PutChar(x_481_0'0)
                | Nil0 ->
                  match let loop_500_35'10 =
                    fix (fun loop_483_35'10 acc_482_35'15 ->
                      (fun xs_484_35'19 ->
                        match xs_484_35'19 with
                        | Nil0 -> Some0(acc_482_35'15)
                        | Cons1(x_485_38'6,xs_486_38'9) ->
                          match let n_490_30'6 =
                            (let x_487_0'0 = PRIM_CharOrd(x_485_38'6) in
                            (fun y_488_0'0 -> PRIM_SubInt(x_487_0'0,y_488_0'0))
                            let x_489_0'0 = '0' in
                            PRIM_CharOrd(x_489_0'0)) in
                          match let b_491_9'11 = 0 in
                          let b_492_2'8 = PRIM_LessInt(n_490_30'6,b_491_9'11) in
                          match b_492_2'8 with
                          | true1 -> false0
                          | false0 -> true1 with
                          | true1 ->
                            match let b_493_8'11 = 9 in
                            let b_494_2'8 = PRIM_LessInt(b_493_8'11,n_490_30'6) in
                            match b_494_2'8 with
                            | true1 -> false0
                            | false0 -> true1 with
                            | true1 -> Some0(n_490_30'6)
                            | false0 -> None1
                          | false0 -> None1 with
                          | None1 -> None1
                          | Some0(d_495_41'15) ->
                            ((loop_483_35'10
                            (let x_498_0'0 =
                              (let x_496_0'0 = 10 in
                              (fun y_497_0'0 -> PRIM_MulInt(x_496_0'0,y_497_0'0))
                              acc_482_35'15) in
                            (fun y_499_0'0 -> PRIM_AddInt(x_498_0'0,y_499_0'0))
                            d_495_41'15))
                            xs_486_38'9))) in
                  ((loop_500_35'10 0) arg1_459_152'4) with
                  | None1 ->
                    let s_501_129'10 = "expected arg1 to be numeric" in
                    let __503_129'34 =
                      let s_502_95'15 = "ERROR: " in
                      (put_chars_52_90'8 PRIM_Explode(s_502_95'15)) in
                    let __504_129'48 = (put_chars_52_90'8 PRIM_Explode(s_501_129'10)) in
                    let __505_99'12 = Unit0 in
                    let c_506_12'13 = '\n' in
                    let backspace_507_13'6 = 8 in
                    let n_508_14'6 = PRIM_CharOrd(c_506_12'13) in
                    match PRIM_EqInt(n_508_14'6,backspace_507_13'6) with
                    | true1 -> PRIM_PutChar(c_506_12'13)
                    | false0 ->
                      match let y_509_0'0 = '\n' in
                      PRIM_EqChar(c_506_12'13,y_509_0'0) with
                      | true1 -> PRIM_PutChar(c_506_12'13)
                      | false0 ->
                        match let b_510_7'10 = 26 in
                        PRIM_LessInt(b_510_7'10,n_508_14'6) with
                        | true1 -> PRIM_PutChar(c_506_12'13)
                        | false0 ->
                          let __512_18'21 =
                            let x_511_0'0 = '^' in
                            PRIM_PutChar(x_511_0'0) in
                          let x_519_0'0 =
                            let x_518_0'0 =
                              (let x_516_0'0 =
                                (let x_514_0'0 =
                                  let x_513_0'0 = 'A' in
                                  PRIM_CharOrd(x_513_0'0) in
                                (fun y_515_0'0 -> PRIM_AddInt(x_514_0'0,y_515_0'0))
                                n_508_14'6) in
                              (fun y_517_0'0 -> PRIM_SubInt(x_516_0'0,y_517_0'0))
                              1) in
                            PRIM_CharChr(x_518_0'0) in
                          PRIM_PutChar(x_519_0'0)
                  | Some0(n_520_158'15) ->
                    let res_521_159'15 = (fact_68_125'8 n_520_158'15) in
                    let __538_160'20 =
                      (put_chars_52_90'8
                      let ord0_523_82'6 =
                        let x_522_0'0 = '0' in
                        PRIM_CharOrd(x_522_0'0) in
                      let loop_534_84'10 =
                        fix (fun loop_525_84'10 acc_524_84'15 ->
                          (fun i_526_84'19 ->
                            match let y_527_0'0 = 0 in
                            PRIM_EqInt(i_526_84'19,y_527_0'0) with
                            | true1 -> acc_524_84'15
                            | false0 ->
                              ((loop_525_84'10
                              (let x_531_45'9 =
                                let c_529_83'20 =
                                  let y_528_0'0 = 10 in
                                  PRIM_ModInt(i_526_84'19,y_528_0'0) in
                                let x_530_0'0 = PRIM_AddInt(ord0_523_82'6,c_529_83'20) in
                                PRIM_CharChr(x_530_0'0) in
                              (fun xs_532_45'11 -> Cons1(x_531_45'9, xs_532_45'11))
                              acc_524_84'15))
                              let y_533_0'0 = 10 in
                              PRIM_DivInt(i_526_84'19,y_533_0'0)))) in
                      match let y_535_0'0 = 0 in
                      PRIM_EqInt(n_520_158'15,y_535_0'0) with
                      | true1 ->
                        (let x_536_45'9 = '0' in
                        (fun xs_537_45'11 -> Cons1(x_536_45'9, xs_537_45'11))
                        Nil0)
                      | false0 -> ((loop_534_84'10 Nil0) n_520_158'15)) in
                    let __540_161'29 =
                      let s_539_95'15 = " --> " in
                      (put_chars_52_90'8 PRIM_Explode(s_539_95'15)) in
                    let __557_162'22 =
                      (put_chars_52_90'8
                      let ord0_542_82'6 =
                        let x_541_0'0 = '0' in
                        PRIM_CharOrd(x_541_0'0) in
                      let loop_553_84'10 =
                        fix (fun loop_544_84'10 acc_543_84'15 ->
                          (fun i_545_84'19 ->
                            match let y_546_0'0 = 0 in
                            PRIM_EqInt(i_545_84'19,y_546_0'0) with
                            | true1 -> acc_543_84'15
                            | false0 ->
                              ((loop_544_84'10
                              (let x_550_45'9 =
                                let c_548_83'20 =
                                  let y_547_0'0 = 10 in
                                  PRIM_ModInt(i_545_84'19,y_547_0'0) in
                                let x_549_0'0 = PRIM_AddInt(ord0_542_82'6,c_548_83'20) in
                                PRIM_CharChr(x_549_0'0) in
                              (fun xs_551_45'11 -> Cons1(x_550_45'9, xs_551_45'11))
                              acc_543_84'15))
                              let y_552_0'0 = 10 in
                              PRIM_DivInt(i_545_84'19,y_552_0'0)))) in
                      match let y_554_0'0 = 0 in
                      PRIM_EqInt(res_521_159'15,y_554_0'0) with
                      | true1 ->
                        (let x_555_45'9 = '0' in
                        (fun xs_556_45'11 -> Cons1(x_555_45'9, xs_556_45'11))
                        Nil0)
                      | false0 -> ((loop_553_84'10 Nil0) res_521_159'15)) in
                    let __558_99'12 = Unit0 in
                    let c_559_12'13 = '\n' in
                    let backspace_560_13'6 = 8 in
                    let n_561_14'6 = PRIM_CharOrd(c_559_12'13) in
                    match PRIM_EqInt(n_561_14'6,backspace_560_13'6) with
                    | true1 -> PRIM_PutChar(c_559_12'13)
                    | false0 ->
                      match let y_562_0'0 = '\n' in
                      PRIM_EqChar(c_559_12'13,y_562_0'0) with
                      | true1 -> PRIM_PutChar(c_559_12'13)
                      | false0 ->
                        match let b_563_7'10 = 26 in
                        PRIM_LessInt(b_563_7'10,n_561_14'6) with
                        | true1 -> PRIM_PutChar(c_559_12'13)
                        | false0 ->
                          let __565_18'21 =
                            let x_564_0'0 = '^' in
                            PRIM_PutChar(x_564_0'0) in
                          let x_572_0'0 =
                            let x_571_0'0 =
                              (let x_569_0'0 =
                                (let x_567_0'0 =
                                  let x_566_0'0 = 'A' in
                                  PRIM_CharOrd(x_566_0'0) in
                                (fun y_568_0'0 -> PRIM_AddInt(x_567_0'0,y_568_0'0))
                                n_561_14'6) in
                              (fun y_570_0'0 -> PRIM_SubInt(x_569_0'0,y_570_0'0))
                              1) in
                            PRIM_CharChr(x_571_0'0) in
                          PRIM_PutChar(x_572_0'0)
            | false0 ->
              match let b_574_56'19 =
                let x_573_0'0 = "rev" in
                PRIM_Explode(x_573_0'0) in
              (((eq_list_11_47'8 (fun x_575_0'0 -> (fun y_576_0'0 -> PRIM_EqChar(x_575_0'0,y_576_0'0)))) command_293_207'4) b_574_56'19) with
              | true1 ->
                match args_294_207'13 with
                | Cons1(__577_178'4,__578_178'7) ->
                  let s_579_129'10 = "rev: expected no arguments" in
                  let __581_129'34 =
                    let s_580_95'15 = "ERROR: " in
                    (put_chars_52_90'8 PRIM_Explode(s_580_95'15)) in
                  let __582_129'48 = (put_chars_52_90'8 PRIM_Explode(s_579_129'10)) in
                  let __583_99'12 = Unit0 in
                  let c_584_12'13 = '\n' in
                  let backspace_585_13'6 = 8 in
                  let n_586_14'6 = PRIM_CharOrd(c_584_12'13) in
                  match PRIM_EqInt(n_586_14'6,backspace_585_13'6) with
                  | true1 -> PRIM_PutChar(c_584_12'13)
                  | false0 ->
                    match let y_587_0'0 = '\n' in
                    PRIM_EqChar(c_584_12'13,y_587_0'0) with
                    | true1 -> PRIM_PutChar(c_584_12'13)
                    | false0 ->
                      match let b_588_7'10 = 26 in
                      PRIM_LessInt(b_588_7'10,n_586_14'6) with
                      | true1 -> PRIM_PutChar(c_584_12'13)
                      | false0 ->
                        let __590_18'21 =
                          let x_589_0'0 = '^' in
                          PRIM_PutChar(x_589_0'0) in
                        let x_597_0'0 =
                          let x_596_0'0 =
                            (let x_594_0'0 =
                              (let x_592_0'0 =
                                let x_591_0'0 = 'A' in
                                PRIM_CharOrd(x_591_0'0) in
                              (fun y_593_0'0 -> PRIM_AddInt(x_592_0'0,y_593_0'0))
                              n_586_14'6) in
                            (fun y_595_0'0 -> PRIM_SubInt(x_594_0'0,y_595_0'0))
                            1) in
                          PRIM_CharChr(x_596_0'0) in
                        PRIM_PutChar(x_597_0'0)
                | Nil0 ->
                  let __599_180'50 =
                    let s_598_95'15 = "(reverse typed lines until ^D)\n" in
                    (put_chars_52_90'8 PRIM_Explode(s_598_95'15)) in
                  let __600_168'7 = Unit0 in
                  let loop_811_169'10 =
                    fix (fun loop_602_169'10 __601_169'14 ->
                      let xs_785_170'8 =
                        let __603_101'14 = Unit0 in
                        let controlD_605_102'6 =
                          let x_604_0'0 = 4 in
                          PRIM_CharChr(x_604_0'0) in
                        let loop_784_103'10 =
                          fix (fun loop_607_103'10 acc_606_103'15 ->
                            let c_609_104'8 =
                              let x_608_0'0 = Unit0 in
                              PRIM_GetChar(x_608_0'0) in
                            let n_610_105'8 = PRIM_CharOrd(c_609_104'8) in
                            match let y_611_0'0 = '\n' in
                            PRIM_EqChar(c_609_104'8,y_611_0'0) with
                            | true1 ->
                              let __627_106'37 =
                                let __612_99'12 = Unit0 in
                                let c_613_12'13 = '\n' in
                                let backspace_614_13'6 = 8 in
                                let n_615_14'6 = PRIM_CharOrd(c_613_12'13) in
                                match PRIM_EqInt(n_615_14'6,backspace_614_13'6) with
                                | true1 -> PRIM_PutChar(c_613_12'13)
                                | false0 ->
                                  match let y_616_0'0 = '\n' in
                                  PRIM_EqChar(c_613_12'13,y_616_0'0) with
                                  | true1 -> PRIM_PutChar(c_613_12'13)
                                  | false0 ->
                                    match let b_617_7'10 = 26 in
                                    PRIM_LessInt(b_617_7'10,n_615_14'6) with
                                    | true1 -> PRIM_PutChar(c_613_12'13)
                                    | false0 ->
                                      let __619_18'21 =
                                        let x_618_0'0 = '^' in
                                        PRIM_PutChar(x_618_0'0) in
                                      let x_626_0'0 =
                                        let x_625_0'0 =
                                          (let x_623_0'0 =
                                            (let x_621_0'0 =
                                              let x_620_0'0 = 'A' in
                                              PRIM_CharOrd(x_620_0'0) in
                                            (fun y_622_0'0 -> PRIM_AddInt(x_621_0'0,y_622_0'0))
                                            n_615_14'6) in
                                          (fun y_624_0'0 -> PRIM_SubInt(x_623_0'0,y_624_0'0))
                                          1) in
                                        PRIM_CharChr(x_625_0'0) in
                                      PRIM_PutChar(x_626_0'0) in
                              let loop_633_64'10 =
                                fix (fun loop_629_64'10 acc_628_64'15 ->
                                  (fun xs_630_64'19 ->
                                    match xs_630_64'19 with
                                    | Nil0 -> acc_628_64'15
                                    | Cons1(x_631_67'6,xs_632_67'9) -> ((loop_629_64'10 Cons1(x_631_67'6, acc_628_64'15)) xs_632_67'9))) in
                              ((loop_633_64'10 Nil0) acc_606_103'15)
                            | false0 ->
                              match PRIM_EqChar(c_609_104'8,controlD_605_102'6) with
                              | true1 ->
                                let __647_107'44 =
                                  let backspace_634_13'6 = 8 in
                                  let n_635_14'6 = PRIM_CharOrd(c_609_104'8) in
                                  match PRIM_EqInt(n_635_14'6,backspace_634_13'6) with
                                  | true1 -> PRIM_PutChar(c_609_104'8)
                                  | false0 ->
                                    match let y_636_0'0 = '\n' in
                                    PRIM_EqChar(c_609_104'8,y_636_0'0) with
                                    | true1 -> PRIM_PutChar(c_609_104'8)
                                    | false0 ->
                                      match let b_637_7'10 = 26 in
                                      PRIM_LessInt(b_637_7'10,n_635_14'6) with
                                      | true1 -> PRIM_PutChar(c_609_104'8)
                                      | false0 ->
                                        let __639_18'21 =
                                          let x_638_0'0 = '^' in
                                          PRIM_PutChar(x_638_0'0) in
                                        let x_646_0'0 =
                                          let x_645_0'0 =
                                            (let x_643_0'0 =
                                              (let x_641_0'0 =
                                                let x_640_0'0 = 'A' in
                                                PRIM_CharOrd(x_640_0'0) in
                                              (fun y_642_0'0 -> PRIM_AddInt(x_641_0'0,y_642_0'0))
                                              n_635_14'6) in
                                            (fun y_644_0'0 -> PRIM_SubInt(x_643_0'0,y_644_0'0))
                                            1) in
                                          PRIM_CharChr(x_645_0'0) in
                                        PRIM_PutChar(x_646_0'0) in
                                let __663_107'55 =
                                  let __648_99'12 = Unit0 in
                                  let c_649_12'13 = '\n' in
                                  let backspace_650_13'6 = 8 in
                                  let n_651_14'6 = PRIM_CharOrd(c_649_12'13) in
                                  match PRIM_EqInt(n_651_14'6,backspace_650_13'6) with
                                  | true1 -> PRIM_PutChar(c_649_12'13)
                                  | false0 ->
                                    match let y_652_0'0 = '\n' in
                                    PRIM_EqChar(c_649_12'13,y_652_0'0) with
                                    | true1 -> PRIM_PutChar(c_649_12'13)
                                    | false0 ->
                                      match let b_653_7'10 = 26 in
                                      PRIM_LessInt(b_653_7'10,n_651_14'6) with
                                      | true1 -> PRIM_PutChar(c_649_12'13)
                                      | false0 ->
                                        let __655_18'21 =
                                          let x_654_0'0 = '^' in
                                          PRIM_PutChar(x_654_0'0) in
                                        let x_662_0'0 =
                                          let x_661_0'0 =
                                            (let x_659_0'0 =
                                              (let x_657_0'0 =
                                                let x_656_0'0 = 'A' in
                                                PRIM_CharOrd(x_656_0'0) in
                                              (fun y_658_0'0 -> PRIM_AddInt(x_657_0'0,y_658_0'0))
                                              n_651_14'6) in
                                            (fun y_660_0'0 -> PRIM_SubInt(x_659_0'0,y_660_0'0))
                                            1) in
                                          PRIM_CharChr(x_661_0'0) in
                                        PRIM_PutChar(x_662_0'0) in
                                let xs_664_63'12 = Cons1(controlD_605_102'6, acc_606_103'15) in
                                let loop_670_64'10 =
                                  fix (fun loop_666_64'10 acc_665_64'15 ->
                                    (fun xs_667_64'19 ->
                                      match xs_667_64'19 with
                                      | Nil0 -> acc_665_64'15
                                      | Cons1(x_668_67'6,xs_669_67'9) -> ((loop_666_64'10 Cons1(x_668_67'6, acc_665_64'15)) xs_669_67'9))) in
                                ((loop_670_64'10 Nil0) xs_664_63'12)
                              | false0 ->
                                match let b_671_7'10 = 127 in
                                PRIM_LessInt(b_671_7'10,n_610_105'8) with
                                | true1 -> (loop_607_103'10 acc_606_103'15)
                                | false0 ->
                                  match let y_672_0'0 = 127 in
                                  PRIM_EqInt(n_610_105'8,y_672_0'0) with
                                  | true1 ->
                                    match acc_606_103'15 with
                                    | Nil0 -> (loop_607_103'10 acc_606_103'15)
                                    | Cons1(c_673_112'14,tail_674_112'17) ->
                                      let __723_113'58 =
                                        match (let a_675_8'9 = PRIM_CharOrd(c_673_112'14) in
                                        (fun b_676_8'11 ->
                                          let b_677_2'8 = PRIM_LessInt(b_676_8'11,a_675_8'9) in
                                          match b_677_2'8 with
                                          | true1 -> false0
                                          | false0 -> true1)
                                        26) with
                                        | true1 ->
                                          let __678_20'15 = Unit0 in
                                          let backspace_680_21'6 =
                                            let x_679_0'0 = 8 in
                                            PRIM_CharChr(x_679_0'0) in
                                          let __694_23'20 =
                                            let backspace_681_13'6 = 8 in
                                            let n_682_14'6 = PRIM_CharOrd(backspace_680_21'6) in
                                            match PRIM_EqInt(n_682_14'6,backspace_681_13'6) with
                                            | true1 -> PRIM_PutChar(backspace_680_21'6)
                                            | false0 ->
                                              match let y_683_0'0 = '\n' in
                                              PRIM_EqChar(backspace_680_21'6,y_683_0'0) with
                                              | true1 -> PRIM_PutChar(backspace_680_21'6)
                                              | false0 ->
                                                match let b_684_7'10 = 26 in
                                                PRIM_LessInt(b_684_7'10,n_682_14'6) with
                                                | true1 -> PRIM_PutChar(backspace_680_21'6)
                                                | false0 ->
                                                  let __686_18'21 =
                                                    let x_685_0'0 = '^' in
                                                    PRIM_PutChar(x_685_0'0) in
                                                  let x_693_0'0 =
                                                    let x_692_0'0 =
                                                      (let x_690_0'0 =
                                                        (let x_688_0'0 =
                                                          let x_687_0'0 = 'A' in
                                                          PRIM_CharOrd(x_687_0'0) in
                                                        (fun y_689_0'0 -> PRIM_AddInt(x_688_0'0,y_689_0'0))
                                                        n_682_14'6) in
                                                      (fun y_691_0'0 -> PRIM_SubInt(x_690_0'0,y_691_0'0))
                                                      1) in
                                                    PRIM_CharChr(x_692_0'0) in
                                                  PRIM_PutChar(x_693_0'0) in
                                          let __709_24'14 =
                                            let c_695_12'13 = ' ' in
                                            let backspace_696_13'6 = 8 in
                                            let n_697_14'6 = PRIM_CharOrd(c_695_12'13) in
                                            match PRIM_EqInt(n_697_14'6,backspace_696_13'6) with
                                            | true1 -> PRIM_PutChar(c_695_12'13)
                                            | false0 ->
                                              match let y_698_0'0 = '\n' in
                                              PRIM_EqChar(c_695_12'13,y_698_0'0) with
                                              | true1 -> PRIM_PutChar(c_695_12'13)
                                              | false0 ->
                                                match let b_699_7'10 = 26 in
                                                PRIM_LessInt(b_699_7'10,n_697_14'6) with
                                                | true1 -> PRIM_PutChar(c_695_12'13)
                                                | false0 ->
                                                  let __701_18'21 =
                                                    let x_700_0'0 = '^' in
                                                    PRIM_PutChar(x_700_0'0) in
                                                  let x_708_0'0 =
                                                    let x_707_0'0 =
                                                      (let x_705_0'0 =
                                                        (let x_703_0'0 =
                                                          let x_702_0'0 = 'A' in
                                                          PRIM_CharOrd(x_702_0'0) in
                                                        (fun y_704_0'0 -> PRIM_AddInt(x_703_0'0,y_704_0'0))
                                                        n_697_14'6) in
                                                      (fun y_706_0'0 -> PRIM_SubInt(x_705_0'0,y_706_0'0))
                                                      1) in
                                                    PRIM_CharChr(x_707_0'0) in
                                                  PRIM_PutChar(x_708_0'0) in
                                          let backspace_710_13'6 = 8 in
                                          let n_711_14'6 = PRIM_CharOrd(backspace_680_21'6) in
                                          match PRIM_EqInt(n_711_14'6,backspace_710_13'6) with
                                          | true1 -> PRIM_PutChar(backspace_680_21'6)
                                          | false0 ->
                                            match let y_712_0'0 = '\n' in
                                            PRIM_EqChar(backspace_680_21'6,y_712_0'0) with
                                            | true1 -> PRIM_PutChar(backspace_680_21'6)
                                            | false0 ->
                                              match let b_713_7'10 = 26 in
                                              PRIM_LessInt(b_713_7'10,n_711_14'6) with
                                              | true1 -> PRIM_PutChar(backspace_680_21'6)
                                              | false0 ->
                                                let __715_18'21 =
                                                  let x_714_0'0 = '^' in
                                                  PRIM_PutChar(x_714_0'0) in
                                                let x_722_0'0 =
                                                  let x_721_0'0 =
                                                    (let x_719_0'0 =
                                                      (let x_717_0'0 =
                                                        let x_716_0'0 = 'A' in
                                                        PRIM_CharOrd(x_716_0'0) in
                                                      (fun y_718_0'0 -> PRIM_AddInt(x_717_0'0,y_718_0'0))
                                                      n_711_14'6) in
                                                    (fun y_720_0'0 -> PRIM_SubInt(x_719_0'0,y_720_0'0))
                                                    1) in
                                                  PRIM_CharChr(x_721_0'0) in
                                                PRIM_PutChar(x_722_0'0)
                                        | false0 -> Unit0 in
                                      let __769_114'27 =
                                        let __724_20'15 = Unit0 in
                                        let backspace_726_21'6 =
                                          let x_725_0'0 = 8 in
                                          PRIM_CharChr(x_725_0'0) in
                                        let __740_23'20 =
                                          let backspace_727_13'6 = 8 in
                                          let n_728_14'6 = PRIM_CharOrd(backspace_726_21'6) in
                                          match PRIM_EqInt(n_728_14'6,backspace_727_13'6) with
                                          | true1 -> PRIM_PutChar(backspace_726_21'6)
                                          | false0 ->
                                            match let y_729_0'0 = '\n' in
                                            PRIM_EqChar(backspace_726_21'6,y_729_0'0) with
                                            | true1 -> PRIM_PutChar(backspace_726_21'6)
                                            | false0 ->
                                              match let b_730_7'10 = 26 in
                                              PRIM_LessInt(b_730_7'10,n_728_14'6) with
                                              | true1 -> PRIM_PutChar(backspace_726_21'6)
                                              | false0 ->
                                                let __732_18'21 =
                                                  let x_731_0'0 = '^' in
                                                  PRIM_PutChar(x_731_0'0) in
                                                let x_739_0'0 =
                                                  let x_738_0'0 =
                                                    (let x_736_0'0 =
                                                      (let x_734_0'0 =
                                                        let x_733_0'0 = 'A' in
                                                        PRIM_CharOrd(x_733_0'0) in
                                                      (fun y_735_0'0 -> PRIM_AddInt(x_734_0'0,y_735_0'0))
                                                      n_728_14'6) in
                                                    (fun y_737_0'0 -> PRIM_SubInt(x_736_0'0,y_737_0'0))
                                                    1) in
                                                  PRIM_CharChr(x_738_0'0) in
                                                PRIM_PutChar(x_739_0'0) in
                                        let __755_24'14 =
                                          let c_741_12'13 = ' ' in
                                          let backspace_742_13'6 = 8 in
                                          let n_743_14'6 = PRIM_CharOrd(c_741_12'13) in
                                          match PRIM_EqInt(n_743_14'6,backspace_742_13'6) with
                                          | true1 -> PRIM_PutChar(c_741_12'13)
                                          | false0 ->
                                            match let y_744_0'0 = '\n' in
                                            PRIM_EqChar(c_741_12'13,y_744_0'0) with
                                            | true1 -> PRIM_PutChar(c_741_12'13)
                                            | false0 ->
                                              match let b_745_7'10 = 26 in
                                              PRIM_LessInt(b_745_7'10,n_743_14'6) with
                                              | true1 -> PRIM_PutChar(c_741_12'13)
                                              | false0 ->
                                                let __747_18'21 =
                                                  let x_746_0'0 = '^' in
                                                  PRIM_PutChar(x_746_0'0) in
                                                let x_754_0'0 =
                                                  let x_753_0'0 =
                                                    (let x_751_0'0 =
                                                      (let x_749_0'0 =
                                                        let x_748_0'0 = 'A' in
                                                        PRIM_CharOrd(x_748_0'0) in
                                                      (fun y_750_0'0 -> PRIM_AddInt(x_749_0'0,y_750_0'0))
                                                      n_743_14'6) in
                                                    (fun y_752_0'0 -> PRIM_SubInt(x_751_0'0,y_752_0'0))
                                                    1) in
                                                  PRIM_CharChr(x_753_0'0) in
                                                PRIM_PutChar(x_754_0'0) in
                                        let backspace_756_13'6 = 8 in
                                        let n_757_14'6 = PRIM_CharOrd(backspace_726_21'6) in
                                        match PRIM_EqInt(n_757_14'6,backspace_756_13'6) with
                                        | true1 -> PRIM_PutChar(backspace_726_21'6)
                                        | false0 ->
                                          match let y_758_0'0 = '\n' in
                                          PRIM_EqChar(backspace_726_21'6,y_758_0'0) with
                                          | true1 -> PRIM_PutChar(backspace_726_21'6)
                                          | false0 ->
                                            match let b_759_7'10 = 26 in
                                            PRIM_LessInt(b_759_7'10,n_757_14'6) with
                                            | true1 -> PRIM_PutChar(backspace_726_21'6)
                                            | false0 ->
                                              let __761_18'21 =
                                                let x_760_0'0 = '^' in
                                                PRIM_PutChar(x_760_0'0) in
                                              let x_768_0'0 =
                                                let x_767_0'0 =
                                                  (let x_765_0'0 =
                                                    (let x_763_0'0 =
                                                      let x_762_0'0 = 'A' in
                                                      PRIM_CharOrd(x_762_0'0) in
                                                    (fun y_764_0'0 -> PRIM_AddInt(x_763_0'0,y_764_0'0))
                                                    n_757_14'6) in
                                                  (fun y_766_0'0 -> PRIM_SubInt(x_765_0'0,y_766_0'0))
                                                  1) in
                                                PRIM_CharChr(x_767_0'0) in
                                              PRIM_PutChar(x_768_0'0) in
                                      (loop_607_103'10 tail_674_112'17)
                                  | false0 ->
                                    let __783_117'23 =
                                      let backspace_770_13'6 = 8 in
                                      let n_771_14'6 = PRIM_CharOrd(c_609_104'8) in
                                      match PRIM_EqInt(n_771_14'6,backspace_770_13'6) with
                                      | true1 -> PRIM_PutChar(c_609_104'8)
                                      | false0 ->
                                        match let y_772_0'0 = '\n' in
                                        PRIM_EqChar(c_609_104'8,y_772_0'0) with
                                        | true1 -> PRIM_PutChar(c_609_104'8)
                                        | false0 ->
                                          match let b_773_7'10 = 26 in
                                          PRIM_LessInt(b_773_7'10,n_771_14'6) with
                                          | true1 -> PRIM_PutChar(c_609_104'8)
                                          | false0 ->
                                            let __775_18'21 =
                                              let x_774_0'0 = '^' in
                                              PRIM_PutChar(x_774_0'0) in
                                            let x_782_0'0 =
                                              let x_781_0'0 =
                                                (let x_779_0'0 =
                                                  (let x_777_0'0 =
                                                    let x_776_0'0 = 'A' in
                                                    PRIM_CharOrd(x_776_0'0) in
                                                  (fun y_778_0'0 -> PRIM_AddInt(x_777_0'0,y_778_0'0))
                                                  n_771_14'6) in
                                                (fun y_780_0'0 -> PRIM_SubInt(x_779_0'0,y_780_0'0))
                                                1) in
                                              PRIM_CharChr(x_781_0'0) in
                                            PRIM_PutChar(x_782_0'0) in
                                    (loop_607_103'10 Cons1(c_609_104'8, acc_606_103'15))) in
                        (loop_784_103'10 Nil0) in
                      match (((eq_list_11_47'8 (fun x_786_0'0 -> (fun y_787_0'0 -> PRIM_EqChar(x_786_0'0,y_787_0'0)))) xs_785_170'8) single_controlD_72_166'4) with
                      | true1 -> Unit0
                      | false0 ->
                        let __794_172'29 =
                          (put_chars_52_90'8
                          let loop_793_64'10 =
                            fix (fun loop_789_64'10 acc_788_64'15 ->
                              (fun xs_790_64'19 ->
                                match xs_790_64'19 with
                                | Nil0 -> acc_788_64'15
                                | Cons1(x_791_67'6,xs_792_67'9) -> ((loop_789_64'10 Cons1(x_791_67'6, acc_788_64'15)) xs_792_67'9))) in
                          ((loop_793_64'10 Nil0) xs_785_170'8)) in
                        let __810_172'40 =
                          let __795_99'12 = Unit0 in
                          let c_796_12'13 = '\n' in
                          let backspace_797_13'6 = 8 in
                          let n_798_14'6 = PRIM_CharOrd(c_796_12'13) in
                          match PRIM_EqInt(n_798_14'6,backspace_797_13'6) with
                          | true1 -> PRIM_PutChar(c_796_12'13)
                          | false0 ->
                            match let y_799_0'0 = '\n' in
                            PRIM_EqChar(c_796_12'13,y_799_0'0) with
                            | true1 -> PRIM_PutChar(c_796_12'13)
                            | false0 ->
                              match let b_800_7'10 = 26 in
                              PRIM_LessInt(b_800_7'10,n_798_14'6) with
                              | true1 -> PRIM_PutChar(c_796_12'13)
                              | false0 ->
                                let __802_18'21 =
                                  let x_801_0'0 = '^' in
                                  PRIM_PutChar(x_801_0'0) in
                                let x_809_0'0 =
                                  let x_808_0'0 =
                                    (let x_806_0'0 =
                                      (let x_804_0'0 =
                                        let x_803_0'0 = 'A' in
                                        PRIM_CharOrd(x_803_0'0) in
                                      (fun y_805_0'0 -> PRIM_AddInt(x_804_0'0,y_805_0'0))
                                      n_798_14'6) in
                                    (fun y_807_0'0 -> PRIM_SubInt(x_806_0'0,y_807_0'0))
                                    1) in
                                  PRIM_CharChr(x_808_0'0) in
                                PRIM_PutChar(x_809_0'0) in
                        (loop_602_169'10 Unit0)) in
                  (loop_811_169'10 Unit0)
              | false0 ->
                let star_the_ohs_814_184'6 =
                  (map_26_71'8
                  (fun c_812_184'30 ->
                    match let y_813_0'0 = 'o' in
                    PRIM_EqChar(c_812_184'30,y_813_0'0) with
                    | true1 -> '*'
                    | false0 -> c_812_184'30)) in
                let n_815_185'6 = (length_33_76'8 xs_258_215'6) in
                let __817_186'66 =
                  (put_chars_52_90'8
                  ((append_18_58'8
                  let x_816_0'0 = "You wrote: \"" in
                  PRIM_Explode(x_816_0'0))
                  (star_the_ohs_814_184'6 xs_258_215'6))) in
                let __819_187'19 =
                  let s_818_95'15 = "\" (" in
                  (put_chars_52_90'8 PRIM_Explode(s_818_95'15)) in
                let __836_188'11 =
                  (put_chars_52_90'8
                  let ord0_821_82'6 =
                    let x_820_0'0 = '0' in
                    PRIM_CharOrd(x_820_0'0) in
                  let loop_832_84'10 =
                    fix (fun loop_823_84'10 acc_822_84'15 ->
                      (fun i_824_84'19 ->
                        match let y_825_0'0 = 0 in
                        PRIM_EqInt(i_824_84'19,y_825_0'0) with
                        | true1 -> acc_822_84'15
                        | false0 ->
                          ((loop_823_84'10
                          (let x_829_45'9 =
                            let c_827_83'20 =
                              let y_826_0'0 = 10 in
                              PRIM_ModInt(i_824_84'19,y_826_0'0) in
                            let x_828_0'0 = PRIM_AddInt(ord0_821_82'6,c_827_83'20) in
                            PRIM_CharChr(x_828_0'0) in
                          (fun xs_830_45'11 -> Cons1(x_829_45'9, xs_830_45'11))
                          acc_822_84'15))
                          let y_831_0'0 = 10 in
                          PRIM_DivInt(i_824_84'19,y_831_0'0)))) in
                  match let y_833_0'0 = 0 in
                  PRIM_EqInt(n_815_185'6,y_833_0'0) with
                  | true1 ->
                    (let x_834_45'9 = '0' in
                    (fun xs_835_45'11 -> Cons1(x_834_45'9, xs_835_45'11))
                    Nil0)
                  | false0 -> ((loop_832_84'10 Nil0) n_815_185'6)) in
                let __838_189'22 =
                  let s_837_95'15 = " chars)" in
                  (put_chars_52_90'8 PRIM_Explode(s_837_95'15)) in
                let __839_99'12 = Unit0 in
                let c_840_12'13 = '\n' in
                let backspace_841_13'6 = 8 in
                let n_842_14'6 = PRIM_CharOrd(c_840_12'13) in
                match PRIM_EqInt(n_842_14'6,backspace_841_13'6) with
                | true1 -> PRIM_PutChar(c_840_12'13)
                | false0 ->
                  match let y_843_0'0 = '\n' in
                  PRIM_EqChar(c_840_12'13,y_843_0'0) with
                  | true1 -> PRIM_PutChar(c_840_12'13)
                  | false0 ->
                    match let b_844_7'10 = 26 in
                    PRIM_LessInt(b_844_7'10,n_842_14'6) with
                    | true1 -> PRIM_PutChar(c_840_12'13)
                    | false0 ->
                      let __846_18'21 =
                        let x_845_0'0 = '^' in
                        PRIM_PutChar(x_845_0'0) in
                      let x_853_0'0 =
                        let x_852_0'0 =
                          (let x_850_0'0 =
                            (let x_848_0'0 =
                              let x_847_0'0 = 'A' in
                              PRIM_CharOrd(x_847_0'0) in
                            (fun y_849_0'0 -> PRIM_AddInt(x_848_0'0,y_849_0'0))
                            n_842_14'6) in
                          (fun y_851_0'0 -> PRIM_SubInt(x_850_0'0,y_851_0'0))
                          1) in
                        PRIM_CharChr(x_852_0'0) in
                      PRIM_PutChar(x_853_0'0) in
      (mainloop_74_213'8 Unit0)) in
let __856_219'9 = Unit0 in
let __858_220'63 =
  let s_857_95'15 = "This is a shell prototype. Try: fib, fact, rev\n" in
  (put_chars_52_90'8 PRIM_Explode(s_857_95'15)) in
(mainloop_855_213'8 Unit0)
