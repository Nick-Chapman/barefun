(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k -> f1 arg k in
  k t1 in
let g2 = fun arg k ->
  match arg with
  | Nil0 -> k 0
  | Cons1(t1,t2) ->
    let k = [], fun [] arg ->
      let t1 = PRIM_AddInt(1,arg) in
      k t1 in
    g2 t2 k in
let g3 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g3 t3 k in
  k t1 in
let g4 = Unit0 in
let g5 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g4
        | Cons1(t1,t2) ->
          let t3 = PRIM_SetBytes(f1,f2,t1) in
          let t4 = PRIM_AddInt(f2,1) in
          let k = [t2], fun [f2] arg -> arg f2 k in
          f3 t4 k in
      k t1 in
    let k = [f2,t1], fun [f2,f3] arg ->
      let k = [f3], fun [f2] arg ->
        let t1 = PRIM_FreezeBytes(f2) in
        k t1 in
      arg f2 k in
    t2 0 k in
  g2 arg k in
let g6 = Nil0 in
let g7 = fun arg k ->
  let t1 = [arg], fun [f1] me arg k ->
    let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
      let t1 = PRIM_LessInt(arg,0) in
      match t1 with
      | true1 -> k f2
      | false0 ->
        let t2 = PRIM_StringIndex(f1,arg) in
        let t3 = Cons1[t2,f2] in
        let k = [arg], fun [f2] arg ->
          let t1 = PRIM_SubInt(f2,1) in
          arg t1 k in
        f3 t3 k in
    k t1 in
  let t2 = PRIM_StringLength(arg) in
  let k = [t2], fun [f2] arg ->
    let t1 = PRIM_SubInt(f2,1) in
    arg t1 k in
  t1 g6 k in
let g9 = Unit0 in
let g8 = fun arg k ->
  match arg with
  | Nil0 -> k g9
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,8) in
    let k = [t2], fun [f2] arg -> g8 f2 k in
    match t4 with
    | true1 ->
      let t5 = PRIM_PutChar(t1) in
      k t5
    | false0 ->
      let t5 = PRIM_EqChar(t1,'\n') in
      match t5 with
      | true1 ->
        let t6 = PRIM_PutChar(t1) in
        k t6
      | false0 ->
        let t6 = PRIM_LessInt(26,t3) in
        match t6 with
        | true1 ->
          let t7 = PRIM_PutChar(t1) in
          k t7
        | false0 ->
          let t7 = PRIM_PutChar('^') in
          let t8 = PRIM_AddInt(65,t3) in
          let t9 = PRIM_SubInt(t8,1) in
          let t10 = PRIM_CharChr(t9) in
          let t11 = PRIM_PutChar(t10) in
          k t11 in
let g11 = Nil0 in
let g12 = "   **SLOW**" in
let g13 = Nil0 in
let g14 = "read_sector " in
let g15 = Nil0 in
let g16 = "\n" in
let g17 = Nil0 in
let g18 = "trace: " in
let g19 = Nil0 in
let g20 = false0 in
let g21 = true1 in
let g22 = Unit0 in
let g23 = false0 in
let g24 = Unit0 in
let g25 = Nil0 in
let g26 = true1 in
let g27 = false0 in
let g28 = true1 in
let g29 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g29 t5 k in
  k t1 in
let g30 = Nil0 in
let g31 = Nil0 in
let g32 = "write_block " in
let g33 = Nil0 in
let g34 = "\n" in
let g35 = Nil0 in
let g36 = "error: " in
let g37 = Nil0 in
let g38 = Unit0 in
let g39 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g39 t5 k in
  k t1 in
let g40 = Nil0 in
let g41 = Nil0 in
let g42 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g42 t5 k in
  k t1 in
let g43 = Nil0 in
let g44 = Nil0 in
let g45 = "]" in
let g46 = Nil0 in
let g47 = "[" in
let g48 = Nil0 in
let g49 = Nil0 in
let g50 = "write_block " in
let g51 = Nil0 in
let g52 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g52 t5 k in
  k t1 in
let g53 = Nil0 in
let g54 = Nil0 in
let g55 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g55 t5 k in
  k t1 in
let g56 = Nil0 in
let g57 = Nil0 in
let g58 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g58 t5 k in
  k t1 in
let g59 = Nil0 in
let g60 = ", len=" in
let g61 = Nil0 in
let g62 = Nil0 in
let g63 = ", offset=" in
let g64 = Nil0 in
let g65 = Nil0 in
let g66 = "update_sectorC1 seci=" in
let g67 = Nil0 in
let g68 = false0 in
let g69 = true1 in
let g70 = Unit0 in
let g71 = true1 in
let g72 = true1 in
let g73 = false0 in
let g74 = true1 in
let g75 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g75 t5 k in
  k t1 in
let g76 = Nil0 in
let g77 = Nil0 in
let g78 = "write_sector " in
let g79 = Nil0 in
let g80 = "\n" in
let g81 = Nil0 in
let g82 = "error: " in
let g83 = Nil0 in
let g84 = Unit0 in
let g85 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g85 t5 k in
  k t1 in
let g86 = Nil0 in
let g87 = Nil0 in
let g88 = "   **SLOW**" in
let g89 = Nil0 in
let g90 = "write_sector " in
let g91 = Nil0 in
let g92 = "\n" in
let g93 = Nil0 in
let g94 = "trace: " in
let g95 = Nil0 in
let g96 = false0 in
let g97 = true1 in
let g98 = Unit0 in
let g99 = Unit0 in
let g100 = true1 in
let g101 = false0 in
let g102 = true1 in
let g103 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g103 t5 k in
  k t1 in
let g104 = Nil0 in
let g105 = Nil0 in
let g106 = "read_sector " in
let g107 = Nil0 in
let g108 = "\n" in
let g109 = Nil0 in
let g110 = "error: " in
let g111 = Nil0 in
let g112 = Unit0 in
let g113 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g113 t5 k in
  k t1 in
let g114 = Nil0 in
let g115 = Nil0 in
let g116 = "   **SLOW**" in
let g117 = Nil0 in
let g118 = "read_sector " in
let g119 = Nil0 in
let g120 = "\n" in
let g121 = Nil0 in
let g122 = "trace: " in
let g123 = Nil0 in
let g124 = false0 in
let g125 = true1 in
let g126 = Unit0 in
let g127 = false0 in
let g128 = true1 in
let g129 = Unit0 in
let g130 = true1 in
let g131 = Unit0 in
let g132 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = Cons1['-',f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,1) in
        arg t1 k in
      g132 t2 k in
  k t1 in
let g133 = Nil0 in
let g134 = true1 in
let g135 = false0 in
let g136 = true1 in
let g137 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g137 t5 k in
  k t1 in
let g138 = Nil0 in
let g139 = Nil0 in
let g140 = "write_block " in
let g141 = Nil0 in
let g142 = "\n" in
let g143 = Nil0 in
let g144 = "error: " in
let g145 = Nil0 in
let g146 = Unit0 in
let g147 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g147 t5 k in
  k t1 in
let g148 = Nil0 in
let g149 = Nil0 in
let g150 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g150 t5 k in
  k t1 in
let g151 = Nil0 in
let g152 = Nil0 in
let g153 = "]" in
let g154 = Nil0 in
let g155 = "[" in
let g156 = Nil0 in
let g157 = Nil0 in
let g158 = "write_block " in
let g159 = Nil0 in
let g160 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g160 t5 k in
  k t1 in
let g161 = Nil0 in
let g162 = Nil0 in
let g163 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g163 t5 k in
  k t1 in
let g164 = Nil0 in
let g165 = Nil0 in
let g166 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g166 t5 k in
  k t1 in
let g167 = Nil0 in
let g168 = ", len=" in
let g169 = Nil0 in
let g170 = Nil0 in
let g171 = ", offset=" in
let g172 = Nil0 in
let g173 = Nil0 in
let g174 = "update_sectorC1 seci=" in
let g175 = Nil0 in
let g176 = false0 in
let g177 = true1 in
let g178 = Unit0 in
let g179 = true1 in
let g180 = true1 in
let g181 = false0 in
let g182 = true1 in
let g183 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g183 t5 k in
  k t1 in
let g184 = Nil0 in
let g185 = Nil0 in
let g186 = "write_sector " in
let g187 = Nil0 in
let g188 = "\n" in
let g189 = Nil0 in
let g190 = "error: " in
let g191 = Nil0 in
let g192 = Unit0 in
let g193 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g193 t5 k in
  k t1 in
let g194 = Nil0 in
let g195 = Nil0 in
let g196 = "   **SLOW**" in
let g197 = Nil0 in
let g198 = "write_sector " in
let g199 = Nil0 in
let g200 = "\n" in
let g201 = Nil0 in
let g202 = "trace: " in
let g203 = Nil0 in
let g204 = false0 in
let g205 = true1 in
let g206 = Unit0 in
let g207 = Unit0 in
let g208 = true1 in
let g209 = false0 in
let g210 = true1 in
let g211 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g211 t5 k in
  k t1 in
let g212 = Nil0 in
let g213 = Nil0 in
let g214 = "read_sector " in
let g215 = Nil0 in
let g216 = "\n" in
let g217 = Nil0 in
let g218 = "error: " in
let g219 = Nil0 in
let g220 = Unit0 in
let g221 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g221 t5 k in
  k t1 in
let g222 = Nil0 in
let g223 = Nil0 in
let g224 = "   **SLOW**" in
let g225 = Nil0 in
let g226 = "read_sector " in
let g227 = Nil0 in
let g228 = "\n" in
let g229 = Nil0 in
let g230 = "trace: " in
let g231 = Nil0 in
let g232 = false0 in
let g233 = true1 in
let g234 = Unit0 in
let g235 = false0 in
let g236 = true1 in
let g237 = Unit0 in
let g238 = true1 in
let g239 = Unit0 in
let g240 = true1 in
let g241 = false0 in
let g242 = true1 in
let g243 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g243 t5 k in
  k t1 in
let g244 = Nil0 in
let g245 = Nil0 in
let g246 = "read_block " in
let g247 = Nil0 in
let g248 = "\n" in
let g249 = Nil0 in
let g250 = "error: " in
let g251 = Nil0 in
let g252 = Unit0 in
let g253 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g253 t5 k in
  k t1 in
let g254 = Nil0 in
let g255 = Nil0 in
let g256 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g256 t5 k in
  k t1 in
let g257 = Nil0 in
let g258 = Nil0 in
let g259 = "]" in
let g260 = Nil0 in
let g261 = "[" in
let g262 = Nil0 in
let g263 = Nil0 in
let g264 = "read_block " in
let g265 = Nil0 in
let g266 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g266 t5 k in
  k t1 in
let g267 = Nil0 in
let g268 = Nil0 in
let g269 = "read_sectorC1 seci=" in
let g270 = Nil0 in
let g271 = true1 in
let g272 = false0 in
let g273 = true1 in
let g274 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g274 t5 k in
  k t1 in
let g275 = Nil0 in
let g276 = Nil0 in
let g277 = "write_sector " in
let g278 = Nil0 in
let g279 = "\n" in
let g280 = Nil0 in
let g281 = "error: " in
let g282 = Nil0 in
let g283 = Unit0 in
let g284 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g284 t5 k in
  k t1 in
let g285 = Nil0 in
let g286 = Nil0 in
let g287 = "   **SLOW**" in
let g288 = Nil0 in
let g289 = "write_sector " in
let g290 = Nil0 in
let g291 = "\n" in
let g292 = Nil0 in
let g293 = "trace: " in
let g294 = Nil0 in
let g295 = false0 in
let g296 = true1 in
let g297 = Unit0 in
let g298 = Unit0 in
let g299 = true1 in
let g300 = false0 in
let g301 = true1 in
let g302 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g302 t5 k in
  k t1 in
