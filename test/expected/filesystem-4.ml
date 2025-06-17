(*Stage4 (CCF)*)
let k () = ()
let g1 = fun [arg0] k ->
  match arg0 with
  | Nil0 -> k 0
  | Cons1(t1,t2) ->
    let k = [], fun [] arg0 ->
      let t1 = PRIM_AddInt(1,arg0) in
      k t1 in
    g1 [t2] k in
let g3 = Nil0 in
let g2 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil0 -> k g3
  | Cons1(t1,t2) ->
    let k = [arg0,t2], fun [f2,f3] arg0 ->
      let k = [arg0], fun [f2] arg0 ->
        let t1 = Cons1[f2,arg0] in
        k t1 in
      g2 [f2,f3] k in
    arg0 [t1] k in
let g5 = Nil0 in
let g4 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil0 -> k g5
  | Cons1(t1,t2) ->
    let k = [arg0,t1,t2], fun [f2,f3,f4] arg0 ->
      match arg0 with
      | true1 ->
        let k = [f3], fun [f2] arg0 ->
          let t1 = Cons1[f2,arg0] in
          k t1 in
        g4 [f2,f4] k
      | false0 -> g4 [f2,f4] k in
    arg0 [t1] k in
let g6 = fun [arg0,arg1,arg2] k ->
  match arg2 with
  | Nil0 -> k arg1
  | Cons1(t1,t2) ->
    let k = [arg0,t2], fun [f2,f3] arg0 -> g6 [f2,arg0,f3] k in
    arg0 [arg1,t1] k in
let g8 = Unit0 in
let g7 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil0 -> k g8
  | Cons1(t1,t2) ->
    let k = [arg0,t2], fun [f2,f3] arg0 -> g7 [f2,f3] k in
    arg0 [t1] k in
let g10 = Nil0 in
let g9 = fun [arg0,arg1] k ->
  let t1 = PRIM_LessInt(arg1,arg0) in
  match t1 with
  | true1 -> k g10
  | false0 ->
    let t2 = PRIM_AddInt(arg0,1) in
    let k = [arg0], fun [f2] arg0 ->
      let t1 = Cons1[f2,arg0] in
      k t1 in
    g9 [t2,arg1] k in
let g12 = false0 in
let g13 = true1 in
let g14 = Nil0 in
let g15 = Nil0 in
let g11 = fun [arg0,arg1] k ->
  let t1 = PRIM_LessInt(0,arg0) in
  let k = [arg0,arg1], fun [f2,f3] arg0 ->
    match arg0 with
    | true1 -> k g14
    | false0 ->
      match f3 with
      | Nil0 -> k g15
      | Cons1(t1,t2) ->
        let t3 = PRIM_SubInt(f2,1) in
        let k = [t1], fun [f2] arg0 ->
          let t1 = Cons1[f2,arg0] in
          k t1 in
        g11 [t3,t2] k in
  match t1 with
  | true1 -> k g12
  | false0 -> k g13 in
let g17 = false0 in
let g18 = true1 in
let g19 = Nil0 in
let g20 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil0 -> k arg0
  | Cons1(t1,t2) ->
    let t3 = Cons1[t1,arg0] in
    g20 [t3,t2] k in
let g21 = Nil0 in
let g22 = fun [arg0] k ->
  let t1 = [arg0], fun [f1] me [arg0,arg1] k ->
    let t1 = PRIM_LessInt(arg1,0) in
    match t1 with
    | true1 -> k arg0
    | false0 ->
      let t2 = PRIM_StringIndex(f1,arg1) in
      let t3 = PRIM_SubInt(arg1,1) in
      let t4 = Cons1[t2,arg0] in
      me [t4,t3] k in
  let t2 = PRIM_StringLength(arg0) in
  let t3 = PRIM_SubInt(t2,1) in
  t1 [g21,t3] k in
let g23 = Unit0 in
let g24 = fun [arg0] k ->
  let k = [arg0], fun [f2] arg0 ->
    let k = [f2], fun [f2] arg0 ->
      let t1 = [arg0], fun [f1] me [arg0,arg1] k ->
        match arg1 with
        | Nil0 -> k g23
        | Cons1(t1,t2) ->
          let t3 = PRIM_SetBytes(f1,arg0,t1) in
          let t4 = PRIM_AddInt(arg0,1) in
          me [t4,t2] k in
      let k = [arg0], fun [f2] arg0 ->
        let t1 = PRIM_FreezeBytes(f2) in
        k t1 in
      t1 [0,f2] k in
    PRIM_MakeBytes(arg0) k in
  g1 [arg0] k in
let g25 = Nil0 in
let g26 = fun [arg0,arg1] k ->
  let k = [arg1], fun [f2] arg0 ->
    let k = [arg0], fun [f2] arg0 ->
      let k = [arg0], fun [f2] arg0 ->
        let k = [], fun [] arg0 -> g24 [arg0] k in
        g20 [f2,arg0] k in
      g20 [g25,f2] k in
    g22 [f2] k in
  g22 [arg0] k in
let g27 = fun [arg0,arg1] k ->
  let t1 = PRIM_EqInt(arg1,0) in
  match t1 with
  | true1 -> k arg0
  | false0 ->
    let t2 = PRIM_ModInt(arg1,10) in
    let t3 = PRIM_AddInt(48,t2) in
    let t4 = PRIM_CharChr(t3) in
    let t5 = PRIM_DivInt(arg1,10) in
    let t6 = Cons1[t4,arg0] in
    g27 [t6,t5] k in
let g28 = Nil0 in
let g29 = Nil0 in
let g30 = Nil0 in
let g31 = fun [arg0] k ->
  let t1 = PRIM_EqInt(arg0,0) in
  let k = [], fun [] arg0 -> g24 [arg0] k in
  match t1 with
  | true1 ->
    let t2 = Cons1['0',g28] in
    k t2
  | false0 ->
    let t2 = PRIM_LessInt(arg0,0) in
    match t2 with
    | true1 ->
      let t3 = PRIM_SubInt(0,arg0) in
      let k = [], fun [] arg0 ->
        let t1 = Cons1['-',arg0] in
        k t1 in
      g27 [g29,t3] k
    | false0 -> g27 [g30,arg0] k in
let g33 = false0 in
let g34 = true1 in
let g35 = false0 in
let g36 = true1 in
let g37 = None0 in
let g38 = None0 in
let g39 = None0 in
let g32 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil0 ->
    let t1 = Some1[arg0] in
    k t1
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_SubInt(t3,48) in
    let t5 = PRIM_LessInt(t4,0) in
    let k = [arg0,t2,t4], fun [f2,f3,f4] arg0 ->
      let k = [f2,f3], fun [f2,f3] arg0 ->
        match arg0 with
        | None0 -> k g39
        | Some1(t1) ->
          let t2 = PRIM_MulInt(10,f2) in
          let t3 = PRIM_AddInt(t2,t1) in
          g32 [t3,f3] k in
      match arg0 with
      | true1 ->
        let t1 = PRIM_LessInt(9,f4) in
        let k = [f4], fun [f2] arg0 ->
          match arg0 with
          | true1 ->
            let t1 = Some1[f2] in
            k t1
          | false0 -> k g37 in
        match t1 with
        | true1 -> k g35
        | false0 -> k g36
      | false0 -> k g38 in
    match t5 with
    | true1 -> k g33
    | false0 -> k g34 in
let g40 = fun [arg0] k ->
  let k = [], fun [] arg0 -> g32 [0,arg0] k in
  g22 [arg0] k in
let g42 = Unit0 in
let g41 = fun [arg0] k ->
  match arg0 with
  | Nil0 -> k g42
  | Cons1(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,8) in
    let k = [t2], fun [f2] arg0 -> g41 [f2] k in
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
let g43 = false0 in
let g44 = "\n" in
let g45 = "trace: " in
let g46 = Unit0 in
let g47 = Unit0 in
let g48 = fun [arg0] k ->
  let k = [arg0], fun [f2] arg0 ->
    let k = [f2,arg0], fun [f2,f3] arg0 ->
      let t1 = [arg0], fun [f1] me [arg0,arg1] k ->
        match arg1 with
        | Nil0 -> k g47
        | Cons1(t1,t2) ->
          let t3 = PRIM_SetBytes(f1,arg0,t1) in
          let t4 = PRIM_SubInt(arg0,1) in
          me [t4,t2] k in
      let t2 = PRIM_SubInt(f3,1) in
      let k = [arg0], fun [f2] arg0 ->
        let t1 = PRIM_FreezeBytes(f2) in
        k t1 in
      t1 [t2,f2] k in
    PRIM_MakeBytes(arg0) k in
  g1 [arg0] k in
let g49 = false0 in
let g50 = true1 in
let g51 = false0 in
let g52 = true1 in
let g53 = false0 in
let g54 = true1 in
let g55 = false0 in
let g56 = fun [arg0,arg1] k ->
  let t1 = PRIM_StringLength(arg0) in
  let t2 = PRIM_StringLength(arg1) in
  let t3 = PRIM_EqInt(t1,t2) in
  let k = [arg0,arg1,t1], fun [f2,f3,f4] arg0 ->
    match arg0 with
    | true1 -> k g51
    | false0 ->
      let t1 = [f2,f3], fun [f1,f2] me [arg0] k ->
        let t1 = PRIM_LessInt(arg0,0) in
        match t1 with
        | true1 -> k g52
        | false0 ->
          let t2 = PRIM_StringIndex(f1,arg0) in
          let t3 = PRIM_StringIndex(f2,arg0) in
          let t4 = PRIM_EqChar(t2,t3) in
          let k = [arg0,me], fun [f2,f3] arg0 ->
            match arg0 with
            | true1 -> k g55
            | false0 ->
              let t1 = PRIM_SubInt(f2,1) in
              f3 [t1] k in
          match t4 with
          | true1 -> k g53
          | false0 -> k g54 in
      let t2 = PRIM_SubInt(f4,1) in
      t1 [t2] k in
  match t3 with
  | true1 -> k g49
  | false0 -> k g50 in
let g57 = Nil0 in
let g58 = Nil0 in
let g59 = Nil0 in
let g60 = "" in
let g61 = fun [arg0] k ->
  let k = [], fun [] arg0 ->
    let t1 = [arg0], fun [f1] me [arg0,arg1] k ->
      match arg1 with
      | Nil0 -> g24 [arg0] k
      | Cons1(t1,t2) ->
        let k = [f1,arg0,me,t2], fun [f2,f3,f4,f5] arg0 ->
          let k = [f3,f4,f5,arg0], fun [f2,f3,f4,f5] arg0 ->
            let k = [f3,f4,f5], fun [f2,f3,f4] arg0 ->
              let k = [f2,f3,arg0], fun [f2,f3,f4] arg0 ->
                let k = [f2,f3], fun [f2,f3] arg0 -> f2 [arg0,f3] k in
                g20 [f4,arg0] k in
              g20 [g58,f4] k in
            g20 [f2,arg0] k in
          g20 [g57,f2] k in
        g22 [t1] k in
    let t2 = [t1], fun [f1] [arg0] k ->
      let k = [f1], fun [f2] arg0 ->
        match arg0 with
        | Nil0 -> k g60
        | Cons1(t1,t2) ->
          let k = [f2,t2], fun [f2,f3] arg0 -> f2 [arg0,f3] k in
          g22 [t1] k in
      g20 [g59,arg0] k in
    k t2 in
  g22 [arg0] k in
