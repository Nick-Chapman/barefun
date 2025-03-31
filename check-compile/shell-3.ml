(*stage3*)
let k () = ()
let g2 = true1 in
let g3 = false0 in
let g4 = false0 in
let g5 = false0 in
let g1 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    let t1 = [f1,f2,arg], fun [f1,f2,f3] arg k ->
      match f3 with
      | Nil0 ->
        match arg with
        | Nil0 -> k g2
        | Cons1(t1,t2) -> k g3
      | Cons1(t1,t2) ->
        match arg with
        | Nil0 -> k g4
        | Cons1(t3,t4) ->
          let k = [f1,f2,t2,t3,t4], fun [f1,f2,f3,f4,f5] arg ->
            let k = [f1,f2,f3,f5], fun [f1,f2,f3,f4] arg ->
              match arg with
              | true1 ->
                let k = [f3,f4], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  arg f1 k in
                f2 f1 k
              | false0 -> k g5 in
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
let g8 = Nil0 in
let g7 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k g8
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
let g10 = 0 in
let g11 = 1 in
let g12 = fun arg k ->
  let t1 = PRIM_AddInt(g11,arg) in
  k t1 in
let g9 = fun me arg k ->
  match arg with
  | Nil0 -> k g10
  | Cons1(t1,t2) ->
    let k = [], fun [] arg -> g12 arg k in
    me t2 k in
let g14 = Unit0 in
let g15 = 8 in
let g16 = '\n' in
let g17 = 26 in
let g18 = '^' in
let g19 = 'A' in
let g20 = 1 in
let g13 = fun me arg k ->
  match arg with
  | Nil0 -> k g14
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,g15) in
    let k = [me,t2], fun [f1,f2] arg -> f1 f2 k in
    match t4 with
    | true1 ->
      let t5 = PRIM_PutChar(t1) in
      k t5
    | false0 ->
      let t5 = PRIM_EqChar(t1,g16) in
      match t5 with
      | true1 ->
        let t6 = PRIM_PutChar(t1) in
        k t6
      | false0 ->
        let t6 = PRIM_LessInt(g17,t3) in
        match t6 with
        | true1 ->
          let t7 = PRIM_PutChar(t1) in
          k t7
        | false0 ->
          let t7 = PRIM_PutChar(g18) in
          let t8 = PRIM_CharOrd(g19) in
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
            t1 g20 k in
          t9 t3 k in
let g22 = 2 in
let g23 = 1 in
let g24 = 2 in
let g21 = fun me arg k ->
  let t1 = PRIM_LessInt(arg,g22) in
  match t1 with
  | true1 -> k arg
  | false0 ->
    let t2 = PRIM_SubInt(arg,g23) in
    let k = [arg,me], fun [f1,f2] arg ->
      let t1 = [arg], fun [f1] arg k ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      let t2 = PRIM_SubInt(f1,g24) in
      let k = [t1], fun [f1] arg -> f1 arg k in
      f2 t2 k in
    me t2 k in
let g26 = 2 in
let g27 = false0 in
let g28 = true1 in
let g29 = 1 in
let g30 = 1 in
let g25 = fun me arg k ->
  let t1 = PRIM_LessInt(arg,g26) in
  let k = [arg,me], fun [f1,f2] arg ->
    match arg with
    | true1 ->
      let t1 = PRIM_SubInt(f1,g29) in
      let k = [f1], fun [f1] arg ->
        let t1 = [arg], fun [f1] arg k ->
          let t1 = PRIM_MulInt(f1,arg) in
          k t1 in
        t1 f1 k in
      f2 t1 k
    | false0 -> k g30 in
  match t1 with
  | true1 -> k g27
  | false0 -> k g28 in
let g31 = 4 in
let g32 = Nil0 in
let g33 = '>' in
let g34 = ' ' in
let g35 = Nil0 in
let g36 = Cons1[g34,g35] in
let g37 = Cons1[g33,g36] in
let g39 = 4 in
let g40 = Unit0 in
let g41 = '\n' in
let g43 = '\n' in
let g44 = 8 in
let g45 = '\n' in
let g46 = 26 in
let g47 = '^' in
let g48 = 'A' in
let g49 = 1 in
let g50 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g51 = Nil0 in
let g52 = 8 in
let g53 = '\n' in
let g54 = 26 in
let g55 = '^' in
let g56 = 'A' in
let g57 = 1 in
let g59 = '\n' in
let g60 = 8 in
let g61 = '\n' in
let g62 = 26 in
let g63 = '^' in
let g64 = 'A' in
let g65 = 1 in
let g66 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g67 = Nil0 in
let g68 = 127 in
let g69 = 127 in
let g70 = false0 in
let g71 = true1 in
let g72 = 26 in
let g74 = 8 in
let g75 = 8 in
let g76 = '\n' in
let g77 = 26 in
let g78 = '^' in
let g79 = 'A' in
let g80 = 1 in
let g81 = ' ' in
let g82 = 8 in
let g83 = '\n' in
let g84 = 26 in
let g85 = '^' in
let g86 = 'A' in
let g87 = 1 in
let g88 = 8 in
let g89 = '\n' in
let g90 = 26 in
let g91 = '^' in
let g92 = 'A' in
let g93 = 1 in
let g94 = Unit0 in
let g96 = 8 in
let g97 = 8 in
let g98 = '\n' in
let g99 = 26 in
let g100 = '^' in
let g101 = 'A' in
let g102 = 1 in
let g103 = ' ' in
let g104 = 8 in
let g105 = '\n' in
let g106 = 26 in
let g107 = '^' in
let g108 = 'A' in
let g109 = 1 in
let g110 = 8 in
let g111 = '\n' in
let g112 = 26 in
let g113 = '^' in
let g114 = 'A' in
let g115 = 1 in
let g116 = 8 in
let g117 = '\n' in
let g118 = 26 in
let g119 = '^' in
let g120 = 'A' in
let g121 = 1 in
let g122 = Nil0 in
let g123 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g124 = Unit0 in
let g126 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g127 = Nil0 in
let g128 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g129 = Nil0 in
let g130 = ' ' in
let g131 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g132 = Nil0 in
let g133 = Nil0 in
let g125 = fun me arg k ->
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
              g128 g129 k in
            t1 f1 k in
          arg f2 k in
        g126 g127 k
      | Cons1(t1,t2) ->
        let t3 = PRIM_EqChar(t1,g130) in
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
                  arg g133 k in
                f1 arg k in
              t1 f1 k in
            arg f3 k in
          g131 g132 k
        | false0 ->
          let k = [f3,t1,t2], fun [f1,f2,f3] arg ->
            let t1 = Cons1[f2,f1] in
            let k = [f3], fun [f1] arg -> arg f1 k in
            arg t1 k in
          f2 f1 k in
    k t1 in
  k t1 in
let g134 = Nil0 in
let g135 = Nil0 in
let g136 = Unit0 in
let g137 = "fib" in
let g138 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g139 = "fib: " in
let g140 = "expected an argument" in
let g141 = "ERROR: " in
let g143 = '\n' in
let g144 = 8 in
let g145 = '\n' in
let g146 = 26 in
let g147 = '^' in
let g148 = 'A' in
let g149 = 1 in
let g150 = "expected exactly one argument" in
let g151 = "ERROR: " in
let g153 = '\n' in
let g154 = 8 in
let g155 = '\n' in
let g156 = 26 in
let g157 = '^' in
let g158 = 'A' in
let g159 = 1 in
let g161 = '0' in
let g162 = 0 in
let g163 = false0 in
let g164 = true1 in
let g165 = 9 in
let g166 = false0 in
let g167 = true1 in
let g168 = None1 in
let g169 = None1 in
let g170 = None1 in
let g171 = 10 in
let g172 = fun arg k ->
  let t1 = PRIM_MulInt(g171,arg) in
  k t1 in
