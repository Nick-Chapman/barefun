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
let g22 = fun arg k ->
  let t1 = PRIM_AddInt(g21,arg) in
  k t1 in
let g19 = fun arg k ->
  match arg with
  | Nil0 -> k g20
  | Cons1(t1,t2) ->
    let k = [], fun [] arg -> g22 arg k in
    g19 t2 k in
let g23 = Unit0 in
let g25 = 2 in
let g26 = 1 in
let g27 = 2 in
let g24 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g25) in
  match t1 with
  | true1 -> k arg
  | false0 ->
    let t2 = PRIM_SubInt(arg,g26) in
    let k = [arg], fun [f1] arg ->
      let t1 = [arg], fun [f1] arg k ->
        let t1 = PRIM_AddInt(f1,arg) in
        k t1 in
      let t2 = PRIM_SubInt(f1,g27) in
      let k = [t1], fun [f1] arg -> f1 arg k in
      g24 t2 k in
    g24 t2 k in
let g29 = 2 in
let g30 = false0 in
let g31 = true1 in
let g32 = 1 in
let g33 = 1 in
let g28 = fun arg k ->
  let t1 = PRIM_LessInt(arg,g29) in
  let k = [arg], fun [f1] arg ->
    match arg with
    | true1 ->
      let t1 = PRIM_SubInt(f1,g32) in
      let k = [f1], fun [f1] arg ->
        let t1 = [arg], fun [f1] arg k ->
          let t1 = PRIM_MulInt(f1,arg) in
          k t1 in
        t1 f1 k in
      g28 t1 k
    | false0 -> k g33 in
  match t1 with
  | true1 -> k g30
  | false0 -> k g31 in
let g34 = 4 in
let g35 = PRIM_CharChr(g34) in
let g36 = fun arg k ->
  let t1 = Cons1[g35,arg] in
  k t1 in
let g37 = Nil0 in
let g38 = '>' in
let g39 = ' ' in
let g40 = Nil0 in
let g41 = Cons1[g39,g40] in
let g42 = Cons1[g38,g41] in
let g44 = 4 in
let g45 = PRIM_CharChr(g44) in
let g46 = Unit0 in
let g47 = '\n' in
let g49 = '\n' in
let g50 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g50 t3 k in
  k t1 in
let g51 = Nil0 in
let g53 = '\n' in
let g54 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g54 t3 k in
  k t1 in
let g55 = Nil0 in
let g56 = 127 in
let g57 = 127 in
let g58 = false0 in
let g59 = true1 in
let g60 = 26 in
let g62 = 8 in
let g63 = PRIM_CharChr(g62) in
let g64 = ' ' in
let g65 = Unit0 in
let g67 = 8 in
let g68 = PRIM_CharChr(g67) in
let g69 = ' ' in
let g70 = Nil0 in
let g71 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g72 = Unit0 in
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
let g76 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g76 t3 k in
  k t1 in
let g77 = Nil0 in
let g78 = ' ' in
let g79 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g79 t3 k in
  k t1 in
let g80 = Nil0 in
let g81 = Nil0 in
let g73 = fun arg k ->
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
              g76 g77 k in
            t1 f1 k in
          arg f2 k in
        g74 g75 k
      | Cons1(t1,t2) ->
        let t3 = PRIM_EqChar(t1,g78) in
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
                  arg g81 k in
                g73 arg k in
              t1 f1 k in
            arg f2 k in
          g79 g80 k
        | false0 ->
          let k = [f2,t1,t2], fun [f1,f2,f3] arg ->
            let t1 = Cons1[f2,f1] in
            let k = [f3], fun [f1] arg -> arg f1 k in
            arg t1 k in
          g73 f1 k in
    k t1 in
  k t1 in
