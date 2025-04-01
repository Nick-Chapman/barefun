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
  let t1 = [arg], fun [f1] arg k ->
    let g15 = g15 in
    f1 arg k in
  k t1 in
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
let g31 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [arg], fun [f1] arg ->
      let k = [f1], fun [f1] arg -> g28 f1 k in
      g28 g30 k in
    g28 arg k in
  g10 g29 k in
let g32 = '0' in
let g33 = 0 in
let g34 = 9 in
let g35 = None1 in
let g36 = None1 in
let g37 = fun arg k ->
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
                    | false0 -> k g35 in
                  arg g34 k in
                g20 f1 k
              | false0 -> k g36 in
            arg g33 k in
          g21 arg k in
        f1 arg k in
      g9 g32 k in
    g2 arg k in
  g9 arg k in
let g39 = None1 in
let g40 = 10 in
let g38 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 ->
      let t1 = Some0[f1] in
      k t1
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f1,f2] arg ->
        match arg with
        | None1 -> k g39
        | Some0(t1) ->
          let k = [f1,f2,t1], fun [f1,f2,f3] arg ->
            let k = [f2,f3], fun [f1,f2] arg ->
              let k = [f1,f2], fun [f1,f2] arg ->
                let k = [f1], fun [f1] arg ->
                  let k = [f1], fun [f1] arg -> arg f1 k in
                  g38 arg k in
                arg f2 k in
              g1 arg k in
            arg f1 k in
          g3 g40 k in
      g37 t1 k in
  k t1 in
let g41 = 0 in
let g42 = fun arg k ->
  let k = [arg], fun [f1] arg -> arg f1 k in
  g38 g41 k in
let g43 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let k = [arg], fun [f1] arg -> arg f1 k in
    g14 f1 k in
  k t1 in
let g45 = true1 in
let g46 = false0 in
let g47 = false0 in
let g48 = false0 in
let g44 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match f2 with
      | Nil0 ->
        match arg with
        | Nil0 -> k g45
        | Cons1(t1,t2) -> k g46
      | Cons1(t1,t2) ->
        match arg with
        | Nil0 -> k g47
        | Cons1(t3,t4) ->
          let k = [f1,t2,t3,t4], fun [f1,f2,f3,f4] arg ->
            let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
              match arg with
              | true1 ->
                let k = [f2,f3], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg -> arg f1 k in
                  arg f1 k in
                g44 f1 k
              | false0 -> k g48 in
            arg f3 k in
          f1 t1 k in
    k t1 in
  k t1 in
let g49 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let k = [f1,arg], fun [f1,f2] arg ->
      let k = [f2], fun [f1] arg -> arg f1 k in
      arg f1 k in
    g44 g8 k in
  k t1 in
let g50 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match f1 with
    | Nil0 -> k arg
    | Cons1(t1,t2) ->
      let k = [arg,t2], fun [f1,f2] arg ->
        let k = [f1,arg], fun [f1,f2] arg ->
          let k = [f2], fun [f1] arg -> f1 arg k in
          arg f1 k in
        g50 f2 k in
      g43 t1 k in
  k t1 in
let g51 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f1,f2] arg ->
        let k = [f2], fun [f1] arg ->
          let k = [f1], fun [f1] arg -> arg f1 k in
          g51 arg k in
        arg f1 k in
      g43 t1 k in
  k t1 in
let g52 = Nil0 in
let g53 = fun arg k ->
  let k = [arg], fun [f1] arg -> arg f1 k in
  g51 g52 k in
let g55 = Nil0 in
let g54 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k g55
    | Cons1(t1,t2) ->
      let k = [f1,t2], fun [f1,f2] arg ->
        let k = [f1,f2], fun [f1,f2] arg ->
          let k = [f2,arg], fun [f1,f2] arg ->
            let k = [f2], fun [f1] arg -> f1 arg k in
            arg f1 k in
          g54 f1 k in
        g14 arg k in
      f1 t1 k in
  k t1 in
let g57 = 0 in
let g58 = 1 in
let g56 = fun arg k ->
  match arg with
  | Nil0 -> k g57
  | Cons1(t1,t2) ->
    let k = [t2], fun [f1] arg ->
      let k = [arg], fun [f1] arg -> f1 arg k in
      g56 f1 k in
    g1 g58 k in
