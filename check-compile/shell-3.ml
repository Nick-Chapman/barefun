(*stage3*)
let k () = ()
let g1 = fun arg k -> k arg in
let g2 = 8 in
let g3 = '\n' in
let g4 = 26 in
let g5 = '^' in
let g6 = 'A' in
let g7 = PRIM_CharOrd(g6) in
let g8 = 1 in
let g9 = fun arg k ->
  let t1 = PRIM_CharOrd(arg) in
  let t2 = PRIM_EqInt(t1,g2) in
  match t2 with
  | true1 ->
    let t3 = PRIM_PutChar(arg) in
    k t3
  | false0 ->
    let t3 = PRIM_EqChar(arg,g3) in
    match t3 with
    | true1 ->
      let t4 = PRIM_PutChar(arg) in
      k t4
    | false0 ->
      let t4 = PRIM_LessInt(g4,t1) in
      match t4 with
      | true1 ->
        let t5 = PRIM_PutChar(arg) in
        k t5
      | false0 ->
        let t5 = PRIM_PutChar(g5) in
        let t6 = PRIM_AddInt(g7,t1) in
        let t7 = PRIM_SubInt(t6,g8) in
        let t8 = PRIM_CharChr(t7) in
        let t9 = PRIM_PutChar(t8) in
        k t9 in
let g11 = true1 in
let g12 = false0 in
let g13 = false0 in
let g14 = false0 in
let g10 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match f2 with
      | Nil0 ->
        match arg with
        | Nil0 -> k g11
        | Cons1(t1,t2) -> k g12
      | Cons1(t1,t2) ->
        match arg with
        | Nil0 -> k g13
        | Cons1(t3,t4) ->
          let k = [f1,t2,t3,t4], fun [f1,f2,f3,f4] arg ->
            let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
              match arg with
              | true1 ->
                let k = [f2,f3], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  arg f1 k in
                g10 f1 k
              | false0 -> k g14 in
            arg f3 k in
          f1 t1 k in
    k t1 in
  k t1 in
let g15 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t1], fun [f1,f2] arg ->
        let k = [f2], fun [f1] arg ->
          let t1 = Cons1[f1,arg] in
          k t1 in
        arg f1 k in
      g15 t2 k in
  k t1 in
let g17 = Nil0 in
let g16 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g17
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f1,f2] arg ->
        let k = [f2,arg], fun [f1,f2] arg ->
          let k = [f2], fun [f1] arg ->
            let t1 = Cons1[f1,arg] in
            k t1 in
          arg f1 k in
        g16 f1 k in
      f1 t1 k in
  k t1 in
let g19 = 0 in
let g20 = 1 in
let g18 = fun arg k ->
  match arg with
  | Nil0 -> k g19
  | Cons1(t1,t2) ->
    let k = [], fun [] arg ->
      let t1 = PRIM_AddInt(g20,arg) in
      k t1 in
    g18 t2 k in
let g21 = Unit0 in
let g23 = 2 in
let g24 = 1 in
let g25 = 2 in
let g22 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g23) in
  match t1 with
  | true1 -> k arg
  | false0 ->
    let t2 = PRIM_SubInt(arg,g24) in
    let k = [arg], fun [f1] arg ->
      let t1 = PRIM_SubInt(f1,g25) in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      g22 t1 k in
    g22 t2 k in
let g27 = 2 in
let g28 = false0 in
let g29 = true1 in
let g30 = 1 in
let g31 = 1 in
let g26 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g27) in
  let k = [arg], fun [f1] arg ->
    match arg with
    | true1 ->
      let t1 = PRIM_SubInt(f1,g30) in
      let k = [f1], fun [f1] arg ->
        let t1 = PRIM_MulInt(arg,f1) in
        k t1 in
      g26 t1 k
    | false0 -> k g31 in
  match t1 with
  | true1 -> k g28
  | false0 -> k g29 in
