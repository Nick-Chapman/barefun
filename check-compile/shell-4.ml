(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k -> f1 arg k in
  k t1 in
let g2 = 0 in
let g3 = 1 in
let g4 = CID0 in
let g5 = 1 in
let g6 = fun arg k ->
  let t1 = [arg], fun [f1] me arg k ->
    let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
      let t1 = PRIM_LessInt(arg,g2) in
      match t1 with
      | true1 -> k f2
      | false0 ->
        let t2 = PRIM_StringIndex(f1,arg) in
        let t3 = CID1[t2,f2] in
        let k = [arg], fun [f2] arg ->
          let t1 = PRIM_SubInt(f2,g3) in
          arg t1 k in
        f3 t3 k in
    k t1 in
  let t2 = PRIM_StringLength(arg) in
  let k = [t2], fun [f2] arg ->
    let t1 = PRIM_SubInt(f2,g5) in
    arg t1 k in
  t1 g4 k in
let g8 = CID1 in
let g9 = CID0 in
let g10 = CID0 in
let g11 = CID0 in
let g7 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match f2 with
      | Nil0 ->
        match arg with
        | Nil0 -> k g8
        | Cons1(t1,t2) -> k g9
      | Cons1(t1,t2) ->
        match arg with
        | Nil0 -> k g10
        | Cons1(t3,t4) ->
          let k = [f1,t2,t3,t4], fun [f2,f3,f4,f5] arg ->
            let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
              match arg with
              | true1 ->
                let k = [f3,f4], fun [f2,f3] arg ->
                  let k = [f3], fun [f2] arg -> arg f2 k in
                  arg f2 k in
                g7 f2 k
              | false0 -> k g11 in
            arg f4 k in
          f1 t1 k in
    k t1 in
  k t1 in
let g12 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t1], fun [f2,f3] arg ->
        let k = [f3], fun [f2] arg ->
          let t1 = CID1[f2,arg] in
          k t1 in
        arg f2 k in
      g12 t2 k in
  k t1 in
let g13 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g13 t3 k in
  k t1 in
let g15 = CID0 in
let g14 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g15
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f2,f3] arg ->
        let k = [f3,arg], fun [f2,f3] arg ->
          let k = [f3], fun [f2] arg ->
            let t1 = CID1[f2,arg] in
            k t1 in
          arg f2 k in
        g14 f2 k in
      f1 t1 k in
  k t1 in
let g17 = 0 in
let g18 = 1 in
let g16 = fun arg k ->
  match arg with
  | Nil0 -> k g17
  | Cons1(t1,t2) ->
    let k = [], fun [] arg ->
      let t1 = PRIM_AddInt(g18,arg) in
      k t1 in
    g16 t2 k in
let g20 = CID0 in
let g21 = 8 in
let g22 = '\n' in
let g23 = 26 in
let g24 = '^' in
let g25 = 65 in
let g26 = 1 in
let g19 = fun arg k ->
  match arg with
  | Nil0 -> k g20
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,g21) in
    let k = [t2], fun [f2] arg -> g19 f2 k in
    match t4 with
    | true1 ->
      let t5 = PRIM_PutChar(t1) in
      k t5
    | false0 ->
      let t5 = PRIM_EqChar(t1,g22) in
      match t5 with
      | true1 ->
        let t6 = PRIM_PutChar(t1) in
        k t6
      | false0 ->
        let t6 = PRIM_LessInt(g23,t3) in
        match t6 with
        | true1 ->
          let t7 = PRIM_PutChar(t1) in
          k t7
        | false0 ->
          let t7 = PRIM_PutChar(g24) in
          let t8 = PRIM_AddInt(g25,t3) in
          let t9 = PRIM_SubInt(t8,g26) in
          let t10 = PRIM_CharChr(t9) in
          let t11 = PRIM_PutChar(t10) in
          k t11 in
