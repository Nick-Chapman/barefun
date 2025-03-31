(*stage3*)
let k () = ()
let g1 = true1 in
let g2 = false0 in
let g3 = false0 in
let g4 = false0 in
let g5 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    let t1 = [f1,f2,arg], fun [f1,f2,f3] arg k ->
      match f3 with
      | Nil0 ->
        match arg with
        | Nil0 -> k g1
        | Cons1(t1,t2) -> k g2
      | Cons1(t1,t2) ->
        match arg with
        | Nil0 -> k g3
        | Cons1(t3,t4) ->
          let k = [f1,f2,t2,t3,t4], fun [f1,f2,f3,f4,f5] arg ->
            let k = [f1,f2,f3,f5], fun [f1,f2,f3,f4] arg ->
              match arg with
              | true1 ->
                let k = [f3,f4], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  arg f1 k in
                f2 f1 k
              | false0 -> k g4 in
            arg f4 k in
          f1 t1 k in
    k t1 in
  k t1 in
let g6 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t1], fun [f1,f2] arg ->
        let k = [f2], fun [f1] arg ->
          let t1 = Cons1[f1,arg] in
          k t1 in
        arg f1 k in
      f2 t2 k in
  k t1 in
let g7 = Nil0 in
let g8 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k g7
    | Cons1(t1,t2) ->
      let k = [f1,f2,t2], fun [f1,f2,f3] arg ->
        let t1 = [arg], fun [f1] arg k ->
          let t1 = Cons1[f1,arg] in
          k t1 in
        let k = [t1,f3], fun [f1,f2] arg ->
          let k = [f1], fun [f1] arg -> f1 arg k in
          arg f2 k in
        f2 f1 k in
      f1 t1 k in
  k t1 in
let g9 = 0 in
let g10 = 1 in
let g11 = fun arg k ->
  let t1 = PRIM_AddInt(g10,arg) in
  k t1 in
let g12 = fun me arg k ->
  match arg with
  | Nil0 -> k g9
  | Cons1(t1,t2) ->
    let k = [], fun [] arg -> g11 arg k in
    me t2 k in
let g13 = Unit0 in
let g14 = 8 in
let g15 = '\n' in
let g16 = 26 in
let g17 = '^' in
let g18 = 'A' in
let g19 = 1 in
let g20 = fun me arg k ->
  match arg with
  | Nil0 -> k g13
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,g14) in
    let k = [me,t2], fun [f1,f2] arg -> f1 f2 k in
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
          let t8 = PRIM_CharOrd(g18) in
          let t9 = [t8], fun [f1] arg k ->
            let t1 = PRIM_AddInt(f1,arg) in
            k t1 in
          let k = [], fun [] arg ->
            let t1 = [arg], fun [f1] arg k ->
              let t1 = PRIM_SubInt(f1,arg) in
              k t1 in
            let k = [], fun [] arg ->
              let t1 = PRIM_CharChr(arg) in
              let t2 = PRIM_PutChar(t1) in
              k t2 in
            t1 g19 k in
          t9 t3 k in
let g21 = 2 in
let g22 = 1 in
let g23 = 2 in
let g24 = fun me arg k ->
  let t1 = PRIM_LessInt(arg,g21) in
  match t1 with
  | true1 -> k arg
  | false0 ->
    let t2 = PRIM_SubInt(arg,g22) in
    let k = [arg,me], fun [f1,f2] arg ->
      let t1 = [arg], fun [f1] arg k ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      let t2 = PRIM_SubInt(f1,g23) in
      let k = [t1], fun [f1] arg -> f1 arg k in
      f2 t2 k in
    me t2 k in
let g25 = 2 in
let g26 = false0 in
let g27 = true1 in
let g28 = 1 in
let g29 = 1 in
let g30 = fun me arg k ->
  let t1 = PRIM_LessInt(arg,g25) in
  let k = [arg,me], fun [f1,f2] arg ->
    match arg with
    | true1 ->
      let t1 = PRIM_SubInt(f1,g28) in
      let k = [f1], fun [f1] arg ->
        let t1 = [arg], fun [f1] arg k ->
          let t1 = PRIM_MulInt(f1,arg) in
          k t1 in
        t1 f1 k in
      f2 t1 k
    | false0 -> k g29 in
  match t1 with
  | true1 -> k g26
  | false0 -> k g27 in
let g31 = 4 in
let g32 = Nil0 in
let g33 = '>' in
let g34 = ' ' in
let g35 = Nil0 in
let g36 = Cons1[g34,g35] in
let g37 = Cons1[g33,g36] in
let g38 = 4 in
let g39 = Unit0 in
let g40 = '\n' in
let g41 = '\n' in
let g42 = 8 in
let g43 = '\n' in
let g44 = 26 in
let g45 = '^' in
let g46 = 'A' in
let g47 = 1 in
let g48 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g49 = Nil0 in
let g50 = 8 in
let g51 = '\n' in
let g52 = 26 in
let g53 = '^' in
let g54 = 'A' in
let g55 = 1 in
let g56 = '\n' in
let g57 = 8 in
let g58 = '\n' in
let g59 = 26 in
let g60 = '^' in
let g61 = 'A' in
let g62 = 1 in
let g63 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g64 = Nil0 in
let g65 = 127 in
let g66 = 127 in
let g67 = false0 in
let g68 = true1 in
let g69 = 26 in
let g70 = 8 in
let g71 = 8 in
let g72 = '\n' in
let g73 = 26 in
let g74 = '^' in
let g75 = 'A' in
let g76 = 1 in
let g77 = ' ' in
let g78 = 8 in
let g79 = '\n' in
let g80 = 26 in
let g81 = '^' in
let g82 = 'A' in
let g83 = 1 in
let g84 = 8 in
let g85 = '\n' in
let g86 = 26 in
let g87 = '^' in
let g88 = 'A' in
let g89 = 1 in
let g90 = Unit0 in
let g91 = 8 in
let g92 = 8 in
let g93 = '\n' in
let g94 = 26 in
let g95 = '^' in
let g96 = 'A' in
let g97 = 1 in
let g98 = ' ' in
let g99 = 8 in
let g100 = '\n' in
let g101 = 26 in
let g102 = '^' in
let g103 = 'A' in
let g104 = 1 in
let g105 = 8 in
let g106 = '\n' in
let g107 = 26 in
let g108 = '^' in
let g109 = 'A' in
let g110 = 1 in
let g111 = 8 in
let g112 = '\n' in
let g113 = 26 in
let g114 = '^' in
let g115 = 'A' in
let g116 = 1 in
let g117 = Nil0 in
let g118 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g119 = Unit0 in
let g120 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g121 = Nil0 in
let g122 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g123 = Nil0 in
let g124 = ' ' in
let g125 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g126 = Nil0 in
let g127 = Nil0 in
let g128 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    let t1 = [f1,f2,arg], fun [f1,f2,f3] arg k ->
      match arg with
      | Nil0 ->
        let k = [f1,f3], fun [f1,f2] arg ->
          let k = [f1], fun [f1] arg ->
            let t1 = [arg], fun [f1] arg k ->
              let t1 = Cons1[f1,arg] in
              k t1 in
            let k = [], fun [] arg ->
              let k = [arg], fun [f1] arg -> arg f1 k in
              g122 g123 k in
            t1 f1 k in
          arg f2 k in
        g120 g121 k
      | Cons1(t1,t2) ->
        let t3 = PRIM_EqChar(t1,g124) in
        match t3 with
        | true1 ->
          let k = [f1,f2,f3,t2], fun [f1,f2,f3,f4] arg ->
            let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
              let t1 = [arg], fun [f1] arg k ->
                let t1 = Cons1[f1,arg] in
                k t1 in
              let k = [f2,f3], fun [f1,f2] arg ->
                let k = [f2], fun [f1] arg ->
                  let k = [f1], fun [f1] arg -> arg f1 k in
                  arg g127 k in
                f1 arg k in
              t1 f1 k in
            arg f3 k in
          g125 g126 k
        | false0 ->
          let k = [f3,t1,t2], fun [f1,f2,f3] arg ->
            let t1 = Cons1[f2,f1] in
            let k = [f3], fun [f1] arg -> arg f1 k in
            arg t1 k in
          f2 f1 k in
    k t1 in
  k t1 in
let g129 = Nil0 in
let g130 = Nil0 in
let g131 = Unit0 in
let g132 = "fib" in
let g133 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g134 = "fib: " in
let g135 = "expected an argument" in
let g136 = "ERROR: " in
let g137 = '\n' in
let g138 = 8 in
let g139 = '\n' in
let g140 = 26 in
let g141 = '^' in
let g142 = 'A' in
let g143 = 1 in
let g144 = "expected exactly one argument" in
let g145 = "ERROR: " in
let g146 = '\n' in
let g147 = 8 in
let g148 = '\n' in
let g149 = 26 in
let g150 = '^' in
let g151 = 'A' in
let g152 = 1 in
let g153 = '0' in
let g154 = 0 in
let g155 = false0 in
let g156 = true1 in
let g157 = 9 in
let g158 = false0 in
let g159 = true1 in
let g160 = None1 in
let g161 = None1 in
let g162 = None1 in
let g163 = 10 in
let g164 = fun arg k ->
  let t1 = PRIM_MulInt(g163,arg) in
  k t1 in
let g165 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 ->
      let t1 = Some0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = [t3], fun [f1] arg k ->
        let t1 = PRIM_SubInt(f1,arg) in
        k t1 in
      let t5 = PRIM_CharOrd(g153) in
      let k = [f1,f2,t2], fun [f1,f2,f3] arg ->
        let t1 = PRIM_LessInt(arg,g154) in
        let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
            match arg with
            | None1 -> k g162
            | Some0(t1) ->
              let k = [f2,f3,t1], fun [f1,f2,f3] arg ->
                let t1 = [arg], fun [f1] arg k ->
                  let t1 = PRIM_AddInt(f1,arg) in
                  k t1 in
                let k = [f1,f2], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  f1 arg k in
                t1 f3 k in
              g164 f1 k in
          match arg with
          | true1 ->
            let t1 = PRIM_LessInt(g157,f4) in
            let k = [f4], fun [f1] arg ->
              match arg with
              | true1 ->
                let t1 = Some0[f1] in
                k t1
              | false0 -> k g160 in
            match t1 with
            | true1 -> k g158
            | false0 -> k g159
          | false0 -> k g161 in
        match t1 with
        | true1 -> k g155
        | false0 -> k g156 in
      t4 t5 k in
  k t1 in
