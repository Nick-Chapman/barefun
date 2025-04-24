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
let g4 = Nil0 in
let g3 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g4
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f2,f3] arg ->
        let k = [f3,arg], fun [f2,f3] arg ->
          let k = [f3], fun [f2] arg ->
            let t1 = Cons1[f2,arg] in
            k t1 in
          arg f2 k in
        g3 f2 k in
      f1 t1 k in
  k t1 in
let g6 = Unit0 in
let g5 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g6
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f2,f3] arg ->
        let k = [f3], fun [f2] arg -> arg f2 k in
        g5 f2 k in
      f1 t1 k in
  k t1 in
let g7 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g7 t3 k in
  k t1 in
let g8 = Unit0 in
let g9 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g8
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
let g10 = Unit0 in
let g11 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g10
        | Cons1(t1,t2) ->
          let t3 = PRIM_SetBytes(f1,f2,t1) in
          let t4 = PRIM_SubInt(f2,1) in
          let k = [t2], fun [f2] arg -> arg f2 k in
          f3 t4 k in
      k t1 in
    let t3 = PRIM_SubInt(arg,1) in
    let k = [f2,t1], fun [f2,f3] arg ->
      let k = [f3], fun [f2] arg ->
        let t1 = PRIM_FreezeBytes(f2) in
        k t1 in
      arg f2 k in
    t2 t3 k in
  g2 arg k in
let g12 = Nil0 in
let g13 = fun arg k ->
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
  t1 g12 k in
let g14 = false0 in
let g15 = true1 in
let g16 = false0 in
let g17 = true1 in
let g18 = false0 in
let g19 = true1 in
let g20 = false0 in
let g21 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_StringLength(f1) in
    let t2 = PRIM_StringLength(arg) in
    let t3 = PRIM_EqInt(t1,t2) in
    let k = [f1,arg,t1], fun [f2,f3,f4] arg ->
      match arg with
      | true1 -> k g16
      | false0 ->
        let t1 = [f2,f3], fun [f1,f2] me arg k ->
          let t1 = PRIM_LessInt(arg,0) in
          match t1 with
          | true1 -> k g17
          | false0 ->
            let t2 = PRIM_StringIndex(f1,arg) in
            let t3 = PRIM_StringIndex(f2,arg) in
            let t4 = PRIM_EqChar(t2,t3) in
            let k = [arg,me], fun [f2,f3] arg ->
              match arg with
              | true1 -> k g20
              | false0 ->
                let t1 = PRIM_SubInt(f2,1) in
                f3 t1 k in
            match t4 with
            | true1 -> k g18
            | false0 -> k g19 in
        let t2 = PRIM_SubInt(f4,1) in
        t1 t2 k in
    match t3 with
    | true1 -> k g14
    | false0 -> k g15 in
  k t1 in
let g22 = "" in
let g23 = Nil0 in
let g25 = Unit0 in
let g24 = fun arg k ->
  match arg with
  | Nil0 -> k g25
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,8) in
    let k = [t2], fun [f2] arg -> g24 f2 k in
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
let g26 = Nil0 in
let g27 = "% " in
let g28 = Nil0 in
let g29 = Unit0 in
let g30 = false0 in
let g31 = true1 in
let g32 = Unit0 in
let g33 = Nil0 in
let g34 = Unit0 in
let g35 = Nil0 in
let g36 = Nil0 in
let g37 = None0 in
let g38 = "command not found" in
let g39 = "\n" in
let g40 = Nil0 in
let g41 = ": " in
let g42 = Nil0 in
let g43 = Nil0 in
let g44 = "sham: " in
let g45 = Nil0 in
let g46 = "Permission denied" in
let g47 = "\n" in
let g48 = Nil0 in
let g49 = ": " in
let g50 = Nil0 in
let g51 = Nil0 in
let g52 = "sham: " in
let g53 = Nil0 in
let g54 = fun arg k ->
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
      g54 t1 k in
    g54 t2 k in
