(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k -> f1 arg k in
  k t1 in
let g2 = fun arg k ->
  let t1 = PRIM_Explode(arg) in
  k t1 in
let g4 = CID1 in
let g5 = CID0 in
let g6 = CID0 in
let g7 = CID0 in
let g3 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match f2 with
      | Nil0 ->
        match arg with
        | Nil0 -> k g4
        | Cons1(t1,t2) -> k g5
      | Cons1(t1,t2) ->
        match arg with
        | Nil0 -> k g6
        | Cons1(t3,t4) ->
          let k = [f1,t2,t3,t4], fun [f1,f2,f3,f4] arg ->
            let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
              match arg with
              | true1 ->
                let k = [f2,f3], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  arg f1 k in
                g3 f1 k
              | false0 -> k g7 in
            arg f3 k in
          f1 t1 k in
    k t1 in
  k t1 in
let g8 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t1], fun [f1,f2] arg ->
        let k = [f2], fun [f1] arg ->
          let t1 = CID1[f1,arg] in
          k t1 in
        arg f1 k in
      g8 t2 k in
  k t1 in
let g9 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g9 t3 k in
  k t1 in
let g11 = CID0 in
let g10 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g11
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f1,f2] arg ->
        let k = [f2,arg], fun [f1,f2] arg ->
          let k = [f2], fun [f1] arg ->
            let t1 = CID1[f1,arg] in
            k t1 in
          arg f1 k in
        g10 f1 k in
      f1 t1 k in
  k t1 in
let g13 = 0 in
let g14 = 1 in
let g12 = fun arg k ->
  match arg with
  | Nil0 -> k g13
  | Cons1(t1,t2) ->
    let k = [], fun [] arg ->
      let t1 = PRIM_AddInt(g14,arg) in
      k t1 in
    g12 t2 k in
let g16 = CID0 in
let g17 = 8 in
let g18 = '\n' in
let g19 = 26 in
let g20 = '^' in
let g21 = 65 in
let g22 = 1 in
let g15 = fun arg k ->
  match arg with
  | Nil0 -> k g16
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,g17) in
    let k = [t2], fun [f1] arg -> g15 f1 k in
    match t4 with
    | true1 ->
      let t5 = PRIM_PutChar(t1) in
      k t5
    | false0 ->
      let t5 = PRIM_EqChar(t1,g18) in
      match t5 with
      | true1 ->
        let t6 = PRIM_PutChar(t1) in
        k t6
      | false0 ->
        let t6 = PRIM_LessInt(g19,t3) in
        match t6 with
        | true1 ->
          let t7 = PRIM_PutChar(t1) in
          k t7
        | false0 ->
          let t7 = PRIM_PutChar(g20) in
          let t8 = PRIM_AddInt(g21,t3) in
          let t9 = PRIM_SubInt(t8,g22) in
          let t10 = PRIM_CharChr(t9) in
          let t11 = PRIM_PutChar(t10) in
          k t11 in
