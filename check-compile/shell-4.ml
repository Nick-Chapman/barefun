(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k -> f1 arg k in
  k t1 in
let g3 = 0 in
let g4 = 1 in
let g2 = fun arg k ->
  match arg with
  | Nil0 -> k g3
  | Cons1(t1,t2) ->
    let k = [], fun [] arg ->
      let t1 = PRIM_AddInt(g4,arg) in
      k t1 in
    g2 t2 k in
let g5 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t1], fun [f2,f3] arg ->
        let k = [f3], fun [f2] arg ->
          let t1 = CID1[f2,arg] in
          k t1 in
        arg f2 k in
      g5 t2 k in
  k t1 in
let g6 = CID0 in
let g7 = 1 in
let g8 = 0 in
let g9 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g6
        | Cons1(t1,t2) ->
          let t3 = PRIM_SetBytes(f1,f2,t1) in
          let t4 = PRIM_AddInt(f2,g7) in
          let k = [t2], fun [f2] arg -> arg f2 k in
          f3 t4 k in
      k t1 in
    let k = [f2,t1], fun [f2,f3] arg ->
      let k = [f3], fun [f2] arg ->
        let t1 = PRIM_FreezeBytes(f2) in
        k t1 in
      arg f2 k in
    t2 g8 k in
  g2 arg k in
let g10 = 0 in
let g11 = 1 in
let g12 = CID0 in
let g13 = 1 in
let g14 = fun arg k ->
  let t1 = [arg], fun [f1] me arg k ->
    let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
      let t1 = PRIM_LessInt(arg,g10) in
      match t1 with
      | true1 -> k f2
      | false0 ->
        let t2 = PRIM_StringIndex(f1,arg) in
        let t3 = CID1[t2,f2] in
        let k = [arg], fun [f2] arg ->
          let t1 = PRIM_SubInt(f2,g11) in
          arg t1 k in
        f3 t3 k in
    k t1 in
  let t2 = PRIM_StringLength(arg) in
  let k = [t2], fun [f2] arg ->
    let t1 = PRIM_SubInt(f2,g13) in
    arg t1 k in
  t1 g12 k in
let g16 = CID1 in
let g17 = CID0 in
let g18 = CID0 in
let g19 = CID0 in
let g15 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match f2 with
      | Nil0 ->
        match arg with
        | Nil0 -> k g16
        | Cons1(t1,t2) -> k g17
      | Cons1(t1,t2) ->
        match arg with
        | Nil0 -> k g18
        | Cons1(t3,t4) ->
          let k = [f1,t2,t3,t4], fun [f2,f3,f4,f5] arg ->
            let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
              match arg with
              | true1 ->
                let k = [f3,f4], fun [f2,f3] arg ->
                  let k = [f3], fun [f2] arg -> arg f2 k in
                  arg f2 k in
                g15 f2 k
              | false0 -> k g19 in
            arg f4 k in
          f1 t1 k in
    k t1 in
  k t1 in
let g20 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g20 t3 k in
  k t1 in
let g22 = CID0 in
let g21 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g22
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f2,f3] arg ->
        let k = [f3,arg], fun [f2,f3] arg ->
          let k = [f3], fun [f2] arg ->
            let t1 = CID1[f2,arg] in
            k t1 in
          arg f2 k in
        g21 f2 k in
      f1 t1 k in
  k t1 in
let g24 = CID0 in
let g25 = 8 in
let g26 = '\n' in
let g27 = 26 in
let g28 = '^' in
let g29 = 65 in
let g30 = 1 in
let g23 = fun arg k ->
  match arg with
  | Nil0 -> k g24
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,g25) in
    let k = [t2], fun [f2] arg -> g23 f2 k in
    match t4 with
    | true1 ->
      let t5 = PRIM_PutChar(t1) in
      k t5
    | false0 ->
      let t5 = PRIM_EqChar(t1,g26) in
      match t5 with
      | true1 ->
        let t6 = PRIM_PutChar(t1) in
        k t6
      | false0 ->
        let t6 = PRIM_LessInt(g27,t3) in
        match t6 with
        | true1 ->
          let t7 = PRIM_PutChar(t1) in
          k t7
        | false0 ->
          let t7 = PRIM_PutChar(g28) in
          let t8 = PRIM_AddInt(g29,t3) in
          let t9 = PRIM_SubInt(t8,g30) in
          let t10 = PRIM_CharChr(t9) in
          let t11 = PRIM_PutChar(t10) in
          k t11 in