let g82 = Nil0 in
let g83 = Nil0 in
let g84 = Unit0 in
let g85 = "fib" in
let g86 = PRIM_Explode(g85) in
let g87 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g88 = "fib: " in
let g89 = PRIM_Explode(g88) in
let g90 = "expected an argument" in
let g91 = "ERROR: " in
let g92 = PRIM_Explode(g91) in
let g93 = PRIM_Explode(g90) in
let g95 = '\n' in
let g96 = "expected exactly one argument" in
let g97 = "ERROR: " in
let g98 = PRIM_Explode(g97) in
let g99 = PRIM_Explode(g96) in
let g101 = '\n' in
let g103 = '0' in
let g104 = PRIM_CharOrd(g103) in
let g105 = 0 in
let g106 = false0 in
let g107 = true1 in
let g108 = 9 in
let g109 = false0 in
let g110 = true1 in
let g111 = None1 in
let g112 = None1 in
let g113 = None1 in
let g114 = 10 in
let g115 = fun arg k ->
  let t1 = PRIM_MulInt(g114,arg) in
  k t1 in
let g102 = fun arg k ->
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
        let t1 = PRIM_LessInt(arg,g105) in
        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
          let k = [f1,f2], fun [f1,f2] arg ->
            match arg with
            | None1 -> k g113
            | Some0(t1) ->
              let k = [f2,t1], fun [f1,f2] arg ->
                let t1 = [arg], fun [f1] arg k ->
                  let t1 = PRIM_AddInt(f1,arg) in
                  k t1 in
                let k = [f1], fun [f1] arg ->
                  let k = [f1], fun [f1] arg -> arg f1 k in
                  g102 arg k in
                t1 f2 k in
              g115 f1 k in
          match arg with
          | true1 ->
            let t1 = PRIM_LessInt(g108,f3) in
            let k = [f3], fun [f1] arg ->
              match arg with
              | true1 ->
                let t1 = Some0[f1] in
                k t1
              | false0 -> k g111 in
            match t1 with
            | true1 -> k g109
            | false0 -> k g110
          | false0 -> k g112 in
        match t1 with
        | true1 -> k g106
        | false0 -> k g107 in
      t4 g104 k in
  k t1 in
let g116 = 0 in
let g117 = "expected arg1 to be numeric" in
let g118 = "ERROR: " in
let g119 = PRIM_Explode(g118) in
let g120 = PRIM_Explode(g117) in
let g122 = '\n' in
let g123 = '0' in
let g124 = PRIM_CharOrd(g123) in
let g126 = 0 in
let g127 = 10 in
let g128 = 10 in
let g125 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g126) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g127) in
      let t3 = PRIM_AddInt(g124,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g128) in
          arg t1 k in
        g125 arg k in
      t5 f1 k in
  k t1 in
let g129 = 0 in
let g130 = '0' in
let g131 = fun arg k ->
  let t1 = Cons1[g130,arg] in
  k t1 in
let g132 = Nil0 in
let g133 = Nil0 in
let g134 = " --> " in
let g135 = PRIM_Explode(g134) in
let g136 = '0' in
let g137 = PRIM_CharOrd(g136) in
let g139 = 0 in
let g140 = 10 in
let g141 = 10 in
let g138 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g139) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g140) in
      let t3 = PRIM_AddInt(g137,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g141) in
          arg t1 k in
        g138 arg k in
      t5 f1 k in
  k t1 in
let g142 = 0 in
let g143 = '0' in
let g144 = fun arg k ->
  let t1 = Cons1[g143,arg] in
  k t1 in
let g145 = Nil0 in
let g146 = Nil0 in
let g148 = '\n' in
let g149 = "fact" in
let g150 = PRIM_Explode(g149) in
let g151 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g152 = "fact: " in
let g153 = PRIM_Explode(g152) in
let g154 = "expected an argument" in
let g155 = "ERROR: " in
let g156 = PRIM_Explode(g155) in
let g157 = PRIM_Explode(g154) in
let g159 = '\n' in
let g160 = "expected exactly one argument" in
let g161 = "ERROR: " in
let g162 = PRIM_Explode(g161) in
let g163 = PRIM_Explode(g160) in
let g165 = '\n' in
let g167 = '0' in
let g168 = PRIM_CharOrd(g167) in
let g169 = 0 in
let g170 = false0 in
let g171 = true1 in
let g172 = 9 in
let g173 = false0 in
let g174 = true1 in
let g175 = None1 in
let g176 = None1 in
let g177 = None1 in
let g178 = 10 in
let g179 = fun arg k ->
  let t1 = PRIM_MulInt(g178,arg) in
  k t1 in
