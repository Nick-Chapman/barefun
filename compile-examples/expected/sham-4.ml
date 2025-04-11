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
let g6 = CID0 in
let g5 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g6
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f2,f3] arg ->
        let k = [f3,arg], fun [f2,f3] arg ->
          let k = [f3], fun [f2] arg ->
            let t1 = CID1[f2,arg] in
            k t1 in
          arg f2 k in
        g5 f2 k in
      f1 t1 k in
  k t1 in
let g8 = CID0 in
let g7 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g8
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f2,f3] arg ->
        let k = [f3], fun [f2] arg -> arg f2 k in
        g7 f2 k in
      f1 t1 k in
  k t1 in
let g9 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t1], fun [f2,f3] arg ->
        let k = [f3], fun [f2] arg ->
          let t1 = CID1[f2,arg] in
          k t1 in
        arg f2 k in
      g9 t2 k in
  k t1 in
let g10 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g10 t3 k in
  k t1 in
let g11 = CID0 in
let g12 = 1 in
let g13 = 0 in
let g14 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g11
        | Cons1(t1,t2) ->
          let t3 = PRIM_SetBytes(f1,f2,t1) in
          let t4 = PRIM_AddInt(f2,g12) in
          let k = [t2], fun [f2] arg -> arg f2 k in
          f3 t4 k in
      k t1 in
    let k = [f2,t1], fun [f2,f3] arg ->
      let k = [f3], fun [f2] arg ->
        let t1 = PRIM_FreezeBytes(f2) in
        k t1 in
      arg f2 k in
    t2 g13 k in
  g2 arg k in
let g15 = CID0 in
let g16 = 1 in
let g17 = 1 in
let g18 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g15
        | Cons1(t1,t2) ->
          let t3 = PRIM_SetBytes(f1,f2,t1) in
          let t4 = PRIM_SubInt(f2,g16) in
          let k = [t2], fun [f2] arg -> arg f2 k in
          f3 t4 k in
      k t1 in
    let t3 = PRIM_SubInt(arg,g17) in
    let k = [f2,t1], fun [f2,f3] arg ->
      let k = [f3], fun [f2] arg ->
        let t1 = PRIM_FreezeBytes(f2) in
        k t1 in
      arg f2 k in
    t2 t3 k in
  g2 arg k in
let g19 = 0 in
let g20 = 1 in
let g21 = CID0 in
let g22 = 1 in
let g23 = fun arg k ->
  let t1 = [arg], fun [f1] me arg k ->
    let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
      let t1 = PRIM_LessInt(arg,g19) in
      match t1 with
      | true1 -> k f2
      | false0 ->
        let t2 = PRIM_StringIndex(f1,arg) in
        let t3 = CID1[t2,f2] in
        let k = [arg], fun [f2] arg ->
          let t1 = PRIM_SubInt(f2,g20) in
          arg t1 k in
        f3 t3 k in
    k t1 in
  let t2 = PRIM_StringLength(arg) in
  let k = [t2], fun [f2] arg ->
    let t1 = PRIM_SubInt(f2,g22) in
    arg t1 k in
  t1 g21 k in
let g24 = CID0 in
let g25 = CID1 in
let g26 = CID0 in
let g27 = 0 in
let g28 = CID1 in
let g29 = CID0 in
let g30 = CID1 in
let g31 = CID0 in
let g32 = 1 in
let g33 = 1 in
let g34 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_StringLength(f1) in
    let t2 = PRIM_StringLength(arg) in
    let t3 = PRIM_EqInt(t1,t2) in
    let k = [f1,arg,t1], fun [f2,f3,f4] arg ->
      match arg with
      | true1 -> k g26
      | false0 ->
        let t1 = [f2,f3], fun [f1,f2] me arg k ->
          let t1 = PRIM_LessInt(arg,g27) in
          match t1 with
          | true1 -> k g28
          | false0 ->
            let t2 = PRIM_StringIndex(f1,arg) in
            let t3 = PRIM_StringIndex(f2,arg) in
            let t4 = PRIM_EqChar(t2,t3) in
            let k = [arg,me], fun [f2,f3] arg ->
              match arg with
              | true1 -> k g31
              | false0 ->
                let t1 = PRIM_SubInt(f2,g32) in
                f3 t1 k in
            match t4 with
            | true1 -> k g29
            | false0 -> k g30 in
        let t2 = PRIM_SubInt(f4,g33) in
        t1 t2 k in
    match t3 with
    | true1 -> k g24
    | false0 -> k g25 in
  k t1 in
