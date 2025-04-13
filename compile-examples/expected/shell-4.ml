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
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t1], fun [f2,f3] arg ->
        let k = [f3], fun [f2] arg ->
          let t1 = CID1[f2,arg] in
          k t1 in
        arg f2 k in
      g3 t2 k in
  k t1 in
let g4 = CID0 in
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
let g6 = CID0 in
let g7 = fun arg k ->
  let t1 = [arg], fun [f1] me arg k ->
    let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
      let t1 = PRIM_LessInt(arg,0) in
      match t1 with
      | true1 -> k f2
      | false0 ->
        let t2 = PRIM_StringIndex(f1,arg) in
        let t3 = CID1[t2,f2] in
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
let g9 = CID1 in
let g10 = CID0 in
let g11 = CID0 in
let g12 = CID0 in
let g8 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match f2 with
      | Nil0 ->
        match arg with
        | Nil0 -> k g9
        | Cons1(t1,t2) -> k g10
      | Cons1(t1,t2) ->
        match arg with
        | Nil0 -> k g11
        | Cons1(t3,t4) ->
          let k = [f1,t2,t3,t4], fun [f2,f3,f4,f5] arg ->
            let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
              match arg with
              | true1 ->
                let k = [f3,f4], fun [f2,f3] arg ->
                  let k = [f3], fun [f2] arg -> arg f2 k in
                  arg f2 k in
                g8 f2 k
              | false0 -> k g12 in
            arg f4 k in
          f1 t1 k in
    k t1 in
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
let g17 = CID0 in
let g16 = fun arg k ->
  match arg with
  | Nil0 -> k g17
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,8) in
    let k = [t2], fun [f2] arg -> g16 f2 k in
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
let g19 = CID0 in
let g20 = CID0 in
let g21 = CID0 in
let g22 = CID0 in
let g23 = CID1 in
let g24 = CID0 in
let g18 = fun arg k ->
  let t1 = PRIM_GetChar(g19) in
  let t2 = PRIM_CharOrd(t1) in
  let t3 = PRIM_EqChar(t1,'\n') in
  match t3 with
  | true1 ->
    let t4 = PRIM_PutChar('\n') in
    let k = [arg], fun [f2] arg -> arg f2 k in
    g13 g20 k
  | false0 ->
    let t4 = PRIM_EqChar(t1,'\EOT') in
    match t4 with
    | true1 ->
      let t5 = PRIM_PutChar('^') in
      let t6 = PRIM_PutChar('D') in
      let t7 = PRIM_PutChar('\n') in
      let k = [arg], fun [f2] arg ->
        let t1 = CID1['\EOT',f2] in
        arg t1 k in
      g13 g21 k
    | false0 ->
      let t5 = PRIM_LessInt(127,t2) in
      match t5 with
      | true1 -> g18 arg k
      | false0 ->
        let t6 = PRIM_EqInt(t2,127) in
        match t6 with
        | true1 ->
          match arg with
          | Nil0 -> g18 arg k
          | Cons1(t7,t8) ->
            let t9 = PRIM_CharOrd(t7) in
            let t10 = PRIM_LessInt(26,t9) in
            let k = [t8], fun [f2] arg ->
              let k = [f2], fun [f2] arg ->
                let t1 = PRIM_PutChar('\b') in
                let t2 = PRIM_PutChar(' ') in
                let t3 = PRIM_PutChar('\b') in
                g18 f2 k in
              match arg with
              | true1 ->
                let t1 = PRIM_PutChar('\b') in
                let t2 = PRIM_PutChar(' ') in
                let t3 = PRIM_PutChar('\b') in
                k t3
              | false0 -> k g24 in
            match t10 with
            | true1 -> k g22
            | false0 -> k g23
        | false0 ->
          let t7 = PRIM_CharOrd(t1) in
          let t8 = PRIM_EqInt(t7,8) in
          let k = [arg,t1], fun [f2,f3] arg ->
            let t1 = CID1[f3,f2] in
            g18 t1 k in
          match t8 with
          | true1 ->
            let t9 = PRIM_PutChar(t1) in
            k t9
          | false0 ->
            let t9 = PRIM_EqChar(t1,'\n') in
            match t9 with
            | true1 ->
              let t10 = PRIM_PutChar(t1) in
              k t10
            | false0 ->
              let t10 = PRIM_LessInt(26,t7) in
              match t10 with
              | true1 ->
                let t11 = PRIM_PutChar(t1) in
                k t11
              | false0 ->
                let t11 = PRIM_PutChar('^') in
                let t12 = PRIM_AddInt(65,t7) in
                let t13 = PRIM_SubInt(t12,1) in
                let t14 = PRIM_CharChr(t13) in
                let t15 = PRIM_PutChar(t14) in
                k t15 in
