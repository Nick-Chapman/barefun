(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    match arg with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = Cons1[t1,f1] in
      let k = [t2], fun [f2] arg -> arg f2 k in
      g1 t3 k in
  k t1 in
let g3 = Unit0 in
let g2 = fun arg k ->
  match arg with
  | Nil0 -> k g3
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,8) in
    let k = [t2], fun [f2] arg -> g2 f2 k in
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
let g6 = "% " in
let g5 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g6,arg) in
      let t3 = Cons1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,1) in
        arg t1 k in
      g5 t3 k in
  k t1 in
let g7 = Nil0 in
let g9 = Unit0 in
let g10 = Nil0 in
let g11 = Nil0 in
let g12 = false0 in
let g13 = true1 in
let g14 = Unit0 in
let g8 = fun arg k ->
  let t1 = PRIM_GetChar(g9) in
  let t2 = PRIM_CharOrd(t1) in
  let t3 = PRIM_EqChar(t1,'\n') in
  match t3 with
  | true1 ->
    let t4 = PRIM_PutChar('\n') in
    let k = [arg], fun [f2] arg -> arg f2 k in
    g1 g10 k
  | false0 ->
    let t4 = PRIM_EqChar(t1,'\EOT') in
    match t4 with
    | true1 ->
      let t5 = PRIM_PutChar('^') in
      let t6 = PRIM_PutChar('D') in
      let t7 = PRIM_PutChar('\n') in
      let k = [arg], fun [f2] arg ->
        let t1 = Cons1['\EOT',f2] in
        arg t1 k in
      g1 g11 k
    | false0 ->
      let t5 = PRIM_LessInt(127,t2) in
      match t5 with
      | true1 -> g8 arg k
      | false0 ->
        let t6 = PRIM_EqInt(t2,127) in
        match t6 with
        | true1 ->
          match arg with
          | Nil0 -> g8 arg k
          | Cons1(t7,t8) ->
            let t9 = PRIM_CharOrd(t7) in
            let t10 = PRIM_LessInt(26,t9) in
            let k = [t8], fun [f2] arg ->
              let k = [f2], fun [f2] arg ->
                let t1 = PRIM_PutChar('\b') in
                let t2 = PRIM_PutChar(' ') in
                let t3 = PRIM_PutChar('\b') in
                g8 f2 k in
              match arg with
              | true1 ->
                let t1 = PRIM_PutChar('\b') in
                let t2 = PRIM_PutChar(' ') in
                let t3 = PRIM_PutChar('\b') in
                k t3
              | false0 -> k g14 in
            match t10 with
            | true1 -> k g12
            | false0 -> k g13
        | false0 ->
          let t7 = PRIM_CharOrd(t1) in
          let t8 = PRIM_EqInt(t7,8) in
          let k = [arg,t1], fun [f2,f3] arg ->
            let t1 = Cons1[f3,f2] in
            g8 t1 k in
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
let g15 = Nil0 in
let g16 = false0 in
let g17 = Unit0 in
let g18 = Unit0 in
let g4 = fun arg k ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg ->
      let k = [], fun [] arg ->
        let k = [], fun [] arg ->
          let k = [arg], fun [f2] arg ->
            match arg with
            | true1 -> k g17
            | false0 ->
              let k = [], fun [] arg ->
                let t1 = PRIM_PutChar('\n') in
                g4 g18 k in
              g2 f2 k in
          match arg with
          | Nil0 -> k g16
          | Cons1(t1,t2) ->
            let t3 = PRIM_EqChar(t1,'\EOT') in
            k t3 in
        g8 g15 k in
      g2 arg k in
    arg 1 k in
  g5 g7 k in
let g20 = "Readline: edit with backspace; exit with ^D.\n" in
let g19 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g20,arg) in
      let t3 = Cons1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,1) in
        arg t1 k in
      g19 t3 k in
  k t1 in
let g21 = Nil0 in
let g22 = Unit0 in
let k = [], fun [] arg ->
  let k = [], fun [] arg ->
    let k = [], fun [] arg -> g4 g22 k in
    g2 arg k in
  arg 44 k in
g19 g21 k