let g32 = CID0 in
let g33 = '\n' in
let g34 = '\n' in
let g35 = CID0 in
let g36 = '\EOT' in
let g37 = '^' in
let g38 = 'D' in
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
let g31 = fun arg k ->
  let t1 = PRIM_GetChar(g32) in
  let t2 = PRIM_CharOrd(t1) in
  let t3 = PRIM_EqChar(t1,g33) in
  match t3 with
  | true1 ->
    let t4 = PRIM_PutChar(g34) in
    let k = [arg], fun [f2] arg -> arg f2 k in
    g20 g35 k
  | false0 ->
    let t4 = PRIM_EqChar(t1,g36) in
    match t4 with
    | true1 ->
      let t5 = PRIM_PutChar(g37) in
      let t6 = PRIM_PutChar(g38) in
      let t7 = PRIM_PutChar(g39) in
      let k = [arg], fun [f2] arg ->
        let t1 = CID1[g41,f2] in
        arg t1 k in
      g20 g40 k
    | false0 ->
      let t5 = PRIM_LessInt(g42,t2) in
      match t5 with
      | true1 -> g31 arg k
      | false0 ->
        let t6 = PRIM_EqInt(t2,g43) in
        match t6 with
        | true1 ->
          match arg with
          | Nil0 -> g31 arg k
          | Cons1(t7,t8) ->
            let t9 = PRIM_CharOrd(t7) in
            let t10 = PRIM_LessInt(g44,t9) in
            let k = [t8], fun [f2] arg ->
              let k = [f2], fun [f2] arg ->
                let t1 = PRIM_PutChar(g51) in
                let t2 = PRIM_PutChar(g52) in
                let t3 = PRIM_PutChar(g53) in
                g31 f2 k in
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
            g31 t1 k in
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
let g70 = '\EOT' in
let g71 = CID0 in
let g72 = CID1[g70,g71] in
let g73 = CID0 in
let g74 = CID0 in
let g75 = ' ' in
let g76 = CID0 in
let g77 = CID0 in
let g78 = '>' in
let g79 = ' ' in
let g80 = CID0 in
let g81 = CID1[g79,g80] in
let g82 = CID1[g78,g81] in
let g83 = CID0 in
let g84 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g85 = CID0 in
let g86 = CID0 in
let g87 = CID0 in
let g88 = CID0 in
let g89 = "fib" in
let g90 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g91 = "fib: " in
let g92 = "ERROR: " in
let g93 = "expected an argument" in
let g94 = '\n' in
let g95 = "ERROR: " in
let g96 = "expected exactly one argument" in
let g97 = '\n' in
let g99 = 48 in
let g100 = 0 in
let g101 = CID0 in
let g102 = CID1 in
let g103 = 9 in
let g104 = CID0 in
let g105 = CID1 in
let g106 = CID1 in
let g107 = CID1 in
let g108 = CID1 in
let g109 = 10 in
let g98 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = CID0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,g99) in
      let t5 = PRIM_LessInt(t4,g100) in
      let k = [f1,t2,t4], fun [f2,f3,f4] arg ->
        let k = [f2,f3], fun [f2,f3] arg ->
          match arg with
          | None1 -> k g108
          | Some0(t1) ->
            let t2 = PRIM_MulInt(g109,f2) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f3], fun [f2] arg -> arg f2 k in
            g98 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(g103,f4) in
          let k = [f4], fun [f2] arg ->
            match arg with
            | true1 ->
              let t1 = CID0[f2] in
              k t1
            | false0 -> k g106 in
          match t1 with
          | true1 -> k g104
          | false0 -> k g105
        | false0 -> k g107 in
      match t5 with
      | true1 -> k g101
      | false0 -> k g102 in
  k t1 in
let g110 = 0 in
let g111 = "ERROR: " in
let g112 = "expected arg1 to be numeric" in
let g113 = '\n' in
let g115 = 0 in
let g116 = 10 in
let g117 = 48 in
let g118 = 10 in
let g114 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g115) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g116) in
      let t3 = PRIM_AddInt(g117,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g118) in
        arg t1 k in
      g114 t5 k in
  k t1 in
let g119 = 0 in
let g120 = '0' in
let g121 = CID0 in
let g122 = CID1[g120,g121] in
let g123 = CID0 in
let g124 = " --> " in
let g126 = 0 in
let g127 = 10 in
let g128 = 48 in
let g129 = 10 in
let g125 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g126) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g127) in
      let t3 = PRIM_AddInt(g128,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g129) in
        arg t1 k in
      g125 t5 k in
  k t1 in