let g24 = CID0 in
let g25 = '\n' in
let g26 = '\n' in
let g27 = CID0 in
let g28 = '\EOT' in
let g29 = 8 in
let g30 = '\n' in
let g31 = 26 in
let g32 = '^' in
let g33 = 65 in
let g34 = 1 in
let g35 = '\n' in
let g36 = CID0 in
let g37 = '\EOT' in
let g38 = 127 in
let g39 = 127 in
let g40 = 26 in
let g41 = CID0 in
let g42 = CID1 in
let g43 = '\b' in
let g44 = ' ' in
let g45 = '\b' in
let g46 = CID0 in
let g47 = '\b' in
let g48 = ' ' in
let g49 = '\b' in
let g50 = 8 in
let g51 = '\n' in
let g52 = 26 in
let g53 = '^' in
let g54 = 65 in
let g55 = 1 in
let g23 = fun arg k ->
  let t1 = PRIM_GetChar(g24) in
  let t2 = PRIM_CharOrd(t1) in
  let t3 = PRIM_EqChar(t1,g25) in
  match t3 with
  | true1 ->
    let t4 = PRIM_PutChar(g26) in
    let k = [arg], fun [f1] arg -> arg f1 k in
    g9 g27 k
  | false0 ->
    let t4 = PRIM_EqChar(t1,g28) in
    match t4 with
    | true1 ->
      let t5 = PRIM_CharOrd(t1) in
      let t6 = PRIM_EqInt(t5,g29) in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_PutChar(g35) in
        let k = [f1], fun [f1] arg ->
          let t1 = CID1[g37,f1] in
          arg t1 k in
        g9 g36 k in
      match t6 with
      | true1 ->
        let t7 = PRIM_PutChar(t1) in
        k t7
      | false0 ->
        let t7 = PRIM_EqChar(t1,g30) in
        match t7 with
        | true1 ->
          let t8 = PRIM_PutChar(t1) in
          k t8
        | false0 ->
          let t8 = PRIM_LessInt(g31,t5) in
          match t8 with
          | true1 ->
            let t9 = PRIM_PutChar(t1) in
            k t9
          | false0 ->
            let t9 = PRIM_PutChar(g32) in
            let t10 = PRIM_AddInt(g33,t5) in
            let t11 = PRIM_SubInt(t10,g34) in
            let t12 = PRIM_CharChr(t11) in
            let t13 = PRIM_PutChar(t12) in
            k t13
    | false0 ->
      let t5 = PRIM_LessInt(g38,t2) in
      match t5 with
      | true1 -> g23 arg k
      | false0 ->
        let t6 = PRIM_EqInt(t2,g39) in
        match t6 with
        | true1 ->
          match arg with
          | Nil0 -> g23 arg k
          | Cons1(t7,t8) ->
            let t9 = PRIM_CharOrd(t7) in
            let t10 = PRIM_LessInt(g40,t9) in
            let k = [t8], fun [f1] arg ->
              let k = [f1], fun [f1] arg ->
                let t1 = PRIM_PutChar(g47) in
                let t2 = PRIM_PutChar(g48) in
                let t3 = PRIM_PutChar(g49) in
                g23 f1 k in
              match arg with
              | true1 ->
                let t1 = PRIM_PutChar(g43) in
                let t2 = PRIM_PutChar(g44) in
                let t3 = PRIM_PutChar(g45) in
                k t3
              | false0 -> k g46 in
            match t10 with
            | true1 -> k g41
            | false0 -> k g42
        | false0 ->
          let t7 = PRIM_CharOrd(t1) in
          let t8 = PRIM_EqInt(t7,g50) in
          let k = [arg,t1], fun [f1,f2] arg ->
            let t1 = CID1[f2,f1] in
            g23 t1 k in
          match t8 with
          | true1 ->
            let t9 = PRIM_PutChar(t1) in
            k t9
          | false0 ->
            let t9 = PRIM_EqChar(t1,g51) in
            match t9 with
            | true1 ->
              let t10 = PRIM_PutChar(t1) in
              k t10
            | false0 ->
              let t10 = PRIM_LessInt(g52,t7) in
              match t10 with
              | true1 ->
                let t11 = PRIM_PutChar(t1) in
                k t11
              | false0 ->
                let t11 = PRIM_PutChar(g53) in
                let t12 = PRIM_AddInt(g54,t7) in
                let t13 = PRIM_SubInt(t12,g55) in
                let t14 = PRIM_CharChr(t13) in
                let t15 = PRIM_PutChar(t14) in
                k t15 in
let g57 = 2 in
let g58 = 1 in
let g59 = 2 in
let g56 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g57) in
  match t1 with
  | true1 -> k arg
  | false0 ->
    let t2 = PRIM_SubInt(arg,g58) in
    let k = [arg], fun [f1] arg ->
      let t1 = PRIM_SubInt(f1,g59) in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      g56 t1 k in
    g56 t2 k in
let g61 = 2 in
let g62 = CID0 in
let g63 = CID1 in
let g64 = 1 in
let g65 = 1 in
let g60 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g61) in
  let k = [arg], fun [f1] arg ->
    match arg with
    | true1 ->
      let t1 = PRIM_SubInt(f1,g64) in
      let k = [f1], fun [f1] arg ->
        let t1 = PRIM_MulInt(arg,f1) in
        k t1 in
      g60 t1 k
    | false0 -> k g65 in
  match t1 with
  | true1 -> k g62
  | false0 -> k g63 in
