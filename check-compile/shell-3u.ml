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
let g15 = false0 in
let g16 = true1 in
let g17 = fun arg k ->
  match arg with
  | true1 -> k g15
  | false0 -> k g16 in
let g18 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let k = [f1], fun [f1] arg -> arg f1 k in
    g6 arg k in
  k t1 in
let g19 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let k = [f1], fun [f1] arg ->
      let k = [], fun [] arg -> g17 arg k in
      arg f1 k in
    g6 arg k in
  k t1 in
let g20 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let k = [arg], fun [f1] arg ->
      let k = [], fun [] arg -> g17 arg k in
      arg f1 k in
    g6 f1 k in
  k t1 in
let g21 = 8 in
let g22 = '\n' in
let g23 = 26 in
let g24 = '^' in
let g25 = 'A' in
let g26 = 1 in
let g27 = fun arg k ->
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
                                arg g26 k in
                              g2 arg k in
                            arg f1 k in
                          g1 arg k in
                        g9 g25 k in
                      g12 g24 k in
                  arg g23 k in
                g18 f2 k in
            arg g22 k in
          g8 f1 k in
      arg g21 k in
    g7 arg k in
  g9 arg k in
let g28 = 8 in
let g29 = ' ' in
let g30 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [arg], fun [f1] arg ->
      let k = [f1], fun [f1] arg -> g27 f1 k in
      g27 g29 k in
    g27 arg k in
  g10 g28 k in
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
                g19 f1 k
              | false0 -> k g35 in
            arg g32 k in
          g20 arg k in
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
let g68 = Unit0 in
let g67 = fun arg k ->
  match arg with
  | Nil0 -> k g68
  | Cons1(t1,t2) ->
    let k = [t2], fun [f1] arg -> g67 f1 k in
    g27 t1 k in
let g69 = fun arg k ->
  let k = [], fun [] arg -> g67 arg k in
  g11 arg k in
let g70 = fun arg k ->
  let k = [], fun [] arg -> g67 arg k in
  g66 arg k in
let g71 = '\n' in
let g72 = fun arg k -> g27 g71 k in
let g73 = 4 in
let g74 = Unit0 in
let g75 = '\n' in
let g76 = Unit0 in
let g77 = Unit0 in
let g78 = 127 in
let g79 = 127 in
let g80 = 26 in
let g81 = Unit0 in
let g82 = Unit0 in
let g83 = Unit0 in
let g84 = Nil0 in
let g85 = fun arg k ->
  let k = [], fun [] arg ->
    let t1 = [arg], fun [f1] me arg k ->
      let k = [f1,me,arg], fun [f1,f2,f3] arg ->
        let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
          let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
            let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
              match arg with
              | true1 ->
                let k = [f3], fun [f1] arg -> g52 f1 k in
                g72 g76 k
              | false0 ->
                let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                  let k = [f1,f2,f3,f4,f5], fun [f1,f2,f3,f4,f5] arg ->
                    match arg with
                    | true1 ->
                      let k = [f1,f3], fun [f1,f2] arg ->
                        let k = [f1,f2], fun [f1,f2] arg ->
                          let k = [f2], fun [f1] arg ->
                            let k = [], fun [] arg -> g52 arg k in
                            arg f1 k in
                          g14 f1 k in
                        g72 g77 k in
                      g27 f4 k
                    | false0 ->
                      let k = [f2,f3,f4,f5], fun [f1,f2,f3,f4] arg ->
                        let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                          match arg with
                          | true1 -> f1 f2 k
                          | false0 ->
                            let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                              let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                match arg with
                                | true1 ->
                                  match f2 with
                                  | Nil0 -> f1 f2 k
                                  | Cons1(t1,t2) ->
                                    let k = [f1,t2], fun [f1,f2] arg ->
                                      let k = [f1,f2], fun [f1,f2] arg ->
                                        let k = [f1,f2], fun [f1,f2] arg ->
                                          let k = [f1,f2], fun [f1,f2] arg ->
                                            let k = [f1,f2], fun [f1,f2] arg -> f1 f2 k in
                                            g30 g83 k in
                                          match arg with
                                          | true1 -> g30 g81 k
                                          | false0 -> k g82 in
                                        arg g80 k in
                                      g19 arg k in
                                    g9 t1 k
                                | false0 ->
                                  let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                    let k = [f1,f2], fun [f1,f2] arg ->
                                      let k = [f1], fun [f1] arg -> f1 arg k in
                                      arg f2 k in
                                    g42 f3 k in
                                  g27 f3 k in
                              arg g79 k in
                            g7 f4 k in
                        arg g78 k in
                      g18 f5 k in
                  arg f1 k in
                g8 f4 k in
            arg g75 k in
          g8 f4 k in
        g9 arg k in
      g13 g74 k in
    t1 g84 k in
  g10 g73 k in
