(*stage3*)
let k () = ()
let g2 = CID1 in
let g3 = CID0 in
let g4 = CID0 in
let g5 = CID0 in
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match f2 with
      | Nil0 ->
        match arg with
        | Nil0 -> k g2
        | Cons1(t1,t2) -> k g3
      | Cons1(t1,t2) ->
        match arg with
        | Nil0 -> k g4
        | Cons1(t3,t4) ->
          let k = [f1,t2,t3,t4], fun [f1,f2,f3,f4] arg ->
            let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
              match arg with
              | true1 ->
                let k = [f2,f3], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  arg f1 k in
                g1 f1 k
              | false0 -> k g5 in
            arg f3 k in
          f1 t1 k in
    k t1 in
  k t1 in
let g6 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t1], fun [f1,f2] arg ->
        let k = [f2], fun [f1] arg ->
          let t1 = CID1[f1,arg] in
          k t1 in
        arg f1 k in
      g6 t2 k in
  k t1 in
let g8 = CID0 in
let g7 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g8
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f1,f2] arg ->
        let k = [f2,arg], fun [f1,f2] arg ->
          let k = [f2], fun [f1] arg ->
            let t1 = CID1[f1,arg] in
            k t1 in
          arg f1 k in
        g7 f1 k in
      f1 t1 k in
  k t1 in
let g10 = 0 in
let g11 = 1 in
let g9 = fun arg k ->
  match arg with
  | Nil0 -> k g10
  | Cons1(t1,t2) ->
    let k = [], fun [] arg ->
      let t1 = PRIM_AddInt(g11,arg) in
      k t1 in
    g9 t2 k in
let g13 = CID0 in
let g14 = 8 in
let g15 = '\n' in
let g16 = 26 in
let g17 = '^' in
let g18 = 65 in
let g19 = 1 in
let g12 = fun arg k ->
  match arg with
  | Nil0 -> k g13
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,g14) in
    let k = [t2], fun [f1] arg -> g12 f1 k in
    match t4 with
    | true1 ->
      let t5 = PRIM_PutChar(t1) in
      k t5
    | false0 ->
      let t5 = PRIM_EqChar(t1,g15) in
      match t5 with
      | true1 ->
        let t6 = PRIM_PutChar(t1) in
        k t6
      | false0 ->
        let t6 = PRIM_LessInt(g16,t3) in
        match t6 with
        | true1 ->
          let t7 = PRIM_PutChar(t1) in
          k t7
        | false0 ->
          let t7 = PRIM_PutChar(g17) in
          let t8 = PRIM_AddInt(g18,t3) in
          let t9 = PRIM_SubInt(t8,g19) in
          let t10 = PRIM_CharChr(t9) in
          let t11 = PRIM_PutChar(t10) in
          k t11 in
let g21 = 2 in
let g22 = 1 in
let g23 = 2 in
let g20 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g21) in
  match t1 with
  | true1 -> k arg
  | false0 ->
    let t2 = PRIM_SubInt(arg,g22) in
    let k = [arg], fun [f1] arg ->
      let t1 = PRIM_SubInt(f1,g23) in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      g20 t1 k in
    g20 t2 k in
let g25 = 2 in
let g26 = CID0 in
let g27 = CID1 in
let g28 = 1 in
let g29 = 1 in
let g24 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g25) in
  let k = [arg], fun [f1] arg ->
    match arg with
    | true1 ->
      let t1 = PRIM_SubInt(f1,g28) in
      let k = [f1], fun [f1] arg ->
        let t1 = PRIM_MulInt(arg,f1) in
        k t1 in
      g24 t1 k
    | false0 -> k g29 in
  match t1 with
  | true1 -> k g26
  | false0 -> k g27 in
let g31 = '>' in
let g32 = ' ' in
let g33 = CID0 in
let g34 = CID1[g32,g33] in
let g35 = CID1[g31,g34] in
let g37 = CID0 in
let g38 = '\n' in
let g39 = '\n' in
let g40 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g40 t3 k in
  k t1 in
let g41 = CID0 in
let g42 = '\EOT' in
let g43 = 8 in
let g44 = '\n' in
let g45 = 26 in
let g46 = '^' in
let g47 = 65 in
let g48 = 1 in
let g49 = '\n' in
let g50 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g50 t3 k in
  k t1 in
let g51 = CID0 in
let g52 = '\EOT' in
let g53 = 127 in
let g54 = 127 in
let g55 = 26 in
let g56 = CID0 in
let g57 = CID1 in
let g58 = '\b' in
let g59 = ' ' in
let g60 = '\b' in
let g61 = CID0 in
let g62 = '\b' in
let g63 = ' ' in
let g64 = '\b' in
let g65 = 8 in
let g66 = '\n' in
let g67 = 26 in
let g68 = '^' in
let g69 = 65 in
let g70 = 1 in
let g36 = fun arg k ->
  let t1 = PRIM_GetChar(g37) in
  let t2 = PRIM_CharOrd(t1) in
  let t3 = PRIM_EqChar(t1,g38) in
  match t3 with
  | true1 ->
    let t4 = PRIM_PutChar(g39) in
    let k = [arg], fun [f1] arg -> arg f1 k in
    g40 g41 k
  | false0 ->
    let t4 = PRIM_EqChar(t1,g42) in
    match t4 with
    | true1 ->
      let t5 = PRIM_CharOrd(t1) in
      let t6 = PRIM_EqInt(t5,g43) in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_PutChar(g49) in
        let k = [f1], fun [f1] arg ->
          let t1 = CID1[g52,f1] in
          arg t1 k in
        g50 g51 k in
      match t6 with
      | true1 ->
        let t7 = PRIM_PutChar(t1) in
        k t7
      | false0 ->
        let t7 = PRIM_EqChar(t1,g44) in
        match t7 with
        | true1 ->
          let t8 = PRIM_PutChar(t1) in
          k t8
        | false0 ->
          let t8 = PRIM_LessInt(g45,t5) in
          match t8 with
          | true1 ->
            let t9 = PRIM_PutChar(t1) in
            k t9
          | false0 ->
            let t9 = PRIM_PutChar(g46) in
            let t10 = PRIM_AddInt(g47,t5) in
            let t11 = PRIM_SubInt(t10,g48) in
            let t12 = PRIM_CharChr(t11) in
            let t13 = PRIM_PutChar(t12) in
            k t13
    | false0 ->
      let t5 = PRIM_LessInt(g53,t2) in
      match t5 with
      | true1 -> g36 arg k
      | false0 ->
        let t6 = PRIM_EqInt(t2,g54) in
        match t6 with
        | true1 ->
          match arg with
          | Nil0 -> g36 arg k
          | Cons1(t7,t8) ->
            let t9 = PRIM_CharOrd(t7) in
            let t10 = PRIM_LessInt(g55,t9) in
            let k = [t8], fun [f1] arg ->
              let k = [f1], fun [f1] arg ->
                let t1 = PRIM_PutChar(g62) in
                let t2 = PRIM_PutChar(g63) in
                let t3 = PRIM_PutChar(g64) in
                g36 f1 k in
              match arg with
              | true1 ->
                let t1 = PRIM_PutChar(g58) in
                let t2 = PRIM_PutChar(g59) in
                let t3 = PRIM_PutChar(g60) in
                k t3
              | false0 -> k g61 in
            match t10 with
            | true1 -> k g56
            | false0 -> k g57
        | false0 ->
          let t7 = PRIM_CharOrd(t1) in
          let t8 = PRIM_EqInt(t7,g65) in
          let k = [arg,t1], fun [f1,f2] arg ->
            let t1 = CID1[f2,f1] in
            g36 t1 k in
          match t8 with
          | true1 ->
            let t9 = PRIM_PutChar(t1) in
            k t9
          | false0 ->
            let t9 = PRIM_EqChar(t1,g66) in
            match t9 with
            | true1 ->
              let t10 = PRIM_PutChar(t1) in
              k t10
            | false0 ->
              let t10 = PRIM_LessInt(g67,t7) in
              match t10 with
              | true1 ->
                let t11 = PRIM_PutChar(t1) in
                k t11
              | false0 ->
                let t11 = PRIM_PutChar(g68) in
                let t12 = PRIM_AddInt(g69,t7) in
                let t13 = PRIM_SubInt(t12,g70) in
                let t14 = PRIM_CharChr(t13) in
                let t15 = PRIM_PutChar(t14) in
                k t15 in