let g160 = fun me arg k ->
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
      let t5 = PRIM_CharOrd(g161) in
      let k = [f1,f2,t2], fun [f1,f2,f3] arg ->
        let t1 = PRIM_LessInt(arg,g162) in
        let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
            match arg with
            | None1 -> k g170
            | Some0(t1) ->
              let k = [f2,f3,t1], fun [f1,f2,f3] arg ->
                let t1 = [arg], fun [f1] arg k ->
                  let t1 = PRIM_AddInt(f1,arg) in
                  k t1 in
                let k = [f1,f2], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  f1 arg k in
                t1 f3 k in
              g172 f1 k in
          match arg with
          | true1 ->
            let t1 = PRIM_LessInt(g165,f4) in
            let k = [f4], fun [f1] arg ->
              match arg with
              | true1 ->
                let t1 = Some0[f1] in
                k t1
              | false0 -> k g168 in
            match t1 with
            | true1 -> k g166
            | false0 -> k g167
          | false0 -> k g169 in
        match t1 with
        | true1 -> k g163
        | false0 -> k g164 in
      t4 t5 k in
  k t1 in
let g173 = 0 in
let g174 = "expected arg1 to be numeric" in
let g175 = "ERROR: " in
let g177 = '\n' in
let g178 = 8 in
let g179 = '\n' in
let g180 = 26 in
let g181 = '^' in
let g182 = 'A' in
let g183 = 1 in
let g184 = '0' in
let g185 = 0 in
let g186 = 10 in
let g187 = 10 in
let g188 = 0 in
let g189 = '0' in
let g190 = fun arg k ->
  let t1 = Cons1[g189,arg] in
  k t1 in
let g191 = Nil0 in
let g192 = Nil0 in
let g193 = " --> " in
let g194 = '0' in
let g195 = 0 in
let g196 = 10 in
let g197 = 10 in
let g198 = 0 in
let g199 = '0' in
let g200 = fun arg k ->
  let t1 = Cons1[g199,arg] in
  k t1 in
let g201 = Nil0 in
let g202 = Nil0 in
let g204 = '\n' in
let g205 = 8 in
let g206 = '\n' in
let g207 = 26 in
let g208 = '^' in
let g209 = 'A' in
let g210 = 1 in
let g211 = "fact" in
let g212 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g213 = "fact: " in
let g214 = "expected an argument" in
let g215 = "ERROR: " in
let g217 = '\n' in
let g218 = 8 in
let g219 = '\n' in
let g220 = 26 in
let g221 = '^' in
let g222 = 'A' in
let g223 = 1 in
let g224 = "expected exactly one argument" in
let g225 = "ERROR: " in
let g227 = '\n' in
let g228 = 8 in
let g229 = '\n' in
let g230 = 26 in
let g231 = '^' in
let g232 = 'A' in
let g233 = 1 in
let g235 = '0' in
let g236 = 0 in
let g237 = false0 in
let g238 = true1 in
let g239 = 9 in
let g240 = false0 in
let g241 = true1 in
let g242 = None1 in
let g243 = None1 in
let g244 = None1 in
let g245 = 10 in
let g246 = fun arg k ->
  let t1 = PRIM_MulInt(g245,arg) in
  k t1 in
let g234 = fun me arg k ->
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
      let t5 = PRIM_CharOrd(g235) in
      let k = [f1,f2,t2], fun [f1,f2,f3] arg ->
        let t1 = PRIM_LessInt(arg,g236) in
        let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
            match arg with
            | None1 -> k g244
            | Some0(t1) ->
              let k = [f2,f3,t1], fun [f1,f2,f3] arg ->
                let t1 = [arg], fun [f1] arg k ->
                  let t1 = PRIM_AddInt(f1,arg) in
                  k t1 in
                let k = [f1,f2], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  f1 arg k in
                t1 f3 k in
              g246 f1 k in
          match arg with
          | true1 ->
            let t1 = PRIM_LessInt(g239,f4) in
            let k = [f4], fun [f1] arg ->
              match arg with
              | true1 ->
                let t1 = Some0[f1] in
                k t1
              | false0 -> k g242 in
            match t1 with
            | true1 -> k g240
            | false0 -> k g241
          | false0 -> k g243 in
        match t1 with
        | true1 -> k g237
        | false0 -> k g238 in
      t4 t5 k in
  k t1 in
let g247 = 0 in
let g248 = "expected arg1 to be numeric" in
let g249 = "ERROR: " in
let g251 = '\n' in
let g252 = 8 in
let g253 = '\n' in
let g254 = 26 in
let g255 = '^' in
let g256 = 'A' in
let g257 = 1 in
let g258 = '0' in
let g259 = 0 in
let g260 = 10 in
let g261 = 10 in
let g262 = 0 in
let g263 = '0' in
let g264 = fun arg k ->
  let t1 = Cons1[g263,arg] in
  k t1 in
let g265 = Nil0 in
let g266 = Nil0 in
let g267 = " --> " in
let g268 = '0' in
let g269 = 0 in
let g270 = 10 in
let g271 = 10 in
let g272 = 0 in
let g273 = '0' in
let g274 = fun arg k ->
  let t1 = Cons1[g273,arg] in
  k t1 in
let g275 = Nil0 in
let g276 = Nil0 in
let g278 = '\n' in
let g279 = 8 in
let g280 = '\n' in
let g281 = 26 in
let g282 = '^' in
let g283 = 'A' in
let g284 = 1 in
let g285 = "rev" in
let g286 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g287 = "rev: expected no arguments" in
let g288 = "ERROR: " in
let g290 = '\n' in
let g291 = 8 in
let g292 = '\n' in
let g293 = 26 in
let g294 = '^' in
let g295 = 'A' in
let g296 = 1 in
let g297 = "(reverse typed lines until ^D)\n" in
let g300 = 4 in
let g301 = Unit0 in
let g302 = '\n' in
let g304 = '\n' in
let g305 = 8 in
let g306 = '\n' in
let g307 = 26 in
let g308 = '^' in
let g309 = 'A' in
let g310 = 1 in
let g311 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g312 = Nil0 in
let g313 = 8 in
let g314 = '\n' in
let g315 = 26 in
let g316 = '^' in
let g317 = 'A' in
let g318 = 1 in
let g320 = '\n' in
let g321 = 8 in
let g322 = '\n' in
let g323 = 26 in
let g324 = '^' in
let g325 = 'A' in
let g326 = 1 in
let g327 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g328 = Nil0 in
let g329 = 127 in
let g330 = 127 in
let g331 = false0 in
let g332 = true1 in
let g333 = 26 in
let g335 = 8 in
let g336 = 8 in
let g337 = '\n' in
let g338 = 26 in
let g339 = '^' in
let g340 = 'A' in
let g341 = 1 in
let g342 = ' ' in
let g343 = 8 in
let g344 = '\n' in
let g345 = 26 in
let g346 = '^' in
let g347 = 'A' in
let g348 = 1 in
let g349 = 8 in
let g350 = '\n' in
let g351 = 26 in
let g352 = '^' in
let g353 = 'A' in
let g354 = 1 in
let g355 = Unit0 in
let g357 = 8 in
let g358 = 8 in
let g359 = '\n' in
let g360 = 26 in
let g361 = '^' in
let g362 = 'A' in
let g363 = 1 in
let g364 = ' ' in
let g365 = 8 in
let g366 = '\n' in
let g367 = 26 in
let g368 = '^' in
let g369 = 'A' in
let g370 = 1 in
let g371 = 8 in
let g372 = '\n' in
let g373 = 26 in
let g374 = '^' in
let g375 = 'A' in
let g376 = 1 in
let g377 = 8 in
let g378 = '\n' in
let g379 = 26 in
let g380 = '^' in
let g381 = 'A' in
let g382 = 1 in
let g383 = Nil0 in
let g384 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g385 = Unit0 in
let g386 = fun me arg k ->
  let t1 = [arg,me], fun [f1,f2] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      f2 t3 k in
  k t1 in
