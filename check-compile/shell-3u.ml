(*stage3; un-normalized*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_AddInt(f1,arg) in
    k t1 in
  k t1 in
let g2 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_SubInt(f1,arg) in
    k t1 in
  k t1 in
let g3 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_MulInt(f1,arg) in
    k t1 in
  k t1 in
let g4 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_DivInt(f1,arg) in
    k t1 in
  k t1 in
let g5 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_ModInt(f1,arg) in
    k t1 in
  k t1 in
let g6 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(f1,arg) in
    k t1 in
  k t1 in
let g7 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(f1,arg) in
    k t1 in
  k t1 in
let g8 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqChar(f1,arg) in
    k t1 in
  k t1 in
let g9 = fun arg k ->
  let t1 = PRIM_CharOrd(arg) in
  k t1 in
let g10 = fun arg k ->
  let t1 = PRIM_CharChr(arg) in
  k t1 in
let g11 = fun arg k ->
  let t1 = PRIM_Explode(arg) in
  k t1 in
let g12 = fun arg k ->
  let t1 = PRIM_PutChar(arg) in
  k t1 in
let g13 = fun arg k ->
  let t1 = PRIM_GetChar(arg) in
  k t1 in
let g14 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = Cons1[f1,arg] in
    k t1 in
  k t1 in
let g15 = fun arg k ->
  let g15 = g15 in
  k arg in
let g16 = false0 in
let g17 = true1 in
let g18 = fun arg k ->
  match arg with
  | true1 -> k g16
  | false0 -> k g17 in
let g19 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let k = [f1], fun [f1] arg -> arg f1 k in
    g6 arg k in
  k t1 in
let g20 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let k = [f1], fun [f1] arg ->
      let k = [], fun [] arg -> g18 arg k in
      arg f1 k in
    g6 arg k in
  k t1 in
let g21 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let k = [arg], fun [f1] arg ->
      let k = [], fun [] arg -> g18 arg k in
      arg f1 k in
    g6 f1 k in
  k t1 in
let g22 = 8 in
let g23 = '\n' in
let g24 = 26 in
let g25 = '^' in
let g26 = 'A' in
let g27 = 1 in
let g28 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1,arg], fun [f1,f2] arg ->
      let k = [f1,f2], fun [f1,f2] arg ->
        match arg with
        | true1 -> g12 f1 k
        | false0 ->
          let k = [f1,f2], fun [f1,f2] arg ->
            let k = [f1,f2], fun [f1,f2] arg ->
              match arg with
              | true1 -> g12 f1 k
              | false0 ->
                let k = [f1,f2], fun [f1,f2] arg ->
                  let k = [f1,f2], fun [f1,f2] arg ->
                    match arg with
                    | true1 -> g12 f1 k
                    | false0 ->
                      let k = [f2], fun [f1] arg ->
                        let k = [f1], fun [f1] arg ->
                          let k = [f1], fun [f1] arg ->
                            let k = [], fun [] arg ->
                              let k = [], fun [] arg ->
                                let k = [], fun [] arg ->
                                  let k = [], fun [] arg -> g12 arg k in
                                  g10 arg k in
                                arg g27 k in
                              g2 arg k in
                            arg f1 k in
                          g1 arg k in
                        g9 g26 k in
                      g12 g25 k in
                  arg g24 k in
                g19 f2 k in
            arg g23 k in
          g8 f1 k in
      arg g22 k in
    g7 arg k in
  g9 arg k in
let g29 = 8 in
let g30 = ' ' in
let g31 = '0' in
let g32 = 0 in
let g33 = 9 in
let g34 = None1 in
let g35 = None1 in
let g36 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [arg], fun [f1] arg ->
        let k = [], fun [] arg ->
          let k = [arg], fun [f1] arg ->
            let k = [f1], fun [f1] arg ->
              match arg with
              | true1 ->
                let k = [f1], fun [f1] arg ->
                  let k = [f1], fun [f1] arg ->
                    match arg with
                    | true1 ->
                      let t1 = Some0[f1] in
                      k t1
                    | false0 -> k g34 in
                  arg g33 k in
                g20 f1 k
              | false0 -> k g35 in
            arg g32 k in
          g21 arg k in
        f1 arg k in
      g9 g31 k in
    g2 arg k in
  g9 arg k in