let g130 = 0 in
let g131 = '0' in
let g132 = CID0 in
let g133 = CID1[g131,g132] in
let g134 = CID0 in
let g135 = '\n' in
let g136 = "fact" in
let g137 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g138 = "fact: " in
let g139 = "ERROR: " in
let g140 = "expected an argument" in
let g141 = '\n' in
let g142 = "ERROR: " in
let g143 = "expected exactly one argument" in
let g144 = '\n' in
let g146 = 48 in
let g147 = 0 in
let g148 = CID0 in
let g149 = CID1 in
let g150 = 9 in
let g151 = CID0 in
let g152 = CID1 in
let g153 = CID1 in
let g154 = CID1 in
let g155 = CID1 in
let g156 = 10 in
let g145 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = CID0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,g146) in
      let t5 = PRIM_LessInt(t4,g147) in
      let k = [f1,t2,t4], fun [f2,f3,f4] arg ->
        let k = [f2,f3], fun [f2,f3] arg ->
          match arg with
          | None1 -> k g155
          | Some0(t1) ->
            let t2 = PRIM_MulInt(g156,f2) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f3], fun [f2] arg -> arg f2 k in
            g145 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(g150,f4) in
          let k = [f4], fun [f2] arg ->
            match arg with
            | true1 ->
              let t1 = CID0[f2] in
              k t1
            | false0 -> k g153 in
          match t1 with
          | true1 -> k g151
          | false0 -> k g152
        | false0 -> k g154 in
      match t5 with
      | true1 -> k g148
      | false0 -> k g149 in
  k t1 in
let g157 = 0 in
let g158 = "ERROR: " in
let g159 = "expected arg1 to be numeric" in
let g160 = '\n' in
let g162 = 0 in
let g163 = 10 in
let g164 = 48 in
let g165 = 10 in
let g161 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g162) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g163) in
      let t3 = PRIM_AddInt(g164,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g165) in
        arg t1 k in
      g161 t5 k in
  k t1 in
let g166 = 0 in
let g167 = '0' in
let g168 = CID0 in
let g169 = CID1[g167,g168] in
let g170 = CID0 in
let g171 = " --> " in
let g173 = 0 in
let g174 = 10 in
let g175 = 48 in
let g176 = 10 in
let g172 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g173) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g174) in
      let t3 = PRIM_AddInt(g175,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g176) in
        arg t1 k in
      g172 t5 k in
  k t1 in
let g177 = 0 in
let g178 = '0' in
let g179 = CID0 in
let g180 = CID1[g178,g179] in
let g181 = CID0 in
let g182 = '\n' in
let g183 = "rev" in
let g184 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g185 = "ERROR: " in
let g186 = "rev: expected no arguments" in
let g187 = '\n' in
let g188 = "(reverse typed lines until ^D)\n" in
let g189 = CID0 in
let g190 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g191 = CID0 in
let g192 = CID0 in
let g193 = '\n' in
let g194 = CID0 in
let g195 = CID0 in
let g196 = 'o' in
let g197 = '*' in
let g198 = fun arg k ->
  let t1 = PRIM_EqChar(arg,g196) in
  match t1 with
  | true1 -> k g197
  | false0 -> k arg in
let g199 = "You wrote: \"" in
let g200 = "\" (" in
let g202 = 0 in
let g203 = 10 in
let g204 = 48 in
let g205 = 10 in
let g201 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g202) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g203) in
      let t3 = PRIM_AddInt(g204,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,g205) in
        arg t1 k in
      g201 t5 k in
  k t1 in
