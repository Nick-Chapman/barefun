(*stage3*)
let k () = ()
let g1 = fun arg k -> k arg in
let g2 = 8 in
let g3 = '\n' in
let g4 = 26 in
let g5 = '^' in
let g6 = 'A' in
let g7 = PRIM_CharOrd(g6) in
let g8 = fun arg k ->
  let t1 = PRIM_AddInt(g7,arg) in
  k t1 in
let g9 = 1 in
let g10 = fun arg k ->
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
        let k = [], fun [] arg ->
          let t1 = [arg], fun [f1] arg k ->
            let t1 = PRIM_SubInt(f1,arg) in
            k t1 in
          let k = [], fun [] arg ->
            let t1 = PRIM_CharChr(arg) in
            let t2 = PRIM_PutChar(t1) in
            k t2 in
          t1 g9 k in
        g8 t1 k in
let g12 = true1 in
let g13 = false0 in
let g14 = false0 in
let g15 = false0 in
let g11 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match f2 with
      | Nil0 ->
        match arg with
        | Nil0 -> k g12
        | Cons1(t1,t2) -> k g13
      | Cons1(t1,t2) ->
        match arg with
        | Nil0 -> k g14
        | Cons1(t3,t4) ->
          let k = [f1,t2,t3,t4], fun [f1,f2,f3,f4] arg ->
            let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
              match arg with
              | true1 ->
                let k = [f2,f3], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  arg f1 k in
                g11 f1 k
              | false0 -> k g15 in
            arg f3 k in
          f1 t1 k in
    k t1 in
  k t1 in
let g16 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t1], fun [f1,f2] arg ->
        let k = [f2], fun [f1] arg ->
          let t1 = Cons1[f1,arg] in
          k t1 in
        arg f1 k in
      g16 t2 k in
  k t1 in
let g18 = Nil0 in
let g17 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g18
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f1,f2] arg ->
        let t1 = [arg], fun [f1] arg k ->
          let t1 = Cons1[f1,arg] in
          k t1 in
        let k = [t1,f2], fun [f1,f2] arg ->
          let k = [f1], fun [f1] arg -> f1 arg k in
          arg f2 k in
        g17 f1 k in
      f1 t1 k in
  k t1 in
let g20 = 0 in
let g21 = 1 in
let g19 = fun arg k ->
  match arg with
  | Nil0 -> k g20
  | Cons1(t1,t2) ->
    let k = [], fun [] arg ->
      let t1 = PRIM_AddInt(g21,arg) in
      k t1 in
    g19 t2 k in
let g22 = Unit0 in
let g24 = 2 in
let g25 = 1 in
let g26 = 2 in
let g23 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g24) in
  match t1 with
  | true1 -> k arg
  | false0 ->
    let t2 = PRIM_SubInt(arg,g25) in
    let k = [arg], fun [f1] arg ->
      let t1 = [arg], fun [f1] arg k ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      let t2 = PRIM_SubInt(f1,g26) in
      let k = [t1], fun [f1] arg -> f1 arg k in
      g23 t2 k in
    g23 t2 k in
let g28 = 2 in
let g29 = false0 in
let g30 = true1 in
let g31 = 1 in
let g32 = 1 in
let g27 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g28) in
  let k = [arg], fun [f1] arg ->
    match arg with
    | true1 ->
      let t1 = PRIM_SubInt(f1,g31) in
      let k = [f1], fun [f1] arg ->
        let t1 = [arg], fun [f1] arg k ->
          let t1 = PRIM_MulInt(f1,arg) in
          k t1 in
        t1 f1 k in
      g27 t1 k
    | false0 -> k g32 in
  match t1 with
  | true1 -> k g29
  | false0 -> k g30 in
let g33 = 4 in
let g34 = PRIM_CharChr(g33) in
let g35 = fun arg k ->
  let t1 = Cons1[g34,arg] in
  k t1 in
let g36 = Nil0 in
let g37 = '>' in
let g38 = ' ' in
let g39 = Nil0 in
let g40 = Cons1[g38,g39] in
let g41 = Cons1[g37,g40] in
let g43 = 4 in
let g44 = PRIM_CharChr(g43) in
let g45 = Unit0 in
let g46 = '\n' in
let g48 = '\n' in
let g49 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g49 t3 k in
  k t1 in
