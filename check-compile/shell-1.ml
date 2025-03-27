(*stage1*)
let u_11 = fix (fun eq_list_2_47'8 eq_1_47'16 ->
  (fun f_3 ->
    (fun f_4 ->
      match f_3 with
      | Nil0 ->
        match f_4 with
        | Nil0 -> true1
        | Cons1(__5_49'40,__6_49'43) -> false0
      | Cons1(x_7_50'4,xs_8_50'7) ->
        match f_4 with
        | Nil0 -> false0
        | Cons1(y_9_53'7,ys_10_53'10) ->
          match ((eq_1_47'16 x_7_50'4) y_9_53'7) with
          | true1 -> (((eq_list_2_47'8 eq_1_47'16) xs_8_50'7) ys_10_53'10)
          | false0 -> false0))) in
let u_18 = fix (fun append_13_58'8 xs_12_58'15 ->
  (fun f_14 ->
    match xs_12_58'15 with
    | Nil0 -> f_14
    | Cons1(x_15_61'4,xs_16_61'7) ->
      let u_17 = ((append_13_58'8 xs_16_61'7) f_14) in
      Cons1(x_15_61'4, u_17))) in
let u_26 = fix (fun map_20_71'8 f_19_71'12 ->
  (fun f_21 ->
    match f_21 with
    | Nil0 -> Nil0
    | Cons1(x_22_74'4,xs_23_74'7) ->
      (let u_24 = (f_19_71'12 x_22_74'4) in
      (fun f_25 -> Cons1(u_24, f_25))
      ((map_20_71'8 f_19_71'12) xs_23_74'7)))) in
let u_33 = fix (fun length_28_76'8 xs_27_76'15 ->
  match xs_27_76'15 with
  | Nil0 -> 0
  | Cons1(__29_79'4,xs_30_79'7) ->
    (let u_31 = 1 in
    (fun f_32 -> PRIM_AddInt(u_31,f_32))
    (length_28_76'8 xs_30_79'7))) in
let u_52 = fix (fun put_chars_35_90'8 xs_34_90'18 ->
  match xs_34_90'18 with
  | Nil0 -> Unit0
  | Cons1(x_36_93'4,xs_37_93'7) ->
    let u_51 = let u_38 = 8 in
    let u_39 = PRIM_CharOrd(x_36_93'4) in
    match PRIM_EqInt(u_39,u_38) with
    | true1 -> PRIM_PutChar(x_36_93'4)
    | false0 ->
      match let u_40 = '\n' in
      PRIM_EqChar(x_36_93'4,u_40) with
      | true1 -> PRIM_PutChar(x_36_93'4)
      | false0 ->
        match let u_41 = 26 in
        PRIM_LessInt(u_41,u_39) with
        | true1 -> PRIM_PutChar(x_36_93'4)
        | false0 ->
          let u_43 = let u_42 = '^' in
          PRIM_PutChar(u_42) in
          let u_50 = let u_49 = (let u_47 = (let u_45 = let u_44 = 'A' in
          PRIM_CharOrd(u_44) in
          (fun f_46 -> PRIM_AddInt(u_45,f_46))
          u_39) in
          (fun f_48 -> PRIM_SubInt(u_47,f_48))
          1) in
          PRIM_CharChr(u_49) in
          PRIM_PutChar(u_50) in
    (put_chars_35_90'8 xs_37_93'7)) in
let u_60 = fix (fun fib_54_121'8 n_53_121'12 ->
  match let u_55 = 2 in
  PRIM_LessInt(n_53_121'12,u_55) with
  | true1 -> n_53_121'12
  | false0 ->
    (let u_57 = (fib_54_121'8
    let u_56 = 1 in
    PRIM_SubInt(n_53_121'12,u_56)) in
    (fun f_58 -> PRIM_AddInt(u_57,f_58))
    (fib_54_121'8
    let u_59 = 2 in
    PRIM_SubInt(n_53_121'12,u_59)))) in
let u_68 = fix (fun fact_62_125'8 n_61_125'13 ->
  match let u_63 = 2 in
  let u_64 = PRIM_LessInt(n_61_125'13,u_63) in
  match u_64 with
  | true1 -> false0
  | false0 -> true1 with
  | true1 ->
    (let u_66 = (fact_62_125'8
    let u_65 = 1 in
    PRIM_SubInt(n_61_125'13,u_65)) in
    (fun f_67 -> PRIM_MulInt(u_66,f_67))
    n_61_125'13)
  | false0 -> 1) in
let u_72 = (let u_70 = let u_69 = 4 in
PRIM_CharChr(u_69) in
(fun f_71 -> Cons1(u_70, f_71))
Nil0) in
let u_855 = fix (fun mainloop_74_213'8 __73_213'17 ->
  let u_75 = (u_52 Cons1('>', Cons1(' ', Nil0))) in
  let u_258 = let u_76 = Unit0 in
  let u_78 = let u_77 = 4 in
  PRIM_CharChr(u_77) in
  let u_257 = fix (fun loop_80_103'10 acc_79_103'15 ->
    let u_82 = let u_81 = Unit0 in
    PRIM_GetChar(u_81) in
    let u_83 = PRIM_CharOrd(u_82) in
    match let u_84 = '\n' in
    PRIM_EqChar(u_82,u_84) with
    | true1 ->
      let u_100 = let u_85 = Unit0 in
      let u_86 = '\n' in
      let u_87 = 8 in
      let u_88 = PRIM_CharOrd(u_86) in
      match PRIM_EqInt(u_88,u_87) with
      | true1 -> PRIM_PutChar(u_86)
      | false0 ->
        match let u_89 = '\n' in
        PRIM_EqChar(u_86,u_89) with
        | true1 -> PRIM_PutChar(u_86)
        | false0 ->
          match let u_90 = 26 in
          PRIM_LessInt(u_90,u_88) with
          | true1 -> PRIM_PutChar(u_86)
          | false0 ->
            let u_92 = let u_91 = '^' in
            PRIM_PutChar(u_91) in
            let u_99 = let u_98 = (let u_96 = (let u_94 = let u_93 = 'A' in
            PRIM_CharOrd(u_93) in
            (fun f_95 -> PRIM_AddInt(u_94,f_95))
            u_88) in
            (fun f_97 -> PRIM_SubInt(u_96,f_97))
            1) in
            PRIM_CharChr(u_98) in
            PRIM_PutChar(u_99) in
      let u_106 = fix (fun loop_102_64'10 acc_101_64'15 ->
        (fun f_103 ->
          match f_103 with
          | Nil0 -> acc_101_64'15
          | Cons1(x_104_67'6,xs_105_67'9) -> ((loop_102_64'10 Cons1(x_104_67'6, acc_101_64'15)) xs_105_67'9))) in
      ((u_106 Nil0) acc_79_103'15)
    | false0 ->
      match PRIM_EqChar(u_82,u_78) with
      | true1 ->
        let u_120 = let u_107 = 8 in
        let u_108 = PRIM_CharOrd(u_82) in
        match PRIM_EqInt(u_108,u_107) with
        | true1 -> PRIM_PutChar(u_82)
        | false0 ->
          match let u_109 = '\n' in
          PRIM_EqChar(u_82,u_109) with
          | true1 -> PRIM_PutChar(u_82)
          | false0 ->
            match let u_110 = 26 in
            PRIM_LessInt(u_110,u_108) with
            | true1 -> PRIM_PutChar(u_82)
            | false0 ->
              let u_112 = let u_111 = '^' in
              PRIM_PutChar(u_111) in
              let u_119 = let u_118 = (let u_116 = (let u_114 = let u_113 = 'A' in
              PRIM_CharOrd(u_113) in
              (fun f_115 -> PRIM_AddInt(u_114,f_115))
              u_108) in
              (fun f_117 -> PRIM_SubInt(u_116,f_117))
              1) in
              PRIM_CharChr(u_118) in
              PRIM_PutChar(u_119) in
        let u_136 = let u_121 = Unit0 in
        let u_122 = '\n' in
        let u_123 = 8 in
        let u_124 = PRIM_CharOrd(u_122) in
        match PRIM_EqInt(u_124,u_123) with
        | true1 -> PRIM_PutChar(u_122)
        | false0 ->
          match let u_125 = '\n' in
          PRIM_EqChar(u_122,u_125) with
          | true1 -> PRIM_PutChar(u_122)
          | false0 ->
            match let u_126 = 26 in
            PRIM_LessInt(u_126,u_124) with
            | true1 -> PRIM_PutChar(u_122)
            | false0 ->
              let u_128 = let u_127 = '^' in
              PRIM_PutChar(u_127) in
              let u_135 = let u_134 = (let u_132 = (let u_130 = let u_129 = 'A' in
              PRIM_CharOrd(u_129) in
              (fun f_131 -> PRIM_AddInt(u_130,f_131))
              u_124) in
              (fun f_133 -> PRIM_SubInt(u_132,f_133))
              1) in
              PRIM_CharChr(u_134) in
              PRIM_PutChar(u_135) in
        let u_137 = Cons1(u_78, acc_79_103'15) in
        let u_143 = fix (fun loop_139_64'10 acc_138_64'15 ->
          (fun f_140 ->
            match f_140 with
            | Nil0 -> acc_138_64'15
            | Cons1(x_141_67'6,xs_142_67'9) -> ((loop_139_64'10 Cons1(x_141_67'6, acc_138_64'15)) xs_142_67'9))) in
        ((u_143 Nil0) u_137)
      | false0 ->
        match let u_144 = 127 in
        PRIM_LessInt(u_144,u_83) with
        | true1 -> (loop_80_103'10 acc_79_103'15)
        | false0 ->
          match let u_145 = 127 in
          PRIM_EqInt(u_83,u_145) with
          | true1 ->
            match acc_79_103'15 with
            | Nil0 -> (loop_80_103'10 acc_79_103'15)
            | Cons1(c_146_112'14,tail_147_112'17) ->
              let u_196 = match (let u_148 = PRIM_CharOrd(c_146_112'14) in
              (fun f_149 ->
                let u_150 = PRIM_LessInt(f_149,u_148) in
                match u_150 with
                | true1 -> false0
                | false0 -> true1)
              26) with
              | true1 ->
                let u_151 = Unit0 in
                let u_153 = let u_152 = 8 in
                PRIM_CharChr(u_152) in
                let u_167 = let u_154 = 8 in
                let u_155 = PRIM_CharOrd(u_153) in
                match PRIM_EqInt(u_155,u_154) with
                | true1 -> PRIM_PutChar(u_153)
                | false0 ->
                  match let u_156 = '\n' in
                  PRIM_EqChar(u_153,u_156) with
                  | true1 -> PRIM_PutChar(u_153)
                  | false0 ->
                    match let u_157 = 26 in
                    PRIM_LessInt(u_157,u_155) with
                    | true1 -> PRIM_PutChar(u_153)
                    | false0 ->
                      let u_159 = let u_158 = '^' in
                      PRIM_PutChar(u_158) in
                      let u_166 = let u_165 = (let u_163 = (let u_161 = let u_160 = 'A' in
                      PRIM_CharOrd(u_160) in
                      (fun f_162 -> PRIM_AddInt(u_161,f_162))
                      u_155) in
                      (fun f_164 -> PRIM_SubInt(u_163,f_164))
                      1) in
                      PRIM_CharChr(u_165) in
                      PRIM_PutChar(u_166) in
                let u_182 = let u_168 = ' ' in
                let u_169 = 8 in
                let u_170 = PRIM_CharOrd(u_168) in
                match PRIM_EqInt(u_170,u_169) with
                | true1 -> PRIM_PutChar(u_168)
                | false0 ->
                  match let u_171 = '\n' in
                  PRIM_EqChar(u_168,u_171) with
                  | true1 -> PRIM_PutChar(u_168)
                  | false0 ->
                    match let u_172 = 26 in
                    PRIM_LessInt(u_172,u_170) with
                    | true1 -> PRIM_PutChar(u_168)
                    | false0 ->
                      let u_174 = let u_173 = '^' in
                      PRIM_PutChar(u_173) in
                      let u_181 = let u_180 = (let u_178 = (let u_176 = let u_175 = 'A' in
                      PRIM_CharOrd(u_175) in
                      (fun f_177 -> PRIM_AddInt(u_176,f_177))
                      u_170) in
                      (fun f_179 -> PRIM_SubInt(u_178,f_179))
                      1) in
                      PRIM_CharChr(u_180) in
                      PRIM_PutChar(u_181) in
                let u_183 = 8 in
                let u_184 = PRIM_CharOrd(u_153) in
                match PRIM_EqInt(u_184,u_183) with
                | true1 -> PRIM_PutChar(u_153)
                | false0 ->
                  match let u_185 = '\n' in
                  PRIM_EqChar(u_153,u_185) with
                  | true1 -> PRIM_PutChar(u_153)
                  | false0 ->
                    match let u_186 = 26 in
                    PRIM_LessInt(u_186,u_184) with
                    | true1 -> PRIM_PutChar(u_153)
                    | false0 ->
                      let u_188 = let u_187 = '^' in
                      PRIM_PutChar(u_187) in
                      let u_195 = let u_194 = (let u_192 = (let u_190 = let u_189 = 'A' in
                      PRIM_CharOrd(u_189) in
                      (fun f_191 -> PRIM_AddInt(u_190,f_191))
                      u_184) in
                      (fun f_193 -> PRIM_SubInt(u_192,f_193))
                      1) in
                      PRIM_CharChr(u_194) in
                      PRIM_PutChar(u_195)
              | false0 -> Unit0 in
              let u_242 = let u_197 = Unit0 in
              let u_199 = let u_198 = 8 in
              PRIM_CharChr(u_198) in
              let u_213 = let u_200 = 8 in
              let u_201 = PRIM_CharOrd(u_199) in
              match PRIM_EqInt(u_201,u_200) with
              | true1 -> PRIM_PutChar(u_199)
              | false0 ->
                match let u_202 = '\n' in
                PRIM_EqChar(u_199,u_202) with
                | true1 -> PRIM_PutChar(u_199)
                | false0 ->
                  match let u_203 = 26 in
                  PRIM_LessInt(u_203,u_201) with
                  | true1 -> PRIM_PutChar(u_199)
                  | false0 ->
                    let u_205 = let u_204 = '^' in
                    PRIM_PutChar(u_204) in
                    let u_212 = let u_211 = (let u_209 = (let u_207 = let u_206 = 'A' in
                    PRIM_CharOrd(u_206) in
                    (fun f_208 -> PRIM_AddInt(u_207,f_208))
                    u_201) in
                    (fun f_210 -> PRIM_SubInt(u_209,f_210))
                    1) in
                    PRIM_CharChr(u_211) in
                    PRIM_PutChar(u_212) in
              let u_228 = let u_214 = ' ' in
              let u_215 = 8 in
              let u_216 = PRIM_CharOrd(u_214) in
              match PRIM_EqInt(u_216,u_215) with
              | true1 -> PRIM_PutChar(u_214)
              | false0 ->
                match let u_217 = '\n' in
                PRIM_EqChar(u_214,u_217) with
                | true1 -> PRIM_PutChar(u_214)
                | false0 ->
                  match let u_218 = 26 in
                  PRIM_LessInt(u_218,u_216) with
                  | true1 -> PRIM_PutChar(u_214)
                  | false0 ->
                    let u_220 = let u_219 = '^' in
                    PRIM_PutChar(u_219) in
                    let u_227 = let u_226 = (let u_224 = (let u_222 = let u_221 = 'A' in
                    PRIM_CharOrd(u_221) in
                    (fun f_223 -> PRIM_AddInt(u_222,f_223))
                    u_216) in
                    (fun f_225 -> PRIM_SubInt(u_224,f_225))
                    1) in
                    PRIM_CharChr(u_226) in
                    PRIM_PutChar(u_227) in
              let u_229 = 8 in
              let u_230 = PRIM_CharOrd(u_199) in
              match PRIM_EqInt(u_230,u_229) with
              | true1 -> PRIM_PutChar(u_199)
              | false0 ->
                match let u_231 = '\n' in
                PRIM_EqChar(u_199,u_231) with
                | true1 -> PRIM_PutChar(u_199)
                | false0 ->
                  match let u_232 = 26 in
                  PRIM_LessInt(u_232,u_230) with
                  | true1 -> PRIM_PutChar(u_199)
                  | false0 ->
                    let u_234 = let u_233 = '^' in
                    PRIM_PutChar(u_233) in
                    let u_241 = let u_240 = (let u_238 = (let u_236 = let u_235 = 'A' in
                    PRIM_CharOrd(u_235) in
                    (fun f_237 -> PRIM_AddInt(u_236,f_237))
                    u_230) in
                    (fun f_239 -> PRIM_SubInt(u_238,f_239))
                    1) in
                    PRIM_CharChr(u_240) in
                    PRIM_PutChar(u_241) in
              (loop_80_103'10 tail_147_112'17)
          | false0 ->
            let u_256 = let u_243 = 8 in
            let u_244 = PRIM_CharOrd(u_82) in
            match PRIM_EqInt(u_244,u_243) with
            | true1 -> PRIM_PutChar(u_82)
            | false0 ->
              match let u_245 = '\n' in
              PRIM_EqChar(u_82,u_245) with
              | true1 -> PRIM_PutChar(u_82)
              | false0 ->
                match let u_246 = 26 in
                PRIM_LessInt(u_246,u_244) with
                | true1 -> PRIM_PutChar(u_82)
                | false0 ->
                  let u_248 = let u_247 = '^' in
                  PRIM_PutChar(u_247) in
                  let u_255 = let u_254 = (let u_252 = (let u_250 = let u_249 = 'A' in
                  PRIM_CharOrd(u_249) in
                  (fun f_251 -> PRIM_AddInt(u_250,f_251))
                  u_244) in
                  (fun f_253 -> PRIM_SubInt(u_252,f_253))
                  1) in
                  PRIM_CharChr(u_254) in
                  PRIM_PutChar(u_255) in
            (loop_80_103'10 Cons1(u_82, acc_79_103'15))) in
  (u_257 Nil0) in
  match (((u_11 (fun f_259 -> (fun f_260 -> PRIM_EqChar(f_259,f_260)))) u_258) u_72) with
  | true1 -> Unit0
  | false0 ->
    let u_854 = let u_292 = let u_291 = fix (fun loop_262_193'10 accWs_261_193'15 ->
      (fun f_263 ->
        (fun f_264 ->
          match f_264 with
          | Nil0 ->
            let u_273 = (let u_271 = let u_270 = fix (fun loop_266_64'10 acc_265_64'15 ->
              (fun f_267 ->
                match f_267 with
                | Nil0 -> acc_265_64'15
                | Cons1(x_268_67'6,xs_269_67'9) -> ((loop_266_64'10 Cons1(x_268_67'6, acc_265_64'15)) xs_269_67'9))) in
            ((u_270 Nil0) f_263) in
            (fun f_272 -> Cons1(u_271, f_272))
            accWs_261_193'15) in
            let u_279 = fix (fun loop_275_64'10 acc_274_64'15 ->
              (fun f_276 ->
                match f_276 with
                | Nil0 -> acc_274_64'15
                | Cons1(x_277_67'6,xs_278_67'9) -> ((loop_275_64'10 Cons1(x_277_67'6, acc_274_64'15)) xs_278_67'9))) in
            ((u_279 Nil0) u_273)
          | Cons1(x_280_197'6,xs_281_197'9) ->
            match let u_282 = ' ' in
            PRIM_EqChar(x_280_197'6,u_282) with
            | true1 ->
              (((loop_262_193'10
              (let u_289 = let u_288 = fix (fun loop_284_64'10 acc_283_64'15 ->
                (fun f_285 ->
                  match f_285 with
                  | Nil0 -> acc_283_64'15
                  | Cons1(x_286_67'6,xs_287_67'9) -> ((loop_284_64'10 Cons1(x_286_67'6, acc_283_64'15)) xs_287_67'9))) in
              ((u_288 Nil0) f_263) in
              (fun f_290 -> Cons1(u_289, f_290))
              accWs_261_193'15))
              Nil0)
              xs_281_197'9)
            | false0 -> (((loop_262_193'10 accWs_261_193'15) Cons1(x_280_197'6, f_263)) xs_281_197'9)))) in
    (((u_291 Nil0) Nil0) u_258) in
    match u_292 with
    | Nil0 -> Unit0
    | Cons1(command_293_207'4,args_294_207'13) ->
      match let u_296 = let u_295 = "fib" in
      PRIM_Explode(u_295) in
      (((u_11 (fun f_297 -> (fun f_298 -> PRIM_EqChar(f_297,f_298)))) command_293_207'4) u_296) with
      | true1 ->
        let u_300 = let u_299 = "fib: " in
        (u_52 PRIM_Explode(u_299)) in
        match args_294_207'13 with
        | Nil0 ->
          let u_301 = "expected an argument" in
          let u_303 = let u_302 = "ERROR: " in
          (u_52 PRIM_Explode(u_302)) in
          let u_304 = (u_52 PRIM_Explode(u_301)) in
          let u_305 = Unit0 in
          let u_306 = '\n' in
          let u_307 = 8 in
          let u_308 = PRIM_CharOrd(u_306) in
          match PRIM_EqInt(u_308,u_307) with
          | true1 -> PRIM_PutChar(u_306)
          | false0 ->
            match let u_309 = '\n' in
            PRIM_EqChar(u_306,u_309) with
            | true1 -> PRIM_PutChar(u_306)
            | false0 ->
              match let u_310 = 26 in
              PRIM_LessInt(u_310,u_308) with
              | true1 -> PRIM_PutChar(u_306)
              | false0 ->
                let u_312 = let u_311 = '^' in
                PRIM_PutChar(u_311) in
                let u_319 = let u_318 = (let u_316 = (let u_314 = let u_313 = 'A' in
                PRIM_CharOrd(u_313) in
                (fun f_315 -> PRIM_AddInt(u_314,f_315))
                u_308) in
                (fun f_317 -> PRIM_SubInt(u_316,f_317))
                1) in
                PRIM_CharChr(u_318) in
                PRIM_PutChar(u_319)
        | Cons1(arg1_320_135'4,more_321_135'10) ->
          match more_321_135'10 with
          | Cons1(__322_137'7,__323_137'10) ->
            let u_324 = "expected exactly one argument" in
            let u_326 = let u_325 = "ERROR: " in
            (u_52 PRIM_Explode(u_325)) in
            let u_327 = (u_52 PRIM_Explode(u_324)) in
            let u_328 = Unit0 in
            let u_329 = '\n' in
            let u_330 = 8 in
            let u_331 = PRIM_CharOrd(u_329) in
            match PRIM_EqInt(u_331,u_330) with
            | true1 -> PRIM_PutChar(u_329)
            | false0 ->
              match let u_332 = '\n' in
              PRIM_EqChar(u_329,u_332) with
              | true1 -> PRIM_PutChar(u_329)
              | false0 ->
                match let u_333 = 26 in
                PRIM_LessInt(u_333,u_331) with
                | true1 -> PRIM_PutChar(u_329)
                | false0 ->
                  let u_335 = let u_334 = '^' in
                  PRIM_PutChar(u_334) in
                  let u_342 = let u_341 = (let u_339 = (let u_337 = let u_336 = 'A' in
                  PRIM_CharOrd(u_336) in
                  (fun f_338 -> PRIM_AddInt(u_337,f_338))
                  u_331) in
                  (fun f_340 -> PRIM_SubInt(u_339,f_340))
                  1) in
                  PRIM_CharChr(u_341) in
                  PRIM_PutChar(u_342)
          | Nil0 ->
            match let u_361 = fix (fun loop_344_35'10 acc_343_35'15 ->
              (fun f_345 ->
                match f_345 with
                | Nil0 -> Some0(acc_343_35'15)
                | Cons1(x_346_38'6,xs_347_38'9) ->
                  match let u_351 = (let u_348 = PRIM_CharOrd(x_346_38'6) in
                  (fun f_349 -> PRIM_SubInt(u_348,f_349))
                  let u_350 = '0' in
                  PRIM_CharOrd(u_350)) in
                  match let u_352 = 0 in
                  let u_353 = PRIM_LessInt(u_351,u_352) in
                  match u_353 with
                  | true1 -> false0
                  | false0 -> true1 with
                  | true1 ->
                    match let u_354 = 9 in
                    let u_355 = PRIM_LessInt(u_354,u_351) in
                    match u_355 with
                    | true1 -> false0
                    | false0 -> true1 with
                    | true1 -> Some0(u_351)
                    | false0 -> None1
                  | false0 -> None1 with
                  | None1 -> None1
                  | Some0(d_356_41'15) ->
                    ((loop_344_35'10
                    (let u_359 = (let u_357 = 10 in
                    (fun f_358 -> PRIM_MulInt(u_357,f_358))
                    acc_343_35'15) in
                    (fun f_360 -> PRIM_AddInt(u_359,f_360))
                    d_356_41'15))
                    xs_347_38'9))) in
            ((u_361 0) arg1_320_135'4) with
            | None1 ->
              let u_362 = "expected arg1 to be numeric" in
              let u_364 = let u_363 = "ERROR: " in
              (u_52 PRIM_Explode(u_363)) in
              let u_365 = (u_52 PRIM_Explode(u_362)) in
              let u_366 = Unit0 in
              let u_367 = '\n' in
              let u_368 = 8 in
              let u_369 = PRIM_CharOrd(u_367) in
              match PRIM_EqInt(u_369,u_368) with
              | true1 -> PRIM_PutChar(u_367)
              | false0 ->
                match let u_370 = '\n' in
                PRIM_EqChar(u_367,u_370) with
                | true1 -> PRIM_PutChar(u_367)
                | false0 ->
                  match let u_371 = 26 in
                  PRIM_LessInt(u_371,u_369) with
                  | true1 -> PRIM_PutChar(u_367)
                  | false0 ->
                    let u_373 = let u_372 = '^' in
                    PRIM_PutChar(u_372) in
                    let u_380 = let u_379 = (let u_377 = (let u_375 = let u_374 = 'A' in
                    PRIM_CharOrd(u_374) in
                    (fun f_376 -> PRIM_AddInt(u_375,f_376))
                    u_369) in
                    (fun f_378 -> PRIM_SubInt(u_377,f_378))
                    1) in
                    PRIM_CharChr(u_379) in
                    PRIM_PutChar(u_380)
            | Some0(n_381_141'15) ->
              let u_382 = (u_60 n_381_141'15) in
              let u_399 = (u_52
              let u_384 = let u_383 = '0' in
              PRIM_CharOrd(u_383) in
              let u_395 = fix (fun loop_386_84'10 acc_385_84'15 ->
                (fun f_387 ->
                  match let u_388 = 0 in
                  PRIM_EqInt(f_387,u_388) with
                  | true1 -> acc_385_84'15
                  | false0 ->
                    ((loop_386_84'10
                    (let u_392 = let u_390 = let u_389 = 10 in
                    PRIM_ModInt(f_387,u_389) in
                    let u_391 = PRIM_AddInt(u_384,u_390) in
                    PRIM_CharChr(u_391) in
                    (fun f_393 -> Cons1(u_392, f_393))
                    acc_385_84'15))
                    let u_394 = 10 in
                    PRIM_DivInt(f_387,u_394)))) in
              match let u_396 = 0 in
              PRIM_EqInt(n_381_141'15,u_396) with
              | true1 ->
                (let u_397 = '0' in
                (fun f_398 -> Cons1(u_397, f_398))
                Nil0)
              | false0 -> ((u_395 Nil0) n_381_141'15)) in
              let u_401 = let u_400 = " --> " in
              (u_52 PRIM_Explode(u_400)) in
              let u_418 = (u_52
              let u_403 = let u_402 = '0' in
              PRIM_CharOrd(u_402) in
              let u_414 = fix (fun loop_405_84'10 acc_404_84'15 ->
                (fun f_406 ->
                  match let u_407 = 0 in
                  PRIM_EqInt(f_406,u_407) with
                  | true1 -> acc_404_84'15
                  | false0 ->
                    ((loop_405_84'10
                    (let u_411 = let u_409 = let u_408 = 10 in
                    PRIM_ModInt(f_406,u_408) in
                    let u_410 = PRIM_AddInt(u_403,u_409) in
                    PRIM_CharChr(u_410) in
                    (fun f_412 -> Cons1(u_411, f_412))
                    acc_404_84'15))
                    let u_413 = 10 in
                    PRIM_DivInt(f_406,u_413)))) in
              match let u_415 = 0 in
              PRIM_EqInt(u_382,u_415) with
              | true1 ->
                (let u_416 = '0' in
                (fun f_417 -> Cons1(u_416, f_417))
                Nil0)
              | false0 -> ((u_414 Nil0) u_382)) in
              let u_419 = Unit0 in
              let u_420 = '\n' in
              let u_421 = 8 in
              let u_422 = PRIM_CharOrd(u_420) in
              match PRIM_EqInt(u_422,u_421) with
              | true1 -> PRIM_PutChar(u_420)
              | false0 ->
                match let u_423 = '\n' in
                PRIM_EqChar(u_420,u_423) with
                | true1 -> PRIM_PutChar(u_420)
                | false0 ->
                  match let u_424 = 26 in
                  PRIM_LessInt(u_424,u_422) with
                  | true1 -> PRIM_PutChar(u_420)
                  | false0 ->
                    let u_426 = let u_425 = '^' in
                    PRIM_PutChar(u_425) in
                    let u_433 = let u_432 = (let u_430 = (let u_428 = let u_427 = 'A' in
                    PRIM_CharOrd(u_427) in
                    (fun f_429 -> PRIM_AddInt(u_428,f_429))
                    u_422) in
                    (fun f_431 -> PRIM_SubInt(u_430,f_431))
                    1) in
                    PRIM_CharChr(u_432) in
                    PRIM_PutChar(u_433)
      | false0 ->
        match let u_435 = let u_434 = "fact" in
        PRIM_Explode(u_434) in
        (((u_11 (fun f_436 -> (fun f_437 -> PRIM_EqChar(f_436,f_437)))) command_293_207'4) u_435) with
        | true1 ->
          let u_439 = let u_438 = "fact: " in
          (u_52 PRIM_Explode(u_438)) in
          match args_294_207'13 with
          | Nil0 ->
            let u_440 = "expected an argument" in
            let u_442 = let u_441 = "ERROR: " in
            (u_52 PRIM_Explode(u_441)) in
            let u_443 = (u_52 PRIM_Explode(u_440)) in
            let u_444 = Unit0 in
            let u_445 = '\n' in
            let u_446 = 8 in
            let u_447 = PRIM_CharOrd(u_445) in
            match PRIM_EqInt(u_447,u_446) with
            | true1 -> PRIM_PutChar(u_445)
            | false0 ->
              match let u_448 = '\n' in
              PRIM_EqChar(u_445,u_448) with
              | true1 -> PRIM_PutChar(u_445)
              | false0 ->
                match let u_449 = 26 in
                PRIM_LessInt(u_449,u_447) with
                | true1 -> PRIM_PutChar(u_445)
                | false0 ->
                  let u_451 = let u_450 = '^' in
                  PRIM_PutChar(u_450) in
                  let u_458 = let u_457 = (let u_455 = (let u_453 = let u_452 = 'A' in
                  PRIM_CharOrd(u_452) in
                  (fun f_454 -> PRIM_AddInt(u_453,f_454))
                  u_447) in
                  (fun f_456 -> PRIM_SubInt(u_455,f_456))
                  1) in
                  PRIM_CharChr(u_457) in
                  PRIM_PutChar(u_458)
          | Cons1(arg1_459_152'4,more_460_152'10) ->
            match more_460_152'10 with
            | Cons1(__461_154'7,__462_154'10) ->
              let u_463 = "expected exactly one argument" in
              let u_465 = let u_464 = "ERROR: " in
              (u_52 PRIM_Explode(u_464)) in
              let u_466 = (u_52 PRIM_Explode(u_463)) in
              let u_467 = Unit0 in
              let u_468 = '\n' in
              let u_469 = 8 in
              let u_470 = PRIM_CharOrd(u_468) in
              match PRIM_EqInt(u_470,u_469) with
              | true1 -> PRIM_PutChar(u_468)
              | false0 ->
                match let u_471 = '\n' in
                PRIM_EqChar(u_468,u_471) with
                | true1 -> PRIM_PutChar(u_468)
                | false0 ->
                  match let u_472 = 26 in
                  PRIM_LessInt(u_472,u_470) with
                  | true1 -> PRIM_PutChar(u_468)
                  | false0 ->
                    let u_474 = let u_473 = '^' in
                    PRIM_PutChar(u_473) in
                    let u_481 = let u_480 = (let u_478 = (let u_476 = let u_475 = 'A' in
                    PRIM_CharOrd(u_475) in
                    (fun f_477 -> PRIM_AddInt(u_476,f_477))
                    u_470) in
                    (fun f_479 -> PRIM_SubInt(u_478,f_479))
                    1) in
                    PRIM_CharChr(u_480) in
                    PRIM_PutChar(u_481)
            | Nil0 ->
              match let u_500 = fix (fun loop_483_35'10 acc_482_35'15 ->
                (fun f_484 ->
                  match f_484 with
                  | Nil0 -> Some0(acc_482_35'15)
                  | Cons1(x_485_38'6,xs_486_38'9) ->
                    match let u_490 = (let u_487 = PRIM_CharOrd(x_485_38'6) in
                    (fun f_488 -> PRIM_SubInt(u_487,f_488))
                    let u_489 = '0' in
                    PRIM_CharOrd(u_489)) in
                    match let u_491 = 0 in
                    let u_492 = PRIM_LessInt(u_490,u_491) in
                    match u_492 with
                    | true1 -> false0
                    | false0 -> true1 with
                    | true1 ->
                      match let u_493 = 9 in
                      let u_494 = PRIM_LessInt(u_493,u_490) in
                      match u_494 with
                      | true1 -> false0
                      | false0 -> true1 with
                      | true1 -> Some0(u_490)
                      | false0 -> None1
                    | false0 -> None1 with
                    | None1 -> None1
                    | Some0(d_495_41'15) ->
                      ((loop_483_35'10
                      (let u_498 = (let u_496 = 10 in
                      (fun f_497 -> PRIM_MulInt(u_496,f_497))
                      acc_482_35'15) in
                      (fun f_499 -> PRIM_AddInt(u_498,f_499))
                      d_495_41'15))
                      xs_486_38'9))) in
              ((u_500 0) arg1_459_152'4) with
              | None1 ->
                let u_501 = "expected arg1 to be numeric" in
                let u_503 = let u_502 = "ERROR: " in
                (u_52 PRIM_Explode(u_502)) in
                let u_504 = (u_52 PRIM_Explode(u_501)) in
                let u_505 = Unit0 in
                let u_506 = '\n' in
                let u_507 = 8 in
                let u_508 = PRIM_CharOrd(u_506) in
                match PRIM_EqInt(u_508,u_507) with
                | true1 -> PRIM_PutChar(u_506)
                | false0 ->
                  match let u_509 = '\n' in
                  PRIM_EqChar(u_506,u_509) with
                  | true1 -> PRIM_PutChar(u_506)
                  | false0 ->
                    match let u_510 = 26 in
                    PRIM_LessInt(u_510,u_508) with
                    | true1 -> PRIM_PutChar(u_506)
                    | false0 ->
                      let u_512 = let u_511 = '^' in
                      PRIM_PutChar(u_511) in
                      let u_519 = let u_518 = (let u_516 = (let u_514 = let u_513 = 'A' in
                      PRIM_CharOrd(u_513) in
                      (fun f_515 -> PRIM_AddInt(u_514,f_515))
                      u_508) in
                      (fun f_517 -> PRIM_SubInt(u_516,f_517))
                      1) in
                      PRIM_CharChr(u_518) in
                      PRIM_PutChar(u_519)
              | Some0(n_520_158'15) ->
                let u_521 = (u_68 n_520_158'15) in
                let u_538 = (u_52
                let u_523 = let u_522 = '0' in
                PRIM_CharOrd(u_522) in
                let u_534 = fix (fun loop_525_84'10 acc_524_84'15 ->
                  (fun f_526 ->
                    match let u_527 = 0 in
                    PRIM_EqInt(f_526,u_527) with
                    | true1 -> acc_524_84'15
                    | false0 ->
                      ((loop_525_84'10
                      (let u_531 = let u_529 = let u_528 = 10 in
                      PRIM_ModInt(f_526,u_528) in
                      let u_530 = PRIM_AddInt(u_523,u_529) in
                      PRIM_CharChr(u_530) in
                      (fun f_532 -> Cons1(u_531, f_532))
                      acc_524_84'15))
                      let u_533 = 10 in
                      PRIM_DivInt(f_526,u_533)))) in
                match let u_535 = 0 in
                PRIM_EqInt(n_520_158'15,u_535) with
                | true1 ->
                  (let u_536 = '0' in
                  (fun f_537 -> Cons1(u_536, f_537))
                  Nil0)
                | false0 -> ((u_534 Nil0) n_520_158'15)) in
                let u_540 = let u_539 = " --> " in
                (u_52 PRIM_Explode(u_539)) in
                let u_557 = (u_52
                let u_542 = let u_541 = '0' in
                PRIM_CharOrd(u_541) in
                let u_553 = fix (fun loop_544_84'10 acc_543_84'15 ->
                  (fun f_545 ->
                    match let u_546 = 0 in
                    PRIM_EqInt(f_545,u_546) with
                    | true1 -> acc_543_84'15
                    | false0 ->
                      ((loop_544_84'10
                      (let u_550 = let u_548 = let u_547 = 10 in
                      PRIM_ModInt(f_545,u_547) in
                      let u_549 = PRIM_AddInt(u_542,u_548) in
                      PRIM_CharChr(u_549) in
                      (fun f_551 -> Cons1(u_550, f_551))
                      acc_543_84'15))
                      let u_552 = 10 in
                      PRIM_DivInt(f_545,u_552)))) in
                match let u_554 = 0 in
                PRIM_EqInt(u_521,u_554) with
                | true1 ->
                  (let u_555 = '0' in
                  (fun f_556 -> Cons1(u_555, f_556))
                  Nil0)
                | false0 -> ((u_553 Nil0) u_521)) in
                let u_558 = Unit0 in
                let u_559 = '\n' in
                let u_560 = 8 in
                let u_561 = PRIM_CharOrd(u_559) in
                match PRIM_EqInt(u_561,u_560) with
                | true1 -> PRIM_PutChar(u_559)
                | false0 ->
                  match let u_562 = '\n' in
                  PRIM_EqChar(u_559,u_562) with
                  | true1 -> PRIM_PutChar(u_559)
                  | false0 ->
                    match let u_563 = 26 in
                    PRIM_LessInt(u_563,u_561) with
                    | true1 -> PRIM_PutChar(u_559)
                    | false0 ->
                      let u_565 = let u_564 = '^' in
                      PRIM_PutChar(u_564) in
                      let u_572 = let u_571 = (let u_569 = (let u_567 = let u_566 = 'A' in
                      PRIM_CharOrd(u_566) in
                      (fun f_568 -> PRIM_AddInt(u_567,f_568))
                      u_561) in
                      (fun f_570 -> PRIM_SubInt(u_569,f_570))
                      1) in
                      PRIM_CharChr(u_571) in
                      PRIM_PutChar(u_572)
        | false0 ->
          match let u_574 = let u_573 = "rev" in
          PRIM_Explode(u_573) in
          (((u_11 (fun f_575 -> (fun f_576 -> PRIM_EqChar(f_575,f_576)))) command_293_207'4) u_574) with
          | true1 ->
            match args_294_207'13 with
            | Cons1(__577_178'4,__578_178'7) ->
              let u_579 = "rev: expected no arguments" in
              let u_581 = let u_580 = "ERROR: " in
              (u_52 PRIM_Explode(u_580)) in
              let u_582 = (u_52 PRIM_Explode(u_579)) in
              let u_583 = Unit0 in
              let u_584 = '\n' in
              let u_585 = 8 in
              let u_586 = PRIM_CharOrd(u_584) in
              match PRIM_EqInt(u_586,u_585) with
              | true1 -> PRIM_PutChar(u_584)
              | false0 ->
                match let u_587 = '\n' in
                PRIM_EqChar(u_584,u_587) with
                | true1 -> PRIM_PutChar(u_584)
                | false0 ->
                  match let u_588 = 26 in
                  PRIM_LessInt(u_588,u_586) with
                  | true1 -> PRIM_PutChar(u_584)
                  | false0 ->
                    let u_590 = let u_589 = '^' in
                    PRIM_PutChar(u_589) in
                    let u_597 = let u_596 = (let u_594 = (let u_592 = let u_591 = 'A' in
                    PRIM_CharOrd(u_591) in
                    (fun f_593 -> PRIM_AddInt(u_592,f_593))
                    u_586) in
                    (fun f_595 -> PRIM_SubInt(u_594,f_595))
                    1) in
                    PRIM_CharChr(u_596) in
                    PRIM_PutChar(u_597)
            | Nil0 ->
              let u_599 = let u_598 = "(reverse typed lines until ^D)\n" in
              (u_52 PRIM_Explode(u_598)) in
              let u_600 = Unit0 in
              let u_811 = fix (fun loop_602_169'10 __601_169'14 ->
                let u_785 = let u_603 = Unit0 in
                let u_605 = let u_604 = 4 in
                PRIM_CharChr(u_604) in
                let u_784 = fix (fun loop_607_103'10 acc_606_103'15 ->
                  let u_609 = let u_608 = Unit0 in
                  PRIM_GetChar(u_608) in
                  let u_610 = PRIM_CharOrd(u_609) in
                  match let u_611 = '\n' in
                  PRIM_EqChar(u_609,u_611) with
                  | true1 ->
                    let u_627 = let u_612 = Unit0 in
                    let u_613 = '\n' in
                    let u_614 = 8 in
                    let u_615 = PRIM_CharOrd(u_613) in
                    match PRIM_EqInt(u_615,u_614) with
                    | true1 -> PRIM_PutChar(u_613)
                    | false0 ->
                      match let u_616 = '\n' in
                      PRIM_EqChar(u_613,u_616) with
                      | true1 -> PRIM_PutChar(u_613)
                      | false0 ->
                        match let u_617 = 26 in
                        PRIM_LessInt(u_617,u_615) with
                        | true1 -> PRIM_PutChar(u_613)
                        | false0 ->
                          let u_619 = let u_618 = '^' in
                          PRIM_PutChar(u_618) in
                          let u_626 = let u_625 = (let u_623 = (let u_621 = let u_620 = 'A' in
                          PRIM_CharOrd(u_620) in
                          (fun f_622 -> PRIM_AddInt(u_621,f_622))
                          u_615) in
                          (fun f_624 -> PRIM_SubInt(u_623,f_624))
                          1) in
                          PRIM_CharChr(u_625) in
                          PRIM_PutChar(u_626) in
                    let u_633 = fix (fun loop_629_64'10 acc_628_64'15 ->
                      (fun f_630 ->
                        match f_630 with
                        | Nil0 -> acc_628_64'15
                        | Cons1(x_631_67'6,xs_632_67'9) -> ((loop_629_64'10 Cons1(x_631_67'6, acc_628_64'15)) xs_632_67'9))) in
                    ((u_633 Nil0) acc_606_103'15)
                  | false0 ->
                    match PRIM_EqChar(u_609,u_605) with
                    | true1 ->
                      let u_647 = let u_634 = 8 in
                      let u_635 = PRIM_CharOrd(u_609) in
                      match PRIM_EqInt(u_635,u_634) with
                      | true1 -> PRIM_PutChar(u_609)
                      | false0 ->
                        match let u_636 = '\n' in
                        PRIM_EqChar(u_609,u_636) with
                        | true1 -> PRIM_PutChar(u_609)
                        | false0 ->
                          match let u_637 = 26 in
                          PRIM_LessInt(u_637,u_635) with
                          | true1 -> PRIM_PutChar(u_609)
                          | false0 ->
                            let u_639 = let u_638 = '^' in
                            PRIM_PutChar(u_638) in
                            let u_646 = let u_645 = (let u_643 = (let u_641 = let u_640 = 'A' in
                            PRIM_CharOrd(u_640) in
                            (fun f_642 -> PRIM_AddInt(u_641,f_642))
                            u_635) in
                            (fun f_644 -> PRIM_SubInt(u_643,f_644))
                            1) in
                            PRIM_CharChr(u_645) in
                            PRIM_PutChar(u_646) in
                      let u_663 = let u_648 = Unit0 in
                      let u_649 = '\n' in
                      let u_650 = 8 in
                      let u_651 = PRIM_CharOrd(u_649) in
                      match PRIM_EqInt(u_651,u_650) with
                      | true1 -> PRIM_PutChar(u_649)
                      | false0 ->
                        match let u_652 = '\n' in
                        PRIM_EqChar(u_649,u_652) with
                        | true1 -> PRIM_PutChar(u_649)
                        | false0 ->
                          match let u_653 = 26 in
                          PRIM_LessInt(u_653,u_651) with
                          | true1 -> PRIM_PutChar(u_649)
                          | false0 ->
                            let u_655 = let u_654 = '^' in
                            PRIM_PutChar(u_654) in
                            let u_662 = let u_661 = (let u_659 = (let u_657 = let u_656 = 'A' in
                            PRIM_CharOrd(u_656) in
                            (fun f_658 -> PRIM_AddInt(u_657,f_658))
                            u_651) in
                            (fun f_660 -> PRIM_SubInt(u_659,f_660))
                            1) in
                            PRIM_CharChr(u_661) in
                            PRIM_PutChar(u_662) in
                      let u_664 = Cons1(u_605, acc_606_103'15) in
                      let u_670 = fix (fun loop_666_64'10 acc_665_64'15 ->
                        (fun f_667 ->
                          match f_667 with
                          | Nil0 -> acc_665_64'15
                          | Cons1(x_668_67'6,xs_669_67'9) -> ((loop_666_64'10 Cons1(x_668_67'6, acc_665_64'15)) xs_669_67'9))) in
                      ((u_670 Nil0) u_664)
                    | false0 ->
                      match let u_671 = 127 in
                      PRIM_LessInt(u_671,u_610) with
                      | true1 -> (loop_607_103'10 acc_606_103'15)
                      | false0 ->
                        match let u_672 = 127 in
                        PRIM_EqInt(u_610,u_672) with
                        | true1 ->
                          match acc_606_103'15 with
                          | Nil0 -> (loop_607_103'10 acc_606_103'15)
                          | Cons1(c_673_112'14,tail_674_112'17) ->
                            let u_723 = match (let u_675 = PRIM_CharOrd(c_673_112'14) in
                            (fun f_676 ->
                              let u_677 = PRIM_LessInt(f_676,u_675) in
                              match u_677 with
                              | true1 -> false0
                              | false0 -> true1)
                            26) with
                            | true1 ->
                              let u_678 = Unit0 in
                              let u_680 = let u_679 = 8 in
                              PRIM_CharChr(u_679) in
                              let u_694 = let u_681 = 8 in
                              let u_682 = PRIM_CharOrd(u_680) in
                              match PRIM_EqInt(u_682,u_681) with
                              | true1 -> PRIM_PutChar(u_680)
                              | false0 ->
                                match let u_683 = '\n' in
                                PRIM_EqChar(u_680,u_683) with
                                | true1 -> PRIM_PutChar(u_680)
                                | false0 ->
                                  match let u_684 = 26 in
                                  PRIM_LessInt(u_684,u_682) with
                                  | true1 -> PRIM_PutChar(u_680)
                                  | false0 ->
                                    let u_686 = let u_685 = '^' in
                                    PRIM_PutChar(u_685) in
                                    let u_693 = let u_692 = (let u_690 = (let u_688 = let u_687 = 'A' in
                                    PRIM_CharOrd(u_687) in
                                    (fun f_689 -> PRIM_AddInt(u_688,f_689))
                                    u_682) in
                                    (fun f_691 -> PRIM_SubInt(u_690,f_691))
                                    1) in
                                    PRIM_CharChr(u_692) in
                                    PRIM_PutChar(u_693) in
                              let u_709 = let u_695 = ' ' in
                              let u_696 = 8 in
                              let u_697 = PRIM_CharOrd(u_695) in
                              match PRIM_EqInt(u_697,u_696) with
                              | true1 -> PRIM_PutChar(u_695)
                              | false0 ->
                                match let u_698 = '\n' in
                                PRIM_EqChar(u_695,u_698) with
                                | true1 -> PRIM_PutChar(u_695)
                                | false0 ->
                                  match let u_699 = 26 in
                                  PRIM_LessInt(u_699,u_697) with
                                  | true1 -> PRIM_PutChar(u_695)
                                  | false0 ->
                                    let u_701 = let u_700 = '^' in
                                    PRIM_PutChar(u_700) in
                                    let u_708 = let u_707 = (let u_705 = (let u_703 = let u_702 = 'A' in
                                    PRIM_CharOrd(u_702) in
                                    (fun f_704 -> PRIM_AddInt(u_703,f_704))
                                    u_697) in
                                    (fun f_706 -> PRIM_SubInt(u_705,f_706))
                                    1) in
                                    PRIM_CharChr(u_707) in
                                    PRIM_PutChar(u_708) in
                              let u_710 = 8 in
                              let u_711 = PRIM_CharOrd(u_680) in
                              match PRIM_EqInt(u_711,u_710) with
                              | true1 -> PRIM_PutChar(u_680)
                              | false0 ->
                                match let u_712 = '\n' in
                                PRIM_EqChar(u_680,u_712) with
                                | true1 -> PRIM_PutChar(u_680)
                                | false0 ->
                                  match let u_713 = 26 in
                                  PRIM_LessInt(u_713,u_711) with
                                  | true1 -> PRIM_PutChar(u_680)
                                  | false0 ->
                                    let u_715 = let u_714 = '^' in
                                    PRIM_PutChar(u_714) in
                                    let u_722 = let u_721 = (let u_719 = (let u_717 = let u_716 = 'A' in
                                    PRIM_CharOrd(u_716) in
                                    (fun f_718 -> PRIM_AddInt(u_717,f_718))
                                    u_711) in
                                    (fun f_720 -> PRIM_SubInt(u_719,f_720))
                                    1) in
                                    PRIM_CharChr(u_721) in
                                    PRIM_PutChar(u_722)
                            | false0 -> Unit0 in
                            let u_769 = let u_724 = Unit0 in
                            let u_726 = let u_725 = 8 in
                            PRIM_CharChr(u_725) in
                            let u_740 = let u_727 = 8 in
                            let u_728 = PRIM_CharOrd(u_726) in
                            match PRIM_EqInt(u_728,u_727) with
                            | true1 -> PRIM_PutChar(u_726)
                            | false0 ->
                              match let u_729 = '\n' in
                              PRIM_EqChar(u_726,u_729) with
                              | true1 -> PRIM_PutChar(u_726)
                              | false0 ->
                                match let u_730 = 26 in
                                PRIM_LessInt(u_730,u_728) with
                                | true1 -> PRIM_PutChar(u_726)
                                | false0 ->
                                  let u_732 = let u_731 = '^' in
                                  PRIM_PutChar(u_731) in
                                  let u_739 = let u_738 = (let u_736 = (let u_734 = let u_733 = 'A' in
                                  PRIM_CharOrd(u_733) in
                                  (fun f_735 -> PRIM_AddInt(u_734,f_735))
                                  u_728) in
                                  (fun f_737 -> PRIM_SubInt(u_736,f_737))
                                  1) in
                                  PRIM_CharChr(u_738) in
                                  PRIM_PutChar(u_739) in
                            let u_755 = let u_741 = ' ' in
                            let u_742 = 8 in
                            let u_743 = PRIM_CharOrd(u_741) in
                            match PRIM_EqInt(u_743,u_742) with
                            | true1 -> PRIM_PutChar(u_741)
                            | false0 ->
                              match let u_744 = '\n' in
                              PRIM_EqChar(u_741,u_744) with
                              | true1 -> PRIM_PutChar(u_741)
                              | false0 ->
                                match let u_745 = 26 in
                                PRIM_LessInt(u_745,u_743) with
                                | true1 -> PRIM_PutChar(u_741)
                                | false0 ->
                                  let u_747 = let u_746 = '^' in
                                  PRIM_PutChar(u_746) in
                                  let u_754 = let u_753 = (let u_751 = (let u_749 = let u_748 = 'A' in
                                  PRIM_CharOrd(u_748) in
                                  (fun f_750 -> PRIM_AddInt(u_749,f_750))
                                  u_743) in
                                  (fun f_752 -> PRIM_SubInt(u_751,f_752))
                                  1) in
                                  PRIM_CharChr(u_753) in
                                  PRIM_PutChar(u_754) in
                            let u_756 = 8 in
                            let u_757 = PRIM_CharOrd(u_726) in
                            match PRIM_EqInt(u_757,u_756) with
                            | true1 -> PRIM_PutChar(u_726)
                            | false0 ->
                              match let u_758 = '\n' in
                              PRIM_EqChar(u_726,u_758) with
                              | true1 -> PRIM_PutChar(u_726)
                              | false0 ->
                                match let u_759 = 26 in
                                PRIM_LessInt(u_759,u_757) with
                                | true1 -> PRIM_PutChar(u_726)
                                | false0 ->
                                  let u_761 = let u_760 = '^' in
                                  PRIM_PutChar(u_760) in
                                  let u_768 = let u_767 = (let u_765 = (let u_763 = let u_762 = 'A' in
                                  PRIM_CharOrd(u_762) in
                                  (fun f_764 -> PRIM_AddInt(u_763,f_764))
                                  u_757) in
                                  (fun f_766 -> PRIM_SubInt(u_765,f_766))
                                  1) in
                                  PRIM_CharChr(u_767) in
                                  PRIM_PutChar(u_768) in
                            (loop_607_103'10 tail_674_112'17)
                        | false0 ->
                          let u_783 = let u_770 = 8 in
                          let u_771 = PRIM_CharOrd(u_609) in
                          match PRIM_EqInt(u_771,u_770) with
                          | true1 -> PRIM_PutChar(u_609)
                          | false0 ->
                            match let u_772 = '\n' in
                            PRIM_EqChar(u_609,u_772) with
                            | true1 -> PRIM_PutChar(u_609)
                            | false0 ->
                              match let u_773 = 26 in
                              PRIM_LessInt(u_773,u_771) with
                              | true1 -> PRIM_PutChar(u_609)
                              | false0 ->
                                let u_775 = let u_774 = '^' in
                                PRIM_PutChar(u_774) in
                                let u_782 = let u_781 = (let u_779 = (let u_777 = let u_776 = 'A' in
                                PRIM_CharOrd(u_776) in
                                (fun f_778 -> PRIM_AddInt(u_777,f_778))
                                u_771) in
                                (fun f_780 -> PRIM_SubInt(u_779,f_780))
                                1) in
                                PRIM_CharChr(u_781) in
                                PRIM_PutChar(u_782) in
                          (loop_607_103'10 Cons1(u_609, acc_606_103'15))) in
                (u_784 Nil0) in
                match (((u_11 (fun f_786 -> (fun f_787 -> PRIM_EqChar(f_786,f_787)))) u_785) u_72) with
                | true1 -> Unit0
                | false0 ->
                  let u_794 = (u_52
                  let u_793 = fix (fun loop_789_64'10 acc_788_64'15 ->
                    (fun f_790 ->
                      match f_790 with
                      | Nil0 -> acc_788_64'15
                      | Cons1(x_791_67'6,xs_792_67'9) -> ((loop_789_64'10 Cons1(x_791_67'6, acc_788_64'15)) xs_792_67'9))) in
                  ((u_793 Nil0) u_785)) in
                  let u_810 = let u_795 = Unit0 in
                  let u_796 = '\n' in
                  let u_797 = 8 in
                  let u_798 = PRIM_CharOrd(u_796) in
                  match PRIM_EqInt(u_798,u_797) with
                  | true1 -> PRIM_PutChar(u_796)
                  | false0 ->
                    match let u_799 = '\n' in
                    PRIM_EqChar(u_796,u_799) with
                    | true1 -> PRIM_PutChar(u_796)
                    | false0 ->
                      match let u_800 = 26 in
                      PRIM_LessInt(u_800,u_798) with
                      | true1 -> PRIM_PutChar(u_796)
                      | false0 ->
                        let u_802 = let u_801 = '^' in
                        PRIM_PutChar(u_801) in
                        let u_809 = let u_808 = (let u_806 = (let u_804 = let u_803 = 'A' in
                        PRIM_CharOrd(u_803) in
                        (fun f_805 -> PRIM_AddInt(u_804,f_805))
                        u_798) in
                        (fun f_807 -> PRIM_SubInt(u_806,f_807))
                        1) in
                        PRIM_CharChr(u_808) in
                        PRIM_PutChar(u_809) in
                  (loop_602_169'10 Unit0)) in
              (u_811 Unit0)
          | false0 ->
            let u_814 = (u_26
            (fun f_812 ->
              match let u_813 = 'o' in
              PRIM_EqChar(f_812,u_813) with
              | true1 -> '*'
              | false0 -> f_812)) in
            let u_815 = (u_33 u_258) in
            let u_817 = (u_52
            ((u_18
            let u_816 = "You wrote: \"" in
            PRIM_Explode(u_816))
            (u_814 u_258))) in
            let u_819 = let u_818 = "\" (" in
            (u_52 PRIM_Explode(u_818)) in
            let u_836 = (u_52
            let u_821 = let u_820 = '0' in
            PRIM_CharOrd(u_820) in
            let u_832 = fix (fun loop_823_84'10 acc_822_84'15 ->
              (fun f_824 ->
                match let u_825 = 0 in
                PRIM_EqInt(f_824,u_825) with
                | true1 -> acc_822_84'15
                | false0 ->
                  ((loop_823_84'10
                  (let u_829 = let u_827 = let u_826 = 10 in
                  PRIM_ModInt(f_824,u_826) in
                  let u_828 = PRIM_AddInt(u_821,u_827) in
                  PRIM_CharChr(u_828) in
                  (fun f_830 -> Cons1(u_829, f_830))
                  acc_822_84'15))
                  let u_831 = 10 in
                  PRIM_DivInt(f_824,u_831)))) in
            match let u_833 = 0 in
            PRIM_EqInt(u_815,u_833) with
            | true1 ->
              (let u_834 = '0' in
              (fun f_835 -> Cons1(u_834, f_835))
              Nil0)
            | false0 -> ((u_832 Nil0) u_815)) in
            let u_838 = let u_837 = " chars)" in
            (u_52 PRIM_Explode(u_837)) in
            let u_839 = Unit0 in
            let u_840 = '\n' in
            let u_841 = 8 in
            let u_842 = PRIM_CharOrd(u_840) in
            match PRIM_EqInt(u_842,u_841) with
            | true1 -> PRIM_PutChar(u_840)
            | false0 ->
              match let u_843 = '\n' in
              PRIM_EqChar(u_840,u_843) with
              | true1 -> PRIM_PutChar(u_840)
              | false0 ->
                match let u_844 = 26 in
                PRIM_LessInt(u_844,u_842) with
                | true1 -> PRIM_PutChar(u_840)
                | false0 ->
                  let u_846 = let u_845 = '^' in
                  PRIM_PutChar(u_845) in
                  let u_853 = let u_852 = (let u_850 = (let u_848 = let u_847 = 'A' in
                  PRIM_CharOrd(u_847) in
                  (fun f_849 -> PRIM_AddInt(u_848,f_849))
                  u_842) in
                  (fun f_851 -> PRIM_SubInt(u_850,f_851))
                  1) in
                  PRIM_CharChr(u_852) in
                  PRIM_PutChar(u_853) in
    (mainloop_74_213'8 Unit0)) in
let u_856 = Unit0 in
let u_858 = let u_857 = "This is a shell prototype. Try: fib, fact, rev\n" in
(u_52 PRIM_Explode(u_857)) in
(u_855 Unit0)
