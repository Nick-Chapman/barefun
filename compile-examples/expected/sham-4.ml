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
let g4 = CID0 in
let g3 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g4
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f2,f3] arg ->
        let k = [f3,arg], fun [f2,f3] arg ->
          let k = [f3], fun [f2] arg ->
            let t1 = CID1[f2,arg] in
            k t1 in
          arg f2 k in
        g3 f2 k in
      f1 t1 k in
  k t1 in
let g6 = CID0 in
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
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match arg with
      | Nil0 -> k f2
      | Cons1(t1,t2) ->
        let k = [f1,f2,t1,t2], fun [f2,f3,f4,f5] arg ->
          let k = [arg,f4,f5], fun [f2,f3,f4] arg ->
            let k = [f2,f4], fun [f2,f3] arg ->
              let k = [f3], fun [f2] arg -> arg f2 k in
              f2 arg k in
            arg f3 k in
          f2 f3 k in
        g7 f1 k in
    k t1 in
  k t1 in
let g8 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t1], fun [f2,f3] arg ->
        let k = [f3], fun [f2] arg ->
          let t1 = CID1[f2,arg] in
          k t1 in
        arg f2 k in
      g8 t2 k in
  k t1 in
let g9 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g9 t3 k in
  k t1 in
let g10 = CID0 in
let g11 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g10
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
let g12 = CID0 in
let g13 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g12
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
let g14 = CID0 in
let g15 = fun arg k ->
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
  t1 g14 k in
let g16 = CID0 in
let g17 = CID1 in
let g18 = CID0 in
let g19 = CID1 in
let g20 = CID0 in
let g21 = CID1 in
let g22 = CID0 in
let g23 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_StringLength(f1) in
    let t2 = PRIM_StringLength(arg) in
    let t3 = PRIM_EqInt(t1,t2) in
    let k = [f1,arg,t1], fun [f2,f3,f4] arg ->
      match arg with
      | true1 -> k g18
      | false0 ->
        let t1 = [f2,f3], fun [f1,f2] me arg k ->
          let t1 = PRIM_LessInt(arg,0) in
          match t1 with
          | true1 -> k g19
          | false0 ->
            let t2 = PRIM_StringIndex(f1,arg) in
            let t3 = PRIM_StringIndex(f2,arg) in
            let t4 = PRIM_EqChar(t2,t3) in
            let k = [arg,me], fun [f2,f3] arg ->
              match arg with
              | true1 -> k g22
              | false0 ->
                let t1 = PRIM_SubInt(f2,1) in
                f3 t1 k in
            match t4 with
            | true1 -> k g20
            | false0 -> k g21 in
        let t2 = PRIM_SubInt(f4,1) in
        t1 t2 k in
    match t3 with
    | true1 -> k g16
    | false0 -> k g17 in
  k t1 in
let g24 = "" in
let g26 = CID0 in
let g25 = fun arg k ->
  match arg with
  | Nil0 -> k g26
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,8) in
    let k = [t2], fun [f2] arg -> g25 f2 k in
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
let g27 = CID0 in
let g28 = "% " in
let g29 = CID0 in
let g30 = CID0 in
let g31 = CID0 in
let g32 = CID1 in
let g33 = CID0 in
let g34 = CID0 in
let g35 = CID0 in
let g36 = CID0 in
let g37 = CID0 in
let g38 = CID0 in
let g39 = "sham: " in
let g40 = ": " in
let g41 = "command not found" in
let g42 = "\n" in
let g43 = CID0 in
let g44 = CID1[g42,g43] in
let g45 = CID1[g41,g44] in
let g46 = CID1[g40,g45] in
let g47 = "sham: " in
let g48 = ": " in
let g49 = "Permission denied" in
let g50 = "\n" in
let g51 = CID0 in
let g52 = CID1[g50,g51] in
let g53 = CID1[g49,g52] in
let g54 = CID1[g48,g53] in
let g55 = "Sham: In-memory file-system. Consider typing \"ls\".\n" in
let g56 = "readme" in
let g57 = "Welcome to sham; please try all the commands!\nCan you find the hidden Easter Egg?\n" in
let g58 = CID0[g57] in
let g59 = CID0[g56,g58] in
let g60 = "ls" in
let g61 = "ls - list directory contents\n" in
let g62 = "ls: takes no arguments\n" in
let g63 = fun arg k ->
  match arg with
  | Pair0(t1,t2) -> k t1 in