let g87 = 2 in
let g88 = 1 in
let g89 = 2 in
let g86 = fun arg k ->
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
                    g86 arg k in
                  arg g89 k in
                g2 f1 k in
              g1 arg k in
            g86 arg k in
          arg g88 k in
        g2 f1 k in
    arg g87 k in
  g6 arg k in
let g91 = 2 in
let g92 = 1 in
let g93 = 1 in
let g90 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      match arg with
      | true1 ->
        let k = [f1], fun [f1] arg ->
          let k = [f1], fun [f1] arg ->
            let k = [f1], fun [f1] arg ->
              let k = [f1], fun [f1] arg -> arg f1 k in
              g3 arg k in
            g90 arg k in
          arg g92 k in
        g2 f1 k
      | false0 -> k g93 in
    arg g91 k in
  g20 arg k in
let g94 = "ERROR: " in
let g95 = Unit0 in
let g96 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [], fun [] arg -> g72 g95 k in
    g69 f1 k in
  g69 g94 k in
let g97 = "fib: " in
let g98 = "expected an argument" in
let g99 = "expected exactly one argument" in
let g100 = "expected arg1 to be numeric" in
let g101 = " --> " in
let g102 = Unit0 in
let g103 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    match f1 with
    | Nil0 -> g96 g98 k
    | Cons1(t1,t2) ->
      match t2 with
      | Cons1(t3,t4) -> g96 g99 k
      | Nil0 ->
        let k = [], fun [] arg ->
          match arg with
          | None1 -> g96 g100 k
          | Some0(t1) ->
            let k = [t1], fun [f1] arg ->
              let k = [arg], fun [f1] arg ->
                let k = [f1], fun [f1] arg ->
                  let k = [], fun [] arg -> g72 g102 k in
                  g70 f1 k in
                g69 g101 k in
              g70 f1 k in
            g86 t1 k in
        g41 t1 k in
  g69 g97 k in
let g104 = "fact: " in
let g105 = "expected an argument" in
let g106 = "expected exactly one argument" in
let g107 = "expected arg1 to be numeric" in
let g108 = " --> " in
let g109 = Unit0 in
let g110 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    match f1 with
    | Nil0 -> g96 g105 k
    | Cons1(t1,t2) ->
      match t2 with
      | Cons1(t3,t4) -> g96 g106 k
      | Nil0 ->
        let k = [], fun [] arg ->
          match arg with
          | None1 -> g96 g107 k
          | Some0(t1) ->
            let k = [t1], fun [f1] arg ->
              let k = [arg], fun [f1] arg ->
                let k = [f1], fun [f1] arg ->
                  let k = [], fun [] arg -> g72 g109 k in
                  g70 f1 k in
                g69 g108 k in
              g70 f1 k in
            g90 t1 k in
        g41 t1 k in
  g69 g104 k in
let g111 = 4 in
let g112 = Nil0 in
let g113 = Unit0 in
let g114 = Unit0 in
let g115 = Unit0 in
let g116 = Unit0 in
let g117 = Unit0 in
let g118 = "rev: expected no arguments" in
let g119 = "(reverse typed lines until ^D)\n" in
let g120 = Unit0 in
let g121 = 'o' in
let g122 = '*' in
let g123 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg ->
      match arg with
      | true1 -> k g122
      | false0 -> k f1 in
    arg g121 k in
  g8 arg k in
let g124 = "You wrote: \"" in
let g125 = "\" (" in
let g126 = " chars)" in
let g127 = Unit0 in
let g128 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1,arg], fun [f1,f2] arg ->
      let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
        let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
          let k = [f3,arg], fun [f1,f2] arg ->
            let k = [f1], fun [f1] arg ->
              let k = [f1], fun [f1] arg ->
                let k = [f1], fun [f1] arg ->
                  let k = [], fun [] arg ->
                    let k = [], fun [] arg -> g72 g127 k in
                    g69 g126 k in
                  g70 f1 k in
                g69 g125 k in
              g67 arg k in
            f2 arg k in
          f2 f1 k in
        g49 arg k in
      g11 g124 k in
    g55 f1 k in
  g53 g123 k in