let g32 = 4 in
let g33 = PRIM_CharChr(g32) in
let g34 = Nil0 in
let g35 = Cons1[g33,g34] in
let g36 = '>' in
let g37 = ' ' in
let g38 = Nil0 in
let g39 = Cons1[g37,g38] in
let g40 = Cons1[g36,g39] in
let g42 = 4 in
let g43 = PRIM_CharChr(g42) in
let g44 = Unit0 in
let g45 = '\n' in
let g47 = '\n' in
let g48 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g48 t3 k in
  k t1 in
let g49 = Nil0 in
let g51 = '\n' in
let g52 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g52 t3 k in
  k t1 in
let g53 = Nil0 in
let g54 = 127 in
let g55 = 127 in
let g56 = 26 in
let g57 = false0 in
let g58 = true1 in
let g60 = 8 in
let g61 = PRIM_CharChr(g60) in
let g62 = ' ' in
let g63 = Unit0 in
let g65 = 8 in
let g66 = PRIM_CharChr(g65) in
let g67 = ' ' in
let g68 = Nil0 in
let g69 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g70 = Unit0 in
let g72 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g72 t3 k in
  k t1 in
let g73 = Nil0 in
let g74 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g74 t3 k in
  k t1 in
let g75 = Nil0 in
let g76 = ' ' in
let g77 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g77 t3 k in
  k t1 in
let g78 = Nil0 in
let g79 = Nil0 in
let g71 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match arg with
      | Nil0 ->
        let k = [f1,f2], fun [f1,f2] arg ->
          let k = [f1], fun [f1] arg ->
            let t1 = Cons1[arg,f1] in
            let k = [t1], fun [f1] arg -> arg f1 k in
            g74 g75 k in
          arg f2 k in
        g72 g73 k
      | Cons1(t1,t2) ->
        let t3 = PRIM_EqChar(t1,g76) in
        match t3 with
        | true1 ->
          let k = [f1,f2,t2], fun [f1,f2,f3] arg ->
            let k = [f1,f3], fun [f1,f2] arg ->
              let t1 = Cons1[arg,f1] in
              let k = [f2], fun [f1] arg ->
                let k = [f1], fun [f1] arg -> arg f1 k in
                arg g79 k in
              g71 t1 k in
            arg f2 k in
          g77 g78 k
        | false0 ->
          let k = [f2,t1,t2], fun [f1,f2,f3] arg ->
            let t1 = Cons1[f2,f1] in
            let k = [f3], fun [f1] arg -> arg f1 k in
            arg t1 k in
          g71 f1 k in
    k t1 in
  k t1 in
let g80 = Nil0 in
let g81 = Nil0 in
let g82 = Unit0 in
let g83 = "fib" in
let g84 = PRIM_Explode(g83) in
let g85 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g86 = "fib: " in
let g87 = PRIM_Explode(g86) in
let g88 = "ERROR: " in
let g89 = PRIM_Explode(g88) in
let g90 = "expected an argument" in
let g91 = PRIM_Explode(g90) in
let g93 = '\n' in
let g94 = "ERROR: " in
let g95 = PRIM_Explode(g94) in
let g96 = "expected exactly one argument" in
let g97 = PRIM_Explode(g96) in
let g99 = '\n' in
let g101 = '0' in
let g102 = PRIM_CharOrd(g101) in
let g103 = 0 in
let g104 = false0 in
let g105 = true1 in
let g106 = 9 in
let g107 = false0 in
let g108 = true1 in
let g109 = None1 in
let g110 = None1 in
let g111 = None1 in
let g112 = 10 in
let g100 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = Some0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,g102) in
      let t5 = PRIM_LessInt(t4,g103) in
      let k = [f1,t2,t4], fun [f1,f2,f3] arg ->
        let k = [f1,f2], fun [f1,f2] arg ->
          match arg with
          | None1 -> k g111
          | Some0(t1) ->
            let t2 = PRIM_MulInt(g112,f1) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f2], fun [f1] arg -> arg f1 k in
            g100 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(g106,f3) in
          let k = [f3], fun [f1] arg ->
            match arg with
            | true1 ->
              let t1 = Some0[f1] in
              k t1
            | false0 -> k g109 in
          match t1 with
          | true1 -> k g107
          | false0 -> k g108
        | false0 -> k g110 in
      match t5 with
      | true1 -> k g104
      | false0 -> k g105 in
  k t1 in