let g50 = Nil0 in
let g52 = '\n' in
let g53 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g53 t3 k in
  k t1 in
let g54 = Nil0 in
let g55 = 127 in
let g56 = 127 in
let g57 = false0 in
let g58 = true1 in
let g59 = 26 in
let g61 = 8 in
let g62 = PRIM_CharChr(g61) in
let g63 = ' ' in
let g64 = Unit0 in
let g66 = 8 in
let g67 = PRIM_CharChr(g66) in
let g68 = ' ' in
let g69 = Nil0 in
let g70 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g71 = Unit0 in
let g73 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g73 t3 k in
  k t1 in
let g74 = Nil0 in
let g75 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g75 t3 k in
  k t1 in
let g76 = Nil0 in
let g77 = ' ' in
let g78 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g78 t3 k in
  k t1 in
let g79 = Nil0 in
let g80 = Nil0 in
let g72 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match arg with
      | Nil0 ->
        let k = [f1,f2], fun [f1,f2] arg ->
          let k = [f1], fun [f1] arg ->
            let t1 = [arg], fun [f1] arg k ->
              let t1 = Cons1[f1,arg] in
              k t1 in
            let k = [], fun [] arg ->
              let k = [arg], fun [f1] arg -> arg f1 k in
              g75 g76 k in
            t1 f1 k in
          arg f2 k in
        g73 g74 k
      | Cons1(t1,t2) ->
        let t3 = PRIM_EqChar(t1,g77) in
        match t3 with
        | true1 ->
          let k = [f1,f2,t2], fun [f1,f2,f3] arg ->
            let k = [f1,f3], fun [f1,f2] arg ->
              let t1 = [arg], fun [f1] arg k ->
                let t1 = Cons1[f1,arg] in
                k t1 in
              let k = [f2], fun [f1] arg ->
                let k = [f1], fun [f1] arg ->
                  let k = [f1], fun [f1] arg -> arg f1 k in
                  arg g80 k in
                g72 arg k in
              t1 f1 k in
            arg f2 k in
          g78 g79 k
        | false0 ->
          let k = [f2,t1,t2], fun [f1,f2,f3] arg ->
            let t1 = Cons1[f2,f1] in
            let k = [f3], fun [f1] arg -> arg f1 k in
            arg t1 k in
          g72 f1 k in
    k t1 in
  k t1 in
let g81 = Nil0 in
let g82 = Nil0 in
let g83 = Unit0 in
let g84 = "fib" in
let g85 = PRIM_Explode(g84) in
let g86 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g87 = "fib: " in
let g88 = PRIM_Explode(g87) in
let g89 = "ERROR: " in
let g90 = PRIM_Explode(g89) in
let g91 = "expected an argument" in
let g92 = PRIM_Explode(g91) in
let g94 = '\n' in
let g95 = "ERROR: " in
let g96 = PRIM_Explode(g95) in
let g97 = "expected exactly one argument" in
let g98 = PRIM_Explode(g97) in
let g100 = '\n' in
let g102 = '0' in
let g103 = PRIM_CharOrd(g102) in
let g104 = 0 in
let g105 = false0 in
let g106 = true1 in
let g107 = 9 in
let g108 = false0 in
let g109 = true1 in
let g110 = None1 in
let g111 = None1 in
let g112 = None1 in
let g113 = 10 in
let g101 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = Some0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = [t3], fun [f1] arg k ->
        let t1 = PRIM_SubInt(f1,arg) in
        k t1 in
      let k = [f1,t2], fun [f1,f2] arg ->
        let t1 = PRIM_LessInt(arg,g104) in
        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
          let k = [f1,f2], fun [f1,f2] arg ->
            match arg with
            | None1 -> k g112
            | Some0(t1) ->
              let t2 = PRIM_MulInt(g113,f1) in
              let t3 = [t2], fun [f1] arg k ->
                let t1 = PRIM_AddInt(f1,arg) in
                k t1 in
              let k = [f2], fun [f1] arg ->
                let k = [f1], fun [f1] arg -> arg f1 k in
                g101 arg k in
              t3 t1 k in
          match arg with
          | true1 ->
            let t1 = PRIM_LessInt(g107,f3) in
            let k = [f3], fun [f1] arg ->
              match arg with
              | true1 ->
                let t1 = Some0[f1] in
                k t1
              | false0 -> k g110 in
            match t1 with
            | true1 -> k g108
            | false0 -> k g109
          | false0 -> k g111 in
        match t1 with
        | true1 -> k g105
        | false0 -> k g106 in
      t4 g103 k in
  k t1 in