let g25 = fun arg k ->
  let t1 = PRIM_LessInt(arg,2) in
  match t1 with
  | true1 -> k arg
  | false0 ->
    let t2 = PRIM_SubInt(arg,1) in
    let k = [arg], fun [f2] arg ->
      let t1 = PRIM_SubInt(f2,2) in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_AddInt(f2,arg) in
        k t1 in
      g25 t1 k in
    g25 t2 k in
let g27 = CID0 in
let g28 = CID1 in
let g26 = fun arg k ->
  let t1 = PRIM_LessInt(arg,2) in
  let k = [arg], fun [f2] arg ->
    match arg with
    | true1 ->
      let t1 = PRIM_SubInt(f2,1) in
      let k = [f2], fun [f2] arg ->
        let t1 = PRIM_MulInt(arg,f2) in
        k t1 in
      g26 t1 k
    | false0 -> k 1 in
  match t1 with
  | true1 -> k g27
  | false0 -> k g28 in
let g29 = CID0 in
let g30 = CID0 in
let g31 = CID0 in
let g32 = CID0 in
let g33 = CID0 in
let g34 = CID0 in
let g35 = CID0 in
let g36 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g37 = CID0 in
let g38 = CID0 in
let g39 = CID0 in
let g40 = CID0 in
let g41 = "fib" in
let g42 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g43 = "fib: " in
let g44 = "ERROR: " in
let g45 = "expected an argument" in
let g46 = "ERROR: " in
let g47 = "expected exactly one argument" in
let g49 = CID0 in
let g50 = CID1 in
let g51 = CID0 in
let g52 = CID1 in
let g53 = CID1 in
let g54 = CID1 in
let g55 = CID1 in
let g48 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = CID0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,48) in
      let t5 = PRIM_LessInt(t4,0) in
      let k = [f1,t2,t4], fun [f2,f3,f4] arg ->
        let k = [f2,f3], fun [f2,f3] arg ->
          match arg with
          | None1 -> k g55
          | Some0(t1) ->
            let t2 = PRIM_MulInt(10,f2) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f3], fun [f2] arg -> arg f2 k in
            g48 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(9,f4) in
          let k = [f4], fun [f2] arg ->
            match arg with
            | true1 ->
              let t1 = CID0[f2] in
              k t1
            | false0 -> k g53 in
          match t1 with
          | true1 -> k g51
          | false0 -> k g52
        | false0 -> k g54 in
      match t5 with
      | true1 -> k g49
      | false0 -> k g50 in
  k t1 in
let g56 = "ERROR: " in
let g57 = "expected arg1 to be numeric" in
let g58 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g58 t5 k in
  k t1 in
let g59 = CID0 in
let g60 = CID0 in
let g61 = " --> " in
let g62 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g62 t5 k in
  k t1 in