let g71 = CID0 in
let g72 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g73 = '\EOT' in
let g74 = CID0 in
let g75 = CID1[g73,g74] in
let g76 = CID0 in
let g78 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g78 t3 k in
  k t1 in
let g79 = CID0 in
let g80 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g80 t3 k in
  k t1 in
let g81 = CID0 in
let g82 = ' ' in
let g83 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g83 t3 k in
  k t1 in
let g84 = CID0 in
let g85 = CID0 in
let g77 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match arg with
      | Nil0 ->
        let k = [f1,f2], fun [f1,f2] arg ->
          let k = [f1], fun [f1] arg ->
            let k = [f1,arg], fun [f1,f2] arg ->
              let t1 = CID1[f2,f1] in
              arg t1 k in
            g80 g81 k in
          arg f2 k in
        g78 g79 k
      | Cons1(t1,t2) ->
        let t3 = PRIM_EqChar(t1,g82) in
        match t3 with
        | true1 ->
          let k = [f1,f2,t2], fun [f1,f2,f3] arg ->
            let k = [f1,f3], fun [f1,f2] arg ->
              let t1 = CID1[arg,f1] in
              let k = [f2], fun [f1] arg ->
                let k = [f1], fun [f1] arg -> arg f1 k in
                arg g85 k in
              g77 t1 k in
            arg f2 k in
          g83 g84 k
        | false0 ->
          let k = [f2,t1,t2], fun [f1,f2,f3] arg ->
            let t1 = CID1[f2,f1] in
            let k = [f3], fun [f1] arg -> arg f1 k in
            arg t1 k in
          g77 f1 k in
    k t1 in
  k t1 in
let g86 = CID0 in
let g87 = CID0 in
let g88 = CID0 in
let g89 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g90 = 'f' in
let g91 = 'i' in
let g92 = 'b' in
let g93 = CID0 in
let g94 = CID1[g92,g93] in
let g95 = CID1[g91,g94] in
let g96 = CID1[g90,g95] in
let g97 = 'f' in
let g98 = 'i' in
let g99 = 'b' in
let g100 = ':' in
let g101 = ' ' in
let g102 = CID0 in
let g103 = CID1[g101,g102] in
let g104 = CID1[g100,g103] in
let g105 = CID1[g99,g104] in
let g106 = CID1[g98,g105] in
let g107 = CID1[g97,g106] in
let g108 = 'E' in
let g109 = 'R' in
let g110 = 'R' in
let g111 = 'O' in
let g112 = 'R' in
let g113 = ':' in
let g114 = ' ' in
let g115 = CID0 in
let g116 = CID1[g114,g115] in
let g117 = CID1[g113,g116] in
let g118 = CID1[g112,g117] in
let g119 = CID1[g111,g118] in
let g120 = CID1[g110,g119] in
let g121 = CID1[g109,g120] in
let g122 = CID1[g108,g121] in
let g123 = 'e' in
let g124 = 'x' in
let g125 = 'p' in
let g126 = 'e' in
let g127 = 'c' in
let g128 = 't' in
let g129 = 'e' in
let g130 = 'd' in
let g131 = ' ' in
let g132 = 'a' in
let g133 = 'n' in
let g134 = ' ' in
let g135 = 'a' in
let g136 = 'r' in
let g137 = 'g' in
let g138 = 'u' in
let g139 = 'm' in
let g140 = 'e' in
let g141 = 'n' in
let g142 = 't' in
let g143 = CID0 in
let g144 = CID1[g142,g143] in
let g145 = CID1[g141,g144] in
let g146 = CID1[g140,g145] in
let g147 = CID1[g139,g146] in
let g148 = CID1[g138,g147] in
let g149 = CID1[g137,g148] in
let g150 = CID1[g136,g149] in
let g151 = CID1[g135,g150] in
let g152 = CID1[g134,g151] in
let g153 = CID1[g133,g152] in
let g154 = CID1[g132,g153] in
let g155 = CID1[g131,g154] in
let g156 = CID1[g130,g155] in
let g157 = CID1[g129,g156] in
let g158 = CID1[g128,g157] in
let g159 = CID1[g127,g158] in
let g160 = CID1[g126,g159] in
let g161 = CID1[g125,g160] in
let g162 = CID1[g124,g161] in
let g163 = CID1[g123,g162] in
let g164 = '\n' in
let g165 = 'E' in
let g166 = 'R' in
let g167 = 'R' in
let g168 = 'O' in
let g169 = 'R' in
let g170 = ':' in
let g171 = ' ' in
let g172 = CID0 in
let g173 = CID1[g171,g172] in
let g174 = CID1[g170,g173] in
let g175 = CID1[g169,g174] in
let g176 = CID1[g168,g175] in
let g177 = CID1[g167,g176] in
let g178 = CID1[g166,g177] in
let g179 = CID1[g165,g178] in
let g180 = 'e' in
let g181 = 'x' in
let g182 = 'p' in
let g183 = 'e' in
let g184 = 'c' in
let g185 = 't' in
let g186 = 'e' in
let g187 = 'd' in
let g188 = ' ' in
let g189 = 'e' in
let g190 = 'x' in
let g191 = 'a' in
let g192 = 'c' in
let g193 = 't' in
let g194 = 'l' in
let g195 = 'y' in
let g196 = ' ' in
let g197 = 'o' in
let g198 = 'n' in
let g199 = 'e' in
let g200 = ' ' in
let g201 = 'a' in
let g202 = 'r' in
let g203 = 'g' in
let g204 = 'u' in
let g205 = 'm' in
let g206 = 'e' in
let g207 = 'n' in
let g208 = 't' in
let g209 = CID0 in
let g210 = CID1[g208,g209] in
let g211 = CID1[g207,g210] in
let g212 = CID1[g206,g211] in
let g213 = CID1[g205,g212] in
let g214 = CID1[g204,g213] in
let g215 = CID1[g203,g214] in
let g216 = CID1[g202,g215] in
let g217 = CID1[g201,g216] in
let g218 = CID1[g200,g217] in
let g219 = CID1[g199,g218] in
let g220 = CID1[g198,g219] in
let g221 = CID1[g197,g220] in
let g222 = CID1[g196,g221] in
let g223 = CID1[g195,g222] in
let g224 = CID1[g194,g223] in
let g225 = CID1[g193,g224] in
let g226 = CID1[g192,g225] in
let g227 = CID1[g191,g226] in
let g228 = CID1[g190,g227] in
let g229 = CID1[g189,g228] in
let g230 = CID1[g188,g229] in
let g231 = CID1[g187,g230] in
let g232 = CID1[g186,g231] in
let g233 = CID1[g185,g232] in
let g234 = CID1[g184,g233] in
let g235 = CID1[g183,g234] in
let g236 = CID1[g182,g235] in
let g237 = CID1[g181,g236] in
let g238 = CID1[g180,g237] in
let g239 = '\n' in
let g241 = 48 in
let g242 = 0 in
let g243 = CID0 in
let g244 = CID1 in
let g245 = 9 in
let g246 = CID0 in
let g247 = CID1 in
let g248 = CID1 in
let g249 = CID1 in
let g250 = CID1 in
let g251 = 10 in
let g240 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = CID0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,g241) in
      let t5 = PRIM_LessInt(t4,g242) in
      let k = [f1,t2,t4], fun [f1,f2,f3] arg ->
        let k = [f1,f2], fun [f1,f2] arg ->
          match arg with
          | None1 -> k g250
          | Some0(t1) ->
            let t2 = PRIM_MulInt(g251,f1) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f2], fun [f1] arg -> arg f1 k in
            g240 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(g245,f3) in
          let k = [f3], fun [f1] arg ->
            match arg with
            | true1 ->
              let t1 = CID0[f1] in
              k t1
            | false0 -> k g248 in
          match t1 with
          | true1 -> k g246
          | false0 -> k g247
        | false0 -> k g249 in
      match t5 with
      | true1 -> k g243
      | false0 -> k g244 in
  k t1 in