let g67 = CID0 in
let g68 = CID0 in
let g69 = ' ' in
let g70 = CID0 in
let g71 = CID0 in
let g66 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match arg with
      | Nil0 ->
        let k = [f1,f2], fun [f1,f2] arg ->
          let k = [f1], fun [f1] arg ->
            let k = [f1,arg], fun [f1,f2] arg ->
              let t1 = CID1[f2,f1] in
              arg t1 k in
            g9 g68 k in
          arg f2 k in
        g9 g67 k
      | Cons1(t1,t2) ->
        let t3 = PRIM_EqChar(t1,g69) in
        match t3 with
        | true1 ->
          let k = [f1,f2,t2], fun [f1,f2,f3] arg ->
            let k = [f1,f3], fun [f1,f2] arg ->
              let t1 = CID1[arg,f1] in
              let k = [f2], fun [f1] arg ->
                let k = [f1], fun [f1] arg -> arg f1 k in
                arg g71 k in
              g66 t1 k in
            arg f2 k in
          g9 g70 k
        | false0 ->
          let k = [f2,t1,t2], fun [f1,f2,f3] arg ->
            let t1 = CID1[f2,f1] in
            let k = [f3], fun [f1] arg -> arg f1 k in
            arg t1 k in
          g66 f1 k in
    k t1 in
  k t1 in
let g72 = '>' in
let g73 = ' ' in
let g74 = CID0 in
let g75 = CID1[g73,g74] in
let g76 = CID1[g72,g75] in
let g77 = CID0 in
let g78 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g79 = '\EOT' in
let g80 = CID0 in
let g81 = CID1[g79,g80] in
let g82 = CID0 in
let g83 = CID0 in
let g84 = CID0 in
let g85 = CID0 in
let g86 = "fib" in
let g87 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g88 = "fib: " in
let g89 = "ERROR: " in
let g90 = "expected an argument" in
let g91 = '\n' in
let g92 = "ERROR: " in
let g93 = "expected exactly one argument" in
let g94 = '\n' in
let g96 = 48 in
let g97 = 0 in
let g98 = CID0 in
let g99 = CID1 in
let g100 = 9 in
let g101 = CID0 in
let g102 = CID1 in
let g103 = CID1 in
let g104 = CID1 in
let g105 = CID1 in
let g106 = 10 in
let g95 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = CID0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,g96) in
      let t5 = PRIM_LessInt(t4,g97) in
      let k = [f1,t2,t4], fun [f1,f2,f3] arg ->
        let k = [f1,f2], fun [f1,f2] arg ->
          match arg with
          | None1 -> k g105
          | Some0(t1) ->
            let t2 = PRIM_MulInt(g106,f1) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f2], fun [f1] arg -> arg f1 k in
            g95 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(g100,f3) in
          let k = [f3], fun [f1] arg ->
            match arg with
            | true1 ->
              let t1 = CID0[f1] in
              k t1
            | false0 -> k g103 in
          match t1 with
          | true1 -> k g101
          | false0 -> k g102
        | false0 -> k g104 in
      match t5 with
      | true1 -> k g98
      | false0 -> k g99 in
  k t1 in
let g107 = 0 in
let g108 = "ERROR: " in
let g109 = "expected arg1 to be numeric" in
let g110 = '\n' in
let g112 = 0 in
let g113 = 10 in
let g114 = 48 in
let g115 = 10 in
let g111 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g112) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g113) in
      let t3 = PRIM_AddInt(g114,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g115) in
        arg t1 k in
      g111 t5 k in
  k t1 in
let g116 = 0 in
let g117 = '0' in
let g118 = CID0 in
let g119 = CID1[g117,g118] in
let g120 = CID0 in
let g121 = " --> " in
let g123 = 0 in
let g124 = 10 in
let g125 = 48 in
let g126 = 10 in
let g122 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g123) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g124) in
      let t3 = PRIM_AddInt(g125,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g126) in
        arg t1 k in
      g122 t5 k in
  k t1 in