let g114 = 0 in
let g115 = "ERROR: " in
let g116 = PRIM_Explode(g115) in
let g117 = "expected arg1 to be numeric" in
let g118 = PRIM_Explode(g117) in
let g120 = '\n' in
let g121 = '0' in
let g122 = PRIM_CharOrd(g121) in
let g124 = 0 in
let g125 = 10 in
let g126 = 10 in
let g123 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g124) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g125) in
      let t3 = PRIM_AddInt(g122,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g126) in
          arg t1 k in
        g123 arg k in
      t5 f1 k in
  k t1 in
let g127 = 0 in
let g128 = Nil0 in
let g129 = '0' in
let g130 = Cons1[g129,g128] in
let g131 = Nil0 in
let g132 = " --> " in
let g133 = PRIM_Explode(g132) in
let g134 = '0' in
let g135 = PRIM_CharOrd(g134) in
let g137 = 0 in
let g138 = 10 in
let g139 = 10 in
let g136 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g137) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g138) in
      let t3 = PRIM_AddInt(g135,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g139) in
          arg t1 k in
        g136 arg k in
      t5 f1 k in
  k t1 in
let g140 = 0 in
let g141 = Nil0 in
let g142 = '0' in
let g143 = Cons1[g142,g141] in
let g144 = Nil0 in
let g146 = '\n' in
let g147 = "fact" in
let g148 = PRIM_Explode(g147) in
let g149 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g150 = "fact: " in
let g151 = PRIM_Explode(g150) in
let g152 = "ERROR: " in
let g153 = PRIM_Explode(g152) in
let g154 = "expected an argument" in
let g155 = PRIM_Explode(g154) in
let g157 = '\n' in
let g158 = "ERROR: " in
let g159 = PRIM_Explode(g158) in
let g160 = "expected exactly one argument" in
let g161 = PRIM_Explode(g160) in
let g163 = '\n' in
let g165 = '0' in
let g166 = PRIM_CharOrd(g165) in
let g167 = 0 in
let g168 = false0 in
let g169 = true1 in
let g170 = 9 in
let g171 = false0 in
let g172 = true1 in
let g173 = None1 in
let g174 = None1 in
let g175 = None1 in
let g176 = 10 in
let g164 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = Some0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = [t3], fun [f1] arg k ->
        let t1 = PRIM_SubInt(f1,arg) in
        k t1 in
      let k = [f1,t2], fun [f1,f2] arg ->
        let t1 = PRIM_LessInt(arg,g167) in
        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
          let k = [f1,f2], fun [f1,f2] arg ->
            match arg with
            | None1 -> k g175
            | Some0(t1) ->
              let t2 = PRIM_MulInt(g176,f1) in
              let t3 = [t2], fun [f1] arg k ->
                let t1 = PRIM_AddInt(f1,arg) in
                k t1 in
              let k = [f2], fun [f1] arg ->
                let k = [f1], fun [f1] arg -> arg f1 k in
                g164 arg k in
              t3 t1 k in
          match arg with
          | true1 ->
            let t1 = PRIM_LessInt(g170,f3) in
            let k = [f3], fun [f1] arg ->
              match arg with
              | true1 ->
                let t1 = Some0[f1] in
                k t1
              | false0 -> k g173 in
            match t1 with
            | true1 -> k g171
            | false0 -> k g172
          | false0 -> k g174 in
        match t1 with
        | true1 -> k g168
        | false0 -> k g169 in
      t4 g166 k in
  k t1 in