let g252 = 0 in
let g253 = 'E' in
let g254 = 'R' in
let g255 = 'R' in
let g256 = 'O' in
let g257 = 'R' in
let g258 = ':' in
let g259 = ' ' in
let g260 = CID0 in
let g261 = CID1[g259,g260] in
let g262 = CID1[g258,g261] in
let g263 = CID1[g257,g262] in
let g264 = CID1[g256,g263] in
let g265 = CID1[g255,g264] in
let g266 = CID1[g254,g265] in
let g267 = CID1[g253,g266] in
let g268 = 'e' in
let g269 = 'x' in
let g270 = 'p' in
let g271 = 'e' in
let g272 = 'c' in
let g273 = 't' in
let g274 = 'e' in
let g275 = 'd' in
let g276 = ' ' in
let g277 = 'a' in
let g278 = 'r' in
let g279 = 'g' in
let g280 = '1' in
let g281 = ' ' in
let g282 = 't' in
let g283 = 'o' in
let g284 = ' ' in
let g285 = 'b' in
let g286 = 'e' in
let g287 = ' ' in
let g288 = 'n' in
let g289 = 'u' in
let g290 = 'm' in
let g291 = 'e' in
let g292 = 'r' in
let g293 = 'i' in
let g294 = 'c' in
let g295 = CID0 in
let g296 = CID1[g294,g295] in
let g297 = CID1[g293,g296] in
let g298 = CID1[g292,g297] in
let g299 = CID1[g291,g298] in
let g300 = CID1[g290,g299] in
let g301 = CID1[g289,g300] in
let g302 = CID1[g288,g301] in
let g303 = CID1[g287,g302] in
let g304 = CID1[g286,g303] in
let g305 = CID1[g285,g304] in
let g306 = CID1[g284,g305] in
let g307 = CID1[g283,g306] in
let g308 = CID1[g282,g307] in
let g309 = CID1[g281,g308] in
let g310 = CID1[g280,g309] in
let g311 = CID1[g279,g310] in
let g312 = CID1[g278,g311] in
let g313 = CID1[g277,g312] in
let g314 = CID1[g276,g313] in
let g315 = CID1[g275,g314] in
let g316 = CID1[g274,g315] in
let g317 = CID1[g273,g316] in
let g318 = CID1[g272,g317] in
let g319 = CID1[g271,g318] in
let g320 = CID1[g270,g319] in
let g321 = CID1[g269,g320] in
let g322 = CID1[g268,g321] in
let g323 = '\n' in
let g325 = 0 in
let g326 = 10 in
let g327 = 48 in
let g328 = 10 in
let g324 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g325) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g326) in
      let t3 = PRIM_AddInt(g327,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g328) in
        arg t1 k in
      g324 t5 k in
  k t1 in
let g329 = 0 in
let g330 = '0' in
let g331 = CID0 in
let g332 = CID1[g330,g331] in
let g333 = CID0 in
let g334 = ' ' in
let g335 = '-' in
let g336 = '-' in
let g337 = '>' in
let g338 = ' ' in
let g339 = CID0 in
let g340 = CID1[g338,g339] in
let g341 = CID1[g337,g340] in
let g342 = CID1[g336,g341] in
let g343 = CID1[g335,g342] in
let g344 = CID1[g334,g343] in
let g346 = 0 in
let g347 = 10 in
let g348 = 48 in
let g349 = 10 in
let g345 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g346) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g347) in
      let t3 = PRIM_AddInt(g348,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g349) in
        arg t1 k in
      g345 t5 k in
  k t1 in