let g38 = None1 in
let g39 = 10 in
let g37 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = Some0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f1,f2] arg ->
        match arg with
        | None1 -> k g38
        | Some0(t1) ->
          let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
            let k = [f2,f3], fun [f1,f2] arg ->
              let k = [f1,f2], fun [f1,f2] arg ->
                let k = [f1], fun [f1] arg ->
                  let k = [f1], fun [f1] arg -> arg f1 k in
                  g37 arg k in
                arg f2 k in
              g1 arg k in
            arg f1 k in
          g3 g39 k in
      g36 t1 k in
  k t1 in
let g40 = 0 in
let g41 = fun arg k ->
  let k = [arg], fun [f1] arg -> arg f1 k in
  g37 g40 k in
let g42 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let k = [arg], fun [f1] arg -> arg f1 k in
    g14 f1 k in
  k t1 in
let g44 = true1 in
let g45 = false0 in
let g46 = false0 in
let g47 = false0 in
let g43 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match f2 with
      | Nil0 ->
        match arg with
        | Nil0 -> k g44
        | Cons1(t1,t2) -> k g45
      | Cons1(t1,t2) ->
        match arg with
        | Nil0 -> k g46
        | Cons1(t3,t4) ->
          let k = [f1,t2,t3,t4], fun [f1,f2,f3,f4] arg ->
            let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
              match arg with
              | true1 ->
                let k = [f2,f3], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  arg f1 k in
                g43 f1 k
              | false0 -> k g47 in
            arg f3 k in
          f1 t1 k in
    k t1 in
  k t1 in
let g48 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let k = [f1,arg], fun [f1,f2] arg ->
      let k = [f2], fun [f1] arg -> arg f1 k in
      arg f1 k in
    g43 g8 k in
  k t1 in
let g49 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t2], fun [f1,f2] arg ->
        let k = [f1,arg], fun [f1,f2] arg ->
          let k = [f2], fun [f1] arg -> f1 arg k in
          arg f1 k in
        g49 f2 k in
      g42 t1 k in
  k t1 in
let g50 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f1,f2] arg ->
        let k = [f2], fun [f1] arg ->
          let k = [f1], fun [f1] arg -> arg f1 k in
          g50 arg k in
        arg f1 k in
      g42 t1 k in
  k t1 in
let g51 = Nil0 in
let g52 = fun arg k ->
  let k = [arg], fun [f1] arg -> arg f1 k in
  g50 g51 k in
let g54 = Nil0 in
let g53 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g54
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f1,f2] arg ->
        let k = [f1,f2], fun [f1,f2] arg ->
          let k = [f2,arg], fun [f1,f2] arg ->
            let k = [f2], fun [f1] arg -> f1 arg k in
            arg f1 k in
          g53 f1 k in
        g14 arg k in
      f1 t1 k in
  k t1 in
let g56 = 0 in
let g57 = 1 in
let g55 = fun arg k ->
  match arg with
  | Nil0 -> k g56
  | Cons1(t1,t2) ->
    let k = [t2], fun [f1] arg ->
      let k = [arg], fun [f1] arg -> f1 arg k in
      g55 f1 k in
    g1 g57 k in