let g127 = 0 in
let g128 = '0' in
let g129 = CID0 in
let g130 = CID1[g128,g129] in
let g131 = CID0 in
let g132 = '\n' in
let g133 = "fact" in
let g134 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g135 = "fact: " in
let g136 = "ERROR: " in
let g137 = "expected an argument" in
let g138 = '\n' in
let g139 = "ERROR: " in
let g140 = "expected exactly one argument" in
let g141 = '\n' in
let g143 = 48 in
let g144 = 0 in
let g145 = CID0 in
let g146 = CID1 in
let g147 = 9 in
let g148 = CID0 in
let g149 = CID1 in
let g150 = CID1 in
let g151 = CID1 in
let g152 = CID1 in
let g153 = 10 in
let g142 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = CID0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,g143) in
      let t5 = PRIM_LessInt(t4,g144) in
      let k = [f1,t2,t4], fun [f1,f2,f3] arg ->
        let k = [f1,f2], fun [f1,f2] arg ->
          match arg with
          | None1 -> k g152
          | Some0(t1) ->
            let t2 = PRIM_MulInt(g153,f1) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f2], fun [f1] arg -> arg f1 k in
            g142 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(g147,f3) in
          let k = [f3], fun [f1] arg ->
            match arg with
            | true1 ->
              let t1 = CID0[f1] in
              k t1
            | false0 -> k g150 in
          match t1 with
          | true1 -> k g148
          | false0 -> k g149
        | false0 -> k g151 in
      match t5 with
      | true1 -> k g145
      | false0 -> k g146 in
  k t1 in
let g154 = 0 in
let g155 = "ERROR: " in
let g156 = "expected arg1 to be numeric" in
let g157 = '\n' in
let g159 = 0 in
let g160 = 10 in
let g161 = 48 in
let g162 = 10 in
let g158 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g159) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g160) in
      let t3 = PRIM_AddInt(g161,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g162) in
        arg t1 k in
      g158 t5 k in
  k t1 in
let g163 = 0 in
let g164 = '0' in
let g165 = CID0 in
let g166 = CID1[g164,g165] in
let g167 = CID0 in
let g168 = " --> " in
let g170 = 0 in
let g171 = 10 in
let g172 = 48 in
let g173 = 10 in
let g169 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g170) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g171) in
      let t3 = PRIM_AddInt(g172,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g173) in
        arg t1 k in
      g169 t5 k in
  k t1 in
let g174 = 0 in
let g175 = '0' in
let g176 = CID0 in
let g177 = CID1[g175,g176] in
let g178 = CID0 in
let g179 = '\n' in
let g180 = "rev" in
let g181 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g182 = "ERROR: " in
let g183 = "rev: expected no arguments" in
let g184 = '\n' in
let g185 = "(reverse typed lines until ^D)\n" in
let g187 = CID0 in
let g188 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g189 = '\EOT' in
let g190 = CID0 in
let g191 = CID1[g189,g190] in
let g192 = CID0 in
let g193 = CID0 in
let g194 = '\n' in
let g195 = CID0 in
let g186 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [arg], fun [f1] arg ->
      let k = [f1], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          match arg with
          | true1 -> k g192
          | false0 ->
            let k = [f1], fun [f1] arg ->
              let k = [], fun [] arg ->
                let k = [], fun [] arg ->
                  let t1 = PRIM_PutChar(g194) in
                  g186 g195 k in
                g15 arg k in
              arg f1 k in
            g9 g193 k in
        arg g191 k in
      arg f1 k in
    g3 g188 k in
  g23 g187 k in
let g196 = CID0 in
let g197 = 'o' in
let g198 = '*' in
let g199 = fun arg k ->
  let t1 = PRIM_EqChar(arg,g197) in
  match t1 with
  | true1 -> k g198
  | false0 -> k arg in
let g200 = "You wrote: \"" in
let g201 = "\" (" in
let g203 = 0 in
let g204 = 10 in
let g205 = 48 in
let g206 = 10 in
let g202 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g203) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g204) in
      let t3 = PRIM_AddInt(g205,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f1] arg ->
        let t1 = PRIM_DivInt(f1,g206) in
        arg t1 k in
      g202 t5 k in
  k t1 in