let g130 = ' ' in
let g131 = Nil0 in
let g129 = fun arg k ->
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
                      arg g131 k in
                    g129 arg k in
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
              g129 f1 k in
          arg g130 k in
        g8 t1 k in
    k t1 in
  k t1 in
let g132 = Nil0 in
let g133 = Nil0 in
let g134 = fun arg k ->
  let k = [arg], fun [f1] arg ->
    let k = [f1], fun [f1] arg -> arg f1 k in
    arg g133 k in
  g129 g132 k in
let g135 = Unit0 in
let g136 = "fib" in
let g137 = "fact" in
let g138 = "rev" in
let g139 = '>' in
let g140 = ' ' in
let g141 = Nil0 in
let g142 = Cons1[g140,g141] in
let g143 = Cons1[g139,g142] in
let g144 = Unit0 in
let g145 = Unit0 in
let g146 = Unit0 in
let g147 = "This is a shell prototype. Try: fib, fact, rev\n" in
let g148 = Unit0 in
let g149 = Unit0 in
let k = [], fun [] arg ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let t1 = [arg], fun [f1] arg k ->
        let t1 = [f1], fun [f1] me arg k ->
          let k = [f1,me], fun [f1,f2] arg ->
            let k = [f1,f2,arg], fun [f1,f2,f3] arg ->
              let k = [f2,f3], fun [f1,f2] arg ->
                match arg with
                | true1 -> k g114
                | false0 ->
                  let k = [f1], fun [f1] arg ->
                    let k = [f1], fun [f1] arg ->
                      let k = [f1], fun [f1] arg -> f1 g116 k in
                      g72 g115 k in
                    g67 arg k in
                  g52 f2 k in
              arg f1 k in
            g48 arg k in
          g85 g113 k in
        t1 g117 k in
      let t2 = [t1], fun [f1] arg k ->
        match arg with
        | Cons1(t1,t2) -> g96 g118 k
        | Nil0 ->
          let k = [f1], fun [f1] arg -> f1 g120 k in
          g69 g119 k in
      let t3 = [t2], fun [f1] arg k ->
        let k = [f1,arg], fun [f1,f2] arg ->
          match arg with
          | Nil0 -> k g135
          | Cons1(t1,t2) ->
            let k = [f1,f2,t1,t2], fun [f1,f2,f3,f4] arg ->
              let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
                let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                  match arg with
                  | true1 -> g103 f4 k
                  | false0 ->
                    let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                      let k = [f1,f2,f3,f4,arg], fun [f1,f2,f3,f4,f5] arg ->
                        let k = [f1,f2,f3,f4], fun [f1,f2,f3,f4] arg ->
                          match arg with
                          | true1 -> g110 f4 k
                          | false0 ->
                            let k = [f1,f2,f4], fun [f1,f2,f3] arg ->
                              let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
                                let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
                                  match arg with
                                  | true1 -> f1 f3 k
                                  | false0 -> g128 f2 k in
                                f4 arg k in
                              g11 g138 k in
                            g48 f3 k in
                        f5 arg k in
                      g11 g137 k in
                    g48 f3 k in
                f5 arg k in
              g11 g136 k in
            g48 t1 k in
        g134 arg k in
      let t4 = [arg,t3], fun [f1,f2] me arg k ->
        let k = [f1,f2,me], fun [f1,f2,f3] arg ->
          let k = [f1,f2,f3], fun [f1,f2,f3] arg ->
            let k = [f1,f2,f3,arg], fun [f1,f2,f3,f4] arg ->
              let k = [f2,f3,f4], fun [f1,f2,f3] arg ->
                match arg with
                | true1 -> k g145
                | false0 ->
                  let k = [f2], fun [f1] arg -> f1 g146 k in
                  f1 f3 k in
              arg f1 k in
            g48 arg k in
          g85 g144 k in
        g67 g143 k in
      let t5 = [t4], fun [f1] arg k ->
        let k = [f1], fun [f1] arg -> f1 g148 k in
        g69 g147 k in
      t5 g149 k in
    arg g112 k in
  g14 arg k in
g10 g111 k