let g28 = CID0 in
let g29 = '\n' in
let g30 = '\n' in
let g31 = CID0 in
let g32 = '\EOT' in
let g33 = 8 in
let g34 = '\n' in
let g35 = 26 in
let g36 = '^' in
let g37 = 65 in
let g38 = 1 in
let g39 = '\n' in
let g40 = CID0 in
let g41 = '\EOT' in
let g42 = 127 in
let g43 = 127 in
let g44 = 26 in
let g45 = CID0 in
let g46 = CID1 in
let g47 = '\b' in
let g48 = ' ' in
let g49 = '\b' in
let g50 = CID0 in
let g51 = '\b' in
let g52 = ' ' in
let g53 = '\b' in
let g54 = 8 in
let g55 = '\n' in
let g56 = 26 in
let g57 = '^' in
let g58 = 65 in
let g59 = 1 in
let g27 = fun arg k ->
  let t1 = PRIM_GetChar(g28) in
  let t2 = PRIM_CharOrd(t1) in
  let t3 = PRIM_EqChar(t1,g29) in
  match t3 with
  | true1 ->
    let t4 = PRIM_PutChar(g30) in
    let k = [arg], fun [f2] arg -> arg f2 k in
    g13 g31 k
  | false0 ->
    let t4 = PRIM_EqChar(t1,g32) in
    match t4 with
    | true1 ->
      let t5 = PRIM_CharOrd(t1) in
      let t6 = PRIM_EqInt(t5,g33) in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_PutChar(g39) in
        let k = [f2], fun [f2] arg ->
          let t1 = CID1[g41,f2] in
          arg t1 k in
        g13 g40 k in
      match t6 with
      | true1 ->
        let t7 = PRIM_PutChar(t1) in
        k t7
      | false0 ->
        let t7 = PRIM_EqChar(t1,g34) in
        match t7 with
        | true1 ->
          let t8 = PRIM_PutChar(t1) in
          k t8
        | false0 ->
          let t8 = PRIM_LessInt(g35,t5) in
          match t8 with
          | true1 ->
            let t9 = PRIM_PutChar(t1) in
            k t9
          | false0 ->
            let t9 = PRIM_PutChar(g36) in
            let t10 = PRIM_AddInt(g37,t5) in
            let t11 = PRIM_SubInt(t10,g38) in
            let t12 = PRIM_CharChr(t11) in
            let t13 = PRIM_PutChar(t12) in
            k t13
    | false0 ->
      let t5 = PRIM_LessInt(g42,t2) in
      match t5 with
      | true1 -> g27 arg k
      | false0 ->
        let t6 = PRIM_EqInt(t2,g43) in
        match t6 with
        | true1 ->
          match arg with
          | Nil0 -> g27 arg k
          | Cons1(t7,t8) ->
            let t9 = PRIM_CharOrd(t7) in
            let t10 = PRIM_LessInt(g44,t9) in
            let k = [t8], fun [f2] arg ->
              let k = [f2], fun [f2] arg ->
                let t1 = PRIM_PutChar(g51) in
                let t2 = PRIM_PutChar(g52) in
                let t3 = PRIM_PutChar(g53) in
                g27 f2 k in
              match arg with
              | true1 ->
                let t1 = PRIM_PutChar(g47) in
                let t2 = PRIM_PutChar(g48) in
                let t3 = PRIM_PutChar(g49) in
                k t3
              | false0 -> k g50 in
            match t10 with
            | true1 -> k g45
            | false0 -> k g46
        | false0 ->
          let t7 = PRIM_CharOrd(t1) in
          let t8 = PRIM_EqInt(t7,g54) in
          let k = [arg,t1], fun [f2,f3] arg ->
            let t1 = CID1[f3,f2] in
            g27 t1 k in
          match t8 with
          | true1 ->
            let t9 = PRIM_PutChar(t1) in
            k t9
          | false0 ->
            let t9 = PRIM_EqChar(t1,g55) in
            match t9 with
            | true1 ->
              let t10 = PRIM_PutChar(t1) in
              k t10
            | false0 ->
              let t10 = PRIM_LessInt(g56,t7) in
              match t10 with
              | true1 ->
                let t11 = PRIM_PutChar(t1) in
                k t11
              | false0 ->
                let t11 = PRIM_PutChar(g57) in
                let t12 = PRIM_AddInt(g58,t7) in
                let t13 = PRIM_SubInt(t12,g59) in
                let t14 = PRIM_CharChr(t13) in
                let t15 = PRIM_PutChar(t14) in
                k t15 in
let g61 = 2 in
let g62 = 1 in
let g63 = 2 in
let g60 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g61) in
  match t1 with
  | true1 -> k arg
  | false0 ->
    let t2 = PRIM_SubInt(arg,g62) in
    let k = [arg], fun [f2] arg ->
      let t1 = PRIM_SubInt(f2,g63) in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_AddInt(f2,arg) in
        k t1 in
      g60 t1 k in
    g60 t2 k in
