(*stage3*)
let k () = ()
let g1 = fun arg k -> k arg in
let g2 = 8 in
let g3 = '\n' in
let g4 = 26 in
let g5 = '^' in
let g6 = 'A' in
let g7 = 1 in
let g8 = fun arg k ->
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
        let t6 = PRIM_CharOrd(g6) in
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
          t1 g7 k in
        t7 t1 k in
let g10 = true1 in
let g11 = false0 in
let g12 = false0 in
let g13 = false0 in
let g9 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match f2 with
      | Nil0 ->
        match arg with
        | Nil0 -> k g10
        | Cons1(t1,t2) -> k g11
      | Cons1(t1,t2) ->
        match arg with
        | Nil0 -> k g12
        | Cons1(t3,t4) ->
          let k = [f1,t2,t3,t4], fun [f1,f2,f3,f4] arg ->
            let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
              match arg with
              | true1 ->
                let k = [f2,f3], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  arg f1 k in
                g9 f1 k
              | false0 -> k g13 in
            arg f3 k in
          f1 t1 k in
    k t1 in
  k t1 in
let g14 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t1], fun [f1,f2] arg ->
        let k = [f2], fun [f1] arg ->
          let t1 = Cons1[f1,arg] in
          k t1 in
        arg f1 k in
      g14 t2 k in
  k t1 in
let g16 = Nil0 in
let g15 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g16
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f1,f2] arg ->
        let t1 = [arg], fun [f1] arg k ->
          let t1 = Cons1[f1,arg] in
          k t1 in
        let k = [t1,f2], fun [f1,f2] arg ->
          let k = [f1], fun [f1] arg -> f1 arg k in
          arg f2 k in
        g15 f1 k in
      f1 t1 k in
  k t1 in
let g18 = 0 in
let g19 = 1 in
let g20 = fun arg k ->
  let t1 = PRIM_AddInt(g19,arg) in
  k t1 in
let g17 = fun arg k ->
  match arg with
  | Nil0 -> k g18
  | Cons1(t1,t2) ->
    let k = [], fun [] arg -> g20 arg k in
    g17 t2 k in
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
      let t1 = [arg], fun [f1] arg k ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      let t2 = PRIM_SubInt(f1,g25) in
      let k = [t1], fun [f1] arg -> f1 arg k in
      g22 t2 k in
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
        let t1 = [arg], fun [f1] arg k ->
          let t1 = PRIM_MulInt(f1,arg) in
          k t1 in
        t1 f1 k in
      g26 t1 k
    | false0 -> k g31 in
  match t1 with
  | true1 -> k g28
  | false0 -> k g29 in
let g32 = 4 in
let g33 = Nil0 in
let g34 = '>' in
let g35 = ' ' in
let g36 = Nil0 in
let g37 = Cons1[g35,g36] in
let g38 = Cons1[g34,g37] in
let g40 = 4 in
let g41 = Unit0 in
let g42 = '\n' in
let g44 = '\n' in
let g45 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g45 t3 k in
  k t1 in
let g46 = Nil0 in
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
let g51 = 127 in
let g52 = 127 in
let g53 = false0 in
let g54 = true1 in
let g55 = 26 in
let g57 = 8 in
let g58 = ' ' in
let g59 = Unit0 in
let g61 = 8 in
let g62 = ' ' in
let g63 = Nil0 in
let g64 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g65 = Unit0 in
let g67 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g67 t3 k in
  k t1 in
let g68 = Nil0 in
let g69 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g69 t3 k in
  k t1 in