let g58 = '0' in
let g59 = 0 in
let g60 = 10 in
let g61 = 10 in
let g62 = 0 in
let g63 = '0' in
let g64 = Nil0 in
let g65 = Nil0 in
let g66 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let t1 = [arg], fun [f1] arg k ->
      let k = [arg], fun [f1] arg ->
        let k = [], fun [] arg -> g10 arg k in
        arg f1 k in
      g1 f1 k in
    let t2 = [t1], fun [f1] me arg k ->
      let t1 = [f1,me,arg], fun [f1,f2,f3] arg k ->
        let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
          let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
            match arg with
            | true1 -> k f3
            | false0 ->
              let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                  let k = [f2,f3,f4], fun [f1,f2,f3] arg ->
                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                      let k = [f1,f3], fun [f1,f2] arg ->
                        let k = [f2], fun [f1] arg ->
                          let k = [arg], fun [f1] arg ->
                            let k = [f1], fun [f1] arg -> f1 arg k in
                            arg g61 k in
                          g4 f1 k in
                        f1 arg k in
                      arg f2 k in
                    g42 arg k in
                  f1 arg k in
                arg g60 k in
              g5 f4 k in
          arg g59 k in
        g7 arg k in
      k t1 in
    let k = [f1,t2], fun [f1,f2] arg ->
      let k = [f1,f2], fun [f1,f2] arg ->
        match arg with
        | true1 ->
          let k = [], fun [] arg -> arg g64 k in
          g42 g63 k
        | false0 ->
          let k = [f1], fun [f1] arg -> arg f1 k in
          f2 g65 k in
      arg g62 k in
    g7 f1 k in
  g9 g58 k in
let g67 = Unit0 in
let g68 = '\n' in
let g69 = 4 in
let g70 = Unit0 in
let g71 = '\n' in
let g72 = Unit0 in
let g73 = Unit0 in
let g74 = 127 in
let g75 = 127 in
let g76 = 26 in
let g77 = Unit0 in
let g78 = Unit0 in
let g79 = Unit0 in
let g80 = Nil0 in
let g82 = 2 in
let g83 = 1 in
let g84 = 2 in
let g81 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      match arg with
      | true1 -> k f1
      | false0 ->
        let k = [f1], fun [f1] arg ->
          let k = [f1], fun [f1] arg ->
            let k = [f1], fun [f1] arg ->
              let k = [f1], fun [f1] arg ->
                let k = [arg], fun [f1] arg ->
                  let k = [f1], fun [f1] arg ->
                    let k = [f1], fun [f1] arg -> f1 arg k in
                    g81 arg k in
                  arg g84 k in
                g2 f1 k in
              g1 arg k in
            g81 arg k in
          arg g83 k in
        g2 f1 k in
    arg g82 k in
  g6 arg k in
let g86 = 2 in
let g87 = 1 in
let g88 = 1 in
let g85 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      match arg with
      | true1 ->
        let k = [f1], fun [f1] arg ->
          let k = [f1], fun [f1] arg ->
            let k = [f1], fun [f1] arg ->
              let k = [f1], fun [f1] arg -> arg f1 k in
              g3 arg k in
            g85 arg k in
          arg g87 k in
        g2 f1 k
      | false0 -> k g88 in
    arg g86 k in
  g21 arg k in
let g89 = "ERROR: " in
let g90 = Unit0 in
let g91 = "fib: " in
let g92 = "expected an argument" in
let g93 = "expected exactly one argument" in
let g94 = "expected arg1 to be numeric" in
let g95 = " --> " in
let g96 = Unit0 in
let g97 = "fact: " in
let g98 = "expected an argument" in
let g99 = "expected exactly one argument" in
let g100 = "expected arg1 to be numeric" in
let g101 = " --> " in
let g102 = Unit0 in
let g103 = 4 in
let g104 = Nil0 in
let g105 = Unit0 in
let g106 = Unit0 in
let g107 = Unit0 in
let g108 = Unit0 in
let g109 = Unit0 in
let g110 = "rev: expected no arguments" in
let g111 = "(reverse typed lines until ^D)\n" in
let g112 = Unit0 in
let g113 = 'o' in
let g114 = '*' in
let g115 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      match arg with
      | true1 -> k g114
      | false0 -> k f1 in
    arg g113 k in
  g8 arg k in