let g350 = 0 in
let g351 = '0' in
let g352 = CID0 in
let g353 = CID1[g351,g352] in
let g354 = CID0 in
let g355 = '\n' in
let g356 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g357 = 'f' in
let g358 = 'a' in
let g359 = 'c' in
let g360 = 't' in
let g361 = CID0 in
let g362 = CID1[g360,g361] in
let g363 = CID1[g359,g362] in
let g364 = CID1[g358,g363] in
let g365 = CID1[g357,g364] in
let g366 = 'f' in
let g367 = 'a' in
let g368 = 'c' in
let g369 = 't' in
let g370 = ':' in
let g371 = ' ' in
let g372 = CID0 in
let g373 = CID1[g371,g372] in
let g374 = CID1[g370,g373] in
let g375 = CID1[g369,g374] in
let g376 = CID1[g368,g375] in
let g377 = CID1[g367,g376] in
let g378 = CID1[g366,g377] in
let g379 = 'E' in
let g380 = 'R' in
let g381 = 'R' in
let g382 = 'O' in
let g383 = 'R' in
let g384 = ':' in
let g385 = ' ' in
let g386 = CID0 in
let g387 = CID1[g385,g386] in
let g388 = CID1[g384,g387] in
let g389 = CID1[g383,g388] in
let g390 = CID1[g382,g389] in
let g391 = CID1[g381,g390] in
let g392 = CID1[g380,g391] in
let g393 = CID1[g379,g392] in
let g394 = 'e' in
let g395 = 'x' in
let g396 = 'p' in
let g397 = 'e' in
let g398 = 'c' in
let g399 = 't' in
let g400 = 'e' in
let g401 = 'd' in
let g402 = ' ' in
let g403 = 'a' in
let g404 = 'n' in
let g405 = ' ' in
let g406 = 'a' in
let g407 = 'r' in
let g408 = 'g' in
let g409 = 'u' in
let g410 = 'm' in
let g411 = 'e' in
let g412 = 'n' in
let g413 = 't' in
let g414 = CID0 in
let g415 = CID1[g413,g414] in
let g416 = CID1[g412,g415] in
let g417 = CID1[g411,g416] in
let g418 = CID1[g410,g417] in
let g419 = CID1[g409,g418] in
let g420 = CID1[g408,g419] in
let g421 = CID1[g407,g420] in
let g422 = CID1[g406,g421] in
let g423 = CID1[g405,g422] in
let g424 = CID1[g404,g423] in
let g425 = CID1[g403,g424] in
let g426 = CID1[g402,g425] in
let g427 = CID1[g401,g426] in
let g428 = CID1[g400,g427] in
let g429 = CID1[g399,g428] in
let g430 = CID1[g398,g429] in
let g431 = CID1[g397,g430] in
let g432 = CID1[g396,g431] in
let g433 = CID1[g395,g432] in
let g434 = CID1[g394,g433] in
let g435 = '\n' in
let g436 = 'E' in
let g437 = 'R' in
let g438 = 'R' in
let g439 = 'O' in
let g440 = 'R' in
let g441 = ':' in
let g442 = ' ' in
let g443 = CID0 in
let g444 = CID1[g442,g443] in
let g445 = CID1[g441,g444] in
let g446 = CID1[g440,g445] in
let g447 = CID1[g439,g446] in
let g448 = CID1[g438,g447] in
let g449 = CID1[g437,g448] in
let g450 = CID1[g436,g449] in
let g451 = 'e' in
let g452 = 'x' in
let g453 = 'p' in
let g454 = 'e' in
let g455 = 'c' in
let g456 = 't' in
let g457 = 'e' in
let g458 = 'd' in
let g459 = ' ' in
let g460 = 'e' in
let g461 = 'x' in
let g462 = 'a' in
let g463 = 'c' in
let g464 = 't' in
let g465 = 'l' in
let g466 = 'y' in
let g467 = ' ' in
let g468 = 'o' in
let g469 = 'n' in
let g470 = 'e' in
let g471 = ' ' in
let g472 = 'a' in
let g473 = 'r' in
let g474 = 'g' in
let g475 = 'u' in
let g476 = 'm' in
let g477 = 'e' in
let g478 = 'n' in
let g479 = 't' in
let g480 = CID0 in
let g481 = CID1[g479,g480] in
let g482 = CID1[g478,g481] in
let g483 = CID1[g477,g482] in
let g484 = CID1[g476,g483] in
let g485 = CID1[g475,g484] in
let g486 = CID1[g474,g485] in
let g487 = CID1[g473,g486] in
let g488 = CID1[g472,g487] in
let g489 = CID1[g471,g488] in
let g490 = CID1[g470,g489] in
let g491 = CID1[g469,g490] in
let g492 = CID1[g468,g491] in
let g493 = CID1[g467,g492] in
let g494 = CID1[g466,g493] in
let g495 = CID1[g465,g494] in
let g496 = CID1[g464,g495] in
let g497 = CID1[g463,g496] in
let g498 = CID1[g462,g497] in
let g499 = CID1[g461,g498] in
let g500 = CID1[g460,g499] in
let g501 = CID1[g459,g500] in
let g502 = CID1[g458,g501] in
let g503 = CID1[g457,g502] in
let g504 = CID1[g456,g503] in
let g505 = CID1[g455,g504] in
let g506 = CID1[g454,g505] in
let g507 = CID1[g453,g506] in
let g508 = CID1[g452,g507] in
let g509 = CID1[g451,g508] in
let g510 = '\n' in
let g512 = 48 in
let g513 = 0 in
let g514 = CID0 in
let g515 = CID1 in
let g516 = 9 in
let g517 = CID0 in
let g518 = CID1 in
let g519 = CID1 in
let g520 = CID1 in
let g521 = CID1 in
let g522 = 10 in
let g511 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = CID0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,g512) in
      let t5 = PRIM_LessInt(t4,g513) in
      let k = [f1,t2,t4], fun [f1,f2,f3] arg ->
        let k = [f1,f2], fun [f1,f2] arg ->
          match arg with
          | None1 -> k g521
          | Some0(t1) ->
            let t2 = PRIM_MulInt(g522,f1) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f2], fun [f1] arg -> arg f1 k in
            g511 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(g516,f3) in
          let k = [f3], fun [f1] arg ->
            match arg with
            | true1 ->
              let t1 = CID0[f1] in
              k t1
            | false0 -> k g519 in
          match t1 with
          | true1 -> k g517
          | false0 -> k g518
        | false0 -> k g520 in
      match t5 with
      | true1 -> k g514
      | false0 -> k g515 in
  k t1 in