let g35 = "" in
let g37 = CID0 in
let g36 = fun arg k ->
  match arg with
  | Nil0 -> k g37
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g36 t2 k in
let g38 = ' ' in
let g39 = ' ' in
let g40 = CID0 in
let g41 = "% " in
let g42 = '\EOT' in
let g43 = CID0 in
let g44 = CID1[g42,g43] in
let g45 = CID0 in
let g46 = '\n' in
let g47 = '\n' in
let g48 = '\EOT' in
let g49 = '\EOT' in
let g50 = '\n' in
let g51 = '\EOT' in
let g52 = 127 in
let g53 = 127 in
let g54 = 26 in
let g55 = CID0 in
let g56 = CID1 in
let g57 = '\b' in
let g58 = ' ' in
let g59 = '\b' in
let g60 = CID0 in
let g61 = '\b' in
let g62 = ' ' in
let g63 = '\b' in
let g64 = CID0 in
let g65 = CID0 in
let g66 = CID0 in
let g67 = CID0 in
let g68 = CID0 in
let g69 = "sham: " in
let g70 = ": " in
let g71 = "command not found" in
let g72 = "\n" in
let g73 = CID0 in
let g74 = CID1[g72,g73] in
let g75 = CID1[g71,g74] in
let g76 = CID1[g70,g75] in
let g77 = "sham: " in
let g78 = ": " in
let g79 = "Permission denied" in
let g80 = "\n" in
let g81 = CID0 in
let g82 = CID1[g80,g81] in
let g83 = CID1[g79,g82] in
let g84 = CID1[g78,g83] in
let g85 = "Sham: In-memory file-system. Consider typing \"ls\".\n" in
let g86 = "readme" in
let g87 = "Welcome to sham; please try all the commands!\nCan you find the hidden Easter Egg?\n" in
let g88 = CID0[g87] in
let g89 = CID0[g86,g88] in
let g90 = "ls" in
let g91 = "List all files on the file system.\n" in
let g92 = "ls: takes no arguments\n" in
let g93 = fun arg k ->
  match arg with
  | Pair0(t1,t2) -> k t1 in