let g303 = Nil0 in
let g304 = Nil0 in
let g305 = "read_sector " in
let g306 = Nil0 in
let g307 = "\n" in
let g308 = Nil0 in
let g309 = "error: " in
let g310 = Nil0 in
let g311 = Unit0 in
let g312 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g312 t5 k in
  k t1 in
let g313 = Nil0 in
let g314 = Nil0 in
let g315 = "   **SLOW**" in
let g316 = Nil0 in
let g317 = "read_sector " in
let g318 = Nil0 in
let g319 = "\n" in
let g320 = Nil0 in
let g321 = "trace: " in
let g322 = Nil0 in
let g323 = false0 in
let g324 = true1 in
let g325 = Unit0 in
let g326 = false0 in
let g327 = false0 in
let g328 = true1 in
let g329 = Unit0 in
let g330 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g330 t5 k in
  k t1 in
let g331 = Nil0 in
let g332 = Nil0 in
let g333 = " : " in
let g334 = Nil0 in
let g335 = Nil0 in
let g336 = Unit0 in
let k = [], fun [] arg ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(16384) in
    let t2 = Disk0[t1] in
    let t3 = Cons1['0',g11] in
    let k = [f2,arg,t2], fun [f2,f3,f4] arg ->
      let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
        let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
            let k = [f2,f3,arg,f4,f5], fun [f2,f3,f4,f5,f6] arg ->
              let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                  let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                    let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                      let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                          let k = [f2,f3,arg,f4,f5], fun [f2,f3,f4,f5,f6] arg ->
                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                              let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                  let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                    let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                        let k = [f2,f3,f4,arg,f5], fun [f2,f3,f4,f5,f6] arg ->
                                          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                              let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                  let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                    let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                      let k = [f2,f3,f4,arg,f5], fun [f2,f3,f4,f5,f6] arg ->
                                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                          let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                              let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                  let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                    let t1 = PRIM_MakeBytes(512) in
                                                                    let t2 = [arg,t1], fun [f1,f2] me arg k ->
                                                                      let t1 = PRIM_LessInt(arg,512) in
                                                                      let k = [f1,f2,arg,me], fun [f2,f3,f4,f5] arg ->
                                                                        match arg with
                                                                        | true1 -> k g22
                                                                        | false0 ->
                                                                          let t1 = PRIM_AddInt(0,f4) in
                                                                          let t2 = PRIM_GetBytes(f2,t1) in
                                                                          let t3 = PRIM_SetBytes(f3,f4,t2) in
                                                                          let t4 = PRIM_AddInt(f4,1) in
                                                                          f5 t4 k in
                                                                      match t1 with
                                                                      | true1 -> k g20
                                                                      | false0 -> k g21 in
                                                                    let k = [f2,f3,f4,t1], fun [f2,f3,f4,f5] arg ->
                                                                      let t1 = PRIM_MakeRef(g23) in
                                                                      let t2 = Sector0[f5] in
                                                                      let t3 = Cache_Line0[t1,0,t2] in
                                                                      let t4 = PRIM_MakeRef(t3) in
                                                                      let t5 = DiskC10[f4,t4] in
                                                                      let t6 = [f2,f3,t5], fun [f1,f2,f3] me arg k ->
                                                                        let t1 = PRIM_LessInt(124,arg) in
                                                                        match t1 with
                                                                        | true1 -> k g24
                                                                        | false0 ->
                                                                          let t2 = PRIM_ModInt(arg,10) in
                                                                          let t3 = PRIM_AddInt(48,t2) in
                                                                          let t4 = PRIM_CharChr(t3) in
                                                                          let t5 = [t4], fun [f1] me arg k ->
                                                                            let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
                                                                              let t1 = PRIM_EqInt(arg,0) in
                                                                              match t1 with
                                                                              | true1 -> k f2
                                                                              | false0 ->
                                                                                let t2 = Cons1[f1,f2] in
                                                                                let k = [arg], fun [f2] arg ->
                                                                                  let t1 = PRIM_SubInt(f2,1) in
                                                                                  arg t1 k in
                                                                                f3 t2 k in
                                                                            k t1 in
                                                                          let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                            let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                              let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                let t1 = PRIM_ThawBytes(arg) in
                                                                                let t2 = Block0[t1] in
                                                                                let t3 = PRIM_LessInt(f5,0) in
                                                                                let k = [f2,f3,f4,f5,f6,t2], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                  let k = [f5,f6], fun [f2,f3] arg ->
                                                                                    let t1 = PRIM_AddInt(f2,1) in
                                                                                    f3 t1 k in
                                                                                  match arg with
                                                                                  | true1 ->
                                                                                    let t1 = PRIM_EqInt(f5,0) in
                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                        let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                          let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                              let k = [f2,f3,arg,f4], fun [f2,f3,f4,f5] arg ->
                                                                                                let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                        let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                          let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                            let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                              let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                    let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                        let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                          let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                            let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                              let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                let k = [f3], fun [f2] arg ->
                                                                                                                                  let k = [], fun [] arg ->
                                                                                                                                    let k = [], fun [] arg ->
                                                                                                                                      let t1 = PRIM_Crash(g38) in
                                                                                                                                      k t1 in
                                                                                                                                    g8 arg k in
                                                                                                                                  f2 arg k in
                                                                                                                                f2 arg k in
                                                                                                                              f4 arg k in
                                                                                                                            arg f4 k in
                                                                                                                          g3 g37 k in
                                                                                                                        g3 arg k in
                                                                                                                      f3 f4 k in
                                                                                                                    f3 g36 k in
                                                                                                                  f2 arg k in
                                                                                                                f4 arg k in
                                                                                                              arg f4 k in
                                                                                                            g3 g35 k in
                                                                                                          g3 arg k in
                                                                                                        f3 g34 k in
                                                                                                      f3 arg k in
                                                                                                    f2 arg k in
                                                                                                  f4 arg k in
                                                                                                arg f5 k in
                                                                                              g3 g33 k in
                                                                                            g3 arg k in
                                                                                          f3 f4 k in
                                                                                        f3 g32 k in
                                                                                      f2 arg k in
                                                                                    match t1 with
                                                                                    | true1 ->
                                                                                      let t2 = Cons1['0',g30] in
                                                                                      k t2
                                                                                    | false0 ->
                                                                                      let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                      g29 g31 k
                                                                                  | false0 ->
                                                                                    let t1 = PRIM_DivInt(f5,8) in
                                                                                    let t2 = PRIM_EqInt(f5,0) in
                                                                                    let k = [f2,f3,f4,f5,f7,t1], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                      let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                        let t1 = PRIM_EqInt(f7,0) in
                                                                                        let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                          let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8,f10], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                        let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                          let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8,f10], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                        let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                    let t1 = PRIM_ModInt(f5,8) in
                                                                                                                                                    let t2 = PRIM_MulInt(64,t1) in
                                                                                                                                                    let k = [f2,f3,f4,f7,t2], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                      let t1 = PRIM_EqInt(f5,0) in
                                                                                                                                                      let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                          let t1 = PRIM_EqInt(f6,0) in
                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11] arg ->
                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8,f9,f11], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,f8,f10], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7,f8,f10], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                          match f4 with
                                                                                                                                                                                                                                          | DiskC10(t1,t2) ->
                                                                                                                                                                                                                                            let t3 = PRIM_DeRef(t2) in
                                                                                                                                                                                                                                            match t3 with
                                                                                                                                                                                                                                            | Cache_Line0(t4,t5,t6) ->
                                                                                                                                                                                                                                              let t7 = PRIM_EqInt(f5,t5) in
                                                                                                                                                                                                                                              match t7 with
                                                                                                                                                                                                                                              | true1 ->
                                                                                                                                                                                                                                                let k = [f6,f7,t4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                  let t1 = [f2,f3,arg], fun [f1,f2,f3] me arg k ->
                                                                                                                                                                                                                                                    let t1 = PRIM_LessInt(arg,64) in
                                                                                                                                                                                                                                                    let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                      match arg with
                                                                                                                                                                                                                                                      | true1 -> k g70
                                                                                                                                                                                                                                                      | false0 ->
                                                                                                                                                                                                                                                        let t1 = PRIM_GetBytes(f3,f5) in
                                                                                                                                                                                                                                                        let t2 = PRIM_AddInt(f2,f5) in
                                                                                                                                                                                                                                                        let t3 = PRIM_SetBytes(f4,t2,t1) in
                                                                                                                                                                                                                                                        let t4 = PRIM_AddInt(f5,1) in
                                                                                                                                                                                                                                                        f6 t4 k in
                                                                                                                                                                                                                                                    match t1 with
                                                                                                                                                                                                                                                    | true1 -> k g68
                                                                                                                                                                                                                                                    | false0 -> k g69 in
                                                                                                                                                                                                                                                  let k = [f4], fun [f2] arg ->
                                                                                                                                                                                                                                                    let t1 = PRIM_SetRef(f2,g71) in
                                                                                                                                                                                                                                                    k t1 in
                                                                                                                                                                                                                                                  t1 0 k in
                                                                                                                                                                                                                                                match t6 with
                                                                                                                                                                                                                                                | Sector0(t8) -> k t8
                                                                                                                                                                                                                                              | false0 ->
                                                                                                                                                                                                                                                let t8 = PRIM_DeRef(t4) in
                                                                                                                                                                                                                                                let k = [f2,f3,f5,f6,f7,t1,t2], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                                  let t1 = PRIM_LessInt(f4,0) in
                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                                    let k = [f4,f5,f6,f8], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                        let t1 = [f3,f4,arg], fun [f1,f2,f3] me arg k ->
                                                                                                                                                                                                                                                          let t1 = PRIM_LessInt(arg,64) in
                                                                                                                                                                                                                                                          let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                            match arg with
                                                                                                                                                                                                                                                            | true1 -> k g129
                                                                                                                                                                                                                                                            | false0 ->
                                                                                                                                                                                                                                                              let t1 = PRIM_GetBytes(f3,f5) in
                                                                                                                                                                                                                                                              let t2 = PRIM_AddInt(f2,f5) in
                                                                                                                                                                                                                                                              let t3 = PRIM_SetBytes(f4,t2,t1) in
                                                                                                                                                                                                                                                              let t4 = PRIM_AddInt(f5,1) in
                                                                                                                                                                                                                                                              f6 t4 k in
                                                                                                                                                                                                                                                          match t1 with
                                                                                                                                                                                                                                                          | true1 -> k g127
                                                                                                                                                                                                                                                          | false0 -> k g128 in
                                                                                                                                                                                                                                                        let k = [f2,f5,f6], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                          let t1 = PRIM_MakeRef(g130) in
                                                                                                                                                                                                                                                          let t2 = Cache_Line0[t1,f2,f4] in
                                                                                                                                                                                                                                                          let t3 = PRIM_SetRef(f3,t2) in
                                                                                                                                                                                                                                                          k t3 in
                                                                                                                                                                                                                                                        t1 0 k in
                                                                                                                                                                                                                                                      match arg with
                                                                                                                                                                                                                                                      | Sector0(t1) -> k t1 in
                                                                                                                                                                                                                                                    match arg with
                                                                                                                                                                                                                                                    | true1 ->
                                                                                                                                                                                                                                                      let t1 = PRIM_EqInt(f4,0) in
                                                                                                                                                                                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                        let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                          let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                            let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                              let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                  let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                        let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                          let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                        let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                          let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                              let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                                  let k = [f3], fun [f2] arg ->
                                                                                                                                                                                                                                                                                                    let k = [], fun [] arg ->
                                                                                                                                                                                                                                                                                                      let k = [], fun [] arg ->
                                                                                                                                                                                                                                                                                                        let t1 = PRIM_Crash(g112) in
                                                                                                                                                                                                                                                                                                        k t1 in
                                                                                                                                                                                                                                                                                                      g8 arg k in
                                                                                                                                                                                                                                                                                                    f2 arg k in
                                                                                                                                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                                                                                                                                f4 arg k in
                                                                                                                                                                                                                                                                                              arg f4 k in
                                                                                                                                                                                                                                                                                            g3 g111 k in
                                                                                                                                                                                                                                                                                          g3 arg k in
                                                                                                                                                                                                                                                                                        f3 f4 k in
                                                                                                                                                                                                                                                                                      f3 g110 k in
                                                                                                                                                                                                                                                                                    f2 arg k in
                                                                                                                                                                                                                                                                                  f4 arg k in
                                                                                                                                                                                                                                                                                arg f4 k in
                                                                                                                                                                                                                                                                              g3 g109 k in
                                                                                                                                                                                                                                                                            g3 arg k in
                                                                                                                                                                                                                                                                          f3 g108 k in
                                                                                                                                                                                                                                                                        f3 arg k in
                                                                                                                                                                                                                                                                      f2 arg k in
                                                                                                                                                                                                                                                                    f4 arg k in
                                                                                                                                                                                                                                                                  arg f4 k in
                                                                                                                                                                                                                                                                g3 g107 k in
                                                                                                                                                                                                                                                              g3 arg k in
                                                                                                                                                                                                                                                            f3 f4 k in
                                                                                                                                                                                                                                                          f3 g106 k in
                                                                                                                                                                                                                                                        f2 arg k in
                                                                                                                                                                                                                                                      match t1 with
                                                                                                                                                                                                                                                      | true1 ->
                                                                                                                                                                                                                                                        let t2 = Cons1['0',g104] in
                                                                                                                                                                                                                                                        k t2
                                                                                                                                                                                                                                                      | false0 ->
                                                                                                                                                                                                                                                        let k = [f4], fun [f2] arg -> arg f2 k in
                                                                                                                                                                                                                                                        g103 g105 k
                                                                                                                                                                                                                                                    | false0 ->
                                                                                                                                                                                                                                                      let t1 = PRIM_EqInt(f4,0) in
                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f7], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                                                let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                                                  let k = [f3,f4], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                                                      let k = [f2], fun [f2] arg ->
                                                                                                                                                                                                                                                                                                                        let t1 = PRIM_MulInt(f2,512) in
                                                                                                                                                                                                                                                                                                                        let t2 = PRIM_MakeBytes(512) in
                                                                                                                                                                                                                                                                                                                        let t3 = [arg,t1,t2], fun [f1,f2,f3] me arg k ->
                                                                                                                                                                                                                                                                                                                          let t1 = PRIM_LessInt(arg,512) in
                                                                                                                                                                                                                                                                                                                          let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                                            match arg with
                                                                                                                                                                                                                                                                                                                            | true1 -> k g126
                                                                                                                                                                                                                                                                                                                            | false0 ->
                                                                                                                                                                                                                                                                                                                              let t1 = PRIM_AddInt(f3,f5) in
                                                                                                                                                                                                                                                                                                                              let t2 = PRIM_GetBytes(f2,t1) in
                                                                                                                                                                                                                                                                                                                              let t3 = PRIM_SetBytes(f4,f5,t2) in
                                                                                                                                                                                                                                                                                                                              let t4 = PRIM_AddInt(f5,1) in
                                                                                                                                                                                                                                                                                                                              f6 t4 k in
                                                                                                                                                                                                                                                                                                                          match t1 with
                                                                                                                                                                                                                                                                                                                          | true1 -> k g124
                                                                                                                                                                                                                                                                                                                          | false0 -> k g125 in
                                                                                                                                                                                                                                                                                                                        let k = [t2], fun [f2] arg ->
                                                                                                                                                                                                                                                                                                                          let t1 = Sector0[f2] in
                                                                                                                                                                                                                                                                                                                          k t1 in
                                                                                                                                                                                                                                                                                                                        t3 0 k in
                                                                                                                                                                                                                                                                                                                      match f3 with
                                                                                                                                                                                                                                                                                                                      | Disk0(t1) -> k t1 in
                                                                                                                                                                                                                                                                                                                    g8 arg k in
                                                                                                                                                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                                                                                                                                                f2 arg k in
                                                                                                                                                                                                                                                                                                              f6 arg k in
                                                                                                                                                                                                                                                                                                            arg f6 k in
                                                                                                                                                                                                                                                                                                          g3 g123 k in
                                                                                                                                                                                                                                                                                                        g3 arg k in
                                                                                                                                                                                                                                                                                                      f3 f6 k in
                                                                                                                                                                                                                                                                                                    f3 g122 k in
                                                                                                                                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                                                                                                                                f6 arg k in
                                                                                                                                                                                                                                                                                              arg f6 k in
                                                                                                                                                                                                                                                                                            g3 g121 k in
                                                                                                                                                                                                                                                                                          g3 arg k in
                                                                                                                                                                                                                                                                                        f3 g120 k in
                                                                                                                                                                                                                                                                                      f3 arg k in
                                                                                                                                                                                                                                                                                    f2 arg k in
                                                                                                                                                                                                                                                                                  f6 arg k in
                                                                                                                                                                                                                                                                                arg f6 k in
                                                                                                                                                                                                                                                                              g3 g119 k in
                                                                                                                                                                                                                                                                            g3 arg k in
                                                                                                                                                                                                                                                                          f3 f6 k in
                                                                                                                                                                                                                                                                        f3 g118 k in
                                                                                                                                                                                                                                                                      f2 arg k in
                                                                                                                                                                                                                                                                    f6 arg k in
                                                                                                                                                                                                                                                                  arg f6 k in
                                                                                                                                                                                                                                                                g3 g117 k in
                                                                                                                                                                                                                                                              g3 arg k in
                                                                                                                                                                                                                                                            f3 g116 k in
                                                                                                                                                                                                                                                          f3 arg k in
                                                                                                                                                                                                                                                        f2 arg k in
                                                                                                                                                                                                                                                      match t1 with
                                                                                                                                                                                                                                                      | true1 ->
                                                                                                                                                                                                                                                        let t2 = Cons1['0',g114] in
                                                                                                                                                                                                                                                        k t2
                                                                                                                                                                                                                                                      | false0 ->
                                                                                                                                                                                                                                                        let k = [f4], fun [f2] arg -> arg f2 k in
                                                                                                                                                                                                                                                        g113 g115 k in
                                                                                                                                                                                                                                                  match t1 with
                                                                                                                                                                                                                                                  | true1 -> k g100
                                                                                                                                                                                                                                                  | false0 ->
                                                                                                                                                                                                                                                    let t2 = PRIM_LessInt(f4,32) in
                                                                                                                                                                                                                                                    match t2 with
                                                                                                                                                                                                                                                    | true1 -> k g101
                                                                                                                                                                                                                                                    | false0 -> k g102 in
                                                                                                                                                                                                                                                match t8 with
                                                                                                                                                                                                                                                | true1 ->
                                                                                                                                                                                                                                                  let t9 = PRIM_LessInt(t5,0) in
                                                                                                                                                                                                                                                  let k = [f2,f3,t1,t5,t6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                    match arg with
                                                                                                                                                                                                                                                    | true1 ->
                                                                                                                                                                                                                                                      let t1 = PRIM_EqInt(f5,0) in
                                                                                                                                                                                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                        let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                          let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                            let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                              let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                  let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                        let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                          let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                        let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                          let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                              let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                                  let k = [f3], fun [f2] arg ->
                                                                                                                                                                                                                                                                                                    let k = [], fun [] arg ->
                                                                                                                                                                                                                                                                                                      let k = [], fun [] arg ->
                                                                                                                                                                                                                                                                                                        let t1 = PRIM_Crash(g84) in
                                                                                                                                                                                                                                                                                                        k t1 in
                                                                                                                                                                                                                                                                                                      g8 arg k in
                                                                                                                                                                                                                                                                                                    f2 arg k in
                                                                                                                                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                                                                                                                                f4 arg k in
                                                                                                                                                                                                                                                                                              arg f4 k in
                                                                                                                                                                                                                                                                                            g3 g83 k in
                                                                                                                                                                                                                                                                                          g3 arg k in
                                                                                                                                                                                                                                                                                        f3 f4 k in
                                                                                                                                                                                                                                                                                      f3 g82 k in
                                                                                                                                                                                                                                                                                    f2 arg k in
                                                                                                                                                                                                                                                                                  f4 arg k in
                                                                                                                                                                                                                                                                                arg f4 k in
                                                                                                                                                                                                                                                                              g3 g81 k in
                                                                                                                                                                                                                                                                            g3 arg k in
                                                                                                                                                                                                                                                                          f3 g80 k in
                                                                                                                                                                                                                                                                        f3 arg k in
                                                                                                                                                                                                                                                                      f2 arg k in
                                                                                                                                                                                                                                                                    f4 arg k in
                                                                                                                                                                                                                                                                  arg f4 k in
                                                                                                                                                                                                                                                                g3 g79 k in
                                                                                                                                                                                                                                                              g3 arg k in
                                                                                                                                                                                                                                                            f3 f4 k in
                                                                                                                                                                                                                                                          f3 g78 k in
                                                                                                                                                                                                                                                        f2 arg k in
                                                                                                                                                                                                                                                      match t1 with
                                                                                                                                                                                                                                                      | true1 ->
                                                                                                                                                                                                                                                        let t2 = Cons1['0',g76] in
                                                                                                                                                                                                                                                        k t2
                                                                                                                                                                                                                                                      | false0 ->
                                                                                                                                                                                                                                                        let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                                                                                                                                                                                        g75 g77 k
                                                                                                                                                                                                                                                    | false0 ->
                                                                                                                                                                                                                                                      let t1 = PRIM_EqInt(f5,0) in
                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                                let k = [f3,f4,f5,f6], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                                                  let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                                                      let k = [f3,f4], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                                                        let t1 = PRIM_MulInt(f2,512) in
                                                                                                                                                                                                                                                                                                                        let k = [arg,t1], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                                                          let t1 = [f2,f3,arg], fun [f1,f2,f3] me arg k ->
                                                                                                                                                                                                                                                                                                                            let t1 = PRIM_LessInt(arg,512) in
                                                                                                                                                                                                                                                                                                                            let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                                              match arg with
                                                                                                                                                                                                                                                                                                                              | true1 -> k g98
                                                                                                                                                                                                                                                                                                                              | false0 ->
                                                                                                                                                                                                                                                                                                                                let t1 = PRIM_GetBytes(f4,f5) in
                                                                                                                                                                                                                                                                                                                                let t2 = PRIM_AddInt(f3,f5) in
                                                                                                                                                                                                                                                                                                                                let t3 = PRIM_SetBytes(f2,t2,t1) in
                                                                                                                                                                                                                                                                                                                                let t4 = PRIM_AddInt(f5,1) in
                                                                                                                                                                                                                                                                                                                                f6 t4 k in
                                                                                                                                                                                                                                                                                                                            match t1 with
                                                                                                                                                                                                                                                                                                                            | true1 -> k g96
                                                                                                                                                                                                                                                                                                                            | false0 -> k g97 in
                                                                                                                                                                                                                                                                                                                          t1 0 k in
                                                                                                                                                                                                                                                                                                                        match f3 with
                                                                                                                                                                                                                                                                                                                        | Sector0(t2) -> k t2 in
                                                                                                                                                                                                                                                                                                                      match f2 with
                                                                                                                                                                                                                                                                                                                      | Disk0(t1) -> k t1 in
                                                                                                                                                                                                                                                                                                                    g8 arg k in
                                                                                                                                                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                                                                                                                                                f2 arg k in
                                                                                                                                                                                                                                                                                                              f7 arg k in
                                                                                                                                                                                                                                                                                                            arg f7 k in
                                                                                                                                                                                                                                                                                                          g3 g95 k in
                                                                                                                                                                                                                                                                                                        g3 arg k in
                                                                                                                                                                                                                                                                                                      f3 f7 k in
                                                                                                                                                                                                                                                                                                    f3 g94 k in
                                                                                                                                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                                                                                                                                f7 arg k in
                                                                                                                                                                                                                                                                                              arg f7 k in
                                                                                                                                                                                                                                                                                            g3 g93 k in
                                                                                                                                                                                                                                                                                          g3 arg k in
                                                                                                                                                                                                                                                                                        f3 g92 k in
                                                                                                                                                                                                                                                                                      f3 arg k in
                                                                                                                                                                                                                                                                                    f2 arg k in
                                                                                                                                                                                                                                                                                  f7 arg k in
                                                                                                                                                                                                                                                                                arg f7 k in
                                                                                                                                                                                                                                                                              g3 g91 k in
                                                                                                                                                                                                                                                                            g3 arg k in
                                                                                                                                                                                                                                                                          f3 f7 k in
                                                                                                                                                                                                                                                                        f3 g90 k in
                                                                                                                                                                                                                                                                      f2 arg k in
                                                                                                                                                                                                                                                                    f7 arg k in
                                                                                                                                                                                                                                                                  arg f7 k in
                                                                                                                                                                                                                                                                g3 g89 k in
                                                                                                                                                                                                                                                              g3 arg k in
                                                                                                                                                                                                                                                            f3 g88 k in
                                                                                                                                                                                                                                                          f3 arg k in
                                                                                                                                                                                                                                                        f2 arg k in
                                                                                                                                                                                                                                                      match t1 with
                                                                                                                                                                                                                                                      | true1 ->
                                                                                                                                                                                                                                                        let t2 = Cons1['0',g86] in
                                                                                                                                                                                                                                                        k t2
                                                                                                                                                                                                                                                      | false0 ->
                                                                                                                                                                                                                                                        let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                                                                                                                                                                                        g85 g87 k in
                                                                                                                                                                                                                                                  match t9 with
                                                                                                                                                                                                                                                  | true1 -> k g72
                                                                                                                                                                                                                                                  | false0 ->
                                                                                                                                                                                                                                                    let t10 = PRIM_LessInt(t5,32) in
                                                                                                                                                                                                                                                    match t10 with
                                                                                                                                                                                                                                                    | true1 -> k g73
                                                                                                                                                                                                                                                    | false0 -> k g74
                                                                                                                                                                                                                                                | false0 -> k g99 in
                                                                                                                                                                                                                                        f2 arg k in
                                                                                                                                                                                                                                      f8 arg k in
                                                                                                                                                                                                                                    arg f8 k in
                                                                                                                                                                                                                                  g3 g67 k in
                                                                                                                                                                                                                                g3 arg k in
                                                                                                                                                                                                                              f3 f8 k in
                                                                                                                                                                                                                            f3 g66 k in
                                                                                                                                                                                                                          f2 arg k in
                                                                                                                                                                                                                        f8 arg k in
                                                                                                                                                                                                                      arg f8 k in
                                                                                                                                                                                                                    g3 g65 k in
                                                                                                                                                                                                                  g3 arg k in
                                                                                                                                                                                                                f3 f8 k in
                                                                                                                                                                                                              f3 f8 k in
                                                                                                                                                                                                            f2 arg k in
                                                                                                                                                                                                          f9 arg k in
                                                                                                                                                                                                        arg f9 k in
                                                                                                                                                                                                      g3 g64 k in
                                                                                                                                                                                                    g3 arg k in
                                                                                                                                                                                                  f3 f9 k in
                                                                                                                                                                                                f3 g63 k in
                                                                                                                                                                                              f2 arg k in
                                                                                                                                                                                            f9 arg k in
                                                                                                                                                                                          arg f9 k in
                                                                                                                                                                                        g3 g62 k in
                                                                                                                                                                                      g3 arg k in
                                                                                                                                                                                    f3 f9 k in
                                                                                                                                                                                  f3 f9 k in
                                                                                                                                                                                f2 arg k in
                                                                                                                                                                              f10 arg k in
                                                                                                                                                                            arg f10 k in
                                                                                                                                                                          g3 g61 k in
                                                                                                                                                                        g3 arg k in
                                                                                                                                                                      f3 f10 k in
                                                                                                                                                                    f3 g60 k in
                                                                                                                                                                  f2 arg k in
                                                                                                                                                                arg 64 k in
                                                                                                                                                              g58 g59 k in
                                                                                                                                                            f2 arg k in
                                                                                                                                                          match t1 with
                                                                                                                                                          | true1 ->
                                                                                                                                                            let t2 = Cons1['0',g56] in
                                                                                                                                                            k t2
                                                                                                                                                          | false0 ->
                                                                                                                                                            let k = [f6], fun [f2] arg -> arg f2 k in
                                                                                                                                                            g55 g57 k in
                                                                                                                                                        f2 arg k in
                                                                                                                                                      match t1 with
                                                                                                                                                      | true1 ->
                                                                                                                                                        let t2 = Cons1['0',g53] in
                                                                                                                                                        k t2
                                                                                                                                                      | false0 ->
                                                                                                                                                        let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                                                                                        g52 g54 k in
                                                                                                                                                    match f6 with
                                                                                                                                                    | Block0(t3) -> k t3 in
                                                                                                                                                  f2 arg k in
                                                                                                                                                f8 arg k in
                                                                                                                                              arg f8 k in
                                                                                                                                            g3 g51 k in
                                                                                                                                          g3 arg k in
                                                                                                                                        f3 f8 k in
                                                                                                                                      f3 g50 k in
                                                                                                                                    f2 arg k in
                                                                                                                                  f8 arg k in
                                                                                                                                arg f8 k in
                                                                                                                              g3 g49 k in
                                                                                                                            g3 arg k in
                                                                                                                          f3 f8 k in
                                                                                                                        f3 f8 k in
                                                                                                                      f2 arg k in
                                                                                                                    f9 arg k in
                                                                                                                  arg f9 k in
                                                                                                                g3 g48 k in
                                                                                                              g3 arg k in
                                                                                                            f3 f9 k in
                                                                                                          f3 g47 k in
                                                                                                        f2 arg k in
                                                                                                      f9 arg k in
                                                                                                    arg f9 k in
                                                                                                  g3 g46 k in
                                                                                                g3 arg k in
                                                                                              f3 g45 k in
                                                                                            f3 arg k in
                                                                                          f2 arg k in
                                                                                        match t1 with
                                                                                        | true1 ->
                                                                                          let t2 = Cons1['0',g43] in
                                                                                          k t2
                                                                                        | false0 ->
                                                                                          let k = [f7], fun [f2] arg -> arg f2 k in
                                                                                          g42 g44 k in
                                                                                      f2 arg k in
                                                                                    match t2 with
                                                                                    | true1 ->
                                                                                      let t3 = Cons1['0',g40] in
                                                                                      k t3
                                                                                    | false0 ->
                                                                                      let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                      g39 g41 k in
                                                                                match t3 with
                                                                                | true1 -> k g26
                                                                                | false0 ->
                                                                                  let t4 = PRIM_LessInt(f5,256) in
                                                                                  match t4 with
                                                                                  | true1 -> k g27
                                                                                  | false0 -> k g28 in
                                                                              f2 arg k in
                                                                            arg 64 k in
                                                                          t5 g25 k in
                                                                      let k = [f2,f3,t5], fun [f2,f3,f4] arg ->
                                                                        let t1 = [f2,f3,f4], fun [f1,f2,f3] me arg k ->
                                                                          let t1 = PRIM_LessInt(119,arg) in
                                                                          match t1 with
                                                                          | true1 -> k g131
                                                                          | false0 ->
                                                                            let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                              let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                  let t1 = PRIM_ThawBytes(arg) in
                                                                                  let t2 = Block0[t1] in
                                                                                  let t3 = PRIM_LessInt(f5,0) in
                                                                                  let k = [f2,f3,f4,f5,f6,t2], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                    let k = [f5,f6], fun [f2,f3] arg ->
                                                                                      let t1 = PRIM_AddInt(f2,1) in
                                                                                      f3 t1 k in
                                                                                    match arg with
                                                                                    | true1 ->
                                                                                      let t1 = PRIM_EqInt(f5,0) in
                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                        let k = [f2,f3], fun [f2,f3] arg ->
                                                                                          let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                            let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                              let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                  let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                        let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                          let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                              let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                        let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                          let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                            let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                              let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                  let k = [f3], fun [f2] arg ->
                                                                                                                                    let k = [], fun [] arg ->
                                                                                                                                      let k = [], fun [] arg ->
                                                                                                                                        let t1 = PRIM_Crash(g146) in
                                                                                                                                        k t1 in
                                                                                                                                      g8 arg k in
                                                                                                                                    f2 arg k in
                                                                                                                                  f2 arg k in
                                                                                                                                f4 arg k in
                                                                                                                              arg f4 k in
                                                                                                                            g3 g145 k in
                                                                                                                          g3 arg k in
                                                                                                                        f3 f4 k in
                                                                                                                      f3 g144 k in
                                                                                                                    f2 arg k in
                                                                                                                  f4 arg k in
                                                                                                                arg f4 k in
                                                                                                              g3 g143 k in
                                                                                                            g3 arg k in
                                                                                                          f3 g142 k in
                                                                                                        f3 arg k in
                                                                                                      f2 arg k in
                                                                                                    f4 arg k in
                                                                                                  arg f4 k in
                                                                                                g3 g141 k in
                                                                                              g3 arg k in
                                                                                            f3 f4 k in
                                                                                          f3 g140 k in
                                                                                        f2 arg k in
                                                                                      match t1 with
                                                                                      | true1 ->
                                                                                        let t2 = Cons1['0',g138] in
                                                                                        k t2
                                                                                      | false0 ->
                                                                                        let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                        g137 g139 k
                                                                                    | false0 ->
                                                                                      let t1 = PRIM_DivInt(f5,8) in
                                                                                      let t2 = PRIM_EqInt(f5,0) in
                                                                                      let k = [f2,f3,f4,f5,f7,t1], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                        let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                          let t1 = PRIM_EqInt(f7,0) in
                                                                                          let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f8,f10], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                        let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                          let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8,f10], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                        let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                      let t1 = PRIM_ModInt(f5,8) in
                                                                                                                                                      let t2 = PRIM_MulInt(64,t1) in
                                                                                                                                                      let k = [f2,f3,f4,f7,t2], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                        let t1 = PRIM_EqInt(f5,0) in
                                                                                                                                                        let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                            let t1 = PRIM_EqInt(f6,0) in
                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11] arg ->
                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8,f9,f11], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8,f10], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg ->
                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,f8,f10], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                            match f4 with
                                                                                                                                                                                                                                            | DiskC10(t1,t2) ->
                                                                                                                                                                                                                                              let t3 = PRIM_DeRef(t2) in
                                                                                                                                                                                                                                              match t3 with
                                                                                                                                                                                                                                              | Cache_Line0(t4,t5,t6) ->
                                                                                                                                                                                                                                                let t7 = PRIM_EqInt(f5,t5) in
                                                                                                                                                                                                                                                match t7 with
                                                                                                                                                                                                                                                | true1 ->
                                                                                                                                                                                                                                                  let k = [f6,f7,t4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                    let t1 = [f2,f3,arg], fun [f1,f2,f3] me arg k ->
                                                                                                                                                                                                                                                      let t1 = PRIM_LessInt(arg,64) in
                                                                                                                                                                                                                                                      let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                        match arg with
                                                                                                                                                                                                                                                        | true1 -> k g178
                                                                                                                                                                                                                                                        | false0 ->
                                                                                                                                                                                                                                                          let t1 = PRIM_GetBytes(f3,f5) in
                                                                                                                                                                                                                                                          let t2 = PRIM_AddInt(f2,f5) in
                                                                                                                                                                                                                                                          let t3 = PRIM_SetBytes(f4,t2,t1) in
                                                                                                                                                                                                                                                          let t4 = PRIM_AddInt(f5,1) in
                                                                                                                                                                                                                                                          f6 t4 k in
                                                                                                                                                                                                                                                      match t1 with
                                                                                                                                                                                                                                                      | true1 -> k g176
                                                                                                                                                                                                                                                      | false0 -> k g177 in
                                                                                                                                                                                                                                                    let k = [f4], fun [f2] arg ->
                                                                                                                                                                                                                                                      let t1 = PRIM_SetRef(f2,g179) in
                                                                                                                                                                                                                                                      k t1 in
                                                                                                                                                                                                                                                    t1 0 k in
                                                                                                                                                                                                                                                  match t6 with
                                                                                                                                                                                                                                                  | Sector0(t8) -> k t8
                                                                                                                                                                                                                                                | false0 ->
                                                                                                                                                                                                                                                  let t8 = PRIM_DeRef(t4) in
                                                                                                                                                                                                                                                  let k = [f2,f3,f5,f6,f7,t1,t2], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                                    let t1 = PRIM_LessInt(f4,0) in
                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                                      let k = [f4,f5,f6,f8], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                          let t1 = [f3,f4,arg], fun [f1,f2,f3] me arg k ->
                                                                                                                                                                                                                                                            let t1 = PRIM_LessInt(arg,64) in
                                                                                                                                                                                                                                                            let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                              match arg with
                                                                                                                                                                                                                                                              | true1 -> k g237
                                                                                                                                                                                                                                                              | false0 ->
                                                                                                                                                                                                                                                                let t1 = PRIM_GetBytes(f3,f5) in
                                                                                                                                                                                                                                                                let t2 = PRIM_AddInt(f2,f5) in
                                                                                                                                                                                                                                                                let t3 = PRIM_SetBytes(f4,t2,t1) in
                                                                                                                                                                                                                                                                let t4 = PRIM_AddInt(f5,1) in
                                                                                                                                                                                                                                                                f6 t4 k in
                                                                                                                                                                                                                                                            match t1 with
                                                                                                                                                                                                                                                            | true1 -> k g235
                                                                                                                                                                                                                                                            | false0 -> k g236 in
                                                                                                                                                                                                                                                          let k = [f2,f5,f6], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                            let t1 = PRIM_MakeRef(g238) in
                                                                                                                                                                                                                                                            let t2 = Cache_Line0[t1,f2,f4] in
                                                                                                                                                                                                                                                            let t3 = PRIM_SetRef(f3,t2) in
                                                                                                                                                                                                                                                            k t3 in
                                                                                                                                                                                                                                                          t1 0 k in
                                                                                                                                                                                                                                                        match arg with
                                                                                                                                                                                                                                                        | Sector0(t1) -> k t1 in
                                                                                                                                                                                                                                                      match arg with
                                                                                                                                                                                                                                                      | true1 ->
                                                                                                                                                                                                                                                        let t1 = PRIM_EqInt(f4,0) in
                                                                                                                                                                                                                                                        let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                          let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                            let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                              let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                    let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                        let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                          let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                            let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                              let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                  let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                        let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                          let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                                let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                                    let k = [f3], fun [f2] arg ->
                                                                                                                                                                                                                                                                                                      let k = [], fun [] arg ->
                                                                                                                                                                                                                                                                                                        let k = [], fun [] arg ->
                                                                                                                                                                                                                                                                                                          let t1 = PRIM_Crash(g220) in
                                                                                                                                                                                                                                                                                                          k t1 in
                                                                                                                                                                                                                                                                                                        g8 arg k in
                                                                                                                                                                                                                                                                                                      f2 arg k in
                                                                                                                                                                                                                                                                                                    f2 arg k in
                                                                                                                                                                                                                                                                                                  f4 arg k in
                                                                                                                                                                                                                                                                                                arg f4 k in
                                                                                                                                                                                                                                                                                              g3 g219 k in
                                                                                                                                                                                                                                                                                            g3 arg k in
                                                                                                                                                                                                                                                                                          f3 f4 k in
                                                                                                                                                                                                                                                                                        f3 g218 k in
                                                                                                                                                                                                                                                                                      f2 arg k in
                                                                                                                                                                                                                                                                                    f4 arg k in
                                                                                                                                                                                                                                                                                  arg f4 k in
                                                                                                                                                                                                                                                                                g3 g217 k in
                                                                                                                                                                                                                                                                              g3 arg k in
                                                                                                                                                                                                                                                                            f3 g216 k in
                                                                                                                                                                                                                                                                          f3 arg k in
                                                                                                                                                                                                                                                                        f2 arg k in
                                                                                                                                                                                                                                                                      f4 arg k in
                                                                                                                                                                                                                                                                    arg f4 k in
                                                                                                                                                                                                                                                                  g3 g215 k in
                                                                                                                                                                                                                                                                g3 arg k in
                                                                                                                                                                                                                                                              f3 f4 k in
                                                                                                                                                                                                                                                            f3 g214 k in
                                                                                                                                                                                                                                                          f2 arg k in
                                                                                                                                                                                                                                                        match t1 with
                                                                                                                                                                                                                                                        | true1 ->
                                                                                                                                                                                                                                                          let t2 = Cons1['0',g212] in
                                                                                                                                                                                                                                                          k t2
                                                                                                                                                                                                                                                        | false0 ->
                                                                                                                                                                                                                                                          let k = [f4], fun [f2] arg -> arg f2 k in
                                                                                                                                                                                                                                                          g211 g213 k
                                                                                                                                                                                                                                                      | false0 ->
                                                                                                                                                                                                                                                        let t1 = PRIM_EqInt(f4,0) in
                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f7], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                                                  let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                                                    let k = [f3,f4], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                                                        let k = [f2], fun [f2] arg ->
                                                                                                                                                                                                                                                                                                                          let t1 = PRIM_MulInt(f2,512) in
                                                                                                                                                                                                                                                                                                                          let t2 = PRIM_MakeBytes(512) in
                                                                                                                                                                                                                                                                                                                          let t3 = [arg,t1,t2], fun [f1,f2,f3] me arg k ->
                                                                                                                                                                                                                                                                                                                            let t1 = PRIM_LessInt(arg,512) in
                                                                                                                                                                                                                                                                                                                            let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                                              match arg with
                                                                                                                                                                                                                                                                                                                              | true1 -> k g234
                                                                                                                                                                                                                                                                                                                              | false0 ->
                                                                                                                                                                                                                                                                                                                                let t1 = PRIM_AddInt(f3,f5) in
                                                                                                                                                                                                                                                                                                                                let t2 = PRIM_GetBytes(f2,t1) in
                                                                                                                                                                                                                                                                                                                                let t3 = PRIM_SetBytes(f4,f5,t2) in
                                                                                                                                                                                                                                                                                                                                let t4 = PRIM_AddInt(f5,1) in
                                                                                                                                                                                                                                                                                                                                f6 t4 k in
                                                                                                                                                                                                                                                                                                                            match t1 with
                                                                                                                                                                                                                                                                                                                            | true1 -> k g232
                                                                                                                                                                                                                                                                                                                            | false0 -> k g233 in
                                                                                                                                                                                                                                                                                                                          let k = [t2], fun [f2] arg ->
                                                                                                                                                                                                                                                                                                                            let t1 = Sector0[f2] in
                                                                                                                                                                                                                                                                                                                            k t1 in
                                                                                                                                                                                                                                                                                                                          t3 0 k in
                                                                                                                                                                                                                                                                                                                        match f3 with
                                                                                                                                                                                                                                                                                                                        | Disk0(t1) -> k t1 in
                                                                                                                                                                                                                                                                                                                      g8 arg k in
                                                                                                                                                                                                                                                                                                                    f2 arg k in
                                                                                                                                                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                                                                                                                                                f6 arg k in
                                                                                                                                                                                                                                                                                                              arg f6 k in
                                                                                                                                                                                                                                                                                                            g3 g231 k in
                                                                                                                                                                                                                                                                                                          g3 arg k in
                                                                                                                                                                                                                                                                                                        f3 f6 k in
                                                                                                                                                                                                                                                                                                      f3 g230 k in
                                                                                                                                                                                                                                                                                                    f2 arg k in
                                                                                                                                                                                                                                                                                                  f6 arg k in
                                                                                                                                                                                                                                                                                                arg f6 k in
                                                                                                                                                                                                                                                                                              g3 g229 k in
                                                                                                                                                                                                                                                                                            g3 arg k in
                                                                                                                                                                                                                                                                                          f3 g228 k in
                                                                                                                                                                                                                                                                                        f3 arg k in
                                                                                                                                                                                                                                                                                      f2 arg k in
                                                                                                                                                                                                                                                                                    f6 arg k in
                                                                                                                                                                                                                                                                                  arg f6 k in
                                                                                                                                                                                                                                                                                g3 g227 k in
                                                                                                                                                                                                                                                                              g3 arg k in
                                                                                                                                                                                                                                                                            f3 f6 k in
                                                                                                                                                                                                                                                                          f3 g226 k in
                                                                                                                                                                                                                                                                        f2 arg k in
                                                                                                                                                                                                                                                                      f6 arg k in
                                                                                                                                                                                                                                                                    arg f6 k in
                                                                                                                                                                                                                                                                  g3 g225 k in
                                                                                                                                                                                                                                                                g3 arg k in
                                                                                                                                                                                                                                                              f3 g224 k in
                                                                                                                                                                                                                                                            f3 arg k in
                                                                                                                                                                                                                                                          f2 arg k in
                                                                                                                                                                                                                                                        match t1 with
                                                                                                                                                                                                                                                        | true1 ->
                                                                                                                                                                                                                                                          let t2 = Cons1['0',g222] in
                                                                                                                                                                                                                                                          k t2
                                                                                                                                                                                                                                                        | false0 ->
                                                                                                                                                                                                                                                          let k = [f4], fun [f2] arg -> arg f2 k in
                                                                                                                                                                                                                                                          g221 g223 k in
                                                                                                                                                                                                                                                    match t1 with
                                                                                                                                                                                                                                                    | true1 -> k g208
                                                                                                                                                                                                                                                    | false0 ->
                                                                                                                                                                                                                                                      let t2 = PRIM_LessInt(f4,32) in
                                                                                                                                                                                                                                                      match t2 with
                                                                                                                                                                                                                                                      | true1 -> k g209
                                                                                                                                                                                                                                                      | false0 -> k g210 in
                                                                                                                                                                                                                                                  match t8 with
                                                                                                                                                                                                                                                  | true1 ->
                                                                                                                                                                                                                                                    let t9 = PRIM_LessInt(t5,0) in
                                                                                                                                                                                                                                                    let k = [f2,f3,t1,t5,t6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                      match arg with
                                                                                                                                                                                                                                                      | true1 ->
                                                                                                                                                                                                                                                        let t1 = PRIM_EqInt(f5,0) in
                                                                                                                                                                                                                                                        let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                          let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                            let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                              let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                    let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                        let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                          let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                            let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                              let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                  let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                        let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                          let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                                let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                                    let k = [f3], fun [f2] arg ->
                                                                                                                                                                                                                                                                                                      let k = [], fun [] arg ->
                                                                                                                                                                                                                                                                                                        let k = [], fun [] arg ->
                                                                                                                                                                                                                                                                                                          let t1 = PRIM_Crash(g192) in
                                                                                                                                                                                                                                                                                                          k t1 in
                                                                                                                                                                                                                                                                                                        g8 arg k in
                                                                                                                                                                                                                                                                                                      f2 arg k in
                                                                                                                                                                                                                                                                                                    f2 arg k in
                                                                                                                                                                                                                                                                                                  f4 arg k in
                                                                                                                                                                                                                                                                                                arg f4 k in
                                                                                                                                                                                                                                                                                              g3 g191 k in
                                                                                                                                                                                                                                                                                            g3 arg k in
                                                                                                                                                                                                                                                                                          f3 f4 k in
                                                                                                                                                                                                                                                                                        f3 g190 k in
                                                                                                                                                                                                                                                                                      f2 arg k in
                                                                                                                                                                                                                                                                                    f4 arg k in
                                                                                                                                                                                                                                                                                  arg f4 k in
                                                                                                                                                                                                                                                                                g3 g189 k in
                                                                                                                                                                                                                                                                              g3 arg k in
                                                                                                                                                                                                                                                                            f3 g188 k in
                                                                                                                                                                                                                                                                          f3 arg k in
                                                                                                                                                                                                                                                                        f2 arg k in
                                                                                                                                                                                                                                                                      f4 arg k in
                                                                                                                                                                                                                                                                    arg f4 k in
                                                                                                                                                                                                                                                                  g3 g187 k in
                                                                                                                                                                                                                                                                g3 arg k in
                                                                                                                                                                                                                                                              f3 f4 k in
                                                                                                                                                                                                                                                            f3 g186 k in
                                                                                                                                                                                                                                                          f2 arg k in
                                                                                                                                                                                                                                                        match t1 with
                                                                                                                                                                                                                                                        | true1 ->
                                                                                                                                                                                                                                                          let t2 = Cons1['0',g184] in
                                                                                                                                                                                                                                                          k t2
                                                                                                                                                                                                                                                        | false0 ->
                                                                                                                                                                                                                                                          let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                                                                                                                                                                                          g183 g185 k
                                                                                                                                                                                                                                                      | false0 ->
                                                                                                                                                                                                                                                        let t1 = PRIM_EqInt(f5,0) in
                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                                  let k = [f3,f4,f5,f6], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                                                                                                    let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                                                      let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                                                                                        let k = [f3,f4], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                                                          let t1 = PRIM_MulInt(f2,512) in
                                                                                                                                                                                                                                                                                                                          let k = [arg,t1], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                                                                                            let t1 = [f2,f3,arg], fun [f1,f2,f3] me arg k ->
                                                                                                                                                                                                                                                                                                                              let t1 = PRIM_LessInt(arg,512) in
                                                                                                                                                                                                                                                                                                                              let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                                                                                                match arg with
                                                                                                                                                                                                                                                                                                                                | true1 -> k g206
                                                                                                                                                                                                                                                                                                                                | false0 ->
                                                                                                                                                                                                                                                                                                                                  let t1 = PRIM_GetBytes(f4,f5) in
                                                                                                                                                                                                                                                                                                                                  let t2 = PRIM_AddInt(f3,f5) in
                                                                                                                                                                                                                                                                                                                                  let t3 = PRIM_SetBytes(f2,t2,t1) in
                                                                                                                                                                                                                                                                                                                                  let t4 = PRIM_AddInt(f5,1) in
                                                                                                                                                                                                                                                                                                                                  f6 t4 k in
                                                                                                                                                                                                                                                                                                                              match t1 with
                                                                                                                                                                                                                                                                                                                              | true1 -> k g204
                                                                                                                                                                                                                                                                                                                              | false0 -> k g205 in
                                                                                                                                                                                                                                                                                                                            t1 0 k in
                                                                                                                                                                                                                                                                                                                          match f3 with
                                                                                                                                                                                                                                                                                                                          | Sector0(t2) -> k t2 in
                                                                                                                                                                                                                                                                                                                        match f2 with
                                                                                                                                                                                                                                                                                                                        | Disk0(t1) -> k t1 in
                                                                                                                                                                                                                                                                                                                      g8 arg k in
                                                                                                                                                                                                                                                                                                                    f2 arg k in
                                                                                                                                                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                                                                                                                                                f7 arg k in
                                                                                                                                                                                                                                                                                                              arg f7 k in
                                                                                                                                                                                                                                                                                                            g3 g203 k in
                                                                                                                                                                                                                                                                                                          g3 arg k in
                                                                                                                                                                                                                                                                                                        f3 f7 k in
                                                                                                                                                                                                                                                                                                      f3 g202 k in
                                                                                                                                                                                                                                                                                                    f2 arg k in
                                                                                                                                                                                                                                                                                                  f7 arg k in
                                                                                                                                                                                                                                                                                                arg f7 k in
                                                                                                                                                                                                                                                                                              g3 g201 k in
                                                                                                                                                                                                                                                                                            g3 arg k in
                                                                                                                                                                                                                                                                                          f3 g200 k in
                                                                                                                                                                                                                                                                                        f3 arg k in
                                                                                                                                                                                                                                                                                      f2 arg k in
                                                                                                                                                                                                                                                                                    f7 arg k in
                                                                                                                                                                                                                                                                                  arg f7 k in
                                                                                                                                                                                                                                                                                g3 g199 k in
                                                                                                                                                                                                                                                                              g3 arg k in
                                                                                                                                                                                                                                                                            f3 f7 k in
                                                                                                                                                                                                                                                                          f3 g198 k in
                                                                                                                                                                                                                                                                        f2 arg k in
                                                                                                                                                                                                                                                                      f7 arg k in
                                                                                                                                                                                                                                                                    arg f7 k in
                                                                                                                                                                                                                                                                  g3 g197 k in
                                                                                                                                                                                                                                                                g3 arg k in
                                                                                                                                                                                                                                                              f3 g196 k in
                                                                                                                                                                                                                                                            f3 arg k in
                                                                                                                                                                                                                                                          f2 arg k in
                                                                                                                                                                                                                                                        match t1 with
                                                                                                                                                                                                                                                        | true1 ->
                                                                                                                                                                                                                                                          let t2 = Cons1['0',g194] in
                                                                                                                                                                                                                                                          k t2
                                                                                                                                                                                                                                                        | false0 ->
                                                                                                                                                                                                                                                          let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                                                                                                                                                                                          g193 g195 k in
                                                                                                                                                                                                                                                    match t9 with
                                                                                                                                                                                                                                                    | true1 -> k g180
                                                                                                                                                                                                                                                    | false0 ->
                                                                                                                                                                                                                                                      let t10 = PRIM_LessInt(t5,32) in
                                                                                                                                                                                                                                                      match t10 with
                                                                                                                                                                                                                                                      | true1 -> k g181
                                                                                                                                                                                                                                                      | false0 -> k g182
                                                                                                                                                                                                                                                  | false0 -> k g207 in
                                                                                                                                                                                                                                          f2 arg k in
                                                                                                                                                                                                                                        f8 arg k in
                                                                                                                                                                                                                                      arg f8 k in
                                                                                                                                                                                                                                    g3 g175 k in
                                                                                                                                                                                                                                  g3 arg k in
                                                                                                                                                                                                                                f3 f8 k in
                                                                                                                                                                                                                              f3 g174 k in
                                                                                                                                                                                                                            f2 arg k in
                                                                                                                                                                                                                          f8 arg k in
                                                                                                                                                                                                                        arg f8 k in
                                                                                                                                                                                                                      g3 g173 k in
                                                                                                                                                                                                                    g3 arg k in
                                                                                                                                                                                                                  f3 f8 k in
                                                                                                                                                                                                                f3 f8 k in
                                                                                                                                                                                                              f2 arg k in
                                                                                                                                                                                                            f9 arg k in
                                                                                                                                                                                                          arg f9 k in
                                                                                                                                                                                                        g3 g172 k in
                                                                                                                                                                                                      g3 arg k in
                                                                                                                                                                                                    f3 f9 k in
                                                                                                                                                                                                  f3 g171 k in
                                                                                                                                                                                                f2 arg k in
                                                                                                                                                                                              f9 arg k in
                                                                                                                                                                                            arg f9 k in
                                                                                                                                                                                          g3 g170 k in
                                                                                                                                                                                        g3 arg k in
                                                                                                                                                                                      f3 f9 k in
                                                                                                                                                                                    f3 f9 k in
                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                f10 arg k in
                                                                                                                                                                              arg f10 k in
                                                                                                                                                                            g3 g169 k in
                                                                                                                                                                          g3 arg k in
                                                                                                                                                                        f3 f10 k in
                                                                                                                                                                      f3 g168 k in
                                                                                                                                                                    f2 arg k in
                                                                                                                                                                  arg 64 k in
                                                                                                                                                                g166 g167 k in
                                                                                                                                                              f2 arg k in
                                                                                                                                                            match t1 with
                                                                                                                                                            | true1 ->
                                                                                                                                                              let t2 = Cons1['0',g164] in
                                                                                                                                                              k t2
                                                                                                                                                            | false0 ->
                                                                                                                                                              let k = [f6], fun [f2] arg -> arg f2 k in
                                                                                                                                                              g163 g165 k in
                                                                                                                                                          f2 arg k in
                                                                                                                                                        match t1 with
                                                                                                                                                        | true1 ->
                                                                                                                                                          let t2 = Cons1['0',g161] in
                                                                                                                                                          k t2
                                                                                                                                                        | false0 ->
                                                                                                                                                          let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                                                                                          g160 g162 k in
                                                                                                                                                      match f6 with
                                                                                                                                                      | Block0(t3) -> k t3 in
                                                                                                                                                    f2 arg k in
                                                                                                                                                  f8 arg k in
                                                                                                                                                arg f8 k in
                                                                                                                                              g3 g159 k in
                                                                                                                                            g3 arg k in
                                                                                                                                          f3 f8 k in
                                                                                                                                        f3 g158 k in
                                                                                                                                      f2 arg k in
                                                                                                                                    f8 arg k in
                                                                                                                                  arg f8 k in
                                                                                                                                g3 g157 k in
                                                                                                                              g3 arg k in
                                                                                                                            f3 f8 k in
                                                                                                                          f3 f8 k in
                                                                                                                        f2 arg k in
                                                                                                                      f9 arg k in
                                                                                                                    arg f9 k in
                                                                                                                  g3 g156 k in
                                                                                                                g3 arg k in
                                                                                                              f3 f9 k in
                                                                                                            f3 g155 k in
                                                                                                          f2 arg k in
                                                                                                        f9 arg k in
                                                                                                      arg f9 k in
                                                                                                    g3 g154 k in
                                                                                                  g3 arg k in
                                                                                                f3 g153 k in
                                                                                              f3 arg k in
                                                                                            f2 arg k in
                                                                                          match t1 with
                                                                                          | true1 ->
                                                                                            let t2 = Cons1['0',g151] in
                                                                                            k t2
                                                                                          | false0 ->
                                                                                            let k = [f7], fun [f2] arg -> arg f2 k in
                                                                                            g150 g152 k in
                                                                                        f2 arg k in
                                                                                      match t2 with
                                                                                      | true1 ->
                                                                                        let t3 = Cons1['0',g148] in
                                                                                        k t3
                                                                                      | false0 ->
                                                                                        let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                        g147 g149 k in
                                                                                  match t3 with
                                                                                  | true1 -> k g134
                                                                                  | false0 ->
                                                                                    let t4 = PRIM_LessInt(f5,256) in
                                                                                    match t4 with
                                                                                    | true1 -> k g135
                                                                                    | false0 -> k g136 in
                                                                                f2 arg k in
                                                                              arg 64 k in
                                                                            g132 g133 k in
                                                                        let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                          let t1 = [f2,f3,f4], fun [f1,f2,f3] me arg k ->
                                                                            let t1 = PRIM_LessInt(125,arg) in
                                                                            match t1 with
                                                                            | true1 -> k g239
                                                                            | false0 ->
                                                                              let t2 = PRIM_LessInt(arg,0) in
                                                                              let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                                let k = [f2,f3,f5,f6], fun [f2,f3,f4,f5] arg ->
                                                                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                    let t1 = PRIM_FreezeBytes(arg) in
                                                                                    let t2 = PRIM_EqInt(f4,0) in
                                                                                    let k = [f2,f3,f4,f5,t1], fun [f2,f3,f4,f5,f6] arg ->
                                                                                      let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                        let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                          let k = [f2,f3,f4,f5,f7,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                            let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                              let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                  let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                      let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                        let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                          let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                            let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                              let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                  let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                                                                                                    let k = [f3,f4], fun [f2,f3] arg ->
                                                                                                                      let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                        let t1 = PRIM_PutChar('\n') in
                                                                                                                        let t2 = PRIM_AddInt(f2,1) in
                                                                                                                        f3 t2 k in
                                                                                                                      g8 arg k in
                                                                                                                    f2 arg k in
                                                                                                                  f2 arg k in
                                                                                                                f6 arg k in
                                                                                                              arg f6 k in
                                                                                                            g3 g335 k in
                                                                                                          g3 arg k in
                                                                                                        f3 f6 k in
                                                                                                      f3 f6 k in
                                                                                                    f2 arg k in
                                                                                                  f7 arg k in
                                                                                                arg f7 k in
                                                                                              g3 g334 k in
                                                                                            g3 arg k in
                                                                                          f3 f6 k in
                                                                                        f3 g333 k in
                                                                                      f2 arg k in
                                                                                    match t2 with
                                                                                    | true1 ->
                                                                                      let t3 = Cons1['0',g331] in
                                                                                      k t3
                                                                                    | false0 ->
                                                                                      let k = [f4], fun [f2] arg -> arg f2 k in
                                                                                      g330 g332 k in
                                                                                  match arg with
                                                                                  | Block0(t1) -> k t1 in
                                                                                match arg with
                                                                                | true1 ->
                                                                                  let t1 = PRIM_EqInt(f5,0) in
                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                        let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                          let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                            let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                              let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                        let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                          let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                            let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                              let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                  let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                    let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                      let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                        let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                          let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                            let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                              let k = [f3], fun [f2] arg ->
                                                                                                                                let k = [], fun [] arg ->
                                                                                                                                  let k = [], fun [] arg ->
                                                                                                                                    let t1 = PRIM_Crash(g252) in
                                                                                                                                    k t1 in
                                                                                                                                  g8 arg k in
                                                                                                                                f2 arg k in
                                                                                                                              f2 arg k in
                                                                                                                            f4 arg k in
                                                                                                                          arg f4 k in
                                                                                                                        g3 g251 k in
                                                                                                                      g3 arg k in
                                                                                                                    f3 f4 k in
                                                                                                                  f3 g250 k in
                                                                                                                f2 arg k in
                                                                                                              f4 arg k in
                                                                                                            arg f4 k in
                                                                                                          g3 g249 k in
                                                                                                        g3 arg k in
                                                                                                      f3 g248 k in
                                                                                                    f3 arg k in
                                                                                                  f2 arg k in
                                                                                                f4 arg k in
                                                                                              arg f4 k in
                                                                                            g3 g247 k in
                                                                                          g3 arg k in
                                                                                        f3 f4 k in
                                                                                      f3 g246 k in
                                                                                    f2 arg k in
                                                                                  match t1 with
                                                                                  | true1 ->
                                                                                    let t2 = Cons1['0',g244] in
                                                                                    k t2
                                                                                  | false0 ->
                                                                                    let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                    g243 g245 k
                                                                                | false0 ->
                                                                                  let t1 = PRIM_DivInt(f5,8) in
                                                                                  let t2 = PRIM_EqInt(f5,0) in
                                                                                  let k = [f2,f3,f4,f5,t1], fun [f2,f3,f4,f5,f6] arg ->
                                                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                      let t1 = PRIM_EqInt(f6,0) in
                                                                                      let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                        let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                          let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                            let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                              let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                  let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                      let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                        let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                          let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                            let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                              let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                  let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                      let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                        let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                          let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                            let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                              let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                    let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                      let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                        let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                          let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                            let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                              let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                  let t1 = PRIM_DivInt(f5,8) in
                                                                                                                                                  let t2 = PRIM_EqInt(t1,0) in
                                                                                                                                                  let k = [f2,f3,f4,f5,t1], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                      let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                        let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                              let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                  let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                    let k = [f5], fun [f2] arg ->
                                                                                                                                                                      let t1 = PRIM_ModInt(f2,8) in
                                                                                                                                                                      let t2 = PRIM_MulInt(64,t1) in
                                                                                                                                                                      let k = [t2], fun [f2] arg ->
                                                                                                                                                                        let t1 = PRIM_MakeBytes(64) in
                                                                                                                                                                        let t2 = [f2,arg,t1], fun [f1,f2,f3] me arg k ->
                                                                                                                                                                          let t1 = PRIM_LessInt(arg,64) in
                                                                                                                                                                          let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                            match arg with
                                                                                                                                                                            | true1 -> k g329
                                                                                                                                                                            | false0 ->
                                                                                                                                                                              let t1 = PRIM_AddInt(f2,f5) in
                                                                                                                                                                              let t2 = PRIM_GetBytes(f3,t1) in
                                                                                                                                                                              let t3 = PRIM_SetBytes(f4,f5,t2) in
                                                                                                                                                                              let t4 = PRIM_AddInt(f5,1) in
                                                                                                                                                                              f6 t4 k in
                                                                                                                                                                          match t1 with
                                                                                                                                                                          | true1 -> k g327
                                                                                                                                                                          | false0 -> k g328 in
                                                                                                                                                                        let k = [t1], fun [f2] arg ->
                                                                                                                                                                          let t1 = Block0[f2] in
                                                                                                                                                                          k t1 in
                                                                                                                                                                        t2 0 k in
                                                                                                                                                                      match arg with
                                                                                                                                                                      | Sector0(t3) -> k t3 in
                                                                                                                                                                    match f4 with
                                                                                                                                                                    | DiskC10(t1,t2) ->
                                                                                                                                                                      let t3 = PRIM_DeRef(t2) in
                                                                                                                                                                      match t3 with
                                                                                                                                                                      | Cache_Line0(t4,t5,t6) ->
                                                                                                                                                                        let t7 = PRIM_EqInt(f6,t5) in
                                                                                                                                                                        match t7 with
                                                                                                                                                                        | true1 -> k t6
                                                                                                                                                                        | false0 ->
                                                                                                                                                                          let t8 = PRIM_DeRef(t4) in
                                                                                                                                                                          let k = [f2,f3,f6,t1,t2], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                            let t1 = PRIM_LessInt(f4,0) in
                                                                                                                                                                            let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                              let k = [f4,f6], fun [f2,f3] arg ->
                                                                                                                                                                                let t1 = PRIM_MakeRef(g326) in
                                                                                                                                                                                let t2 = Cache_Line0[t1,f2,arg] in
                                                                                                                                                                                let t3 = PRIM_SetRef(f3,t2) in
                                                                                                                                                                                k arg in
                                                                                                                                                                              match arg with
                                                                                                                                                                              | true1 ->
                                                                                                                                                                                let t1 = PRIM_EqInt(f4,0) in
                                                                                                                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                    let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                        let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                          let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                            let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                              let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                    let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                      let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                        let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                          let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                            let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                              let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                  let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                      let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                        let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                          let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                            let k = [f3], fun [f2] arg ->
                                                                                                                                                                                                                              let k = [], fun [] arg ->
                                                                                                                                                                                                                                let k = [], fun [] arg ->
                                                                                                                                                                                                                                  let t1 = PRIM_Crash(g311) in
                                                                                                                                                                                                                                  k t1 in
                                                                                                                                                                                                                                g8 arg k in
                                                                                                                                                                                                                              f2 arg k in
                                                                                                                                                                                                                            f2 arg k in
                                                                                                                                                                                                                          f4 arg k in
                                                                                                                                                                                                                        arg f4 k in
                                                                                                                                                                                                                      g3 g310 k in
                                                                                                                                                                                                                    g3 arg k in
                                                                                                                                                                                                                  f3 f4 k in
                                                                                                                                                                                                                f3 g309 k in
                                                                                                                                                                                                              f2 arg k in
                                                                                                                                                                                                            f4 arg k in
                                                                                                                                                                                                          arg f4 k in
                                                                                                                                                                                                        g3 g308 k in
                                                                                                                                                                                                      g3 arg k in
                                                                                                                                                                                                    f3 g307 k in
                                                                                                                                                                                                  f3 arg k in
                                                                                                                                                                                                f2 arg k in
                                                                                                                                                                                              f4 arg k in
                                                                                                                                                                                            arg f4 k in
                                                                                                                                                                                          g3 g306 k in
                                                                                                                                                                                        g3 arg k in
                                                                                                                                                                                      f3 f4 k in
                                                                                                                                                                                    f3 g305 k in
                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                match t1 with
                                                                                                                                                                                | true1 ->
                                                                                                                                                                                  let t2 = Cons1['0',g303] in
                                                                                                                                                                                  k t2
                                                                                                                                                                                | false0 ->
                                                                                                                                                                                  let k = [f4], fun [f2] arg -> arg f2 k in
                                                                                                                                                                                  g302 g304 k
                                                                                                                                                                              | false0 ->
                                                                                                                                                                                let t1 = PRIM_EqInt(f4,0) in
                                                                                                                                                                                let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                    let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                      let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                            let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                              let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                  let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                    let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                              let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                          let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                            let k = [f3,f4], fun [f2,f3] arg ->
                                                                                                                                                                                                                                              let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                let k = [f2], fun [f2] arg ->
                                                                                                                                                                                                                                                  let t1 = PRIM_MulInt(f2,512) in
                                                                                                                                                                                                                                                  let t2 = PRIM_MakeBytes(512) in
                                                                                                                                                                                                                                                  let t3 = [arg,t1,t2], fun [f1,f2,f3] me arg k ->
                                                                                                                                                                                                                                                    let t1 = PRIM_LessInt(arg,512) in
                                                                                                                                                                                                                                                    let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                      match arg with
                                                                                                                                                                                                                                                      | true1 -> k g325
                                                                                                                                                                                                                                                      | false0 ->
                                                                                                                                                                                                                                                        let t1 = PRIM_AddInt(f3,f5) in
                                                                                                                                                                                                                                                        let t2 = PRIM_GetBytes(f2,t1) in
                                                                                                                                                                                                                                                        let t3 = PRIM_SetBytes(f4,f5,t2) in
                                                                                                                                                                                                                                                        let t4 = PRIM_AddInt(f5,1) in
                                                                                                                                                                                                                                                        f6 t4 k in
                                                                                                                                                                                                                                                    match t1 with
                                                                                                                                                                                                                                                    | true1 -> k g323
                                                                                                                                                                                                                                                    | false0 -> k g324 in
                                                                                                                                                                                                                                                  let k = [t2], fun [f2] arg ->
                                                                                                                                                                                                                                                    let t1 = Sector0[f2] in
                                                                                                                                                                                                                                                    k t1 in
                                                                                                                                                                                                                                                  t3 0 k in
                                                                                                                                                                                                                                                match f3 with
                                                                                                                                                                                                                                                | Disk0(t1) -> k t1 in
                                                                                                                                                                                                                                              g8 arg k in
                                                                                                                                                                                                                                            f2 arg k in
                                                                                                                                                                                                                                          f2 arg k in
                                                                                                                                                                                                                                        f6 arg k in
                                                                                                                                                                                                                                      arg f6 k in
                                                                                                                                                                                                                                    g3 g322 k in
                                                                                                                                                                                                                                  g3 arg k in
                                                                                                                                                                                                                                f3 f6 k in
                                                                                                                                                                                                                              f3 g321 k in
                                                                                                                                                                                                                            f2 arg k in
                                                                                                                                                                                                                          f6 arg k in
                                                                                                                                                                                                                        arg f6 k in
                                                                                                                                                                                                                      g3 g320 k in
                                                                                                                                                                                                                    g3 arg k in
                                                                                                                                                                                                                  f3 g319 k in
                                                                                                                                                                                                                f3 arg k in
                                                                                                                                                                                                              f2 arg k in
                                                                                                                                                                                                            f6 arg k in
                                                                                                                                                                                                          arg f6 k in
                                                                                                                                                                                                        g3 g318 k in
                                                                                                                                                                                                      g3 arg k in
                                                                                                                                                                                                    f3 f6 k in
                                                                                                                                                                                                  f3 g317 k in
                                                                                                                                                                                                f2 arg k in
                                                                                                                                                                                              f6 arg k in
                                                                                                                                                                                            arg f6 k in
                                                                                                                                                                                          g3 g316 k in
                                                                                                                                                                                        g3 arg k in
                                                                                                                                                                                      f3 g315 k in
                                                                                                                                                                                    f3 arg k in
                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                match t1 with
                                                                                                                                                                                | true1 ->
                                                                                                                                                                                  let t2 = Cons1['0',g313] in
                                                                                                                                                                                  k t2
                                                                                                                                                                                | false0 ->
                                                                                                                                                                                  let k = [f4], fun [f2] arg -> arg f2 k in
                                                                                                                                                                                  g312 g314 k in
                                                                                                                                                                            match t1 with
                                                                                                                                                                            | true1 -> k g299
                                                                                                                                                                            | false0 ->
                                                                                                                                                                              let t2 = PRIM_LessInt(f4,32) in
                                                                                                                                                                              match t2 with
                                                                                                                                                                              | true1 -> k g300
                                                                                                                                                                              | false0 -> k g301 in
                                                                                                                                                                          match t8 with
                                                                                                                                                                          | true1 ->
                                                                                                                                                                            let t9 = PRIM_LessInt(t5,0) in
                                                                                                                                                                            let k = [f2,f3,t1,t5,t6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                              match arg with
                                                                                                                                                                              | true1 ->
                                                                                                                                                                                let t1 = PRIM_EqInt(f5,0) in
                                                                                                                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                    let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                        let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                          let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                            let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                              let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                  let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                    let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                      let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                        let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                          let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                            let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                              let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                  let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                      let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                        let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                          let k = [f2,f3], fun [f2,f3] arg ->
                                                                                                                                                                                                                            let k = [f3], fun [f2] arg ->
                                                                                                                                                                                                                              let k = [], fun [] arg ->
                                                                                                                                                                                                                                let k = [], fun [] arg ->
                                                                                                                                                                                                                                  let t1 = PRIM_Crash(g283) in
                                                                                                                                                                                                                                  k t1 in
                                                                                                                                                                                                                                g8 arg k in
                                                                                                                                                                                                                              f2 arg k in
                                                                                                                                                                                                                            f2 arg k in
                                                                                                                                                                                                                          f4 arg k in
                                                                                                                                                                                                                        arg f4 k in
                                                                                                                                                                                                                      g3 g282 k in
                                                                                                                                                                                                                    g3 arg k in
                                                                                                                                                                                                                  f3 f4 k in
                                                                                                                                                                                                                f3 g281 k in
                                                                                                                                                                                                              f2 arg k in
                                                                                                                                                                                                            f4 arg k in
                                                                                                                                                                                                          arg f4 k in
                                                                                                                                                                                                        g3 g280 k in
                                                                                                                                                                                                      g3 arg k in
                                                                                                                                                                                                    f3 g279 k in
                                                                                                                                                                                                  f3 arg k in
                                                                                                                                                                                                f2 arg k in
                                                                                                                                                                                              f4 arg k in
                                                                                                                                                                                            arg f4 k in
                                                                                                                                                                                          g3 g278 k in
                                                                                                                                                                                        g3 arg k in
                                                                                                                                                                                      f3 f4 k in
                                                                                                                                                                                    f3 g277 k in
                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                match t1 with
                                                                                                                                                                                | true1 ->
                                                                                                                                                                                  let t2 = Cons1['0',g275] in
                                                                                                                                                                                  k t2
                                                                                                                                                                                | false0 ->
                                                                                                                                                                                  let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                                                                                                                  g274 g276 k
                                                                                                                                                                              | false0 ->
                                                                                                                                                                                let t1 = PRIM_EqInt(f5,0) in
                                                                                                                                                                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                          let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                            let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                              let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                  let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                    let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                                                                                                                                                                                                                                      let k = [f2,f3,f4,f5,f6,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                                                                                                                                                                                        let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                          let k = [f3,f4,f5,f6], fun [f2,f3,f4,f5] arg ->
                                                                                                                                                                                                                                            let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                              let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                                                                                                                                                                let k = [f3,f4], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                  let t1 = PRIM_MulInt(f2,512) in
                                                                                                                                                                                                                                                  let k = [arg,t1], fun [f2,f3] arg ->
                                                                                                                                                                                                                                                    let t1 = [f2,f3,arg], fun [f1,f2,f3] me arg k ->
                                                                                                                                                                                                                                                      let t1 = PRIM_LessInt(arg,512) in
                                                                                                                                                                                                                                                      let k = [f1,f2,f3,arg,me], fun [f2,f3,f4,f5,f6] arg ->
                                                                                                                                                                                                                                                        match arg with
                                                                                                                                                                                                                                                        | true1 -> k g297
                                                                                                                                                                                                                                                        | false0 ->
                                                                                                                                                                                                                                                          let t1 = PRIM_GetBytes(f4,f5) in
                                                                                                                                                                                                                                                          let t2 = PRIM_AddInt(f3,f5) in
                                                                                                                                                                                                                                                          let t3 = PRIM_SetBytes(f2,t2,t1) in
                                                                                                                                                                                                                                                          let t4 = PRIM_AddInt(f5,1) in
                                                                                                                                                                                                                                                          f6 t4 k in
                                                                                                                                                                                                                                                      match t1 with
                                                                                                                                                                                                                                                      | true1 -> k g295
                                                                                                                                                                                                                                                      | false0 -> k g296 in
                                                                                                                                                                                                                                                    t1 0 k in
                                                                                                                                                                                                                                                  match f3 with
                                                                                                                                                                                                                                                  | Sector0(t2) -> k t2 in
                                                                                                                                                                                                                                                match f2 with
                                                                                                                                                                                                                                                | Disk0(t1) -> k t1 in
                                                                                                                                                                                                                                              g8 arg k in
                                                                                                                                                                                                                                            f2 arg k in
                                                                                                                                                                                                                                          f2 arg k in
                                                                                                                                                                                                                                        f7 arg k in
                                                                                                                                                                                                                                      arg f7 k in
                                                                                                                                                                                                                                    g3 g294 k in
                                                                                                                                                                                                                                  g3 arg k in
                                                                                                                                                                                                                                f3 f7 k in
                                                                                                                                                                                                                              f3 g293 k in
                                                                                                                                                                                                                            f2 arg k in
                                                                                                                                                                                                                          f7 arg k in
                                                                                                                                                                                                                        arg f7 k in
                                                                                                                                                                                                                      g3 g292 k in
                                                                                                                                                                                                                    g3 arg k in
                                                                                                                                                                                                                  f3 g291 k in
                                                                                                                                                                                                                f3 arg k in
                                                                                                                                                                                                              f2 arg k in
                                                                                                                                                                                                            f7 arg k in
                                                                                                                                                                                                          arg f7 k in
                                                                                                                                                                                                        g3 g290 k in
                                                                                                                                                                                                      g3 arg k in
                                                                                                                                                                                                    f3 f7 k in
                                                                                                                                                                                                  f3 g289 k in
                                                                                                                                                                                                f2 arg k in
                                                                                                                                                                                              f7 arg k in
                                                                                                                                                                                            arg f7 k in
                                                                                                                                                                                          g3 g288 k in
                                                                                                                                                                                        g3 arg k in
                                                                                                                                                                                      f3 g287 k in
                                                                                                                                                                                    f3 arg k in
                                                                                                                                                                                  f2 arg k in
                                                                                                                                                                                match t1 with
                                                                                                                                                                                | true1 ->
                                                                                                                                                                                  let t2 = Cons1['0',g285] in
                                                                                                                                                                                  k t2
                                                                                                                                                                                | false0 ->
                                                                                                                                                                                  let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                                                                                                                  g284 g286 k in
                                                                                                                                                                            match t9 with
                                                                                                                                                                            | true1 -> k g271
                                                                                                                                                                            | false0 ->
                                                                                                                                                                              let t10 = PRIM_LessInt(t5,32) in
                                                                                                                                                                              match t10 with
                                                                                                                                                                              | true1 -> k g272
                                                                                                                                                                              | false0 -> k g273
                                                                                                                                                                          | false0 -> k g298 in
                                                                                                                                                                  f2 arg k in
                                                                                                                                                                f7 arg k in
                                                                                                                                                              arg f7 k in
                                                                                                                                                            g3 g270 k in
                                                                                                                                                          g3 arg k in
                                                                                                                                                        f3 f7 k in
                                                                                                                                                      f3 g269 k in
                                                                                                                                                    f2 arg k in
                                                                                                                                                  match t2 with
                                                                                                                                                  | true1 ->
                                                                                                                                                    let t3 = Cons1['0',g267] in
                                                                                                                                                    k t3
                                                                                                                                                  | false0 ->
                                                                                                                                                    let k = [t1], fun [f2] arg -> arg f2 k in
                                                                                                                                                    g266 g268 k in
                                                                                                                                                f2 arg k in
                                                                                                                                              f6 arg k in
                                                                                                                                            arg f6 k in
                                                                                                                                          g3 g265 k in
                                                                                                                                        g3 arg k in
                                                                                                                                      f3 f6 k in
                                                                                                                                    f3 g264 k in
                                                                                                                                  f2 arg k in
                                                                                                                                f6 arg k in
                                                                                                                              arg f6 k in
                                                                                                                            g3 g263 k in
                                                                                                                          g3 arg k in
                                                                                                                        f3 f6 k in
                                                                                                                      f3 f6 k in
                                                                                                                    f2 arg k in
                                                                                                                  f7 arg k in
                                                                                                                arg f7 k in
                                                                                                              g3 g262 k in
                                                                                                            g3 arg k in
                                                                                                          f3 f7 k in
                                                                                                        f3 g261 k in
                                                                                                      f2 arg k in
                                                                                                    f7 arg k in
                                                                                                  arg f7 k in
                                                                                                g3 g260 k in
                                                                                              g3 arg k in
                                                                                            f3 g259 k in
                                                                                          f3 arg k in
                                                                                        f2 arg k in
                                                                                      match t1 with
                                                                                      | true1 ->
                                                                                        let t2 = Cons1['0',g257] in
                                                                                        k t2
                                                                                      | false0 ->
                                                                                        let k = [f6], fun [f2] arg -> arg f2 k in
                                                                                        g256 g258 k in
                                                                                    f2 arg k in
                                                                                  match t2 with
                                                                                  | true1 ->
                                                                                    let t3 = Cons1['0',g254] in
                                                                                    k t3
                                                                                  | false0 ->
                                                                                    let k = [f5], fun [f2] arg -> arg f2 k in
                                                                                    g253 g255 k in
                                                                              match t2 with
                                                                              | true1 -> k g240
                                                                              | false0 ->
                                                                                let t3 = PRIM_LessInt(arg,256) in
                                                                                match t3 with
                                                                                | true1 -> k g241
                                                                                | false0 -> k g242 in
                                                                          let k = [], fun [] arg -> k g336 in
                                                                          t1 100 k in
                                                                        t1 114 k in
                                                                      t6 101 k in
                                                                    t2 0 k in
                                                                  match f4 with
                                                                  | Disk0(t1) -> k t1 in
                                                                g8 arg k in
                                                              f3 arg k in
                                                            f2 arg k in
                                                          f5 arg k in
                                                        arg f6 k in
                                                      g3 g19 k in
                                                    g3 arg k in
                                                  f3 f5 k in
                                                f3 g18 k in
                                              f2 arg k in
                                            f5 arg k in
                                          arg f6 k in
                                        g3 g17 k in
                                      g3 arg k in
                                    f3 g16 k in
                                  f3 arg k in
                                f2 arg k in
                              f4 arg k in
                            arg f6 k in
                          g3 g15 k in
                        g3 arg k in
                      f3 f5 k in
                    f3 g14 k in
                  f2 arg k in
                f4 arg k in
              arg f6 k in
            g3 g13 k in
          g3 arg k in
        f3 g12 k in
      f3 arg k in
    f2 t3 k in
  g1 g7 k in
g1 g5 k