let g206 = 0 in
let g207 = '0' in
let g208 = CID0 in
let g209 = CID1[g207,g208] in
let g210 = CID0 in
let g211 = " chars)" in
let g212 = '\n' in
let g213 = CID0 in
let g214 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g215 = CID0 in
let k = [], fun [] arg ->
  let k = [arg], fun [f2] arg ->
    let k = [f2,arg], fun [f2,f3] arg ->
      let t1 = [f2], fun [f1] me arg k ->
        let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
          let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg k ->
            match arg with
            | Nil0 ->
              let k = [f1,f2,f4], fun [f2,f3,f4] arg ->
                let k = [f2,f3], fun [f2,f3] arg ->
                  let k = [f3], fun [f2] arg ->
                    let k = [f2,arg], fun [f2,f3] arg ->
                      let t1 = CID1[f3,f2] in
                      arg t1 k in
                    g20 g74 k in
                  f2 arg k in
                arg f4 k in
              g20 g73 k
            | Cons1(t1,t2) ->
              let t3 = PRIM_EqChar(t1,g75) in
              match t3 with
              | true1 ->
                let k = [f1,f2,f3,f4,t2], fun [f2,f3,f4,f5,f6] arg ->
                  let k = [f2,f3,f4,f6], fun [f2,f3,f4,f5] arg ->
                    let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                      let t1 = CID1[arg,f2] in
                      let k = [f4], fun [f2] arg ->
                        let k = [f2], fun [f2] arg -> arg f2 k in
                        arg g77 k in
                      f3 t1 k in
                    f2 arg k in
                  arg f5 k in
                g20 g76 k
              | false0 ->
                let k = [f4,t1,t2], fun [f2,f3,f4] arg ->
                  let t1 = CID1[f3,f2] in
                  let k = [f4], fun [f2] arg -> arg f2 k in
                  arg t1 k in
                f3 f2 k in
          k t1 in
        k t1 in
      let t2 = [f2,f3,arg,t1], fun [f1,f2,f3,f4] me arg k ->
        let k = [f1,f2,f3,f4,me], fun [f2,f3,f4,f5,f6] arg ->
          let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
            let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
              let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                  let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                    let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                      let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                        match arg with
                        | true1 -> k g85
                        | false0 ->
                          let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                            let k = [f2,f3,f4,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                              let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                  let k = [f5], fun [f2] arg -> f2 g213 k in
                                  match arg with
                                  | Nil0 -> k g88
                                  | Cons1(t1,t2) ->
                                    let k = [f2,f3,f4,f6,t1,t2], fun [f2,f3,f4,f5,f6,f7] arg ->
                                      let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                        let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                          let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                            let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                              match arg with
                                              | true1 ->
                                                let k = [f3,f7], fun [f2,f3] arg ->
                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                    match f3 with
                                                    | Nil0 ->
                                                      let k = [f2], fun [f2] arg ->
                                                        let k = [f2], fun [f2] arg ->
                                                          let k = [], fun [] arg ->
                                                            let k = [], fun [] arg ->
                                                              let t1 = PRIM_PutChar(g94) in
                                                              k t1 in
                                                            g23 arg k in
                                                          f2 g93 k in
                                                        g23 arg k in
                                                      f2 g92 k
                                                    | Cons1(t1,t2) ->
                                                      match t2 with
                                                      | Cons1(t3,t4) ->
                                                        let k = [f2], fun [f2] arg ->
                                                          let k = [f2], fun [f2] arg ->
                                                            let k = [], fun [] arg ->
                                                              let k = [], fun [] arg ->
                                                                let t1 = PRIM_PutChar(g97) in
                                                                k t1 in
                                                              g23 arg k in
                                                            f2 g96 k in
                                                          g23 arg k in
                                                        f2 g95 k
                                                      | Nil0 ->
                                                        let k = [f2], fun [f2] arg ->
                                                          let k = [f2,arg], fun [f2,f3] arg ->
                                                            let k = [f2], fun [f2] arg ->
                                                              match arg with
                                                              | None1 ->
                                                                let k = [f2], fun [f2] arg ->
                                                                  let k = [f2], fun [f2] arg ->
                                                                    let k = [], fun [] arg ->
                                                                      let k = [], fun [] arg ->
                                                                        let t1 = PRIM_PutChar(g113) in
                                                                        k t1 in
                                                                      g23 arg k in
                                                                    f2 g112 k in
                                                                  g23 arg k in
                                                                f2 g111 k
                                                              | Some0(t1) ->
                                                                let k = [f2,t1], fun [f2,f3] arg ->
                                                                  let t1 = PRIM_EqInt(f3,g119) in
                                                                  let k = [f2,arg], fun [f2,f3] arg ->
                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                      let k = [f3], fun [f2] arg ->
                                                                        let k = [f2], fun [f2] arg ->
                                                                          let t1 = PRIM_EqInt(f2,g130) in
                                                                          let k = [], fun [] arg ->
                                                                            let k = [], fun [] arg ->
                                                                              let t1 = PRIM_PutChar(g135) in
                                                                              k t1 in
                                                                            g23 arg k in
                                                                          match t1 with
                                                                          | true1 -> k g133
                                                                          | false0 ->
                                                                            let k = [f2], fun [f2] arg -> arg f2 k in
                                                                            g125 g134 k in
                                                                        g23 arg k in
                                                                      f2 g124 k in
                                                                    g23 arg k in
                                                                  match t1 with
                                                                  | true1 -> k g122
                                                                  | false0 ->
                                                                    let k = [f3], fun [f2] arg -> arg f2 k in
                                                                    g114 g123 k in
                                                                g60 t1 k in
                                                            arg f3 k in
                                                          g98 g110 k in
                                                        f2 t1 k in
                                                  g23 arg k in
                                                f3 g91 k
                                              | false0 ->
                                                let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                  let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                    let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                      let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                        let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                          match arg with
                                                          | true1 ->
                                                            let k = [f3,f7], fun [f2,f3] arg ->
                                                              let k = [f2,f3], fun [f2,f3] arg ->
                                                                match f3 with
                                                                | Nil0 ->
                                                                  let k = [f2], fun [f2] arg ->
                                                                    let k = [f2], fun [f2] arg ->
                                                                      let k = [], fun [] arg ->
                                                                        let k = [], fun [] arg ->
                                                                          let t1 = PRIM_PutChar(g141) in
                                                                          k t1 in
                                                                        g23 arg k in
                                                                      f2 g140 k in
                                                                    g23 arg k in
                                                                  f2 g139 k
                                                                | Cons1(t1,t2) ->
                                                                  match t2 with
                                                                  | Cons1(t3,t4) ->
                                                                    let k = [f2], fun [f2] arg ->
                                                                      let k = [f2], fun [f2] arg ->
                                                                        let k = [], fun [] arg ->
                                                                          let k = [], fun [] arg ->
                                                                            let t1 = PRIM_PutChar(g144) in
                                                                            k t1 in
                                                                          g23 arg k in
                                                                        f2 g143 k in
                                                                      g23 arg k in
                                                                    f2 g142 k
                                                                  | Nil0 ->
                                                                    let k = [f2], fun [f2] arg ->
                                                                      let k = [f2,arg], fun [f2,f3] arg ->
                                                                        let k = [f2], fun [f2] arg ->
                                                                          match arg with
                                                                          | None1 ->
                                                                            let k = [f2], fun [f2] arg ->
                                                                              let k = [f2], fun [f2] arg ->
                                                                                let k = [], fun [] arg ->
                                                                                  let k = [], fun [] arg ->
                                                                                    let t1 = PRIM_PutChar(g160) in
                                                                                    k t1 in
                                                                                  g23 arg k in
                                                                                f2 g159 k in
                                                                              g23 arg k in
                                                                            f2 g158 k
                                                                          | Some0(t1) ->
                                                                            let k = [f2,t1], fun [f2,f3] arg ->
                                                                              let t1 = PRIM_EqInt(f3,g166) in
                                                                              let k = [f2,arg], fun [f2,f3] arg ->
                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                  let k = [f3], fun [f2] arg ->
                                                                                    let k = [f2], fun [f2] arg ->
                                                                                      let t1 = PRIM_EqInt(f2,g177) in
                                                                                      let k = [], fun [] arg ->
                                                                                        let k = [], fun [] arg ->
                                                                                          let t1 = PRIM_PutChar(g182) in
                                                                                          k t1 in
                                                                                        g23 arg k in
                                                                                      match t1 with
                                                                                      | true1 -> k g180
                                                                                      | false0 ->
                                                                                        let k = [f2], fun [f2] arg -> arg f2 k in
                                                                                        g172 g181 k in
                                                                                    g23 arg k in
                                                                                  f2 g171 k in
                                                                                g23 arg k in
                                                                              match t1 with
                                                                              | true1 -> k g169
                                                                              | false0 ->
                                                                                let k = [f3], fun [f2] arg -> arg f2 k in
                                                                                g161 g170 k in
                                                                            g64 t1 k in
                                                                        arg f3 k in
                                                                      g145 g157 k in
                                                                    f2 t1 k in
                                                              g23 arg k in
                                                            f3 g138 k
                                                          | false0 ->
                                                            let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                              let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                  let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                      match arg with
                                                                      | true1 ->
                                                                        match f6 with
                                                                        | Cons1(t1,t2) ->
                                                                          let k = [f3], fun [f2] arg ->
                                                                            let k = [f2], fun [f2] arg ->
                                                                              let k = [], fun [] arg ->
                                                                                let k = [], fun [] arg ->
                                                                                  let t1 = PRIM_PutChar(g187) in
                                                                                  k t1 in
                                                                                g23 arg k in
                                                                              f2 g186 k in
                                                                            g23 arg k in
                                                                          f3 g185 k
                                                                        | Nil0 ->
                                                                          let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                              let t1 = [f2,f3,f4], fun [f1,f2,f3] me arg k ->
                                                                                let k = [f1,f2,f3,me], fun [f2,f3,f4,f5] arg ->
                                                                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                    let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                      let k = [f2,f3,f5,f6,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                        let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                          let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                              match arg with
                                                                                              | true1 -> k g191
                                                                                              | false0 ->
                                                                                                let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                  let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                      let k = [f3,f4], fun [f2,f3] arg ->
                                                                                                        let k = [f3], fun [f2] arg ->
                                                                                                          let k = [f2], fun [f2] arg ->
                                                                                                            let t1 = PRIM_PutChar(g193) in
                                                                                                            f2 g194 k in
                                                                                                          g23 arg k in
                                                                                                        f2 arg k in
                                                                                                      f2 arg k in
                                                                                                    arg f5 k in
                                                                                                  g20 g192 k in
                                                                                                f3 f5 k in
                                                                                            arg f6 k in
                                                                                          arg f6 k in
                                                                                        g15 g190 k in
                                                                                      f3 f4 k in
                                                                                    f3 arg k in
                                                                                  f2 arg k in
                                                                                g31 g189 k in
                                                                              t1 g195 k in
                                                                            g23 arg k in
                                                                          f3 g188 k
                                                                      | false0 ->
                                                                        let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                          let t1 = PRIM_StringLength(f4) in
                                                                          let k = [f2,f3,arg,t1], fun [f2,f3,f4,f5] arg ->
                                                                            let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                              let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                    let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                      let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                        let k = [f3,f4], fun [f2,f3] arg ->
                                                                                          let k = [f2,f3], fun [f2,f3] arg ->
                                                                                            let k = [f2,f3], fun [f2,f3] arg ->
                                                                                              let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                  let t1 = PRIM_EqInt(f3,g206) in
                                                                                                  let k = [f2], fun [f2] arg ->
                                                                                                    let k = [f2], fun [f2] arg ->
                                                                                                      let k = [], fun [] arg ->
                                                                                                        let k = [], fun [] arg ->
                                                                                                          let t1 = PRIM_PutChar(g212) in
                                                                                                          k t1 in
                                                                                                        g23 arg k in
                                                                                                      f2 g211 k in
                                                                                                    g23 arg k in
                                                                                                  match t1 with
                                                                                                  | true1 -> k g209
                                                                                                  | false0 ->
                                                                                                    let k = [f3], fun [f2] arg -> arg f2 k in
                                                                                                    g201 g210 k in
                                                                                                g23 arg k in
                                                                                              f2 g200 k in
                                                                                            g23 arg k in
                                                                                          f2 arg k in
                                                                                        f2 arg k in
                                                                                      f5 arg k in
                                                                                    f3 f5 k in
                                                                                  g5 arg k in
                                                                                f3 g199 k in
                                                                              f2 arg k in
                                                                            f4 arg k in
                                                                          f3 f4 k in
                                                                        g21 g198 k in
                                                                    arg f7 k in
                                                                  arg f7 k in
                                                                g15 g184 k in
                                                              f3 g183 k in
                                                            f3 f6 k in
                                                        arg f8 k in
                                                      arg f8 k in
                                                    g15 g137 k in
                                                  f3 g136 k in
                                                f3 f6 k in
                                            arg f8 k in
                                          arg f8 k in
                                        g15 g90 k in
                                      f3 g89 k in
                                    f3 t1 k in
                                arg f7 k in
                              arg g87 k in
                            f5 g86 k in
                          f3 f7 k in
                      arg f8 k in
                    arg f8 k in
                  g15 g84 k in
                f3 f4 k in
              f3 arg k in
            f2 arg k in
          g31 g83 k in
        g23 g82 k in
      let k = [t2], fun [f2] arg ->
        let k = [f2], fun [f2] arg -> f2 g215 k in
        g23 arg k in
      f3 g214 k in
    f2 g72 k in
  g1 g14 k in
g1 g9 k