let g177 = 0 in
let g178 = "ERROR: " in
let g179 = PRIM_Explode(g178) in
let g180 = "expected arg1 to be numeric" in
let g181 = PRIM_Explode(g180) in
let g183 = '\n' in
let g184 = '0' in
let g185 = PRIM_CharOrd(g184) in
let g187 = 0 in
let g188 = 10 in
let g189 = 10 in
let g186 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g187) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g188) in
      let t3 = PRIM_AddInt(g185,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g189) in
          arg t1 k in
        g186 arg k in
      t5 f1 k in
  k t1 in
let g190 = 0 in
let g191 = Nil0 in
let g192 = '0' in
let g193 = Cons1[g192,g191] in
let g194 = Nil0 in
let g195 = " --> " in
let g196 = PRIM_Explode(g195) in
let g197 = '0' in
let g198 = PRIM_CharOrd(g197) in
let g200 = 0 in
let g201 = 10 in
let g202 = 10 in
let g199 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g200) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g201) in
      let t3 = PRIM_AddInt(g198,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g202) in
          arg t1 k in
        g199 arg k in
      t5 f1 k in
  k t1 in
let g203 = 0 in
let g204 = Nil0 in
let g205 = '0' in
let g206 = Cons1[g205,g204] in
let g207 = Nil0 in
let g209 = '\n' in
let g210 = "rev" in
let g211 = PRIM_Explode(g210) in
let g212 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g213 = "ERROR: " in
let g214 = PRIM_Explode(g213) in
let g215 = "rev: expected no arguments" in
let g216 = PRIM_Explode(g215) in
let g218 = '\n' in
let g219 = "(reverse typed lines until ^D)\n" in
let g220 = PRIM_Explode(g219) in
let g223 = 4 in
let g224 = PRIM_CharChr(g223) in
let g225 = Unit0 in
let g226 = '\n' in
let g228 = '\n' in
let g229 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g229 t3 k in
  k t1 in
let g230 = Nil0 in
let g232 = '\n' in
let g233 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g233 t3 k in
  k t1 in
let g234 = Nil0 in
let g235 = 127 in
let g236 = 127 in
let g237 = false0 in
let g238 = true1 in
let g239 = 26 in
let g241 = 8 in
let g242 = PRIM_CharChr(g241) in
let g243 = ' ' in
let g244 = Unit0 in
let g246 = 8 in
let g247 = PRIM_CharChr(g246) in
let g248 = ' ' in
let g249 = Nil0 in
let g250 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g251 = Unit0 in
let g252 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g252 t3 k in
  k t1 in
let g253 = Nil0 in
let g255 = '\n' in
let g256 = Unit0 in
let g257 = Unit0 in
let g258 = 'o' in
let g259 = '*' in
let g260 = fun arg k ->
  let t1 = PRIM_EqChar(arg,g258) in
  match t1 with
  | true1 -> k g259
  | false0 -> k arg in
let g261 = "You wrote: \"" in
let g262 = PRIM_Explode(g261) in
let g263 = "\" (" in
let g264 = PRIM_Explode(g263) in
let g265 = '0' in
let g266 = PRIM_CharOrd(g265) in
let g268 = 0 in
let g269 = 10 in
let g270 = 10 in
let g267 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g268) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g269) in
      let t3 = PRIM_AddInt(g266,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g270) in
          arg t1 k in
        g267 arg k in
      t5 f1 k in
  k t1 in