let g65 = 2 in
let g66 = CID0 in
let g67 = CID1 in
let g68 = 1 in
let g69 = 1 in
let g64 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g65) in
  let k = [arg], fun [f2] arg ->
    match arg with
    | true1 ->
      let t1 = PRIM_SubInt(f2,g68) in
      let k = [f2], fun [f2] arg ->
        let t1 = PRIM_MulInt(arg,f2) in
        k t1 in
      g64 t1 k
    | false0 -> k g69 in
  match t1 with
  | true1 -> k g66
  | false0 -> k g67 in
let g71 = CID0 in
let g72 = CID0 in
let g73 = ' ' in
let g74 = CID0 in
let g75 = CID0 in
let g70 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match arg with
      | Nil0 ->
        let k = [f1,f2], fun [f2,f3] arg ->
          let k = [f2], fun [f2] arg ->
            let k = [f2,arg], fun [f2,f3] arg ->
              let t1 = CID1[f3,f2] in
              arg t1 k in
            g13 g72 k in
          arg f3 k in
        g13 g71 k
      | Cons1(t1,t2) ->
        let t3 = PRIM_EqChar(t1,g73) in
        match t3 with
        | true1 ->
          let k = [f1,f2,t2], fun [f2,f3,f4] arg ->
            let k = [f2,f4], fun [f2,f3] arg ->
              let t1 = CID1[arg,f2] in
              let k = [f3], fun [f2] arg ->
                let k = [f2], fun [f2] arg -> arg f2 k in
                arg g75 k in
              g70 t1 k in
            arg f3 k in
          g13 g74 k
        | false0 ->
          let k = [f2,t1,t2], fun [f2,f3,f4] arg ->
            let t1 = CID1[f3,f2] in
            let k = [f4], fun [f2] arg -> arg f2 k in
            arg t1 k in
          g70 f1 k in
    k t1 in
  k t1 in
let g76 = '>' in
let g77 = ' ' in
let g78 = CID0 in
let g79 = CID1[g77,g78] in
let g80 = CID1[g76,g79] in
let g81 = CID0 in
let g82 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g83 = '\EOT' in
let g84 = CID0 in
let g85 = CID1[g83,g84] in
let g86 = CID0 in
let g87 = CID0 in
let g88 = CID0 in
let g89 = CID0 in
let g90 = "fib" in
let g91 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g92 = "fib: " in
let g93 = "ERROR: " in
let g94 = "expected an argument" in
let g95 = '\n' in
let g96 = "ERROR: " in
let g97 = "expected exactly one argument" in
let g98 = '\n' in
let g100 = 48 in
let g101 = 0 in
let g102 = CID0 in
let g103 = CID1 in
let g104 = 9 in
let g105 = CID0 in
let g106 = CID1 in
let g107 = CID1 in
let g108 = CID1 in
let g109 = CID1 in
let g110 = 10 in
let g99 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = CID0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,g100) in
      let t5 = PRIM_LessInt(t4,g101) in
      let k = [f1,t2,t4], fun [f2,f3,f4] arg ->
        let k = [f2,f3], fun [f2,f3] arg ->
          match arg with
          | None1 -> k g109
          | Some0(t1) ->
            let t2 = PRIM_MulInt(g110,f2) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f3], fun [f2] arg -> arg f2 k in
            g99 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(g104,f4) in
          let k = [f4], fun [f2] arg ->
            match arg with
            | true1 ->
              let t1 = CID0[f2] in
              k t1
            | false0 -> k g107 in
          match t1 with
          | true1 -> k g105
          | false0 -> k g106
        | false0 -> k g108 in
      match t5 with
      | true1 -> k g102
      | false0 -> k g103 in
  k t1 in
let g111 = 0 in
let g112 = "ERROR: " in
let g113 = "expected arg1 to be numeric" in
let g114 = '\n' in
let g116 = 0 in
let g117 = 10 in
let g118 = 48 in
let g119 = 10 in
let g115 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g116) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g117) in
      let t3 = PRIM_AddInt(g118,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g119) in
        arg t1 k in
      g115 t5 k in
  k t1 in
let g120 = 0 in
let g121 = '0' in
let g122 = CID0 in
let g123 = CID1[g121,g122] in
let g124 = CID0 in
let g125 = " --> " in
let g127 = 0 in
let g128 = 10 in
let g129 = 48 in
let g130 = 10 in
let g126 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g127) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g128) in
      let t3 = PRIM_AddInt(g129,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g130) in
        arg t1 k in
      g126 t5 k in
  k t1 in
