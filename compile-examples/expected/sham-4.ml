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
let g12 = CID1 in
let g13 = CID0 in
let g14 = CID0 in
let g15 = CID0 in
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
          let k = [f1,t2,t3,t4], fun [f2,f3,f4,f5] arg ->
            let k = [f2,f3,f5], fun [f2,f3,f4] arg ->
              match arg with
              | true1 ->
                let k = [f3,f4], fun [f2,f3] arg ->
                  let k = [f3], fun [f2] arg -> arg f2 k in
                  arg f2 k in
                g11 f2 k
              | false0 -> k g15 in
            arg f4 k in
          f1 t1 k in
    k t1 in
  k t1 in
let g16 = CID0 in
let g17 = 1 in
let g18 = 0 in
let g19 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g16
        | Cons1(t1,t2) ->
          let t3 = PRIM_SetBytes(f1,f2,t1) in
          let t4 = PRIM_AddInt(f2,g17) in
          let k = [t2], fun [f2] arg -> arg f2 k in
          f3 t4 k in
      k t1 in
    let k = [f2,t1], fun [f2,f3] arg ->
      let k = [f3], fun [f2] arg ->
        let t1 = PRIM_FreezeBytes(f2) in
        k t1 in
      arg f2 k in
    t2 g18 k in
  g2 arg k in
let g20 = 0 in
let g21 = 1 in
let g22 = CID0 in
let g23 = 1 in
let g24 = fun arg k ->
  let t1 = [arg], fun [f1] me arg k ->
    let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
      let t1 = PRIM_LessInt(arg,g20) in
      match t1 with
      | true1 -> k f2
      | false0 ->
        let t2 = PRIM_StringIndex(f1,arg) in
        let t3 = CID1[t2,f2] in
        let k = [arg], fun [f2] arg ->
          let t1 = PRIM_SubInt(f2,g21) in
          arg t1 k in
        f3 t3 k in
    k t1 in
  let t2 = PRIM_StringLength(arg) in
  let k = [t2], fun [f2] arg ->
    let t1 = PRIM_SubInt(f2,g23) in
    arg t1 k in
  t1 g22 k in
let g25 = "" in
let g27 = CID0 in
let g26 = fun arg k ->
  match arg with
  | Nil0 -> k g27
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g26 t2 k in
let g28 = CID0 in
let g29 = ' ' in
let g30 = CID0 in
let g31 = ' ' in
let g32 = CID0 in
let g33 = "% " in
let g34 = '\EOT' in
let g35 = CID0 in
let g36 = CID1[g34,g35] in
let g37 = CID0 in
let g38 = '\n' in
let g39 = '\n' in
let g40 = CID0 in
let g41 = '\EOT' in
let g42 = '\EOT' in
let g43 = '\n' in
let g44 = CID0 in
let g45 = '\EOT' in
let g46 = 127 in
let g47 = 127 in
let g48 = 26 in
let g49 = CID0 in
let g50 = CID1 in
let g51 = '\b' in
let g52 = ' ' in
let g53 = '\b' in
let g54 = CID0 in
let g55 = '\b' in
let g56 = ' ' in
let g57 = '\b' in
let g58 = CID0 in
let g59 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g60 = CID0 in
let g61 = CID0 in
let g62 = CID0 in
let g63 = CID0 in
let g64 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g65 = "sham: " in
let g66 = ": " in
let g67 = "command not found" in
let g68 = "\n" in
let g69 = CID0 in
let g70 = CID1[g68,g69] in
let g71 = CID1[g67,g70] in
let g72 = CID1[g66,g71] in
let g73 = "sham: " in
let g74 = ": " in
let g75 = "Permission denied" in
let g76 = "\n" in
let g77 = CID0 in
let g78 = CID1[g76,g77] in
let g79 = CID1[g75,g78] in
let g80 = CID1[g74,g79] in
let g81 = "Sham: In-memory file-system. Consider typing \"ls\".\n" in
let g82 = "readme" in
let g83 = "Welcome to sham; please try all the commands!\nCan you find the hidden Easter Egg?\n" in
let g84 = CID0[g83] in
let g85 = CID0[g82,g84] in
let g86 = "ls" in
let g87 = "List all files on the file system.\n" in
let g88 = "ls: takes no arguments\n" in
let g89 = fun arg k ->
  match arg with
  | Pair0(t1,t2) -> k t1 in