let g70 = Nil0 in
let g71 = ' ' in
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
let g74 = Nil0 in
let g66 = fun arg k ->
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
              g69 g70 k in
            t1 f1 k in
          arg f2 k in
        g67 g68 k
      | Cons1(t1,t2) ->
        let t3 = PRIM_EqChar(t1,g71) in
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
                  arg g74 k in
                g66 arg k in
              t1 f1 k in
            arg f2 k in
          g72 g73 k
        | false0 ->
          let k = [f2,t1,t2], fun [f1,f2,f3] arg ->
            let t1 = Cons1[f2,f1] in
            let k = [f3], fun [f1] arg -> arg f1 k in
            arg t1 k in
          g66 f1 k in
    k t1 in
  k t1 in
let g75 = Nil0 in
let g76 = Nil0 in
let g77 = Unit0 in
let g78 = "fib" in
let g79 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g80 = "fib: " in
let g81 = "expected an argument" in
let g82 = "ERROR: " in
let g84 = '\n' in
let g85 = "expected exactly one argument" in
let g86 = "ERROR: " in
let g88 = '\n' in
let g90 = '0' in
let g91 = 0 in
let g92 = false0 in
let g93 = true1 in
let g94 = 9 in
let g95 = false0 in
let g96 = true1 in
let g97 = None1 in
let g98 = None1 in
let g99 = None1 in
let g100 = 10 in
let g101 = fun arg k ->
  let t1 = PRIM_MulInt(g100,arg) in
  k t1 in
let g89 = fun arg k ->
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
      let t5 = PRIM_CharOrd(g90) in
      let k = [f1,t2], fun [f1,f2] arg ->
        let t1 = PRIM_LessInt(arg,g91) in
        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
          let k = [f1,f2], fun [f1,f2] arg ->
            match arg with
            | None1 -> k g99
            | Some0(t1) ->
              let k = [f2,t1], fun [f1,f2] arg ->
                let t1 = [arg], fun [f1] arg k ->
                  let t1 = PRIM_AddInt(f1,arg) in
                  k t1 in
                let k = [f1], fun [f1] arg ->
                  let k = [f1], fun [f1] arg -> arg f1 k in
                  g89 arg k in
                t1 f2 k in
              g101 f1 k in
          match arg with
          | true1 ->
            let t1 = PRIM_LessInt(g94,f3) in
            let k = [f3], fun [f1] arg ->
              match arg with
              | true1 ->
                let t1 = Some0[f1] in
                k t1
              | false0 -> k g97 in
            match t1 with
            | true1 -> k g95
            | false0 -> k g96
          | false0 -> k g98 in
        match t1 with
        | true1 -> k g92
        | false0 -> k g93 in
      t4 t5 k in
  k t1 in
let g102 = 0 in
let g103 = "expected arg1 to be numeric" in
let g104 = "ERROR: " in
let g106 = '\n' in
let g107 = '0' in
let g108 = 0 in
let g109 = 10 in
let g110 = 10 in
let g111 = 0 in
let g112 = '0' in
let g113 = fun arg k ->
  let t1 = Cons1[g112,arg] in
  k t1 in
let g114 = Nil0 in
let g115 = Nil0 in
let g116 = " --> " in
let g117 = '0' in
let g118 = 0 in
let g119 = 10 in
let g120 = 10 in
let g121 = 0 in
let g122 = '0' in
let g123 = fun arg k ->
  let t1 = Cons1[g122,arg] in
  k t1 in
let g124 = Nil0 in
let g125 = Nil0 in
let g127 = '\n' in
let g128 = "fact" in
let g129 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g130 = "fact: " in
let g131 = "expected an argument" in
let g132 = "ERROR: " in
let g134 = '\n' in
let g135 = "expected exactly one argument" in
let g136 = "ERROR: " in
let g138 = '\n' in
let g140 = '0' in
let g141 = 0 in
let g142 = false0 in
let g143 = true1 in
let g144 = 9 in
let g145 = false0 in
let g146 = true1 in
let g147 = None1 in
let g148 = None1 in
let g149 = None1 in
let g150 = 10 in
let g151 = fun arg k ->
  let t1 = PRIM_MulInt(g150,arg) in
  k t1 in