let g523 = 0 in
let g524 = 'E' in
let g525 = 'R' in
let g526 = 'R' in
let g527 = 'O' in
let g528 = 'R' in
let g529 = ':' in
let g530 = ' ' in
let g531 = CID0 in
let g532 = CID1[g530,g531] in
let g533 = CID1[g529,g532] in
let g534 = CID1[g528,g533] in
let g535 = CID1[g527,g534] in
let g536 = CID1[g526,g535] in
let g537 = CID1[g525,g536] in
let g538 = CID1[g524,g537] in
let g539 = 'e' in
let g540 = 'x' in
let g541 = 'p' in
let g542 = 'e' in
let g543 = 'c' in
let g544 = 't' in
let g545 = 'e' in
let g546 = 'd' in
let g547 = ' ' in
let g548 = 'a' in
let g549 = 'r' in
let g550 = 'g' in
let g551 = '1' in
let g552 = ' ' in
let g553 = 't' in
let g554 = 'o' in
let g555 = ' ' in
let g556 = 'b' in
let g557 = 'e' in
let g558 = ' ' in
let g559 = 'n' in
let g560 = 'u' in
let g561 = 'm' in
let g562 = 'e' in
let g563 = 'r' in
let g564 = 'i' in
let g565 = 'c' in
let g566 = CID0 in
let g567 = CID1[g565,g566] in
let g568 = CID1[g564,g567] in
let g569 = CID1[g563,g568] in
let g570 = CID1[g562,g569] in
let g571 = CID1[g561,g570] in
let g572 = CID1[g560,g571] in
let g573 = CID1[g559,g572] in
let g574 = CID1[g558,g573] in
let g575 = CID1[g557,g574] in
let g576 = CID1[g556,g575] in
let g577 = CID1[g555,g576] in
let g578 = CID1[g554,g577] in
let g579 = CID1[g553,g578] in
let g580 = CID1[g552,g579] in
let g581 = CID1[g551,g580] in
let g582 = CID1[g550,g581] in
let g583 = CID1[g549,g582] in
let g584 = CID1[g548,g583] in
let g585 = CID1[g547,g584] in
let g586 = CID1[g546,g585] in
let g587 = CID1[g545,g586] in
let g588 = CID1[g544,g587] in
let g589 = CID1[g543,g588] in
let g590 = CID1[g542,g589] in
let g591 = CID1[g541,g590] in
let g592 = CID1[g540,g591] in
let g593 = CID1[g539,g592] in
let g594 = '\n' in
let g596 = 0 in
let g597 = 10 in
let g598 = 48 in
let g599 = 10 in
let g595 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g596) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g597) in
      let t3 = PRIM_AddInt(g598,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g599) in
        arg t1 k in
      g595 t5 k in
  k t1 in
let g600 = 0 in
let g601 = '0' in
let g602 = CID0 in
let g603 = CID1[g601,g602] in
let g604 = CID0 in
let g605 = ' ' in
let g606 = '-' in
let g607 = '-' in
let g608 = '>' in
let g609 = ' ' in
let g610 = CID0 in
let g611 = CID1[g609,g610] in
let g612 = CID1[g608,g611] in
let g613 = CID1[g607,g612] in
let g614 = CID1[g606,g613] in
let g615 = CID1[g605,g614] in
let g617 = 0 in
let g618 = 10 in
let g619 = 48 in
let g620 = 10 in
let g616 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g617) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g618) in
      let t3 = PRIM_AddInt(g619,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g620) in
        arg t1 k in
      g616 t5 k in
  k t1 in
let g621 = 0 in
let g622 = '0' in
let g623 = CID0 in
let g624 = CID1[g622,g623] in
let g625 = CID0 in
let g626 = '\n' in
let g627 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g628 = 'r' in
let g629 = 'e' in
let g630 = 'v' in
let g631 = CID0 in
let g632 = CID1[g630,g631] in
let g633 = CID1[g629,g632] in
let g634 = CID1[g628,g633] in
let g635 = 'E' in
let g636 = 'R' in
let g637 = 'R' in
let g638 = 'O' in
let g639 = 'R' in
let g640 = ':' in
let g641 = ' ' in
let g642 = CID0 in
let g643 = CID1[g641,g642] in
let g644 = CID1[g640,g643] in
let g645 = CID1[g639,g644] in
let g646 = CID1[g638,g645] in
let g647 = CID1[g637,g646] in
let g648 = CID1[g636,g647] in
let g649 = CID1[g635,g648] in
let g650 = 'r' in
let g651 = 'e' in
let g652 = 'v' in
let g653 = ':' in
let g654 = ' ' in
let g655 = 'e' in
let g656 = 'x' in
let g657 = 'p' in
let g658 = 'e' in
let g659 = 'c' in
let g660 = 't' in
let g661 = 'e' in
let g662 = 'd' in
let g663 = ' ' in
let g664 = 'n' in
let g665 = 'o' in
let g666 = ' ' in
let g667 = 'a' in
let g668 = 'r' in
let g669 = 'g' in
let g670 = 'u' in
let g671 = 'm' in
let g672 = 'e' in
let g673 = 'n' in
let g674 = 't' in
let g675 = 's' in
let g676 = CID0 in
let g677 = CID1[g675,g676] in
let g678 = CID1[g674,g677] in
let g679 = CID1[g673,g678] in
let g680 = CID1[g672,g679] in
let g681 = CID1[g671,g680] in
let g682 = CID1[g670,g681] in
let g683 = CID1[g669,g682] in
let g684 = CID1[g668,g683] in
let g685 = CID1[g667,g684] in
let g686 = CID1[g666,g685] in
let g687 = CID1[g665,g686] in
let g688 = CID1[g664,g687] in
let g689 = CID1[g663,g688] in
let g690 = CID1[g662,g689] in
let g691 = CID1[g661,g690] in
let g692 = CID1[g660,g691] in
let g693 = CID1[g659,g692] in
let g694 = CID1[g658,g693] in
let g695 = CID1[g657,g694] in
let g696 = CID1[g656,g695] in
let g697 = CID1[g655,g696] in
let g698 = CID1[g654,g697] in
let g699 = CID1[g653,g698] in
let g700 = CID1[g652,g699] in
let g701 = CID1[g651,g700] in
let g702 = CID1[g650,g701] in
let g703 = '\n' in
let g704 = '(' in
let g705 = 'r' in
let g706 = 'e' in
let g707 = 'v' in
let g708 = 'e' in
let g709 = 'r' in
let g710 = 's' in
let g711 = 'e' in
let g712 = ' ' in
let g713 = 't' in
let g714 = 'y' in
let g715 = 'p' in
let g716 = 'e' in
let g717 = 'd' in
let g718 = ' ' in
let g719 = 'l' in
let g720 = 'i' in
let g721 = 'n' in
let g722 = 'e' in
let g723 = 's' in
let g724 = ' ' in
let g725 = 'u' in
let g726 = 'n' in
let g727 = 't' in
let g728 = 'i' in
let g729 = 'l' in
let g730 = ' ' in
let g731 = '^' in
let g732 = 'D' in
let g733 = ')' in
let g734 = '\n' in
let g735 = CID0 in
let g736 = CID1[g734,g735] in
let g737 = CID1[g733,g736] in
let g738 = CID1[g732,g737] in
let g739 = CID1[g731,g738] in
let g740 = CID1[g730,g739] in
let g741 = CID1[g729,g740] in
let g742 = CID1[g728,g741] in
let g743 = CID1[g727,g742] in
let g744 = CID1[g726,g743] in
let g745 = CID1[g725,g744] in
let g746 = CID1[g724,g745] in
let g747 = CID1[g723,g746] in
let g748 = CID1[g722,g747] in
let g749 = CID1[g721,g748] in
let g750 = CID1[g720,g749] in
let g751 = CID1[g719,g750] in
let g752 = CID1[g718,g751] in
let g753 = CID1[g717,g752] in
let g754 = CID1[g716,g753] in
let g755 = CID1[g715,g754] in
let g756 = CID1[g714,g755] in
let g757 = CID1[g713,g756] in
let g758 = CID1[g712,g757] in
let g759 = CID1[g711,g758] in
let g760 = CID1[g710,g759] in
let g761 = CID1[g709,g760] in
let g762 = CID1[g708,g761] in
let g763 = CID1[g707,g762] in
let g764 = CID1[g706,g763] in
let g765 = CID1[g705,g764] in
let g766 = CID1[g704,g765] in
let g769 = CID0 in
let g770 = '\n' in
let g771 = '\n' in
let g772 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g772 t3 k in
  k t1 in