let g113 = 0 in
let g114 = "ERROR: " in
let g115 = PRIM_Explode(g114) in
let g116 = "expected arg1 to be numeric" in
let g117 = PRIM_Explode(g116) in
let g119 = '\n' in
let g120 = '0' in
let g121 = PRIM_CharOrd(g120) in
let g123 = 0 in
let g124 = 10 in
let g125 = 10 in
let g122 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g123) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g124) in
      let t3 = PRIM_AddInt(g121,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g125) in
        arg t1 k in
      g122 t5 k in
  k t1 in
let g126 = 0 in
let g127 = Nil0 in
let g128 = '0' in
let g129 = Cons1[g128,g127] in
let g130 = Nil0 in
let g131 = " --> " in
let g132 = PRIM_Explode(g131) in
let g133 = '0' in
let g134 = PRIM_CharOrd(g133) in
let g136 = 0 in
let g137 = 10 in
let g138 = 10 in
let g135 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g136) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g137) in
      let t3 = PRIM_AddInt(g134,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g138) in
        arg t1 k in
      g135 t5 k in
  k t1 in
let g139 = 0 in
let g140 = Nil0 in
let g141 = '0' in
let g142 = Cons1[g141,g140] in
let g143 = Nil0 in
let g145 = '\n' in
let g146 = "fact" in
let g147 = PRIM_Explode(g146) in
let g148 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g149 = "fact: " in
let g150 = PRIM_Explode(g149) in
let g151 = "ERROR: " in
let g152 = PRIM_Explode(g151) in
let g153 = "expected an argument" in
let g154 = PRIM_Explode(g153) in
let g156 = '\n' in
let g157 = "ERROR: " in
let g158 = PRIM_Explode(g157) in
let g159 = "expected exactly one argument" in
let g160 = PRIM_Explode(g159) in
let g162 = '\n' in
let g164 = '0' in
let g165 = PRIM_CharOrd(g164) in
let g166 = 0 in
let g167 = false0 in
let g168 = true1 in
let g169 = 9 in
let g170 = false0 in
let g171 = true1 in
let g172 = None1 in
let g173 = None1 in
let g174 = None1 in
let g175 = 10 in
let g163 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = Some0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,g165) in
      let t5 = PRIM_LessInt(t4,g166) in
      let k = [f1,t2,t4], fun [f1,f2,f3] arg ->
        let k = [f1,f2], fun [f1,f2] arg ->
          match arg with
          | None1 -> k g174
          | Some0(t1) ->
            let t2 = PRIM_MulInt(g175,f1) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f2], fun [f1] arg -> arg f1 k in
            g163 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(g169,f3) in
          let k = [f3], fun [f1] arg ->
            match arg with
            | true1 ->
              let t1 = Some0[f1] in
              k t1
            | false0 -> k g172 in
          match t1 with
          | true1 -> k g170
          | false0 -> k g171
        | false0 -> k g173 in
      match t5 with
      | true1 -> k g167
      | false0 -> k g168 in
  k t1 in
let g176 = 0 in
let g177 = "ERROR: " in
let g178 = PRIM_Explode(g177) in
let g179 = "expected arg1 to be numeric" in
let g180 = PRIM_Explode(g179) in
let g182 = '\n' in
let g183 = '0' in
let g184 = PRIM_CharOrd(g183) in
let g186 = 0 in
let g187 = 10 in
let g188 = 10 in
let g185 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g186) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g187) in
      let t3 = PRIM_AddInt(g184,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g188) in
        arg t1 k in
      g185 t5 k in
  k t1 in