let g116 = "You wrote: \"" in
let g117 = "\" (" in
let g118 = " chars)" in
let g119 = Unit0 in
let g121 = ' ' in
let g122 = Nil0 in
let g120 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match arg with
      | Nil0 ->
        let k = [f1], fun [f1] arg ->
          let k = [f1], fun [f1] arg ->
            let k = [], fun [] arg -> g52 arg k in
            arg f1 k in
          g14 arg k in
        g52 f2 k
      | Cons1(t1,t2) ->
        let k = [f1,f2,t1,t2], fun [f1,f2,f3,f4] arg ->
          let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
            match arg with
            | true1 ->
              let k = [f1,f4], fun [f1,f2] arg ->
                let k = [f1,f2], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg ->
                    let k = [f1], fun [f1] arg ->
                      let k = [f1], fun [f1] arg -> arg f1 k in
                      arg g122 k in
                    g120 arg k in
                  arg f1 k in
                g14 arg k in
              g52 f2 k
            | false0 ->
              let k = [f2,f3,f4], fun [f1,f2,f3] arg ->
                let k = [f1,f3,arg], fun [f1,f2,f3] arg ->
                  let k = [f2,f3], fun [f1,f2] arg ->
                    let k = [f1], fun [f1] arg -> arg f1 k in
                    f2 arg k in
                  arg f1 k in
                g14 f2 k in
              g120 f1 k in
          arg g121 k in
        g8 t1 k in
    k t1 in
  k t1 in
let g123 = Nil0 in
let g124 = Nil0 in
let g125 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg -> arg f1 k in
    arg g124 k in
  g120 g123 k in