let g55 = "Shammy: In-memory file-system. Consider typing \"ls\".\n" in
let g56 = "readme" in
let g57 = "Welcome to sham; please try all the commands!\n" in
let g58 = Data0[g57] in
let g59 = Pair0[g56,g58] in
let g60 = "cat" in
let g61 = "cat: takes at least one argument\n" in
let g62 = None0 in
let g63 = "cat: " in
let g64 = " : No such file or directory\n" in
let g65 = Nil0 in
let g66 = Cons1[g64,g65] in
let g67 = "cat: " in
let g68 = " : Not a data file\n" in
let g69 = Nil0 in
let g70 = Cons1[g68,g69] in
let g71 = None0 in
let g72 = "cat: " in
let g73 = " : No such file or directory\n" in
let g74 = Nil0 in
let g75 = Cons1[g73,g74] in
let g76 = "cat: " in
let g77 = " : Not a data file\n" in
let g78 = Nil0 in
let g79 = Cons1[g77,g78] in
let g80 = "ls" in
let g81 = "ls: takes no arguments\n" in
let g82 = fun arg k ->
  match arg with
  | Pair0(t1,t2) -> k t1 in
let g83 = Unit0 in
let g84 = Unit0 in
let g85 = "fib" in
let g86 = "fib: missing argument\n" in
let g87 = "create: unexpected extra argument\n" in
let g89 = false0 in
let g90 = true1 in
let g91 = false0 in
let g92 = true1 in
let g93 = None0 in
let g94 = None0 in
let g95 = None0 in
let g88 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = Some1[f1] in
      k t1
    | Cons1(t1,t2) ->
      let t3 = PRIM_CharOrd(t1) in
      let t4 = PRIM_SubInt(t3,48) in
      let t5 = PRIM_LessInt(t4,0) in
      let k = [f1,t2,t4], fun [f2,f3,f4] arg ->
        let k = [f2,f3], fun [f2,f3] arg ->
          match arg with
          | None0 -> k g95
          | Some1(t1) ->
            let t2 = PRIM_MulInt(10,f2) in
            let t3 = PRIM_AddInt(t2,t1) in
            let k = [f3], fun [f2] arg -> arg f2 k in
            g88 t3 k in
        match arg with
        | true1 ->
          let t1 = PRIM_LessInt(9,f4) in
          let k = [f4], fun [f2] arg ->
            match arg with
            | true1 ->
              let t1 = Some1[f2] in
              k t1
            | false0 -> k g93 in
          match t1 with
          | true1 -> k g91
          | false0 -> k g92
        | false0 -> k g94 in
      match t5 with
      | true1 -> k g89
      | false0 -> k g90 in
  k t1 in
let g96 = "fib: expected numeric argument" in
let g97 = Unit0 in
let g98 = "fib " in
let g99 = fun arg k ->
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
      g99 t5 k in
  k t1 in