let g139 = fun arg k ->
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
      let t5 = PRIM_CharOrd(g140) in
      let k = [f1,t2], fun [f1,f2] arg ->
        let t1 = PRIM_LessInt(arg,g141) in
        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
          let k = [f1,f2], fun [f1,f2] arg ->
            match arg with
            | None1 -> k g149
            | Some0(t1) ->
              let k = [f2,t1], fun [f1,f2] arg ->
                let t1 = [arg], fun [f1] arg k ->
                  let t1 = PRIM_AddInt(f1,arg) in
                  k t1 in
                let k = [f1], fun [f1] arg ->
                  let k = [f1], fun [f1] arg -> arg f1 k in
                  g139 arg k in
                t1 f2 k in
              g151 f1 k in
          match arg with
          | true1 ->
            let t1 = PRIM_LessInt(g144,f3) in
            let k = [f3], fun [f1] arg ->
              match arg with
              | true1 ->
                let t1 = Some0[f1] in
                k t1
              | false0 -> k g147 in
            match t1 with
            | true1 -> k g145
            | false0 -> k g146
          | false0 -> k g148 in
        match t1 with
        | true1 -> k g142
        | false0 -> k g143 in
      t4 t5 k in
  k t1 in
let g152 = 0 in
let g153 = "expected arg1 to be numeric" in
let g154 = "ERROR: " in
let g156 = '\n' in
let g157 = '0' in
let g158 = 0 in
let g159 = 10 in
let g160 = 10 in
let g161 = 0 in
let g162 = '0' in
let g163 = fun arg k ->
  let t1 = Cons1[g162,arg] in
  k t1 in
let g164 = Nil0 in
let g165 = Nil0 in
let g166 = " --> " in
let g167 = '0' in
let g168 = 0 in
let g169 = 10 in
let g170 = 10 in
let g171 = 0 in
let g172 = '0' in
let g173 = fun arg k ->
  let t1 = Cons1[g172,arg] in
  k t1 in
let g174 = Nil0 in
let g175 = Nil0 in
let g177 = '\n' in
let g178 = "rev" in
let g179 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g180 = "rev: expected no arguments" in
let g181 = "ERROR: " in
let g183 = '\n' in
let g184 = "(reverse typed lines until ^D)\n" in
let g187 = 4 in
let g188 = Unit0 in
let g189 = '\n' in
let g191 = '\n' in
let g192 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g192 t3 k in
  k t1 in
let g193 = Nil0 in
let g195 = '\n' in
let g196 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g196 t3 k in
  k t1 in
let g197 = Nil0 in
let g198 = 127 in
let g199 = 127 in
let g200 = false0 in
let g201 = true1 in
let g202 = 26 in
let g204 = 8 in
let g205 = ' ' in
let g206 = Unit0 in
let g208 = 8 in
let g209 = ' ' in
let g210 = Nil0 in
let g211 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g212 = Unit0 in
let g213 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g213 t3 k in
  k t1 in
let g214 = Nil0 in
let g216 = '\n' in
let g217 = Unit0 in
let g218 = Unit0 in
let g219 = 'o' in
let g220 = '*' in
let g221 = fun arg k ->
  let t1 = PRIM_EqChar(arg,g219) in
  match t1 with
  | true1 -> k g220
  | false0 -> k arg in
let g222 = "You wrote: \"" in
let g223 = "\" (" in
let g224 = '0' in
let g225 = 0 in
let g226 = 10 in
let g227 = 10 in
let g228 = 0 in
let g229 = '0' in
let g230 = fun arg k ->
  let t1 = Cons1[g229,arg] in
  k t1 in