let g59 = '0' in
let g60 = 0 in
let g61 = 10 in
let g62 = 10 in
let g63 = 0 in
let g64 = '0' in
let g65 = Nil0 in
let g66 = Nil0 in
let g67 = fun arg k ->
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
                            arg g62 k in
                          g4 f1 k in
                        f1 arg k in
                      arg f2 k in
                    g43 arg k in
                  f1 arg k in
                arg g61 k in
              g5 f4 k in
          arg g60 k in
        g7 arg k in
      k t1 in
    let k = [f1,t2], fun [f1,f2] arg ->
      let k = [f1,f2], fun [f1,f2] arg ->
        match arg with
        | true1 ->
          let k = [], fun [] arg -> arg g65 k in
          g43 g64 k
        | false0 ->
          let k = [f1], fun [f1] arg -> arg f1 k in
          f2 g66 k in
      arg g63 k in
    g7 f1 k in
  g9 g59 k in
let g69 = Unit0 in
let g68 = fun arg k ->
  match arg with
  | Nil0 -> k g69
  | Cons1(t1,t2) ->
    let k = [t2], fun [f1] arg -> g68 f1 k in
    g28 t1 k in
let g70 = fun arg k ->
  let k = [], fun [] arg -> g68 arg k in
  g67 arg k in
let g71 = '\n' in
let g72 = fun arg k -> g28 g71 k in
let g74 = Unit0 in
let g75 = 4 in
let g76 = '\n' in
let g77 = Unit0 in
let g78 = Unit0 in
let g79 = 127 in
let g80 = 127 in
let g81 = 26 in
let g82 = Unit0 in
let g83 = Unit0 in
let g84 = Unit0 in
let g73 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1,arg], fun [f1,f2] arg ->
      let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
        let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
          let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
            match arg with
            | true1 ->
              let k = [f1], fun [f1] arg -> g53 f1 k in
              g72 g77 k
            | false0 ->
              let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                  match arg with
                  | true1 ->
                    let k = [f1,f4], fun [f1,f2] arg ->
                      let k = [f1,f2], fun [f1,f2] arg ->
                        let k = [f1], fun [f1] arg ->
                          let k = [], fun [] arg -> g53 arg k in
                          arg f1 k in
                        g14 f2 k in
                      g72 g78 k in
                    g28 f2 k
                  | false0 ->
                    let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                      let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                        match arg with
                        | true1 -> g73 f1 k
                        | false0 ->
                          let k = [f1,f2], fun [f1,f2] arg ->
                            let k = [f1,f2], fun [f1,f2] arg ->
                              match arg with
                              | true1 ->
                                match f1 with
                                | Nil0 -> g73 f1 k
                                | Cons1(t1,t2) ->
                                  let k = [t2], fun [f1] arg ->
                                    let k = [f1], fun [f1] arg ->
                                      let k = [f1], fun [f1] arg ->
                                        let k = [f1], fun [f1] arg ->
                                          let k = [f1], fun [f1] arg -> g73 f1 k in
                                          g31 g84 k in
                                        match arg with
                                        | true1 -> g31 g82 k
                                        | false0 -> k g83 in
                                      arg g81 k in
                                    g20 arg k in
                                  g9 t1 k
                              | false0 ->
                                let k = [f1,f2], fun [f1,f2] arg ->
                                  let k = [f1], fun [f1] arg ->
                                    let k = [], fun [] arg -> g73 arg k in
                                    arg f1 k in
                                  g43 f2 k in
                                g28 f2 k in
                            arg g80 k in
                          g7 f3 k in
                      arg g79 k in
                    g19 f3 k in
                arg f4 k in
              g8 f2 k in
          arg g76 k in
        g8 f2 k in
      g10 g75 k in
    g9 arg k in
  g13 g74 k in
let g85 = Nil0 in
let g86 = fun arg k -> g73 g85 k in
let g88 = 2 in
let g89 = 1 in
let g90 = 2 in
let g87 = fun arg k ->
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
                    g87 arg k in
                  arg g90 k in
                g2 f1 k in
              g1 arg k in
            g87 arg k in
          arg g89 k in
        g2 f1 k in
    arg g88 k in
  g6 arg k in
let g92 = 2 in
let g93 = 1 in
let g94 = 1 in
let g91 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      match arg with
      | true1 ->
        let k = [f1], fun [f1] arg ->
          let k = [f1], fun [f1] arg ->
            let k = [f1], fun [f1] arg ->
              let k = [f1], fun [f1] arg -> arg f1 k in
              g3 arg k in
            g91 arg k in
          arg g93 k in
        g2 f1 k
      | false0 -> k g94 in
    arg g92 k in
  g21 arg k in