let g100 = Nil0 in
let g101 = Nil0 in
let g102 = " --> " in
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
let g106 = Nil0 in
let k = [], fun [] arg ->
  let k = [arg], fun [f2] arg ->
    let k = [f2,arg], fun [f2,f3] arg ->
      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
        let t1 = [f2,f4], fun [f1,f2] me arg k ->
          match arg with
          | Nil0 -> k g22
          | Cons1(t1,t2) ->
            let k = [f1,f2,t1], fun [f2,f3,f4] arg ->
              let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                let k = [f2,arg], fun [f2,f3] arg ->
                  let k = [f2,f3], fun [f2,f3] arg ->
                    let k = [f2,arg,f3], fun [f2,f3,f4] arg ->
                      let k = [f2,f3], fun [f2,f3] arg ->
                        let k = [f2], fun [f2] arg -> f2 arg k in
                        f3 arg k in
                      arg f4 k in
                    g7 g23 k in
                  g7 arg k in
                f3 f4 k in
              f3 f4 k in
            me t2 k in
        let t2 = [f3], fun [f1] me arg k ->
          let t1 = [f1,me], fun [f1,f2] me arg k ->
            let t1 = [f1,f2,arg,me], fun [f1,f2,f3,f4] arg k ->
              let t1 = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f3], fun [f2] arg ->
                    let t1 = Cons1[arg,f2] in
                    k t1 in
                  f1 f5 k
                | Cons1(t1,t2) ->
                  let t3 = PRIM_EqChar(t1,' ') in
                  match t3 with
                  | true1 ->
                    let k = [f2,f3,t2], fun [f2,f3,f4] arg ->
                      let t1 = Cons1[arg,f3] in
                      let k = [f4], fun [f2] arg -> arg f2 k in
                      f2 t1 k in
                    f1 f5 k
                  | false0 ->
                    let k = [f5,t1,t2], fun [f2,f3,f4] arg ->
                      let t1 = Cons1[f3,f2] in
                      let k = [f4], fun [f2] arg -> arg f2 k in
                      arg t1 k in
                    f4 f3 k in
              k t1 in
            k t1 in
          let t2 = [arg,me,t1], fun [f1,f2,f3] arg k ->
            match arg with
            | Nil0 -> k f1
            | Cons1(t1,t2) ->
              let t3 = PRIM_EqChar(t1,' ') in
              match t3 with
              | true1 ->
                let k = [t2], fun [f2] arg -> arg f2 k in
                f2 f1 k
              | false0 ->
                let k = [t1,t2], fun [f2,f3] arg ->
                  let t1 = Cons1[f2,g26] in
                  let k = [f3], fun [f2] arg -> arg f2 k in
                  arg t1 k in
                f3 f1 k in
          k t2 in
        let t3 = [f2,f3,f4,arg,t2], fun [f1,f2,f3,f4,f5] me arg k ->
          let k = [f1,f2,f3,f4,f5,arg,me], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
            let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
              let t1 = Cons1['\EOT',g28] in
              let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                let t1 = [f3], fun [f1] me arg k ->
                  let t1 = PRIM_GetChar(g29) in
                  let t2 = PRIM_CharOrd(t1) in
                  let t3 = PRIM_EqChar(t1,'\n') in
                  match t3 with
                  | true1 ->
                    let t4 = PRIM_PutChar('\n') in
                    f1 arg k
                  | false0 ->
                    let t4 = PRIM_EqChar(t1,'\EOT') in
                    match t4 with
                    | true1 ->
                      let t5 = PRIM_PutChar('^') in
                      let t6 = PRIM_PutChar('D') in
                      let t7 = PRIM_PutChar('\n') in
                      let t8 = Cons1['\EOT',arg] in
                      f1 t8 k
                    | false0 ->
                      let t5 = PRIM_LessInt(127,t2) in
                      match t5 with
                      | true1 -> me arg k
                      | false0 ->
                        let t6 = PRIM_EqInt(t2,127) in
                        match t6 with
                        | true1 ->
                          match arg with
                          | Nil0 -> me arg k
                          | Cons1(t7,t8) ->
                            let t9 = PRIM_CharOrd(t7) in
                            let t10 = PRIM_LessInt(26,t9) in
                            let k = [me,t8], fun [f2,f3] arg ->
                              let k = [f2,f3], fun [f2,f3] arg ->
                                let t1 = PRIM_PutChar('\b') in
                                let t2 = PRIM_PutChar(' ') in
                                let t3 = PRIM_PutChar('\b') in
                                f2 f3 k in
                              match arg with
                              | true1 ->
                                let t1 = PRIM_PutChar('\b') in
                                let t2 = PRIM_PutChar(' ') in
                                let t3 = PRIM_PutChar('\b') in
                                k t3
                              | false0 -> k g32 in
                            match t10 with
                            | true1 -> k g30
                            | false0 -> k g31
                        | false0 ->
                          let t7 = PRIM_CharOrd(t1) in
                          let t8 = PRIM_EqInt(t7,8) in
                          let k = [arg,me,t1], fun [f2,f3,f4] arg ->
                            let t1 = Cons1[f4,f2] in
                            f3 t1 k in
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
                let k = [f2,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                  let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                    let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                      match arg with
                      | true1 -> k g34
                      | false0 ->
                        let k = [f2,f3,f4,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                          let k = [f2,f3,f4,arg,f5,f6], fun [f2,f3,f4,f5,f6,f7] arg ->
                            let k = [f2,f3,f4,f6,f7], fun [f2,f3,f4,f5,f6] arg ->
                              let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                  let k = [f6], fun [f2] arg -> f2 arg k in
                                  match arg with
                                  | Nil0 -> k f5
                                  | Cons1(t1,t2) ->
                                    let t3 = [f4,t1], fun [f1,f2] me arg k ->
                                      match arg with
                                      | Nil0 -> k g37
                                      | Cons1(t1,t2) ->
                                        match t1 with
                                        | Pair0(t3,t4) ->
                                          let k = [f2,me,t2,t4], fun [f2,f3,f4,f5] arg ->
                                            let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                              match arg with
                                              | true1 ->
                                                let t1 = Some1[f4] in
                                                k t1
                                              | false0 -> f2 f3 k in
                                            arg f2 k in
                                          f1 t3 k in
                                    let k = [f2,f3,f5,t1,t2,t3], fun [f2,f3,f4,f5,f6,f7] arg ->
                                      let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                        match arg with
                                        | None0 ->
                                          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                            let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                              let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                let k = [f2,f3,f4,arg,f5,f6], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                  let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                    let k = [f2,f3,f4,f6], fun [f2,f3,f4,f5] arg ->
                                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                        let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                          let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                            let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                              let k = [f2,f3,f4,arg,f5,f6], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                  let k = [f2,f3,f4,f6], fun [f2,f3,f4,f5] arg ->
                                                                    let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                      let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
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
                                                                                                let k = [f3,f4], fun [f2,f3] arg ->
                                                                                                  let k = [f3], fun [f2] arg ->
                                                                                                    let k = [f2], fun [f2] arg -> k f2 in
                                                                                                    g24 arg k in
                                                                                                  f2 arg k in
                                                                                                f2 arg k in
                                                                                              f5 arg k in
                                                                                            arg f6 k in
                                                                                          g7 g45 k in
                                                                                        g7 arg k in
                                                                                      f3 f5 k in
                                                                                    f3 g44 k in
                                                                                  f2 arg k in
                                                                                f5 arg k in
                                                                              arg f6 k in
                                                                            g7 g43 k in
                                                                          g7 arg k in
                                                                        f3 f5 k in
                                                                      f3 f5 k in
                                                                    f2 arg k in
                                                                  f5 arg k in
                                                                arg f7 k in
                                                              g7 g42 k in
                                                            g7 arg k in
                                                          f3 f6 k in
                                                        f3 g41 k in
                                                      f2 arg k in
                                                    f5 arg k in
                                                  arg f7 k in
                                                g7 g40 k in
                                              g7 arg k in
                                            f3 g39 k in
                                          f3 g38 k
                                        | Some1(t1) ->
                                          match t1 with
                                          | Data0(t2) ->
                                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                              let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                  let k = [f2,f3,f4,f5,arg,f6], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                    let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                          let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                            let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                              let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                let k = [f2,f3,f4,f5,arg,f6], fun [f2,f3,f4,f5,f6,f7] arg ->
                                                                  let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                                                    let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                                                        let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
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
                                                                                                  let k = [f3,f4], fun [f2,f3] arg ->
                                                                                                    let k = [f3], fun [f2] arg ->
                                                                                                      let k = [f2], fun [f2] arg -> k f2 in
                                                                                                      g24 arg k in
                                                                                                    f2 arg k in
                                                                                                  f2 arg k in
                                                                                                f5 arg k in
                                                                                              arg f6 k in
                                                                                            g7 g53 k in
                                                                                          g7 arg k in
                                                                                        f3 f5 k in
                                                                                      f3 g52 k in
                                                                                    f2 arg k in
                                                                                  f5 arg k in
                                                                                arg f6 k in
                                                                              g7 g51 k in
                                                                            g7 arg k in
                                                                          f3 f5 k in
                                                                        f3 f5 k in
                                                                      f2 arg k in
                                                                    f6 arg k in
                                                                  arg f7 k in
                                                                g7 g50 k in
                                                              g7 arg k in
                                                            f3 f6 k in
                                                          f3 g49 k in
                                                        f2 arg k in
                                                      f6 arg k in
                                                    arg f7 k in
                                                  g7 g48 k in
                                                g7 arg k in
                                              f3 g47 k in
                                            f3 g46 k
                                          | Executable1(t2) ->
                                            let k = [f6], fun [f2] arg -> arg f2 k in
                                            t2 f4 k in
                                      f7 arg k in
                                    match f5 with
                                    | Bindings0(t4) -> k t4 in
                                arg f7 k in
                              g7 g36 k in
                            f5 arg k in
                          f3 f7 k in
                        f5 g35 k in
                    arg f8 k in
                  f4 arg k in
                t1 g33 k in
              f2 t1 k in
            g24 arg k in
          f3 g27 k in
        let k = [f4,arg,t1,t3], fun [f2,f3,f4,f5] arg ->
          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
            let t1 = [f2,f3,f4], fun [f1,f2,f3] arg k ->
              let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f4], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g24 arg k in
                  f1 g61 k
                | Cons1(t1,t2) ->
                  let t3 = [f2,t1], fun [f1,f2] me arg k ->
                    match arg with
                    | Nil0 -> k g62
                    | Cons1(t1,t2) ->
                      match t1 with
                      | Pair0(t3,t4) ->
                        let k = [f2,me,t2,t4], fun [f2,f3,f4,f5] arg ->
                          let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                            match arg with
                            | true1 ->
                              let t1 = Some1[f4] in
                              k t1
                            | false0 -> f2 f3 k in
                          arg f2 k in
                        f1 t3 k in
                  let k = [f1,f2,f3,f4,t1,t2,t3], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                    let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                      let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                        let t1 = [f2,f3,f4,f5], fun [f1,f2,f3,f4] arg k ->
                          let t1 = [f2,arg], fun [f1,f2] me arg k ->
                            match arg with
                            | Nil0 -> k g71
                            | Cons1(t1,t2) ->
                              match t1 with
                              | Pair0(t3,t4) ->
                                let k = [f2,me,t2,t4], fun [f2,f3,f4,f5] arg ->
                                  let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                    match arg with
                                    | true1 ->
                                      let t1 = Some1[f4] in
                                      k t1
                                    | false0 -> f2 f3 k in
                                  arg f2 k in
                                f1 t3 k in
                          let k = [f1,f3,arg,t1], fun [f2,f3,f4,f5] arg ->
                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                              match arg with
                              | None0 ->
                                let t1 = Cons1[f4,g75] in
                                let t2 = Cons1[g72,t1] in
                                let k = [f2], fun [f2] arg ->
                                  let k = [], fun [] arg -> g24 arg k in
                                  f2 arg k in
                                f3 t2 k
                              | Some1(t1) ->
                                match t1 with
                                | Data0(t2) ->
                                  let k = [], fun [] arg -> g24 arg k in
                                  f2 t2 k
                                | Executable1(t2) ->
                                  let t3 = Cons1[f4,g79] in
                                  let t4 = Cons1[g76,t3] in
                                  let k = [f2], fun [f2] arg ->
                                    let k = [], fun [] arg -> g24 arg k in
                                    f2 arg k in
                                  f3 t4 k in
                            f5 arg k in
                          match f4 with
                          | Bindings0(t2) -> k t2 in
                        let k = [f5,f6], fun [f2,f3] arg ->
                          let k = [f2], fun [f2] arg -> k f2 in
                          arg f3 k in
                        g5 t1 k in
                      match arg with
                      | None0 ->
                        let t1 = Cons1[f6,g66] in
                        let t2 = Cons1[g63,t1] in
                        let k = [f2], fun [f2] arg ->
                          let k = [], fun [] arg -> g24 arg k in
                          f2 arg k in
                        f4 t2 k
                      | Some1(t1) ->
                        match t1 with
                        | Data0(t2) ->
                          let k = [], fun [] arg -> g24 arg k in
                          f2 t2 k
                        | Executable1(t2) ->
                          let t3 = Cons1[f6,g70] in
                          let t4 = Cons1[g67,t3] in
                          let k = [f2], fun [f2] arg ->
                            let k = [], fun [] arg -> g24 arg k in
                            f2 arg k in
                          f4 t4 k in
                    f8 arg k in
                  match f4 with
                  | Bindings0(t4) -> k t4 in
              k t1 in
            let t2 = Executable1[t1] in
            let t3 = Pair0[g60,t2] in
            let t4 = [f2], fun [f1] arg k ->
              let t1 = [f1,arg], fun [f1,f2] arg k ->
                match arg with
                | Cons1(t1,t2) ->
                  let k = [f2], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g24 arg k in
                  f1 g81 k
                | Nil0 ->
                  let k = [f1,f2], fun [f2,f3] arg ->
                    let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                      let k = [f2,f3], fun [f2,f3] arg ->
                        let t1 = [f2], fun [f1] me arg k ->
                          match arg with
                          | Nil0 -> k g83
                          | Cons1(t1,t2) ->
                            let t3 = PRIM_PutChar(' ') in
                            let k = [me,t2], fun [f2,f3] arg ->
                              let k = [f2,f3], fun [f2,f3] arg -> f2 f3 k in
                              g24 arg k in
                            f1 t1 k in
                        let k = [f3], fun [f2] arg ->
                          let t1 = PRIM_PutChar('\n') in
                          k f2 in
                        match arg with
                        | Nil0 -> k g84
                        | Cons1(t2,t3) ->
                          let k = [t1,t3], fun [f2,f3] arg ->
                            let k = [f2,f3], fun [f2,f3] arg -> f2 f3 k in
                            g24 arg k in
                          f2 t2 k in
                      f4 arg k in
                    match f3 with
                    | Bindings0(t1) -> k t1 in
                  g3 g82 k in
              k t1 in
            let t5 = Executable1[t4] in
            let t6 = Pair0[g80,t5] in
            let t7 = [f2], fun [f1] arg k ->
              let t1 = [f1,arg], fun [f1,f2] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f2], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g24 arg k in
                  f1 g86 k
                | Cons1(t1,t2) ->
                  match t2 with
                  | Cons1(t3,t4) ->
                    let k = [f2], fun [f2] arg ->
                      let k = [f2], fun [f2] arg -> k f2 in
                      g24 arg k in
                    f1 g87 k
                  | Nil0 ->
                    let k = [f1,f2], fun [f2,f3] arg ->
                      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                        let k = [f2,f3], fun [f2,f3] arg ->
                          match arg with
                          | None0 ->
                            let k = [f3], fun [f2] arg ->
                              let k = [f2], fun [f2] arg -> k f2 in
                              g24 arg k in
                            f2 g96 k
                          | Some1(t1) ->
                            let t2 = [f2,t1], fun [f1,f2] me arg k ->
                              let t1 = PRIM_LessInt(f2,arg) in
                              match t1 with
                              | true1 -> k g97
                              | false0 ->
                                let k = [f1,arg,me], fun [f2,f3,f4] arg ->
                                  let k = [f2,f3,f4,arg], fun [f2,f3,f4,f5] arg ->
                                    let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                      let t1 = PRIM_EqInt(f3,0) in
                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                          let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                              let t1 = PRIM_EqInt(f4,0) in
                                              let k = [f2,f3], fun [f2,f3] arg ->
                                                let k = [f2,f3], fun [f2,f3] arg ->
                                                  let t1 = PRIM_PutChar('\n') in
                                                  let t2 = PRIM_AddInt(f2,1) in
                                                  f3 t2 k in
                                                g24 arg k in
                                              match t1 with
                                              | true1 ->
                                                let t2 = Cons1['0',g104] in
                                                k t2
                                              | false0 ->
                                                let k = [f4], fun [f2] arg -> arg f2 k in
                                                g103 g105 k in
                                            g24 arg k in
                                          f2 g102 k in
                                        g24 arg k in
                                      match t1 with
                                      | true1 ->
                                        let t2 = Cons1['0',g100] in
                                        k t2
                                      | false0 ->
                                        let k = [f3], fun [f2] arg -> arg f2 k in
                                        g99 g101 k in
                                    g24 arg k in
                                  f2 g98 k in
                                g54 arg k in
                            let k = [f3], fun [f2] arg -> k f2 in
                            t2 0 k in
                        arg f4 k in
                      g88 0 k in
                    f1 t1 k in
              k t1 in
            let t8 = Executable1[t7] in
            let t9 = Pair0[g85,t8] in
            let t10 = Cons1[t9,g106] in
            let t11 = Cons1[t6,t10] in
            let t12 = Cons1[t3,t11] in
            let t13 = Cons1[g59,t12] in
            let t14 = Bindings0[t13] in
            f5 t14 k in
          g24 arg k in
        f4 g55 k in
      g1 g21 k in
    g1 g13 k in
  g1 g11 k in
g1 g9 k