let g231 = Nil0 in
let g232 = Nil0 in
let g233 = " chars)" in
let g235 = '\n' in
let g236 = Unit0 in
let g238 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g239 = Unit0 in
let g1 = g1 in
let k = [], fun [] arg ->
  let t1 = [arg], fun [f1] me arg k ->
    match arg with
    | Nil0 -> k g21
    | Cons1(t1,t2) ->
      let k = [me,t2], fun [f1,f2] arg -> f1 f2 k in
      f1 t1 k in
  let t2 = PRIM_CharChr(g32) in
  let t3 = [t2], fun [f1] arg k ->
    let t1 = Cons1[f1,arg] in
    k t1 in
  let k = [arg,t1], fun [f1,f2] arg ->
    let t1 = [f1,f2,arg], fun [f1,f2,f3] me arg k ->
      let k = [f1,f2,f3,me], fun [f1,f2,f3,f4] arg ->
        let t1 = PRIM_CharChr(g40) in
        let t2 = [f1,t1], fun [f1,f2] me arg k ->
          let t1 = PRIM_GetChar(g41) in
          let t2 = PRIM_CharOrd(t1) in
          let t3 = PRIM_EqChar(t1,g42) in
          match t3 with
          | true1 ->
            let k = [arg], fun [f1] arg ->
              let k = [f1], fun [f1] arg -> arg f1 k in
              g45 g46 k in
            f1 g44 k
          | false0 ->
            let t4 = PRIM_EqChar(t1,f2) in
            match t4 with
            | true1 ->
              let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                let k = [f2,f3], fun [f1,f2] arg ->
                  let t1 = Cons1[f1,f2] in
                  let k = [t1], fun [f1] arg -> arg f1 k in
                  g49 g50 k in
                f1 g48 k in
              f1 t1 k
            | false0 ->
              let t5 = PRIM_LessInt(g51,t2) in
              match t5 with
              | true1 -> me arg k
              | false0 ->
                let t6 = PRIM_EqInt(t2,g52) in
                match t6 with
                | true1 ->
                  match arg with
                  | Nil0 -> me arg k
                  | Cons1(t7,t8) ->
                    let t9 = PRIM_CharOrd(t7) in
                    let t10 = [t9], fun [f1] arg k ->
                      let t1 = PRIM_LessInt(arg,f1) in
                      match t1 with
                      | true1 -> k g53
                      | false0 -> k g54 in
                    let k = [f1,me,t8], fun [f1,f2,f3] arg ->
                      let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                        let t1 = PRIM_CharChr(g61) in
                        let k = [f1,f2,f3,t1], fun [f1,f2,f3,f4] arg ->
                          let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                            let k = [f2,f3], fun [f1,f2] arg -> f1 f2 k in
                            f1 f4 k in
                          f1 g62 k in
                        f1 t1 k in
                      match arg with
                      | true1 ->
                        let t1 = PRIM_CharChr(g57) in
                        let k = [f1,t1], fun [f1,f2] arg ->
                          let k = [f1,f2], fun [f1,f2] arg -> f1 f2 k in
                          f1 g58 k in
                        f1 t1 k
                      | false0 -> k g59 in
                    t10 g55 k
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
                | true1 -> k g65
                | false0 ->
                  let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                    let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                      let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                        let k = [f4], fun [f1] arg -> f1 g236 k in
                        match arg with
                        | Nil0 -> k g77
                        | Cons1(t1,t2) ->
                          let t3 = PRIM_Explode(g78) in
                          let k = [f1,f2,f3,f5,t1,t2,t3], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
                            let k = [f1,f2,f3,f4,f5,f6,f7], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
                              let k = [f1,f2,f3,f4,f5,f6], fun [f1,f2,f3,f4,f5,f6] arg ->
                                match arg with
                                | true1 ->
                                  let t1 = PRIM_Explode(g80) in
                                  let k = [f1,f2,f6], fun [f1,f2,f3] arg ->
                                    match f3 with
                                    | Nil0 ->
                                      let t1 = PRIM_Explode(g82) in
                                      let k = [f1,f2], fun [f1,f2] arg ->
                                        let t1 = PRIM_Explode(g81) in
                                        let k = [f1], fun [f1] arg -> f1 g84 k in
                                        f2 t1 k in
                                      f2 t1 k
                                    | Cons1(t1,t2) ->
                                      match t2 with
                                      | Cons1(t3,t4) ->
                                        let t5 = PRIM_Explode(g86) in
                                        let k = [f1,f2], fun [f1,f2] arg ->
                                          let t1 = PRIM_Explode(g85) in
                                          let k = [f1], fun [f1] arg -> f1 g88 k in
                                          f2 t1 k in
                                        f2 t5 k
                                      | Nil0 ->
                                        let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                          let k = [f1,f2], fun [f1,f2] arg ->
                                            match arg with
                                            | None1 ->
                                              let t1 = PRIM_Explode(g104) in
                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                let t1 = PRIM_Explode(g103) in
                                                let k = [f1], fun [f1] arg -> f1 g106 k in
                                                f2 t1 k in
                                              f2 t1 k
                                            | Some0(t1) ->
                                              let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                let t1 = PRIM_CharOrd(g107) in
                                                let t2 = [t1], fun [f1] me arg k ->
                                                  let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                    let t1 = PRIM_EqInt(arg,g108) in
                                                    match t1 with
                                                    | true1 -> k f2
                                                    | false0 ->
                                                      let t2 = PRIM_ModInt(arg,g109) in
                                                      let t3 = PRIM_AddInt(f1,t2) in
                                                      let t4 = PRIM_CharChr(t3) in
                                                      let t5 = [t4], fun [f1] arg k ->
                                                        let t1 = Cons1[f1,arg] in
                                                        k t1 in
                                                      let k = [f3,arg], fun [f1,f2] arg ->
                                                        let k = [f2], fun [f1] arg ->
                                                          let t1 = PRIM_DivInt(f1,g110) in
                                                          arg t1 k in
                                                        f1 arg k in
                                                      t5 f2 k in
                                                  k t1 in
                                                let t3 = PRIM_EqInt(f3,g111) in
                                                let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                  let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                    let t1 = PRIM_Explode(g116) in
                                                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                      let t1 = PRIM_CharOrd(g117) in
                                                      let t2 = [t1], fun [f1] me arg k ->
                                                        let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                          let t1 = PRIM_EqInt(arg,g118) in
                                                          match t1 with
                                                          | true1 -> k f2
                                                          | false0 ->
                                                            let t2 = PRIM_ModInt(arg,g119) in
                                                            let t3 = PRIM_AddInt(f1,t2) in
                                                            let t4 = PRIM_CharChr(t3) in
                                                            let t5 = [t4], fun [f1] arg k ->
                                                              let t1 = Cons1[f1,arg] in
                                                              k t1 in
                                                            let k = [f3,arg], fun [f1,f2] arg ->
                                                              let k = [f2], fun [f1] arg ->
                                                                let t1 = PRIM_DivInt(f1,g120) in
                                                                arg t1 k in
                                                              f1 arg k in
                                                            t5 f2 k in
                                                        k t1 in
                                                      let t3 = PRIM_EqInt(f3,g121) in
                                                      let k = [f1,f2], fun [f1,f2] arg ->
                                                        let k = [f1], fun [f1] arg -> f1 g127 k in
                                                        f2 arg k in
                                                      match t3 with
                                                      | true1 -> g123 g124 k
                                                      | false0 ->
                                                        let k = [f3], fun [f1] arg -> arg f1 k in
                                                        t2 g125 k in
                                                    f2 t1 k in
                                                  f2 arg k in
                                                match t3 with
                                                | true1 -> g113 g114 k
                                                | false0 ->
                                                  let k = [f3], fun [f1] arg -> arg f1 k in
                                                  t2 g115 k in
                                              g22 t1 k in
                                          arg f3 k in
                                        g89 g102 k in
                                  f2 t1 k
                                | false0 ->
                                  let t1 = PRIM_Explode(g128) in
                                  let k = [f1,f2,f3,f4,f5,f6,t1], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
                                    let k = [f1,f2,f3,f4,f5,f6,f7], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
                                      let k = [f1,f2,f3,f4,f5,f6], fun [f1,f2,f3,f4,f5,f6] arg ->
                                        match arg with
                                        | true1 ->
                                          let t1 = PRIM_Explode(g130) in
                                          let k = [f1,f2,f6], fun [f1,f2,f3] arg ->
                                            match f3 with
                                            | Nil0 ->
                                              let t1 = PRIM_Explode(g132) in
                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                let t1 = PRIM_Explode(g131) in
                                                let k = [f1], fun [f1] arg -> f1 g134 k in
                                                f2 t1 k in
                                              f2 t1 k
                                            | Cons1(t1,t2) ->
                                              match t2 with
                                              | Cons1(t3,t4) ->
                                                let t5 = PRIM_Explode(g136) in
                                                let k = [f1,f2], fun [f1,f2] arg ->
                                                  let t1 = PRIM_Explode(g135) in
                                                  let k = [f1], fun [f1] arg -> f1 g138 k in
                                                  f2 t1 k in
                                                f2 t5 k
                                              | Nil0 ->
                                                let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                  let k = [f1,f2], fun [f1,f2] arg ->
                                                    match arg with
                                                    | None1 ->
                                                      let t1 = PRIM_Explode(g154) in
                                                      let k = [f1,f2], fun [f1,f2] arg ->
                                                        let t1 = PRIM_Explode(g153) in
                                                        let k = [f1], fun [f1] arg -> f1 g156 k in
                                                        f2 t1 k in
                                                      f2 t1 k
                                                    | Some0(t1) ->
                                                      let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                        let t1 = PRIM_CharOrd(g157) in
                                                        let t2 = [t1], fun [f1] me arg k ->
                                                          let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                            let t1 = PRIM_EqInt(arg,g158) in
                                                            match t1 with
                                                            | true1 -> k f2
                                                            | false0 ->
                                                              let t2 = PRIM_ModInt(arg,g159) in
                                                              let t3 = PRIM_AddInt(f1,t2) in
                                                              let t4 = PRIM_CharChr(t3) in
                                                              let t5 = [t4], fun [f1] arg k ->
                                                                let t1 = Cons1[f1,arg] in
                                                                k t1 in
                                                              let k = [f3,arg], fun [f1,f2] arg ->
                                                                let k = [f2], fun [f1] arg ->
                                                                  let t1 = PRIM_DivInt(f1,g160) in
                                                                  arg t1 k in
                                                                f1 arg k in
                                                              t5 f2 k in
                                                          k t1 in
                                                        let t3 = PRIM_EqInt(f3,g161) in
                                                        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                            let t1 = PRIM_Explode(g166) in
                                                            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                              let t1 = PRIM_CharOrd(g167) in
                                                              let t2 = [t1], fun [f1] me arg k ->
                                                                let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                                  let t1 = PRIM_EqInt(arg,g168) in
                                                                  match t1 with
                                                                  | true1 -> k f2
                                                                  | false0 ->
                                                                    let t2 = PRIM_ModInt(arg,g169) in
                                                                    let t3 = PRIM_AddInt(f1,t2) in
                                                                    let t4 = PRIM_CharChr(t3) in
                                                                    let t5 = [t4], fun [f1] arg k ->
                                                                      let t1 = Cons1[f1,arg] in
                                                                      k t1 in
                                                                    let k = [f3,arg], fun [f1,f2] arg ->
                                                                      let k = [f2], fun [f1] arg ->
                                                                        let t1 = PRIM_DivInt(f1,g170) in
                                                                        arg t1 k in
                                                                      f1 arg k in
                                                                    t5 f2 k in
                                                                k t1 in
                                                              let t3 = PRIM_EqInt(f3,g171) in
                                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                                let k = [f1], fun [f1] arg -> f1 g177 k in
                                                                f2 arg k in
                                                              match t3 with
                                                              | true1 -> g173 g174 k
                                                              | false0 ->
                                                                let k = [f3], fun [f1] arg -> arg f1 k in
                                                                t2 g175 k in
                                                            f2 t1 k in
                                                          f2 arg k in
                                                        match t3 with
                                                        | true1 -> g163 g164 k
                                                        | false0 ->
                                                          let k = [f3], fun [f1] arg -> arg f1 k in
                                                          t2 g165 k in
                                                      g26 t1 k in
                                                  arg f3 k in
                                                g139 g152 k in
                                          f2 t1 k
                                        | false0 ->
                                          let t1 = PRIM_Explode(g178) in
                                          let k = [f1,f2,f3,f4,f5,f6,t1], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
                                            let k = [f1,f2,f3,f4,f6,f7], fun [f1,f2,f3,f4,f5,f6] arg ->
                                              let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                                match arg with
                                                | true1 ->
                                                  match f5 with
                                                  | Cons1(t1,t2) ->
                                                    let t3 = PRIM_Explode(g181) in
                                                    let k = [f1,f2], fun [f1,f2] arg ->
                                                      let t1 = PRIM_Explode(g180) in
                                                      let k = [f1], fun [f1] arg -> f1 g183 k in
                                                      f2 t1 k in
                                                    f2 t3 k
                                                  | Nil0 ->
                                                    let t1 = PRIM_Explode(g184) in
                                                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                      let t1 = [f1,f2,f3], fun [f1,f2,f3] me arg k ->
                                                        let t1 = PRIM_CharChr(g187) in
                                                        let t2 = [f1,t1], fun [f1,f2] me arg k ->
                                                          let t1 = PRIM_GetChar(g188) in
                                                          let t2 = PRIM_CharOrd(t1) in
                                                          let t3 = PRIM_EqChar(t1,g189) in
                                                          match t3 with
                                                          | true1 ->
                                                            let k = [arg], fun [f1] arg ->
                                                              let k = [f1], fun [f1] arg -> arg f1 k in
                                                              g192 g193 k in
                                                            f1 g191 k
                                                          | false0 ->
                                                            let t4 = PRIM_EqChar(t1,f2) in
                                                            match t4 with
                                                            | true1 ->
                                                              let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                                let k = [f2,f3], fun [f1,f2] arg ->
                                                                  let t1 = Cons1[f1,f2] in
                                                                  let k = [t1], fun [f1] arg -> arg f1 k in
                                                                  g196 g197 k in
                                                                f1 g195 k in
                                                              f1 t1 k
                                                            | false0 ->
                                                              let t5 = PRIM_LessInt(g198,t2) in
                                                              match t5 with
                                                              | true1 -> me arg k
                                                              | false0 ->
                                                                let t6 = PRIM_EqInt(t2,g199) in
                                                                match t6 with
                                                                | true1 ->
                                                                  match arg with
                                                                  | Nil0 -> me arg k
                                                                  | Cons1(t7,t8) ->
                                                                    let t9 = PRIM_CharOrd(t7) in
                                                                    let t10 = [t9], fun [f1] arg k ->
                                                                      let t1 = PRIM_LessInt(arg,f1) in
                                                                      match t1 with
                                                                      | true1 -> k g200
                                                                      | false0 -> k g201 in
                                                                    let k = [f1,me,t8], fun [f1,f2,f3] arg ->
                                                                      let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                        let t1 = PRIM_CharChr(g208) in
                                                                        let k = [f1,f2,f3,t1], fun [f1,f2,f3,f4] arg ->
                                                                          let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                                                            let k = [f2,f3], fun [f1,f2] arg -> f1 f2 k in
                                                                            f1 f4 k in
                                                                          f1 g209 k in
                                                                        f1 t1 k in
                                                                      match arg with
                                                                      | true1 ->
                                                                        let t1 = PRIM_CharChr(g204) in
                                                                        let k = [f1,t1], fun [f1,f2] arg ->
                                                                          let k = [f1,f2], fun [f1,f2] arg -> f1 f2 k in
                                                                          f1 g205 k in
                                                                        f1 t1 k
                                                                      | false0 -> k g206 in
                                                                    t10 g202 k
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
                                                                | true1 -> k g212
                                                                | false0 ->
                                                                  let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                                                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                      let k = [f1,f3], fun [f1,f2] arg ->
                                                                        let k = [f2], fun [f1] arg -> f1 g217 k in
                                                                        f1 g216 k in
                                                                      f2 arg k in
                                                                    arg f4 k in
                                                                  g213 g214 k in
                                                              arg f3 k in
                                                            arg f5 k in
                                                          g9 g211 k in
                                                        t2 g210 k in
                                                      t1 g218 k in
                                                    f2 t1 k
                                                | false0 ->
                                                  let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
                                                    let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
                                                      let t1 = PRIM_Explode(g222) in
                                                      let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
                                                        let k = [f1,f2,arg,f5], fun [f1,f2,f3,f4] arg ->
                                                          let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
                                                            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                              let t1 = PRIM_Explode(g223) in
                                                              let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                let t1 = PRIM_CharOrd(g224) in
                                                                let t2 = [t1], fun [f1] me arg k ->
                                                                  let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                                    let t1 = PRIM_EqInt(arg,g225) in
                                                                    match t1 with
                                                                    | true1 -> k f2
                                                                    | false0 ->
                                                                      let t2 = PRIM_ModInt(arg,g226) in
                                                                      let t3 = PRIM_AddInt(f1,t2) in
                                                                      let t4 = PRIM_CharChr(t3) in
                                                                      let t5 = [t4], fun [f1] arg k ->
                                                                        let t1 = Cons1[f1,arg] in
                                                                        k t1 in
                                                                      let k = [f3,arg], fun [f1,f2] arg ->
                                                                        let k = [f2], fun [f1] arg ->
                                                                          let t1 = PRIM_DivInt(f1,g227) in
                                                                          arg t1 k in
                                                                        f1 arg k in
                                                                      t5 f2 k in
                                                                  k t1 in
                                                                let t3 = PRIM_EqInt(f3,g228) in
                                                                let k = [f1,f2], fun [f1,f2] arg ->
                                                                  let k = [f1,f2], fun [f1,f2] arg ->
                                                                    let t1 = PRIM_Explode(g233) in
                                                                    let k = [f1], fun [f1] arg -> f1 g235 k in
                                                                    f2 t1 k in
                                                                  f2 arg k in
                                                                match t3 with
                                                                | true1 -> g230 g231 k
                                                                | false0 ->
                                                                  let k = [f3], fun [f1] arg -> arg f1 k in
                                                                  t2 g232 k in
                                                              f2 t1 k in
                                                            f2 arg k in
                                                          f3 arg k in
                                                        f4 f3 k in
                                                      g14 t1 k in
                                                    g17 f3 k in
                                                  g15 g221 k in
                                              arg f6 k in
                                            arg f5 k in
                                          g9 g179 k in
                                      arg f7 k in
                                    arg f5 k in
                                  g9 g129 k in
                              arg f7 k in
                            arg f5 k in
                          g9 g79 k in
                      arg f5 k in
                    arg g76 k in
                  g66 g75 k in
              arg f3 k in
            arg f5 k in
          g9 g64 k in
        t2 g63 k in
      f2 g38 k in
    let t2 = PRIM_Explode(g238) in
    let k = [t1], fun [f1] arg -> f1 g239 k in
    f2 t2 k in
  t3 g33 k in
g1 g8 k