let g773 = CID0 in
let g774 = '\EOT' in
let g775 = 8 in
let g776 = '\n' in
let g777 = 26 in
let g778 = '^' in
let g779 = 65 in
let g780 = 1 in
let g781 = '\n' in
let g782 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g782 t3 k in
  k t1 in
let g783 = CID0 in
let g784 = '\EOT' in
let g785 = 127 in
let g786 = 127 in
let g787 = 26 in
let g788 = CID0 in
let g789 = CID1 in
let g790 = '\b' in
let g791 = ' ' in
let g792 = '\b' in
let g793 = CID0 in
let g794 = '\b' in
let g795 = ' ' in
let g796 = '\b' in
let g797 = 8 in
let g798 = '\n' in
let g799 = 26 in
let g800 = '^' in
let g801 = 65 in
let g802 = 1 in
let g768 = fun arg k ->
  let t1 = PRIM_GetChar(g769) in
  let t2 = PRIM_CharOrd(t1) in
  let t3 = PRIM_EqChar(t1,g770) in
  match t3 with
  | true1 ->
    let t4 = PRIM_PutChar(g771) in
    let k = [arg], fun [f1] arg -> arg f1 k in
    g772 g773 k
  | false0 ->
    let t4 = PRIM_EqChar(t1,g774) in
    match t4 with
    | true1 ->
      let t5 = PRIM_CharOrd(t1) in
      let t6 = PRIM_EqInt(t5,g775) in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_PutChar(g781) in
        let k = [f1], fun [f1] arg ->
          let t1 = CID1[g784,f1] in
          arg t1 k in
        g782 g783 k in
      match t6 with
      | true1 ->
        let t7 = PRIM_PutChar(t1) in
        k t7
      | false0 ->
        let t7 = PRIM_EqChar(t1,g776) in
        match t7 with
        | true1 ->
          let t8 = PRIM_PutChar(t1) in
          k t8
        | false0 ->
          let t8 = PRIM_LessInt(g777,t5) in
          match t8 with
          | true1 ->
            let t9 = PRIM_PutChar(t1) in
            k t9
          | false0 ->
            let t9 = PRIM_PutChar(g778) in
            let t10 = PRIM_AddInt(g779,t5) in
            let t11 = PRIM_SubInt(t10,g780) in
            let t12 = PRIM_CharChr(t11) in
            let t13 = PRIM_PutChar(t12) in
            k t13
    | false0 ->
      let t5 = PRIM_LessInt(g785,t2) in
      match t5 with
      | true1 -> g768 arg k
      | false0 ->
        let t6 = PRIM_EqInt(t2,g786) in
        match t6 with
        | true1 ->
          match arg with
          | Nil0 -> g768 arg k
          | Cons1(t7,t8) ->
            let t9 = PRIM_CharOrd(t7) in
            let t10 = PRIM_LessInt(g787,t9) in
            let k = [t8], fun [f1] arg ->
              let k = [f1], fun [f1] arg ->
                let t1 = PRIM_PutChar(g794) in
                let t2 = PRIM_PutChar(g795) in
                let t3 = PRIM_PutChar(g796) in
                g768 f1 k in
              match arg with
              | true1 ->
                let t1 = PRIM_PutChar(g790) in
                let t2 = PRIM_PutChar(g791) in
                let t3 = PRIM_PutChar(g792) in
                k t3
              | false0 -> k g793 in
            match t10 with
            | true1 -> k g788
            | false0 -> k g789
        | false0 ->
          let t7 = PRIM_CharOrd(t1) in
          let t8 = PRIM_EqInt(t7,g797) in
          let k = [arg,t1], fun [f1,f2] arg ->
            let t1 = CID1[f2,f1] in
            g768 t1 k in
          match t8 with
          | true1 ->
            let t9 = PRIM_PutChar(t1) in
            k t9
          | false0 ->
            let t9 = PRIM_EqChar(t1,g798) in
            match t9 with
            | true1 ->
              let t10 = PRIM_PutChar(t1) in
              k t10
            | false0 ->
              let t10 = PRIM_LessInt(g799,t7) in
              match t10 with
              | true1 ->
                let t11 = PRIM_PutChar(t1) in
                k t11
              | false0 ->
                let t11 = PRIM_PutChar(g800) in
                let t12 = PRIM_AddInt(g801,t7) in
                let t13 = PRIM_SubInt(t12,g802) in
                let t14 = PRIM_CharChr(t13) in
                let t15 = PRIM_PutChar(t14) in
                k t15 in
let g803 = CID0 in
let g804 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g805 = '\EOT' in
let g806 = CID0 in
let g807 = CID1[g805,g806] in
let g808 = CID0 in
let g809 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g809 t3 k in
  k t1 in