let g166 = fun arg k ->
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
        let t1 = PRIM_LessInt(arg,g169) in
        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
          let k = [f1,f2], fun [f1,f2] arg ->
            match arg with
            | None1 -> k g177
            | Some0(t1) ->
              let k = [f2,t1], fun [f1,f2] arg ->
                let t1 = [arg], fun [f1] arg k ->
                  let t1 = PRIM_AddInt(f1,arg) in
                  k t1 in
                let k = [f1], fun [f1] arg ->
                  let k = [f1], fun [f1] arg -> arg f1 k in
                  g166 arg k in
                t1 f2 k in
              g179 f1 k in
          match arg with
          | true1 ->
            let t1 = PRIM_LessInt(g172,f3) in
            let k = [f3], fun [f1] arg ->
              match arg with
              | true1 ->
                let t1 = Some0[f1] in
                k t1
              | false0 -> k g175 in
            match t1 with
            | true1 -> k g173
            | false0 -> k g174
          | false0 -> k g176 in
        match t1 with
        | true1 -> k g170
        | false0 -> k g171 in
      t4 g168 k in
  k t1 in
let g180 = 0 in
let g181 = "expected arg1 to be numeric" in
let g182 = "ERROR: " in
let g183 = PRIM_Explode(g182) in
let g184 = PRIM_Explode(g181) in
let g186 = '\n' in
let g187 = '0' in
let g188 = PRIM_CharOrd(g187) in
let g190 = 0 in
let g191 = 10 in
let g192 = 10 in
let g189 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g190) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g191) in
      let t3 = PRIM_AddInt(g188,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g192) in
          arg t1 k in
        g189 arg k in
      t5 f1 k in
  k t1 in
let g193 = 0 in
let g194 = '0' in
let g195 = fun arg k ->
  let t1 = Cons1[g194,arg] in
  k t1 in
let g196 = Nil0 in
let g197 = Nil0 in
let g198 = " --> " in
let g199 = PRIM_Explode(g198) in
let g200 = '0' in
let g201 = PRIM_CharOrd(g200) in
let g203 = 0 in
let g204 = 10 in
let g205 = 10 in
let g202 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g203) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g204) in
      let t3 = PRIM_AddInt(g201,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g205) in
          arg t1 k in
        g202 arg k in
      t5 f1 k in
  k t1 in
let g206 = 0 in
let g207 = '0' in
let g208 = fun arg k ->
  let t1 = Cons1[g207,arg] in
  k t1 in
let g209 = Nil0 in
let g210 = Nil0 in
let g212 = '\n' in
let g213 = "rev" in
let g214 = PRIM_Explode(g213) in
let g215 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g216 = "rev: expected no arguments" in
let g217 = "ERROR: " in
let g218 = PRIM_Explode(g217) in
let g219 = PRIM_Explode(g216) in
let g221 = '\n' in
let g222 = "(reverse typed lines until ^D)\n" in
let g223 = PRIM_Explode(g222) in
let g226 = 4 in
let g227 = PRIM_CharChr(g226) in
let g228 = Unit0 in
let g229 = '\n' in
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
let g235 = '\n' in
let g236 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g236 t3 k in
  k t1 in
let g237 = Nil0 in
let g238 = 127 in
let g239 = 127 in
let g240 = false0 in
let g241 = true1 in
let g242 = 26 in
let g244 = 8 in
let g245 = PRIM_CharChr(g244) in
let g246 = ' ' in
let g247 = Unit0 in
let g249 = 8 in
let g250 = PRIM_CharChr(g249) in
let g251 = ' ' in
let g252 = Nil0 in
let g253 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g254 = Unit0 in
let g255 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f1] arg -> arg f1 k in
      g255 t3 k in
  k t1 in
let g256 = Nil0 in
let g258 = '\n' in
let g259 = Unit0 in
let g260 = Unit0 in
let g261 = 'o' in
let g262 = '*' in
let g263 = fun arg k ->
  let t1 = PRIM_EqChar(arg,g261) in
  match t1 with
  | true1 -> k g262
  | false0 -> k arg in