let g131 = 0 in
let g132 = '0' in
let g133 = CID0 in
let g134 = CID1[g132,g133] in
let g135 = CID0 in
let g136 = '\n' in
let g137 = "fact" in
let g138 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g139 = "fact: " in
let g140 = "ERROR: " in
let g141 = "expected an argument" in
let g142 = '\n' in
let g143 = "ERROR: " in
let g144 = "expected exactly one argument" in
let g145 = '\n' in
let g147 = 48 in
let g148 = 0 in
let g149 = CID0 in
let g150 = CID1 in
let g151 = 9 in
let g152 = CID0 in
let g153 = CID1 in
let g154 = CID1 in
let g155 = CID1 in
let g156 = CID1 in
let g157 = 10 in
let g146 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = CID0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,g147) in
      let t5 = PRIM_LessInt(t4,g148) in
      let k = [f1,t2,t4], fun [f2,f3,f4] arg ->
        let k = [f2,f3], fun [f2,f3] arg ->
          match arg with
          | None1 -> k g156
          | Some0(t1) ->
            let t2 = PRIM_MulInt(g157,f2) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f3], fun [f2] arg -> arg f2 k in
            g146 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(g151,f4) in
          let k = [f4], fun [f2] arg ->
            match arg with
            | true1 ->
              let t1 = CID0[f2] in
              k t1
            | false0 -> k g154 in
          match t1 with
          | true1 -> k g152
          | false0 -> k g153
        | false0 -> k g155 in
      match t5 with
      | true1 -> k g149
      | false0 -> k g150 in
  k t1 in
let g158 = 0 in
let g159 = "ERROR: " in
let g160 = "expected arg1 to be numeric" in
let g161 = '\n' in
let g163 = 0 in
let g164 = 10 in
let g165 = 48 in
let g166 = 10 in
let g162 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g163) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g164) in
      let t3 = PRIM_AddInt(g165,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g166) in
        arg t1 k in
      g162 t5 k in
  k t1 in
let g167 = 0 in
let g168 = '0' in
let g169 = CID0 in
let g170 = CID1[g168,g169] in
let g171 = CID0 in
let g172 = " --> " in
let g174 = 0 in
let g175 = 10 in
let g176 = 48 in
let g177 = 10 in
let g173 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g174) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g175) in
      let t3 = PRIM_AddInt(g176,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g177) in
        arg t1 k in
      g173 t5 k in
  k t1 in
let g178 = 0 in
let g179 = '0' in
let g180 = CID0 in
let g181 = CID1[g179,g180] in
let g182 = CID0 in
let g183 = '\n' in
let g184 = "rev" in
let g185 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g186 = "ERROR: " in
let g187 = "rev: expected no arguments" in
let g188 = '\n' in
let g189 = "(reverse typed lines until ^D)\n" in
let g191 = CID0 in
let g192 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g193 = '\EOT' in
let g194 = CID0 in
let g195 = CID1[g193,g194] in
let g196 = CID0 in
let g197 = CID0 in
let g198 = '\n' in
let g199 = CID0 in
let g190 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [arg], fun [f2] arg ->
      let k = [f2], fun [f2] arg ->
        let k = [f2], fun [f2] arg ->
          match arg with
          | true1 -> k g196
          | false0 ->
            let k = [f2], fun [f2] arg ->
              let k = [], fun [] arg ->
                let k = [], fun [] arg ->
                  let t1 = PRIM_PutChar(g198) in
                  g190 g199 k in
                g19 arg k in
              arg f2 k in
            g13 g197 k in
        arg g195 k in
      arg f2 k in
    g7 g192 k in
  g27 g191 k in
let g200 = CID0 in
let g201 = 'o' in
let g202 = '*' in
let g203 = fun arg k ->
  let t1 = PRIM_EqChar(arg,g201) in
  match t1 with
  | true1 -> k g202
  | false0 -> k arg in
let g204 = "You wrote: \"" in
let g205 = "\" (" in
let g207 = 0 in
let g208 = 10 in
let g209 = 48 in
let g210 = 10 in
let g206 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g207) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g208) in
      let t3 = PRIM_AddInt(g209,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g210) in
        arg t1 k in
      g206 t5 k in
  k t1 in