let g207 = 0 in
let g208 = '0' in
let g209 = CID0 in
let g210 = CID1[g208,g209] in
let g211 = CID0 in
let g212 = " chars)" in
let g213 = '\n' in
let g214 = CID0 in
let g215 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g216 = CID0 in
let k = [], fun [] arg ->
  let t1 = [arg], fun [f1] me arg k ->
    let k = [f1,me], fun [f1,f2] arg ->
      let k = [f1,f2], fun [f1,f2] arg ->
        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
              match arg with
              | true1 -> k g82
              | false0 ->
                let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                  let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                      let k = [f2], fun [f1] arg -> f1 g214 k in
                      match arg with
                      | Nil0 -> k g85
                      | Cons1(t1,t2) ->
                        let k = [f1,f3,t1,t2], fun [f1,f2,f3,f4] arg ->
                          let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
                            let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                              let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                match arg with
                                | true1 ->
                                  let t1 = [f1], fun [f1] arg k ->
                                    let k = [], fun [] arg -> g15 arg k in
                                    f1 arg k in
                                  let k = [f1,f4], fun [f1,f2] arg ->
                                    let k = [f1,f2], fun [f1,f2] arg ->
                                      match f2 with
                                      | Nil0 ->
                                        let t1 = [f1], fun [f1] arg k ->
                                          let k = [], fun [] arg -> g15 arg k in
                                          f1 arg k in
                                        let k = [f1], fun [f1] arg ->
                                          let k = [f1], fun [f1] arg ->
                                            let t1 = [f1], fun [f1] arg k ->
                                              let k = [], fun [] arg -> g15 arg k in
                                              f1 arg k in
                                            let k = [], fun [] arg ->
                                              let k = [], fun [] arg ->
                                                let t1 = PRIM_PutChar(g91) in
                                                k t1 in
                                              arg g90 k in
                                            g1 t1 k in
                                          arg g89 k in
                                        g1 t1 k
                                      | Cons1(t1,t2) ->
                                        match t2 with
                                        | Cons1(t3,t4) ->
                                          let t5 = [f1], fun [f1] arg k ->
                                            let k = [], fun [] arg -> g15 arg k in
                                            f1 arg k in
                                          let k = [f1], fun [f1] arg ->
                                            let k = [f1], fun [f1] arg ->
                                              let t1 = [f1], fun [f1] arg k ->
                                                let k = [], fun [] arg -> g15 arg k in
                                                f1 arg k in
                                              let k = [], fun [] arg ->
                                                let k = [], fun [] arg ->
                                                  let t1 = PRIM_PutChar(g94) in
                                                  k t1 in
                                                arg g93 k in
                                              g1 t1 k in
                                            arg g92 k in
                                          g1 t5 k
                                        | Nil0 ->
                                          let k = [f1,t1], fun [f1,f2] arg ->
                                            let k = [f1], fun [f1] arg ->
                                              match arg with
                                              | None1 ->
                                                let t1 = [f1], fun [f1] arg k ->
                                                  let k = [], fun [] arg -> g15 arg k in
                                                  f1 arg k in
                                                let k = [f1], fun [f1] arg ->
                                                  let k = [f1], fun [f1] arg ->
                                                    let t1 = [f1], fun [f1] arg k ->
                                                      let k = [], fun [] arg -> g15 arg k in
                                                      f1 arg k in
                                                    let k = [], fun [] arg ->
                                                      let k = [], fun [] arg ->
                                                        let t1 = PRIM_PutChar(g110) in
                                                        k t1 in
                                                      arg g109 k in
                                                    g1 t1 k in
                                                  arg g108 k in
                                                g1 t1 k
                                              | Some0(t1) ->
                                                let k = [f1,t1], fun [f1,f2] arg ->
                                                  let t1 = PRIM_EqInt(f2,g116) in
                                                  let k = [f1,arg], fun [f1,f2] arg ->
                                                    let k = [f1,f2], fun [f1,f2] arg ->
                                                      let t1 = [f1], fun [f1] arg k ->
                                                        let k = [], fun [] arg -> g15 arg k in
                                                        f1 arg k in
                                                      let k = [f2], fun [f1] arg ->
                                                        let k = [f1], fun [f1] arg ->
                                                          let t1 = PRIM_EqInt(f1,g127) in
                                                          let k = [], fun [] arg ->
                                                            let k = [], fun [] arg ->
                                                              let t1 = PRIM_PutChar(g132) in
                                                              k t1 in
                                                            g15 arg k in
                                                          match t1 with
                                                          | true1 -> k g130
                                                          | false0 ->
                                                            let k = [f1], fun [f1] arg -> arg f1 k in
                                                            g122 g131 k in
                                                        arg g121 k in
                                                      g1 t1 k in
                                                    g15 arg k in
                                                  match t1 with
                                                  | true1 -> k g119
                                                  | false0 ->
                                                    let k = [f2], fun [f1] arg -> arg f1 k in
                                                    g111 g120 k in
                                                g56 t1 k in
                                            arg f2 k in
                                          g95 g107 k in
                                    arg g88 k in
                                  g1 t1 k
                                | false0 ->
                                  let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                    let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
                                      let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                        let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                          match arg with
                                          | true1 ->
                                            let t1 = [f1], fun [f1] arg k ->
                                              let k = [], fun [] arg -> g15 arg k in
                                              f1 arg k in
                                            let k = [f1,f4], fun [f1,f2] arg ->
                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                match f2 with
                                                | Nil0 ->
                                                  let t1 = [f1], fun [f1] arg k ->
                                                    let k = [], fun [] arg -> g15 arg k in
                                                    f1 arg k in
                                                  let k = [f1], fun [f1] arg ->
                                                    let k = [f1], fun [f1] arg ->
                                                      let t1 = [f1], fun [f1] arg k ->
                                                        let k = [], fun [] arg -> g15 arg k in
                                                        f1 arg k in
                                                      let k = [], fun [] arg ->
                                                        let k = [], fun [] arg ->
                                                          let t1 = PRIM_PutChar(g138) in
                                                          k t1 in
                                                        arg g137 k in
                                                      g1 t1 k in
                                                    arg g136 k in
                                                  g1 t1 k
                                                | Cons1(t1,t2) ->
                                                  match t2 with
                                                  | Cons1(t3,t4) ->
                                                    let t5 = [f1], fun [f1] arg k ->
                                                      let k = [], fun [] arg -> g15 arg k in
                                                      f1 arg k in
                                                    let k = [f1], fun [f1] arg ->
                                                      let k = [f1], fun [f1] arg ->
                                                        let t1 = [f1], fun [f1] arg k ->
                                                          let k = [], fun [] arg -> g15 arg k in
                                                          f1 arg k in
                                                        let k = [], fun [] arg ->
                                                          let k = [], fun [] arg ->
                                                            let t1 = PRIM_PutChar(g141) in
                                                            k t1 in
                                                          arg g140 k in
                                                        g1 t1 k in
                                                      arg g139 k in
                                                    g1 t5 k
                                                  | Nil0 ->
                                                    let k = [f1,t1], fun [f1,f2] arg ->
                                                      let k = [f1], fun [f1] arg ->
                                                        match arg with
                                                        | None1 ->
                                                          let t1 = [f1], fun [f1] arg k ->
                                                            let k = [], fun [] arg -> g15 arg k in
                                                            f1 arg k in
                                                          let k = [f1], fun [f1] arg ->
                                                            let k = [f1], fun [f1] arg ->
                                                              let t1 = [f1], fun [f1] arg k ->
                                                                let k = [], fun [] arg -> g15 arg k in
                                                                f1 arg k in
                                                              let k = [], fun [] arg ->
                                                                let k = [], fun [] arg ->
                                                                  let t1 = PRIM_PutChar(g157) in
                                                                  k t1 in
                                                                arg g156 k in
                                                              g1 t1 k in
                                                            arg g155 k in
                                                          g1 t1 k
                                                        | Some0(t1) ->
                                                          let k = [f1,t1], fun [f1,f2] arg ->
                                                            let t1 = PRIM_EqInt(f2,g163) in
                                                            let k = [f1,arg], fun [f1,f2] arg ->
                                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                                let t1 = [f1], fun [f1] arg k ->
                                                                  let k = [], fun [] arg -> g15 arg k in
                                                                  f1 arg k in
                                                                let k = [f2], fun [f1] arg ->
                                                                  let k = [f1], fun [f1] arg ->
                                                                    let t1 = PRIM_EqInt(f1,g174) in
                                                                    let k = [], fun [] arg ->
                                                                      let k = [], fun [] arg ->
                                                                        let t1 = PRIM_PutChar(g179) in
                                                                        k t1 in
                                                                      g15 arg k in
                                                                    match t1 with
                                                                    | true1 -> k g177
                                                                    | false0 ->
                                                                      let k = [f1], fun [f1] arg -> arg f1 k in
                                                                      g169 g178 k in
                                                                  arg g168 k in
                                                                g1 t1 k in
                                                              g15 arg k in
                                                            match t1 with
                                                            | true1 -> k g166
                                                            | false0 ->
                                                              let k = [f2], fun [f1] arg -> arg f1 k in
                                                              g158 g167 k in
                                                          g60 t1 k in
                                                      arg f2 k in
                                                    g142 g154 k in
                                              arg g135 k in
                                            g1 t1 k
                                          | false0 ->
                                            let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                              let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
                                                let k = [f1,f2,f4,f5], fun [f1,f2,f3,f4] arg ->
                                                  let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                    match arg with
                                                    | true1 ->
                                                      match f3 with
                                                      | Cons1(t1,t2) ->
                                                        let t3 = [f1], fun [f1] arg k ->
                                                          let k = [], fun [] arg -> g15 arg k in
                                                          f1 arg k in
                                                        let k = [f1], fun [f1] arg ->
                                                          let k = [f1], fun [f1] arg ->
                                                            let t1 = [f1], fun [f1] arg k ->
                                                              let k = [], fun [] arg -> g15 arg k in
                                                              f1 arg k in
                                                            let k = [], fun [] arg ->
                                                              let k = [], fun [] arg ->
                                                                let t1 = PRIM_PutChar(g184) in
                                                                k t1 in
                                                              arg g183 k in
                                                            g1 t1 k in
                                                          arg g182 k in
                                                        g1 t3 k
                                                      | Nil0 ->
                                                        let t1 = [f1], fun [f1] arg k ->
                                                          let k = [], fun [] arg -> g15 arg k in
                                                          f1 arg k in
                                                        let k = [], fun [] arg ->
                                                          let k = [], fun [] arg -> g186 g196 k in
                                                          arg g185 k in
                                                        g1 t1 k
                                                    | false0 ->
                                                      let k = [f1,f2], fun [f1,f2] arg ->
                                                        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                          let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
                                                            let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                                              let k = [f1,f4,arg], fun [f1,f2,f3] arg ->
                                                                let k = [f1,f2], fun [f1,f2] arg ->
                                                                  let k = [f1,f2], fun [f1,f2] arg ->
                                                                    let t1 = [f1], fun [f1] arg k ->
                                                                      let k = [], fun [] arg -> g15 arg k in
                                                                      f1 arg k in
                                                                    let k = [f1,f2], fun [f1,f2] arg ->
                                                                      let k = [f1,f2], fun [f1,f2] arg ->
                                                                        let t1 = PRIM_EqInt(f2,g207) in
                                                                        let k = [f1], fun [f1] arg ->
                                                                          let k = [f1], fun [f1] arg ->
                                                                            let t1 = [f1], fun [f1] arg k ->
                                                                              let k = [], fun [] arg -> g15 arg k in
                                                                              f1 arg k in
                                                                            let k = [], fun [] arg ->
                                                                              let k = [], fun [] arg ->
                                                                                let t1 = PRIM_PutChar(g213) in
                                                                                k t1 in
                                                                              arg g212 k in
                                                                            g1 t1 k in
                                                                          g15 arg k in
                                                                        match t1 with
                                                                        | true1 -> k g210
                                                                        | false0 ->
                                                                          let k = [f2], fun [f1] arg -> arg f1 k in
                                                                          g202 g211 k in
                                                                      arg g201 k in
                                                                    g1 t1 k in
                                                                  g15 arg k in
                                                                f3 arg k in
                                                              f3 f2 k in
                                                            g8 arg k in
                                                          f1 g200 k in
                                                        g12 f2 k in
                                                      g10 g199 k in
                                                  arg f4 k in
                                                arg f3 k in
                                              g3 g181 k in
                                            f1 g180 k in
                                        arg f5 k in
                                      arg f3 k in
                                    g3 g134 k in
                                  f1 g133 k in
                              arg f5 k in
                            arg f3 k in
                          g3 g87 k in
                        f1 g86 k in
                    arg f3 k in
                  arg g84 k in
                g66 g83 k in
            arg g81 k in
          arg f3 k in
        g3 g78 k in
      g23 g77 k in
    g15 g76 k in
  let t2 = [arg], fun [f1] arg k ->
    let k = [], fun [] arg -> g15 arg k in
    f1 arg k in
  let k = [t1], fun [f1] arg ->
    let k = [f1], fun [f1] arg -> f1 g216 k in
    arg g215 k in
  g1 t2 k in
g1 g2 k