let g63 = fun [arg0,arg1,arg2] k ->
  match arg2 with
  | Nil0 ->
    let k = [arg0], fun [f2] arg0 ->
      let t1 = Cons1[arg0,f2] in
      k t1 in
    g48 [arg1] k
  | Cons1(t1,t2) ->
    let t3 = PRIM_EqChar(t1,' ') in
    match t3 with
    | true1 ->
      let k = [arg0,t2], fun [f2,f3] arg0 ->
        let t1 = Cons1[arg0,f2] in
        g62 [t1,f3] k in
      g48 [arg1] k
    | false0 ->
      let t4 = Cons1[t1,arg1] in
      g63 [arg0,t4,t2] k in
let g64 = Nil0 in
let g62 = fun [arg0] k ->
  let t1 = [arg0], fun [f1] [arg0] k ->
    match arg0 with
    | Nil0 -> k f1
    | Cons1(t1,t2) ->
      let t3 = PRIM_EqChar(t1,' ') in
      match t3 with
      | true1 -> g62 [f1,t2] k
      | false0 ->
        let t4 = Cons1[t1,g64] in
        g63 [f1,t4,t2] k in
  k t1 in
let g65 = false0 in
let g66 = true1 in
let g67 = Unit0 in
let g68 = fun [arg0,arg1,arg2] k ->
  let k = [arg0,arg1,arg2], fun [f2,f3,f4] arg0 ->
    let t1 = [f2,f3,f4,arg0], fun [f1,f2,f3,f4] me [arg0] k ->
      let t1 = PRIM_LessInt(arg0,f3) in
      let k = [f1,f2,f4,arg0,me], fun [f2,f3,f4,f5,f6] arg0 ->
        match arg0 with
        | true1 -> k g67
        | false0 ->
          let t1 = PRIM_AddInt(f3,f5) in
          let t2 = PRIM_StringIndex(f2,t1) in
          let t3 = PRIM_SetBytes(f4,f5,t2) in
          let t4 = PRIM_AddInt(f5,1) in
          f6 [t4] k in
      match t1 with
      | true1 -> k g65
      | false0 -> k g66 in
    let k = [arg0], fun [f2] arg0 ->
      let t1 = PRIM_FreezeBytes(f2) in
      k t1 in
    t1 [0] k in
  PRIM_MakeBytes(arg2) k in
let g69 = false0 in
let g70 = true1 in
let g71 = Unit0 in
let g72 = fun [arg0,arg1,arg2] k ->
  let t1 = PRIM_StringLength(arg2) in
  let t2 = [arg0,arg1,arg2,t1], fun [f1,f2,f3,f4] me [arg0] k ->
    let t1 = PRIM_LessInt(arg0,f4) in
    let k = [f1,f2,f3,arg0,me], fun [f2,f3,f4,f5,f6] arg0 ->
      match arg0 with
      | true1 -> k g71
      | false0 ->
        let t1 = PRIM_StringIndex(f4,f5) in
        let t2 = PRIM_AddInt(f3,f5) in
        let t3 = PRIM_SetBytes(f2,t2,t1) in
        let t4 = PRIM_AddInt(f5,1) in
        f6 [t4] k in
    match t1 with
    | true1 -> k g69
    | false0 -> k g70 in
  t2 [0] k in
let g73 = Nil0 in
let g75 = Unit0 in
let g76 = false0 in
let g77 = true1 in
let g74 = fun [arg0] k ->
  let t1 = PRIM_GetChar(g75) in
  let t2 = PRIM_CharOrd(t1) in
  let t3 = PRIM_EqChar(t1,'\n') in
  match t3 with
  | true1 ->
    let t4 = PRIM_PutChar('\n') in
    g48 [arg0] k
  | false0 ->
    let t4 = PRIM_EqChar(t1,'\EOT') in
    match t4 with
    | true1 ->
      let t5 = PRIM_PutChar('^') in
      let t6 = PRIM_PutChar('D') in
      let t7 = PRIM_PutChar('\n') in
      let t8 = Cons1['\EOT',arg0] in
      g48 [t8] k
    | false0 ->
      let t5 = PRIM_LessInt(127,t2) in
      match t5 with
      | true1 -> g74 [arg0] k
      | false0 ->
        let t6 = PRIM_EqInt(t2,127) in
        match t6 with
        | true1 ->
          match arg0 with
          | Nil0 -> g74 [arg0] k
          | Cons1(t7,t8) ->
            let t9 = PRIM_CharOrd(t7) in
            let t10 = PRIM_LessInt(26,t9) in
            let k = [t8,t9], fun [f2,f3] arg0 ->
              let k = [f2], fun [f2] arg0 -> g74 [f2] k in
              match arg0 with
              | true1 ->
                let t1 = PRIM_PutChar('\b') in
                let t2 = PRIM_PutChar(' ') in
                let t3 = PRIM_PutChar('\b') in
                let t4 = PRIM_PutChar('\b') in
                let t5 = PRIM_PutChar(' ') in
                let t6 = PRIM_PutChar('\b') in
                k t6
              | false0 ->
                let t1 = PRIM_LessInt(f3,32) in
                match t1 with
                | true1 ->
                  let t2 = PRIM_PutChar('\b') in
                  let t3 = PRIM_PutChar(' ') in
                  let t4 = PRIM_PutChar('\b') in
                  let t5 = PRIM_PutChar('\b') in
                  let t6 = PRIM_PutChar(' ') in
                  let t7 = PRIM_PutChar('\b') in
                  let t8 = PRIM_PutChar('\b') in
                  let t9 = PRIM_PutChar(' ') in
                  let t10 = PRIM_PutChar('\b') in
                  k t10
                | false0 ->
                  let t2 = PRIM_LessInt(126,f3) in
                  match t2 with
                  | true1 ->
                    let t3 = PRIM_PutChar('\b') in
                    let t4 = PRIM_PutChar(' ') in
                    let t5 = PRIM_PutChar('\b') in
                    let t6 = PRIM_PutChar('\b') in
                    let t7 = PRIM_PutChar(' ') in
                    let t8 = PRIM_PutChar('\b') in
                    let t9 = PRIM_PutChar('\b') in
                    let t10 = PRIM_PutChar(' ') in
                    let t11 = PRIM_PutChar('\b') in
                    k t11
                  | false0 ->
                    let t3 = PRIM_PutChar('\b') in
                    let t4 = PRIM_PutChar(' ') in
                    let t5 = PRIM_PutChar('\b') in
                    k t5 in
            match t10 with
            | true1 -> k g76
            | false0 -> k g77
        | false0 ->
          let t7 = PRIM_CharOrd(t1) in
          let t8 = PRIM_EqInt(t7,8) in
          let k = [arg0,t1], fun [f2,f3] arg0 ->
            let t1 = Cons1[f3,f2] in
            g74 [t1] k in
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
let g78 = Nil0 in
let g79 = fun [arg0] k -> g74 [g78] k in
let g80 = "]" in
let g81 = "[" in
let g83 = fun [arg0,arg1] k ->
  let k = [arg1], fun [f2] arg0 ->
    let t1 = PRIM_DivInt(arg0,4) in
    let t2 = PRIM_ModInt(arg0,4) in
    let t3 = PRIM_MulInt(128,t2) in
    let k = [t1,t3], fun [f2,f3] arg0 ->
      let k = [f2,f3,arg0], fun [f2,f3,f4] arg0 ->
        let t1 = PRIM_LoadSec(f2,arg0) in
        let k = [f2,arg0], fun [f2,f3] arg0 ->
          let t1 = PRIM_FreezeBytes(f3) in
          let t2 = PRIM_StoreSec(f2,t1) in
          k t2 in
        g72 [arg0,f3,f4] k in
      PRIM_MakeBytes(512) k in
    match f2 with
    | Block0(t4) -> k t4 in
  match arg0 with
  | BI0(t1) -> k t1 in
let g84 = fun [arg0] k ->
  let k = [], fun [] arg0 ->
    let t1 = PRIM_DivInt(arg0,4) in
    let t2 = PRIM_DivInt(arg0,4) in
    let k = [arg0,t2], fun [f2,f3] arg0 ->
      let t1 = PRIM_LoadSec(f3,arg0) in
      let t2 = PRIM_FreezeBytes(arg0) in
      let t3 = PRIM_ModInt(f2,4) in
      let t4 = PRIM_MulInt(128,t3) in
      let k = [], fun [] arg0 ->
        let t1 = Block0[arg0] in
        k t1 in
      g68 [t2,t4,128] k in
    PRIM_MakeBytes(512) k in
  match arg0 with
  | BI0(t1) -> k t1 in
let g85 = fun [arg0,arg1,arg2] k ->
  let k = [arg0,arg1,arg2], fun [f2,f3,f4] arg0 ->
    let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
      let t1 = PRIM_ThawBytes(arg0) in
      let k = [f2,t1], fun [f2,f3] arg0 ->
        let t1 = PRIM_FreezeBytes(f3) in
        let t2 = Block0[t1] in
        g83 [f2,t2] k in
      g72 [t1,f3,f4] k in
    match arg0 with
    | Block0(t1) -> k t1 in
  g84 [arg0] k in
let g86 = Nil0 in
let g87 = false0 in
let g88 = true1 in
let g89 = "\n" in
let g90 = "no such inode" in
let g91 = "Error: " in
let g92 = None0 in
let g93 = None0 in
let g94 = None0 in
let g95 = None0 in
let g96 = fun [arg0] k ->
  let t1 = PRIM_CharOrd(arg0) in
  let t2 = BI0[t1] in
  k t2 in