let g95 = "ERROR: " in
let g96 = Unit0 in
let g97 = "fib: " in
let g98 = "expected an argument" in
let g99 = "expected exactly one argument" in
let g100 = "expected arg1 to be numeric" in
let g101 = " --> " in
let g102 = Unit0 in
let g103 = "fact: " in
let g104 = "expected an argument" in
let g105 = "expected exactly one argument" in
let g106 = "expected arg1 to be numeric" in
let g107 = " --> " in
let g108 = Unit0 in
let g109 = 4 in
let g110 = Nil0 in
let g111 = Unit0 in
let g112 = Unit0 in
let g113 = Unit0 in
let g114 = Unit0 in
let g115 = Unit0 in
let g116 = "rev: expected no arguments" in
let g117 = "(reverse typed lines until ^D)\n" in
let g118 = Unit0 in
let g119 = 'o' in
let g120 = '*' in
let g121 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      match arg with
      | true1 -> k g120
      | false0 -> k f1 in
    arg g119 k in
  g8 arg k in
let g122 = "You wrote: \"" in
let g123 = "\" (" in
let g124 = " chars)" in
let g125 = Unit0 in
let g127 = ' ' in
let g128 = Nil0 in
let g126 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1,arg], fun [f1,f2] arg k ->
      match arg with
      | Nil0 ->
        let k = [f1], fun [f1] arg ->
          let k = [f1], fun [f1] arg ->
            let k = [], fun [] arg -> g53 arg k in
            arg f1 k in
          g14 arg k in
        g53 f2 k
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
                      arg g128 k in
                    g126 arg k in
                  arg f1 k in
                g14 arg k in
              g53 f2 k
            | false0 ->
              let k = [f2,f3,f4], fun [f1,f2,f3] arg ->
                let k = [f1,f3,arg], fun [f1,f2,f3] arg ->
                  let k = [f2,f3], fun [f1,f2] arg ->
                    let k = [f1], fun [f1] arg -> arg f1 k in
                    f2 arg k in
                  arg f1 k in
                g14 f2 k in
              g126 f1 k in
          arg g127 k in
        g8 t1 k in
    k t1 in
  k t1 in
let g129 = Nil0 in
let g130 = Nil0 in
let g131 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg -> arg f1 k in
    arg g130 k in
  g126 g129 k in