let g63 = CID0 in
let g64 = CID0 in
let g65 = "fact" in
let g66 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g67 = "fact: " in
let g68 = "ERROR: " in
let g69 = "expected an argument" in
let g70 = "ERROR: " in
let g71 = "expected exactly one argument" in
let g73 = CID0 in
let g74 = CID1 in
let g75 = CID0 in
let g76 = CID1 in
let g77 = CID1 in
let g78 = CID1 in
let g79 = CID1 in
let g72 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = CID0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,48) in
      let t5 = PRIM_LessInt(t4,0) in
      let k = [f1,t2,t4], fun [f2,f3,f4] arg ->
        let k = [f2,f3], fun [f2,f3] arg ->
          match arg with
          | None1 -> k g79
          | Some0(t1) ->
            let t2 = PRIM_MulInt(10,f2) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f3], fun [f2] arg -> arg f2 k in
            g72 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(9,f4) in
          let k = [f4], fun [f2] arg ->
            match arg with
            | true1 ->
              let t1 = CID0[f2] in
              k t1
            | false0 -> k g77 in
          match t1 with
          | true1 -> k g75
          | false0 -> k g76
        | false0 -> k g78 in
      match t5 with
      | true1 -> k g73
      | false0 -> k g74 in
  k t1 in
let g80 = "ERROR: " in
let g81 = "expected arg1 to be numeric" in
let g82 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g82 t5 k in
  k t1 in
let g83 = CID0 in
let g84 = CID0 in
let g85 = " --> " in
let g86 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g86 t5 k in
  k t1 in
let g87 = CID0 in
let g88 = CID0 in
let g89 = "rev" in
let g90 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g91 = "ERROR: " in
let g92 = "rev: expected no arguments" in
let g93 = "(reverse typed lines until ^D)\n" in
let g94 = CID0 in
let g95 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g96 = CID0 in
let g97 = CID0 in
let g98 = CID0 in
let g99 = CID0 in
let g100 = fun arg k ->
  let t1 = PRIM_EqChar(arg,'o') in
  match t1 with
  | true1 -> k '*'
  | false0 -> k arg in
let g101 = "You wrote: \"" in
let g102 = "\" (" in
let g103 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = CID1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g103 t5 k in
  k t1 in