let g387 = Nil0 in
let g389 = '\n' in
let g390 = 8 in
let g391 = '\n' in
let g392 = 26 in
let g393 = '^' in
let g394 = 'A' in
let g395 = 1 in
let g396 = Unit0 in
let g397 = Unit0 in
let g398 = 'o' in
let g399 = '*' in
let g400 = fun arg k ->
  let t1 = PRIM_EqChar(arg,g398) in
  match t1 with
  | true1 -> k g399
  | false0 -> k arg in
let g401 = "You wrote: \"" in
let g402 = "\" (" in
let g403 = '0' in
let g404 = 0 in
let g405 = 10 in
let g406 = 10 in
let g407 = 0 in
let g408 = '0' in
let g409 = fun arg k ->
  let t1 = Cons1[g408,arg] in
  k t1 in
let g410 = Nil0 in
let g411 = Nil0 in
let g412 = " chars)" in
let g414 = '\n' in
let g415 = 8 in
let g416 = '\n' in
let g417 = 26 in
let g418 = '^' in
let g419 = 'A' in
let g420 = 1 in
let g421 = Unit0 in
let g423 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g424 = Unit0 in
let t1 = PRIM_CharChr(g31) in
let t2 = [t1], fun [f1] arg k ->
  let t1 = Cons1[f1,arg] in
  k t1 in