let g64 = CID0 in
let g65 = CID0 in
let g66 = "cat" in
let g67 = "cat - concatenate files and print on the standard output\n" in
let g68 = "cat: takes at least one argument\n" in
let g69 = CID0 in
let g70 = "cat: " in
let g71 = " : No such file\n" in
let g72 = CID0 in
let g73 = CID1[g71,g72] in
let g74 = "cat: " in
let g75 = " : Not a data file\n" in
let g76 = CID0 in
let g77 = CID1[g75,g76] in
let g78 = CID0 in
let g79 = "cat: " in
let g80 = " : No such file\n" in
let g81 = CID0 in
let g82 = CID1[g80,g81] in
let g83 = "cat: " in
let g84 = " : Not a data file\n" in
let g85 = CID0 in
let g86 = CID1[g84,g85] in
let g87 = "man" in
let g88 = "man - an interface to the system reference manuals\n" in
let g89 = "What manual page do you want?\n" in
let g90 = CID0 in
let g91 = "No manual entry for " in
let g92 = "\n" in
let g93 = CID0 in
let g94 = CID1[g92,g93] in
let g95 = "No manual entry for " in
let g96 = "\n" in
let g97 = CID0 in
let g98 = CID1[g96,g97] in
let g99 = CID0 in
let g100 = "No manual entry for " in
let g101 = "\n" in
let g102 = CID0 in
let g103 = CID1[g101,g102] in
let g104 = "No manual entry for " in
let g105 = "\n" in
let g106 = CID0 in
let g107 = CID1[g105,g106] in
let g108 = "rm" in
let g109 = "rm - remove files or directories (directories not supported yet!)\n" in
let g110 = "rm: missing operand\n" in
let g111 = "rm: cannot remove '" in
let g112 = "': No such file or directory\n" in
let g113 = CID0 in
let g114 = CID1[g112,g113] in
let g115 = CID0 in
let g116 = "cp" in
let g117 = "cp - copy files and directories\n" in
let g118 = "cp: missing file operand\n" in
let g119 = "cp: missing destination file operand after '" in
let g120 = "'\n" in
let g121 = CID0 in
let g122 = CID1[g120,g121] in
let g123 = "cp: unexpected extra operands\n" in
let g124 = CID0 in
let g125 = "cp: cannot stat '" in
let g126 = "': No such file or directory\n" in
let g127 = CID0 in
let g128 = CID1[g126,g127] in
let g129 = "mv" in
let g130 = "mv - move (rename) files\n" in
let g131 = "mv: missing file operand\n" in
let g132 = "mv: missing destination file operand after '" in
let g133 = "'\n" in
let g134 = CID0 in
let g135 = CID1[g133,g134] in
let g136 = "mv: unexpected extra operands\n" in
let g137 = CID0 in
let g138 = "mv: cannot stat '" in
let g139 = "': No such file or directory\n" in
let g140 = CID0 in
let g141 = CID1[g139,g140] in
let g142 = "rm: cannot remove '" in
let g143 = "': No such file or directory\n" in
let g144 = CID0 in
let g145 = CID1[g143,g144] in
let g146 = CID0 in
let g147 = CID0 in
let k = [], fun [] arg ->
  let k = [arg], fun [f2] arg ->
    let k = [f2,arg], fun [f2,f3] arg ->
      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
        let t1 = [f2,f4], fun [f1,f2] me arg k ->
          match arg with
          | Nil0 -> k g24
          | Cons1(t1,t2) ->
            let k = [f1,f2,t1], fun [f2,f3,f4] arg ->
              let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                  let k = [f2,arg], fun [f2,f3] arg ->
                    let k = [f2], fun [f2] arg -> f2 arg k in
                    f3 arg k in
                  f3 f4 k in
                g8 arg k in
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
                  let t3 = PRIM_EqChar(t1,' ') in
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
              let t3 = PRIM_EqChar(t1,' ') in
              match t3 with
              | true1 ->
                let k = [t2], fun [f2] arg -> arg f2 k in
                f2 f1 k
              | false0 ->
                let k = [t1,t2], fun [f2,f3] arg ->
                  let t1 = CID1[f2,g27] in
                  let k = [f3], fun [f2] arg -> arg f2 k in
                  arg t1 k in
                f3 f1 k in
          k t2 in
        let t3 = [f2,f3,f4,arg,t1,t2], fun [f1,f2,f3,f4,f5,f6] me arg k ->
          let k = [f1,f2,f3,f4,f5,f6,arg,me], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
            let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
              let t1 = CID1['\EOT',g29] in
              let k = [f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                let t1 = [f2], fun [f1] me arg k ->
                  let t1 = PRIM_GetChar(g30) in
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
                      let t8 = CID1['\EOT',arg] in
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
                              | false0 -> k g33 in
                            match t10 with
                            | true1 -> k g31
                            | false0 -> k g32
                        | false0 ->
                          let t7 = PRIM_CharOrd(t1) in
                          let t8 = PRIM_EqInt(t7,8) in
                          let k = [arg,me,t1], fun [f2,f3,f4] arg ->
                            let t1 = CID1[f4,f2] in
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
                let k = [f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                  let k = [f2,f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                    let k = [f2,f3,f4,f5,f6,f7,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                      match arg with
                      | true1 -> k g35
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
                                    let t3 = [f3,t1], fun [f1,f2] me arg k ->
                                      match arg with
                                      | Nil0 -> k g38
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
                                          let t1 = CID1[f5,g46] in
                                          let t2 = CID1[g39,t1] in
                                          let k = [f2,f4], fun [f2,f3] arg ->
                                            let k = [f3], fun [f2] arg ->
                                              let k = [f2], fun [f2] arg -> k f2 in
                                              g25 arg k in
                                            f2 arg k in
                                          f3 t2 k
                                        | Some1(t1) ->
                                          match t1 with
                                          | Data0(t2) ->
                                            let t3 = CID1[f5,g54] in
                                            let t4 = CID1[g47,t3] in
                                            let k = [f2,f4], fun [f2,f3] arg ->
                                              let k = [f3], fun [f2] arg ->
                                                let k = [f2], fun [f2] arg -> k f2 in
                                                g25 arg k in
                                              f2 arg k in
                                            f3 t4 k
                                          | Executable1(t2,t3) ->
                                            let k = [f6], fun [f2] arg -> arg f2 k in
                                            t3 f4 k in
                                      f7 arg k in
                                    match f5 with
                                    | Bindings0(t4) -> k t4 in
                                arg f7 k in
                              g9 g37 k in
                            f5 arg k in
                          f2 f7 k in
                        f5 g36 k in
                    arg f8 k in
                  f3 arg k in
                t1 g34 k in
              f2 t1 k in
            g25 arg k in
          f3 g28 k in
        let k = [f4,arg,t1,t3], fun [f2,f3,f4,f5] arg ->
          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
            let t1 = [f2], fun [f1] arg k ->
              let t1 = [f1,arg], fun [f1,f2] arg k ->
                match arg with
                | Cons1(t1,t2) ->
                  let k = [f2], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g25 arg k in
                  f1 g62 k
                | Nil0 ->
                  let k = [f1,f2], fun [f2,f3] arg ->
                    let k = [f2,arg,f3], fun [f2,f3,f4] arg ->
                      let k = [f2,f4], fun [f2,f3] arg ->
                        let t1 = [f2], fun [f1] me arg k ->
                          match arg with
                          | Nil0 -> k g64
                          | Cons1(t1,t2) ->
                            let t3 = PRIM_PutChar(' ') in
                            let k = [me,t2], fun [f2,f3] arg ->
                              let k = [f2,f3], fun [f2,f3] arg -> f2 f3 k in
                              g25 arg k in
                            f1 t1 k in
                        let k = [f3], fun [f2] arg ->
                          let t1 = PRIM_PutChar('\n') in
                          k f2 in
                        match arg with
                        | Nil0 -> k g65
                        | Cons1(t2,t3) ->
                          let k = [t1,t3], fun [f2,f3] arg ->
                            let k = [f2,f3], fun [f2,f3] arg -> f2 f3 k in
                            g25 arg k in
                          f2 t2 k in
                      f3 arg k in
                    match f3 with
                    | Bindings0(t1) -> k t1 in
                  g3 g63 k in
              k t1 in
            let t2 = CID1[g61,t1] in
            let t3 = CID0[g60,t2] in
            let t4 = [f2,f3,f4], fun [f1,f2,f3] arg k ->
              let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f4], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g25 arg k in
                  f1 g68 k
                | Cons1(t1,t2) ->
                  let t3 = [f2,t1], fun [f1,f2] me arg k ->
                    match arg with
                    | Nil0 -> k g69
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
                            | Nil0 -> k g78
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
                                let t1 = CID1[f4,g82] in
                                let t2 = CID1[g79,t1] in
                                let k = [f2], fun [f2] arg ->
                                  let k = [], fun [] arg -> g25 arg k in
                                  f2 arg k in
                                f3 t2 k
                              | Some1(t1) ->
                                match t1 with
                                | Data0(t2) ->
                                  let k = [], fun [] arg -> g25 arg k in
                                  f2 t2 k
                                | Executable1(t2,t3) ->
                                  let t4 = CID1[f4,g86] in
                                  let t5 = CID1[g83,t4] in
                                  let k = [f2], fun [f2] arg ->
                                    let k = [], fun [] arg -> g25 arg k in
                                    f2 arg k in
                                  f3 t5 k in
                            f5 arg k in
                          match f4 with
                          | Bindings0(t2) -> k t2 in
                        let k = [f5,f6], fun [f2,f3] arg ->
                          let k = [f2], fun [f2] arg -> k f2 in
                          arg f3 k in
                        g5 t1 k in
                      match arg with
                      | None0 ->
                        let t1 = CID1[f6,g73] in
                        let t2 = CID1[g70,t1] in
                        let k = [f2], fun [f2] arg ->
                          let k = [], fun [] arg -> g25 arg k in
                          f2 arg k in
                        f4 t2 k
                      | Some1(t1) ->
                        match t1 with
                        | Data0(t2) ->
                          let k = [], fun [] arg -> g25 arg k in
                          f2 t2 k
                        | Executable1(t2,t3) ->
                          let t4 = CID1[f6,g77] in
                          let t5 = CID1[g74,t4] in
                          let k = [f2], fun [f2] arg ->
                            let k = [], fun [] arg -> g25 arg k in
                            f2 arg k in
                          f4 t5 k in
                    f8 arg k in
                  match f4 with
                  | Bindings0(t4) -> k t4 in
              k t1 in
            let t5 = CID1[g67,t4] in
            let t6 = CID0[g66,t5] in
            let t7 = [f2,f3,f4], fun [f1,f2,f3] arg k ->
              let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f4], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g25 arg k in
                  f1 g89 k
                | Cons1(t1,t2) ->
                  let t3 = [f2,t1], fun [f1,f2] me arg k ->
                    match arg with
                    | Nil0 -> k g90
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
                            | Nil0 -> k g99
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
                                let t1 = CID1[f4,g103] in
                                let t2 = CID1[g100,t1] in
                                let k = [f2], fun [f2] arg ->
                                  let k = [], fun [] arg -> g25 arg k in
                                  f2 arg k in
                                f3 t2 k
                              | Some1(t1) ->
                                match t1 with
                                | Data0(t2) ->
                                  let t3 = CID1[f4,g107] in
                                  let t4 = CID1[g104,t3] in
                                  let k = [f2], fun [f2] arg ->
                                    let k = [], fun [] arg -> g25 arg k in
                                    f2 arg k in
                                  f3 t4 k
                                | Executable1(t2,t3) ->
                                  let k = [], fun [] arg -> g25 arg k in
                                  f2 t2 k in
                            f5 arg k in
                          match f4 with
                          | Bindings0(t2) -> k t2 in
                        let k = [f5,f6], fun [f2,f3] arg ->
                          let k = [f2], fun [f2] arg -> k f2 in
                          arg f3 k in
                        g5 t1 k in
                      match arg with
                      | None0 ->
                        let t1 = CID1[f6,g94] in
                        let t2 = CID1[g91,t1] in
                        let k = [f2], fun [f2] arg ->
                          let k = [], fun [] arg -> g25 arg k in
                          f2 arg k in
                        f4 t2 k
                      | Some1(t1) ->
                        match t1 with
                        | Data0(t2) ->
                          let t3 = CID1[f6,g98] in
                          let t4 = CID1[g95,t3] in
                          let k = [f2], fun [f2] arg ->
                            let k = [], fun [] arg -> g25 arg k in
                            f2 arg k in
                          f4 t4 k
                        | Executable1(t2,t3) ->
                          let k = [], fun [] arg -> g25 arg k in
                          f2 t2 k in
                    f8 arg k in
                  match f4 with
                  | Bindings0(t4) -> k t4 in
              k t1 in
            let t8 = CID1[g88,t7] in
            let t9 = CID0[g87,t8] in
            let t10 = [f2,f3,f4], fun [f1,f2,f3] arg k ->
              let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f4], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g25 arg k in
                  f1 g110 k
                | Cons1(t1,t2) ->
                  let t3 = [f1,f2,f3], fun [f1,f2,f3] arg k ->
                    let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg k ->
                      let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] me arg k ->
                        match arg with
                        | Nil0 ->
                          let t1 = CID1[f4,g114] in
                          let t2 = CID1[g111,t1] in
                          let k = [f1], fun [f2] arg ->
                            let k = [], fun [] arg ->
                              let k = [], fun [] arg -> k g115 in
                              g25 arg k in
                            f2 arg k in
                          f3 t2 k
                        | Cons1(t1,t2) ->
                          match t1 with
                          | Pair0(t3,t4) ->
                            let k = [f4,me,t2,t3,t4], fun [f2,f3,f4,f5,f6] arg ->
                              let k = [f3,f4,f5,f6], fun [f2,f3,f4,f5] arg ->
                                match arg with
                                | true1 -> k f3
                                | false0 ->
                                  let k = [f4,f5], fun [f2,f3] arg ->
                                    let t1 = CID0[f2,f3] in
                                    let t2 = CID1[t1,arg] in
                                    k t2 in
                                  f2 f3 k in
                              arg f2 k in
                            f2 t3 k in
                      let k = [t1], fun [f2] arg ->
                        let k = [], fun [] arg ->
                          let t1 = CID0[arg] in
                          k t1 in
                        f2 arg k in
                      match f4 with
                      | Bindings0(t2) -> k t2 in
                    k t1 in
                  let k = [f4,arg], fun [f2,f3] arg ->
                    let k = [f3], fun [f2] arg -> arg f2 k in
                    arg f2 k in
                  g7 t3 k in
              k t1 in
            let t11 = CID1[g109,t10] in
            let t12 = CID0[g108,t11] in
            let t13 = [f2,f3,f4], fun [f1,f2,f3] arg k ->
              let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f4], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g25 arg k in
                  f1 g118 k
                | Cons1(t1,t2) ->
                  match t2 with
                  | Nil0 ->
                    let t3 = CID1[t1,g122] in
                    let t4 = CID1[g119,t3] in
                    let k = [f1,f4], fun [f2,f3] arg ->
                      let k = [f3], fun [f2] arg ->
                        let k = [f2], fun [f2] arg -> k f2 in
                        g25 arg k in
                      f2 arg k in
                    f3 t4 k
                  | Cons1(t3,t4) ->
                    match t4 with
                    | Cons1(t5,t6) ->
                      let k = [f4], fun [f2] arg ->
                        let k = [f2], fun [f2] arg -> k f2 in
                        g25 arg k in
                      f1 g123 k
                    | Nil0 ->
                      let t5 = [f2,t1], fun [f1,f2] me arg k ->
                        match arg with
                        | Nil0 -> k g124
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
                      let k = [f1,f3,f4,t1,t3,t5], fun [f2,f3,f4,f5,f6,f7] arg ->
                        let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg ->
                          match arg with
                          | None0 ->
                            let t1 = CID1[f5,g128] in
                            let t2 = CID1[g125,t1] in
                            let k = [f2,f4], fun [f2,f3] arg ->
                              let k = [f3], fun [f2] arg ->
                                let k = [f2], fun [f2] arg -> k f2 in
                                g25 arg k in
                              f2 arg k in
                            f3 t2 k
                          | Some1(t1) ->
                            let k = [f6,t1], fun [f2,f3] arg ->
                              let t1 = CID0[f2,f3] in
                              let t2 = CID1[t1,arg] in
                              let t3 = CID0[t2] in
                              k t3 in
                            match f4 with
                            | Bindings0(t2) -> k t2 in
                        f7 arg k in
                      match f4 with
                      | Bindings0(t6) -> k t6 in
              k t1 in
            let t14 = CID1[g117,t13] in
            let t15 = CID0[g116,t14] in
            let t16 = [f2,f3,f4], fun [f1,f2,f3] arg k ->
              let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f4], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g25 arg k in
                  f1 g131 k
                | Cons1(t1,t2) ->
                  match t2 with
                  | Nil0 ->
                    let t3 = CID1[t1,g135] in
                    let t4 = CID1[g132,t3] in
                    let k = [f1,f4], fun [f2,f3] arg ->
                      let k = [f3], fun [f2] arg ->
                        let k = [f2], fun [f2] arg -> k f2 in
                        g25 arg k in
                      f2 arg k in
                    f3 t4 k
                  | Cons1(t3,t4) ->
                    match t4 with
                    | Cons1(t5,t6) ->
                      let k = [f4], fun [f2] arg ->
                        let k = [f2], fun [f2] arg -> k f2 in
                        g25 arg k in
                      f1 g136 k
                    | Nil0 ->
                      let t5 = [f2,t1], fun [f1,f2] me arg k ->
                        match arg with
                        | Nil0 -> k g137
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
                      let k = [f1,f2,f3,f4,t1,t3,t5], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                        let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                          match arg with
                          | None0 ->
                            let t1 = CID1[f6,g141] in
                            let t2 = CID1[g138,t1] in
                            let k = [f2,f5], fun [f2,f3] arg ->
                              let k = [f3], fun [f2] arg ->
                                let k = [f2], fun [f2] arg -> k f2 in
                                g25 arg k in
                              f2 arg k in
                            f4 t2 k
                          | Some1(t1) ->
                            let t2 = [f2,f3,f4,f6], fun [f1,f2,f3,f4] me arg k ->
                              match arg with
                              | Nil0 ->
                                let t1 = CID1[f4,g145] in
                                let t2 = CID1[g142,t1] in
                                let k = [f1], fun [f2] arg ->
                                  let k = [], fun [] arg ->
                                    let k = [], fun [] arg -> k g146 in
                                    g25 arg k in
                                  f2 arg k in
                                f3 t2 k
                              | Cons1(t1,t2) ->
                                match t1 with
                                | Pair0(t3,t4) ->
                                  let k = [f4,me,t2,t3,t4], fun [f2,f3,f4,f5,f6] arg ->
                                    let k = [f3,f4,f5,f6], fun [f2,f3,f4,f5] arg ->
                                      match arg with
                                      | true1 -> k f3
                                      | false0 ->
                                        let k = [f4,f5], fun [f2,f3] arg ->
                                          let t1 = CID0[f2,f3] in
                                          let t2 = CID1[t1,arg] in
                                          k t2 in
                                        f2 f3 k in
                                    arg f2 k in
                                  f2 t3 k in
                            let k = [f7,t1,t2], fun [f2,f3,f4] arg ->
                              let k = [f2,f3], fun [f2,f3] arg ->
                                let t1 = CID0[f2,f3] in
                                let t2 = CID1[t1,arg] in
                                let t3 = CID0[t2] in
                                k t3 in
                              f4 arg k in
                            match f5 with
                            | Bindings0(t3) -> k t3 in
                        f8 arg k in
                      match f4 with
                      | Bindings0(t6) -> k t6 in
              k t1 in
            let t17 = CID1[g130,t16] in
            let t18 = CID0[g129,t17] in
            let t19 = CID1[t18,g147] in
            let t20 = CID1[t15,t19] in
            let t21 = CID1[t12,t20] in
            let t22 = CID1[t9,t21] in
            let t23 = CID1[t6,t22] in
            let t24 = CID1[t3,t23] in
            let t25 = CID1[g59,t24] in
            let t26 = CID0[t25] in
            f5 t26 k in
          g25 arg k in
        f4 g55 k in
      g1 g23 k in
    g1 g15 k in
  g1 g13 k in
g1 g11 k