let g810 = CID0 in
let g811 = '\n' in
let g812 = CID0 in
let g767 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [arg], fun [f1] arg ->
      let k = [f1], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          match arg with
          | true1 -> k g808
          | false0 ->
            let k = [f1], fun [f1] arg ->
              let k = [], fun [] arg ->
                let k = [], fun [] arg ->
                  let t1 = PRIM_PutChar(g811) in
                  g767 g812 k in
                g12 arg k in
              arg f1 k in
            g809 g810 k in
        arg g807 k in
      arg f1 k in
    g1 g804 k in
  g768 g803 k in
let g813 = CID0 in
let g814 = 'o' in
let g815 = '*' in
let g816 = fun arg k ->
  let t1 = PRIM_EqChar(arg,g814) in
  match t1 with
  | true1 -> k g815
  | false0 -> k arg in
let g817 = 'Y' in
let g818 = 'o' in
let g819 = 'u' in
let g820 = ' ' in
let g821 = 'w' in
let g822 = 'r' in
let g823 = 'o' in
let g824 = 't' in
let g825 = 'e' in
let g826 = ':' in
let g827 = ' ' in
let g828 = '"' in
let g829 = CID0 in
let g830 = CID1[g828,g829] in
let g831 = CID1[g827,g830] in
let g832 = CID1[g826,g831] in
let g833 = CID1[g825,g832] in
let g834 = CID1[g824,g833] in
let g835 = CID1[g823,g834] in
let g836 = CID1[g822,g835] in
let g837 = CID1[g821,g836] in
let g838 = CID1[g820,g837] in
let g839 = CID1[g819,g838] in
let g840 = CID1[g818,g839] in
let g841 = CID1[g817,g840] in
let g842 = '"' in
let g843 = ' ' in
let g844 = '(' in
let g845 = CID0 in
let g846 = CID1[g844,g845] in
let g847 = CID1[g843,g846] in
let g848 = CID1[g842,g847] in
let g850 = 0 in
let g851 = 10 in
let g852 = 48 in
let g853 = 10 in
let g849 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g850) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g851) in
      let t3 = PRIM_AddInt(g852,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g853) in
        arg t1 k in
      g849 t5 k in
  k t1 in
let g854 = 0 in
let g855 = '0' in
let g856 = CID0 in
let g857 = CID1[g855,g856] in
let g858 = CID0 in
let g859 = ' ' in
let g860 = 'c' in
let g861 = 'h' in
let g862 = 'a' in
let g863 = 'r' in
let g864 = 's' in
let g865 = ')' in
let g866 = CID0 in
let g867 = CID1[g865,g866] in
let g868 = CID1[g864,g867] in
let g869 = CID1[g863,g868] in
let g870 = CID1[g862,g869] in
let g871 = CID1[g861,g870] in
let g872 = CID1[g860,g871] in
let g873 = CID1[g859,g872] in
let g874 = '\n' in
let g875 = CID0 in
let g30 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let k = [f1], fun [f1] arg ->
            match arg with
            | true1 -> k g76
            | false0 ->
              let k = [f1], fun [f1] arg ->
                let k = [f1], fun [f1] arg ->
                  let k = [f1], fun [f1] arg ->
                    let k = [], fun [] arg -> g30 g875 k in
                    match arg with
                    | Nil0 -> k g88
                    | Cons1(t1,t2) ->
                      let k = [f1,t1,t2], fun [f1,f2,f3] arg ->
                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                            match arg with
                            | true1 ->
                              let k = [f3], fun [f1] arg ->
                                match f1 with
                                | Nil0 ->
                                  let k = [], fun [] arg ->
                                    let k = [], fun [] arg ->
                                      let t1 = PRIM_PutChar(g164) in
                                      k t1 in
                                    g12 g163 k in
                                  g12 g122 k
                                | Cons1(t1,t2) ->
                                  match t2 with
                                  | Cons1(t3,t4) ->
                                    let k = [], fun [] arg ->
                                      let k = [], fun [] arg ->
                                        let t1 = PRIM_PutChar(g239) in
                                        k t1 in
                                      g12 g238 k in
                                    g12 g179 k
                                  | Nil0 ->
                                    let k = [t1], fun [f1] arg ->
                                      let k = [], fun [] arg ->
                                        match arg with
                                        | None1 ->
                                          let k = [], fun [] arg ->
                                            let k = [], fun [] arg ->
                                              let t1 = PRIM_PutChar(g323) in
                                              k t1 in
                                            g12 g322 k in
                                          g12 g267 k
                                        | Some0(t1) ->
                                          let k = [t1], fun [f1] arg ->
                                            let t1 = PRIM_EqInt(f1,g329) in
                                            let k = [arg], fun [f1] arg ->
                                              let k = [f1], fun [f1] arg ->
                                                let k = [f1], fun [f1] arg ->
                                                  let t1 = PRIM_EqInt(f1,g350) in
                                                  let k = [], fun [] arg ->
                                                    let k = [], fun [] arg ->
                                                      let t1 = PRIM_PutChar(g355) in
                                                      k t1 in
                                                    g12 arg k in
                                                  match t1 with
                                                  | true1 -> k g353
                                                  | false0 ->
                                                    let k = [f1], fun [f1] arg -> arg f1 k in
                                                    g345 g354 k in
                                                g12 g344 k in
                                              g12 arg k in
                                            match t1 with
                                            | true1 -> k g332
                                            | false0 ->
                                              let k = [f1], fun [f1] arg -> arg f1 k in
                                              g324 g333 k in
                                          g20 t1 k in
                                      arg f1 k in
                                    g240 g252 k in
                              g12 g107 k
                            | false0 ->
                              let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                  let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                    match arg with
                                    | true1 ->
                                      let k = [f3], fun [f1] arg ->
                                        match f1 with
                                        | Nil0 ->
                                          let k = [], fun [] arg ->
                                            let k = [], fun [] arg ->
                                              let t1 = PRIM_PutChar(g435) in
                                              k t1 in
                                            g12 g434 k in
                                          g12 g393 k
                                        | Cons1(t1,t2) ->
                                          match t2 with
                                          | Cons1(t3,t4) ->
                                            let k = [], fun [] arg ->
                                              let k = [], fun [] arg ->
                                                let t1 = PRIM_PutChar(g510) in
                                                k t1 in
                                              g12 g509 k in
                                            g12 g450 k
                                          | Nil0 ->
                                            let k = [t1], fun [f1] arg ->
                                              let k = [], fun [] arg ->
                                                match arg with
                                                | None1 ->
                                                  let k = [], fun [] arg ->
                                                    let k = [], fun [] arg ->
                                                      let t1 = PRIM_PutChar(g594) in
                                                      k t1 in
                                                    g12 g593 k in
                                                  g12 g538 k
                                                | Some0(t1) ->
                                                  let k = [t1], fun [f1] arg ->
                                                    let t1 = PRIM_EqInt(f1,g600) in
                                                    let k = [arg], fun [f1] arg ->
                                                      let k = [f1], fun [f1] arg ->
                                                        let k = [f1], fun [f1] arg ->
                                                          let t1 = PRIM_EqInt(f1,g621) in
                                                          let k = [], fun [] arg ->
                                                            let k = [], fun [] arg ->
                                                              let t1 = PRIM_PutChar(g626) in
                                                              k t1 in
                                                            g12 arg k in
                                                          match t1 with
                                                          | true1 -> k g624
                                                          | false0 ->
                                                            let k = [f1], fun [f1] arg -> arg f1 k in
                                                            g616 g625 k in
                                                        g12 g615 k in
                                                      g12 arg k in
                                                    match t1 with
                                                    | true1 -> k g603
                                                    | false0 ->
                                                      let k = [f1], fun [f1] arg -> arg f1 k in
                                                      g595 g604 k in
                                                  g24 t1 k in
                                              arg f1 k in
                                            g511 g523 k in
                                      g12 g378 k
                                    | false0 ->
                                      let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                        let k = [f1,f3], fun [f1,f2] arg ->
                                          let k = [f1,f2], fun [f1,f2] arg ->
                                            match arg with
                                            | true1 ->
                                              match f2 with
                                              | Cons1(t1,t2) ->
                                                let k = [], fun [] arg ->
                                                  let k = [], fun [] arg ->
                                                    let t1 = PRIM_PutChar(g703) in
                                                    k t1 in
                                                  g12 g702 k in
                                                g12 g649 k
                                              | Nil0 ->
                                                let k = [], fun [] arg -> g767 g813 k in
                                                g12 g766 k
                                            | false0 ->
                                              let k = [f1], fun [f1] arg ->
                                                let k = [f1,arg], fun [f1,f2] arg ->
                                                  let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                    let k = [f3,arg], fun [f1,f2] arg ->
                                                      let k = [f1], fun [f1] arg ->
                                                        let k = [f1], fun [f1] arg ->
                                                          let k = [f1], fun [f1] arg ->
                                                            let t1 = PRIM_EqInt(f1,g854) in
                                                            let k = [], fun [] arg ->
                                                              let k = [], fun [] arg ->
                                                                let k = [], fun [] arg ->
                                                                  let t1 = PRIM_PutChar(g874) in
                                                                  k t1 in
                                                                g12 g873 k in
                                                              g12 arg k in
                                                            match t1 with
                                                            | true1 -> k g857
                                                            | false0 ->
                                                              let k = [f1], fun [f1] arg -> arg f1 k in
                                                              g849 g858 k in
                                                          g12 g848 k in
                                                        g12 arg k in
                                                      f2 arg k in
                                                    f2 f1 k in
                                                  g6 g841 k in
                                                g9 f1 k in
                                              g7 g816 k in
                                          arg g634 k in
                                        arg f2 k in
                                      g1 g627 k in
                                  arg g365 k in
                                arg f2 k in
                              g1 g356 k in
                          arg g96 k in
                        arg f2 k in
                      g1 g89 k in
                  arg f1 k in
                arg g87 k in
              g77 g86 k in
          arg g75 k in
        arg f1 k in
      g1 g72 k in
    g36 g71 k in
  g12 g35 k in