let g189 = 0 in
let g190 = Nil0 in
let g191 = '0' in
let g192 = Cons1[g191,g190] in
let g193 = Nil0 in
let g194 = " --> " in
let g195 = PRIM_Explode(g194) in
let g196 = '0' in
let g197 = PRIM_CharOrd(g196) in
let g199 = 0 in
let g200 = 10 in
let g201 = 10 in
let g198 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g199) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g200) in
      let t3 = PRIM_AddInt(g197,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g201) in
        arg t1 k in
      g198 t5 k in
  k t1 in
let g202 = 0 in
let g203 = Nil0 in
let g204 = '0' in
let g205 = Cons1[g204,g203] in
let g206 = Nil0 in
let g208 = '\n' in
let g209 = "rev" in
let g210 = PRIM_Explode(g209) in
let g211 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g212 = "ERROR: " in
let g213 = PRIM_Explode(g212) in
let g214 = "rev: expected no arguments" in
let g215 = PRIM_Explode(g214) in
let g217 = '\n' in
let g218 = "(reverse typed lines until ^D)\n" in
let g219 = PRIM_Explode(g218) in
let g222 = 4 in
let g223 = PRIM_CharChr(g222) in
let g224 = Unit0 in
let g225 = '\n' in
let g227 = '\n' in
let g228 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g228 t3 k in
  k t1 in
let g229 = Nil0 in
let g231 = '\n' in
let g232 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g232 t3 k in
  k t1 in
let g233 = Nil0 in
let g234 = 127 in
let g235 = 127 in
let g236 = 26 in
let g237 = false0 in
let g238 = true1 in
let g240 = 8 in
let g241 = PRIM_CharChr(g240) in
let g242 = ' ' in
let g243 = Unit0 in
let g245 = 8 in
let g246 = PRIM_CharChr(g245) in
let g247 = ' ' in
let g248 = Nil0 in
let g249 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g250 = Unit0 in
let g251 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g251 t3 k in
  k t1 in
let g252 = Nil0 in
let g254 = '\n' in
let g255 = Unit0 in
let g256 = Unit0 in
let g257 = 'o' in
let g258 = '*' in
let g259 = fun arg k ->
  let t1 = PRIM_EqChar(arg,g257) in
  match t1 with
  | true1 -> k g258
  | false0 -> k arg in
let g260 = "You wrote: \"" in
let g261 = PRIM_Explode(g260) in
let g262 = "\" (" in
let g263 = PRIM_Explode(g262) in
let g264 = '0' in
let g265 = PRIM_CharOrd(g264) in
let g267 = 0 in
let g268 = 10 in
let g269 = 10 in
let g266 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g267) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g268) in
      let t3 = PRIM_AddInt(g265,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g269) in
        arg t1 k in
      g266 t5 k in
  k t1 in