let g132 = Unit0 in
let g133 = "fib" in
let g134 = "fact" in
let g135 = "rev" in
let g136 = '>' in
let g137 = ' ' in
let g138 = Nil0 in
let g139 = Cons1[g137,g138] in
let g140 = Cons1[g136,g139] in
let g141 = Unit0 in
let g142 = Unit0 in
let g143 = Unit0 in
let g144 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g145 = Unit0 in
let g146 = Unit0 in
let g15 = g15 in
let k = [], fun [] arg ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = [f1], fun [f1] arg k ->
      let k = [], fun [] arg -> g68 arg k in
      f1 arg k in
    let k = [arg], fun [f1] arg -> arg f1 k in
    g15 t1 k in
  let t2 = [t1], fun [f1] arg k ->
    let k = [f1,arg], fun [f1,f2] arg ->
      let k = [], fun [] arg -> g72 g96 k in
      f1 f2 k in
    f1 g95 k in
  let t3 = [t1,t2], fun [f1,f2] arg k ->
    let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
      match f3 with
      | Nil0 -> f2 g98 k
      | Cons1(t1,t2) ->
        match t2 with
        | Cons1(t3,t4) -> f2 g99 k
        | Nil0 ->
          let k = [f1,f2], fun [f1,f2] arg ->
            match arg with
            | None1 -> f2 g100 k
            | Some0(t1) ->
              let k = [f1,t1], fun [f1,f2] arg ->
                let k = [f1,arg], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg ->
                    let k = [], fun [] arg -> g72 g102 k in
                    g70 f1 k in
                  f1 g101 k in
                g70 f2 k in
              g87 t1 k in
          g42 t1 k in
    f1 g97 k in
  let t4 = [t1,t2], fun [f1,f2] arg k ->
    let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
      match f3 with
      | Nil0 -> f2 g104 k
      | Cons1(t1,t2) ->
        match t2 with
        | Cons1(t3,t4) -> f2 g105 k
        | Nil0 ->
          let k = [f1,f2], fun [f1,f2] arg ->
            match arg with
            | None1 -> f2 g106 k
            | Some0(t1) ->
              let k = [f1,t1], fun [f1,f2] arg ->
                let k = [f1,arg], fun [f1,f2] arg ->
                  let k = [f2], fun [f1] arg ->
                    let k = [], fun [] arg -> g72 g108 k in
                    g70 f1 k in
                  f1 g107 k in
                g70 f2 k in
              g91 t1 k in
          g42 t1 k in
    f1 g103 k in
  let k = [arg,t1,t2,t3,t4], fun [f1,f2,f3,f4,f5] arg ->
    let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
      let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
        let t1 = [arg], fun [f1] arg k ->
          let t1 = [f1], fun [f1] me arg k ->
            let k = [f1,me], fun [f1,f2] arg ->
              let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
                let k = [f2,f3], fun [f1,f2] arg ->
                  match arg with
                  | true1 -> k g112
                  | false0 ->
                    let k = [f1], fun [f1] arg ->
                      let k = [f1], fun [f1] arg ->
                        let k = [f1], fun [f1] arg -> f1 g114 k in
                        g72 g113 k in
                      g68 arg k in
                    g53 f2 k in
                arg f1 k in
              g49 arg k in
            g86 g111 k in
          t1 g115 k in
        let t2 = [f2,f3,t1], fun [f1,f2,f3] arg k ->
          match arg with
          | Cons1(t1,t2) -> f2 g116 k
          | Nil0 ->
            let k = [f3], fun [f1] arg -> f1 g118 k in
            f1 g117 k in
        let t3 = [f1,f2], fun [f1,f2] arg k ->
          let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
            let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
              let k = [f2,f3,f4,arg], fun [f1,f2,f3,f4] arg ->
                let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                  let k = [f1,f4,arg], fun [f1,f2,f3] arg ->
                    let k = [f1,f2], fun [f1,f2] arg ->
                      let k = [f1,f2], fun [f1,f2] arg ->
                        let k = [f1,f2], fun [f1,f2] arg ->
                          let k = [f1], fun [f1] arg ->
                            let k = [], fun [] arg -> g72 g125 k in
                            f1 g124 k in
                          g70 f2 k in
                        f1 g123 k in
                      g68 arg k in
                    f3 arg k in
                  f3 f2 k in
                g50 arg k in
              f1 g122 k in
            g56 f3 k in
          g54 g121 k in
        let t4 = [f1,f4,f5,t2,t3], fun [f1,f2,f3,f4,f5] arg k ->
          let k = [f1,f2,f3,f4,f5,arg], fun [f1,f2,f3,f4,f5,f6] arg ->
            match arg with
            | Nil0 -> k g132
            | Cons1(t1,t2) ->
              let k = [f1,f2,f3,f4,f5,f6,t1,t2], fun [f1,f2,f3,f4,f5,f6,f7,f8] arg ->
                let k = [f1,f2,f3,f4,f5,f6,f7,f8,arg], fun [f1,f2,f3,f4,f5,f6,f7,f8,f9] arg ->
                  let k = [f1,f2,f3,f4,f5,f6,f7,f8], fun [f1,f2,f3,f4,f5,f6,f7,f8] arg ->
                    match arg with
                    | true1 -> f2 f8 k
                    | false0 ->
                      let k = [f1,f3,f4,f5,f6,f7,f8], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
                        let k = [f1,f2,f3,f4,f5,f6,f7,arg], fun [f1,f2,f3,f4,f5,f6,f7,f8] arg ->
                          let k = [f1,f2,f3,f4,f5,f6,f7], fun [f1,f2,f3,f4,f5,f6,f7] arg ->
                            match arg with
                            | true1 -> f2 f7 k
                            | false0 ->
                              let k = [f1,f3,f4,f5,f7], fun [f1,f2,f3,f4,f5] arg ->
                                let k = [f2,f3,f4,f5,arg], fun [f1,f2,f3,f4,f5] arg ->
                                  let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                                    match arg with
                                    | true1 -> f1 f4 k
                                    | false0 -> f2 f3 k in
                                  f5 arg k in
                                f1 g135 k in
                              g49 f6 k in
                          f8 arg k in
                        f1 g134 k in
                      g49 f7 k in
                  f9 arg k in
                f1 g133 k in
              g49 t1 k in
          g131 arg k in
        let t5 = [arg,t4], fun [f1,f2] me arg k ->
          let k = [f1,f2,me], fun [f1,f2,f3] arg ->
            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
              let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
                let k = [f2,f3,f4], fun [f1,f2,f3] arg ->
                  match arg with
                  | true1 -> k g142
                  | false0 ->
                    let k = [f2], fun [f1] arg -> f1 g143 k in
                    f1 f3 k in
                arg f1 k in
              g49 arg k in
            g86 g141 k in
          g68 g140 k in
        let t6 = [f2,t5], fun [f1,f2] arg k ->
          let k = [f2], fun [f1] arg -> f1 g145 k in
          f1 g144 k in
        t6 g146 k in
      arg g110 k in
    g14 arg k in
  g10 g109 k in
g15 g11 k