let g876 = 'T' in
let g877 = 'h' in
let g878 = 'i' in
let g879 = 's' in
let g880 = ' ' in
let g881 = 'i' in
let g882 = 's' in
let g883 = ' ' in
let g884 = 'a' in
let g885 = ' ' in
let g886 = 's' in
let g887 = 'h' in
let g888 = 'e' in
let g889 = 'l' in
let g890 = 'l' in
let g891 = ' ' in
let g892 = 'p' in
let g893 = 'r' in
let g894 = 'o' in
let g895 = 't' in
let g896 = 'o' in
let g897 = 't' in
let g898 = 'y' in
let g899 = 'p' in
let g900 = 'e' in
let g901 = '.' in
let g902 = ' ' in
let g903 = 'T' in
let g904 = 'r' in
let g905 = 'y' in
let g906 = ':' in
let g907 = ' ' in
let g908 = 'f' in
let g909 = 'i' in
let g910 = 'b' in
let g911 = ',' in
let g912 = ' ' in
let g913 = 'f' in
let g914 = 'a' in
let g915 = 'c' in
let g916 = 't' in
let g917 = ',' in
let g918 = ' ' in
let g919 = 'r' in
let g920 = 'e' in
let g921 = 'v' in
let g922 = '\n' in
let g923 = CID0 in
let g924 = CID1[g922,g923] in
let g925 = CID1[g921,g924] in
let g926 = CID1[g920,g925] in
let g927 = CID1[g919,g926] in
let g928 = CID1[g918,g927] in
let g929 = CID1[g917,g928] in
let g930 = CID1[g916,g929] in
let g931 = CID1[g915,g930] in
let g932 = CID1[g914,g931] in
let g933 = CID1[g913,g932] in
let g934 = CID1[g912,g933] in
let g935 = CID1[g911,g934] in
let g936 = CID1[g910,g935] in
let g937 = CID1[g909,g936] in
let g938 = CID1[g908,g937] in
let g939 = CID1[g907,g938] in
let g940 = CID1[g906,g939] in
let g941 = CID1[g905,g940] in
let g942 = CID1[g904,g941] in
let g943 = CID1[g903,g942] in
let g944 = CID1[g902,g943] in
let g945 = CID1[g901,g944] in
let g946 = CID1[g900,g945] in
let g947 = CID1[g899,g946] in
let g948 = CID1[g898,g947] in
let g949 = CID1[g897,g948] in
let g950 = CID1[g896,g949] in
let g951 = CID1[g895,g950] in
let g952 = CID1[g894,g951] in
let g953 = CID1[g893,g952] in
let g954 = CID1[g892,g953] in
let g955 = CID1[g891,g954] in
let g956 = CID1[g890,g955] in
let g957 = CID1[g889,g956] in
let g958 = CID1[g888,g957] in
let g959 = CID1[g887,g958] in
let g960 = CID1[g886,g959] in
let g961 = CID1[g885,g960] in
let g962 = CID1[g884,g961] in
let g963 = CID1[g883,g962] in
let g964 = CID1[g882,g963] in
let g965 = CID1[g881,g964] in
let g966 = CID1[g880,g965] in
let g967 = CID1[g879,g966] in
let g968 = CID1[g878,g967] in
let g969 = CID1[g877,g968] in
let g970 = CID1[g876,g969] in
let g971 = CID0 in
let k = [], fun [] arg -> g30 g971 k in
g12 g970 k