let g166 = 0 in
let g167 = "expected arg1 to be numeric" in
let g168 = "ERROR: " in
let g169 = '\n' in
let g170 = 8 in
let g171 = '\n' in
let g172 = 26 in
let g173 = '^' in
let g174 = 'A' in
let g175 = 1 in
let g176 = '0' in
let g177 = 0 in
let g178 = 10 in
let g179 = 10 in
let g180 = 0 in
let g181 = '0' in
let g182 = fun arg k ->
  let t1 = Cons1[g181,arg] in
  k t1 in
let g183 = Nil0 in
let g184 = Nil0 in
let g185 = " --> " in
let g186 = '0' in
let g187 = 0 in
let g188 = 10 in
let g189 = 10 in
let g190 = 0 in
let g191 = '0' in
let g192 = fun arg k ->
  let t1 = Cons1[g191,arg] in
  k t1 in
let g193 = Nil0 in
let g194 = Nil0 in
let g195 = '\n' in
let g196 = 8 in
let g197 = '\n' in
let g198 = 26 in
let g199 = '^' in
let g200 = 'A' in
let g201 = 1 in
let g202 = "fact" in
let g203 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g204 = "fact: " in
let g205 = "expected an argument" in
let g206 = "ERROR: " in
let g207 = '\n' in
let g208 = 8 in
let g209 = '\n' in
let g210 = 26 in
let g211 = '^' in
let g212 = 'A' in
let g213 = 1 in
let g214 = "expected exactly one argument" in
let g215 = "ERROR: " in
let g216 = '\n' in
let g217 = 8 in
let g218 = '\n' in
let g219 = 26 in
let g220 = '^' in
let g221 = 'A' in
let g222 = 1 in
let g223 = '0' in
let g224 = 0 in
let g225 = false0 in
let g226 = true1 in
let g227 = 9 in
let g228 = false0 in
let g229 = true1 in
let g230 = None1 in
let g231 = None1 in
let g232 = None1 in
let g233 = 10 in
let g234 = fun arg k ->
  let t1 = PRIM_MulInt(g233,arg) in
  k t1 in
let g235 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 ->
      let t1 = Some0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = [t3], fun [f1] arg k ->
        let t1 = PRIM_SubInt(f1,arg) in
        k t1 in
      let t5 = PRIM_CharOrd(g223) in
      let k = [f1,f2,t2], fun [f1,f2,f3] arg ->
        let t1 = PRIM_LessInt(arg,g224) in
        let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
            match arg with
            | None1 -> k g232
            | Some0(t1) ->
              let k = [f2,f3,t1], fun [f1,f2,f3] arg ->
                let t1 = [arg], fun [f1] arg k ->
                  let t1 = PRIM_AddInt(f1,arg) in
                  k t1 in
                let k = [f1,f2], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  f1 arg k in
                t1 f3 k in
              g234 f1 k in
          match arg with
          | true1 ->
            let t1 = PRIM_LessInt(g227,f4) in
            let k = [f4], fun [f1] arg ->
              match arg with
              | true1 ->
                let t1 = Some0[f1] in
                k t1
              | false0 -> k g230 in
            match t1 with
            | true1 -> k g228
            | false0 -> k g229
          | false0 -> k g231 in
        match t1 with
        | true1 -> k g225
        | false0 -> k g226 in
      t4 t5 k in
  k t1 in
let g236 = 0 in
let g237 = "expected arg1 to be numeric" in
let g238 = "ERROR: " in
let g239 = '\n' in
let g240 = 8 in
let g241 = '\n' in
let g242 = 26 in
let g243 = '^' in
let g244 = 'A' in
let g245 = 1 in
let g246 = '0' in
let g247 = 0 in
let g248 = 10 in
let g249 = 10 in
let g250 = 0 in
let g251 = '0' in
let g252 = fun arg k ->
  let t1 = Cons1[g251,arg] in
  k t1 in
let g253 = Nil0 in
let g254 = Nil0 in
let g255 = " --> " in
let g256 = '0' in
let g257 = 0 in
let g258 = 10 in
let g259 = 10 in
let g260 = 0 in
let g261 = '0' in
let g262 = fun arg k ->
  let t1 = Cons1[g261,arg] in
  k t1 in
let g263 = Nil0 in
let g264 = Nil0 in
let g265 = '\n' in
let g266 = 8 in
let g267 = '\n' in
let g268 = 26 in
let g269 = '^' in
let g270 = 'A' in
let g271 = 1 in
let g272 = "rev" in
let g273 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g274 = "rev: expected no arguments" in
let g275 = "ERROR: " in
let g276 = '\n' in
let g277 = 8 in
let g278 = '\n' in
let g279 = 26 in
let g280 = '^' in
let g281 = 'A' in
let g282 = 1 in
let g283 = "(reverse typed lines until ^D)\n" in
let g284 = 4 in
let g285 = Unit0 in
let g286 = '\n' in
let g287 = '\n' in
let g288 = 8 in
let g289 = '\n' in
let g290 = 26 in
let g291 = '^' in
let g292 = 'A' in
let g293 = 1 in
let g294 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g295 = Nil0 in
let g296 = 8 in
let g297 = '\n' in
let g298 = 26 in
let g299 = '^' in
let g300 = 'A' in
let g301 = 1 in
let g302 = '\n' in
let g303 = 8 in
let g304 = '\n' in
let g305 = 26 in
let g306 = '^' in
let g307 = 'A' in
let g308 = 1 in
let g309 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g310 = Nil0 in
let g311 = 127 in
let g312 = 127 in
let g313 = false0 in
let g314 = true1 in
let g315 = 26 in
let g316 = 8 in
let g317 = 8 in
let g318 = '\n' in
let g319 = 26 in
let g320 = '^' in
let g321 = 'A' in
let g322 = 1 in
let g323 = ' ' in
let g324 = 8 in
let g325 = '\n' in
let g326 = 26 in
let g327 = '^' in
let g328 = 'A' in
let g329 = 1 in
let g330 = 8 in
let g331 = '\n' in
let g332 = 26 in
let g333 = '^' in
let g334 = 'A' in
let g335 = 1 in
let g336 = Unit0 in
let g337 = 8 in
let g338 = 8 in
let g339 = '\n' in
let g340 = 26 in
let g341 = '^' in
let g342 = 'A' in
let g343 = 1 in
let g344 = ' ' in
let g345 = 8 in
let g346 = '\n' in
let g347 = 26 in
let g348 = '^' in
let g349 = 'A' in
let g350 = 1 in
let g351 = 8 in
let g352 = '\n' in
let g353 = 26 in
let g354 = '^' in
let g355 = 'A' in
let g356 = 1 in
let g357 = 8 in
let g358 = '\n' in
let g359 = 26 in
let g360 = '^' in
let g361 = 'A' in
let g362 = 1 in
let g363 = Nil0 in
let g364 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g365 = Unit0 in
let g366 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g367 = Nil0 in
let g368 = '\n' in
let g369 = 8 in
let g370 = '\n' in
let g371 = 26 in
let g372 = '^' in
let g373 = 'A' in
let g374 = 1 in
let g375 = Unit0 in
let g376 = Unit0 in
let g377 = 'o' in
let g378 = '*' in
let g379 = fun arg k ->
  let t1 = PRIM_EqChar(arg,g377) in
  match t1 with
  | true1 -> k g378
  | false0 -> k arg in
let g380 = "You wrote: \"" in
let g381 = "\" (" in
let g382 = '0' in
let g383 = 0 in
let g384 = 10 in
let g385 = 10 in
let g386 = 0 in
let g387 = '0' in
let g388 = fun arg k ->
  let t1 = Cons1[g387,arg] in
  k t1 in
let g389 = Nil0 in
let g390 = Nil0 in
let g391 = " chars)" in
let g392 = '\n' in
let g393 = 8 in
let g394 = '\n' in
let g395 = 26 in
let g396 = '^' in
let g397 = 'A' in
let g398 = 1 in
let g399 = Unit0 in
let g400 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g401 = Unit0 in
let t1 = PRIM_CharChr(g31) in
let t2 = [t1], fun [f1] arg k ->
  let t1 = Cons1[f1,arg] in
  k t1 in