let g271 = 0 in
let g272 = Nil0 in
let g273 = '0' in
let g274 = Cons1[g273,g272] in
let g275 = Nil0 in
let g276 = " chars)" in
let g277 = PRIM_Explode(g276) in
let g279 = '\n' in
let g280 = Unit0 in
let g282 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g283 = PRIM_Explode(g282) in
let g284 = Unit0 in
let g1 = g1 in
let k = [], fun [] arg ->
  let t1 = [arg], fun [f1] me arg k ->
    match arg with
    | Nil0 -> k g22
    | Cons1(t1,t2) ->
      let k = [me,t2], fun [f1,f2] arg -> f1 f2 k in
      f1 t1 k in
  let k = [arg,t1], fun [f1,f2] arg ->
    let t1 = [f1,f2,arg], fun [f1,f2,f3] me arg k ->
      let k = [f1,f2,f3,me], fun [f1,f2,f3,f4] arg ->
        let t1 = [f1], fun [f1] me arg k ->
          let t1 = PRIM_GetChar(g45) in
          let t2 = PRIM_CharOrd(t1) in
          let t3 = PRIM_EqChar(t1,g46) in
          match t3 with
          | true1 ->
            let k = [arg], fun [f1] arg ->
              let k = [f1], fun [f1] arg -> arg f1 k in
              g49 g50 k in
            f1 g48 k
          | false0 ->
            let t4 = PRIM_EqChar(t1,g44) in
            match t4 with
            | true1 ->
              let k = [f1,arg], fun [f1,f2] arg ->
                let k = [f2], fun [f1] arg ->
                  let t1 = Cons1[g44,f1] in
                  let k = [t1], fun [f1] arg -> arg f1 k in
                  g53 g54 k in
                f1 g52 k in
              f1 t1 k
            | false0 ->
              let t5 = PRIM_LessInt(g55,t2) in
              match t5 with
              | true1 -> me arg k
              | false0 ->
                let t6 = PRIM_EqInt(t2,g56) in
                match t6 with
                | true1 ->
                  match arg with
                  | Nil0 -> me arg k
                  | Cons1(t7,t8) ->
                    let t9 = PRIM_CharOrd(t7) in
                    let t10 = [t9], fun [f1] arg k ->
                      let t1 = PRIM_LessInt(arg,f1) in
                      match t1 with
                      | true1 -> k g57
                      | false0 -> k g58 in
                    let k = [f1,me,t8], fun [f1,f2,f3] arg ->
                      let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                            let k = [f2,f3], fun [f1,f2] arg -> f1 f2 k in
                            f1 g67 k in
                          f1 g68 k in
                        f1 g67 k in
                      match arg with
                      | true1 ->
                        let k = [f1], fun [f1] arg ->
                          let k = [f1], fun [f1] arg -> f1 g62 k in
                          f1 g63 k in
                        f1 g62 k
                      | false0 -> k g64 in
                    t10 g59 k
                | false0 ->
                  let k = [arg,me,t1], fun [f1,f2,f3] arg ->
                    let t1 = Cons1[f3,f1] in
                    f2 t1 k in
                  f1 t1 k in
        let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
          let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
            let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
              let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                match arg with
                | true1 -> k g71
                | false0 ->
                  let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                    let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                      let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                        let k = [f4], fun [f1] arg -> f1 g280 k in
                        match arg with
                        | Nil0 -> k g83
                        | Cons1(t1,t2) ->
                          let k = [f1,f2,f3,f5,t1,t2], fun [f1,f2,f3,f4,f5,f6] arg ->
                            let k = [f1,f2,f3,f4,f5,f6], fun [f1,f2,f3,f4,f5,f6] arg ->
                              let k = [f1,f2,f3,f4,f5,f6], fun [f1,f2,f3,f4,f5,f6] arg ->
                                match arg with
                                | true1 ->
                                  let k = [f1,f2,f6], fun [f1,f2,f3] arg ->
                                    match f3 with
                                    | Nil0 ->
                                      let k = [f1,f2], fun [f1,f2] arg ->
                                        let k = [f1], fun [f1] arg -> f1 g94 k in
                                        f2 g92 k in
                                      f2 g90 k
                                    | Cons1(t1,t2) ->
                                      match t2 with
                                      | Cons1(t3,t4) ->
                                        let k = [f1,f2], fun [f1,f2] arg ->
                                          let k = [f1], fun [f1] arg -> f1 g100 k in
                                          f2 g98 k in
                                        f2 g96 k
                                      | Nil0 ->
                                        let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                          let k = [f1,f2], fun [f1,f2] arg ->
                                            match arg with
                                            | None1 ->
                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                let k = [f1], fun [f1] arg -> f1 g120 k in
                                                f2 g118 k in
                                              f2 g116 k
                                            | Some0(t1) ->
                                              let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                let t1 = PRIM_EqInt(f3,g127) in
                                                let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                  let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                      let t1 = PRIM_EqInt(f3,g140) in
                                                      let k = [f1,f2], fun [f1,f2] arg ->
                                                        let k = [f1], fun [f1] arg -> f1 g146 k in
                                                        f2 arg k in
                                                      match t1 with
                                                      | true1 -> k g143
                                                      | false0 ->
                                                        let k = [f3], fun [f1] arg -> arg f1 k in
                                                        g136 g144 k in
                                                    f2 g133 k in
                                                  f2 arg k in
                                                match t1 with
                                                | true1 -> k g130
                                                | false0 ->
                                                  let k = [f3], fun [f1] arg -> arg f1 k in
                                                  g123 g131 k in
                                              g23 t1 k in
                                          arg f3 k in
                                        g101 g114 k in
                                  f2 g88 k
                                | false0 ->
                                  let k = [f1,f2,f3,f4,f5,f6], fun [f1,f2,f3,f4,f5,f6] arg ->
                                    let k = [f1,f2,f3,f4,f5,f6], fun [f1,f2,f3,f4,f5,f6] arg ->
                                      let k = [f1,f2,f3,f4,f5,f6], fun [f1,f2,f3,f4,f5,f6] arg ->
                                        match arg with
                                        | true1 ->
                                          let k = [f1,f2,f6], fun [f1,f2,f3] arg ->
                                            match f3 with
                                            | Nil0 ->
                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                let k = [f1], fun [f1] arg -> f1 g157 k in
                                                f2 g155 k in
                                              f2 g153 k
                                            | Cons1(t1,t2) ->
                                              match t2 with
                                              | Cons1(t3,t4) ->
                                                let k = [f1,f2], fun [f1,f2] arg ->
                                                  let k = [f1], fun [f1] arg -> f1 g163 k in
                                                  f2 g161 k in
                                                f2 g159 k
                                              | Nil0 ->
                                                let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                  let k = [f1,f2], fun [f1,f2] arg ->
                                                    match arg with
                                                    | None1 ->
                                                      let k = [f1,f2], fun [f1,f2] arg ->
                                                        let k = [f1], fun [f1] arg -> f1 g183 k in
                                                        f2 g181 k in
                                                      f2 g179 k
                                                    | Some0(t1) ->
                                                      let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                        let t1 = PRIM_EqInt(f3,g190) in
                                                        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                              let t1 = PRIM_EqInt(f3,g203) in
                                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                                let k = [f1], fun [f1] arg -> f1 g209 k in
                                                                f2 arg k in
                                                              match t1 with
                                                              | true1 -> k g206
                                                              | false0 ->
                                                                let k = [f3], fun [f1] arg -> arg f1 k in
                                                                g199 g207 k in
                                                            f2 g196 k in
                                                          f2 arg k in
                                                        match t1 with
                                                        | true1 -> k g193
                                                        | false0 ->
                                                          let k = [f3], fun [f1] arg -> arg f1 k in
                                                          g186 g194 k in
                                                      g27 t1 k in
                                                  arg f3 k in
                                                g164 g177 k in
                                          f2 g151 k
                                        | false0 ->
                                          let k = [f1,f2,f3,f4,f5,f6], fun [f1,f2,f3,f4,f5,f6] arg ->
                                            let k = [f1,f2,f3,f4,f6], fun [f1,f2,f3,f4,f5] arg ->
                                              let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                                match arg with
                                                | true1 ->
                                                  match f5 with
                                                  | Cons1(t1,t2) ->
                                                    let k = [f1,f2], fun [f1,f2] arg ->
                                                      let k = [f1], fun [f1] arg -> f1 g218 k in
                                                      f2 g216 k in
                                                    f2 g214 k
                                                  | Nil0 ->
                                                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                      let t1 = [f1,f2,f3], fun [f1,f2,f3] me arg k ->
                                                        let t1 = [f1], fun [f1] me arg k ->
                                                          let t1 = PRIM_GetChar(g225) in
                                                          let t2 = PRIM_CharOrd(t1) in
                                                          let t3 = PRIM_EqChar(t1,g226) in
                                                          match t3 with
                                                          | true1 ->
                                                            let k = [arg], fun [f1] arg ->
                                                              let k = [f1], fun [f1] arg -> arg f1 k in
                                                              g229 g230 k in
                                                            f1 g228 k
                                                          | false0 ->
                                                            let t4 = PRIM_EqChar(t1,g224) in
                                                            match t4 with
                                                            | true1 ->
                                                              let k = [f1,arg], fun [f1,f2] arg ->
                                                                let k = [f2], fun [f1] arg ->
                                                                  let t1 = Cons1[g224,f1] in
                                                                  let k = [t1], fun [f1] arg -> arg f1 k in
                                                                  g233 g234 k in
                                                                f1 g232 k in
                                                              f1 t1 k
                                                            | false0 ->
                                                              let t5 = PRIM_LessInt(g235,t2) in
                                                              match t5 with
                                                              | true1 -> me arg k
                                                              | false0 ->
                                                                let t6 = PRIM_EqInt(t2,g236) in
                                                                match t6 with
                                                                | true1 ->
                                                                  match arg with
                                                                  | Nil0 -> me arg k
                                                                  | Cons1(t7,t8) ->
                                                                    let t9 = PRIM_CharOrd(t7) in
                                                                    let t10 = [t9], fun [f1] arg k ->
                                                                      let t1 = PRIM_LessInt(arg,f1) in
                                                                      match t1 with
                                                                      | true1 -> k g237
                                                                      | false0 -> k g238 in
                                                                    let k = [f1,me,t8], fun [f1,f2,f3] arg ->
                                                                      let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                            let k = [f2,f3], fun [f1,f2] arg -> f1 f2 k in
                                                                            f1 g247 k in
                                                                          f1 g248 k in
                                                                        f1 g247 k in
                                                                      match arg with
                                                                      | true1 ->
                                                                        let k = [f1], fun [f1] arg ->
                                                                          let k = [f1], fun [f1] arg -> f1 g242 k in
                                                                          f1 g243 k in
                                                                        f1 g242 k
                                                                      | false0 -> k g244 in
                                                                    t10 g239 k
                                                                | false0 ->
                                                                  let k = [arg,me,t1], fun [f1,f2,f3] arg ->
                                                                    let t1 = Cons1[f3,f1] in
                                                                    f2 t1 k in
                                                                  f1 t1 k in
                                                        let k = [f1,f2,f3,me], fun [f1,f2,f3,f4] arg ->
                                                          let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
                                                            let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                                              let k = [f1,f2,f4,f5], fun [f1,f2,f3,f4] arg ->
                                                                match arg with
                                                                | true1 -> k g251
                                                                | false0 ->
                                                                  let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                                                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                      let k = [f1,f3], fun [f1,f2] arg ->
                                                                        let k = [f2], fun [f1] arg -> f1 g256 k in
                                                                        f1 g255 k in
                                                                      f2 arg k in
                                                                    arg f4 k in
                                                                  g252 g253 k in
                                                              arg f3 k in
                                                            arg f5 k in
                                                          g11 g250 k in
                                                        t1 g249 k in
                                                      t1 g257 k in
                                                    f2 g220 k
                                                | false0 ->
                                                  let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
                                                    let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
                                                      let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
                                                        let k = [f1,f2,f5,arg], fun [f1,f2,f3,f4] arg ->
                                                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                              let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                let t1 = PRIM_EqInt(f3,g271) in
                                                                let k = [f1,f2], fun [f1,f2] arg ->
                                                                  let k = [f1,f2], fun [f1,f2] arg ->
                                                                    let k = [f1], fun [f1] arg -> f1 g279 k in
                                                                    f2 g277 k in
                                                                  f2 arg k in
                                                                match t1 with
                                                                | true1 -> k g274
                                                                | false0 ->
                                                                  let k = [f3], fun [f1] arg -> arg f1 k in
                                                                  g267 g275 k in
                                                              f2 g264 k in
                                                            f2 arg k in
                                                          f4 arg k in
                                                        f4 f3 k in
                                                      g16 g262 k in
                                                    g19 f3 k in
                                                  g17 g260 k in
                                              arg g211 k in
                                            arg f5 k in
                                          g11 g212 k in
                                      arg g148 k in
                                    arg f5 k in
                                  g11 g149 k in
                              arg g85 k in
                            arg f5 k in
                          g11 g86 k in
                      arg f5 k in
                    arg g82 k in
                  g72 g81 k in
              arg f3 k in
            arg f5 k in
          g11 g70 k in
        t1 g69 k in
      f2 g41 k in
    let k = [t1], fun [f1] arg -> f1 g284 k in
    f2 g283 k in
  g35 g36 k in
g1 g10 k
