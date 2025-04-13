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
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t1], fun [f2,f3] arg ->
        let k = [f3], fun [f2] arg ->
          let t1 = CID1[f2,arg] in
          k t1 in
        arg f2 k in
      g7 t2 k in
  k t1 in
let g8 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = CID1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g8 t3 k in
  k t1 in
let g9 = CID0 in
let g10 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g9
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
let g11 = CID0 in
let g12 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(arg) in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,arg,me], fun [f1,f2,f3] arg k ->
        match arg with
        | Nil0 -> k g11
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
let g13 = CID0 in
let g14 = fun arg k ->
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
  t1 g13 k in
let g15 = CID0 in
let g16 = CID1 in
let g17 = CID0 in
let g18 = CID1 in
let g19 = CID0 in
let g20 = CID1 in
let g21 = CID0 in
let g22 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_StringLength(f1) in
    let t2 = PRIM_StringLength(arg) in
    let t3 = PRIM_EqInt(t1,t2) in
    let k = [f1,arg,t1], fun [f2,f3,f4] arg ->
      match arg with
      | true1 -> k g17
      | false0 ->
        let t1 = [f2,f3], fun [f1,f2] me arg k ->
          let t1 = PRIM_LessInt(arg,0) in
          match t1 with
          | true1 -> k g18
          | false0 ->
            let t2 = PRIM_StringIndex(f1,arg) in
            let t3 = PRIM_StringIndex(f2,arg) in
            let t4 = PRIM_EqChar(t2,t3) in
            let k = [arg,me], fun [f2,f3] arg ->
              match arg with
              | true1 -> k g21
              | false0 ->
                let t1 = PRIM_SubInt(f2,1) in
                f3 t1 k in
            match t4 with
            | true1 -> k g19
            | false0 -> k g20 in
        let t2 = PRIM_SubInt(f4,1) in
        t1 t2 k in
    match t3 with
    | true1 -> k g15
    | false0 -> k g16 in
  k t1 in
let g23 = "" in
let g25 = CID0 in
let g24 = fun arg k ->
  match arg with
  | Nil0 -> k g25
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g24 t2 k in
let g26 = CID0 in
let g27 = "% " in
let g28 = CID0 in
let g29 = CID0 in
let g30 = CID0 in
let g31 = CID1 in
let g32 = CID0 in
let g33 = CID0 in
let g34 = CID0 in
let g35 = CID0 in
let g36 = CID0 in
let g37 = CID0 in
let g38 = "sham: " in
let g39 = ": " in
let g40 = "command not found" in
let g41 = "\n" in
let g42 = CID0 in
let g43 = CID1[g41,g42] in
let g44 = CID1[g40,g43] in
let g45 = CID1[g39,g44] in
let g46 = "sham: " in
let g47 = ": " in
let g48 = "Permission denied" in
let g49 = "\n" in
let g50 = CID0 in
let g51 = CID1[g49,g50] in
let g52 = CID1[g48,g51] in
let g53 = CID1[g47,g52] in
let g54 = "Sham: In-memory file-system. Consider typing \"ls\".\n" in
let g55 = "readme" in
let g56 = "Welcome to sham; please try all the commands!\nCan you find the hidden Easter Egg?\n" in
let g57 = CID0[g56] in
let g58 = CID0[g55,g57] in
let g59 = "ls" in
let g60 = "List all files on the file system.\n" in
let g61 = "ls: takes no arguments\n" in
let g62 = fun arg k ->
  match arg with
  | Pair0(t1,t2) -> k t1 in