let g97 = fun [arg0,arg1] k ->
  let k = [arg0,arg1], fun [f2,f3] arg0 ->
    let k = [f3,arg0], fun [f2,f3] arg0 ->
      let t1 = PRIM_LessInt(f3,arg0) in
      let k = [f2], fun [f2] arg0 ->
        match arg0 with
        | true1 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 -> k g92 in
                g41 [arg0] k in
              g22 [arg0] k in
            g26 [g91,arg0] k in
          g26 [g90,g89] k
        | false0 ->
          let k = [f2], fun [f2] arg0 ->
            let t1 = PRIM_DivInt(arg0,16) in
            let t2 = PRIM_AddInt(t1,1) in
            let t3 = BI0[t2] in
            let k = [f2], fun [f2] arg0 ->
              let k = [f2], fun [f2] arg0 ->
                let k = [arg0], fun [f2] arg0 ->
                  let t1 = PRIM_ModInt(arg0,16) in
                  let t2 = PRIM_MulInt(t1,8) in
                  let k = [], fun [] arg0 ->
                    let t1 = PRIM_StringIndex(arg0,0) in
                    let t2 = PRIM_StringIndex(arg0,1) in
                    let t3 = Pair0[t1,t2] in
                    let k = [arg0], fun [f2] arg0 ->
                      match arg0 with
                      | None0 -> k g94
                      | Some1(t1) ->
                        let t2 = PRIM_EqInt(t1,0) in
                        match t2 with
                        | true1 -> k g95
                        | false0 ->
                          let t3 = PRIM_SubInt(t1,1) in
                          let t4 = PRIM_EqInt(t3,0) in
                          let k = [f2,t3], fun [f2,f3] arg0 ->
                            let k = [f3,arg0], fun [f2,f3] arg0 ->
                              let k = [f2,f3], fun [f2,f3] arg0 ->
                                let k = [f2,f3], fun [f2,f3] arg0 ->
                                  let k = [f2], fun [f2] arg0 ->
                                    let t1 = Inode0[f2,arg0] in
                                    let t2 = Some1[t1] in
                                    k t2 in
                                  g11 [f3,arg0] k in
                                g2 [g96,arg0] k in
                              g22 [arg0] k in
                            g68 [f2,2,6] k in
                          match t4 with
                          | true1 -> k 0
                          | false0 ->
                            let t5 = PRIM_SubInt(t3,1) in
                            let t6 = PRIM_DivInt(t5,128) in
                            let t7 = PRIM_AddInt(1,t6) in
                            k t7 in
                    match t3 with
                    | Pair0(t4,t5) ->
                      let t6 = PRIM_CharOrd(t5) in
                      let t7 = PRIM_CharOrd(t4) in
                      let t8 = PRIM_LessInt(3,t6) in
                      match t8 with
                      | true1 -> k g93
                      | false0 ->
                        let t9 = PRIM_MulInt(256,t6) in
                        let t10 = PRIM_AddInt(t9,t7) in
                        let t11 = Some1[t10] in
                        k t11 in
                  g68 [f2,t2,8] k in
                match f2 with
                | II0(t1) -> k t1 in
              match arg0 with
              | Block0(t1) -> k t1 in
            g84 [t3] k in
          match f2 with
          | II0(t1) -> k t1 in
      match t1 with
      | true1 -> k g87
      | false0 -> k g88 in
    match f2 with
    | Super0(t1,t2,t3) -> k t3 in
  match arg1 with
  | II0(t1) -> k t1 in
let g98 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil0 -> k arg0
  | Cons1(t1,t2) ->
    let k = [t2], fun [f2] arg0 -> g98 [arg0,f2] k in
    match arg0 with
    | FS0(t3,t4,t5) ->
      let t6 = Cons1[t1,t5] in
      let t7 = FS0[t3,t4,t6] in
      k t7 in
let g99 = fun [arg0] k ->
  let k = [], fun [] arg0 ->
    let t1 = PRIM_CharChr(arg0) in
    k t1 in
  match arg0 with
  | BI0(t1) -> k t1 in
let g100 = None0 in
let g102 = Nil0 in
let g101 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil0 -> g20 [g102,arg0] k
  | Cons1(t1,t2) ->
    match t1 with
    | Pair0(t3,t4) ->
      let t5 = Cons1[t3,arg0] in
      g101 [t5,t2] k in
let g103 = " [no args]" in
let g104 = "usage: " in
let g105 = "\n" in
let g106 = "Error: " in
let g107 = Unit0 in
let g108 = fun [arg0,arg1] k ->
  let t1 = [arg0,arg1], fun [f1,f2] [arg0] k ->
    match arg0 with
    | Cons1(t1,t2) ->
      let k = [], fun [] arg0 ->
        let k = [], fun [] arg0 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 -> g41 [arg0] k in
              g22 [arg0] k in
            g26 [g106,arg0] k in
          g26 [arg0,g105] k in
        g26 [g104,arg0] k in
      g26 [f1,g103] k
    | Nil0 -> f2 [g107] k in
  let t2 = Command0[t1] in
  let t3 = Pair0[arg0,t2] in
  k t3 in
let g109 = " [int]" in
let g110 = "usage: " in
let g111 = "\n" in
let g112 = "Error: " in
let g113 = " [int]" in
let g114 = "usage: " in
let g115 = "\n" in
let g116 = "Error: " in
let g117 = " [int]" in
let g118 = "usage: " in
let g119 = "\n" in
let g120 = "Error: " in
let g121 = fun [arg0,arg1] k ->
  let t1 = [arg0,arg1], fun [f1,f2] [arg0] k ->
    match arg0 with
    | Nil0 ->
      let k = [], fun [] arg0 ->
        let k = [], fun [] arg0 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 -> g41 [arg0] k in
              g22 [arg0] k in
            g26 [g112,arg0] k in
          g26 [arg0,g111] k in
        g26 [g110,arg0] k in
      g26 [f1,g109] k
    | Cons1(t1,t2) ->
      match t2 with
      | Cons1(t3,t4) ->
        let k = [], fun [] arg0 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 -> g41 [arg0] k in
                g22 [arg0] k in
              g26 [g116,arg0] k in
            g26 [arg0,g115] k in
          g26 [g114,arg0] k in
        g26 [f1,g113] k
      | Nil0 ->
        let k = [f1,f2], fun [f2,f3] arg0 ->
          match arg0 with
          | None0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 ->
                  let k = [], fun [] arg0 ->
                    let k = [], fun [] arg0 -> g41 [arg0] k in
                    g22 [arg0] k in
                  g26 [g120,arg0] k in
                g26 [arg0,g119] k in
              g26 [g118,arg0] k in
            g26 [f2,g117] k
          | Some1(t1) -> f3 [t1] k in
        g40 [t1] k in
  let t2 = Command0[t1] in
  let t3 = Pair0[arg0,t2] in
  k t3 in
let g122 = " [int] [int]" in
let g123 = "usage: " in
let g124 = "\n" in
let g125 = "Error: " in
let g126 = " [int] [int]" in
let g127 = "usage: " in
let g128 = "\n" in
let g129 = "Error: " in
let g130 = " [int] [int]" in
let g131 = "usage: " in
let g132 = "\n" in
let g133 = "Error: " in
let g134 = " [int] [int]" in
let g135 = "usage: " in
let g136 = "\n" in
let g137 = "Error: " in
let g138 = " [int] [int]" in
let g139 = "usage: " in
let g140 = "\n" in
let g141 = "Error: " in
let g142 = fun [arg0,arg1] k ->
  let t1 = [arg0,arg1], fun [f1,f2] [arg0] k ->
    match arg0 with
    | Nil0 ->
      let k = [], fun [] arg0 ->
        let k = [], fun [] arg0 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 -> g41 [arg0] k in
              g22 [arg0] k in
            g26 [g125,arg0] k in
          g26 [arg0,g124] k in
        g26 [g123,arg0] k in
      g26 [f1,g122] k
    | Cons1(t1,t2) ->
      match t2 with
      | Nil0 ->
        let k = [], fun [] arg0 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 -> g41 [arg0] k in
                g22 [arg0] k in
              g26 [g129,arg0] k in
            g26 [arg0,g128] k in
          g26 [g127,arg0] k in
        g26 [f1,g126] k
      | Cons1(t3,t4) ->
        match t4 with
        | Cons1(t5,t6) ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 ->
                  let k = [], fun [] arg0 -> g41 [arg0] k in
                  g22 [arg0] k in
                g26 [g133,arg0] k in
              g26 [arg0,g132] k in
            g26 [g131,arg0] k in
          g26 [f1,g130] k
        | Nil0 ->
          let k = [f1,f2,t3], fun [f2,f3,f4] arg0 ->
            match arg0 with
            | None0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 ->
                  let k = [], fun [] arg0 ->
                    let k = [], fun [] arg0 ->
                      let k = [], fun [] arg0 -> g41 [arg0] k in
                      g22 [arg0] k in
                    g26 [g137,arg0] k in
                  g26 [arg0,g136] k in
                g26 [g135,arg0] k in
              g26 [f2,g134] k
            | Some1(t1) ->
              let k = [f2,f3,t1], fun [f2,f3,f4] arg0 ->
                match arg0 with
                | None0 ->
                  let k = [], fun [] arg0 ->
                    let k = [], fun [] arg0 ->
                      let k = [], fun [] arg0 ->
                        let k = [], fun [] arg0 ->
                          let k = [], fun [] arg0 -> g41 [arg0] k in
                          g22 [arg0] k in
                        g26 [g141,arg0] k in
                      g26 [arg0,g140] k in
                    g26 [g139,arg0] k in
                  g26 [f2,g138] k
                | Some1(t1) -> f3 [f4,t1] k in
              g40 [f4] k in
          g40 [t1] k in
  let t2 = Command0[t1] in
  let t3 = Pair0[arg0,t2] in
  k t3 in
let g143 = Unit0 in
let g144 = false0 in
let g145 = "\n" in
let g146 = "\n" in
let g147 = "no filesystem mounted; try mount" in
let g148 = "Error: " in
let g149 = "\n" in
let g150 = "inode is not allocated (no such file)" in
let g151 = "Error: " in
let g152 = Nil0 in
let g153 = Nil0 in
let g154 = None0 in
let g155 = "\n" in
let g156 = "no blocks available (disk is full)" in
let g157 = "Error: " in
let g158 = Nil0 in
let g159 = Nil0 in
let g160 = "" in
let g162 = Nil0 in
let g163 = "" in
let g161 = fun [arg0,arg1] k ->
  let t1 = PRIM_StringLength(arg1) in
  let t2 = PRIM_EqInt(t1,0) in
  match t2 with
  | true1 -> g20 [g162,arg0] k
  | false0 ->
    let t3 = PRIM_StringLength(arg1) in
    let t4 = PRIM_LessInt(128,t3) in
    let k = [arg0,arg1,t3], fun [f2,f3,f4] arg0 ->
      let t1 = PRIM_LessInt(128,f4) in
      let k = [f2,arg0], fun [f2,f3] arg0 ->
        let t1 = Cons1[f3,f2] in
        g161 [t1,arg0] k in
      match t1 with
      | true1 ->
        let t2 = PRIM_SubInt(f4,128) in
        g68 [f3,128,t2] k
      | false0 -> k g163 in
    match t4 with
    | true1 -> g68 [arg1,0,128] k
    | false0 -> k arg1 in
let g164 = Nil0 in
let g165 = None0 in
let g166 = "\n" in
let g167 = "no blocks available (disk is full)" in
let g168 = "Error: " in
let g169 = false0 in
let g170 = true1 in
let g171 = Unit0 in
let g172 = Nil0 in
let g173 = Nil0 in
let g174 = Unit0 in
let g175 = "dump      : Display the raw data on disk." in
let g176 = "sector I  : Display the raw data in disk sector I." in
let g177 = "format    : Prepare disk with an empty filesystem; trashing existing contents." in
let g178 = "mount     : Discover an existing filesystem; allow files to be accessed." in
let g179 = "unmount   : Unmount the existing filesystem; required before format." in
let g180 = "debug     : Display internal information about a mounted filesystem." in
let g181 = "ls        : List all files together with their sizes." in
let g182 = "stat I    : Display internal information about inode(file) I." in
let g183 = "cat I     : Display the contents of file I." in
let g184 = "rm I      : Remove file F; returning resources for reuse." in
let g185 = "create    : Create new file; lines read from input." in
let g186 = "append I  : Append to existing file I; lines read from input." in
let g187 = "splat I N : Overwrite existing file I from offset N; lines read from input." in
let g188 = "wipe      : Wipe disk; fill it with commas." in
let g189 = Nil0 in
let g190 = Cons1[g188,g189] in
let g191 = Cons1[g187,g190] in
let g192 = Cons1[g186,g191] in
let g193 = Cons1[g185,g192] in
let g194 = Cons1[g184,g193] in
let g195 = Cons1[g183,g194] in
let g196 = Cons1[g182,g195] in
let g197 = Cons1[g181,g196] in
let g198 = Cons1[g180,g197] in
let g199 = Cons1[g179,g198] in
let g200 = Cons1[g178,g199] in
let g201 = Cons1[g177,g200] in
let g202 = Cons1[g176,g201] in
let g203 = Cons1[g175,g202] in
let g204 = fun [arg0] k ->
  let k = [], fun [] arg0 ->
    let k = [], fun [] arg0 ->
      let t1 = PRIM_PutChar('\n') in
      k t1 in
    g41 [arg0] k in
  g22 [arg0] k in