let g270 = 0 in
let g271 = Nil0 in
let g272 = '0' in
let g273 = Cons1[g272,g271] in
let g274 = Nil0 in
let g275 = " chars)" in
let g276 = PRIM_Explode(g275) in
let g278 = '\n' in
let g279 = Unit0 in
let g281 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g282 = PRIM_Explode(g281) in
let g283 = Unit0 in
let k = [], fun [] arg ->
  let t1 = [arg], fun [f1] me arg k ->
    match arg with
    | Nil0 -> k g21
    | Cons1(t1,t2) ->
      let k = [me,t2], fun [f1,f2] arg -> f1 f2 k in
      f1 t1 k in
  let t2 = [arg,t1], fun [f1,f2] me arg k ->
    let k = [f1,f2,me], fun [f1,f2,f3] arg ->
      let t1 = [f1], fun [f1] me arg k ->
        let t1 = PRIM_GetChar(g44) in
        let t2 = PRIM_CharOrd(t1) in
        let t3 = PRIM_EqChar(t1,g45) in
        match t3 with
        | true1 ->
          let k = [arg], fun [f1] arg ->
            let k = [f1], fun [f1] arg -> arg f1 k in
            g48 g49 k in
          f1 g47 k
        | false0 ->
          let t4 = PRIM_EqChar(t1,g43) in
          match t4 with
          | true1 ->
            let k = [f1,arg], fun [f1,f2] arg ->
              let k = [f2], fun [f1] arg ->
                let t1 = Cons1[g43,f1] in
                let k = [t1], fun [f1] arg -> arg f1 k in
                g52 g53 k in
              f1 g51 k in
            f1 t1 k
          | false0 ->
            let t5 = PRIM_LessInt(g54,t2) in
            match t5 with
            | true1 -> me arg k
            | false0 ->
              let t6 = PRIM_EqInt(t2,g55) in
              match t6 with
              | true1 ->
                match arg with
                | Nil0 -> me arg k
                | Cons1(t7,t8) ->
                  let t9 = PRIM_CharOrd(t7) in
                  let t10 = PRIM_LessInt(g56,t9) in
                  let k = [f1,me,t8], fun [f1,f2,f3] arg ->
                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                      let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                          let k = [f2,f3], fun [f1,f2] arg -> f1 f2 k in
                          f1 g66 k in
                        f1 g67 k in
                      f1 g66 k in
                    match arg with
                    | true1 ->
                      let k = [f1], fun [f1] arg ->
                        let k = [f1], fun [f1] arg -> f1 g61 k in
                        f1 g62 k in
                      f1 g61 k
                    | false0 -> k g63 in
                  match t10 with
                  | true1 -> k g57
                  | false0 -> k g58
              | false0 ->
                let k = [arg,me,t1], fun [f1,f2,f3] arg ->
                  let t1 = Cons1[f3,f1] in
                  f2 t1 k in
                f1 t1 k in
      let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
        let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
          let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
            let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
              match arg with
              | true1 -> k g70
              | false0 ->
                let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                  let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                    let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                      let k = [f3], fun [f1] arg -> f1 g279 k in
                      match arg with
                      | Nil0 -> k g82
                      | Cons1(t1,t2) ->
                        let k = [f1,f2,f4,t1,t2], fun [f1,f2,f3,f4,f5] arg ->
                          let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                            let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                              match arg with
                              | true1 ->
                                let k = [f1,f2,f5], fun [f1,f2,f3] arg ->
                                  match f3 with
                                  | Nil0 ->
                                    let k = [f1,f2], fun [f1,f2] arg ->
                                      let k = [f1], fun [f1] arg -> f1 g93 k in
                                      f2 g91 k in
                                    f2 g89 k
                                  | Cons1(t1,t2) ->
                                    match t2 with
                                    | Cons1(t3,t4) ->
                                      let k = [f1,f2], fun [f1,f2] arg ->
                                        let k = [f1], fun [f1] arg -> f1 g99 k in
                                        f2 g97 k in
                                      f2 g95 k
                                    | Nil0 ->
                                      let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                        let k = [f1,f2], fun [f1,f2] arg ->
                                          match arg with
                                          | None1 ->
                                            let k = [f1,f2], fun [f1,f2] arg ->
                                              let k = [f1], fun [f1] arg -> f1 g119 k in
                                              f2 g117 k in
                                            f2 g115 k
                                          | Some0(t1) ->
                                            let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                              let t1 = PRIM_EqInt(f3,g126) in
                                              let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                  let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                    let t1 = PRIM_EqInt(f3,g139) in
                                                    let k = [f1,f2], fun [f1,f2] arg ->
                                                      let k = [f1], fun [f1] arg -> f1 g145 k in
                                                      f2 arg k in
                                                    match t1 with
                                                    | true1 -> k g142
                                                    | false0 ->
                                                      let k = [f3], fun [f1] arg -> arg f1 k in
                                                      g135 g143 k in
                                                  f2 g132 k in
                                                f2 arg k in
                                              match t1 with
                                              | true1 -> k g129
                                              | false0 ->
                                                let k = [f3], fun [f1] arg -> arg f1 k in
                                                g122 g130 k in
                                            g22 t1 k in
                                        arg f3 k in
                                      g100 g113 k in
                                f2 g87 k
                              | false0 ->
                                let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                  let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                    let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                      match arg with
                                      | true1 ->
                                        let k = [f1,f2,f5], fun [f1,f2,f3] arg ->
                                          match f3 with
                                          | Nil0 ->
                                            let k = [f1,f2], fun [f1,f2] arg ->
                                              let k = [f1], fun [f1] arg -> f1 g156 k in
                                              f2 g154 k in
                                            f2 g152 k
                                          | Cons1(t1,t2) ->
                                            match t2 with
                                            | Cons1(t3,t4) ->
                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                let k = [f1], fun [f1] arg -> f1 g162 k in
                                                f2 g160 k in
                                              f2 g158 k
                                            | Nil0 ->
                                              let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                let k = [f1,f2], fun [f1,f2] arg ->
                                                  match arg with
                                                  | None1 ->
                                                    let k = [f1,f2], fun [f1,f2] arg ->
                                                      let k = [f1], fun [f1] arg -> f1 g182 k in
                                                      f2 g180 k in
                                                    f2 g178 k
                                                  | Some0(t1) ->
                                                    let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                      let t1 = PRIM_EqInt(f3,g189) in
                                                      let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                            let t1 = PRIM_EqInt(f3,g202) in
                                                            let k = [f1,f2], fun [f1,f2] arg ->
                                                              let k = [f1], fun [f1] arg -> f1 g208 k in
                                                              f2 arg k in
                                                            match t1 with
                                                            | true1 -> k g205
                                                            | false0 ->
                                                              let k = [f3], fun [f1] arg -> arg f1 k in
                                                              g198 g206 k in
                                                          f2 g195 k in
                                                        f2 arg k in
                                                      match t1 with
                                                      | true1 -> k g192
                                                      | false0 ->
                                                        let k = [f3], fun [f1] arg -> arg f1 k in
                                                        g185 g193 k in
                                                    g26 t1 k in
                                                arg f3 k in
                                              g163 g176 k in
                                        f2 g150 k
                                      | false0 ->
                                        let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                          let k = [f1,f2,f3,f5], fun [f1,f2,f3,f4] arg ->
                                            let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                              match arg with
                                              | true1 ->
                                                match f4 with
                                                | Cons1(t1,t2) ->
                                                  let k = [f1,f2], fun [f1,f2] arg ->
                                                    let k = [f1], fun [f1] arg -> f1 g217 k in
                                                    f2 g215 k in
                                                  f2 g213 k
                                                | Nil0 ->
                                                  let k = [f1,f2], fun [f1,f2] arg ->
                                                    let t1 = [f1,f2], fun [f1,f2] me arg k ->
                                                      let t1 = [f1], fun [f1] me arg k ->
                                                        let t1 = PRIM_GetChar(g224) in
                                                        let t2 = PRIM_CharOrd(t1) in
                                                        let t3 = PRIM_EqChar(t1,g225) in
                                                        match t3 with
                                                        | true1 ->
                                                          let k = [arg], fun [f1] arg ->
                                                            let k = [f1], fun [f1] arg -> arg f1 k in
                                                            g228 g229 k in
                                                          f1 g227 k
                                                        | false0 ->
                                                          let t4 = PRIM_EqChar(t1,g223) in
                                                          match t4 with
                                                          | true1 ->
                                                            let k = [f1,arg], fun [f1,f2] arg ->
                                                              let k = [f2], fun [f1] arg ->
                                                                let t1 = Cons1[g223,f1] in
                                                                let k = [t1], fun [f1] arg -> arg f1 k in
                                                                g232 g233 k in
                                                              f1 g231 k in
                                                            f1 t1 k
                                                          | false0 ->
                                                            let t5 = PRIM_LessInt(g234,t2) in
                                                            match t5 with
                                                            | true1 -> me arg k
                                                            | false0 ->
                                                              let t6 = PRIM_EqInt(t2,g235) in
                                                              match t6 with
                                                              | true1 ->
                                                                match arg with
                                                                | Nil0 -> me arg k
                                                                | Cons1(t7,t8) ->
                                                                  let t9 = PRIM_CharOrd(t7) in
                                                                  let t10 = PRIM_LessInt(g236,t9) in
                                                                  let k = [f1,me,t8], fun [f1,f2,f3] arg ->
                                                                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                      let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                          let k = [f2,f3], fun [f1,f2] arg -> f1 f2 k in
                                                                          f1 g246 k in
                                                                        f1 g247 k in
                                                                      f1 g246 k in
                                                                    match arg with
                                                                    | true1 ->
                                                                      let k = [f1], fun [f1] arg ->
                                                                        let k = [f1], fun [f1] arg -> f1 g241 k in
                                                                        f1 g242 k in
                                                                      f1 g241 k
                                                                    | false0 -> k g243 in
                                                                  match t10 with
                                                                  | true1 -> k g237
                                                                  | false0 -> k g238
                                                              | false0 ->
                                                                let k = [arg,me,t1], fun [f1,f2,f3] arg ->
                                                                  let t1 = Cons1[f3,f1] in
                                                                  f2 t1 k in
                                                                f1 t1 k in
                                                      let k = [f1,f2,me], fun [f1,f2,f3] arg ->
                                                        let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
                                                          let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                                            let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                                              match arg with
                                                              | true1 -> k g250
                                                              | false0 ->
                                                                let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                                                  let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                    let k = [f1,f3], fun [f1,f2] arg ->
                                                                      let k = [f2], fun [f1] arg -> f1 g255 k in
                                                                      f1 g254 k in
                                                                    f2 arg k in
                                                                  arg f4 k in
                                                                g251 g252 k in
                                                            arg g35 k in
                                                          arg f4 k in
                                                        g10 g249 k in
                                                      t1 g248 k in
                                                    t1 g256 k in
                                                  f2 g219 k
                                              | false0 ->
                                                let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                  let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
                                                    let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
                                                      let k = [f1,f2,f5,arg], fun [f1,f2,f3,f4] arg ->
                                                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                              let t1 = PRIM_EqInt(f3,g270) in
                                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                                let k = [f1,f2], fun [f1,f2] arg ->
                                                                  let k = [f1], fun [f1] arg -> f1 g278 k in
                                                                  f2 g276 k in
                                                                f2 arg k in
                                                              match t1 with
                                                              | true1 -> k g273
                                                              | false0 ->
                                                                let k = [f3], fun [f1] arg -> arg f1 k in
                                                                g266 g274 k in
                                                            f2 g263 k in
                                                          f2 arg k in
                                                        f4 arg k in
                                                      f4 f3 k in
                                                    g15 g261 k in
                                                  g18 f3 k in
                                                g16 g259 k in
                                            arg g210 k in
                                          arg f4 k in
                                        g10 g211 k in
                                    arg g147 k in
                                  arg f4 k in
                                g10 g148 k in
                            arg g84 k in
                          arg f4 k in
                        g10 g85 k in
                    arg f4 k in
                  arg g81 k in
                g71 g80 k in
            arg g35 k in
          arg f4 k in
        g10 g69 k in
      t1 g68 k in
    f2 g40 k in
  let k = [t2], fun [f1] arg -> f1 g283 k in
  t1 g282 k in
g1 g9 k