let g90 = CID0 in
let g91 = ' ' in
let g92 = CID0 in
let g93 = '\n' in
let g94 = "cat" in
let g95 = "Show the content of data files.\n" in
let g96 = "cat: takes at least one argument\n" in
let g97 = CID0 in
let g98 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g99 = "cat: " in
let g100 = " : No such file\n" in
let g101 = CID0 in
let g102 = CID1[g100,g101] in
let g103 = "cat: " in
let g104 = " : Not a data file\n" in
let g105 = CID0 in
let g106 = CID1[g104,g105] in
let g107 = CID0 in
let g108 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g109 = "cat: " in
let g110 = " : No such file\n" in
let g111 = CID0 in
let g112 = CID1[g110,g111] in
let g113 = "cat: " in
let g114 = " : Not a data file\n" in
let g115 = CID0 in
let g116 = CID1[g114,g115] in
let g117 = "man" in
let g118 = "Show the manual page for a command.\n" in
let g119 = "man: takes at least one argument\n" in
let g120 = CID0 in
let g121 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g122 = "No manual entry for " in
let g123 = "\n" in
let g124 = CID0 in
let g125 = CID1[g123,g124] in
let g126 = "No manual entry for " in
let g127 = "\n" in
let g128 = CID0 in
let g129 = CID1[g127,g128] in
let g130 = CID0 in
let g131 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
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
    let t1 = [f2,arg], fun [f1,f2] me arg k ->
      match arg with
      | Nil0 -> k g25
      | Cons1(t1,t2) ->
        let k = [f1,f2,t1], fun [f2,f3,f4] arg ->
          let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
              let k = [arg,f2], fun [f2,f3] arg ->
                let k = [f3], fun [f2] arg -> f2 arg k in
                f2 arg k in
              f3 f4 k in
            g9 arg k in
          f3 f4 k in
        me t2 k in
    let t2 = [f2], fun [f1] me arg k ->
      let t1 = [f1,me], fun [f1,f2] me arg k ->
        let t1 = [f1,f2,arg,me], fun [f1,f2,f3,f4] arg k ->
          let t1 = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg k ->
            match arg with
            | Nil0 ->
              let k = [f1,f3,f5], fun [f2,f3,f4] arg ->
                let k = [f2,f3], fun [f2,f3] arg ->
                  let k = [f3], fun [f2] arg ->
                    let t1 = CID1[arg,f2] in
                    k t1 in
                  f2 arg k in
                arg f4 k in
              g10 g28 k
            | Cons1(t1,t2) ->
              let t3 = PRIM_EqChar(t1,g29) in
              match t3 with
              | true1 ->
                let k = [f1,f2,f3,f5,t2], fun [f2,f3,f4,f5,f6] arg ->
                  let k = [f2,f3,f4,f6], fun [f2,f3,f4,f5] arg ->
                    let k = [f3,f4,f5], fun [f2,f3,f4] arg ->
                      let t1 = CID1[arg,f3] in
                      let k = [f4], fun [f2] arg -> arg f2 k in
                      f2 t1 k in
                    f2 arg k in
                  arg f5 k in
                g10 g30 k
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
          let t3 = PRIM_EqChar(t1,g31) in
          match t3 with
          | true1 ->
            let k = [t2], fun [f2] arg -> arg f2 k in
            f2 f1 k
          | false0 ->
            let k = [t1,t2], fun [f2,f3] arg ->
              let t1 = CID1[f2,g32] in
              let k = [f3], fun [f2] arg -> arg f2 k in
              arg t1 k in
            f3 f1 k in
      k t2 in
    let t3 = [f2,arg,t1,t2], fun [f1,f2,f3,f4] me arg k ->
      let k = [f1,f2,f3,f4,arg,me], fun [f2,f3,f4,f5,f6,f7] arg ->
        let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
          let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
            let t1 = [f2], fun [f1] me arg k ->
              let t1 = PRIM_GetChar(g37) in
              let t2 = PRIM_CharOrd(t1) in
              let t3 = PRIM_EqChar(t1,g38) in
              match t3 with
              | true1 ->
                let t4 = PRIM_PutChar(g39) in
                let k = [f1,arg], fun [f2,f3] arg ->
                  let k = [f2], fun [f2] arg -> f2 arg k in
                  arg f3 k in
                g10 g40 k
              | false0 ->
                let t4 = PRIM_EqChar(t1,g41) in
                match t4 with
                | true1 ->
                  let t5 = PRIM_PutChar(g42) in
                  let t6 = PRIM_PutChar(g43) in
                  let k = [f1,arg], fun [f2,f3] arg ->
                    let t1 = CID1[g45,f3] in
                    let k = [f2], fun [f2] arg -> f2 arg k in
                    arg t1 k in
                  g10 g44 k
                | false0 ->
                  let t5 = PRIM_LessInt(g46,t2) in
                  match t5 with
                  | true1 -> me arg k
                  | false0 ->
                    let t6 = PRIM_EqInt(t2,g47) in
                    match t6 with
                    | true1 ->
                      match arg with
                      | Nil0 -> me arg k
                      | Cons1(t7,t8) ->
                        let t9 = PRIM_CharOrd(t7) in
                        let t10 = PRIM_LessInt(g48,t9) in
                        let k = [me,t8], fun [f2,f3] arg ->
                          let k = [f2,f3], fun [f2,f3] arg ->
                            let t1 = PRIM_PutChar(g55) in
                            let t2 = PRIM_PutChar(g56) in
                            let t3 = PRIM_PutChar(g57) in
                            f2 f3 k in
                          match arg with
                          | true1 ->
                            let t1 = PRIM_PutChar(g51) in
                            let t2 = PRIM_PutChar(g52) in
                            let t3 = PRIM_PutChar(g53) in
                            k t3
                          | false0 -> k g54 in
                        match t10 with
                        | true1 -> k g49
                        | false0 -> k g50
                    | false0 ->
                      let t7 = PRIM_PutChar(t1) in
                      let t8 = CID1[t1,arg] in
                      me t8 k in
            let k = [f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7] arg ->
              let k = [f2,f3,f4,f5,f6,f7,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                let k = [f2,f3,f4,f5,f6,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                  let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                    let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                      let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                        match arg with
                        | true1 -> k g60
                        | false0 ->
                          let k = [f2,f3,f5,f6,f7], fun [f2,f3,f4,f5,f6] arg ->
                            let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                              let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
                                    let k = [f5], fun [f2] arg -> f2 arg k in
                                    match arg with
                                    | Nil0 -> k f4
                                    | Cons1(t1,t2) ->
                                      let t3 = [f2,t1], fun [f1,f2] me arg k ->
                                        match arg with
                                        | Nil0 -> k g63
                                        | Cons1(t1,t2) ->
                                          match t1 with
                                          | Pair0(t3,t4) ->
                                            let k = [f1,f2,me,t2,t4], fun [f2,f3,f4,f5,f6] arg ->
                                              let k = [f4,f5,f6,arg], fun [f2,f3,f4,f5] arg ->
                                                let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                                  let k = [f2,f3,f4,f6], fun [f2,f3,f4,f5] arg ->
                                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                                      match arg with
                                                      | true1 ->
                                                        let t1 = CID1[f4] in
                                                        k t1
                                                      | false0 -> f2 f3 k in
                                                    arg f5 k in
                                                  arg f5 k in
                                                g11 g64 k in
                                              f2 f3 k in
                                            f1 t3 k in
                                      let k = [f2,f3,f4,t1,t2,t3], fun [f2,f3,f4,f5,f6,f7] arg ->
                                        let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                                          match arg with
                                          | None0 ->
                                            let t1 = CID1[f5,g72] in
                                            let t2 = CID1[g65,t1] in
                                            let k = [f2,f4], fun [f2,f3] arg ->
                                              let k = [f3], fun [f2] arg ->
                                                let k = [f2], fun [f2] arg -> k f2 in
                                                g26 arg k in
                                              f2 arg k in
                                            f3 t2 k
                                          | Some1(t1) ->
                                            match t1 with
                                            | Data0(t2) ->
                                              let t3 = CID1[f5,g80] in
                                              let t4 = CID1[g73,t3] in
                                              let k = [f2,f4], fun [f2,f3] arg ->
                                                let k = [f3], fun [f2] arg ->
                                                  let k = [f2], fun [f2] arg -> k f2 in
                                                  g26 arg k in
                                                f2 arg k in
                                              f3 t4 k
                                            | Executable1(t2,t3) ->
                                              let k = [f6], fun [f2] arg -> arg f2 k in
                                              t3 f4 k in
                                        f7 arg k in
                                      match f4 with
                                      | Bindings0(t4) -> k t4 in
                                  arg f6 k in
                                g10 g62 k in
                              f6 arg k in
                            f2 f6 k in
                          f4 g61 k in
                      arg f8 k in
                    arg f8 k in
                  g11 g59 k in
                f2 f7 k in
              f2 arg k in
            t1 g58 k in
          f2 g36 k in
        g26 arg k in
      f2 g33 k in
    let k = [arg,t1,t3], fun [f2,f3,f4] arg ->
      let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
        let t1 = [f2], fun [f1] arg k ->
          let t1 = [f1,arg], fun [f1,f2] arg k ->
            match arg with
            | Cons1(t1,t2) ->
              let k = [f2], fun [f2] arg ->
                let k = [f2], fun [f2] arg -> k f2 in
                g26 arg k in
              f1 g88 k
            | Nil0 ->
              let k = [f1,f2], fun [f2,f3] arg ->
                let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                  let k = [f2,f3], fun [f2,f3] arg ->
                    let t1 = [f2], fun [f1] me arg k ->
                      match arg with
                      | Nil0 -> k g90
                      | Cons1(t1,t2) ->
                        let t3 = PRIM_PutChar(g91) in
                        let k = [me,t2], fun [f2,f3] arg ->
                          let k = [f2,f3], fun [f2,f3] arg -> f2 f3 k in
                          g26 arg k in
                        f1 t1 k in
                    let k = [f3], fun [f2] arg ->
                      let t1 = PRIM_PutChar(g93) in
                      k f2 in
                    match arg with
                    | Nil0 -> k g92
                    | Cons1(t2,t3) ->
                      let k = [t1,t3], fun [f2,f3] arg ->
                        let k = [f2,f3], fun [f2,f3] arg -> f2 f3 k in
                        g26 arg k in
                      f2 t2 k in
                  f4 arg k in
                match f3 with
                | Bindings0(t1) -> k t1 in
              g5 g89 k in
          k t1 in
        let t2 = CID1[g87,t1] in
        let t3 = CID0[g86,t2] in
        let t4 = [f2,f3], fun [f1,f2] arg k ->
          let t1 = [f1,f2,arg], fun [f1,f2,f3] arg k ->
            match arg with
            | Nil0 ->
              let k = [f3], fun [f2] arg ->
                let k = [f2], fun [f2] arg -> k f2 in
                g26 arg k in
              f1 g96 k
            | Cons1(t1,t2) ->
              let t3 = [f1,t1], fun [f1,f2] me arg k ->
                match arg with
                | Nil0 -> k g97
                | Cons1(t1,t2) ->
                  match t1 with
                  | Pair0(t3,t4) ->
                    let k = [f1,f2,me,t2,t4], fun [f2,f3,f4,f5,f6] arg ->
                      let k = [f4,f5,f6,arg], fun [f2,f3,f4,f5] arg ->
                        let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                          let k = [f2,f3,f4,f6], fun [f2,f3,f4,f5] arg ->
                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                              match arg with
                              | true1 ->
                                let t1 = CID1[f4] in
                                k t1
                              | false0 -> f2 f3 k in
                            arg f5 k in
                          arg f5 k in
                        g11 g98 k in
                      f2 f3 k in
                    f1 t3 k in
              let k = [f1,f2,f3,t1,t2,t3], fun [f2,f3,f4,f5,f6,f7] arg ->
                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                  let k = [f2,f3,f4,f6], fun [f2,f3,f4,f5] arg ->
                    let t1 = [f2,f3,f4], fun [f1,f2,f3] arg k ->
                      let t1 = [f1,arg], fun [f1,f2] me arg k ->
                        match arg with
                        | Nil0 -> k g107
                        | Cons1(t1,t2) ->
                          match t1 with
                          | Pair0(t3,t4) ->
                            let k = [f1,f2,me,t2,t4], fun [f2,f3,f4,f5,f6] arg ->
                              let k = [f4,f5,f6,arg], fun [f2,f3,f4,f5] arg ->
                                let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                  let k = [f2,f3,f4,f6], fun [f2,f3,f4,f5] arg ->
                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                      match arg with
                                      | true1 ->
                                        let t1 = CID1[f4] in
                                        k t1
                                      | false0 -> f2 f3 k in
                                    arg f5 k in
                                  arg f5 k in
                                g11 g108 k in
                              f2 f3 k in
                            f1 t3 k in
                      let k = [f1,f2,arg,t1], fun [f2,f3,f4,f5] arg ->
                        let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                          match arg with
                          | None0 ->
                            let t1 = CID1[f4,g112] in
                            let t2 = CID1[g109,t1] in
                            let k = [f2], fun [f2] arg ->
                              let k = [], fun [] arg -> g26 arg k in
                              f2 arg k in
                            f3 t2 k
                          | Some1(t1) ->
                            match t1 with
                            | Data0(t2) ->
                              let k = [], fun [] arg -> g26 arg k in
                              f2 t2 k
                            | Executable1(t2,t3) ->
                              let t4 = CID1[f4,g116] in
                              let t5 = CID1[g113,t4] in
                              let k = [f2], fun [f2] arg ->
                                let k = [], fun [] arg -> g26 arg k in
                                f2 arg k in
                              f3 t5 k in
                        f5 arg k in
                      match f3 with
                      | Bindings0(t2) -> k t2 in
                    let k = [f4,f5], fun [f2,f3] arg ->
                      let k = [f2], fun [f2] arg -> k f2 in
                      arg f3 k in
                    g7 t1 k in
                  match arg with
                  | None0 ->
                    let t1 = CID1[f5,g102] in
                    let t2 = CID1[g99,t1] in
                    let k = [f2], fun [f2] arg ->
                      let k = [], fun [] arg -> g26 arg k in
                      f2 arg k in
                    f3 t2 k
                  | Some1(t1) ->
                    match t1 with
                    | Data0(t2) ->
                      let k = [], fun [] arg -> g26 arg k in
                      f2 t2 k
                    | Executable1(t2,t3) ->
                      let t4 = CID1[f5,g106] in
                      let t5 = CID1[g103,t4] in
                      let k = [f2], fun [f2] arg ->
                        let k = [], fun [] arg -> g26 arg k in
                        f2 arg k in
                      f3 t5 k in
                f7 arg k in
              match f3 with
              | Bindings0(t4) -> k t4 in
          k t1 in
        let t5 = CID1[g95,t4] in
        let t6 = CID0[g94,t5] in
        let t7 = [f2,f3], fun [f1,f2] arg k ->
          let t1 = [f1,f2,arg], fun [f1,f2,f3] arg k ->
            match arg with
            | Nil0 ->
              let k = [f3], fun [f2] arg ->
                let k = [f2], fun [f2] arg -> k f2 in
                g26 arg k in
              f1 g119 k
            | Cons1(t1,t2) ->
              let t3 = [f1,t1], fun [f1,f2] me arg k ->
                match arg with
                | Nil0 -> k g120
                | Cons1(t1,t2) ->
                  match t1 with
                  | Pair0(t3,t4) ->
                    let k = [f1,f2,me,t2,t4], fun [f2,f3,f4,f5,f6] arg ->
                      let k = [f4,f5,f6,arg], fun [f2,f3,f4,f5] arg ->
                        let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                          let k = [f2,f3,f4,f6], fun [f2,f3,f4,f5] arg ->
                            let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                              match arg with
                              | true1 ->
                                let t1 = CID1[f4] in
                                k t1
                              | false0 -> f2 f3 k in
                            arg f5 k in
                          arg f5 k in
                        g11 g121 k in
                      f2 f3 k in
                    f1 t3 k in
              let k = [f1,f2,f3,t1,t2,t3], fun [f2,f3,f4,f5,f6,f7] arg ->
                let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                  let k = [f2,f3,f4,f6], fun [f2,f3,f4,f5] arg ->
                    let t1 = [f2,f3,f4], fun [f1,f2,f3] arg k ->
                      let t1 = [f1,arg], fun [f1,f2] me arg k ->
                        match arg with
                        | Nil0 -> k g130
                        | Cons1(t1,t2) ->
                          match t1 with
                          | Pair0(t3,t4) ->
                            let k = [f1,f2,me,t2,t4], fun [f2,f3,f4,f5,f6] arg ->
                              let k = [f4,f5,f6,arg], fun [f2,f3,f4,f5] arg ->
                                let k = [f2,f3,f4,f5,arg], fun [f2,f3,f4,f5,f6] arg ->
                                  let k = [f2,f3,f4,f6], fun [f2,f3,f4,f5] arg ->
                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                                      match arg with
                                      | true1 ->
                                        let t1 = CID1[f4] in
                                        k t1
                                      | false0 -> f2 f3 k in
                                    arg f5 k in
                                  arg f5 k in
                                g11 g131 k in
                              f2 f3 k in
                            f1 t3 k in
                      let k = [f1,f2,arg,t1], fun [f2,f3,f4,f5] arg ->
                        let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                          match arg with
                          | None0 ->
                            let t1 = CID1[f4,g135] in
                            let t2 = CID1[g132,t1] in
                            let k = [f2], fun [f2] arg ->
                              let k = [], fun [] arg -> g26 arg k in
                              f2 arg k in
                            f3 t2 k
                          | Some1(t1) ->
                            match t1 with
                            | Data0(t2) ->
                              let t3 = CID1[f4,g139] in
                              let t4 = CID1[g136,t3] in
                              let k = [f2], fun [f2] arg ->
                                let k = [], fun [] arg -> g26 arg k in
                                f2 arg k in
                              f3 t4 k
                            | Executable1(t2,t3) ->
                              let k = [], fun [] arg -> g26 arg k in
                              f2 t2 k in
                        f5 arg k in
                      match f3 with
                      | Bindings0(t2) -> k t2 in
                    let k = [f4,f5], fun [f2,f3] arg ->
                      let k = [f2], fun [f2] arg -> k f2 in
                      arg f3 k in
                    g7 t1 k in
                  match arg with
                  | None0 ->
                    let t1 = CID1[f5,g125] in
                    let t2 = CID1[g122,t1] in
                    let k = [f2], fun [f2] arg ->
                      let k = [], fun [] arg -> g26 arg k in
                      f2 arg k in
                    f3 t2 k
                  | Some1(t1) ->
                    match t1 with
                    | Data0(t2) ->
                      let t3 = CID1[f5,g129] in
                      let t4 = CID1[g126,t3] in
                      let k = [f2], fun [f2] arg ->
                        let k = [], fun [] arg -> g26 arg k in
                        f2 arg k in
                      f3 t4 k
                    | Executable1(t2,t3) ->
                      let k = [], fun [] arg -> g26 arg k in
                      f2 t2 k in
                f7 arg k in
              match f3 with
              | Bindings0(t4) -> k t4 in
          k t1 in
        let t8 = CID1[g118,t7] in
        let t9 = CID0[g117,t8] in
        let t10 = CID1[t9,g140] in
        let t11 = CID1[t6,t10] in
        let t12 = CID1[t3,t11] in
        let t13 = CID1[g85,t12] in
        let t14 = CID0[t13] in
        f4 t14 k in
      g26 arg k in
    arg g81 k in
  g1 g24 k in
g1 g19 k