let g126 = Unit0 in
let g127 = "fib" in
let g128 = "fact" in
let g129 = "rev" in
let g130 = '>' in
let g131 = ' ' in
let g132 = Nil0 in
let g133 = Cons1[g131,g132] in
let g134 = Cons1[g130,g133] in
let g135 = Unit0 in
let g136 = Unit0 in
let g137 = Unit0 in
let g138 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g139 = Unit0 in
let g140 = Unit0 in
let g15 = g15 in
let k = [], fun [] arg ->
  let t1 = [arg], fun [f1] arg k ->
    let k = [f1], fun [f1] arg ->
      let k = [f1,arg], fun [f1,f2] arg ->
        let k = [f1,f2], fun [f1,f2] arg -> f1 f2 k in
        f1 g30 k in
      f1 arg k in
    g10 g29 k in
  let t2 = [arg], fun [f1] me arg k ->
    match arg with
    | Nil0 -> k g67
    | Cons1(t1,t2) ->
      let k = [me,t2], fun [f1,f2] arg -> f1 f2 k in
      f1 t1 k in
  let t3 = [t2], fun [f1] arg k ->
    let k = [f1], fun [f1] arg -> f1 arg k in
    g11 arg k in
  let t4 = [t2], fun [f1] arg k ->
    let k = [f1], fun [f1] arg -> f1 arg k in
    g66 arg k in
  let t5 = [arg], fun [f1] arg k -> f1 g68 k in
  let t6 = [arg,t1,t5], fun [f1,f2,f3] arg k ->
    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
      let t1 = [f1,f2,f3,arg], fun [f1,f2,f3,f4] me arg k ->
        let k = [f1,f2,f3,f4,me,arg], fun [f1,f2,f3,f4,f5,f6] arg ->
          let k = [f1,f2,f3,f4,f5,f6,arg], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
            let k = [f1,f2,f3,f4,f5,f6,f7,arg], fun [f1,f2,f3,f4,f5,f6,f7,f8] arg ->
              let k = [f1,f2,f3,f4,f5,f6,f7,f8], fun [f1,f2,f3,f4,f5,f6,f7,f8] arg ->
                match arg with
                | true1 ->
                  let k = [f6], fun [f1] arg -> g52 f1 k in
                  f3 g72 k
                | false0 ->
                  let k = [f1,f2,f3,f4,f5,f6,f7,f8], fun [f1,f2,f3,f4,f5,f6,f7,f8] arg ->
                    let k = [f1,f2,f3,f4,f5,f6,f7,f8], fun [f1,f2,f3,f4,f5,f6,f7,f8] arg ->
                      match arg with
                      | true1 ->
                        let k = [f3,f4,f6], fun [f1,f2,f3] arg ->
                          let k = [f2,f3], fun [f1,f2] arg ->
                            let k = [f2], fun [f1] arg ->
                              let k = [], fun [] arg -> g52 arg k in
                              arg f1 k in
                            g14 f1 k in
                          f1 g73 k in
                        f1 f7 k
                      | false0 ->
                        let k = [f1,f2,f5,f6,f7,f8], fun [f1,f2,f3,f4,f5,f6] arg ->
                          let k = [f1,f2,f3,f4,f5,f6], fun [f1,f2,f3,f4,f5,f6] arg ->
                            match arg with
                            | true1 -> f3 f4 k
                            | false0 ->
                              let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                                  match arg with
                                  | true1 ->
                                    match f4 with
                                    | Nil0 -> f3 f4 k
                                    | Cons1(t1,t2) ->
                                      let k = [f2,f3,t2], fun [f1,f2,f3] arg ->
                                        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                              let k = [f2,f3], fun [f1,f2] arg -> f1 f2 k in
                                              f1 g79 k in
                                            match arg with
                                            | true1 -> f1 g77 k
                                            | false0 -> k g78 in
                                          arg g76 k in
                                        g20 arg k in
                                      g9 t1 k
                                  | false0 ->
                                    let k = [f3,f4,f5], fun [f1,f2,f3] arg ->
                                      let k = [f1,f2], fun [f1,f2] arg ->
                                        let k = [f1], fun [f1] arg -> f1 arg k in
                                        arg f2 k in
                                      g42 f3 k in
                                    f1 f5 k in
                                arg g75 k in
                              g7 f6 k in
                          arg g74 k in
                        g19 f8 k in
                    arg f4 k in
                  g8 f7 k in
              arg g71 k in
            g8 f7 k in
          g9 arg k in
        g13 g70 k in
      t1 g80 k in
    g10 g69 k in
  let t7 = [t3,t5], fun [f1,f2] arg k ->
    let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
      let k = [f2], fun [f1] arg -> f1 g90 k in
      f1 f3 k in
    f1 g89 k in
  let t8 = [t3,t4,t5,t7], fun [f1,f2,f3,f4] arg k ->
    let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
      match f5 with
      | Nil0 -> f4 g92 k
      | Cons1(t1,t2) ->
        match t2 with
        | Cons1(t3,t4) -> f4 g93 k
        | Nil0 ->
          let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
            match arg with
            | None1 -> f4 g94 k
            | Some0(t1) ->
              let k = [f1,f2,f3,t1], fun [f1,f2,f3,f4] arg ->
                let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
                  let k = [f2,f3,f4], fun [f1,f2,f3] arg ->
                    let k = [f2], fun [f1] arg -> f1 g96 k in
                    f1 f3 k in
                  f1 g95 k in
                f2 f4 k in
              g81 t1 k in
          g41 t1 k in
    f1 g91 k in
  let t9 = [t3,t4,t5,t7], fun [f1,f2,f3,f4] arg k ->
    let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
      match f5 with
      | Nil0 -> f4 g98 k
      | Cons1(t1,t2) ->
        match t2 with
        | Cons1(t3,t4) -> f4 g99 k
        | Nil0 ->
          let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
            match arg with
            | None1 -> f4 g100 k
            | Some0(t1) ->
              let k = [f1,f2,f3,t1], fun [f1,f2,f3,f4] arg ->
                let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
                  let k = [f2,f3,f4], fun [f1,f2,f3] arg ->
                    let k = [f2], fun [f1] arg -> f1 g102 k in
                    f1 f3 k in
                  f1 g101 k in
                f2 f4 k in
              g85 t1 k in
          g41 t1 k in
    f1 g97 k in
  let k = [t2,t3,t4,t5,t6,t7,t8,t9], fun [f1,f2,f3,f4,f5,f6,f7,f8] arg ->
    let k = [f1,f2,f3,f4,f5,f6,f7,f8], fun [f1,f2,f3,f4,f5,f6,f7,f8] arg ->
      let k = [f1,f2,f3,f4,f5,f6,f7,f8], fun [f1,f2,f3,f4,f5,f6,f7,f8] arg ->
        let t1 = [f1,f4,f5,arg], fun [f1,f2,f3,f4] arg k ->
          let t1 = [f1,f2,f3,f4], fun [f1,f2,f3,f4] me arg k ->
            let k = [f1,f2,f4,me], fun [f1,f2,f3,f4] arg ->
              let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
                let k = [f1,f2,f4,f5], fun [f1,f2,f3,f4] arg ->
                  match arg with
                  | true1 -> k g106
                  | false0 ->
                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                      let k = [f2,f3], fun [f1,f2] arg ->
                        let k = [f2], fun [f1] arg -> f1 g108 k in
                        f1 g107 k in
                      f1 arg k in
                    g52 f4 k in
                arg f3 k in
              g48 arg k in
            f3 g105 k in
          t1 g109 k in
        let t2 = [f2,f6,t1], fun [f1,f2,f3] arg k ->
          match arg with
          | Cons1(t1,t2) -> f2 g110 k
          | Nil0 ->
            let k = [f3], fun [f1] arg -> f1 g112 k in
            f1 g111 k in
        let t3 = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg k ->
          let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
            let k = [f1,f2,f3,f4,f5,arg], fun [f1,f2,f3,f4,f5,f6] arg ->
              let k = [f1,f2,f3,f4,f5,f6,arg], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
                let k = [f1,f2,f3,f4,f5,f6,f7], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
                  let k = [f1,f2,f3,f4,f7,arg], fun [f1,f2,f3,f4,f5,f6] arg ->
                    let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                      let k = [f2,f3,f4,f5], fun [f1,f2,f3,f4] arg ->
                        let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                          let k = [f1,f3], fun [f1,f2] arg ->
                            let k = [f2], fun [f1] arg -> f1 g119 k in
                            f1 g118 k in
                          f2 f4 k in
                        f1 g117 k in
                      f1 arg k in
                    f6 arg k in
                  f6 f5 k in
                g49 arg k in
              g11 g116 k in
            g55 f5 k in
          g53 g115 k in
        let t4 = [f7,f8,t2,t3], fun [f1,f2,f3,f4] arg k ->
          let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
            match arg with
            | Nil0 -> k g126
            | Cons1(t1,t2) ->
              let k = [f1,f2,f3,f4,f5,t1,t2], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
                let k = [f1,f2,f3,f4,f5,f6,f7,arg], fun [f1,f2,f3,f4,f5,f6,f7,f8] arg ->
                  let k = [f1,f2,f3,f4,f5,f6,f7], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
                    match arg with
                    | true1 -> f1 f7 k
                    | false0 ->
                      let k = [f2,f3,f4,f5,f6,f7], fun [f1,f2,f3,f4,f5,f6] arg ->
                        let k = [f1,f2,f3,f4,f5,f6,arg], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
                          let k = [f1,f2,f3,f4,f5,f6], fun [f1,f2,f3,f4,f5,f6] arg ->
                            match arg with
                            | true1 -> f1 f6 k
                            | false0 ->
                              let k = [f2,f3,f4,f6], fun [f1,f2,f3,f4] arg ->
                                let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
                                  let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                    match arg with
                                    | true1 -> f1 f4 k
                                    | false0 -> f2 f3 k in
                                  f5 arg k in
                                g11 g129 k in
                              g48 f5 k in
                          f7 arg k in
                        g11 g128 k in
                      g48 f6 k in
                  f8 arg k in
                g11 g127 k in
              g48 t1 k in
          g125 arg k in
        let t5 = [f1,f5,arg,t4], fun [f1,f2,f3,f4] me arg k ->
          let k = [f2,f3,f4,me], fun [f1,f2,f3,f4] arg ->
            let k = [f2,f3,f4], fun [f1,f2,f3] arg ->
              let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
                let k = [f2,f3,f4], fun [f1,f2,f3] arg ->
                  match arg with
                  | true1 -> k g136
                  | false0 ->
                    let k = [f2], fun [f1] arg -> f1 g137 k in
                    f1 f3 k in
                arg f1 k in
              g48 arg k in
            f1 g135 k in
          f1 g134 k in
        let t6 = [f2,t5], fun [f1,f2] arg k ->
          let k = [f2], fun [f1] arg -> f1 g139 k in
          f1 g138 k in
        t6 g140 k in
      arg g104 k in
    g14 arg k in
  g10 g103 k in
g15 g28 k