let g205 = fun [arg0] k -> g7 [g204,g203] k in
let g206 = "help" in
let g208 = false0 in
let g209 = true1 in
let g210 = Unit0 in
let g211 = false0 in
let g212 = true1 in
let g213 = Unit0 in
let g214 = "\\n" in
let g215 = Unit0 in
let g207 = fun [arg0] k ->
  let t1 = PRIM_LessInt(arg0,10) in
  let k = [arg0], fun [f2] arg0 ->
    match arg0 with
    | true1 -> k g210
    | false0 ->
      let k = [f2], fun [f2] arg0 ->
        let t1 = PRIM_LoadSec(f2,arg0) in
        let t2 = PRIM_FreezeBytes(arg0) in
        let t3 = [t2], fun [f1] me [arg0] k ->
          let t1 = PRIM_LessInt(arg0,512) in
          let k = [f1,arg0,me], fun [f2,f3,f4] arg0 ->
            match arg0 with
            | true1 -> k g213
            | false0 ->
              let t1 = PRIM_StringIndex(f2,f3) in
              let t2 = PRIM_EqChar(t1,'\n') in
              let k = [f3,f4], fun [f2,f3] arg0 ->
                let t1 = PRIM_AddInt(f2,1) in
                let t2 = PRIM_ModInt(t1,128) in
                let t3 = PRIM_EqInt(t2,0) in
                let k = [f2,f3], fun [f2,f3] arg0 ->
                  let t1 = PRIM_AddInt(f2,1) in
                  f3 [t1] k in
                match t3 with
                | true1 ->
                  let t4 = PRIM_PutChar('\n') in
                  k t4
                | false0 -> k g215 in
              match t2 with
              | true1 ->
                let k = [], fun [] arg0 -> g41 [arg0] k in
                g22 [g214] k
              | false0 ->
                let t3 = PRIM_CharOrd(t1) in
                let t4 = PRIM_EqInt(t3,8) in
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
          match t1 with
          | true1 -> k g211
          | false0 -> k g212 in
        let k = [f2], fun [f2] arg0 ->
          let t1 = PRIM_AddInt(f2,1) in
          g207 [t1] k in
        t3 [0] k in
      PRIM_MakeBytes(512) k in
  match t1 with
  | true1 -> k g208
  | false0 -> k g209 in
let g216 = fun [arg0] k -> g207 [0] k in
let g217 = "dump" in
let g218 = false0 in
let g219 = true1 in
let g220 = Unit0 in
let g221 = "\\n" in
let g222 = Unit0 in
let g223 = fun [arg0] k ->
  let k = [arg0], fun [f2] arg0 ->
    let t1 = PRIM_LoadSec(f2,arg0) in
    let t2 = PRIM_FreezeBytes(arg0) in
    let t3 = [t2], fun [f1] me [arg0] k ->
      let t1 = PRIM_LessInt(arg0,512) in
      let k = [f1,arg0,me], fun [f2,f3,f4] arg0 ->
        match arg0 with
        | true1 -> k g220
        | false0 ->
          let t1 = PRIM_StringIndex(f2,f3) in
          let t2 = PRIM_EqChar(t1,'\n') in
          let k = [f3,f4], fun [f2,f3] arg0 ->
            let t1 = PRIM_AddInt(f2,1) in
            let t2 = PRIM_ModInt(t1,128) in
            let t3 = PRIM_EqInt(t2,0) in
            let k = [f2,f3], fun [f2,f3] arg0 ->
              let t1 = PRIM_AddInt(f2,1) in
              f3 [t1] k in
            match t3 with
            | true1 ->
              let t4 = PRIM_PutChar('\n') in
              k t4
            | false0 -> k g222 in
          match t2 with
          | true1 ->
            let k = [], fun [] arg0 -> g41 [arg0] k in
            g22 [g221] k
          | false0 ->
            let t3 = PRIM_CharOrd(t1) in
            let t4 = PRIM_EqInt(t3,8) in
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
      match t1 with
      | true1 -> k g218
      | false0 -> k g219 in
    t3 [0] k in
  PRIM_MakeBytes(512) k in
let g224 = "sector" in
let g225 = "\n" in
let g226 = "cannot format a mounted filesystem; try unmount" in
let g227 = "Error: " in
let g228 = Nil0 in
let g229 = "BARE" in
let g230 = None0 in
let g231 = "format" in
let g232 = "\n" in
let g233 = "filesystem already mounted" in
let g234 = "Error: " in
let g235 = "BARE" in
let g236 = false0 in
let g237 = true1 in
let g238 = None0 in
let g239 = None0 in
let g240 = Nil0 in
let g241 = false0 in
let g242 = true1 in
let g243 = fun [arg0,arg1] k ->
  let t1 = [arg1], fun [f1] [arg0] k ->
    let k = [f1], fun [f2] arg0 ->
      let k = [arg0], fun [f2] arg0 ->
        let t1 = PRIM_EqInt(f2,arg0) in
        match t1 with
        | true1 -> k g241
        | false0 -> k g242 in
      match f2 with
      | BI0(t1) -> k t1 in
    match arg0 with
    | BI0(t1) -> k t1 in
  g4 [t1,arg0] k in
let g244 = fun [arg0] k ->
  let t1 = BI0[arg0] in
  k t1 in
let g245 = Nil0 in
let g246 = "\n" in
let g247 = "no filesystem found; try format" in
let g248 = "Error: " in
let g249 = "mount" in
let g250 = "\n" in
let g251 = "no filesystem mounted; try mount" in
let g252 = "Error: " in
let g253 = None0 in
let g254 = "unmount" in
let g255 = "\n" in
let g256 = "no filesystem mounted; try mount" in
let g257 = "Error: " in
let g258 = "Filesystem found:\n" in
let g259 = "\n" in
let g260 = ", #inodes=" in
let g261 = ", #admin-blocks=1+" in
let g262 = "#blocks=" in
let g263 = "- superblock: " in
let g264 = "\n" in
let g265 = "- #free-blocks = " in
let g266 = "\n" in
let g267 = "- #free-inodes = " in
let g268 = "debug" in
let g269 = "\n" in
let g270 = "no filesystem mounted; try mount" in
let g271 = "Error: " in
let g272 = Unit0 in
let g273 = "\n" in
let g274 = " : " in
let g275 = "file " in
let g276 = "ls" in
let g277 = "\n" in
let g278 = "no filesystem mounted; try mount" in
let g279 = "Error: " in
let g280 = "\n" in
let g281 = "unallocated" in
let g282 = "]" in
let g283 = "B" in
let g284 = fun [arg0] k ->
  let k = [], fun [] arg0 ->
    let k = [], fun [] arg0 -> g26 [g283,arg0] k in
    g31 [arg0] k in
  match arg0 with
  | BI0(t1) -> k t1 in
let g285 = "," in
let g286 = ", blocks=[" in
let g287 = "Inode: size=" in
let g288 = " : " in
let g289 = "I" in
let g290 = "stat" in
let g291 = "\n" in
let g292 = "no filesystem mounted; try mount" in
let g293 = "Error: " in
let g294 = "\n" in
let g295 = "inode is not allocated (no such file)" in
let g296 = "Error: " in
let g297 = false0 in
let g298 = true1 in
let g299 = false0 in
let g300 = true1 in
let g301 = Unit0 in
let g302 = "cat" in
let g303 = "\n" in
let g304 = "no filesystem mounted; try mount" in
let g305 = "Error: " in
let g306 = "\n" in
let g307 = "inode is not allocated (no such file)" in
let g308 = "Error: " in
let g309 = None0 in
let g310 = Unit0 in
let g311 = "rm" in
let g312 = "\n" in
let g313 = "no filesystem mounted; try mount" in
let g314 = "Error: " in
let g315 = None0 in
let g316 = None0 in
let g317 = "\n" in
let g318 = "no inodes available (too many files)" in
let g319 = "Error: " in
let g320 = None0 in
let g321 = Nil0 in
let g322 = Unit0 in
let g323 = "; (to finish type ^D)\n" in
let g324 = "Creating file " in
let g325 = "create" in
let g326 = "; (to finish type ^D)\n" in
let g327 = "Appending to file " in
let g328 = "\n" in
let g329 = "no filesystem mounted; try mount" in
let g330 = "Error: " in
let g331 = None0 in
let g332 = "\n" in
let g333 = "inode is not allocated (no such file)" in
let g334 = "Error: " in
let g335 = None0 in
let g336 = Unit0 in
let g337 = "append" in
let g338 = "; (to finish type ^D)\n" in
let g339 = " from offset " in
let g340 = "Overwriting file " in
let g341 = "splat" in
let g342 = false0 in
let g343 = true1 in
let g344 = Unit0 in
let g345 = false0 in
let g346 = true1 in
let g347 = Unit0 in
let g348 = fun [arg0] k ->
  let k = [], fun [] arg0 ->
    let t1 = [arg0], fun [f1] me [arg0] k ->
      let t1 = PRIM_LessInt(arg0,512) in
      let k = [f1,arg0,me], fun [f2,f3,f4] arg0 ->
        match arg0 with
        | true1 -> k g344
        | false0 ->
          let t1 = PRIM_SetBytes(f2,f3,',') in
          let t2 = PRIM_AddInt(f3,1) in
          f4 [t2] k in
      match t1 with
      | true1 -> k g342
      | false0 -> k g343 in
    let k = [arg0], fun [f2] arg0 ->
      let t1 = PRIM_FreezeBytes(f2) in
      let t2 = [t1], fun [f1] me [arg0] k ->
        let t1 = PRIM_LessInt(arg0,10) in
        let k = [f1,arg0,me], fun [f2,f3,f4] arg0 ->
          match arg0 with
          | true1 -> k g347
          | false0 ->
            let t1 = PRIM_StoreSec(f3,f2) in
            let t2 = PRIM_AddInt(f3,1) in
            f4 [t2] k in
        match t1 with
        | true1 -> k g345
        | false0 -> k g346 in
      t2 [0] k in
    t1 [0] k in
  PRIM_MakeBytes(512) k in
let g349 = "wipe" in
let g350 = Nil0 in
let g351 = "> " in
let g352 = Unit0 in
let g353 = "exiting\n" in
let g354 = Nil0 in
let g355 = Nil0 in
let g356 = Unit0 in
let g357 = None0 in
let g358 = " : command not found" in
let g359 = "\n" in
let g360 = "Error: " in
let g361 = Nil0 in
let g362 = "Filesystem explorer" in
let g363 = "- sector_size: " in
let g364 = "- #sectors_on_disk: " in
let g365 = "- addressable disk: " in
let g366 = "- block_size: " in
let g367 = "- #blocks_on_disk: " in
let g368 = "- max_file_size (6 blocks): " in
let g369 = "\n" in
let g370 = " " in
let g371 = "Try: " in
let t1 = PRIM_MakeRef(g43) in
let t2 = [t1], fun [f1] [arg0] k ->
  let t1 = PRIM_DeRef(f1) in
  match t1 with
  | true1 ->
    let k = [], fun [] arg0 ->
      let k = [], fun [] arg0 ->
        let k = [], fun [] arg0 -> g41 [arg0] k in
        g22 [arg0] k in
      g26 [g45,arg0] k in
    g26 [arg0,g44] k
  | false0 -> k g46 in