let g264 = "You wrote: \"" in
let g265 = PRIM_Explode(g264) in
let g266 = "\" (" in
let g267 = PRIM_Explode(g266) in
let g268 = '0' in
let g269 = PRIM_CharOrd(g268) in
let g271 = 0 in
let g272 = 10 in
let g273 = 10 in
let g270 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,g271) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,g272) in
      let t3 = PRIM_AddInt(g269,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = [t4], fun [f1] arg k ->
        let t1 = Cons1[f1,arg] in
        k t1 in
      let k = [arg], fun [f1] arg ->
        let k = [f1], fun [f1] arg ->
          let t1 = PRIM_DivInt(f1,g273) in
          arg t1 k in
        g270 arg k in
      t5 f1 k in
  k t1 in
let g274 = 0 in
let g275 = '0' in
let g276 = fun arg k ->
  let t1 = Cons1[g275,arg] in
  k t1 in
let g277 = Nil0 in
let g278 = Nil0 in
let g279 = " chars)" in
let g280 = PRIM_Explode(g279) in
let g282 = '\n' in
let g283 = Unit0 in
let g285 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g286 = PRIM_Explode(g285) in
let g287 = Unit0 in
let g1 = g1 in
let k = [], fun [] arg ->
  let t1 = [arg], fun [f1] me arg k ->
    match arg with
    | Nil0 -> k g23
    | Cons1(t1,t2) ->
      let k = [me,t2], fun [f1,f2] arg -> f1 f2 k in
      f1 t1 k in
  let k = [arg,t1], fun [f1,f2] arg ->
    let t1 = [f1,f2,arg], fun [f1,f2,f3] me arg k ->
      let k = [f1,f2,f3,me], fun [f1,f2,f3,f4] arg ->
        let t1 = [f1], fun [f1] me arg k ->
          let t1 = PRIM_GetChar(g46) in
          let t2 = PRIM_CharOrd(t1) in
          let t3 = PRIM_EqChar(t1,g47) in
          match t3 with
          | true1 ->
            let k = [arg], fun [f1] arg ->
              let k = [f1], fun [f1] arg -> arg f1 k in
              g50 g51 k in
            f1 g49 k
          | false0 ->
            let t4 = PRIM_EqChar(t1,g45) in
            match t4 with
            | true1 ->
              let k = [f1,arg], fun [f1,f2] arg ->
                let k = [f2], fun [f1] arg ->
                  let t1 = Cons1[g45,f1] in
                  let k = [t1], fun [f1] arg -> arg f1 k in
                  g54 g55 k in
                f1 g53 k in
              f1 t1 k
            | false0 ->
              let t5 = PRIM_LessInt(g56,t2) in
              match t5 with
              | true1 -> me arg k
              | false0 ->
                let t6 = PRIM_EqInt(t2,g57) in
                match t6 with
                | true1 ->
                  match arg with
                  | Nil0 -> me arg k
                  | Cons1(t7,t8) ->
                    let t9 = PRIM_CharOrd(t7) in
                    let t10 = [t9], fun [f1] arg k ->
                      let t1 = PRIM_LessInt(arg,f1) in
                      match t1 with
                      | true1 -> k g58
                      | false0 -> k g59 in
                    let k = [f1,me,t8], fun [f1,f2,f3] arg ->
                      let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                            let k = [f2,f3], fun [f1,f2] arg -> f1 f2 k in
                            f1 g68 k in
                          f1 g69 k in
                        f1 g68 k in
                      match arg with
                      | true1 ->
                        let k = [f1], fun [f1] arg ->
                          let k = [f1], fun [f1] arg -> f1 g63 k in
                          f1 g64 k in
                        f1 g63 k
                      | false0 -> k g65 in
                    t10 g60 k
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
                | true1 -> k g72
                | false0 ->
                  let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                    let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                      let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                        let k = [f4], fun [f1] arg -> f1 g283 k in
                        match arg with
                        | Nil0 -> k g84
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
                                        let k = [f1], fun [f1] arg -> f1 g95 k in
                                        f2 g93 k in
                                      f2 g92 k
                                    | Cons1(t1,t2) ->
                                      match t2 with
                                      | Cons1(t3,t4) ->
                                        let k = [f1,f2], fun [f1,f2] arg ->
                                          let k = [f1], fun [f1] arg -> f1 g101 k in
                                          f2 g99 k in
                                        f2 g98 k
                                      | Nil0 ->
                                        let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                          let k = [f1,f2], fun [f1,f2] arg ->
                                            match arg with
                                            | None1 ->
                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                let k = [f1], fun [f1] arg -> f1 g122 k in
                                                f2 g120 k in
                                              f2 g119 k
                                            | Some0(t1) ->
                                              let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                let t1 = PRIM_EqInt(f3,g129) in
                                                let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                  let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                      let t1 = PRIM_EqInt(f3,g142) in
                                                      let k = [f1,f2], fun [f1,f2] arg ->
                                                        let k = [f1], fun [f1] arg -> f1 g148 k in
                                                        f2 arg k in
                                                      match t1 with
                                                      | true1 -> g144 g145 k
                                                      | false0 ->
                                                        let k = [f3], fun [f1] arg -> arg f1 k in
                                                        g138 g146 k in
                                                    f2 g135 k in
                                                  f2 arg k in
                                                match t1 with
                                                | true1 -> g131 g132 k
                                                | false0 ->
                                                  let k = [f3], fun [f1] arg -> arg f1 k in
                                                  g125 g133 k in
                                              g24 t1 k in
                                          arg f3 k in
                                        g102 g116 k in
                                  f2 g89 k
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
                                                let k = [f1], fun [f1] arg -> f1 g159 k in
                                                f2 g157 k in
                                              f2 g156 k
                                            | Cons1(t1,t2) ->
                                              match t2 with
                                              | Cons1(t3,t4) ->
                                                let k = [f1,f2], fun [f1,f2] arg ->
                                                  let k = [f1], fun [f1] arg -> f1 g165 k in
                                                  f2 g163 k in
                                                f2 g162 k
                                              | Nil0 ->
                                                let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                  let k = [f1,f2], fun [f1,f2] arg ->
                                                    match arg with
                                                    | None1 ->
                                                      let k = [f1,f2], fun [f1,f2] arg ->
                                                        let k = [f1], fun [f1] arg -> f1 g186 k in
                                                        f2 g184 k in
                                                      f2 g183 k
                                                    | Some0(t1) ->
                                                      let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
                                                        let t1 = PRIM_EqInt(f3,g193) in
                                                        let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                                                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                              let t1 = PRIM_EqInt(f3,g206) in
                                                              let k = [f1,f2], fun [f1,f2] arg ->
                                                                let k = [f1], fun [f1] arg -> f1 g212 k in
                                                                f2 arg k in
                                                              match t1 with
                                                              | true1 -> g208 g209 k
                                                              | false0 ->
                                                                let k = [f3], fun [f1] arg -> arg f1 k in
                                                                g202 g210 k in
                                                            f2 g199 k in
                                                          f2 arg k in
                                                        match t1 with
                                                        | true1 -> g195 g196 k
                                                        | false0 ->
                                                          let k = [f3], fun [f1] arg -> arg f1 k in
                                                          g189 g197 k in
                                                      g28 t1 k in
                                                  arg f3 k in
                                                g166 g180 k in
                                          f2 g153 k
                                        | false0 ->
                                          let k = [f1,f2,f3,f4,f5,f6], fun [f1,f2,f3,f4,f5,f6] arg ->
                                            let k = [f1,f2,f3,f4,f6], fun [f1,f2,f3,f4,f5] arg ->
                                              let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                                match arg with
                                                | true1 ->
                                                  match f5 with
                                                  | Cons1(t1,t2) ->
                                                    let k = [f1,f2], fun [f1,f2] arg ->
                                                      let k = [f1], fun [f1] arg -> f1 g221 k in
                                                      f2 g219 k in
                                                    f2 g218 k
                                                  | Nil0 ->
                                                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                      let t1 = [f1,f2,f3], fun [f1,f2,f3] me arg k ->
                                                        let t1 = [f1], fun [f1] me arg k ->
                                                          let t1 = PRIM_GetChar(g228) in
                                                          let t2 = PRIM_CharOrd(t1) in
                                                          let t3 = PRIM_EqChar(t1,g229) in
                                                          match t3 with
                                                          | true1 ->
                                                            let k = [arg], fun [f1] arg ->
                                                              let k = [f1], fun [f1] arg -> arg f1 k in
                                                              g232 g233 k in
                                                            f1 g231 k
                                                          | false0 ->
                                                            let t4 = PRIM_EqChar(t1,g227) in
                                                            match t4 with
                                                            | true1 ->
                                                              let k = [f1,arg], fun [f1,f2] arg ->
                                                                let k = [f2], fun [f1] arg ->
                                                                  let t1 = Cons1[g227,f1] in
                                                                  let k = [t1], fun [f1] arg -> arg f1 k in
                                                                  g236 g237 k in
                                                                f1 g235 k in
                                                              f1 t1 k
                                                            | false0 ->
                                                              let t5 = PRIM_LessInt(g238,t2) in
                                                              match t5 with
                                                              | true1 -> me arg k
                                                              | false0 ->
                                                                let t6 = PRIM_EqInt(t2,g239) in
                                                                match t6 with
                                                                | true1 ->
                                                                  match arg with
                                                                  | Nil0 -> me arg k
                                                                  | Cons1(t7,t8) ->
                                                                    let t9 = PRIM_CharOrd(t7) in
                                                                    let t10 = [t9], fun [f1] arg k ->
                                                                      let t1 = PRIM_LessInt(arg,f1) in
                                                                      match t1 with
                                                                      | true1 -> k g240
                                                                      | false0 -> k g241 in
                                                                    let k = [f1,me,t8], fun [f1,f2,f3] arg ->
                                                                      let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                            let k = [f2,f3], fun [f1,f2] arg -> f1 f2 k in
                                                                            f1 g250 k in
                                                                          f1 g251 k in
                                                                        f1 g250 k in
                                                                      match arg with
                                                                      | true1 ->
                                                                        let k = [f1], fun [f1] arg ->
                                                                          let k = [f1], fun [f1] arg -> f1 g245 k in
                                                                          f1 g246 k in
                                                                        f1 g245 k
                                                                      | false0 -> k g247 in
                                                                    t10 g242 k
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
                                                                | true1 -> k g254
                                                                | false0 ->
                                                                  let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                                                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                      let k = [f1,f3], fun [f1,f2] arg ->
                                                                        let k = [f2], fun [f1] arg -> f1 g259 k in
                                                                        f1 g258 k in
                                                                      f2 arg k in
                                                                    arg f4 k in
                                                                  g255 g256 k in
                                                              arg f3 k in
                                                            arg f5 k in
                                                          g11 g253 k in
                                                        t1 g252 k in
                                                      t1 g260 k in
                                                    f2 g223 k
                                                | false0 ->
                                                  let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
                                                    let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
                                                      let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
                                                        let k = [f1,f2,arg,f5], fun [f1,f2,f3,f4] arg ->
                                                          let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
                                                            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                              let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                                                let t1 = PRIM_EqInt(f3,g274) in
                                                                let k = [f1,f2], fun [f1,f2] arg ->
                                                                  let k = [f1,f2], fun [f1,f2] arg ->
                                                                    let k = [f1], fun [f1] arg -> f1 g282 k in
                                                                    f2 g280 k in
                                                                  f2 arg k in
                                                                match t1 with
                                                                | true1 -> g276 g277 k
                                                                | false0 ->
                                                                  let k = [f3], fun [f1] arg -> arg f1 k in
                                                                  g270 g278 k in
                                                              f2 g267 k in
                                                            f2 arg k in
                                                          f3 arg k in
                                                        f4 f3 k in
                                                      g16 g265 k in
                                                    g19 f3 k in
                                                  g17 g263 k in
                                              arg g214 k in
                                            arg f5 k in
                                          g11 g215 k in
                                      arg g150 k in
                                    arg f5 k in
                                  g11 g151 k in
                              arg g86 k in
                            arg f5 k in
                          g11 g87 k in
                      arg f5 k in
                    arg g83 k in
                  g73 g82 k in
              arg f3 k in
            arg f5 k in
          g11 g71 k in
        t1 g70 k in
      f2 g42 k in
    let k = [t1], fun [f1] arg -> f1 g287 k in
    f2 g286 k in
  g36 g37 k in
g1 g10 k