let k = [], fun [] arg ->
  let t1 = [arg], fun [f1] me arg k ->
    let k = [f1,me], fun [f1,f2] arg ->
      let t1 = PRIM_CharChr(g39) in
      let t2 = [t1], fun [f1] me arg k ->
        let t1 = PRIM_GetChar(g40) in
        let t2 = PRIM_CharOrd(t1) in
        let t3 = PRIM_EqChar(t1,g41) in
        match t3 with
        | true1 ->
          let t4 = PRIM_CharOrd(g43) in
          let t5 = PRIM_EqInt(t4,g44) in
          let k = [arg], fun [f1] arg ->
            let k = [f1], fun [f1] arg -> arg f1 k in
            g50 g51 k in
          match t5 with
          | true1 ->
            let t6 = PRIM_PutChar(g43) in
            k t6
          | false0 ->
            let t6 = PRIM_EqChar(g43,g45) in
            match t6 with
            | true1 ->
              let t7 = PRIM_PutChar(g43) in
              k t7
            | false0 ->
              let t7 = PRIM_LessInt(g46,t4) in
              match t7 with
              | true1 ->
                let t8 = PRIM_PutChar(g43) in
                k t8
              | false0 ->
                let t8 = PRIM_PutChar(g47) in
                let t9 = PRIM_CharOrd(g48) in
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
                  t1 g49 k in
                t10 t4 k
        | false0 ->
          let t4 = PRIM_EqChar(t1,f1) in
          match t4 with
          | true1 ->
            let t5 = PRIM_CharOrd(t1) in
            let t6 = PRIM_EqInt(t5,g52) in
            let k = [f1,arg], fun [f1,f2] arg ->
              let t1 = PRIM_CharOrd(g59) in
              let t2 = PRIM_EqInt(t1,g60) in
              let k = [f1,f2], fun [f1,f2] arg ->
                let t1 = Cons1[f1,f2] in
                let k = [t1], fun [f1] arg -> arg f1 k in
                g66 g67 k in
              match t2 with
              | true1 ->
                let t3 = PRIM_PutChar(g59) in
                k t3
              | false0 ->
                let t3 = PRIM_EqChar(g59,g61) in
                match t3 with
                | true1 ->
                  let t4 = PRIM_PutChar(g59) in
                  k t4
                | false0 ->
                  let t4 = PRIM_LessInt(g62,t1) in
                  match t4 with
                  | true1 ->
                    let t5 = PRIM_PutChar(g59) in
                    k t5
                  | false0 ->
                    let t5 = PRIM_PutChar(g63) in
                    let t6 = PRIM_CharOrd(g64) in
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
                      t1 g65 k in
                    t7 t1 k in
            match t6 with
            | true1 ->
              let t7 = PRIM_PutChar(t1) in
              k t7
            | false0 ->
              let t7 = PRIM_EqChar(t1,g53) in
              match t7 with
              | true1 ->
                let t8 = PRIM_PutChar(t1) in
                k t8
              | false0 ->
                let t8 = PRIM_LessInt(g54,t5) in
                match t8 with
                | true1 ->
                  let t9 = PRIM_PutChar(t1) in
                  k t9
                | false0 ->
                  let t9 = PRIM_PutChar(g55) in
                  let t10 = PRIM_CharOrd(g56) in
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
                    t1 g57 k in
                  t11 t5 k
          | false0 ->
            let t5 = PRIM_LessInt(g68,t2) in
            match t5 with
            | true1 -> me arg k
            | false0 ->
              let t6 = PRIM_EqInt(t2,g69) in
              match t6 with
              | true1 ->
                match arg with
                | Nil0 -> me arg k
                | Cons1(t7,t8) ->
                  let t9 = PRIM_CharOrd(t7) in
                  let t10 = [t9], fun [f1] arg k ->
                    let t1 = PRIM_LessInt(arg,f1) in
                    match t1 with
                    | true1 -> k g70
                    | false0 -> k g71 in
                  let k = [me,t8], fun [f1,f2] arg ->
                    let k = [f1,f2], fun [f1,f2] arg ->
                      let t1 = PRIM_CharChr(g96) in
                      let t2 = PRIM_CharOrd(t1) in
                      let t3 = PRIM_EqInt(t2,g97) in
                      let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                        let t1 = PRIM_CharOrd(g103) in
                        let t2 = PRIM_EqInt(t1,g104) in
                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                          let t1 = PRIM_CharOrd(f3) in
                          let t2 = PRIM_EqInt(t1,g110) in
                          let k = [f1,f2], fun [f1,f2] arg -> f1 f2 k in
                          match t2 with
                          | true1 ->
                            let t3 = PRIM_PutChar(f3) in
                            k t3
                          | false0 ->
                            let t3 = PRIM_EqChar(f3,g111) in
                            match t3 with
                            | true1 ->
                              let t4 = PRIM_PutChar(f3) in
                              k t4
                            | false0 ->
                              let t4 = PRIM_LessInt(g112,t1) in
                              match t4 with
                              | true1 ->
                                let t5 = PRIM_PutChar(f3) in
                                k t5
                              | false0 ->
                                let t5 = PRIM_PutChar(g113) in
                                let t6 = PRIM_CharOrd(g114) in
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
                                  t1 g115 k in
                                t7 t1 k in
                        match t2 with
                        | true1 ->
                          let t3 = PRIM_PutChar(g103) in
                          k t3
                        | false0 ->
                          let t3 = PRIM_EqChar(g103,g105) in
                          match t3 with
                          | true1 ->
                            let t4 = PRIM_PutChar(g103) in
                            k t4
                          | false0 ->
                            let t4 = PRIM_LessInt(g106,t1) in
                            match t4 with
                            | true1 ->
                              let t5 = PRIM_PutChar(g103) in
                              k t5
                            | false0 ->
                              let t5 = PRIM_PutChar(g107) in
                              let t6 = PRIM_CharOrd(g108) in
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
                                t1 g109 k in
                              t7 t1 k in
                      match t3 with
                      | true1 ->
                        let t4 = PRIM_PutChar(t1) in
                        k t4
                      | false0 ->
                        let t4 = PRIM_EqChar(t1,g98) in
                        match t4 with
                        | true1 ->
                          let t5 = PRIM_PutChar(t1) in
                          k t5
                        | false0 ->
                          let t5 = PRIM_LessInt(g99,t2) in
                          match t5 with
                          | true1 ->
                            let t6 = PRIM_PutChar(t1) in
                            k t6
                          | false0 ->
                            let t6 = PRIM_PutChar(g100) in
                            let t7 = PRIM_CharOrd(g101) in
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
                              t1 g102 k in
                            t8 t2 k in
                    match arg with
                    | true1 ->
                      let t1 = PRIM_CharChr(g74) in
                      let t2 = PRIM_CharOrd(t1) in
                      let t3 = PRIM_EqInt(t2,g75) in
                      let k = [t1], fun [f1] arg ->
                        let t1 = PRIM_CharOrd(g81) in
                        let t2 = PRIM_EqInt(t1,g82) in
                        let k = [f1], fun [f1] arg ->
                          let t1 = PRIM_CharOrd(f1) in
                          let t2 = PRIM_EqInt(t1,g88) in
                          match t2 with
                          | true1 ->
                            let t3 = PRIM_PutChar(f1) in
                            k t3
                          | false0 ->
                            let t3 = PRIM_EqChar(f1,g89) in
                            match t3 with
                            | true1 ->
                              let t4 = PRIM_PutChar(f1) in
                              k t4
                            | false0 ->
                              let t4 = PRIM_LessInt(g90,t1) in
                              match t4 with
                              | true1 ->
                                let t5 = PRIM_PutChar(f1) in
                                k t5
                              | false0 ->
                                let t5 = PRIM_PutChar(g91) in
                                let t6 = PRIM_CharOrd(g92) in
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
                                  t1 g93 k in
                                t7 t1 k in
                        match t2 with
                        | true1 ->
                          let t3 = PRIM_PutChar(g81) in
                          k t3
                        | false0 ->
                          let t3 = PRIM_EqChar(g81,g83) in
                          match t3 with
                          | true1 ->
                            let t4 = PRIM_PutChar(g81) in
                            k t4
                          | false0 ->
                            let t4 = PRIM_LessInt(g84,t1) in
                            match t4 with
                            | true1 ->
                              let t5 = PRIM_PutChar(g81) in
                              k t5
                            | false0 ->
                              let t5 = PRIM_PutChar(g85) in
                              let t6 = PRIM_CharOrd(g86) in
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
                                t1 g87 k in
                              t7 t1 k in
                      match t3 with
                      | true1 ->
                        let t4 = PRIM_PutChar(t1) in
                        k t4
                      | false0 ->
                        let t4 = PRIM_EqChar(t1,g76) in
                        match t4 with
                        | true1 ->
                          let t5 = PRIM_PutChar(t1) in
                          k t5
                        | false0 ->
                          let t5 = PRIM_LessInt(g77,t2) in
                          match t5 with
                          | true1 ->
                            let t6 = PRIM_PutChar(t1) in
                            k t6
                          | false0 ->
                            let t6 = PRIM_PutChar(g78) in
                            let t7 = PRIM_CharOrd(g79) in
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
                              t1 g80 k in
                            t8 t2 k
                    | false0 -> k g94 in
                  t10 g72 k
              | false0 ->
                let t7 = PRIM_CharOrd(t1) in
                let t8 = PRIM_EqInt(t7,g116) in
                let k = [arg,me,t1], fun [f1,f2,f3] arg ->
                  let t1 = Cons1[f3,f1] in
                  f2 t1 k in
                match t8 with
                | true1 ->
                  let t9 = PRIM_PutChar(t1) in
                  k t9
                | false0 ->
                  let t9 = PRIM_EqChar(t1,g117) in
                  match t9 with
                  | true1 ->
                    let t10 = PRIM_PutChar(t1) in
                    k t10
                  | false0 ->
                    let t10 = PRIM_LessInt(g118,t7) in
                    match t10 with
                    | true1 ->
                      let t11 = PRIM_PutChar(t1) in
                      k t11
                    | false0 ->
                      let t11 = PRIM_PutChar(g119) in
                      let t12 = PRIM_CharOrd(g120) in
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
                        t1 g121 k in
                      t13 t7 k in
      let k = [f1,f2], fun [f1,f2] arg ->
        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
              match arg with
              | true1 -> k g124
              | false0 ->
                let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                  let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                      let k = [f2], fun [f1] arg -> f1 g421 k in
                      match arg with
                      | Nil0 -> k g136
                      | Cons1(t1,t2) ->
                        let t3 = PRIM_Explode(g137) in
                        let k = [f1,f3,t1,t2,t3], fun [f1,f2,f3,f4,f5] arg ->
                          let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                            let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                              match arg with
                              | true1 ->
                                let t1 = PRIM_Explode(g139) in
                                let k = [f4], fun [f1] arg ->
                                  match f1 with
                                  | Nil0 ->
                                    let t1 = PRIM_Explode(g141) in
                                    let k = [], fun [] arg ->
                                      let t1 = PRIM_Explode(g140) in
                                      let k = [], fun [] arg ->
                                        let t1 = PRIM_CharOrd(g143) in
                                        let t2 = PRIM_EqInt(t1,g144) in
                                        match t2 with
                                        | true1 ->
                                          let t3 = PRIM_PutChar(g143) in
                                          k t3
                                        | false0 ->
                                          let t3 = PRIM_EqChar(g143,g145) in
                                          match t3 with
                                          | true1 ->
                                            let t4 = PRIM_PutChar(g143) in
                                            k t4
                                          | false0 ->
                                            let t4 = PRIM_LessInt(g146,t1) in
                                            match t4 with
                                            | true1 ->
                                              let t5 = PRIM_PutChar(g143) in
                                              k t5
                                            | false0 ->
                                              let t5 = PRIM_PutChar(g147) in
                                              let t6 = PRIM_CharOrd(g148) in
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
                                                t1 g149 k in
                                              t7 t1 k in
                                      g13 t1 k in
                                    g13 t1 k
                                  | Cons1(t1,t2) ->
                                    match t2 with
                                    | Cons1(t3,t4) ->
                                      let t5 = PRIM_Explode(g151) in
                                      let k = [], fun [] arg ->
                                        let t1 = PRIM_Explode(g150) in
                                        let k = [], fun [] arg ->
                                          let t1 = PRIM_CharOrd(g153) in
                                          let t2 = PRIM_EqInt(t1,g154) in
                                          match t2 with
                                          | true1 ->
                                            let t3 = PRIM_PutChar(g153) in
                                            k t3
                                          | false0 ->
                                            let t3 = PRIM_EqChar(g153,g155) in
                                            match t3 with
                                            | true1 ->
                                              let t4 = PRIM_PutChar(g153) in
                                              k t4
                                            | false0 ->
                                              let t4 = PRIM_LessInt(g156,t1) in
                                              match t4 with
                                              | true1 ->
                                                let t5 = PRIM_PutChar(g153) in
                                                k t5
                                              | false0 ->
                                                let t5 = PRIM_PutChar(g157) in
                                                let t6 = PRIM_CharOrd(g158) in
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
                                                  t1 g159 k in
                                                t7 t1 k in
                                        g13 t1 k in
                                      g13 t5 k
                                    | Nil0 ->
                                      let k = [t1], fun [f1] arg ->
                                        let k = [], fun [] arg ->
                                          match arg with
                                          | None1 ->
                                            let t1 = PRIM_Explode(g175) in
                                            let k = [], fun [] arg ->
                                              let t1 = PRIM_Explode(g174) in
                                              let k = [], fun [] arg ->
                                                let t1 = PRIM_CharOrd(g177) in
                                                let t2 = PRIM_EqInt(t1,g178) in
                                                match t2 with
                                                | true1 ->
                                                  let t3 = PRIM_PutChar(g177) in
                                                  k t3
                                                | false0 ->
                                                  let t3 = PRIM_EqChar(g177,g179) in
                                                  match t3 with
                                                  | true1 ->
                                                    let t4 = PRIM_PutChar(g177) in
                                                    k t4
                                                  | false0 ->
                                                    let t4 = PRIM_LessInt(g180,t1) in
                                                    match t4 with
                                                    | true1 ->
                                                      let t5 = PRIM_PutChar(g177) in
                                                      k t5
                                                    | false0 ->
                                                      let t5 = PRIM_PutChar(g181) in
                                                      let t6 = PRIM_CharOrd(g182) in
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
                                                        t1 g183 k in
                                                      t7 t1 k in
                                              g13 t1 k in
                                            g13 t1 k
                                          | Some0(t1) ->
                                            let k = [t1], fun [f1] arg ->
                                              let t1 = PRIM_CharOrd(g184) in
                                              let t2 = [t1], fun [f1] me arg k ->
                                                let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                  let t1 = PRIM_EqInt(arg,g185) in
                                                  match t1 with
                                                  | true1 -> k f2
                                                  | false0 ->
                                                    let t2 = PRIM_ModInt(arg,g186) in
                                                    let t3 = PRIM_AddInt(f1,t2) in
                                                    let t4 = PRIM_CharChr(t3) in
                                                    let t5 = [t4], fun [f1] arg k ->
                                                      let t1 = Cons1[f1,arg] in
                                                      k t1 in
                                                    let k = [f3,arg], fun [f1,f2] arg ->
                                                      let k = [f2], fun [f1] arg ->
                                                        let t1 = PRIM_DivInt(f1,g187) in
                                                        arg t1 k in
                                                      f1 arg k in
                                                    t5 f2 k in
                                                k t1 in
                                              let t3 = PRIM_EqInt(f1,g188) in
                                              let k = [arg], fun [f1] arg ->
                                                let k = [f1], fun [f1] arg ->
                                                  let t1 = PRIM_Explode(g193) in
                                                  let k = [f1], fun [f1] arg ->
                                                    let t1 = PRIM_CharOrd(g194) in
                                                    let t2 = [t1], fun [f1] me arg k ->
                                                      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                        let t1 = PRIM_EqInt(arg,g195) in
                                                        match t1 with
                                                        | true1 -> k f2
                                                        | false0 ->
                                                          let t2 = PRIM_ModInt(arg,g196) in
                                                          let t3 = PRIM_AddInt(f1,t2) in
                                                          let t4 = PRIM_CharChr(t3) in
                                                          let t5 = [t4], fun [f1] arg k ->
                                                            let t1 = Cons1[f1,arg] in
                                                            k t1 in
                                                          let k = [f3,arg], fun [f1,f2] arg ->
                                                            let k = [f2], fun [f1] arg ->
                                                              let t1 = PRIM_DivInt(f1,g197) in
                                                              arg t1 k in
                                                            f1 arg k in
                                                          t5 f2 k in
                                                      k t1 in
                                                    let t3 = PRIM_EqInt(f1,g198) in
                                                    let k = [], fun [] arg ->
                                                      let k = [], fun [] arg ->
                                                        let t1 = PRIM_CharOrd(g204) in
                                                        let t2 = PRIM_EqInt(t1,g205) in
                                                        match t2 with
                                                        | true1 ->
                                                          let t3 = PRIM_PutChar(g204) in
                                                          k t3
                                                        | false0 ->
                                                          let t3 = PRIM_EqChar(g204,g206) in
                                                          match t3 with
                                                          | true1 ->
                                                            let t4 = PRIM_PutChar(g204) in
                                                            k t4
                                                          | false0 ->
                                                            let t4 = PRIM_LessInt(g207,t1) in
                                                            match t4 with
                                                            | true1 ->
                                                              let t5 = PRIM_PutChar(g204) in
                                                              k t5
                                                            | false0 ->
                                                              let t5 = PRIM_PutChar(g208) in
                                                              let t6 = PRIM_CharOrd(g209) in
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
                                                                t1 g210 k in
                                                              t7 t1 k in
                                                      g13 arg k in
                                                    match t3 with
                                                    | true1 -> g200 g201 k
                                                    | false0 ->
                                                      let k = [f1], fun [f1] arg -> arg f1 k in
                                                      t2 g202 k in
                                                  g13 t1 k in
                                                g13 arg k in
                                              match t3 with
                                              | true1 -> g190 g191 k
                                              | false0 ->
                                                let k = [f1], fun [f1] arg -> arg f1 k in
                                                t2 g192 k in
                                            g21 t1 k in
                                        arg f1 k in
                                      g160 g173 k in
                                g13 t1 k
                              | false0 ->
                                let t1 = PRIM_Explode(g211) in
                                let k = [f1,f2,f3,f4,t1], fun [f1,f2,f3,f4,f5] arg ->
                                  let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                    let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                      match arg with
                                      | true1 ->
                                        let t1 = PRIM_Explode(g213) in
                                        let k = [f4], fun [f1] arg ->
                                          match f1 with
                                          | Nil0 ->
                                            let t1 = PRIM_Explode(g215) in
                                            let k = [], fun [] arg ->
                                              let t1 = PRIM_Explode(g214) in
                                              let k = [], fun [] arg ->
                                                let t1 = PRIM_CharOrd(g217) in
                                                let t2 = PRIM_EqInt(t1,g218) in
                                                match t2 with
                                                | true1 ->
                                                  let t3 = PRIM_PutChar(g217) in
                                                  k t3
                                                | false0 ->
                                                  let t3 = PRIM_EqChar(g217,g219) in
                                                  match t3 with
                                                  | true1 ->
                                                    let t4 = PRIM_PutChar(g217) in
                                                    k t4
                                                  | false0 ->
                                                    let t4 = PRIM_LessInt(g220,t1) in
                                                    match t4 with
                                                    | true1 ->
                                                      let t5 = PRIM_PutChar(g217) in
                                                      k t5
                                                    | false0 ->
                                                      let t5 = PRIM_PutChar(g221) in
                                                      let t6 = PRIM_CharOrd(g222) in
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
                                                        t1 g223 k in
                                                      t7 t1 k in
                                              g13 t1 k in
                                            g13 t1 k
                                          | Cons1(t1,t2) ->
                                            match t2 with
                                            | Cons1(t3,t4) ->
                                              let t5 = PRIM_Explode(g225) in
                                              let k = [], fun [] arg ->
                                                let t1 = PRIM_Explode(g224) in
                                                let k = [], fun [] arg ->
                                                  let t1 = PRIM_CharOrd(g227) in
                                                  let t2 = PRIM_EqInt(t1,g228) in
                                                  match t2 with
                                                  | true1 ->
                                                    let t3 = PRIM_PutChar(g227) in
                                                    k t3
                                                  | false0 ->
                                                    let t3 = PRIM_EqChar(g227,g229) in
                                                    match t3 with
                                                    | true1 ->
                                                      let t4 = PRIM_PutChar(g227) in
                                                      k t4
                                                    | false0 ->
                                                      let t4 = PRIM_LessInt(g230,t1) in
                                                      match t4 with
                                                      | true1 ->
                                                        let t5 = PRIM_PutChar(g227) in
                                                        k t5
                                                      | false0 ->
                                                        let t5 = PRIM_PutChar(g231) in
                                                        let t6 = PRIM_CharOrd(g232) in
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
                                                          t1 g233 k in
                                                        t7 t1 k in
                                                g13 t1 k in
                                              g13 t5 k
                                            | Nil0 ->
                                              let k = [t1], fun [f1] arg ->
                                                let k = [], fun [] arg ->
                                                  match arg with
                                                  | None1 ->
                                                    let t1 = PRIM_Explode(g249) in
                                                    let k = [], fun [] arg ->
                                                      let t1 = PRIM_Explode(g248) in
                                                      let k = [], fun [] arg ->
                                                        let t1 = PRIM_CharOrd(g251) in
                                                        let t2 = PRIM_EqInt(t1,g252) in
                                                        match t2 with
                                                        | true1 ->
                                                          let t3 = PRIM_PutChar(g251) in
                                                          k t3
                                                        | false0 ->
                                                          let t3 = PRIM_EqChar(g251,g253) in
                                                          match t3 with
                                                          | true1 ->
                                                            let t4 = PRIM_PutChar(g251) in
                                                            k t4
                                                          | false0 ->
                                                            let t4 = PRIM_LessInt(g254,t1) in
                                                            match t4 with
                                                            | true1 ->
                                                              let t5 = PRIM_PutChar(g251) in
                                                              k t5
                                                            | false0 ->
                                                              let t5 = PRIM_PutChar(g255) in
                                                              let t6 = PRIM_CharOrd(g256) in
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
                                                                t1 g257 k in
                                                              t7 t1 k in
                                                      g13 t1 k in
                                                    g13 t1 k
                                                  | Some0(t1) ->
                                                    let k = [t1], fun [f1] arg ->
                                                      let t1 = PRIM_CharOrd(g258) in
                                                      let t2 = [t1], fun [f1] me arg k ->
                                                        let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                          let t1 = PRIM_EqInt(arg,g259) in
                                                          match t1 with
                                                          | true1 -> k f2
                                                          | false0 ->
                                                            let t2 = PRIM_ModInt(arg,g260) in
                                                            let t3 = PRIM_AddInt(f1,t2) in
                                                            let t4 = PRIM_CharChr(t3) in
                                                            let t5 = [t4], fun [f1] arg k ->
                                                              let t1 = Cons1[f1,arg] in
                                                              k t1 in
                                                            let k = [f3,arg], fun [f1,f2] arg ->
                                                              let k = [f2], fun [f1] arg ->
                                                                let t1 = PRIM_DivInt(f1,g261) in
                                                                arg t1 k in
                                                              f1 arg k in
                                                            t5 f2 k in
                                                        k t1 in
                                                      let t3 = PRIM_EqInt(f1,g262) in
                                                      let k = [arg], fun [f1] arg ->
                                                        let k = [f1], fun [f1] arg ->
                                                          let t1 = PRIM_Explode(g267) in
                                                          let k = [f1], fun [f1] arg ->
                                                            let t1 = PRIM_CharOrd(g268) in
                                                            let t2 = [t1], fun [f1] me arg k ->
                                                              let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                                let t1 = PRIM_EqInt(arg,g269) in
                                                                match t1 with
                                                                | true1 -> k f2
                                                                | false0 ->
                                                                  let t2 = PRIM_ModInt(arg,g270) in
                                                                  let t3 = PRIM_AddInt(f1,t2) in
                                                                  let t4 = PRIM_CharChr(t3) in
                                                                  let t5 = [t4], fun [f1] arg k ->
                                                                    let t1 = Cons1[f1,arg] in
                                                                    k t1 in
                                                                  let k = [f3,arg], fun [f1,f2] arg ->
                                                                    let k = [f2], fun [f1] arg ->
                                                                      let t1 = PRIM_DivInt(f1,g271) in
                                                                      arg t1 k in
                                                                    f1 arg k in
                                                                  t5 f2 k in
                                                              k t1 in
                                                            let t3 = PRIM_EqInt(f1,g272) in
                                                            let k = [], fun [] arg ->
                                                              let k = [], fun [] arg ->
                                                                let t1 = PRIM_CharOrd(g278) in
                                                                let t2 = PRIM_EqInt(t1,g279) in
                                                                match t2 with
                                                                | true1 ->
                                                                  let t3 = PRIM_PutChar(g278) in
                                                                  k t3
                                                                | false0 ->
                                                                  let t3 = PRIM_EqChar(g278,g280) in
                                                                  match t3 with
                                                                  | true1 ->
                                                                    let t4 = PRIM_PutChar(g278) in
                                                                    k t4
                                                                  | false0 ->
                                                                    let t4 = PRIM_LessInt(g281,t1) in
                                                                    match t4 with
                                                                    | true1 ->
                                                                      let t5 = PRIM_PutChar(g278) in
                                                                      k t5
                                                                    | false0 ->
                                                                      let t5 = PRIM_PutChar(g282) in
                                                                      let t6 = PRIM_CharOrd(g283) in
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
                                                                        t1 g284 k in
                                                                      t7 t1 k in
                                                              g13 arg k in
                                                            match t3 with
                                                            | true1 -> g274 g275 k
                                                            | false0 ->
                                                              let k = [f1], fun [f1] arg -> arg f1 k in
                                                              t2 g276 k in
                                                          g13 t1 k in
                                                        g13 arg k in
                                                      match t3 with
                                                      | true1 -> g264 g265 k
                                                      | false0 ->
                                                        let k = [f1], fun [f1] arg -> arg f1 k in
                                                        t2 g266 k in
                                                    g25 t1 k in
                                                arg f1 k in
                                              g234 g247 k in
                                        g13 t1 k
                                      | false0 ->
                                        let t1 = PRIM_Explode(g285) in
                                        let k = [f1,f2,f3,f4,t1], fun [f1,f2,f3,f4,f5] arg ->
                                          let k = [f1,f2,f4,f5], fun [f1,f2,f3,f4] arg ->
                                            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                              match arg with
                                              | true1 ->
                                                match f3 with
                                                | Cons1(t1,t2) ->
                                                  let t3 = PRIM_Explode(g288) in
                                                  let k = [], fun [] arg ->
                                                    let t1 = PRIM_Explode(g287) in
                                                    let k = [], fun [] arg ->
                                                      let t1 = PRIM_CharOrd(g290) in
                                                      let t2 = PRIM_EqInt(t1,g291) in
                                                      match t2 with
                                                      | true1 ->
                                                        let t3 = PRIM_PutChar(g290) in
                                                        k t3
                                                      | false0 ->
                                                        let t3 = PRIM_EqChar(g290,g292) in
                                                        match t3 with
                                                        | true1 ->
                                                          let t4 = PRIM_PutChar(g290) in
                                                          k t4
                                                        | false0 ->
                                                          let t4 = PRIM_LessInt(g293,t1) in
                                                          match t4 with
                                                          | true1 ->
                                                            let t5 = PRIM_PutChar(g290) in
                                                            k t5
                                                          | false0 ->
                                                            let t5 = PRIM_PutChar(g294) in
                                                            let t6 = PRIM_CharOrd(g295) in
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
                                                              t1 g296 k in
                                                            t7 t1 k in
                                                    g13 t1 k in
                                                  g13 t3 k
                                                | Nil0 ->
                                                  let t1 = PRIM_Explode(g297) in
                                                  let k = [f1], fun [f1] arg ->
                                                    let t1 = [f1], fun [f1] me arg k ->
                                                      let t1 = PRIM_CharChr(g300) in
                                                      let t2 = [t1], fun [f1] me arg k ->
                                                        let t1 = PRIM_GetChar(g301) in
                                                        let t2 = PRIM_CharOrd(t1) in
                                                        let t3 = PRIM_EqChar(t1,g302) in
                                                        match t3 with
                                                        | true1 ->
                                                          let t4 = PRIM_CharOrd(g304) in
                                                          let t5 = PRIM_EqInt(t4,g305) in
                                                          let k = [arg], fun [f1] arg ->
                                                            let k = [f1], fun [f1] arg -> arg f1 k in
                                                            g311 g312 k in
                                                          match t5 with
                                                          | true1 ->
                                                            let t6 = PRIM_PutChar(g304) in
                                                            k t6
                                                          | false0 ->
                                                            let t6 = PRIM_EqChar(g304,g306) in
                                                            match t6 with
                                                            | true1 ->
                                                              let t7 = PRIM_PutChar(g304) in
                                                              k t7
                                                            | false0 ->
                                                              let t7 = PRIM_LessInt(g307,t4) in
                                                              match t7 with
                                                              | true1 ->
                                                                let t8 = PRIM_PutChar(g304) in
                                                                k t8
                                                              | false0 ->
                                                                let t8 = PRIM_PutChar(g308) in
                                                                let t9 = PRIM_CharOrd(g309) in
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
                                                                  t1 g310 k in
                                                                t10 t4 k
                                                        | false0 ->
                                                          let t4 = PRIM_EqChar(t1,f1) in
                                                          match t4 with
                                                          | true1 ->
                                                            let t5 = PRIM_CharOrd(t1) in
                                                            let t6 = PRIM_EqInt(t5,g313) in
                                                            let k = [f1,arg], fun [f1,f2] arg ->
                                                              let t1 = PRIM_CharOrd(g320) in
                                                              let t2 = PRIM_EqInt(t1,g321) in
                                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                                let t1 = Cons1[f1,f2] in
                                                                let k = [t1], fun [f1] arg -> arg f1 k in
                                                                g327 g328 k in
                                                              match t2 with
                                                              | true1 ->
                                                                let t3 = PRIM_PutChar(g320) in
                                                                k t3
                                                              | false0 ->
                                                                let t3 = PRIM_EqChar(g320,g322) in
                                                                match t3 with
                                                                | true1 ->
                                                                  let t4 = PRIM_PutChar(g320) in
                                                                  k t4
                                                                | false0 ->
                                                                  let t4 = PRIM_LessInt(g323,t1) in
                                                                  match t4 with
                                                                  | true1 ->
                                                                    let t5 = PRIM_PutChar(g320) in
                                                                    k t5
                                                                  | false0 ->
                                                                    let t5 = PRIM_PutChar(g324) in
                                                                    let t6 = PRIM_CharOrd(g325) in
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
                                                                      t1 g326 k in
                                                                    t7 t1 k in
                                                            match t6 with
                                                            | true1 ->
                                                              let t7 = PRIM_PutChar(t1) in
                                                              k t7
                                                            | false0 ->
                                                              let t7 = PRIM_EqChar(t1,g314) in
                                                              match t7 with
                                                              | true1 ->
                                                                let t8 = PRIM_PutChar(t1) in
                                                                k t8
                                                              | false0 ->
                                                                let t8 = PRIM_LessInt(g315,t5) in
                                                                match t8 with
                                                                | true1 ->
                                                                  let t9 = PRIM_PutChar(t1) in
                                                                  k t9
                                                                | false0 ->
                                                                  let t9 = PRIM_PutChar(g316) in
                                                                  let t10 = PRIM_CharOrd(g317) in
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
                                                                    t1 g318 k in
                                                                  t11 t5 k
                                                          | false0 ->
                                                            let t5 = PRIM_LessInt(g329,t2) in
                                                            match t5 with
                                                            | true1 -> me arg k
                                                            | false0 ->
                                                              let t6 = PRIM_EqInt(t2,g330) in
                                                              match t6 with
                                                              | true1 ->
                                                                match arg with
                                                                | Nil0 -> me arg k
                                                                | Cons1(t7,t8) ->
                                                                  let t9 = PRIM_CharOrd(t7) in
                                                                  let t10 = [t9], fun [f1] arg k ->
                                                                    let t1 = PRIM_LessInt(arg,f1) in
                                                                    match t1 with
                                                                    | true1 -> k g331
                                                                    | false0 -> k g332 in
                                                                  let k = [me,t8], fun [f1,f2] arg ->
                                                                    let k = [f1,f2], fun [f1,f2] arg ->
                                                                      let t1 = PRIM_CharChr(g357) in
                                                                      let t2 = PRIM_CharOrd(t1) in
                                                                      let t3 = PRIM_EqInt(t2,g358) in
                                                                      let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                                        let t1 = PRIM_CharOrd(g364) in
                                                                        let t2 = PRIM_EqInt(t1,g365) in
                                                                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                          let t1 = PRIM_CharOrd(f3) in
                                                                          let t2 = PRIM_EqInt(t1,g371) in
                                                                          let k = [f1,f2], fun [f1,f2] arg -> f1 f2 k in
                                                                          match t2 with
                                                                          | true1 ->
                                                                            let t3 = PRIM_PutChar(f3) in
                                                                            k t3
                                                                          | false0 ->
                                                                            let t3 = PRIM_EqChar(f3,g372) in
                                                                            match t3 with
                                                                            | true1 ->
                                                                              let t4 = PRIM_PutChar(f3) in
                                                                              k t4
                                                                            | false0 ->
                                                                              let t4 = PRIM_LessInt(g373,t1) in
                                                                              match t4 with
                                                                              | true1 ->
                                                                                let t5 = PRIM_PutChar(f3) in
                                                                                k t5
                                                                              | false0 ->
                                                                                let t5 = PRIM_PutChar(g374) in
                                                                                let t6 = PRIM_CharOrd(g375) in
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
                                                                                  t1 g376 k in
                                                                                t7 t1 k in
                                                                        match t2 with
                                                                        | true1 ->
                                                                          let t3 = PRIM_PutChar(g364) in
                                                                          k t3
                                                                        | false0 ->
                                                                          let t3 = PRIM_EqChar(g364,g366) in
                                                                          match t3 with
                                                                          | true1 ->
                                                                            let t4 = PRIM_PutChar(g364) in
                                                                            k t4
                                                                          | false0 ->
                                                                            let t4 = PRIM_LessInt(g367,t1) in
                                                                            match t4 with
                                                                            | true1 ->
                                                                              let t5 = PRIM_PutChar(g364) in
                                                                              k t5
                                                                            | false0 ->
                                                                              let t5 = PRIM_PutChar(g368) in
                                                                              let t6 = PRIM_CharOrd(g369) in
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
                                                                                t1 g370 k in
                                                                              t7 t1 k in
                                                                      match t3 with
                                                                      | true1 ->
                                                                        let t4 = PRIM_PutChar(t1) in
                                                                        k t4
                                                                      | false0 ->
                                                                        let t4 = PRIM_EqChar(t1,g359) in
                                                                        match t4 with
                                                                        | true1 ->
                                                                          let t5 = PRIM_PutChar(t1) in
                                                                          k t5
                                                                        | false0 ->
                                                                          let t5 = PRIM_LessInt(g360,t2) in
                                                                          match t5 with
                                                                          | true1 ->
                                                                            let t6 = PRIM_PutChar(t1) in
                                                                            k t6
                                                                          | false0 ->
                                                                            let t6 = PRIM_PutChar(g361) in
                                                                            let t7 = PRIM_CharOrd(g362) in
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
                                                                              t1 g363 k in
                                                                            t8 t2 k in
                                                                    match arg with
                                                                    | true1 ->
                                                                      let t1 = PRIM_CharChr(g335) in
                                                                      let t2 = PRIM_CharOrd(t1) in
                                                                      let t3 = PRIM_EqInt(t2,g336) in
                                                                      let k = [t1], fun [f1] arg ->
                                                                        let t1 = PRIM_CharOrd(g342) in
                                                                        let t2 = PRIM_EqInt(t1,g343) in
                                                                        let k = [f1], fun [f1] arg ->
                                                                          let t1 = PRIM_CharOrd(f1) in
                                                                          let t2 = PRIM_EqInt(t1,g349) in
                                                                          match t2 with
                                                                          | true1 ->
                                                                            let t3 = PRIM_PutChar(f1) in
                                                                            k t3
                                                                          | false0 ->
                                                                            let t3 = PRIM_EqChar(f1,g350) in
                                                                            match t3 with
                                                                            | true1 ->
                                                                              let t4 = PRIM_PutChar(f1) in
                                                                              k t4
                                                                            | false0 ->
                                                                              let t4 = PRIM_LessInt(g351,t1) in
                                                                              match t4 with
                                                                              | true1 ->
                                                                                let t5 = PRIM_PutChar(f1) in
                                                                                k t5
                                                                              | false0 ->
                                                                                let t5 = PRIM_PutChar(g352) in
                                                                                let t6 = PRIM_CharOrd(g353) in
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
                                                                                  t1 g354 k in
                                                                                t7 t1 k in
                                                                        match t2 with
                                                                        | true1 ->
                                                                          let t3 = PRIM_PutChar(g342) in
                                                                          k t3
                                                                        | false0 ->
                                                                          let t3 = PRIM_EqChar(g342,g344) in
                                                                          match t3 with
                                                                          | true1 ->
                                                                            let t4 = PRIM_PutChar(g342) in
                                                                            k t4
                                                                          | false0 ->
                                                                            let t4 = PRIM_LessInt(g345,t1) in
                                                                            match t4 with
                                                                            | true1 ->
                                                                              let t5 = PRIM_PutChar(g342) in
                                                                              k t5
                                                                            | false0 ->
                                                                              let t5 = PRIM_PutChar(g346) in
                                                                              let t6 = PRIM_CharOrd(g347) in
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
                                                                                t1 g348 k in
                                                                              t7 t1 k in
                                                                      match t3 with
                                                                      | true1 ->
                                                                        let t4 = PRIM_PutChar(t1) in
                                                                        k t4
                                                                      | false0 ->
                                                                        let t4 = PRIM_EqChar(t1,g337) in
                                                                        match t4 with
                                                                        | true1 ->
                                                                          let t5 = PRIM_PutChar(t1) in
                                                                          k t5
                                                                        | false0 ->
                                                                          let t5 = PRIM_LessInt(g338,t2) in
                                                                          match t5 with
                                                                          | true1 ->
                                                                            let t6 = PRIM_PutChar(t1) in
                                                                            k t6
                                                                          | false0 ->
                                                                            let t6 = PRIM_PutChar(g339) in
                                                                            let t7 = PRIM_CharOrd(g340) in
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
                                                                              t1 g341 k in
                                                                            t8 t2 k
                                                                    | false0 -> k g355 in
                                                                  t10 g333 k
                                                              | false0 ->
                                                                let t7 = PRIM_CharOrd(t1) in
                                                                let t8 = PRIM_EqInt(t7,g377) in
                                                                let k = [arg,me,t1], fun [f1,f2,f3] arg ->
                                                                  let t1 = Cons1[f3,f1] in
                                                                  f2 t1 k in
                                                                match t8 with
                                                                | true1 ->
                                                                  let t9 = PRIM_PutChar(t1) in
                                                                  k t9
                                                                | false0 ->
                                                                  let t9 = PRIM_EqChar(t1,g378) in
                                                                  match t9 with
                                                                  | true1 ->
                                                                    let t10 = PRIM_PutChar(t1) in
                                                                    k t10
                                                                  | false0 ->
                                                                    let t10 = PRIM_LessInt(g379,t7) in
                                                                    match t10 with
                                                                    | true1 ->
                                                                      let t11 = PRIM_PutChar(t1) in
                                                                      k t11
                                                                    | false0 ->
                                                                      let t11 = PRIM_PutChar(g380) in
                                                                      let t12 = PRIM_CharOrd(g381) in
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
                                                                        t1 g382 k in
                                                                      t13 t7 k in
                                                      let k = [f1,me], fun [f1,f2] arg ->
                                                        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                            let k = [f2,f3], fun [f1,f2] arg ->
                                                              match arg with
                                                              | true1 -> k g385
                                                              | false0 ->
                                                                let k = [f1,f2], fun [f1,f2] arg ->
                                                                  let k = [f1], fun [f1] arg ->
                                                                    let k = [f1], fun [f1] arg ->
                                                                      let t1 = PRIM_CharOrd(g389) in
                                                                      let t2 = PRIM_EqInt(t1,g390) in
                                                                      let k = [f1], fun [f1] arg -> f1 g396 k in
                                                                      match t2 with
                                                                      | true1 ->
                                                                        let t3 = PRIM_PutChar(g389) in
                                                                        k t3
                                                                      | false0 ->
                                                                        let t3 = PRIM_EqChar(g389,g391) in
                                                                        match t3 with
                                                                        | true1 ->
                                                                          let t4 = PRIM_PutChar(g389) in
                                                                          k t4
                                                                        | false0 ->
                                                                          let t4 = PRIM_LessInt(g392,t1) in
                                                                          match t4 with
                                                                          | true1 ->
                                                                            let t5 = PRIM_PutChar(g389) in
                                                                            k t5
                                                                          | false0 ->
                                                                            let t5 = PRIM_PutChar(g393) in
                                                                            let t6 = PRIM_CharOrd(g394) in
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
                                                                              t1 g395 k in
                                                                            t7 t1 k in
                                                                    g13 arg k in
                                                                  arg f2 k in
                                                                g386 g387 k in
                                                            arg f1 k in
                                                          arg f3 k in
                                                        g1 g384 k in
                                                      t2 g383 k in
                                                    t1 g397 k in
                                                  g13 t1 k
                                              | false0 ->
                                                let k = [f2], fun [f1] arg ->
                                                  let k = [f1,arg], fun [f1,f2] arg ->
                                                    let t1 = PRIM_Explode(g401) in
                                                    let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                      let k = [arg,f3], fun [f1,f2] arg ->
                                                        let k = [f2], fun [f1] arg ->
                                                          let k = [f1], fun [f1] arg ->
                                                            let t1 = PRIM_Explode(g402) in
                                                            let k = [f1], fun [f1] arg ->
                                                              let t1 = PRIM_CharOrd(g403) in
                                                              let t2 = [t1], fun [f1] me arg k ->
                                                                let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                                  let t1 = PRIM_EqInt(arg,g404) in
                                                                  match t1 with
                                                                  | true1 -> k f2
                                                                  | false0 ->
                                                                    let t2 = PRIM_ModInt(arg,g405) in
                                                                    let t3 = PRIM_AddInt(f1,t2) in
                                                                    let t4 = PRIM_CharChr(t3) in
                                                                    let t5 = [t4], fun [f1] arg k ->
                                                                      let t1 = Cons1[f1,arg] in
                                                                      k t1 in
                                                                    let k = [f3,arg], fun [f1,f2] arg ->
                                                                      let k = [f2], fun [f1] arg ->
                                                                        let t1 = PRIM_DivInt(f1,g406) in
                                                                        arg t1 k in
                                                                      f1 arg k in
                                                                    t5 f2 k in
                                                                k t1 in
                                                              let t3 = PRIM_EqInt(f1,g407) in
                                                              let k = [], fun [] arg ->
                                                                let k = [], fun [] arg ->
                                                                  let t1 = PRIM_Explode(g412) in
                                                                  let k = [], fun [] arg ->
                                                                    let t1 = PRIM_CharOrd(g414) in
                                                                    let t2 = PRIM_EqInt(t1,g415) in
                                                                    match t2 with
                                                                    | true1 ->
                                                                      let t3 = PRIM_PutChar(g414) in
                                                                      k t3
                                                                    | false0 ->
                                                                      let t3 = PRIM_EqChar(g414,g416) in
                                                                      match t3 with
                                                                      | true1 ->
                                                                        let t4 = PRIM_PutChar(g414) in
                                                                        k t4
                                                                      | false0 ->
                                                                        let t4 = PRIM_LessInt(g417,t1) in
                                                                        match t4 with
                                                                        | true1 ->
                                                                          let t5 = PRIM_PutChar(g414) in
                                                                          k t5
                                                                        | false0 ->
                                                                          let t5 = PRIM_PutChar(g418) in
                                                                          let t6 = PRIM_CharOrd(g419) in
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
                                                                            t1 g420 k in
                                                                          t7 t1 k in
                                                                  g13 t1 k in
                                                                g13 arg k in
                                                              match t3 with
                                                              | true1 -> g409 g410 k
                                                              | false0 ->
                                                                let k = [f1], fun [f1] arg -> arg f1 k in
                                                                t2 g411 k in
                                                            g13 t1 k in
                                                          g13 arg k in
                                                        f1 arg k in
                                                      f2 f1 k in
                                                    g6 t1 k in
                                                  g9 f1 k in
                                                g7 g400 k in
                                            arg f4 k in
                                          arg f3 k in
                                        g1 g286 k in
                                    arg f5 k in
                                  arg f3 k in
                                g1 g212 k in
                            arg f5 k in
                          arg f3 k in
                        g1 g138 k in
                    arg f3 k in
                  arg g135 k in
                g125 g134 k in
            arg f1 k in
          arg f3 k in
        g1 g123 k in
      t2 g122 k in
    g13 g37 k in
  let t2 = PRIM_Explode(g423) in
  let k = [t1], fun [f1] arg -> f1 g424 k in
  g13 t2 k in
t2 g32 k