let t3 = Cons1['\EOT',g73] in
let k = [], fun [] arg0 ->
  let t1 = Cons1['\NUL',g86] in
  let t2 = Cons1['\NUL',t1] in
  let k = [arg0], fun [f2] arg0 ->
    let t1 = [arg0], fun [f1] [arg0,arg1,arg2] k ->
      let k = [f1,arg1,arg2], fun [f2,f3,f4] arg0 ->
        let t1 = PRIM_DivInt(arg0,16) in
        let t2 = PRIM_AddInt(t1,1) in
        let t3 = BI0[t2] in
        let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
          let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
            let k = [f3,arg0], fun [f2,f3] arg0 ->
              let k = [f2,f3,arg0], fun [f2,f3,f4] arg0 ->
                let t1 = PRIM_ModInt(arg0,16) in
                let t2 = PRIM_MulInt(t1,8) in
                let t3 = PRIM_ThawBytes(f3) in
                let k = [f2,t3], fun [f2,f3] arg0 ->
                  let t1 = PRIM_FreezeBytes(f3) in
                  let k = [t1], fun [f2] arg0 ->
                    let t1 = PRIM_DivInt(arg0,16) in
                    let t2 = Block0[f2] in
                    let t3 = PRIM_AddInt(t1,1) in
                    let t4 = BI0[t3] in
                    g83 [t4,t2] k in
                  match f2 with
                  | II0(t2) -> k t2 in
                g72 [t3,t2,f4] k in
              match f2 with
              | II0(t1) -> k t1 in
            match f4 with
            | None0 -> k f2
            | Some1(t1) ->
              match t1 with
              | Inode0(t2,t3) ->
                let t4 = PRIM_AddInt(1,t2) in
                let t5 = PRIM_DivInt(t4,256) in
                let t6 = PRIM_ModInt(t4,256) in
                let t7 = PRIM_CharChr(t6) in
                let t8 = PRIM_CharChr(t5) in
                let k = [t7,t8], fun [f2,f3] arg0 ->
                  let t1 = Cons1[f3,arg0] in
                  let t2 = Cons1[f2,t1] in
                  g24 [t2] k in
                g2 [g99,t3] k in
          match arg0 with
          | Block0(t1) -> k t1 in
        g84 [t3] k in
      match arg1 with
      | II0(t1) -> k t1 in
    let t2 = PRIM_MakeRef(g100) in
    let t3 = [t1,t2], fun [f1,f2] me [arg0,arg1] k ->
      let k = [f1,f2,arg0,me,arg1], fun [f2,f3,f4,f5,f6] arg0 ->
        let t1 = PRIM_StringLength(arg0) in
        let t2 = PRIM_LessInt(0,t1) in
        let k = [f2,f3,f4,f5,f6,arg0,t1], fun [f2,f3,f4,f5,f6,f7,f8] arg0 ->
          let k = [f2,f3,f4,f5,f6,arg0], fun [f2,f3,f4,f5,f6,f7] arg0 ->
            let t1 = PRIM_DeRef(f3) in
            let k = [f4,f5,f6,f7,arg0], fun [f2,f3,f4,f5,f6] arg0 ->
              match f5 with
              | true1 -> k g174
              | false0 ->
                let t1 = PRIM_StringLength(f6) in
                let t2 = PRIM_AddInt(f4,t1) in
                f3 [f2,t2] k in
            match t1 with
            | None0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 ->
                  let k = [], fun [] arg0 -> g41 [arg0] k in
                  g22 [arg0] k in
                g26 [g148,arg0] k in
              g26 [g147,g146] k
            | Some1(t2) ->
              let k = [f2,f3,f4,f6,arg0,t2], fun [f2,f3,f4,f5,f6,f7] arg0 ->
                let k = [f2,f3,f4,f5,f6,f7,arg0], fun [f2,f3,f4,f5,f6,f7,f8] arg0 ->
                  match arg0 with
                  | None0 ->
                    let k = [], fun [] arg0 ->
                      let k = [], fun [] arg0 ->
                        let k = [], fun [] arg0 -> g41 [arg0] k in
                        g22 [arg0] k in
                      g26 [g151,arg0] k in
                    g26 [g150,g149] k
                  | Some1(t1) ->
                    let k = [f2,f3,f4,f5,f6,f7,f8,t1], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg0 ->
                      let t1 = PRIM_StringLength(f6) in
                      let t2 = PRIM_AddInt(f5,t1) in
                      let t3 = PRIM_LessInt(arg0,t2) in
                      let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg0 ->
                        let t1 = [f2,f3,f4,f8,arg0], fun [f1,f2,f3,f4,f5] me [arg0,arg1,arg2,arg3,arg4] k ->
                          match arg4 with
                          | Nil0 ->
                            let k = [f1,f2,f3,f4,f5,arg0,arg2], fun [f2,f3,f4,f5,f6,f7,f8] arg0 ->
                              let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg0 ->
                                let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg0 ->
                                  let t1 = Inode0[f6,arg0] in
                                  let t2 = Some1[t1] in
                                  let k = [f3,f7], fun [f2,f3] arg0 ->
                                    let t1 = Some1[f3] in
                                    let t2 = PRIM_SetRef(f2,t1) in
                                    k t2 in
                                  f2 [f5,f4,t2] k in
                                g20 [f8,arg0] k in
                              g20 [g153,arg0] k in
                            g20 [g152,arg1] k
                          | Cons1(t1,t2) ->
                            match arg2 with
                            | Cons1(t3,t4) ->
                              let k = [arg0,me,arg1,t2,t3,t4], fun [f2,f3,f4,f5,f6,f7] arg0 ->
                                let t1 = Cons1[f6,f4] in
                                f3 [f2,t1,f7,0,f5] k in
                              g85 [t3,arg3,t1] k
                            | Nil0 ->
                              let k = [me,arg1,arg3,t1,t2], fun [f2,f3,f4,f5,f6] arg0 ->
                                match arg0 with
                                | None0 ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 ->
                                      let k = [], fun [] arg0 -> g41 [arg0] k in
                                      g22 [arg0] k in
                                    g26 [g157,arg0] k in
                                  g26 [g156,g155] k
                                | Some1(t1) ->
                                  match t1 with
                                  | Pair0(t2,t3) ->
                                    let k = [f2,f3,f6,t2,t3], fun [f2,f3,f4,f5,f6] arg0 ->
                                      let t1 = Cons1[f6,f3] in
                                      f2 [f5,t1,g158,0,f4] k in
                                    g85 [t3,f4,f5] k in
                              match arg0 with
                              | FS0(t3,t4,t5) ->
                                match t5 with
                                | Nil0 -> k g154
                                | Cons1(t6,t7) ->
                                  let t8 = FS0[t3,t4,t7] in
                                  let t9 = Pair0[t8,t6] in
                                  let t10 = Some1[t9] in
                                  k t10 in
                        let t2 = PRIM_ModInt(f5,128) in
                        let t3 = PRIM_SubInt(128,t2) in
                        let t4 = PRIM_StringLength(f6) in
                        let t5 = PRIM_EqInt(t4,0) in
                        let k = [f5,f7,f9,t1], fun [f2,f3,f4,f5] arg0 ->
                          let t1 = [f2,f5,arg0], fun [f1,f2,f3] me [arg0,arg1,arg2,arg3] k ->
                            let t1 = PRIM_EqInt(arg0,0) in
                            match t1 with
                            | true1 ->
                              let t2 = PRIM_ModInt(f1,128) in
                              f2 [arg1,arg2,arg3,t2,f3] k
                            | false0 ->
                              match arg3 with
                              | Cons1(t2,t3) ->
                                let t4 = Cons1[t2,arg2] in
                                let t5 = PRIM_SubInt(arg0,1) in
                                me [t5,arg1,t4,t3] k
                              | Nil0 ->
                                let k = [arg0,me,arg2], fun [f2,f3,f4] arg0 ->
                                  match arg0 with
                                  | None0 ->
                                    let k = [], fun [] arg0 ->
                                      let k = [], fun [] arg0 ->
                                        let k = [], fun [] arg0 -> g41 [arg0] k in
                                        g22 [arg0] k in
                                      g26 [g168,arg0] k in
                                    g26 [g167,g166] k
                                  | Some1(t1) ->
                                    match t1 with
                                    | Pair0(t2,t3) ->
                                      let k = [f2,f3,f4,t2,t3], fun [f2,f3,f4,f5,f6] arg0 ->
                                        let t1 = [arg0], fun [f1] me [arg0] k ->
                                          let t1 = PRIM_LessInt(arg0,128) in
                                          let k = [f1,arg0,me], fun [f2,f3,f4] arg0 ->
                                            match arg0 with
                                            | true1 -> k g171
                                            | false0 ->
                                              let t1 = PRIM_SetBytes(f2,f3,'\NUL') in
                                              let t2 = PRIM_AddInt(f3,1) in
                                              f4 [t2] k in
                                          match t1 with
                                          | true1 -> k g169
                                          | false0 -> k g170 in
                                        let k = [f2,f3,f4,f5,f6,arg0], fun [f2,f3,f4,f5,f6,f7] arg0 ->
                                          let t1 = PRIM_FreezeBytes(f7) in
                                          let t2 = Block0[t1] in
                                          let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg0 ->
                                            let t1 = Cons1[f6,f4] in
                                            let t2 = PRIM_SubInt(f2,1) in
                                            f3 [t2,f5,t1,g172] k in
                                          g83 [f6,t2] k in
                                        t1 [0] k in
                                      PRIM_MakeBytes(128) k in
                                match arg1 with
                                | FS0(t2,t3,t4) ->
                                  match t4 with
                                  | Nil0 -> k g165
                                  | Cons1(t5,t6) ->
                                    let t7 = FS0[t2,t3,t6] in
                                    let t8 = Pair0[t7,t5] in
                                    let t9 = Some1[t8] in
                                    k t9 in
                          let k = [f2,f3,t1], fun [f2,f3,f4] arg0 ->
                            let t1 = PRIM_DivInt(f2,128) in
                            f4 [t1,f3,g173,arg0] k in
                          match f4 with
                          | Inode0(t2,t3) -> k t3 in
                        match t5 with
                        | true1 -> k g159
                        | false0 ->
                          let t6 = PRIM_StringLength(f6) in
                          let t7 = PRIM_LessInt(t3,t6) in
                          let k = [f6,t3,t6], fun [f2,f3,f4] arg0 ->
                            let t1 = PRIM_LessInt(f3,f4) in
                            let k = [arg0], fun [f2] arg0 ->
                              let k = [f2], fun [f2] arg0 ->
                                let t1 = Cons1[f2,arg0] in
                                k t1 in
                              g161 [g164,arg0] k in
                            match t1 with
                            | true1 ->
                              let t2 = PRIM_SubInt(f4,f3) in
                              g68 [f2,f3,t2] k
                            | false0 -> k g160 in
                          match t7 with
                          | true1 -> g68 [f6,0,t3] k
                          | false0 -> k f6 in
                      match t3 with
                      | true1 -> k t2
                      | false0 -> k arg0 in
                    match t1 with
                    | Inode0(t2,t3) -> k t2 in
                g97 [arg0,f4] k in
              match t2 with
              | FS0(t3,t4,t5) -> k t3 in
          match arg0 with
          | true1 ->
            let t1 = PRIM_SubInt(f8,1) in
            g68 [f7,0,t1] k
          | false0 -> g26 [f7,g145] k in
        match t2 with
        | true1 ->
          let t3 = PRIM_SubInt(t1,1) in
          let t4 = PRIM_StringIndex(arg0,t3) in
          let t5 = PRIM_EqChar(t4,'\EOT') in
          k t5
        | false0 -> k g144 in
      g79 [g143] k in
    let k = [f2,t1,t2,t3], fun [f2,f3,f4,f5] arg0 ->
      let k = [f2,arg0,f3,f4,f5], fun [f2,f3,f4,f5,f6] arg0 ->
        let k = [f2,f3,f4,f5,arg0,f6], fun [f2,f3,f4,f5,f6,f7] arg0 ->
          let t1 = [f4,f5], fun [f1,f2] [arg0] k ->
            let t1 = PRIM_DeRef(f2) in
            match t1 with
            | Some1(t2) ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 ->
                  let k = [], fun [] arg0 -> g41 [arg0] k in
                  g22 [arg0] k in
                g26 [g227,arg0] k in
              g26 [g226,g225] k
            | None0 ->
              let t2 = Cons1['P',g228] in
              let t3 = Cons1['\ENQ',t2] in
              let t4 = Cons1['(',t3] in
              let k = [f1], fun [f2] arg0 ->
                let k = [f2], fun [f2] arg0 ->
                  let t1 = Block0[arg0] in
                  let t2 = BI0[0] in
                  let k = [f2], fun [f2] arg0 ->
                    let k = [f2], fun [f2] arg0 ->
                      let t1 = [f2], fun [f1] [arg0] k ->
                        let t1 = II0[arg0] in
                        let t2 = Super0[40,5,80] in
                        f1 [t2,t1,g230] k in
                      g7 [t1,arg0] k in
                    g9 [0,79] k in
                  g83 [t2,t1] k in
                g26 [g229,arg0] k in
              g24 [t4] k in
          let k = [f2,f3,f4,f5,f6,arg0,f7], fun [f2,f3,f4,f5,f6,f7,f8] arg0 ->
            let t1 = [f5], fun [f1] [arg0] k ->
              let t1 = PRIM_DeRef(f1) in
              match t1 with
              | Some1(t2) ->
                let k = [], fun [] arg0 ->
                  let k = [], fun [] arg0 ->
                    let k = [], fun [] arg0 -> g41 [arg0] k in
                    g22 [arg0] k in
                  g26 [g234,arg0] k in
                g26 [g233,g232] k
              | None0 ->
                let t2 = BI0[0] in
                let k = [f1], fun [f2] arg0 ->
                  let k = [f2], fun [f2] arg0 ->
                    let k = [f2,arg0], fun [f2,f3] arg0 ->
                      let k = [f2,f3], fun [f2,f3] arg0 ->
                        let k = [f2,f3], fun [f2,f3] arg0 ->
                          let k = [f2], fun [f2] arg0 ->
                            let k = [f2], fun [f2] arg0 ->
                              match arg0 with
                              | None0 ->
                                let k = [], fun [] arg0 ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 -> g41 [arg0] k in
                                    g22 [arg0] k in
                                  g26 [g248,arg0] k in
                                g26 [g247,g246] k
                              | Some1(t1) ->
                                let t2 = Some1[t1] in
                                let t3 = PRIM_SetRef(f2,t2) in
                                k t3 in
                            match arg0 with
                            | None0 -> k g239
                            | Some1(t1) ->
                              match t1 with
                              | Super0(t2,t3,t4) ->
                                let t5 = [t1,t4], fun [f1,f2] me [arg0,arg1,arg2] k ->
                                  let t1 = PRIM_EqInt(arg2,f2) in
                                  match t1 with
                                  | true1 ->
                                    let k = [f1,arg0], fun [f2,f3] arg0 ->
                                      let t1 = FS0[f2,arg0,f3] in
                                      let t2 = Some1[t1] in
                                      k t2 in
                                    g20 [g240,arg1] k
                                  | false0 ->
                                    let t2 = II0[arg2] in
                                    let k = [arg0,me,arg1,arg2], fun [f2,f3,f4,f5] arg0 ->
                                      match arg0 with
                                      | None0 ->
                                        let t1 = PRIM_AddInt(f5,1) in
                                        let t2 = II0[f5] in
                                        let t3 = Cons1[t2,f4] in
                                        f3 [f2,t3,t1] k
                                      | Some1(t1) ->
                                        match t1 with
                                        | Inode0(t2,t3) ->
                                          let t4 = PRIM_AddInt(f5,1) in
                                          let k = [t4,f3,f4], fun [f2,f3,f4] arg0 -> f3 [arg0,f4,f2] k in
                                          g6 [g243,f2,t3] k in
                                    g97 [f1,t2] k in
                                let t6 = PRIM_AddInt(1,t3) in
                                let t7 = PRIM_SubInt(t2,1) in
                                let k = [t5], fun [f2] arg0 ->
                                  let k = [f2], fun [f2] arg0 -> f2 [arg0,g245,0] k in
                                  g2 [g244,arg0] k in
                                g9 [t6,t7] k in
                          match arg0 with
                          | true1 -> k g238
                          | false0 ->
                            let t1 = PRIM_StringIndex(f3,4) in
                            let t2 = PRIM_StringIndex(f3,5) in
                            let t3 = PRIM_StringIndex(f3,6) in
                            let t4 = PRIM_CharOrd(t1) in
                            let t5 = PRIM_CharOrd(t2) in
                            let t6 = PRIM_CharOrd(t3) in
                            let t7 = Super0[t4,t5,t6] in
                            let t8 = Some1[t7] in
                            k t8 in
                        match arg0 with
                        | true1 -> k g236
                        | false0 -> k g237 in
                      g56 [arg0,g235] k in
                    g68 [arg0,0,4] k in
                  match arg0 with
                  | Block0(t1) -> k t1 in
                g84 [t2] k in
            let k = [f2,f3,f4,f5,f6,f7,arg0,f8], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg0 ->
              let t1 = [f5], fun [f1] [arg0] k ->
                let t1 = PRIM_DeRef(f1) in
                match t1 with
                | None0 ->
                  let k = [], fun [] arg0 ->
                    let k = [], fun [] arg0 ->
                      let k = [], fun [] arg0 -> g41 [arg0] k in
                      g22 [arg0] k in
                    g26 [g252,arg0] k in
                  g26 [g251,g250] k
                | Some1(t2) ->
                  let t3 = PRIM_SetRef(f1,g253) in
                  k t3 in
              let k = [f2,f3,f4,f5,f6,f7,f8,arg0,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg0 ->
                let t1 = [f5], fun [f1] [arg0] k ->
                  let t1 = PRIM_DeRef(f1) in
                  match t1 with
                  | None0 ->
                    let k = [], fun [] arg0 ->
                      let k = [], fun [] arg0 ->
                        let k = [], fun [] arg0 -> g41 [arg0] k in
                        g22 [arg0] k in
                      g26 [g257,arg0] k in
                    g26 [g256,g255] k
                  | Some1(t2) ->
                    match t2 with
                    | FS0(t3,t4,t5) ->
                      let k = [t3,t4,t5], fun [f2,f3,f4] arg0 ->
                        let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                          let k = [f3,f4], fun [f2,f3] arg0 ->
                            let k = [f2,f3], fun [f2,f3] arg0 ->
                              let k = [f2,f3], fun [f2,f3] arg0 ->
                                let k = [f2,f3], fun [f2,f3] arg0 ->
                                  let k = [f2,f3], fun [f2,f3] arg0 ->
                                    let k = [f2], fun [f2] arg0 ->
                                      let k = [f2], fun [f2] arg0 ->
                                        let k = [f2], fun [f2] arg0 ->
                                          let k = [f2], fun [f2] arg0 ->
                                            let k = [f2], fun [f2] arg0 ->
                                              let k = [f2], fun [f2] arg0 ->
                                                let k = [], fun [] arg0 ->
                                                  let k = [], fun [] arg0 ->
                                                    let k = [], fun [] arg0 ->
                                                      let k = [], fun [] arg0 ->
                                                        let k = [], fun [] arg0 -> g41 [arg0] k in
                                                        g22 [arg0] k in
                                                      g26 [g267,arg0] k in
                                                    g26 [arg0,g266] k in
                                                  g31 [arg0] k in
                                                g1 [f2] k in
                                              g41 [arg0] k in
                                            g22 [arg0] k in
                                          g26 [g265,arg0] k in
                                        g26 [arg0,g264] k in
                                      g31 [arg0] k in
                                    g1 [f3] k in
                                  g41 [arg0] k in
                                g22 [arg0] k in
                              g26 [g263,arg0] k in
                            g26 [arg0,g259] k in
                          match f2 with
                          | Super0(t1,t2,t3) ->
                            let k = [t1,t2], fun [f2,f3] arg0 ->
                              let k = [f2,f3], fun [f2,f3] arg0 ->
                                let k = [arg0,f2], fun [f2,f3] arg0 ->
                                  let k = [f3], fun [f2] arg0 ->
                                    let k = [f2], fun [f2] arg0 ->
                                      let k = [arg0], fun [f2] arg0 ->
                                        let k = [], fun [] arg0 -> g26 [g262,arg0] k in
                                        g26 [arg0,f2] k in
                                      g31 [f2] k in
                                    g26 [g261,arg0] k in
                                  g26 [arg0,f2] k in
                                g31 [f3] k in
                              g26 [g260,arg0] k in
                            g31 [t3] k in
                        g41 [arg0] k in
                      g22 [g258] k in
                let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11] arg0 ->
                  let t1 = [f5], fun [f1] [arg0] k ->
                    let t1 = PRIM_DeRef(f1) in
                    match t1 with
                    | None0 ->
                      let k = [], fun [] arg0 ->
                        let k = [], fun [] arg0 ->
                          let k = [], fun [] arg0 -> g41 [arg0] k in
                          g22 [arg0] k in
                        g26 [g271,arg0] k in
                      g26 [g270,g269] k
                    | Some1(t2) ->
                      match t2 with
                      | FS0(t3,t4,t5) ->
                        let k = [], fun [] arg0 ->
                          let k = [arg0], fun [f2] arg0 ->
                            let t1 = PRIM_SubInt(arg0,1) in
                            let k = [f2], fun [f2] arg0 ->
                              let t1 = [f2], fun [f1] [arg0] k ->
                                let t1 = II0[arg0] in
                                let k = [arg0], fun [f2] arg0 ->
                                  match arg0 with
                                  | None0 -> k g272
                                  | Some1(t1) ->
                                    let k = [f2], fun [f2] arg0 ->
                                      let k = [f2], fun [f2] arg0 ->
                                        let k = [f2], fun [f2] arg0 ->
                                          let k = [f2], fun [f2] arg0 ->
                                            let k = [arg0], fun [f2] arg0 ->
                                              let k = [], fun [] arg0 ->
                                                let k = [], fun [] arg0 ->
                                                  let k = [], fun [] arg0 -> g41 [arg0] k in
                                                  g22 [arg0] k in
                                                g26 [g275,arg0] k in
                                              g26 [arg0,f2] k in
                                            g31 [f2] k in
                                          g26 [g274,arg0] k in
                                        g26 [arg0,g273] k in
                                      g31 [arg0] k in
                                    match t1 with
                                    | Inode0(t2,t3) -> k t2 in
                                g97 [f1,t1] k in
                              g7 [t1,arg0] k in
                            g9 [0,t1] k in
                          match arg0 with
                          | Super0(t1,t2,t3) -> k t3 in
                        match t2 with
                        | FS0(t6,t7,t8) -> k t6 in
                  let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12] arg0 ->
                    let t1 = [f5], fun [f1] [arg0] k ->
                      let t1 = PRIM_DeRef(f1) in
                      match t1 with
                      | None0 ->
                        let k = [], fun [] arg0 ->
                          let k = [], fun [] arg0 ->
                            let k = [], fun [] arg0 -> g41 [arg0] k in
                            g22 [arg0] k in
                          g26 [g279,arg0] k in
                        g26 [g278,g277] k
                      | Some1(t2) ->
                        let k = [arg0], fun [f2] arg0 ->
                          let t1 = II0[f2] in
                          let k = [f2], fun [f2] arg0 ->
                            let k = [f2], fun [f2] arg0 ->
                              let k = [f2], fun [f2] arg0 ->
                                let k = [f2], fun [f2] arg0 ->
                                  let k = [arg0], fun [f2] arg0 ->
                                    let k = [f2], fun [f2] arg0 ->
                                      let k = [], fun [] arg0 ->
                                        let k = [], fun [] arg0 -> g41 [arg0] k in
                                        g22 [arg0] k in
                                      g26 [arg0,f2] k in
                                    g26 [g289,arg0] k in
                                  g31 [f2] k in
                                g26 [g288,arg0] k in
                              g26 [arg0,g280] k in
                            match arg0 with
                            | None0 -> k g281
                            | Some1(t1) ->
                              match t1 with
                              | Inode0(t2,t3) ->
                                let k = [t2], fun [f2] arg0 ->
                                  let k = [f2], fun [f2] arg0 ->
                                    let k = [f2], fun [f2] arg0 ->
                                      let k = [f2], fun [f2] arg0 ->
                                        let k = [arg0], fun [f2] arg0 ->
                                          let k = [], fun [] arg0 -> g26 [g287,arg0] k in
                                          g26 [arg0,f2] k in
                                        g31 [f2] k in
                                      g26 [g286,arg0] k in
                                    g26 [arg0,g282] k in
                                  g61 [g285,arg0] k in
                                g2 [g284,t3] k in
                          g97 [arg0,t1] k in
                        match t2 with
                        | FS0(t3,t4,t5) -> k t3 in
                    let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13] arg0 ->
                      let t1 = [f5], fun [f1] [arg0] k ->
                        let k = [f1,arg0], fun [f2,f3] arg0 ->
                          let t1 = [f2,f3,arg0], fun [f1,f2,f3] me [arg0] k ->
                            let t1 = PRIM_DeRef(f1) in
                            let k = [f3,arg0,me], fun [f2,f3,f4] arg0 ->
                              let t1 = PRIM_EqInt(arg0,0) in
                              match t1 with
                              | true1 -> k g301
                              | false0 ->
                                let t2 = PRIM_FreezeBytes(f2) in
                                let t3 = PRIM_EqInt(arg0,128) in
                                let k = [f3,f4,arg0], fun [f2,f3,f4] arg0 ->
                                  let t1 = PRIM_AddInt(f2,f4) in
                                  f3 [t1] k in
                                match t3 with
                                | true1 ->
                                  let k = [], fun [] arg0 -> g41 [arg0] k in
                                  g22 [t2] k
                                | false0 ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 -> g41 [arg0] k in
                                    g22 [arg0] k in
                                  g68 [t2,0,arg0] k in
                            match t1 with
                            | None0 ->
                              let k = [], fun [] arg0 ->
                                let k = [], fun [] arg0 ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 -> k 0 in
                                    g41 [arg0] k in
                                  g22 [arg0] k in
                                g26 [g293,arg0] k in
                              g26 [g292,g291] k
                            | Some1(t2) ->
                              let k = [f2,f3,arg0], fun [f2,f3,f4] arg0 ->
                                let t1 = II0[f2] in
                                let k = [f3,f4], fun [f2,f3] arg0 ->
                                  match arg0 with
                                  | None0 ->
                                    let k = [], fun [] arg0 ->
                                      let k = [], fun [] arg0 ->
                                        let k = [], fun [] arg0 ->
                                          let k = [], fun [] arg0 -> k 0 in
                                          g41 [arg0] k in
                                        g22 [arg0] k in
                                      g26 [g296,arg0] k in
                                    g26 [g295,g294] k
                                  | Some1(t1) ->
                                    let t2 = [f2], fun [f1] me [arg0,arg1,arg2] k ->
                                      let t1 = PRIM_LessInt(0,arg1) in
                                      let k = [f1,arg0,me,arg1,arg2], fun [f2,f3,f4,f5,f6] arg0 ->
                                        match arg0 with
                                        | true1 -> k 0
                                        | false0 ->
                                          match f3 with
                                          | Nil0 -> k 0
                                          | Cons1(t1,t2) ->
                                            let t3 = PRIM_LessInt(f6,128) in
                                            let k = [f2,f4,f5,f6,t1,t2], fun [f2,f3,f4,f5,f6,f7] arg0 ->
                                              match arg0 with
                                              | true1 ->
                                                let t1 = PRIM_SubInt(f5,128) in
                                                f3 [f7,f4,t1] k
                                              | false0 ->
                                                let t1 = PRIM_SubInt(128,f5) in
                                                let t2 = PRIM_LessInt(t1,f4) in
                                                let k = [f2,f5,f6], fun [f2,f3,f4] arg0 ->
                                                  let t1 = PRIM_LessInt(128,arg0) in
                                                  let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                    let k = [f2,f3,arg0], fun [f2,f3,f4] arg0 ->
                                                      let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                        let k = [f2,f4], fun [f2,f3] arg0 ->
                                                          let k = [f3], fun [f2] arg0 -> k f2 in
                                                          g72 [f2,0,arg0] k in
                                                        g68 [arg0,f3,f4] k in
                                                      match arg0 with
                                                      | Block0(t1) -> k t1 in
                                                    g84 [f4] k in
                                                  match t1 with
                                                  | true1 -> k 128
                                                  | false0 -> k arg0 in
                                                match t2 with
                                                | true1 -> k t1
                                                | false0 -> k f4 in
                                            match t3 with
                                            | true1 -> k g299
                                            | false0 -> k g300 in
                                      match t1 with
                                      | true1 -> k g297
                                      | false0 -> k g298 in
                                    let k = [f3,t1,t2], fun [f2,f3,f4] arg0 ->
                                      let k = [f2,f4,arg0], fun [f2,f3,f4] arg0 ->
                                        let t1 = PRIM_SubInt(arg0,f2) in
                                        f3 [f4,t1,f2] k in
                                      match f3 with
                                      | Inode0(t1,t2) -> k t1 in
                                    match t1 with
                                    | Inode0(t3,t4) -> k t4 in
                                g97 [arg0,t1] k in
                              match t2 with
                              | FS0(t3,t4,t5) -> k t3 in
                          t1 [0] k in
                        PRIM_MakeBytes(128) k in
                      let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14] arg0 ->
                        let t1 = [f4,f5], fun [f1,f2] [arg0] k ->
                          let t1 = PRIM_DeRef(f2) in
                          match t1 with
                          | None0 ->
                            let k = [], fun [] arg0 ->
                              let k = [], fun [] arg0 ->
                                let k = [], fun [] arg0 -> g41 [arg0] k in
                                g22 [arg0] k in
                              g26 [g305,arg0] k in
                            g26 [g304,g303] k
                          | Some1(t2) ->
                            let k = [f1,f2,arg0,t2], fun [f2,f3,f4,f5] arg0 ->
                              let t1 = II0[f4] in
                              let k = [f2,f3,f4,f5,arg0], fun [f2,f3,f4,f5,f6] arg0 ->
                                match arg0 with
                                | None0 ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 ->
                                      let k = [], fun [] arg0 -> g41 [arg0] k in
                                      g22 [arg0] k in
                                    g26 [g308,arg0] k in
                                  g26 [g307,g306] k
                                | Some1(t1) ->
                                  match t1 with
                                  | Inode0(t2,t3) ->
                                    let k = [f2,f3,f4,f6,t3], fun [f2,f3,f4,f5,f6] arg0 ->
                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                        let t1 = II0[f4] in
                                        let k = [f3,arg0], fun [f2,f3] arg0 ->
                                          let t1 = Some1[f3] in
                                          let t2 = PRIM_SetRef(f2,t1) in
                                          k g310 in
                                        f2 [f5,t1,g309] k in
                                      g98 [arg0,f6] k in
                                    match f5 with
                                    | FS0(t4,t5,t6) ->
                                      let t7 = II0[f4] in
                                      let t8 = Cons1[t7,t5] in
                                      let t9 = FS0[t4,t8,t6] in
                                      k t9 in
                              g97 [arg0,t1] k in
                            match t2 with
                            | FS0(t3,t4,t5) -> k t3 in
                        let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15] arg0 ->
                          let t1 = [f4,f5,f10], fun [f1,f2,f3] [arg0] k ->
                            let t1 = PRIM_DeRef(f2) in
                            let k = [f3], fun [f2] arg0 ->
                              match arg0 with
                              | None0 -> k g322
                              | Some1(t1) ->
                                let k = [f2,t1], fun [f2,f3] arg0 ->
                                  let k = [f2,f3], fun [f2,f3] arg0 ->
                                    let k = [f2,f3], fun [f2,f3] arg0 ->
                                      let k = [f2,f3], fun [f2,f3] arg0 ->
                                        let k = [f2,f3], fun [f2,f3] arg0 ->
                                          let k = [f2,f3], fun [f2,f3] arg0 -> f2 [f3,0] k in
                                          g41 [arg0] k in
                                        g22 [arg0] k in
                                      g26 [g324,arg0] k in
                                    g26 [arg0,g323] k in
                                  g31 [arg0] k in
                                match t1 with
                                | II0(t2) -> k t2 in
                            match t1 with
                            | None0 ->
                              let k = [], fun [] arg0 ->
                                let k = [], fun [] arg0 ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 -> k g315 in
                                    g41 [arg0] k in
                                  g22 [arg0] k in
                                g26 [g314,arg0] k in
                              g26 [g313,g312] k
                            | Some1(t2) ->
                              let k = [f1,f2], fun [f2,f3] arg0 ->
                                match arg0 with
                                | None0 ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 ->
                                      let k = [], fun [] arg0 ->
                                        let k = [], fun [] arg0 -> k g320 in
                                        g41 [arg0] k in
                                      g22 [arg0] k in
                                    g26 [g319,arg0] k in
                                  g26 [g318,g317] k
                                | Some1(t1) ->
                                  match t1 with
                                  | Pair0(t2,t3) ->
                                    let k = [f2,f3,t2,t3], fun [f2,f3,f4,f5] arg0 ->
                                      let t1 = Inode0[0,g321] in
                                      let t2 = Some1[t1] in
                                      let k = [f3,f4,f5], fun [f2,f3,f4] arg0 ->
                                        let t1 = Some1[f3] in
                                        let t2 = PRIM_SetRef(f2,t1) in
                                        let t3 = Some1[f4] in
                                        k t3 in
                                      f2 [arg0,f5,t2] k in
                                    match t2 with
                                    | FS0(t4,t5,t6) -> k t4 in
                              match t2 with
                              | FS0(t3,t4,t5) ->
                                match t4 with
                                | Nil0 -> k g316
                                | Cons1(t6,t7) ->
                                  let t8 = FS0[t3,t7,t5] in
                                  let t9 = Pair0[t8,t6] in
                                  let t10 = Some1[t9] in
                                  k t10 in
                          let k = [f2,f3,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15] arg0 ->
                            let t1 = [f4,f9], fun [f1,f2] [arg0] k ->
                              let k = [f1,f2,arg0], fun [f2,f3,f4] arg0 ->
                                let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                  let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                      let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                        let t1 = PRIM_DeRef(f2) in
                                        let k = [f3,f4], fun [f2,f3] arg0 ->
                                          match arg0 with
                                          | None0 -> k g336
                                          | Some1(t1) ->
                                            let k = [f2,f3], fun [f2,f3] arg0 ->
                                              let t1 = II0[f3] in
                                              f2 [t1,arg0] k in
                                            match t1 with
                                            | Inode0(t2,t3) -> k t2 in
                                        match t1 with
                                        | None0 ->
                                          let k = [], fun [] arg0 ->
                                            let k = [], fun [] arg0 ->
                                              let k = [], fun [] arg0 ->
                                                let k = [], fun [] arg0 -> k g331 in
                                                g41 [arg0] k in
                                              g22 [arg0] k in
                                            g26 [g330,arg0] k in
                                          g26 [g329,g328] k
                                        | Some1(t2) ->
                                          let k = [f4], fun [f2] arg0 ->
                                            let t1 = II0[f2] in
                                            let k = [], fun [] arg0 ->
                                              match arg0 with
                                              | None0 ->
                                                let k = [], fun [] arg0 ->
                                                  let k = [], fun [] arg0 ->
                                                    let k = [], fun [] arg0 ->
                                                      let k = [], fun [] arg0 -> k g335 in
                                                      g41 [arg0] k in
                                                    g22 [arg0] k in
                                                  g26 [g334,arg0] k in
                                                g26 [g333,g332] k
                                              | Some1(t1) ->
                                                let t2 = Some1[t1] in
                                                k t2 in
                                            g97 [arg0,t1] k in
                                          match t2 with
                                          | FS0(t3,t4,t5) -> k t3 in
                                      g41 [arg0] k in
                                    g22 [arg0] k in
                                  g26 [g327,arg0] k in
                                g26 [arg0,g326] k in
                              g31 [arg0] k in
                            let k = [f2,f3,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15] arg0 ->
                              let t1 = [f8], fun [f1] [arg0,arg1] k ->
                                let k = [f1,arg0,arg1], fun [f2,f3,f4] arg0 ->
                                  let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                      let k = [f2,f3,f4,arg0], fun [f2,f3,f4,f5] arg0 ->
                                        let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                          let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                              let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                let t1 = II0[f3] in
                                                f2 [t1,f4] k in
                                              g41 [arg0] k in
                                            g22 [arg0] k in
                                          g26 [g340,arg0] k in
                                        g26 [arg0,f5] k in
                                      g31 [f3] k in
                                    g26 [g339,arg0] k in
                                  g26 [arg0,g338] k in
                                g31 [arg1] k in
                              let k = [f2,f3,f4,f5,f6,f7,f9,f10,f11,f12,f13,f14,f15,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15] arg0 ->
                                let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16] arg0 ->
                                  let t1 = Cons1[arg0,g350] in
                                  let t2 = Cons1[f16,t1] in
                                  let t3 = Cons1[f15,t2] in
                                  let t4 = Cons1[f14,t3] in
                                  let t5 = Cons1[f13,t4] in
                                  let t6 = Cons1[f12,t5] in
                                  let t7 = Cons1[f11,t6] in
                                  let t8 = Cons1[f10,t7] in
                                  let t9 = Cons1[f9,t8] in
                                  let t10 = Cons1[f8,t9] in
                                  let t11 = Cons1[f7,t10] in
                                  let t12 = Cons1[f6,t11] in
                                  let t13 = Cons1[f5,t12] in
                                  let t14 = Cons1[f4,t13] in
                                  let t15 = Cons1[f3,t14] in
                                  let t16 = Cmap0[t15] in
                                  let t17 = [f2,t16], fun [f1,f2] me [arg0] k ->
                                    let k = [f1,f2,arg0,me], fun [f2,f3,f4,f5] arg0 ->
                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                              let k = [f3,f4,f5,arg0], fun [f2,f3,f4,f5] arg0 ->
                                                match arg0 with
                                                | true1 ->
                                                  let k = [], fun [] arg0 -> g41 [arg0] k in
                                                  g22 [g353] k
                                                | false0 ->
                                                  let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                      let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                        let k = [f3,f4], fun [f2,f3] arg0 ->
                                                          let t1 = PRIM_AddInt(f2,1) in
                                                          f3 [t1] k in
                                                        match arg0 with
                                                        | Nil0 -> k g356
                                                        | Cons1(t1,t2) ->
                                                          let t3 = [t1], fun [f1] me [arg0] k ->
                                                            match arg0 with
                                                            | Nil0 -> k g357
                                                            | Cons1(t1,t2) ->
                                                              match t1 with
                                                              | Pair0(t3,t4) ->
                                                                let k = [me,t2,t4], fun [f2,f3,f4] arg0 ->
                                                                  match arg0 with
                                                                  | true1 ->
                                                                    let t1 = Some1[f4] in
                                                                    k t1
                                                                  | false0 -> f2 [f3] k in
                                                                g56 [t3,f1] k in
                                                          let k = [t1,t2,t3], fun [f2,f3,f4] arg0 ->
                                                            let k = [f2,f3], fun [f2,f3] arg0 ->
                                                              match arg0 with
                                                              | None0 ->
                                                                let k = [], fun [] arg0 ->
                                                                  let k = [], fun [] arg0 ->
                                                                    let k = [], fun [] arg0 ->
                                                                      let k = [], fun [] arg0 -> g41 [arg0] k in
                                                                      g22 [arg0] k in
                                                                    g26 [g360,arg0] k in
                                                                  g26 [arg0,g359] k in
                                                                g26 [f2,g358] k
                                                              | Some1(t1) ->
                                                                match t1 with
                                                                | Command0(t2) -> t2 [f3] k in
                                                            f4 [arg0] k in
                                                          match f2 with
                                                          | Cmap0(t4) -> k t4 in
                                                      g20 [g355,arg0] k in
                                                    g62 [g354,arg0] k in
                                                  g22 [f5] k in
                                              g56 [arg0,f2] k in
                                            g79 [g352] k in
                                          g41 [arg0] k in
                                        g22 [arg0] k in
                                      g26 [arg0,g351] k in
                                    g31 [arg0] k in
                                  let k = [t17], fun [f2] arg0 ->
                                    let k = [f2], fun [f2] arg0 ->
                                      let k = [f2,arg0], fun [f2,f3] arg0 ->
                                        let k = [f2,f3], fun [f2,f3] arg0 ->
                                          let t1 = PRIM_PutChar('\n') in
                                          let k = [f2,f3], fun [f2,f3] arg0 ->
                                            let k = [f2,f3], fun [f2,f3] arg0 ->
                                              let k = [f2,f3], fun [f2,f3] arg0 ->
                                                let k = [f2,f3], fun [f2,f3] arg0 ->
                                                  let t1 = PRIM_PutChar('\n') in
                                                  let k = [f2,f3], fun [f2,f3] arg0 ->
                                                    let k = [f2,f3], fun [f2,f3] arg0 ->
                                                      let k = [f2,f3], fun [f2,f3] arg0 ->
                                                        let k = [f2,f3], fun [f2,f3] arg0 ->
                                                          let t1 = PRIM_PutChar('\n') in
                                                          let k = [f2,f3], fun [f2,f3] arg0 ->
                                                            let k = [f2,f3], fun [f2,f3] arg0 ->
                                                              let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                  let t1 = PRIM_PutChar('\n') in
                                                                  let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                    let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                      let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                        let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                          let t1 = PRIM_PutChar('\n') in
                                                                          let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                            let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                              let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                                let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                                  let t1 = PRIM_PutChar('\n') in
                                                                                  let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                                    let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                                      let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                                        let k = [f2,f3], fun [f2,f3] arg0 ->
                                                                                          let t1 = PRIM_PutChar('\n') in
                                                                                          let k = [f2], fun [f2] arg0 ->
                                                                                            let k = [f2], fun [f2] arg0 ->
                                                                                              let k = [f2], fun [f2] arg0 ->
                                                                                                let k = [f2], fun [f2] arg0 ->
                                                                                                  let k = [f2], fun [f2] arg0 -> f2 [1] k in
                                                                                                  g41 [arg0] k in
                                                                                                g22 [arg0] k in
                                                                                              g26 [g371,arg0] k in
                                                                                            g26 [arg0,g369] k in
                                                                                          g61 [g370,f3] k in
                                                                                        g41 [arg0] k in
                                                                                      g22 [arg0] k in
                                                                                    g26 [g368,arg0] k in
                                                                                  g31 [768] k in
                                                                                g41 [arg0] k in
                                                                              g22 [arg0] k in
                                                                            g26 [g367,arg0] k in
                                                                          g31 [40] k in
                                                                        g41 [arg0] k in
                                                                      g22 [arg0] k in
                                                                    g26 [g366,arg0] k in
                                                                  g31 [128] k in
                                                                g41 [arg0] k in
                                                              g22 [arg0] k in
                                                            g26 [g365,arg0] k in
                                                          g31 [5120] k in
                                                        g41 [arg0] k in
                                                      g22 [arg0] k in
                                                    g26 [g364,arg0] k in
                                                  g31 [10] k in
                                                g41 [arg0] k in
                                              g22 [arg0] k in
                                            g26 [g363,arg0] k in
                                          g31 [512] k in
                                        g41 [arg0] k in
                                      g22 [g362] k in
                                    g101 [g361,arg0] k in
                                  match t16 with
                                  | Cmap0(t18) -> k t18 in
                                g108 [g349,g348] k in
                              g142 [g341,t1] k in
                            g121 [g337,t1] k in
                          g108 [g325,t1] k in
                        g121 [g311,t1] k in
                      g121 [g302,t1] k in
                    g121 [g290,t1] k in
                  g108 [g276,t1] k in
                g108 [g268,t1] k in
              g108 [g254,t1] k in
            g108 [g249,t1] k in
          g108 [g231,t1] k in
        g121 [g224,g223] k in
      g108 [g217,g216] k in
    g108 [g206,g205] k in
  g24 [t2] k in
g24 [t3] k