let g94 = CID0 in
let g95 = ' ' in
let g96 = CID0 in
let g97 = '\n' in
let g98 = "cat" in
let g99 = "Show the content of data files.\n" in
let g100 = "cat: takes at least one argument\n" in
let g101 = CID0 in
let g102 = "cat: " in
let g103 = " : No such file\n" in
let g104 = CID0 in
let g105 = CID1[g103,g104] in
let g106 = "cat: " in
let g107 = " : Not a data file\n" in
let g108 = CID0 in
let g109 = CID1[g107,g108] in
let g110 = CID0 in
let g111 = "cat: " in
let g112 = " : No such file\n" in
let g113 = CID0 in
let g114 = CID1[g112,g113] in
let g115 = "cat: " in
let g116 = " : Not a data file\n" in
let g117 = CID0 in
let g118 = CID1[g116,g117] in
let g119 = "man" in
let g120 = "Show the manual page for a command.\n" in
let g121 = "man: takes at least one argument\n" in
let g122 = CID0 in
let g123 = "No manual entry for " in
let g124 = "\n" in
let g125 = CID0 in
let g126 = CID1[g124,g125] in
let g127 = "No manual entry for " in
let g128 = "\n" in
let g129 = CID0 in
let g130 = CID1[g128,g129] in
let g131 = CID0 in
let g132 = "No manual entry for " in
let g133 = "\n" in
let g134 = CID0 in
let g135 = CID1[g133,g134] in
let g136 = "No manual entry for " in
let g137 = "\n" in
let g138 = CID0 in
let g139 = CID1[g137,g138] in
let g140 = CID0 in
let k = [], fun [] arg ->
  let k = [arg], fun [f2] arg ->
    let k = [f2,arg], fun [f2,f3] arg ->
      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
        let t1 = [f2,f4], fun [f1,f2] me arg k ->
          match arg with
          | Nil0 -> k g35
          | Cons1(t1,t2) ->
            let k = [f1,f2,t1], fun [f2,f3,f4] arg ->
              let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                  let k = [f2,arg], fun [f2,f3] arg ->
                    let k = [f2], fun [f2] arg -> f2 arg k in
                    f3 arg k in
                  f3 f4 k in
                g9 arg k in
              f3 f4 k in
            me t2 k in
        let t2 = [f3], fun [f1] me arg k ->
          let t1 = [f1,me], fun [f1,f2] me arg k ->
            let t1 = [f1,f2,arg,me], fun [f1,f2,f3,f4] arg k ->
              let t1 = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f3], fun [f2] arg ->
                    let t1 = CID1[arg,f2] in
                    k t1 in
                  f1 f5 k
                | Cons1(t1,t2) ->
                  let t3 = PRIM_EqChar(t1,g38) in
                  match t3 with
                  | true1 ->
                    let k = [f2,f3,t2], fun [f2,f3,f4] arg ->
                      let t1 = CID1[arg,f3] in
                      let k = [f4], fun [f2] arg -> arg f2 k in
                      f2 t1 k in
                    f1 f5 k
                  | false0 ->
                    let k = [f5,t1,t2], fun [f2,f3,f4] arg ->
                      let t1 = CID1[f3,f2] in
                      let k = [f4], fun [f2] arg -> arg f2 k in
                      arg t1 k in
                    f4 f3 k in
              k t1 in
            k t1 in
          let t2 = [arg,me,t1], fun [f1,f2,f3] arg k ->
            match arg with
            | Nil0 -> k f1
            | Cons1(t1,t2) ->
              let t3 = PRIM_EqChar(t1,g39) in
              match t3 with
              | true1 ->
                let k = [t2], fun [f2] arg -> arg f2 k in
                f2 f1 k
              | false0 ->
                let k = [t1,t2], fun [f2,f3] arg ->
                  let t1 = CID1[f2,g40] in
                  let k = [f3], fun [f2] arg -> arg f2 k in
                  arg t1 k in
                f3 f1 k in
          k t2 in
        let t3 = [f2,f3,f4,arg,t1,t2], fun [f1,f2,f3,f4,f5,f6] me arg k ->
          let k = [f1,f2,f3,f4,f5,f6,arg,me], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
            let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
              let k = [f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                let t1 = [f2], fun [f1] me arg k ->
                  let t1 = PRIM_GetChar(g45) in
                  let t2 = PRIM_CharOrd(t1) in
                  let t3 = PRIM_EqChar(t1,g46) in
                  match t3 with
                  | true1 ->
                    let t4 = PRIM_PutChar(g47) in
                    f1 arg k
                  | false0 ->
                    let t4 = PRIM_EqChar(t1,g48) in
                    match t4 with
                    | true1 ->
                      let t5 = PRIM_PutChar(g49) in
                      let t6 = PRIM_PutChar(g50) in
                      let t7 = CID1[g51,arg] in
                      f1 t7 k
                    | false0 ->
                      let t5 = PRIM_LessInt(g52,t2) in
                      match t5 with
                      | true1 -> me arg k
                      | false0 ->
                        let t6 = PRIM_EqInt(t2,g53) in
                        match t6 with
                        | true1 ->
                          match arg with
                          | Nil0 -> me arg k
                          | Cons1(t7,t8) ->
                            let t9 = PRIM_CharOrd(t7) in
                            let t10 = PRIM_LessInt(g54,t9) in
                            let k = [me,t8], fun [f2,f3] arg ->
                              let k = [f2,f3], fun [f2,f3] arg ->
                                let t1 = PRIM_PutChar(g61) in
                                let t2 = PRIM_PutChar(g62) in
                                let t3 = PRIM_PutChar(g63) in
                                f2 f3 k in
                              match arg with
                              | true1 ->
                                let t1 = PRIM_PutChar(g57) in
                                let t2 = PRIM_PutChar(g58) in
                                let t3 = PRIM_PutChar(g59) in
                                k t3
                              | false0 -> k g60 in
                            match t10 with
                            | true1 -> k g55
                            | false0 -> k g56
                        | false0 ->
                          let t7 = PRIM_PutChar(t1) in
                          let t8 = CID1[t1,arg] in
                          me t8 k in
                let k = [f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                  let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                    let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                      match arg with
                      | true1 -> k g65
                      | false0 ->
                        let k = [f2,f3,f4,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7] arg ->
                          let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                            let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                              let k = [f2,f3,f4,f5,f6,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
                                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                  let k = [f6], fun [f2] arg -> f2 arg k in
                                  match arg with
                                  | Nil0 -> k f5
                                  | Cons1(t1,t2) ->
                                    let t3 = [f3,t1], fun [f1,f2] me arg k ->
                                      match arg with
                                      | Nil0 -> k g68
                                      | Cons1(t1,t2) ->
                                        match t1 with
                                        | Pair0(t3,t4) ->
                                          let k = [f2,me,t2,t4], fun [f2,f3,f4,f5] arg ->
                                            let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                              match arg with
                                              | true1 ->
                                                let t1 = CID1[f4] in
                                                k t1
                                              | false0 -> f2 f3 k in
                                            arg f2 k in
                                          f1 t3 k in
                                    let k = [f2,f4,f5,t1,t2,t3], fun [f2,f3,f4,f5,f6,f7] arg ->
                                      let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                        match arg with
                                        | None0 ->
                                          let t1 = CID1[f5,g76] in
                                          let t2 = CID1[g69,t1] in
                                          let k = [f2,f4], fun [f2,f3] arg ->
                                            let k = [f3], fun [f2] arg ->
                                              let k = [f2], fun [f2] arg -> k f2 in
                                              g36 arg k in
                                            f2 arg k in
                                          f3 t2 k
                                        | Some1(t1) ->
                                          match t1 with
                                          | Data0(t2) ->
                                            let t3 = CID1[f5,g84] in
                                            let t4 = CID1[g77,t3] in
                                            let k = [f2,f4], fun [f2,f3] arg ->
                                              let k = [f3], fun [f2] arg ->
                                                let k = [f2], fun [f2] arg -> k f2 in
                                                g36 arg k in
                                              f2 arg k in
                                            f3 t4 k
                                          | Executable1(t2,t3) ->
                                            let k = [f6], fun [f2] arg -> arg f2 k in
                                            t3 f4 k in
                                      f7 arg k in
                                    match f5 with
                                    | Bindings0(t4) -> k t4 in
                                arg f7 k in
                              g10 g67 k in
                            f7 arg k in
                          f2 f7 k in
                        f5 g66 k in
                    arg f8 k in
                  f3 arg k in
                t1 g64 k in
              f2 g44 k in
            g36 arg k in
          f3 g41 k in
        let k = [f4,arg,t1,t3], fun [f2,f3,f4,f5] arg ->
          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
            let t1 = [f2], fun [f1] arg k ->
              let t1 = [f1,arg], fun [f1,f2] arg k ->
                match arg with
                | Cons1(t1,t2) ->
                  let k = [f2], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g36 arg k in
                  f1 g92 k
                | Nil0 ->
                  let k = [f1,f2], fun [f2,f3] arg ->
                    let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                      let k = [f2,f3], fun [f2,f3] arg ->
                        let t1 = [f2], fun [f1] me arg k ->
                          match arg with
                          | Nil0 -> k g94
                          | Cons1(t1,t2) ->
                            let t3 = PRIM_PutChar(g95) in
                            let k = [me,t2], fun [f2,f3] arg ->
                              let k = [f2,f3], fun [f2,f3] arg -> f2 f3 k in
                              g36 arg k in
                            f1 t1 k in
                        let k = [f3], fun [f2] arg ->
                          let t1 = PRIM_PutChar(g97) in
                          k f2 in
                        match arg with
                        | Nil0 -> k g96
                        | Cons1(t2,t3) ->
                          let k = [t1,t3], fun [f2,f3] arg ->
                            let k = [f2,f3], fun [f2,f3] arg -> f2 f3 k in
                            g36 arg k in
                          f2 t2 k in
                      f4 arg k in
                    match f3 with
                    | Bindings0(t1) -> k t1 in
                  g5 g93 k in
              k t1 in
            let t2 = CID1[g91,t1] in
            let t3 = CID0[g90,t2] in
            let t4 = [f2,f3,f4], fun [f1,f2,f3] arg k ->
              let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f4], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g36 arg k in
                  f1 g100 k
                | Cons1(t1,t2) ->
                  let t3 = [f2,t1], fun [f1,f2] me arg k ->
                    match arg with
                    | Nil0 -> k g101
                    | Cons1(t1,t2) ->
                      match t1 with
                      | Pair0(t3,t4) ->
                        let k = [f2,me,t2,t4], fun [f2,f3,f4,f5] arg ->
                          let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                            match arg with
                            | true1 ->
                              let t1 = CID1[f4] in
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
                            | Nil0 -> k g110
                            | Cons1(t1,t2) ->
                              match t1 with
                              | Pair0(t3,t4) ->
                                let k = [f2,me,t2,t4], fun [f2,f3,f4,f5] arg ->
                                  let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                    match arg with
                                    | true1 ->
                                      let t1 = CID1[f4] in
                                      k t1
                                    | false0 -> f2 f3 k in
                                  arg f2 k in
                                f1 t3 k in
                          let k = [f1,f3,arg,t1], fun [f2,f3,f4,f5] arg ->
                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                              match arg with
                              | None0 ->
                                let t1 = CID1[f4,g114] in
                                let t2 = CID1[g111,t1] in
                                let k = [f2], fun [f2] arg ->
                                  let k = [], fun [] arg -> g36 arg k in
                                  f2 arg k in
                                f3 t2 k
                              | Some1(t1) ->
                                match t1 with
                                | Data0(t2) ->
                                  let k = [], fun [] arg -> g36 arg k in
                                  f2 t2 k
                                | Executable1(t2,t3) ->
                                  let t4 = CID1[f4,g118] in
                                  let t5 = CID1[g115,t4] in
                                  let k = [f2], fun [f2] arg ->
                                    let k = [], fun [] arg -> g36 arg k in
                                    f2 arg k in
                                  f3 t5 k in
                            f5 arg k in
                          match f4 with
                          | Bindings0(t2) -> k t2 in
                        let k = [f5,f6], fun [f2,f3] arg ->
                          let k = [f2], fun [f2] arg -> k f2 in
                          arg f3 k in
                        g7 t1 k in
                      match arg with
                      | None0 ->
                        let t1 = CID1[f6,g105] in
                        let t2 = CID1[g102,t1] in
                        let k = [f2], fun [f2] arg ->
                          let k = [], fun [] arg -> g36 arg k in
                          f2 arg k in
                        f4 t2 k
                      | Some1(t1) ->
                        match t1 with
                        | Data0(t2) ->
                          let k = [], fun [] arg -> g36 arg k in
                          f2 t2 k
                        | Executable1(t2,t3) ->
                          let t4 = CID1[f6,g109] in
                          let t5 = CID1[g106,t4] in
                          let k = [f2], fun [f2] arg ->
                            let k = [], fun [] arg -> g36 arg k in
                            f2 arg k in
                          f4 t5 k in
                    f8 arg k in
                  match f4 with
                  | Bindings0(t4) -> k t4 in
              k t1 in
            let t5 = CID1[g99,t4] in
            let t6 = CID0[g98,t5] in
            let t7 = [f2,f3,f4], fun [f1,f2,f3] arg k ->
              let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f4], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g36 arg k in
                  f1 g121 k
                | Cons1(t1,t2) ->
                  let t3 = [f2,t1], fun [f1,f2] me arg k ->
                    match arg with
                    | Nil0 -> k g122
                    | Cons1(t1,t2) ->
                      match t1 with
                      | Pair0(t3,t4) ->
                        let k = [f2,me,t2,t4], fun [f2,f3,f4,f5] arg ->
                          let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                            match arg with
                            | true1 ->
                              let t1 = CID1[f4] in
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
                            | Nil0 -> k g131
                            | Cons1(t1,t2) ->
                              match t1 with
                              | Pair0(t3,t4) ->
                                let k = [f2,me,t2,t4], fun [f2,f3,f4,f5] arg ->
                                  let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                                    match arg with
                                    | true1 ->
                                      let t1 = CID1[f4] in
                                      k t1
                                    | false0 -> f2 f3 k in
                                  arg f2 k in
                                f1 t3 k in
                          let k = [f1,f3,arg,t1], fun [f2,f3,f4,f5] arg ->
                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                              match arg with
                              | None0 ->
                                let t1 = CID1[f4,g135] in
                                let t2 = CID1[g132,t1] in
                                let k = [f2], fun [f2] arg ->
                                  let k = [], fun [] arg -> g36 arg k in
                                  f2 arg k in
                                f3 t2 k
                              | Some1(t1) ->
                                match t1 with
                                | Data0(t2) ->
                                  let t3 = CID1[f4,g139] in
                                  let t4 = CID1[g136,t3] in
                                  let k = [f2], fun [f2] arg ->
                                    let k = [], fun [] arg -> g36 arg k in
                                    f2 arg k in
                                  f3 t4 k
                                | Executable1(t2,t3) ->
                                  let k = [], fun [] arg -> g36 arg k in
                                  f2 t2 k in
                            f5 arg k in
                          match f4 with
                          | Bindings0(t2) -> k t2 in
                        let k = [f5,f6], fun [f2,f3] arg ->
                          let k = [f2], fun [f2] arg -> k f2 in
                          arg f3 k in
                        g7 t1 k in
                      match arg with
                      | None0 ->
                        let t1 = CID1[f6,g126] in
                        let t2 = CID1[g123,t1] in
                        let k = [f2], fun [f2] arg ->
                          let k = [], fun [] arg -> g36 arg k in
                          f2 arg k in
                        f4 t2 k
                      | Some1(t1) ->
                        match t1 with
                        | Data0(t2) ->
                          let t3 = CID1[f6,g130] in
                          let t4 = CID1[g127,t3] in
                          let k = [f2], fun [f2] arg ->
                            let k = [], fun [] arg -> g36 arg k in
                            f2 arg k in
                          f4 t4 k
                        | Executable1(t2,t3) ->
                          let k = [], fun [] arg -> g36 arg k in
                          f2 t2 k in
                    f8 arg k in
                  match f4 with
                  | Bindings0(t4) -> k t4 in
              k t1 in
            let t8 = CID1[g120,t7] in
            let t9 = CID0[g119,t8] in
            let t10 = CID1[t9,g140] in
            let t11 = CID1[t6,t10] in
            let t12 = CID1[t3,t11] in
            let t13 = CID1[g89,t12] in
            let t14 = CID0[t13] in
            f5 t14 k in
          g36 arg k in
        f4 g85 k in
      g1 g34 k in
    g1 g23 k in
  g1 g18 k in
g1 g14 k