let g104 = CID0 in
let g105 = CID0 in
let g106 = " chars)" in
let g107 = CID0 in
let g108 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g109 = CID0 in
let k = [], fun [] arg ->
  let k = [arg], fun [f2] arg ->
    let t1 = CID1['\EOT',g29] in
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
                    g13 g31 k in
                  f2 arg k in
                arg f4 k in
              g13 g30 k
            | Cons1(t1,t2) ->
              let t3 = PRIM_EqChar(t1,' ') in
              match t3 with
              | true1 ->
                let k = [f1,f2,f3,f4,t2], fun [f2,f3,f4,f5,f6] arg ->
                  let k = [f2,f3,f4,f6], fun [f2,f3,f4,f5] arg ->
                    let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                      let t1 = CID1[arg,f2] in
                      let k = [f4], fun [f2] arg ->
                        let k = [f2], fun [f2] arg -> arg f2 k in
                        arg g33 k in
                      f3 t1 k in
                    f2 arg k in
                  arg f5 k in
                g13 g32 k
              | false0 ->
                let k = [f4,t1,t2], fun [f2,f3,f4] arg ->
                  let t1 = CID1[f3,f2] in
                  let k = [f4], fun [f2] arg -> arg f2 k in
                  arg t1 k in
                f3 f2 k in
          k t1 in
        k t1 in
      let t2 = [f2,f3,arg,t1], fun [f1,f2,f3,f4] me arg k ->
        let t1 = CID1[' ',g34] in
        let t2 = CID1['>',t1] in
        let k = [f1,f2,f3,f4,me], fun [f2,f3,f4,f5,f6] arg ->
          let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
            let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
              let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                  let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                    let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                      let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                        match arg with
                        | true1 -> k g37
                        | false0 ->
                          let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                            let k = [f2,f3,f4,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                              let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                  let k = [f5], fun [f2] arg -> f2 g107 k in
                                  match arg with
                                  | Nil0 -> k g40
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
                                                              let t1 = PRIM_PutChar('\n') in
                                                              k t1 in
                                                            g16 arg k in
                                                          f2 g45 k in
                                                        g16 arg k in
                                                      f2 g44 k
                                                    | Cons1(t1,t2) ->
                                                      match t2 with
                                                      | Cons1(t3,t4) ->
                                                        let k = [f2], fun [f2] arg ->
                                                          let k = [f2], fun [f2] arg ->
                                                            let k = [], fun [] arg ->
                                                              let k = [], fun [] arg ->
                                                                let t1 = PRIM_PutChar('\n') in
                                                                k t1 in
                                                              g16 arg k in
                                                            f2 g47 k in
                                                          g16 arg k in
                                                        f2 g46 k
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
                                                                        let t1 = PRIM_PutChar('\n') in
                                                                        k t1 in
                                                                      g16 arg k in
                                                                    f2 g57 k in
                                                                  g16 arg k in
                                                                f2 g56 k
                                                              | Some0(t1) ->
                                                                let k = [f2,t1], fun [f2,f3] arg ->
                                                                  let t1 = PRIM_EqInt(f3,0) in
                                                                  let k = [f2,arg], fun [f2,f3] arg ->
                                                                    let k = [f2,f3], fun [f2,f3] arg ->
                                                                      let k = [f3], fun [f2] arg ->
                                                                        let k = [f2], fun [f2] arg ->
                                                                          let t1 = PRIM_EqInt(f2,0) in
                                                                          let k = [], fun [] arg ->
                                                                            let k = [], fun [] arg ->
                                                                              let t1 = PRIM_PutChar('\n') in
                                                                              k t1 in
                                                                            g16 arg k in
                                                                          match t1 with
                                                                          | true1 ->
                                                                            let t2 = CID1['0',g63] in
                                                                            k t2
                                                                          | false0 ->
                                                                            let k = [f2], fun [f2] arg -> arg f2 k in
                                                                            g62 g64 k in
                                                                        g16 arg k in
                                                                      f2 g61 k in
                                                                    g16 arg k in
                                                                  match t1 with
                                                                  | true1 ->
                                                                    let t2 = CID1['0',g59] in
                                                                    k t2
                                                                  | false0 ->
                                                                    let k = [f3], fun [f2] arg -> arg f2 k in
                                                                    g58 g60 k in
                                                                g25 t1 k in
                                                            arg f3 k in
                                                          g48 0 k in
                                                        f2 t1 k in
                                                  g16 arg k in
                                                f3 g43 k
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
                                                                          let t1 = PRIM_PutChar('\n') in
                                                                          k t1 in
                                                                        g16 arg k in
                                                                      f2 g69 k in
                                                                    g16 arg k in
                                                                  f2 g68 k
                                                                | Cons1(t1,t2) ->
                                                                  match t2 with
                                                                  | Cons1(t3,t4) ->
                                                                    let k = [f2], fun [f2] arg ->
                                                                      let k = [f2], fun [f2] arg ->
                                                                        let k = [], fun [] arg ->
                                                                          let k = [], fun [] arg ->
                                                                            let t1 = PRIM_PutChar('\n') in
                                                                            k t1 in
                                                                          g16 arg k in
                                                                        f2 g71 k in
                                                                      g16 arg k in
                                                                    f2 g70 k
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
                                                                                    let t1 = PRIM_PutChar('\n') in
                                                                                    k t1 in
                                                                                  g16 arg k in
                                                                                f2 g81 k in
                                                                              g16 arg k in
                                                                            f2 g80 k
                                                                          | Some0(t1) ->
                                                                            let k = [f2,t1], fun [f2,f3] arg ->
                                                                              let t1 = PRIM_EqInt(f3,0) in
                                                                              let k = [f2,arg], fun [f2,f3] arg ->
                                                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                                                  let k = [f3], fun [f2] arg ->
                                                                                    let k = [f2], fun [f2] arg ->
                                                                                      let t1 = PRIM_EqInt(f2,0) in
                                                                                      let k = [], fun [] arg ->
                                                                                        let k = [], fun [] arg ->
                                                                                          let t1 = PRIM_PutChar('\n') in
                                                                                          k t1 in
                                                                                        g16 arg k in
                                                                                      match t1 with
                                                                                      | true1 ->
                                                                                        let t2 = CID1['0',g87] in
                                                                                        k t2
                                                                                      | false0 ->
                                                                                        let k = [f2], fun [f2] arg -> arg f2 k in
                                                                                        g86 g88 k in
                                                                                    g16 arg k in
                                                                                  f2 g85 k in
                                                                                g16 arg k in
                                                                              match t1 with
                                                                              | true1 ->
                                                                                let t2 = CID1['0',g83] in
                                                                                k t2
                                                                              | false0 ->
                                                                                let k = [f3], fun [f2] arg -> arg f2 k in
                                                                                g82 g84 k in
                                                                            g26 t1 k in
                                                                        arg f3 k in
                                                                      g72 0 k in
                                                                    f2 t1 k in
                                                              g16 arg k in
                                                            f3 g67 k
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
                                                                                  let t1 = PRIM_PutChar('\n') in
                                                                                  k t1 in
                                                                                g16 arg k in
                                                                              f2 g92 k in
                                                                            g16 arg k in
                                                                          f3 g91 k
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
                                                                                              | true1 -> k g96
                                                                                              | false0 ->
                                                                                                let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                  let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                                                                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                                                                      let k = [f3,f4], fun [f2,f3] arg ->
                                                                                                        let k = [f3], fun [f2] arg ->
                                                                                                          let k = [f2], fun [f2] arg ->
                                                                                                            let t1 = PRIM_PutChar('\n') in
                                                                                                            f2 g98 k in
                                                                                                          g16 arg k in
                                                                                                        f2 arg k in
                                                                                                      f2 arg k in
                                                                                                    arg f5 k in
                                                                                                  g13 g97 k in
                                                                                                f3 f5 k in
                                                                                            arg f6 k in
                                                                                          arg f6 k in
                                                                                        g8 g95 k in
                                                                                      f3 f4 k in
                                                                                    f3 arg k in
                                                                                  f2 arg k in
                                                                                g18 g94 k in
                                                                              t1 g99 k in
                                                                            g16 arg k in
                                                                          f3 g93 k
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
                                                                                                  let t1 = PRIM_EqInt(f3,0) in
                                                                                                  let k = [f2], fun [f2] arg ->
                                                                                                    let k = [f2], fun [f2] arg ->
                                                                                                      let k = [], fun [] arg ->
                                                                                                        let k = [], fun [] arg ->
                                                                                                          let t1 = PRIM_PutChar('\n') in
                                                                                                          k t1 in
                                                                                                        g16 arg k in
                                                                                                      f2 g106 k in
                                                                                                    g16 arg k in
                                                                                                  match t1 with
                                                                                                  | true1 ->
                                                                                                    let t2 = CID1['0',g104] in
                                                                                                    k t2
                                                                                                  | false0 ->
                                                                                                    let k = [f3], fun [f2] arg -> arg f2 k in
                                                                                                    g103 g105 k in
                                                                                                g16 arg k in
                                                                                              f2 g102 k in
                                                                                            g16 arg k in
                                                                                          f2 arg k in
                                                                                        f2 arg k in
                                                                                      f5 arg k in
                                                                                    f3 f5 k in
                                                                                  g3 arg k in
                                                                                f3 g101 k in
                                                                              f2 arg k in
                                                                            f4 arg k in
                                                                          f3 f4 k in
                                                                        g14 g100 k in
                                                                    arg f7 k in
                                                                  arg f7 k in
                                                                g8 g90 k in
                                                              f3 g89 k in
                                                            f3 f6 k in
                                                        arg f8 k in
                                                      arg f8 k in
                                                    g8 g66 k in
                                                  f3 g65 k in
                                                f3 f6 k in
                                            arg f8 k in
                                          arg f8 k in
                                        g8 g42 k in
                                      f3 g41 k in
                                    f3 t1 k in
                                arg f7 k in
                              arg g39 k in
                            f5 g38 k in
                          f3 f7 k in
                      arg f8 k in
                    arg f8 k in
                  g8 g36 k in
                f3 f4 k in
              f3 arg k in
            f2 arg k in
          g18 g35 k in
        g16 t2 k in
      let k = [t2], fun [f2] arg ->
        let k = [f2], fun [f2] arg -> f2 g109 k in
        g16 arg k in
      f3 g108 k in
    f2 t1 k in
  g1 g7 k in
g1 g5 k