let g63 = CID0 in
let g64 = CID0 in
let g65 = "cat" in
let g66 = "Show the content of data files.\n" in
let g67 = "cat: takes at least one argument\n" in
let g68 = CID0 in
let g69 = "cat: " in
let g70 = " : No such file\n" in
let g71 = CID0 in
let g72 = CID1[g70,g71] in
let g73 = "cat: " in
let g74 = " : Not a data file\n" in
let g75 = CID0 in
let g76 = CID1[g74,g75] in
let g77 = CID0 in
let g78 = "cat: " in
let g79 = " : No such file\n" in
let g80 = CID0 in
let g81 = CID1[g79,g80] in
let g82 = "cat: " in
let g83 = " : Not a data file\n" in
let g84 = CID0 in
let g85 = CID1[g83,g84] in
let g86 = "man" in
let g87 = "Show the manual page for a command.\n" in
let g88 = "man: takes at least one argument\n" in
let g89 = CID0 in
let g90 = "No manual entry for " in
let g91 = "\n" in
let g92 = CID0 in
let g93 = CID1[g91,g92] in
let g94 = "No manual entry for " in
let g95 = "\n" in
let g96 = CID0 in
let g97 = CID1[g95,g96] in
let g98 = CID0 in
let g99 = "No manual entry for " in
let g100 = "\n" in
let g101 = CID0 in
let g102 = CID1[g100,g101] in
let g103 = "No manual entry for " in
let g104 = "\n" in
let g105 = CID0 in
let g106 = CID1[g104,g105] in
let g107 = CID0 in
let k = [], fun [] arg ->
  let k = [arg], fun [f2] arg ->
    let k = [f2,arg], fun [f2,f3] arg ->
      let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
        let t1 = [f2,f4], fun [f1,f2] me arg k ->
          match arg with
          | Nil0 -> k g23
          | Cons1(t1,t2) ->
            let k = [f1,f2,t1], fun [f2,f3,f4] arg ->
              let k = [f2,f3,arg], fun [f2,f3,f4] arg ->
                let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                  let k = [f2,arg], fun [f2,f3] arg ->
                    let k = [f2], fun [f2] arg -> f2 arg k in
                    f3 arg k in
                  f3 f4 k in
                g7 arg k in
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
                  let t1 = CID1[f2,g26] in
                  let k = [f3], fun [f2] arg -> arg f2 k in
                  arg t1 k in
                f3 f1 k in
          k t2 in
        let t3 = [f2,f3,f4,arg,t1,t2], fun [f1,f2,f3,f4,f5,f6] me arg k ->
          let k = [f1,f2,f3,f4,f5,f6,arg,me], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
            let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg ->
              let t1 = CID1['\EOT',g28] in
              let k = [f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                let t1 = [f2], fun [f1] me arg k ->
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
                      let t5 = PRIM_PutChar('\EOT') in
                      let t6 = PRIM_PutChar('\n') in
                      let t7 = CID1['\EOT',arg] in
                      f1 t7 k
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
                          let t7 = PRIM_PutChar(t1) in
                          let t8 = CID1[t1,arg] in
                          me t8 k in
                let k = [f3,f4,f5,f6,f7,f8,arg], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
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
                                    let t3 = [f3,t1], fun [f1,f2] me arg k ->
                                      match arg with
                                      | Nil0 -> k g37
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
                                          let t1 = CID1[f5,g45] in
                                          let t2 = CID1[g38,t1] in
                                          let k = [f2,f4], fun [f2,f3] arg ->
                                            let k = [f3], fun [f2] arg ->
                                              let k = [f2], fun [f2] arg -> k f2 in
                                              g24 arg k in
                                            f2 arg k in
                                          f3 t2 k
                                        | Some1(t1) ->
                                          match t1 with
                                          | Data0(t2) ->
                                            let t3 = CID1[f5,g53] in
                                            let t4 = CID1[g46,t3] in
                                            let k = [f2,f4], fun [f2,f3] arg ->
                                              let k = [f3], fun [f2] arg ->
                                                let k = [f2], fun [f2] arg -> k f2 in
                                                g24 arg k in
                                              f2 arg k in
                                            f3 t4 k
                                          | Executable1(t2,t3) ->
                                            let k = [f6], fun [f2] arg -> arg f2 k in
                                            t3 f4 k in
                                      f7 arg k in
                                    match f5 with
                                    | Bindings0(t4) -> k t4 in
                                arg f7 k in
                              g8 g36 k in
                            f5 arg k in
                          f2 f7 k in
                        f5 g35 k in
                    arg f8 k in
                  f3 arg k in
                t1 g33 k in
              f2 t1 k in
            g24 arg k in
          f3 g27 k in
        let k = [f4,arg,t1,t3], fun [f2,f3,f4,f5] arg ->
          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg ->
            let t1 = [f2], fun [f1] arg k ->
              let t1 = [f1,arg], fun [f1,f2] arg k ->
                match arg with
                | Cons1(t1,t2) ->
                  let k = [f2], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g24 arg k in
                  f1 g61 k
                | Nil0 ->
                  let k = [f1,f2], fun [f2,f3] arg ->
                    let k = [f2,arg,f3], fun [f2,f3,f4] arg ->
                      let k = [f2,f4], fun [f2,f3] arg ->
                        let t1 = [f2], fun [f1] me arg k ->
                          match arg with
                          | Nil0 -> k g63
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
                        | Nil0 -> k g64
                        | Cons1(t2,t3) ->
                          let k = [t1,t3], fun [f2,f3] arg ->
                            let k = [f2,f3], fun [f2,f3] arg -> f2 f3 k in
                            g24 arg k in
                          f2 t2 k in
                      f3 arg k in
                    match f3 with
                    | Bindings0(t1) -> k t1 in
                  g3 g62 k in
              k t1 in
            let t2 = CID1[g60,t1] in
            let t3 = CID0[g59,t2] in
            let t4 = [f2,f3,f4], fun [f1,f2,f3] arg k ->
              let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f4], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g24 arg k in
                  f1 g67 k
                | Cons1(t1,t2) ->
                  let t3 = [f2,t1], fun [f1,f2] me arg k ->
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
                  let k = [f1,f2,f3,f4,t1,t2,t3], fun [f2,f3,f4,f5,f6,f7,f8] arg ->
                    let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg ->
                      let k = [f2,f3,f4,f5,f7], fun [f2,f3,f4,f5,f6] arg ->
                        let t1 = [f2,f3,f4,f5], fun [f1,f2,f3,f4] arg k ->
                          let t1 = [f2,arg], fun [f1,f2] me arg k ->
                            match arg with
                            | Nil0 -> k g77
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
                                let t1 = CID1[f4,g81] in
                                let t2 = CID1[g78,t1] in
                                let k = [f2], fun [f2] arg ->
                                  let k = [], fun [] arg -> g24 arg k in
                                  f2 arg k in
                                f3 t2 k
                              | Some1(t1) ->
                                match t1 with
                                | Data0(t2) ->
                                  let k = [], fun [] arg -> g24 arg k in
                                  f2 t2 k
                                | Executable1(t2,t3) ->
                                  let t4 = CID1[f4,g85] in
                                  let t5 = CID1[g82,t4] in
                                  let k = [f2], fun [f2] arg ->
                                    let k = [], fun [] arg -> g24 arg k in
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
                        let t1 = CID1[f6,g72] in
                        let t2 = CID1[g69,t1] in
                        let k = [f2], fun [f2] arg ->
                          let k = [], fun [] arg -> g24 arg k in
                          f2 arg k in
                        f4 t2 k
                      | Some1(t1) ->
                        match t1 with
                        | Data0(t2) ->
                          let k = [], fun [] arg -> g24 arg k in
                          f2 t2 k
                        | Executable1(t2,t3) ->
                          let t4 = CID1[f6,g76] in
                          let t5 = CID1[g73,t4] in
                          let k = [f2], fun [f2] arg ->
                            let k = [], fun [] arg -> g24 arg k in
                            f2 arg k in
                          f4 t5 k in
                    f8 arg k in
                  match f4 with
                  | Bindings0(t4) -> k t4 in
              k t1 in
            let t5 = CID1[g66,t4] in
            let t6 = CID0[g65,t5] in
            let t7 = [f2,f3,f4], fun [f1,f2,f3] arg k ->
              let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg k ->
                match arg with
                | Nil0 ->
                  let k = [f4], fun [f2] arg ->
                    let k = [f2], fun [f2] arg -> k f2 in
                    g24 arg k in
                  f1 g88 k
                | Cons1(t1,t2) ->
                  let t3 = [f2,t1], fun [f1,f2] me arg k ->
                    match arg with
                    | Nil0 -> k g89
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
                            | Nil0 -> k g98
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
                                let t1 = CID1[f4,g102] in
                                let t2 = CID1[g99,t1] in
                                let k = [f2], fun [f2] arg ->
                                  let k = [], fun [] arg -> g24 arg k in
                                  f2 arg k in
                                f3 t2 k
                              | Some1(t1) ->
                                match t1 with
                                | Data0(t2) ->
                                  let t3 = CID1[f4,g106] in
                                  let t4 = CID1[g103,t3] in
                                  let k = [f2], fun [f2] arg ->
                                    let k = [], fun [] arg -> g24 arg k in
                                    f2 arg k in
                                  f3 t4 k
                                | Executable1(t2,t3) ->
                                  let k = [], fun [] arg -> g24 arg k in
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
                        let t1 = CID1[f6,g93] in
                        let t2 = CID1[g90,t1] in
                        let k = [f2], fun [f2] arg ->
                          let k = [], fun [] arg -> g24 arg k in
                          f2 arg k in
                        f4 t2 k
                      | Some1(t1) ->
                        match t1 with
                        | Data0(t2) ->
                          let t3 = CID1[f6,g97] in
                          let t4 = CID1[g94,t3] in
                          let k = [f2], fun [f2] arg ->
                            let k = [], fun [] arg -> g24 arg k in
                            f2 arg k in
                          f4 t4 k
                        | Executable1(t2,t3) ->
                          let k = [], fun [] arg -> g24 arg k in
                          f2 t2 k in
                    f8 arg k in
                  match f4 with
                  | Bindings0(t4) -> k t4 in
              k t1 in
            let t8 = CID1[g87,t7] in
            let t9 = CID0[g86,t8] in
            let t10 = CID1[t9,g107] in
            let t11 = CID1[t6,t10] in
            let t12 = CID1[t3,t11] in
            let t13 = CID1[g58,t12] in
            let t14 = CID0[t13] in
            f5 t14 k in
          g24 arg k in
        f4 g54 k in
      g1 g22 k in
    g1 g14 k in
  g1 g12 k in
g1 g10 k