let g211 = 0 in
let g212 = '0' in
let g213 = CID0 in
let g214 = CID1[g212,g213] in
let g215 = CID0 in
let g216 = " chars)" in
let g217 = '\n' in
let g218 = CID0 in
let g219 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g220 = CID0 in
let k = [], fun [] arg ->
  let t1 = [arg], fun [f1] me arg k ->
    let k = [f1,me], fun [f2,f3] arg ->
      let k = [f2,f3], fun [f2,f3] arg ->
        let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
          let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
              match arg with
              | true1 -> k g86
              | false0 ->
                let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                  let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                    let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                      let k = [f3], fun [f2] arg -> f2 g218 k in
                      match arg with
                      | Nil0 -> k g89
                      | Cons1(t1,t2) ->
                        let k = [f2,f4,t1,t2], fun [f2,f3,f4,f5] arg ->
                          let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                            let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                              let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                match arg with
                                | true1 ->
                                  let t1 = [f2], fun [f1] arg k ->
                                    let k = [], fun [] arg -> g19 arg k in
                                    f1 arg k in
                                  let k = [f2,f5], fun [f2,f3] arg ->
                                    let k = [f2,f3], fun [f2,f3] arg ->
                                      match f3 with
                                      | Nil0 ->
                                        let t1 = [f2], fun [f1] arg k ->
                                          let k = [], fun [] arg -> g19 arg k in
                                          f1 arg k in
                                        let k = [f2], fun [f2] arg ->
                                          let k = [f2], fun [f2] arg ->
                                            let t1 = [f2], fun [f1] arg k ->
                                              let k = [], fun [] arg -> g19 arg k in
                                              f1 arg k in
                                            let k = [], fun [] arg ->
                                              let k = [], fun [] arg ->
                                                let t1 = PRIM_PutChar(g95) in
                                                k t1 in
                                              arg g94 k in
                                            g1 t1 k in
                                          arg g93 k in
                                        g1 t1 k
                                      | Cons1(t1,t2) ->
                                        match t2 with
                                        | Cons1(t3,t4) ->
                                          let t5 = [f2], fun [f1] arg k ->
                                            let k = [], fun [] arg -> g19 arg k in
                                            f1 arg k in
                                          let k = [f2], fun [f2] arg ->
                                            let k = [f2], fun [f2] arg ->
                                              let t1 = [f2], fun [f1] arg k ->
                                                let k = [], fun [] arg -> g19 arg k in
                                                f1 arg k in
                                              let k = [], fun [] arg ->
                                                let k = [], fun [] arg ->
                                                  let t1 = PRIM_PutChar(g98) in
                                                  k t1 in
                                                arg g97 k in
                                              g1 t1 k in
                                            arg g96 k in
                                          g1 t5 k
                                        | Nil0 ->
                                          let k = [f2,t1], fun [f2,f3] arg ->
                                            let k = [f2], fun [f2] arg ->
                                              match arg with
                                              | None1 ->
                                                let t1 = [f2], fun [f1] arg k ->
                                                  let k = [], fun [] arg -> g19 arg k in
                                                  f1 arg k in
                                                let k = [f2], fun [f2] arg ->
                                                  let k = [f2], fun [f2] arg ->
                                                    let t1 = [f2], fun [f1] arg k ->
                                                      let k = [], fun [] arg -> g19 arg k in
                                                      f1 arg k in
                                                    let k = [], fun [] arg ->
                                                      let k = [], fun [] arg ->
                                                        let t1 = PRIM_PutChar(g114) in
                                                        k t1 in
                                                      arg g113 k in
                                                    g1 t1 k in
                                                  arg g112 k in
                                                g1 t1 k
                                              | Some0(t1) ->
                                                let k = [f2,t1], fun [f2,f3] arg ->
                                                  let t1 = PRIM_EqInt(f3,g120) in
                                                  let k = [f2,arg], fun [f2,f3] arg ->
                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                      let t1 = [f2], fun [f1] arg k ->
                                                        let k = [], fun [] arg -> g19 arg k in
                                                        f1 arg k in
                                                      let k = [f3], fun [f2] arg ->
                                                        let k = [f2], fun [f2] arg ->
                                                          let t1 = PRIM_EqInt(f2,g131) in
                                                          let k = [], fun [] arg ->
                                                            let k = [], fun [] arg ->
                                                              let t1 = PRIM_PutChar(g136) in
                                                              k t1 in
                                                            g19 arg k in
                                                          match t1 with
                                                          | true1 -> k g134
                                                          | false0 ->
                                                            let k = [f2], fun [f2] arg -> arg f2 k in
                                                            g126 g135 k in
                                                        arg g125 k in
                                                      g1 t1 k in
                                                    g19 arg k in
                                                  match t1 with
                                                  | true1 -> k g123
                                                  | false0 ->
                                                    let k = [f3], fun [f2] arg -> arg f2 k in
                                                    g115 g124 k in
                                                g60 t1 k in
                                            arg f3 k in
                                          g99 g111 k in
                                    arg g92 k in
                                  g1 t1 k
                                | false0 ->
                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                    let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                      let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                          match arg with
                                          | true1 ->
                                            let t1 = [f2], fun [f1] arg k ->
                                              let k = [], fun [] arg -> g19 arg k in
                                              f1 arg k in
                                            let k = [f2,f5], fun [f2,f3] arg ->
                                              let k = [f2,f3], fun [f2,f3] arg ->
                                                match f3 with
                                                | Nil0 ->
                                                  let t1 = [f2], fun [f1] arg k ->
                                                    let k = [], fun [] arg -> g19 arg k in
                                                    f1 arg k in
                                                  let k = [f2], fun [f2] arg ->
                                                    let k = [f2], fun [f2] arg ->
                                                      let t1 = [f2], fun [f1] arg k ->
                                                        let k = [], fun [] arg -> g19 arg k in
                                                        f1 arg k in
                                                      let k = [], fun [] arg ->
                                                        let k = [], fun [] arg ->
                                                          let t1 = PRIM_PutChar(g142) in
                                                          k t1 in
                                                        arg g141 k in
                                                      g1 t1 k in
                                                    arg g140 k in
                                                  g1 t1 k
                                                | Cons1(t1,t2) ->
                                                  match t2 with
                                                  | Cons1(t3,t4) ->
                                                    let t5 = [f2], fun [f1] arg k ->
                                                      let k = [], fun [] arg -> g19 arg k in
                                                      f1 arg k in
                                                    let k = [f2], fun [f2] arg ->
                                                      let k = [f2], fun [f2] arg ->
                                                        let t1 = [f2], fun [f1] arg k ->
                                                          let k = [], fun [] arg -> g19 arg k in
                                                          f1 arg k in
                                                        let k = [], fun [] arg ->
                                                          let k = [], fun [] arg ->
                                                            let t1 = PRIM_PutChar(g145) in
                                                            k t1 in
                                                          arg g144 k in
                                                        g1 t1 k in
                                                      arg g143 k in
                                                    g1 t5 k
                                                  | Nil0 ->
                                                    let k = [f2,t1], fun [f2,f3] arg ->
                                                      let k = [f2], fun [f2] arg ->
                                                        match arg with
                                                        | None1 ->
                                                          let t1 = [f2], fun [f1] arg k ->
                                                            let k = [], fun [] arg -> g19 arg k in
                                                            f1 arg k in
                                                          let k = [f2], fun [f2] arg ->
                                                            let k = [f2], fun [f2] arg ->
                                                              let t1 = [f2], fun [f1] arg k ->
                                                                let k = [], fun [] arg -> g19 arg k in
                                                                f1 arg k in
                                                              let k = [], fun [] arg ->
                                                                let k = [], fun [] arg ->
                                                                  let t1 = PRIM_PutChar(g161) in
                                                                  k t1 in
                                                                arg g160 k in
                                                              g1 t1 k in
                                                            arg g159 k in
                                                          g1 t1 k
                                                        | Some0(t1) ->
                                                          let k = [f2,t1], fun [f2,f3] arg ->
                                                            let t1 = PRIM_EqInt(f3,g167) in
                                                            let k = [f2,arg], fun [f2,f3] arg ->
                                                              let k = [f2,f3], fun [f2,f3] arg ->
                                                                let t1 = [f2], fun [f1] arg k ->
                                                                  let k = [], fun [] arg -> g19 arg k in
                                                                  f1 arg k in
                                                                let k = [f3], fun [f2] arg ->
                                                                  let k = [f2], fun [f2] arg ->
                                                                    let t1 = PRIM_EqInt(f2,g178) in
                                                                    let k = [], fun [] arg ->
                                                                      let k = [], fun [] arg ->
                                                                        let t1 = PRIM_PutChar(g183) in
                                                                        k t1 in
                                                                      g19 arg k in
                                                                    match t1 with
                                                                    | true1 -> k g181
                                                                    | false0 ->
                                                                      let k = [f2], fun [f2] arg -> arg f2 k in
                                                                      g173 g182 k in
                                                                  arg g172 k in
                                                                g1 t1 k in
                                                              g19 arg k in
                                                            match t1 with
                                                            | true1 -> k g170
                                                            | false0 ->
                                                              let k = [f3], fun [f2] arg -> arg f2 k in
                                                              g162 g171 k in
                                                          g64 t1 k in
                                                      arg f3 k in
                                                    g146 g158 k in
                                              arg g139 k in
                                            g1 t1 k
                                          | false0 ->
                                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                              let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                let k = [f2,f3,f5,f6], fun [f2,f3,f4,f5] arg ->
                                                  let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                    match arg with
                                                    | true1 ->
                                                      match f4 with
                                                      | Cons1(t1,t2) ->
                                                        let t3 = [f2], fun [f1] arg k ->
                                                          let k = [], fun [] arg -> g19 arg k in
                                                          f1 arg k in
                                                        let k = [f2], fun [f2] arg ->
                                                          let k = [f2], fun [f2] arg ->
                                                            let t1 = [f2], fun [f1] arg k ->
                                                              let k = [], fun [] arg -> g19 arg k in
                                                              f1 arg k in
                                                            let k = [], fun [] arg ->
                                                              let k = [], fun [] arg ->
                                                                let t1 = PRIM_PutChar(g188) in
                                                                k t1 in
                                                              arg g187 k in
                                                            g1 t1 k in
                                                          arg g186 k in
                                                        g1 t3 k
                                                      | Nil0 ->
                                                        let t1 = [f2], fun [f1] arg k ->
                                                          let k = [], fun [] arg -> g19 arg k in
                                                          f1 arg k in
                                                        let k = [], fun [] arg ->
                                                          let k = [], fun [] arg -> g190 g200 k in
                                                          arg g189 k in
                                                        g1 t1 k
                                                    | false0 ->
                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                        let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                          let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                              let k = [f2,f5,arg], fun [f2,f3,f4] arg ->
                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                    let t1 = [f2], fun [f1] arg k ->
                                                                      let k = [], fun [] arg -> g19 arg k in
                                                                      f1 arg k in
                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                        let t1 = PRIM_EqInt(f3,g211) in
                                                                        let k = [f2], fun [f2] arg ->
                                                                          let k = [f2], fun [f2] arg ->
                                                                            let t1 = [f2], fun [f1] arg k ->
                                                                              let k = [], fun [] arg -> g19 arg k in
                                                                              f1 arg k in
                                                                            let k = [], fun [] arg ->
                                                                              let k = [], fun [] arg ->
                                                                                let t1 = PRIM_PutChar(g217) in
                                                                                k t1 in
                                                                              arg g216 k in
                                                                            g1 t1 k in
                                                                          g19 arg k in
                                                                        match t1 with
                                                                        | true1 -> k g214
                                                                        | false0 ->
                                                                          let k = [f3], fun [f2] arg -> arg f2 k in
                                                                          g206 g215 k in
                                                                      arg g205 k in
                                                                    g1 t1 k in
                                                                  g19 arg k in
                                                                f4 arg k in
                                                              f4 f3 k in
                                                            g12 arg k in
                                                          f2 g204 k in
                                                        g16 f3 k in
                                                      g14 g203 k in
                                                  arg f5 k in
                                                arg f4 k in
                                              g7 g185 k in
                                            f2 g184 k in
                                        arg f6 k in
                                      arg f4 k in
                                    g7 g138 k in
                                  f2 g137 k in
                              arg f6 k in
                            arg f4 k in
                          g7 g91 k in
                        f2 g90 k in
                    arg f4 k in
                  arg g88 k in
                g70 g87 k in
            arg g85 k in
          arg f4 k in
        g7 g82 k in
      g27 g81 k in
    g19 g80 k in
  let t2 = [arg], fun [f1] arg k ->
    let k = [], fun [] arg -> g19 arg k in
    f1 arg k in
  let k = [t1], fun [f2] arg ->
    let k = [f2], fun [f2] arg -> f2 g220 k in
    arg g219 k in
  g1 t2 k in
g1 g6 k