let k = [], fun [] arg ->
  let t1 = [arg], fun [f1] me arg k ->
    let k = [f1,me], fun [f1,f2] arg ->
      let t1 = PRIM_CharChr(g38) in
      let t2 = [t1], fun [f1] me arg k ->
        let t1 = PRIM_GetChar(g39) in
        let t2 = PRIM_CharOrd(t1) in
        let t3 = PRIM_EqChar(t1,g40) in
        match t3 with
        | true1 ->
          let t4 = PRIM_CharOrd(g41) in
          let t5 = PRIM_EqInt(t4,g42) in
          let k = [arg], fun [f1] arg ->
            let k = [f1], fun [f1] arg -> arg f1 k in
            g48 g49 k in
          match t5 with
          | true1 ->
            let t6 = PRIM_PutChar(g41) in
            k t6
          | false0 ->
            let t6 = PRIM_EqChar(g41,g43) in
            match t6 with
            | true1 ->
              let t7 = PRIM_PutChar(g41) in
              k t7
            | false0 ->
              let t7 = PRIM_LessInt(g44,t4) in
              match t7 with
              | true1 ->
                let t8 = PRIM_PutChar(g41) in
                k t8
              | false0 ->
                let t8 = PRIM_PutChar(g45) in
                let t9 = PRIM_CharOrd(g46) in
                let t10 = [t9], fun [f1] arg k ->
                  let t1 = PRIM_AddInt(f1,arg) in
                  k t1 in
                let k = [], fun [] arg ->
                  let t1 = [arg], fun [f1] arg k ->
                    let t1 = PRIM_SubInt(f1,arg) in
                    k t1 in
                  let k = [], fun [] arg ->
                    let t1 = PRIM_CharChr(arg) in
                    let t2 = PRIM_PutChar(t1) in
                    k t2 in
                  t1 g47 k in
                t10 t4 k
        | false0 ->
          let t4 = PRIM_EqChar(t1,f1) in
          match t4 with
          | true1 ->
            let t5 = PRIM_CharOrd(t1) in
            let t6 = PRIM_EqInt(t5,g50) in
            let k = [f1,arg], fun [f1,f2] arg ->
              let t1 = PRIM_CharOrd(g56) in
              let t2 = PRIM_EqInt(t1,g57) in
              let k = [f1,f2], fun [f1,f2] arg ->
                let t1 = Cons1[f1,f2] in
                let k = [t1], fun [f1] arg -> arg f1 k in
                g63 g64 k in
              match t2 with
              | true1 ->
                let t3 = PRIM_PutChar(g56) in
                k t3
              | false0 ->
                let t3 = PRIM_EqChar(g56,g58) in
                match t3 with
                | true1 ->
                  let t4 = PRIM_PutChar(g56) in
                  k t4
                | false0 ->
                  let t4 = PRIM_LessInt(g59,t1) in
                  match t4 with
                  | true1 ->
                    let t5 = PRIM_PutChar(g56) in
                    k t5
                  | false0 ->
                    let t5 = PRIM_PutChar(g60) in
                    let t6 = PRIM_CharOrd(g61) in
                    let t7 = [t6], fun [f1] arg k ->
                      let t1 = PRIM_AddInt(f1,arg) in
                      k t1 in
                    let k = [], fun [] arg ->
                      let t1 = [arg], fun [f1] arg k ->
                        let t1 = PRIM_SubInt(f1,arg) in
                        k t1 in
                      let k = [], fun [] arg ->
                        let t1 = PRIM_CharChr(arg) in
                        let t2 = PRIM_PutChar(t1) in
                        k t2 in
                      t1 g62 k in
                    t7 t1 k in
            match t6 with
            | true1 ->
              let t7 = PRIM_PutChar(t1) in
              k t7
            | false0 ->
              let t7 = PRIM_EqChar(t1,g51) in
              match t7 with
              | true1 ->
                let t8 = PRIM_PutChar(t1) in
                k t8
              | false0 ->
                let t8 = PRIM_LessInt(g52,t5) in
                match t8 with
                | true1 ->
                  let t9 = PRIM_PutChar(t1) in
                  k t9
                | false0 ->
                  let t9 = PRIM_PutChar(g53) in
                  let t10 = PRIM_CharOrd(g54) in
                  let t11 = [t10], fun [f1] arg k ->
                    let t1 = PRIM_AddInt(f1,arg) in
                    k t1 in
                  let k = [], fun [] arg ->
                    let t1 = [arg], fun [f1] arg k ->
                      let t1 = PRIM_SubInt(f1,arg) in
                      k t1 in
                    let k = [], fun [] arg ->
                      let t1 = PRIM_CharChr(arg) in
                      let t2 = PRIM_PutChar(t1) in
                      k t2 in
                    t1 g55 k in
                  t11 t5 k
          | false0 ->
            let t5 = PRIM_LessInt(g65,t2) in
            match t5 with
            | true1 -> me arg k
            | false0 ->
              let t6 = PRIM_EqInt(t2,g66) in
              match t6 with
              | true1 ->
                match arg with
                | Nil0 -> me arg k
                | Cons1(t7,t8) ->
                  let t9 = PRIM_CharOrd(t7) in
                  let t10 = [t9], fun [f1] arg k ->
                    let t1 = PRIM_LessInt(arg,f1) in
                    match t1 with
                    | true1 -> k g67
                    | false0 -> k g68 in
                  let k = [me,t8], fun [f1,f2] arg ->
                    let k = [f1,f2], fun [f1,f2] arg ->
                      let t1 = PRIM_CharChr(g91) in
                      let t2 = PRIM_CharOrd(t1) in
                      let t3 = PRIM_EqInt(t2,g92) in
                      let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                        let t1 = PRIM_CharOrd(g98) in
                        let t2 = PRIM_EqInt(t1,g99) in
                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                          let t1 = PRIM_CharOrd(f3) in
                          let t2 = PRIM_EqInt(t1,g105) in
                          let k = [f1,f2], fun [f1,f2] arg -> f1 f2 k in
                          match t2 with
                          | true1 ->
                            let t3 = PRIM_PutChar(f3) in
                            k t3
                          | false0 ->
                            let t3 = PRIM_EqChar(f3,g106) in
                            match t3 with
                            | true1 ->
                              let t4 = PRIM_PutChar(f3) in
                              k t4
                            | false0 ->
                              let t4 = PRIM_LessInt(g107,t1) in
                              match t4 with
                              | true1 ->
                                let t5 = PRIM_PutChar(f3) in
                                k t5
                              | false0 ->
                                let t5 = PRIM_PutChar(g108) in
                                let t6 = PRIM_CharOrd(g109) in
                                let t7 = [t6], fun [f1] arg k ->
                                  let t1 = PRIM_AddInt(f1,arg) in
                                  k t1 in
                                let k = [], fun [] arg ->
                                  let t1 = [arg], fun [f1] arg k ->
                                    let t1 = PRIM_SubInt(f1,arg) in
                                    k t1 in
                                  let k = [], fun [] arg ->
                                    let t1 = PRIM_CharChr(arg) in
                                    let t2 = PRIM_PutChar(t1) in
                                    k t2 in
                                  t1 g110 k in
                                t7 t1 k in
                        match t2 with
                        | true1 ->
                          let t3 = PRIM_PutChar(g98) in
                          k t3
                        | false0 ->
                          let t3 = PRIM_EqChar(g98,g100) in
                          match t3 with
                          | true1 ->
                            let t4 = PRIM_PutChar(g98) in
                            k t4
                          | false0 ->
                            let t4 = PRIM_LessInt(g101,t1) in
                            match t4 with
                            | true1 ->
                              let t5 = PRIM_PutChar(g98) in
                              k t5
                            | false0 ->
                              let t5 = PRIM_PutChar(g102) in
                              let t6 = PRIM_CharOrd(g103) in
                              let t7 = [t6], fun [f1] arg k ->
                                let t1 = PRIM_AddInt(f1,arg) in
                                k t1 in
                              let k = [], fun [] arg ->
                                let t1 = [arg], fun [f1] arg k ->
                                  let t1 = PRIM_SubInt(f1,arg) in
                                  k t1 in
                                let k = [], fun [] arg ->
                                  let t1 = PRIM_CharChr(arg) in
                                  let t2 = PRIM_PutChar(t1) in
                                  k t2 in
                                t1 g104 k in
                              t7 t1 k in
                      match t3 with
                      | true1 ->
                        let t4 = PRIM_PutChar(t1) in
                        k t4
                      | false0 ->
                        let t4 = PRIM_EqChar(t1,g93) in
                        match t4 with
                        | true1 ->
                          let t5 = PRIM_PutChar(t1) in
                          k t5
                        | false0 ->
                          let t5 = PRIM_LessInt(g94,t2) in
                          match t5 with
                          | true1 ->
                            let t6 = PRIM_PutChar(t1) in
                            k t6
                          | false0 ->
                            let t6 = PRIM_PutChar(g95) in
                            let t7 = PRIM_CharOrd(g96) in
                            let t8 = [t7], fun [f1] arg k ->
                              let t1 = PRIM_AddInt(f1,arg) in
                              k t1 in
                            let k = [], fun [] arg ->
                              let t1 = [arg], fun [f1] arg k ->
                                let t1 = PRIM_SubInt(f1,arg) in
                                k t1 in
                              let k = [], fun [] arg ->
                                let t1 = PRIM_CharChr(arg) in
                                let t2 = PRIM_PutChar(t1) in
                                k t2 in
                              t1 g97 k in
                            t8 t2 k in
                    match arg with
                    | true1 ->
                      let t1 = PRIM_CharChr(g70) in
                      let t2 = PRIM_CharOrd(t1) in
                      let t3 = PRIM_EqInt(t2,g71) in
                      let k = [t1], fun [f1] arg ->
                        let t1 = PRIM_CharOrd(g77) in
                        let t2 = PRIM_EqInt(t1,g78) in
                        let k = [f1], fun [f1] arg ->
                          let t1 = PRIM_CharOrd(f1) in
                          let t2 = PRIM_EqInt(t1,g84) in
                          match t2 with
                          | true1 ->
                            let t3 = PRIM_PutChar(f1) in
                            k t3
                          | false0 ->
                            let t3 = PRIM_EqChar(f1,g85) in
                            match t3 with
                            | true1 ->
                              let t4 = PRIM_PutChar(f1) in
                              k t4
                            | false0 ->
                              let t4 = PRIM_LessInt(g86,t1) in
                              match t4 with
                              | true1 ->
                                let t5 = PRIM_PutChar(f1) in
                                k t5
                              | false0 ->
                                let t5 = PRIM_PutChar(g87) in
                                let t6 = PRIM_CharOrd(g88) in
                                let t7 = [t6], fun [f1] arg k ->
                                  let t1 = PRIM_AddInt(f1,arg) in
                                  k t1 in
                                let k = [], fun [] arg ->
                                  let t1 = [arg], fun [f1] arg k ->
                                    let t1 = PRIM_SubInt(f1,arg) in
                                    k t1 in
                                  let k = [], fun [] arg ->
                                    let t1 = PRIM_CharChr(arg) in
                                    let t2 = PRIM_PutChar(t1) in
                                    k t2 in
                                  t1 g89 k in
                                t7 t1 k in
                        match t2 with
                        | true1 ->
                          let t3 = PRIM_PutChar(g77) in
                          k t3
                        | false0 ->
                          let t3 = PRIM_EqChar(g77,g79) in
                          match t3 with
                          | true1 ->
                            let t4 = PRIM_PutChar(g77) in
                            k t4
                          | false0 ->
                            let t4 = PRIM_LessInt(g80,t1) in
                            match t4 with
                            | true1 ->
                              let t5 = PRIM_PutChar(g77) in
                              k t5
                            | false0 ->
                              let t5 = PRIM_PutChar(g81) in
                              let t6 = PRIM_CharOrd(g82) in
                              let t7 = [t6], fun [f1] arg k ->
                                let t1 = PRIM_AddInt(f1,arg) in
                                k t1 in
                              let k = [], fun [] arg ->
                                let t1 = [arg], fun [f1] arg k ->
                                  let t1 = PRIM_SubInt(f1,arg) in
                                  k t1 in
                                let k = [], fun [] arg ->
                                  let t1 = PRIM_CharChr(arg) in
                                  let t2 = PRIM_PutChar(t1) in
                                  k t2 in
                                t1 g83 k in
                              t7 t1 k in
                      match t3 with
                      | true1 ->
                        let t4 = PRIM_PutChar(t1) in
                        k t4
                      | false0 ->
                        let t4 = PRIM_EqChar(t1,g72) in
                        match t4 with
                        | true1 ->
                          let t5 = PRIM_PutChar(t1) in
                          k t5
                        | false0 ->
                          let t5 = PRIM_LessInt(g73,t2) in
                          match t5 with
                          | true1 ->
                            let t6 = PRIM_PutChar(t1) in
                            k t6
                          | false0 ->
                            let t6 = PRIM_PutChar(g74) in
                            let t7 = PRIM_CharOrd(g75) in
                            let t8 = [t7], fun [f1] arg k ->
                              let t1 = PRIM_AddInt(f1,arg) in
                              k t1 in
                            let k = [], fun [] arg ->
                              let t1 = [arg], fun [f1] arg k ->
                                let t1 = PRIM_SubInt(f1,arg) in
                                k t1 in
                              let k = [], fun [] arg ->
                                let t1 = PRIM_CharChr(arg) in
                                let t2 = PRIM_PutChar(t1) in
                                k t2 in
                              t1 g76 k in
                            t8 t2 k
                    | false0 -> k g90 in
                  t10 g69 k
              | false0 ->
                let t7 = PRIM_CharOrd(t1) in
                let t8 = PRIM_EqInt(t7,g111) in
                let k = [arg,me,t1], fun [f1,f2,f3] arg ->
                  let t1 = Cons1[f3,f1] in
                  f2 t1 k in
                match t8 with
                | true1 ->
                  let t9 = PRIM_PutChar(t1) in
                  k t9
                | false0 ->
                  let t9 = PRIM_EqChar(t1,g112) in
                  match t9 with
                  | true1 ->
                    let t10 = PRIM_PutChar(t1) in
                    k t10
                  | false0 ->
                    let t10 = PRIM_LessInt(g113,t7) in
                    match t10 with
                    | true1 ->
                      let t11 = PRIM_PutChar(t1) in
                      k t11
                    | false0 ->
                      let t11 = PRIM_PutChar(g114) in
                      let t12 = PRIM_CharOrd(g115) in
                      let t13 = [t12], fun [f1] arg k ->
                        let t1 = PRIM_AddInt(f1,arg) in
                        k t1 in
                      let k = [], fun [] arg ->
                        let t1 = [arg], fun [f1] arg k ->
                          let t1 = PRIM_SubInt(f1,arg) in
                          k t1 in
                        let k = [], fun [] arg ->
                          let t1 = PRIM_CharChr(arg) in
                          let t2 = PRIM_PutChar(t1) in
                          k t2 in
                        t1 g116 k in
                      t13 t7 k in
      let k = [f1,f2], fun [f1,f2] arg ->
        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
              match arg with
              | true1 -> k g119
              | false0 ->
                let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                  let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                      let k = [f2], fun [f1] arg -> f1 g399 k in
                      match arg with
                      | Nil0 -> k g131
                      | Cons1(t1,t2) ->
                        let t3 = PRIM_Explode(g132) in
                        let k = [f1,f3,t1,t2,t3], fun [f1,f2,f3,f4,f5] arg ->
                          let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                            let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                              match arg with
                              | true1 ->
                                let t1 = PRIM_Explode(g134) in
                                let k = [f4], fun [f1] arg ->
                                  match f1 with
                                  | Nil0 ->
                                    let t1 = PRIM_Explode(g136) in
                                    let k = [], fun [] arg ->
                                      let t1 = PRIM_Explode(g135) in
                                      let k = [], fun [] arg ->
                                        let t1 = PRIM_CharOrd(g137) in
                                        let t2 = PRIM_EqInt(t1,g138) in
                                        match t2 with
                                        | true1 ->
                                          let t3 = PRIM_PutChar(g137) in
                                          k t3
                                        | false0 ->
                                          let t3 = PRIM_EqChar(g137,g139) in
                                          match t3 with
                                          | true1 ->
                                            let t4 = PRIM_PutChar(g137) in
                                            k t4
                                          | false0 ->
                                            let t4 = PRIM_LessInt(g140,t1) in
                                            match t4 with
                                            | true1 ->
                                              let t5 = PRIM_PutChar(g137) in
                                              k t5
                                            | false0 ->
                                              let t5 = PRIM_PutChar(g141) in
                                              let t6 = PRIM_CharOrd(g142) in
                                              let t7 = [t6], fun [f1] arg k ->
                                                let t1 = PRIM_AddInt(f1,arg) in
                                                k t1 in
                                              let k = [], fun [] arg ->
                                                let t1 = [arg], fun [f1] arg k ->
                                                  let t1 = PRIM_SubInt(f1,arg) in
                                                  k t1 in
                                                let k = [], fun [] arg ->
                                                  let t1 = PRIM_CharChr(arg) in
                                                  let t2 = PRIM_PutChar(t1) in
                                                  k t2 in
                                                t1 g143 k in
                                              t7 t1 k in
                                      g20 t1 k in
                                    g20 t1 k
                                  | Cons1(t1,t2) ->
                                    match t2 with
                                    | Cons1(t3,t4) ->
                                      let t5 = PRIM_Explode(g145) in
                                      let k = [], fun [] arg ->
                                        let t1 = PRIM_Explode(g144) in
                                        let k = [], fun [] arg ->
                                          let t1 = PRIM_CharOrd(g146) in
                                          let t2 = PRIM_EqInt(t1,g147) in
                                          match t2 with
                                          | true1 ->
                                            let t3 = PRIM_PutChar(g146) in
                                            k t3
                                          | false0 ->
                                            let t3 = PRIM_EqChar(g146,g148) in
                                            match t3 with
                                            | true1 ->
                                              let t4 = PRIM_PutChar(g146) in
                                              k t4
                                            | false0 ->
                                              let t4 = PRIM_LessInt(g149,t1) in
                                              match t4 with
                                              | true1 ->
                                                let t5 = PRIM_PutChar(g146) in
                                                k t5
                                              | false0 ->
                                                let t5 = PRIM_PutChar(g150) in
                                                let t6 = PRIM_CharOrd(g151) in
                                                let t7 = [t6], fun [f1] arg k ->
                                                  let t1 = PRIM_AddInt(f1,arg) in
                                                  k t1 in
                                                let k = [], fun [] arg ->
                                                  let t1 = [arg], fun [f1] arg k ->
                                                    let t1 = PRIM_SubInt(f1,arg) in
                                                    k t1 in
                                                  let k = [], fun [] arg ->
                                                    let t1 = PRIM_CharChr(arg) in
                                                    let t2 = PRIM_PutChar(t1) in
                                                    k t2 in
                                                  t1 g152 k in
                                                t7 t1 k in
                                        g20 t1 k in
                                      g20 t5 k
                                    | Nil0 ->
                                      let k = [t1], fun [f1] arg ->
                                        let k = [], fun [] arg ->
                                          match arg with
                                          | None1 ->
                                            let t1 = PRIM_Explode(g168) in
                                            let k = [], fun [] arg ->
                                              let t1 = PRIM_Explode(g167) in
                                              let k = [], fun [] arg ->
                                                let t1 = PRIM_CharOrd(g169) in
                                                let t2 = PRIM_EqInt(t1,g170) in
                                                match t2 with
                                                | true1 ->
                                                  let t3 = PRIM_PutChar(g169) in
                                                  k t3
                                                | false0 ->
                                                  let t3 = PRIM_EqChar(g169,g171) in
                                                  match t3 with
                                                  | true1 ->
                                                    let t4 = PRIM_PutChar(g169) in
                                                    k t4
                                                  | false0 ->
                                                    let t4 = PRIM_LessInt(g172,t1) in
                                                    match t4 with
                                                    | true1 ->
                                                      let t5 = PRIM_PutChar(g169) in
                                                      k t5
                                                    | false0 ->
                                                      let t5 = PRIM_PutChar(g173) in
                                                      let t6 = PRIM_CharOrd(g174) in
                                                      let t7 = [t6], fun [f1] arg k ->
                                                        let t1 = PRIM_AddInt(f1,arg) in
                                                        k t1 in
                                                      let k = [], fun [] arg ->
                                                        let t1 = [arg], fun [f1] arg k ->
                                                          let t1 = PRIM_SubInt(f1,arg) in
                                                          k t1 in
                                                        let k = [], fun [] arg ->
                                                          let t1 = PRIM_CharChr(arg) in
                                                          let t2 = PRIM_PutChar(t1) in
                                                          k t2 in
                                                        t1 g175 k in
                                                      t7 t1 k in
                                              g20 t1 k in
                                            g20 t1 k
                                          | Some0(t1) ->
                                            let k = [t1], fun [f1] arg ->
                                              let t1 = PRIM_CharOrd(g176) in
                                              let t2 = [t1], fun [f1] me arg k ->
                                                let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                  let t1 = PRIM_EqInt(arg,g177) in
                                                  match t1 with
                                                  | true1 -> k f2
                                                  | false0 ->
                                                    let t2 = PRIM_ModInt(arg,g178) in
                                                    let t3 = PRIM_AddInt(f1,t2) in
                                                    let t4 = PRIM_CharChr(t3) in
                                                    let t5 = [t4], fun [f1] arg k ->
                                                      let t1 = Cons1[f1,arg] in
                                                      k t1 in
                                                    let k = [f3,arg], fun [f1,f2] arg ->
                                                      let k = [f2], fun [f1] arg ->
                                                        let t1 = PRIM_DivInt(f1,g179) in
                                                        arg t1 k in
                                                      f1 arg k in
                                                    t5 f2 k in
                                                k t1 in
                                              let t3 = PRIM_EqInt(f1,g180) in
                                              let k = [arg], fun [f1] arg ->
                                                let k = [f1], fun [f1] arg ->
                                                  let t1 = PRIM_Explode(g185) in
                                                  let k = [f1], fun [f1] arg ->
                                                    let t1 = PRIM_CharOrd(g186) in
                                                    let t2 = [t1], fun [f1] me arg k ->
                                                      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                        let t1 = PRIM_EqInt(arg,g187) in
                                                        match t1 with
                                                        | true1 -> k f2
                                                        | false0 ->
                                                          let t2 = PRIM_ModInt(arg,g188) in
                                                          let t3 = PRIM_AddInt(f1,t2) in
                                                          let t4 = PRIM_CharChr(t3) in
                                                          let t5 = [t4], fun [f1] arg k ->
                                                            let t1 = Cons1[f1,arg] in
                                                            k t1 in
                                                          let k = [f3,arg], fun [f1,f2] arg ->
                                                            let k = [f2], fun [f1] arg ->
                                                              let t1 = PRIM_DivInt(f1,g189) in
                                                              arg t1 k in
                                                            f1 arg k in
                                                          t5 f2 k in
                                                      k t1 in
                                                    let t3 = PRIM_EqInt(f1,g190) in
                                                    let k = [], fun [] arg ->
                                                      let k = [], fun [] arg ->
                                                        let t1 = PRIM_CharOrd(g195) in
                                                        let t2 = PRIM_EqInt(t1,g196) in
                                                        match t2 with
                                                        | true1 ->
                                                          let t3 = PRIM_PutChar(g195) in
                                                          k t3
                                                        | false0 ->
                                                          let t3 = PRIM_EqChar(g195,g197) in
                                                          match t3 with
                                                          | true1 ->
                                                            let t4 = PRIM_PutChar(g195) in
                                                            k t4
                                                          | false0 ->
                                                            let t4 = PRIM_LessInt(g198,t1) in
                                                            match t4 with
                                                            | true1 ->
                                                              let t5 = PRIM_PutChar(g195) in
                                                              k t5
                                                            | false0 ->
                                                              let t5 = PRIM_PutChar(g199) in
                                                              let t6 = PRIM_CharOrd(g200) in
                                                              let t7 = [t6], fun [f1] arg k ->
                                                                let t1 = PRIM_AddInt(f1,arg) in
                                                                k t1 in
                                                              let k = [], fun [] arg ->
                                                                let t1 = [arg], fun [f1] arg k ->
                                                                  let t1 = PRIM_SubInt(f1,arg) in
                                                                  k t1 in
                                                                let k = [], fun [] arg ->
                                                                  let t1 = PRIM_CharChr(arg) in
                                                                  let t2 = PRIM_PutChar(t1) in
                                                                  k t2 in
                                                                t1 g201 k in
                                                              t7 t1 k in
                                                      g20 arg k in
                                                    match t3 with
                                                    | true1 -> g192 g193 k
                                                    | false0 ->
                                                      let k = [f1], fun [f1] arg -> arg f1 k in
                                                      t2 g194 k in
                                                  g20 t1 k in
                                                g20 arg k in
                                              match t3 with
                                              | true1 -> g182 g183 k
                                              | false0 ->
                                                let k = [f1], fun [f1] arg -> arg f1 k in
                                                t2 g184 k in
                                            g24 t1 k in
                                        arg f1 k in
                                      g165 g166 k in
                                g20 t1 k
                              | false0 ->
                                let t1 = PRIM_Explode(g202) in
                                let k = [f1,f2,f3,f4,t1], fun [f1,f2,f3,f4,f5] arg ->
                                  let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                    let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                      match arg with
                                      | true1 ->
                                        let t1 = PRIM_Explode(g204) in
                                        let k = [f4], fun [f1] arg ->
                                          match f1 with
                                          | Nil0 ->
                                            let t1 = PRIM_Explode(g206) in
                                            let k = [], fun [] arg ->
                                              let t1 = PRIM_Explode(g205) in
                                              let k = [], fun [] arg ->
                                                let t1 = PRIM_CharOrd(g207) in
                                                let t2 = PRIM_EqInt(t1,g208) in
                                                match t2 with
                                                | true1 ->
                                                  let t3 = PRIM_PutChar(g207) in
                                                  k t3
                                                | false0 ->
                                                  let t3 = PRIM_EqChar(g207,g209) in
                                                  match t3 with
                                                  | true1 ->
                                                    let t4 = PRIM_PutChar(g207) in
                                                    k t4
                                                  | false0 ->
                                                    let t4 = PRIM_LessInt(g210,t1) in
                                                    match t4 with
                                                    | true1 ->
                                                      let t5 = PRIM_PutChar(g207) in
                                                      k t5
                                                    | false0 ->
                                                      let t5 = PRIM_PutChar(g211) in
                                                      let t6 = PRIM_CharOrd(g212) in
                                                      let t7 = [t6], fun [f1] arg k ->
                                                        let t1 = PRIM_AddInt(f1,arg) in
                                                        k t1 in
                                                      let k = [], fun [] arg ->
                                                        let t1 = [arg], fun [f1] arg k ->
                                                          let t1 = PRIM_SubInt(f1,arg) in
                                                          k t1 in
                                                        let k = [], fun [] arg ->
                                                          let t1 = PRIM_CharChr(arg) in
                                                          let t2 = PRIM_PutChar(t1) in
                                                          k t2 in
                                                        t1 g213 k in
                                                      t7 t1 k in
                                              g20 t1 k in
                                            g20 t1 k
                                          | Cons1(t1,t2) ->
                                            match t2 with
                                            | Cons1(t3,t4) ->
                                              let t5 = PRIM_Explode(g215) in
                                              let k = [], fun [] arg ->
                                                let t1 = PRIM_Explode(g214) in
                                                let k = [], fun [] arg ->
                                                  let t1 = PRIM_CharOrd(g216) in
                                                  let t2 = PRIM_EqInt(t1,g217) in
                                                  match t2 with
                                                  | true1 ->
                                                    let t3 = PRIM_PutChar(g216) in
                                                    k t3
                                                  | false0 ->
                                                    let t3 = PRIM_EqChar(g216,g218) in
                                                    match t3 with
                                                    | true1 ->
                                                      let t4 = PRIM_PutChar(g216) in
                                                      k t4
                                                    | false0 ->
                                                      let t4 = PRIM_LessInt(g219,t1) in
                                                      match t4 with
                                                      | true1 ->
                                                        let t5 = PRIM_PutChar(g216) in
                                                        k t5
                                                      | false0 ->
                                                        let t5 = PRIM_PutChar(g220) in
                                                        let t6 = PRIM_CharOrd(g221) in
                                                        let t7 = [t6], fun [f1] arg k ->
                                                          let t1 = PRIM_AddInt(f1,arg) in
                                                          k t1 in
                                                        let k = [], fun [] arg ->
                                                          let t1 = [arg], fun [f1] arg k ->
                                                            let t1 = PRIM_SubInt(f1,arg) in
                                                            k t1 in
                                                          let k = [], fun [] arg ->
                                                            let t1 = PRIM_CharChr(arg) in
                                                            let t2 = PRIM_PutChar(t1) in
                                                            k t2 in
                                                          t1 g222 k in
                                                        t7 t1 k in
                                                g20 t1 k in
                                              g20 t5 k
                                            | Nil0 ->
                                              let k = [t1], fun [f1] arg ->
                                                let k = [], fun [] arg ->
                                                  match arg with
                                                  | None1 ->
                                                    let t1 = PRIM_Explode(g238) in
                                                    let k = [], fun [] arg ->
                                                      let t1 = PRIM_Explode(g237) in
                                                      let k = [], fun [] arg ->
                                                        let t1 = PRIM_CharOrd(g239) in
                                                        let t2 = PRIM_EqInt(t1,g240) in
                                                        match t2 with
                                                        | true1 ->
                                                          let t3 = PRIM_PutChar(g239) in
                                                          k t3
                                                        | false0 ->
                                                          let t3 = PRIM_EqChar(g239,g241) in
                                                          match t3 with
                                                          | true1 ->
                                                            let t4 = PRIM_PutChar(g239) in
                                                            k t4
                                                          | false0 ->
                                                            let t4 = PRIM_LessInt(g242,t1) in
                                                            match t4 with
                                                            | true1 ->
                                                              let t5 = PRIM_PutChar(g239) in
                                                              k t5
                                                            | false0 ->
                                                              let t5 = PRIM_PutChar(g243) in
                                                              let t6 = PRIM_CharOrd(g244) in
                                                              let t7 = [t6], fun [f1] arg k ->
                                                                let t1 = PRIM_AddInt(f1,arg) in
                                                                k t1 in
                                                              let k = [], fun [] arg ->
                                                                let t1 = [arg], fun [f1] arg k ->
                                                                  let t1 = PRIM_SubInt(f1,arg) in
                                                                  k t1 in
                                                                let k = [], fun [] arg ->
                                                                  let t1 = PRIM_CharChr(arg) in
                                                                  let t2 = PRIM_PutChar(t1) in
                                                                  k t2 in
                                                                t1 g245 k in
                                                              t7 t1 k in
                                                      g20 t1 k in
                                                    g20 t1 k
                                                  | Some0(t1) ->
                                                    let k = [t1], fun [f1] arg ->
                                                      let t1 = PRIM_CharOrd(g246) in
                                                      let t2 = [t1], fun [f1] me arg k ->
                                                        let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                          let t1 = PRIM_EqInt(arg,g247) in
                                                          match t1 with
                                                          | true1 -> k f2
                                                          | false0 ->
                                                            let t2 = PRIM_ModInt(arg,g248) in
                                                            let t3 = PRIM_AddInt(f1,t2) in
                                                            let t4 = PRIM_CharChr(t3) in
                                                            let t5 = [t4], fun [f1] arg k ->
                                                              let t1 = Cons1[f1,arg] in
                                                              k t1 in
                                                            let k = [f3,arg], fun [f1,f2] arg ->
                                                              let k = [f2], fun [f1] arg ->
                                                                let t1 = PRIM_DivInt(f1,g249) in
                                                                arg t1 k in
                                                              f1 arg k in
                                                            t5 f2 k in
                                                        k t1 in
                                                      let t3 = PRIM_EqInt(f1,g250) in
                                                      let k = [arg], fun [f1] arg ->
                                                        let k = [f1], fun [f1] arg ->
                                                          let t1 = PRIM_Explode(g255) in
                                                          let k = [f1], fun [f1] arg ->
                                                            let t1 = PRIM_CharOrd(g256) in
                                                            let t2 = [t1], fun [f1] me arg k ->
                                                              let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                                let t1 = PRIM_EqInt(arg,g257) in
                                                                match t1 with
                                                                | true1 -> k f2
                                                                | false0 ->
                                                                  let t2 = PRIM_ModInt(arg,g258) in
                                                                  let t3 = PRIM_AddInt(f1,t2) in
                                                                  let t4 = PRIM_CharChr(t3) in
                                                                  let t5 = [t4], fun [f1] arg k ->
                                                                    let t1 = Cons1[f1,arg] in
                                                                    k t1 in
                                                                  let k = [f3,arg], fun [f1,f2] arg ->
                                                                    let k = [f2], fun [f1] arg ->
                                                                      let t1 = PRIM_DivInt(f1,g259) in
                                                                      arg t1 k in
                                                                    f1 arg k in
                                                                  t5 f2 k in
                                                              k t1 in
                                                            let t3 = PRIM_EqInt(f1,g260) in
                                                            let k = [], fun [] arg ->
                                                              let k = [], fun [] arg ->
                                                                let t1 = PRIM_CharOrd(g265) in
                                                                let t2 = PRIM_EqInt(t1,g266) in
                                                                match t2 with
                                                                | true1 ->
                                                                  let t3 = PRIM_PutChar(g265) in
                                                                  k t3
                                                                | false0 ->
                                                                  let t3 = PRIM_EqChar(g265,g267) in
                                                                  match t3 with
                                                                  | true1 ->
                                                                    let t4 = PRIM_PutChar(g265) in
                                                                    k t4
                                                                  | false0 ->
                                                                    let t4 = PRIM_LessInt(g268,t1) in
                                                                    match t4 with
                                                                    | true1 ->
                                                                      let t5 = PRIM_PutChar(g265) in
                                                                      k t5
                                                                    | false0 ->
                                                                      let t5 = PRIM_PutChar(g269) in
                                                                      let t6 = PRIM_CharOrd(g270) in
                                                                      let t7 = [t6], fun [f1] arg k ->
                                                                        let t1 = PRIM_AddInt(f1,arg) in
                                                                        k t1 in
                                                                      let k = [], fun [] arg ->
                                                                        let t1 = [arg], fun [f1] arg k ->
                                                                          let t1 = PRIM_SubInt(f1,arg) in
                                                                          k t1 in
                                                                        let k = [], fun [] arg ->
                                                                          let t1 = PRIM_CharChr(arg) in
                                                                          let t2 = PRIM_PutChar(t1) in
                                                                          k t2 in
                                                                        t1 g271 k in
                                                                      t7 t1 k in
                                                              g20 arg k in
                                                            match t3 with
                                                            | true1 -> g262 g263 k
                                                            | false0 ->
                                                              let k = [f1], fun [f1] arg -> arg f1 k in
                                                              t2 g264 k in
                                                          g20 t1 k in
                                                        g20 arg k in
                                                      match t3 with
                                                      | true1 -> g252 g253 k
                                                      | false0 ->
                                                        let k = [f1], fun [f1] arg -> arg f1 k in
                                                        t2 g254 k in
                                                    g30 t1 k in
                                                arg f1 k in
                                              g235 g236 k in
                                        g20 t1 k
                                      | false0 ->
                                        let t1 = PRIM_Explode(g272) in
                                        let k = [f1,f2,f3,f4,t1], fun [f1,f2,f3,f4,f5] arg ->
                                          let k = [f1,f2,f4,f5], fun [f1,f2,f3,f4] arg ->
                                            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                              match arg with
                                              | true1 ->
                                                match f3 with
                                                | Cons1(t1,t2) ->
                                                  let t3 = PRIM_Explode(g275) in
                                                  let k = [], fun [] arg ->
                                                    let t1 = PRIM_Explode(g274) in
                                                    let k = [], fun [] arg ->
                                                      let t1 = PRIM_CharOrd(g276) in
                                                      let t2 = PRIM_EqInt(t1,g277) in
                                                      match t2 with
                                                      | true1 ->
                                                        let t3 = PRIM_PutChar(g276) in
                                                        k t3
                                                      | false0 ->
                                                        let t3 = PRIM_EqChar(g276,g278) in
                                                        match t3 with
                                                        | true1 ->
                                                          let t4 = PRIM_PutChar(g276) in
                                                          k t4
                                                        | false0 ->
                                                          let t4 = PRIM_LessInt(g279,t1) in
                                                          match t4 with
                                                          | true1 ->
                                                            let t5 = PRIM_PutChar(g276) in
                                                            k t5
                                                          | false0 ->
                                                            let t5 = PRIM_PutChar(g280) in
                                                            let t6 = PRIM_CharOrd(g281) in
                                                            let t7 = [t6], fun [f1] arg k ->
                                                              let t1 = PRIM_AddInt(f1,arg) in
                                                              k t1 in
                                                            let k = [], fun [] arg ->
                                                              let t1 = [arg], fun [f1] arg k ->
                                                                let t1 = PRIM_SubInt(f1,arg) in
                                                                k t1 in
                                                              let k = [], fun [] arg ->
                                                                let t1 = PRIM_CharChr(arg) in
                                                                let t2 = PRIM_PutChar(t1) in
                                                                k t2 in
                                                              t1 g282 k in
                                                            t7 t1 k in
                                                    g20 t1 k in
                                                  g20 t3 k
                                                | Nil0 ->
                                                  let t1 = PRIM_Explode(g283) in
                                                  let k = [f1], fun [f1] arg ->
                                                    let t1 = [f1], fun [f1] me arg k ->
                                                      let t1 = PRIM_CharChr(g284) in
                                                      let t2 = [t1], fun [f1] me arg k ->
                                                        let t1 = PRIM_GetChar(g285) in
                                                        let t2 = PRIM_CharOrd(t1) in
                                                        let t3 = PRIM_EqChar(t1,g286) in
                                                        match t3 with
                                                        | true1 ->
                                                          let t4 = PRIM_CharOrd(g287) in
                                                          let t5 = PRIM_EqInt(t4,g288) in
                                                          let k = [arg], fun [f1] arg ->
                                                            let k = [f1], fun [f1] arg -> arg f1 k in
                                                            g294 g295 k in
                                                          match t5 with
                                                          | true1 ->
                                                            let t6 = PRIM_PutChar(g287) in
                                                            k t6
                                                          | false0 ->
                                                            let t6 = PRIM_EqChar(g287,g289) in
                                                            match t6 with
                                                            | true1 ->
                                                              let t7 = PRIM_PutChar(g287) in
                                                              k t7
                                                            | false0 ->
                                                              let t7 = PRIM_LessInt(g290,t4) in
                                                              match t7 with
                                                              | true1 ->
                                                                let t8 = PRIM_PutChar(g287) in
                                                                k t8
                                                              | false0 ->
                                                                let t8 = PRIM_PutChar(g291) in
                                                                let t9 = PRIM_CharOrd(g292) in
                                                                let t10 = [t9], fun [f1] arg k ->
                                                                  let t1 = PRIM_AddInt(f1,arg) in
                                                                  k t1 in
                                                                let k = [], fun [] arg ->
                                                                  let t1 = [arg], fun [f1] arg k ->
                                                                    let t1 = PRIM_SubInt(f1,arg) in
                                                                    k t1 in
                                                                  let k = [], fun [] arg ->
                                                                    let t1 = PRIM_CharChr(arg) in
                                                                    let t2 = PRIM_PutChar(t1) in
                                                                    k t2 in
                                                                  t1 g293 k in
                                                                t10 t4 k
                                                        | false0 ->
                                                          let t4 = PRIM_EqChar(t1,f1) in
                                                          match t4 with
                                                          | true1 ->
                                                            let t5 = PRIM_CharOrd(t1) in
                                                            let t6 = PRIM_EqInt(t5,g296) in
                                                            let k = [f1,arg], fun [f1,f2] arg ->
                                                              let t1 = PRIM_CharOrd(g302) in
                                                              let t2 = PRIM_EqInt(t1,g303) in
                                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                                let t1 = Cons1[f1,f2] in
                                                                let k = [t1], fun [f1] arg -> arg f1 k in
                                                                g309 g310 k in
                                                              match t2 with
                                                              | true1 ->
                                                                let t3 = PRIM_PutChar(g302) in
                                                                k t3
                                                              | false0 ->
                                                                let t3 = PRIM_EqChar(g302,g304) in
                                                                match t3 with
                                                                | true1 ->
                                                                  let t4 = PRIM_PutChar(g302) in
                                                                  k t4
                                                                | false0 ->
                                                                  let t4 = PRIM_LessInt(g305,t1) in
                                                                  match t4 with
                                                                  | true1 ->
                                                                    let t5 = PRIM_PutChar(g302) in
                                                                    k t5
                                                                  | false0 ->
                                                                    let t5 = PRIM_PutChar(g306) in
                                                                    let t6 = PRIM_CharOrd(g307) in
                                                                    let t7 = [t6], fun [f1] arg k ->
                                                                      let t1 = PRIM_AddInt(f1,arg) in
                                                                      k t1 in
                                                                    let k = [], fun [] arg ->
                                                                      let t1 = [arg], fun [f1] arg k ->
                                                                        let t1 = PRIM_SubInt(f1,arg) in
                                                                        k t1 in
                                                                      let k = [], fun [] arg ->
                                                                        let t1 = PRIM_CharChr(arg) in
                                                                        let t2 = PRIM_PutChar(t1) in
                                                                        k t2 in
                                                                      t1 g308 k in
                                                                    t7 t1 k in
                                                            match t6 with
                                                            | true1 ->
                                                              let t7 = PRIM_PutChar(t1) in
                                                              k t7
                                                            | false0 ->
                                                              let t7 = PRIM_EqChar(t1,g297) in
                                                              match t7 with
                                                              | true1 ->
                                                                let t8 = PRIM_PutChar(t1) in
                                                                k t8
                                                              | false0 ->
                                                                let t8 = PRIM_LessInt(g298,t5) in
                                                                match t8 with
                                                                | true1 ->
                                                                  let t9 = PRIM_PutChar(t1) in
                                                                  k t9
                                                                | false0 ->
                                                                  let t9 = PRIM_PutChar(g299) in
                                                                  let t10 = PRIM_CharOrd(g300) in
                                                                  let t11 = [t10], fun [f1] arg k ->
                                                                    let t1 = PRIM_AddInt(f1,arg) in
                                                                    k t1 in
                                                                  let k = [], fun [] arg ->
                                                                    let t1 = [arg], fun [f1] arg k ->
                                                                      let t1 = PRIM_SubInt(f1,arg) in
                                                                      k t1 in
                                                                    let k = [], fun [] arg ->
                                                                      let t1 = PRIM_CharChr(arg) in
                                                                      let t2 = PRIM_PutChar(t1) in
                                                                      k t2 in
                                                                    t1 g301 k in
                                                                  t11 t5 k
                                                          | false0 ->
                                                            let t5 = PRIM_LessInt(g311,t2) in
                                                            match t5 with
                                                            | true1 -> me arg k
                                                            | false0 ->
                                                              let t6 = PRIM_EqInt(t2,g312) in
                                                              match t6 with
                                                              | true1 ->
                                                                match arg with
                                                                | Nil0 -> me arg k
                                                                | Cons1(t7,t8) ->
                                                                  let t9 = PRIM_CharOrd(t7) in
                                                                  let t10 = [t9], fun [f1] arg k ->
                                                                    let t1 = PRIM_LessInt(arg,f1) in
                                                                    match t1 with
                                                                    | true1 -> k g313
                                                                    | false0 -> k g314 in
                                                                  let k = [me,t8], fun [f1,f2] arg ->
                                                                    let k = [f1,f2], fun [f1,f2] arg ->
                                                                      let t1 = PRIM_CharChr(g337) in
                                                                      let t2 = PRIM_CharOrd(t1) in
                                                                      let t3 = PRIM_EqInt(t2,g338) in
                                                                      let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                                        let t1 = PRIM_CharOrd(g344) in
                                                                        let t2 = PRIM_EqInt(t1,g345) in
                                                                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                          let t1 = PRIM_CharOrd(f3) in
                                                                          let t2 = PRIM_EqInt(t1,g351) in
                                                                          let k = [f1,f2], fun [f1,f2] arg -> f1 f2 k in
                                                                          match t2 with
                                                                          | true1 ->
                                                                            let t3 = PRIM_PutChar(f3) in
                                                                            k t3
                                                                          | false0 ->
                                                                            let t3 = PRIM_EqChar(f3,g352) in
                                                                            match t3 with
                                                                            | true1 ->
                                                                              let t4 = PRIM_PutChar(f3) in
                                                                              k t4
                                                                            | false0 ->
                                                                              let t4 = PRIM_LessInt(g353,t1) in
                                                                              match t4 with
                                                                              | true1 ->
                                                                                let t5 = PRIM_PutChar(f3) in
                                                                                k t5
                                                                              | false0 ->
                                                                                let t5 = PRIM_PutChar(g354) in
                                                                                let t6 = PRIM_CharOrd(g355) in
                                                                                let t7 = [t6], fun [f1] arg k ->
                                                                                  let t1 = PRIM_AddInt(f1,arg) in
                                                                                  k t1 in
                                                                                let k = [], fun [] arg ->
                                                                                  let t1 = [arg], fun [f1] arg k ->
                                                                                    let t1 = PRIM_SubInt(f1,arg) in
                                                                                    k t1 in
                                                                                  let k = [], fun [] arg ->
                                                                                    let t1 = PRIM_CharChr(arg) in
                                                                                    let t2 = PRIM_PutChar(t1) in
                                                                                    k t2 in
                                                                                  t1 g356 k in
                                                                                t7 t1 k in
                                                                        match t2 with
                                                                        | true1 ->
                                                                          let t3 = PRIM_PutChar(g344) in
                                                                          k t3
                                                                        | false0 ->
                                                                          let t3 = PRIM_EqChar(g344,g346) in
                                                                          match t3 with
                                                                          | true1 ->
                                                                            let t4 = PRIM_PutChar(g344) in
                                                                            k t4
                                                                          | false0 ->
                                                                            let t4 = PRIM_LessInt(g347,t1) in
                                                                            match t4 with
                                                                            | true1 ->
                                                                              let t5 = PRIM_PutChar(g344) in
                                                                              k t5
                                                                            | false0 ->
                                                                              let t5 = PRIM_PutChar(g348) in
                                                                              let t6 = PRIM_CharOrd(g349) in
                                                                              let t7 = [t6], fun [f1] arg k ->
                                                                                let t1 = PRIM_AddInt(f1,arg) in
                                                                                k t1 in
                                                                              let k = [], fun [] arg ->
                                                                                let t1 = [arg], fun [f1] arg k ->
                                                                                  let t1 = PRIM_SubInt(f1,arg) in
                                                                                  k t1 in
                                                                                let k = [], fun [] arg ->
                                                                                  let t1 = PRIM_CharChr(arg) in
                                                                                  let t2 = PRIM_PutChar(t1) in
                                                                                  k t2 in
                                                                                t1 g350 k in
                                                                              t7 t1 k in
                                                                      match t3 with
                                                                      | true1 ->
                                                                        let t4 = PRIM_PutChar(t1) in
                                                                        k t4
                                                                      | false0 ->
                                                                        let t4 = PRIM_EqChar(t1,g339) in
                                                                        match t4 with
                                                                        | true1 ->
                                                                          let t5 = PRIM_PutChar(t1) in
                                                                          k t5
                                                                        | false0 ->
                                                                          let t5 = PRIM_LessInt(g340,t2) in
                                                                          match t5 with
                                                                          | true1 ->
                                                                            let t6 = PRIM_PutChar(t1) in
                                                                            k t6
                                                                          | false0 ->
                                                                            let t6 = PRIM_PutChar(g341) in
                                                                            let t7 = PRIM_CharOrd(g342) in
                                                                            let t8 = [t7], fun [f1] arg k ->
                                                                              let t1 = PRIM_AddInt(f1,arg) in
                                                                              k t1 in
                                                                            let k = [], fun [] arg ->
                                                                              let t1 = [arg], fun [f1] arg k ->
                                                                                let t1 = PRIM_SubInt(f1,arg) in
                                                                                k t1 in
                                                                              let k = [], fun [] arg ->
                                                                                let t1 = PRIM_CharChr(arg) in
                                                                                let t2 = PRIM_PutChar(t1) in
                                                                                k t2 in
                                                                              t1 g343 k in
                                                                            t8 t2 k in
                                                                    match arg with
                                                                    | true1 ->
                                                                      let t1 = PRIM_CharChr(g316) in
                                                                      let t2 = PRIM_CharOrd(t1) in
                                                                      let t3 = PRIM_EqInt(t2,g317) in
                                                                      let k = [t1], fun [f1] arg ->
                                                                        let t1 = PRIM_CharOrd(g323) in
                                                                        let t2 = PRIM_EqInt(t1,g324) in
                                                                        let k = [f1], fun [f1] arg ->
                                                                          let t1 = PRIM_CharOrd(f1) in
                                                                          let t2 = PRIM_EqInt(t1,g330) in
                                                                          match t2 with
                                                                          | true1 ->
                                                                            let t3 = PRIM_PutChar(f1) in
                                                                            k t3
                                                                          | false0 ->
                                                                            let t3 = PRIM_EqChar(f1,g331) in
                                                                            match t3 with
                                                                            | true1 ->
                                                                              let t4 = PRIM_PutChar(f1) in
                                                                              k t4
                                                                            | false0 ->
                                                                              let t4 = PRIM_LessInt(g332,t1) in
                                                                              match t4 with
                                                                              | true1 ->
                                                                                let t5 = PRIM_PutChar(f1) in
                                                                                k t5
                                                                              | false0 ->
                                                                                let t5 = PRIM_PutChar(g333) in
                                                                                let t6 = PRIM_CharOrd(g334) in
                                                                                let t7 = [t6], fun [f1] arg k ->
                                                                                  let t1 = PRIM_AddInt(f1,arg) in
                                                                                  k t1 in
                                                                                let k = [], fun [] arg ->
                                                                                  let t1 = [arg], fun [f1] arg k ->
                                                                                    let t1 = PRIM_SubInt(f1,arg) in
                                                                                    k t1 in
                                                                                  let k = [], fun [] arg ->
                                                                                    let t1 = PRIM_CharChr(arg) in
                                                                                    let t2 = PRIM_PutChar(t1) in
                                                                                    k t2 in
                                                                                  t1 g335 k in
                                                                                t7 t1 k in
                                                                        match t2 with
                                                                        | true1 ->
                                                                          let t3 = PRIM_PutChar(g323) in
                                                                          k t3
                                                                        | false0 ->
                                                                          let t3 = PRIM_EqChar(g323,g325) in
                                                                          match t3 with
                                                                          | true1 ->
                                                                            let t4 = PRIM_PutChar(g323) in
                                                                            k t4
                                                                          | false0 ->
                                                                            let t4 = PRIM_LessInt(g326,t1) in
                                                                            match t4 with
                                                                            | true1 ->
                                                                              let t5 = PRIM_PutChar(g323) in
                                                                              k t5
                                                                            | false0 ->
                                                                              let t5 = PRIM_PutChar(g327) in
                                                                              let t6 = PRIM_CharOrd(g328) in
                                                                              let t7 = [t6], fun [f1] arg k ->
                                                                                let t1 = PRIM_AddInt(f1,arg) in
                                                                                k t1 in
                                                                              let k = [], fun [] arg ->
                                                                                let t1 = [arg], fun [f1] arg k ->
                                                                                  let t1 = PRIM_SubInt(f1,arg) in
                                                                                  k t1 in
                                                                                let k = [], fun [] arg ->
                                                                                  let t1 = PRIM_CharChr(arg) in
                                                                                  let t2 = PRIM_PutChar(t1) in
                                                                                  k t2 in
                                                                                t1 g329 k in
                                                                              t7 t1 k in
                                                                      match t3 with
                                                                      | true1 ->
                                                                        let t4 = PRIM_PutChar(t1) in
                                                                        k t4
                                                                      | false0 ->
                                                                        let t4 = PRIM_EqChar(t1,g318) in
                                                                        match t4 with
                                                                        | true1 ->
                                                                          let t5 = PRIM_PutChar(t1) in
                                                                          k t5
                                                                        | false0 ->
                                                                          let t5 = PRIM_LessInt(g319,t2) in
                                                                          match t5 with
                                                                          | true1 ->
                                                                            let t6 = PRIM_PutChar(t1) in
                                                                            k t6
                                                                          | false0 ->
                                                                            let t6 = PRIM_PutChar(g320) in
                                                                            let t7 = PRIM_CharOrd(g321) in
                                                                            let t8 = [t7], fun [f1] arg k ->
                                                                              let t1 = PRIM_AddInt(f1,arg) in
                                                                              k t1 in
                                                                            let k = [], fun [] arg ->
                                                                              let t1 = [arg], fun [f1] arg k ->
                                                                                let t1 = PRIM_SubInt(f1,arg) in
                                                                                k t1 in
                                                                              let k = [], fun [] arg ->
                                                                                let t1 = PRIM_CharChr(arg) in
                                                                                let t2 = PRIM_PutChar(t1) in
                                                                                k t2 in
                                                                              t1 g322 k in
                                                                            t8 t2 k
                                                                    | false0 -> k g336 in
                                                                  t10 g315 k
                                                              | false0 ->
                                                                let t7 = PRIM_CharOrd(t1) in
                                                                let t8 = PRIM_EqInt(t7,g357) in
                                                                let k = [arg,me,t1], fun [f1,f2,f3] arg ->
                                                                  let t1 = Cons1[f3,f1] in
                                                                  f2 t1 k in
                                                                match t8 with
                                                                | true1 ->
                                                                  let t9 = PRIM_PutChar(t1) in
                                                                  k t9
                                                                | false0 ->
                                                                  let t9 = PRIM_EqChar(t1,g358) in
                                                                  match t9 with
                                                                  | true1 ->
                                                                    let t10 = PRIM_PutChar(t1) in
                                                                    k t10
                                                                  | false0 ->
                                                                    let t10 = PRIM_LessInt(g359,t7) in
                                                                    match t10 with
                                                                    | true1 ->
                                                                      let t11 = PRIM_PutChar(t1) in
                                                                      k t11
                                                                    | false0 ->
                                                                      let t11 = PRIM_PutChar(g360) in
                                                                      let t12 = PRIM_CharOrd(g361) in
                                                                      let t13 = [t12], fun [f1] arg k ->
                                                                        let t1 = PRIM_AddInt(f1,arg) in
                                                                        k t1 in
                                                                      let k = [], fun [] arg ->
                                                                        let t1 = [arg], fun [f1] arg k ->
                                                                          let t1 = PRIM_SubInt(f1,arg) in
                                                                          k t1 in
                                                                        let k = [], fun [] arg ->
                                                                          let t1 = PRIM_CharChr(arg) in
                                                                          let t2 = PRIM_PutChar(t1) in
                                                                          k t2 in
                                                                        t1 g362 k in
                                                                      t13 t7 k in
                                                      let k = [f1,me], fun [f1,f2] arg ->
                                                        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                            let k = [f2,f3], fun [f1,f2] arg ->
                                                              match arg with
                                                              | true1 -> k g365
                                                              | false0 ->
                                                                let k = [f1,f2], fun [f1,f2] arg ->
                                                                  let k = [f1], fun [f1] arg ->
                                                                    let k = [f1], fun [f1] arg ->
                                                                      let t1 = PRIM_CharOrd(g368) in
                                                                      let t2 = PRIM_EqInt(t1,g369) in
                                                                      let k = [f1], fun [f1] arg -> f1 g375 k in
                                                                      match t2 with
                                                                      | true1 ->
                                                                        let t3 = PRIM_PutChar(g368) in
                                                                        k t3
                                                                      | false0 ->
                                                                        let t3 = PRIM_EqChar(g368,g370) in
                                                                        match t3 with
                                                                        | true1 ->
                                                                          let t4 = PRIM_PutChar(g368) in
                                                                          k t4
                                                                        | false0 ->
                                                                          let t4 = PRIM_LessInt(g371,t1) in
                                                                          match t4 with
                                                                          | true1 ->
                                                                            let t5 = PRIM_PutChar(g368) in
                                                                            k t5
                                                                          | false0 ->
                                                                            let t5 = PRIM_PutChar(g372) in
                                                                            let t6 = PRIM_CharOrd(g373) in
                                                                            let t7 = [t6], fun [f1] arg k ->
                                                                              let t1 = PRIM_AddInt(f1,arg) in
                                                                              k t1 in
                                                                            let k = [], fun [] arg ->
                                                                              let t1 = [arg], fun [f1] arg k ->
                                                                                let t1 = PRIM_SubInt(f1,arg) in
                                                                                k t1 in
                                                                              let k = [], fun [] arg ->
                                                                                let t1 = PRIM_CharChr(arg) in
                                                                                let t2 = PRIM_PutChar(t1) in
                                                                                k t2 in
                                                                              t1 g374 k in
                                                                            t7 t1 k in
                                                                    g20 arg k in
                                                                  arg f2 k in
                                                                g366 g367 k in
                                                            arg f1 k in
                                                          arg f3 k in
                                                        g5 g364 k in
                                                      t2 g363 k in
                                                    t1 g376 k in
                                                  g20 t1 k
                                              | false0 ->
                                                let k = [f2], fun [f1] arg ->
                                                  let k = [f1,arg], fun [f1,f2] arg ->
                                                    let t1 = PRIM_Explode(g380) in
                                                    let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                      let k = [arg,f3], fun [f1,f2] arg ->
                                                        let k = [f2], fun [f1] arg ->
                                                          let k = [f1], fun [f1] arg ->
                                                            let t1 = PRIM_Explode(g381) in
                                                            let k = [f1], fun [f1] arg ->
                                                              let t1 = PRIM_CharOrd(g382) in
                                                              let t2 = [t1], fun [f1] me arg k ->
                                                                let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                                  let t1 = PRIM_EqInt(arg,g383) in
                                                                  match t1 with
                                                                  | true1 -> k f2
                                                                  | false0 ->
                                                                    let t2 = PRIM_ModInt(arg,g384) in
                                                                    let t3 = PRIM_AddInt(f1,t2) in
                                                                    let t4 = PRIM_CharChr(t3) in
                                                                    let t5 = [t4], fun [f1] arg k ->
                                                                      let t1 = Cons1[f1,arg] in
                                                                      k t1 in
                                                                    let k = [f3,arg], fun [f1,f2] arg ->
                                                                      let k = [f2], fun [f1] arg ->
                                                                        let t1 = PRIM_DivInt(f1,g385) in
                                                                        arg t1 k in
                                                                      f1 arg k in
                                                                    t5 f2 k in
                                                                k t1 in
                                                              let t3 = PRIM_EqInt(f1,g386) in
                                                              let k = [], fun [] arg ->
                                                                let k = [], fun [] arg ->
                                                                  let t1 = PRIM_Explode(g391) in
                                                                  let k = [], fun [] arg ->
                                                                    let t1 = PRIM_CharOrd(g392) in
                                                                    let t2 = PRIM_EqInt(t1,g393) in
                                                                    match t2 with
                                                                    | true1 ->
                                                                      let t3 = PRIM_PutChar(g392) in
                                                                      k t3
                                                                    | false0 ->
                                                                      let t3 = PRIM_EqChar(g392,g394) in
                                                                      match t3 with
                                                                      | true1 ->
                                                                        let t4 = PRIM_PutChar(g392) in
                                                                        k t4
                                                                      | false0 ->
                                                                        let t4 = PRIM_LessInt(g395,t1) in
                                                                        match t4 with
                                                                        | true1 ->
                                                                          let t5 = PRIM_PutChar(g392) in
                                                                          k t5
                                                                        | false0 ->
                                                                          let t5 = PRIM_PutChar(g396) in
                                                                          let t6 = PRIM_CharOrd(g397) in
                                                                          let t7 = [t6], fun [f1] arg k ->
                                                                            let t1 = PRIM_AddInt(f1,arg) in
                                                                            k t1 in
                                                                          let k = [], fun [] arg ->
                                                                            let t1 = [arg], fun [f1] arg k ->
                                                                              let t1 = PRIM_SubInt(f1,arg) in
                                                                              k t1 in
                                                                            let k = [], fun [] arg ->
                                                                              let t1 = PRIM_CharChr(arg) in
                                                                              let t2 = PRIM_PutChar(t1) in
                                                                              k t2 in
                                                                            t1 g398 k in
                                                                          t7 t1 k in
                                                                  g20 t1 k in
                                                                g20 arg k in
                                                              match t3 with
                                                              | true1 -> g388 g389 k
                                                              | false0 ->
                                                                let k = [f1], fun [f1] arg -> arg f1 k in
                                                                t2 g390 k in
                                                            g20 t1 k in
                                                          g20 arg k in
                                                        f1 arg k in
                                                      f2 f1 k in
                                                    g6 t1 k in
                                                  g12 f1 k in
                                                g8 g379 k in
                                            arg f4 k in
                                          arg f3 k in
                                        g5 g273 k in
                                    arg f5 k in
                                  arg f3 k in
                                g5 g203 k in
                            arg f5 k in
                          arg f3 k in
                        g5 g133 k in
                    arg f3 k in
                  arg g130 k in
                g128 g129 k in
            arg f1 k in
          arg f3 k in
        g5 g118 k in
      t2 g117 k in
    g20 g37 k in
  let t2 = PRIM_Explode(g400) in
  let k = [t1], fun [f1] arg -> f1 g401 k in
  g20 t2 k in
t2 g32 k
