(*Stage4 (CCF)*)
let k () = ()
let g1 = fun [arg0] k ->
  match arg0 with
  | Nil -> k 0
  | Cons(t1,t2) ->
    let k = [], fun [] arg0 ->
      let t1 = PRIM_AddInt(1,arg0) in
      k t1 in
    g1 [t2] k in
let g3 = Nil in
let g2 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil -> k g3
  | Cons(t1,t2) ->
    let k = [arg0,t2], fun [f2,f3] arg0 ->
      let k = [arg0], fun [f2] arg0 ->
        let t1 = Cons[f2,arg0] in
        k t1 in
      g2 [f2,f3] k in
    arg0 [t1] k in
let g5 = Nil in
let g4 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil -> k g5
  | Cons(t1,t2) ->
    let k = [arg0,t1,t2], fun [f2,f3,f4] arg0 ->
      match arg0 with
      | true ->
        let k = [f3], fun [f2] arg0 ->
          let t1 = Cons[f2,arg0] in
          k t1 in
        g4 [f2,f4] k
      | false -> g4 [f2,f4] k in
    arg0 [t1] k in
let g6 = fun [arg0,arg1,arg2] k ->
  match arg2 with
  | Nil -> k arg1
  | Cons(t1,t2) ->
    let k = [arg0,t2], fun [f2,f3] arg0 -> g6 [f2,arg0,f3] k in
    arg0 [arg1,t1] k in
let g8 = Unit in
let g7 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil -> k g8
  | Cons(t1,t2) ->
    let k = [arg0,t2], fun [f2,f3] arg0 -> g7 [f2,f3] k in
    arg0 [t1] k in
let g10 = Nil in
let g9 = fun [arg0,arg1] k ->
  let t1 = PRIM_LessInt(arg1,arg0) in
  match t1 with
  | true -> k g10
  | false ->
    let t2 = PRIM_AddInt(arg0,1) in
    let k = [arg0], fun [f2] arg0 ->
      let t1 = Cons[f2,arg0] in
      k t1 in
    g9 [t2,arg1] k in
let g12 = false in
let g13 = true in
let g14 = Nil in
let g15 = Nil in
let g11 = fun [arg0,arg1] k ->
  let t1 = PRIM_LessInt(0,arg0) in
  let k = [arg0,arg1], fun [f2,f3] arg0 ->
    match arg0 with
    | true -> k g14
    | false ->
      match f3 with
      | Nil -> k g15
      | Cons(t1,t2) ->
        let t3 = PRIM_SubInt(f2,1) in
        let k = [t1], fun [f2] arg0 ->
          let t1 = Cons[f2,arg0] in
          k t1 in
        g11 [t3,t2] k in
  match t1 with
  | true -> k g12
  | false -> k g13 in
let g17 = false in
let g18 = true in
let g19 = Nil in
let g20 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil -> k arg0
  | Cons(t1,t2) ->
    let t3 = Cons[t1,arg0] in
    g20 [t3,t2] k in
let g21 = Nil in
let g22 = fun [arg0] k ->
  let t1 = [arg0], fun [f1] me [arg0,arg1] k ->
    let t1 = PRIM_LessInt(arg1,0) in
    match t1 with
    | true -> k arg0
    | false ->
      let t2 = PRIM_StringIndex(f1,arg1) in
      let t3 = PRIM_SubInt(arg1,1) in
      let t4 = Cons[t2,arg0] in
      me [t4,t3] k in
  let t2 = PRIM_StringLength(arg0) in
  let t3 = PRIM_SubInt(t2,1) in
  t1 [g21,t3] k in
let g23 = Unit in
let g24 = fun [arg0] k ->
  let k = [arg0], fun [f2] arg0 ->
    let k = [f2], fun [f2] arg0 ->
      let t1 = [arg0], fun [f1] me [arg0,arg1] k ->
        match arg1 with
        | Nil -> k g23
        | Cons(t1,t2) ->
          let t3 = PRIM_SetBytes(f1,arg0,t1) in
          let t4 = PRIM_AddInt(arg0,1) in
          me [t4,t2] k in
      let k = [arg0], fun [f2] arg0 ->
        let t1 = PRIM_FreezeBytes(f2) in
        k t1 in
      t1 [0,f2] k in
    PRIM_MakeBytes(arg0) k in
  g1 [arg0] k in
let g25 = Nil in
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
  | true -> k arg0
  | false ->
    let t2 = PRIM_ModInt(arg1,10) in
    let t3 = PRIM_AddInt(48,t2) in
    let t4 = PRIM_CharChr(t3) in
    let t5 = PRIM_DivInt(arg1,10) in
    let t6 = Cons[t4,arg0] in
    g27 [t6,t5] k in
let g28 = Nil in
let g29 = Nil in
let g30 = Nil in
let g31 = fun [arg0] k ->
  let t1 = PRIM_EqInt(arg0,0) in
  let k = [], fun [] arg0 -> g24 [arg0] k in
  match t1 with
  | true ->
    let t2 = Cons['0',g28] in
    k t2
  | false ->
    let t2 = PRIM_LessInt(arg0,0) in
    match t2 with
    | true ->
      let t3 = PRIM_SubInt(0,arg0) in
      let k = [], fun [] arg0 ->
        let t1 = Cons['-',arg0] in
        k t1 in
      g27 [g29,t3] k
    | false -> g27 [g30,arg0] k in
let g33 = false in
let g34 = true in
let g35 = false in
let g36 = true in
let g37 = None in
let g38 = None in
let g39 = None in
let g32 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil ->
    let t1 = Some[arg0] in
    k t1
  | Cons(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_SubInt(t3,48) in
    let t5 = PRIM_LessInt(t4,0) in
    let k = [arg0,t2,t4], fun [f2,f3,f4] arg0 ->
      let k = [f2,f3], fun [f2,f3] arg0 ->
        match arg0 with
        | None -> k g39
        | Some(t1) ->
          let t2 = PRIM_MulInt(10,f2) in
          let t3 = PRIM_AddInt(t2,t1) in
          g32 [t3,f3] k in
      match arg0 with
      | true ->
        let t1 = PRIM_LessInt(9,f4) in
        let k = [f4], fun [f2] arg0 ->
          match arg0 with
          | true ->
            let t1 = Some[f2] in
            k t1
          | false -> k g37 in
        match t1 with
        | true -> k g35
        | false -> k g36
      | false -> k g38 in
    match t5 with
    | true -> k g33
    | false -> k g34 in
let g40 = fun [arg0] k ->
  let k = [], fun [] arg0 -> g32 [0,arg0] k in
  g22 [arg0] k in
let g42 = Unit in
let g41 = fun [arg0] k ->
  match arg0 with
  | Nil -> k g42
  | Cons(t1,t2) ->
    let t3 = PRIM_CharOrd(t1) in
    let t4 = PRIM_EqInt(t3,8) in
    let k = [t2], fun [f2] arg0 -> g41 [f2] k in
    match t4 with
    | true ->
      let t5 = PRIM_PutChar(t1) in
      k t5
    | false ->
      let t5 = PRIM_EqChar(t1,'\n') in
      match t5 with
      | true ->
        let t6 = PRIM_PutChar(t1) in
        k t6
      | false ->
        let t6 = PRIM_LessInt(26,t3) in
        match t6 with
        | true ->
          let t7 = PRIM_PutChar(t1) in
          k t7
        | false ->
          let t7 = PRIM_PutChar('^') in
          let t8 = PRIM_AddInt(65,t3) in
          let t9 = PRIM_SubInt(t8,1) in
          let t10 = PRIM_CharChr(t9) in
          let t11 = PRIM_PutChar(t10) in
          k t11 in
let g43 = false in
let g44 = "\n" in
let g45 = "trace: " in
let g46 = Unit in
let g47 = Unit in
let g48 = fun [arg0] k ->
  let k = [arg0], fun [f2] arg0 ->
    let k = [f2,arg0], fun [f2,f3] arg0 ->
      let t1 = [arg0], fun [f1] me [arg0,arg1] k ->
        match arg1 with
        | Nil -> k g47
        | Cons(t1,t2) ->
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
let g49 = false in
let g50 = true in
let g51 = false in
let g52 = true in
let g53 = false in
let g54 = true in
let g55 = false in
let g56 = fun [arg0,arg1] k ->
  let t1 = PRIM_StringLength(arg0) in
  let t2 = PRIM_StringLength(arg1) in
  let t3 = PRIM_EqInt(t1,t2) in
  let k = [arg0,arg1,t1], fun [f2,f3,f4] arg0 ->
    match arg0 with
    | true -> k g51
    | false ->
      let t1 = [f2,f3], fun [f1,f2] me [arg0] k ->
        let t1 = PRIM_LessInt(arg0,0) in
        match t1 with
        | true -> k g52
        | false ->
          let t2 = PRIM_StringIndex(f1,arg0) in
          let t3 = PRIM_StringIndex(f2,arg0) in
          let t4 = PRIM_EqChar(t2,t3) in
          let k = [arg0,me], fun [f2,f3] arg0 ->
            match arg0 with
            | true -> k g55
            | false ->
              let t1 = PRIM_SubInt(f2,1) in
              f3 [t1] k in
          match t4 with
          | true -> k g53
          | false -> k g54 in
      let t2 = PRIM_SubInt(f4,1) in
      t1 [t2] k in
  match t3 with
  | true -> k g49
  | false -> k g50 in
let g57 = Nil in
let g58 = Nil in
let g59 = Nil in
let g60 = "" in
let g61 = fun [arg0] k ->
  let k = [], fun [] arg0 ->
    let t1 = [arg0], fun [f1] me [arg0,arg1] k ->
      match arg1 with
      | Nil -> g24 [arg0] k
      | Cons(t1,t2) ->
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
        | Nil -> k g60
        | Cons(t1,t2) ->
          let k = [f2,t2], fun [f2,f3] arg0 -> f2 [arg0,f3] k in
          g22 [t1] k in
      g20 [g59,arg0] k in
    k t2 in
  g22 [arg0] k in
let g63 = fun [arg0,arg1,arg2] k ->
  match arg2 with
  | Nil ->
    let k = [arg0], fun [f2] arg0 ->
      let t1 = Cons[arg0,f2] in
      k t1 in
    g48 [arg1] k
  | Cons(t1,t2) ->
    let t3 = PRIM_EqChar(t1,' ') in
    match t3 with
    | true ->
      let k = [arg0,t2], fun [f2,f3] arg0 ->
        let t1 = Cons[arg0,f2] in
        g62 [t1,f3] k in
      g48 [arg1] k
    | false ->
      let t4 = Cons[t1,arg1] in
      g63 [arg0,t4,t2] k in
let g64 = Nil in
let g62 = fun [arg0] k ->
  let t1 = [arg0], fun [f1] [arg0] k ->
    match arg0 with
    | Nil -> k f1
    | Cons(t1,t2) ->
      let t3 = PRIM_EqChar(t1,' ') in
      match t3 with
      | true -> g62 [f1,t2] k
      | false ->
        let t4 = Cons[t1,g64] in
        g63 [f1,t4,t2] k in
  k t1 in
let g65 = false in
let g66 = true in
let g67 = Unit in
let g68 = fun [arg0,arg1,arg2] k ->
  let k = [arg0,arg1,arg2], fun [f2,f3,f4] arg0 ->
    let t1 = [f2,f3,f4,arg0], fun [f1,f2,f3,f4] me [arg0] k ->
      let t1 = PRIM_LessInt(arg0,f3) in
      let k = [f1,f2,f4,arg0,me], fun [f2,f3,f4,f5,f6] arg0 ->
        match arg0 with
        | true -> k g67
        | false ->
          let t1 = PRIM_AddInt(f3,f5) in
          let t2 = PRIM_StringIndex(f2,t1) in
          let t3 = PRIM_SetBytes(f4,f5,t2) in
          let t4 = PRIM_AddInt(f5,1) in
          f6 [t4] k in
      match t1 with
      | true -> k g65
      | false -> k g66 in
    let k = [arg0], fun [f2] arg0 ->
      let t1 = PRIM_FreezeBytes(f2) in
      k t1 in
    t1 [0] k in
  PRIM_MakeBytes(arg2) k in
let g69 = false in
let g70 = true in
let g71 = Unit in
let g72 = fun [arg0,arg1,arg2] k ->
  let t1 = PRIM_StringLength(arg2) in
  let t2 = [arg0,arg1,arg2,t1], fun [f1,f2,f3,f4] me [arg0] k ->
    let t1 = PRIM_LessInt(arg0,f4) in
    let k = [f1,f2,f3,arg0,me], fun [f2,f3,f4,f5,f6] arg0 ->
      match arg0 with
      | true -> k g71
      | false ->
        let t1 = PRIM_StringIndex(f4,f5) in
        let t2 = PRIM_AddInt(f3,f5) in
        let t3 = PRIM_SetBytes(f2,t2,t1) in
        let t4 = PRIM_AddInt(f5,1) in
        f6 [t4] k in
    match t1 with
    | true -> k g69
    | false -> k g70 in
  t2 [0] k in
let g73 = Nil in
let g75 = Unit in
let g76 = false in
let g77 = true in
let g74 = fun [arg0] k ->
  let t1 = PRIM_GetChar(g75) in
  let t2 = PRIM_CharOrd(t1) in
  let t3 = PRIM_EqChar(t1,'\n') in
  match t3 with
  | true ->
    let t4 = PRIM_PutChar('\n') in
    g48 [arg0] k
  | false ->
    let t4 = PRIM_EqChar(t1,'\EOT') in
    match t4 with
    | true ->
      let t5 = PRIM_PutChar('^') in
      let t6 = PRIM_PutChar('D') in
      let t7 = PRIM_PutChar('\n') in
      let t8 = Cons['\EOT',arg0] in
      g48 [t8] k
    | false ->
      let t5 = PRIM_LessInt(127,t2) in
      match t5 with
      | true -> g74 [arg0] k
      | false ->
        let t6 = PRIM_EqInt(t2,127) in
        match t6 with
        | true ->
          match arg0 with
          | Nil -> g74 [arg0] k
          | Cons(t7,t8) ->
            let t9 = PRIM_CharOrd(t7) in
            let t10 = PRIM_LessInt(26,t9) in
            let k = [t8,t9], fun [f2,f3] arg0 ->
              let k = [f2], fun [f2] arg0 -> g74 [f2] k in
              match arg0 with
              | true ->
                let t1 = PRIM_PutChar('\b') in
                let t2 = PRIM_PutChar(' ') in
                let t3 = PRIM_PutChar('\b') in
                let t4 = PRIM_PutChar('\b') in
                let t5 = PRIM_PutChar(' ') in
                let t6 = PRIM_PutChar('\b') in
                k t6
              | false ->
                let t1 = PRIM_LessInt(f3,32) in
                match t1 with
                | true ->
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
                | false ->
                  let t2 = PRIM_LessInt(126,f3) in
                  match t2 with
                  | true ->
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
                  | false ->
                    let t3 = PRIM_PutChar('\b') in
                    let t4 = PRIM_PutChar(' ') in
                    let t5 = PRIM_PutChar('\b') in
                    k t5 in
            match t10 with
            | true -> k g76
            | false -> k g77
        | false ->
          let t7 = PRIM_CharOrd(t1) in
          let t8 = PRIM_EqInt(t7,8) in
          let k = [arg0,t1], fun [f2,f3] arg0 ->
            let t1 = Cons[f3,f2] in
            g74 [t1] k in
          match t8 with
          | true ->
            let t9 = PRIM_PutChar(t1) in
            k t9
          | false ->
            let t9 = PRIM_EqChar(t1,'\n') in
            match t9 with
            | true ->
              let t10 = PRIM_PutChar(t1) in
              k t10
            | false ->
              let t10 = PRIM_LessInt(26,t7) in
              match t10 with
              | true ->
                let t11 = PRIM_PutChar(t1) in
                k t11
              | false ->
                let t11 = PRIM_PutChar('^') in
                let t12 = PRIM_AddInt(65,t7) in
                let t13 = PRIM_SubInt(t12,1) in
                let t14 = PRIM_CharChr(t13) in
                let t15 = PRIM_PutChar(t14) in
                k t15 in
let g78 = Nil in
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
    | Block(t4) -> k t4 in
  match arg0 with
  | BI(t1) -> k t1 in
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
        let t1 = Block[arg0] in
        k t1 in
      g68 [t2,t4,128] k in
    PRIM_MakeBytes(512) k in
  match arg0 with
  | BI(t1) -> k t1 in
let g85 = fun [arg0,arg1,arg2] k ->
  let k = [arg0,arg1,arg2], fun [f2,f3,f4] arg0 ->
    let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
      let t1 = PRIM_ThawBytes(arg0) in
      let k = [f2,t1], fun [f2,f3] arg0 ->
        let t1 = PRIM_FreezeBytes(f3) in
        let t2 = Block[t1] in
        g83 [f2,t2] k in
      g72 [t1,f3,f4] k in
    match arg0 with
    | Block(t1) -> k t1 in
  g84 [arg0] k in
let g86 = Nil in
let g87 = false in
let g88 = true in
let g89 = "\n" in
let g90 = "no such inode" in
let g91 = "Error: " in
let g92 = None in
let g93 = None in
let g94 = None in
let g95 = None in
let g96 = fun [arg0] k ->
  let t1 = PRIM_CharOrd(arg0) in
  let t2 = BI[t1] in
  k t2 in
let g97 = fun [arg0,arg1] k ->
  let k = [arg0,arg1], fun [f2,f3] arg0 ->
    let k = [f3,arg0], fun [f2,f3] arg0 ->
      let t1 = PRIM_LessInt(f3,arg0) in
      let k = [f2], fun [f2] arg0 ->
        match arg0 with
        | true ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 -> k g92 in
                g41 [arg0] k in
              g22 [arg0] k in
            g26 [g91,arg0] k in
          g26 [g90,g89] k
        | false ->
          let k = [f2], fun [f2] arg0 ->
            let t1 = PRIM_DivInt(arg0,16) in
            let t2 = PRIM_AddInt(t1,1) in
            let t3 = BI[t2] in
            let k = [f2], fun [f2] arg0 ->
              let k = [f2], fun [f2] arg0 ->
                let k = [arg0], fun [f2] arg0 ->
                  let t1 = PRIM_ModInt(arg0,16) in
                  let t2 = PRIM_MulInt(t1,8) in
                  let k = [], fun [] arg0 ->
                    let t1 = PRIM_StringIndex(arg0,0) in
                    let t2 = PRIM_StringIndex(arg0,1) in
                    let t3 = Pair[t1,t2] in
                    let k = [arg0], fun [f2] arg0 ->
                      match arg0 with
                      | None -> k g94
                      | Some(t1) ->
                        let t2 = PRIM_EqInt(t1,0) in
                        match t2 with
                        | true -> k g95
                        | false ->
                          let t3 = PRIM_SubInt(t1,1) in
                          let t4 = PRIM_EqInt(t3,0) in
                          let k = [f2,t3], fun [f2,f3] arg0 ->
                            let k = [f3,arg0], fun [f2,f3] arg0 ->
                              let k = [f2,f3], fun [f2,f3] arg0 ->
                                let k = [f2,f3], fun [f2,f3] arg0 ->
                                  let k = [f2], fun [f2] arg0 ->
                                    let t1 = Inode[f2,arg0] in
                                    let t2 = Some[t1] in
                                    k t2 in
                                  g11 [f3,arg0] k in
                                g2 [g96,arg0] k in
                              g22 [arg0] k in
                            g68 [f2,2,6] k in
                          match t4 with
                          | true -> k 0
                          | false ->
                            let t5 = PRIM_SubInt(t3,1) in
                            let t6 = PRIM_DivInt(t5,128) in
                            let t7 = PRIM_AddInt(1,t6) in
                            k t7 in
                    match t3 with
                    | Pair(t4,t5) ->
                      let t6 = PRIM_CharOrd(t5) in
                      let t7 = PRIM_CharOrd(t4) in
                      let t8 = PRIM_LessInt(3,t6) in
                      match t8 with
                      | true -> k g93
                      | false ->
                        let t9 = PRIM_MulInt(256,t6) in
                        let t10 = PRIM_AddInt(t9,t7) in
                        let t11 = Some[t10] in
                        k t11 in
                  g68 [f2,t2,8] k in
                match f2 with
                | II(t1) -> k t1 in
              match arg0 with
              | Block(t1) -> k t1 in
            g84 [t3] k in
          match f2 with
          | II(t1) -> k t1 in
      match t1 with
      | true -> k g87
      | false -> k g88 in
    match f2 with
    | Super(t1,t2,t3) -> k t3 in
  match arg1 with
  | II(t1) -> k t1 in
let g98 = "BARE" in
let g99 = false in
let g100 = true in
let g101 = None in
let g102 = None in
let g103 = Nil in
let g104 = false in
let g105 = true in
let g106 = fun [arg0,arg1] k ->
  let t1 = [arg1], fun [f1] [arg0] k ->
    let k = [f1], fun [f2] arg0 ->
      let k = [arg0], fun [f2] arg0 ->
        let t1 = PRIM_EqInt(f2,arg0) in
        match t1 with
        | true -> k g104
        | false -> k g105 in
      match f2 with
      | BI(t1) -> k t1 in
    match arg0 with
    | BI(t1) -> k t1 in
  g4 [t1,arg0] k in
let g107 = fun [arg0] k ->
  let t1 = BI[arg0] in
  k t1 in
let g108 = Nil in
let g109 = fun [arg0] k ->
  let t1 = BI[0] in
  let k = [], fun [] arg0 ->
    let k = [], fun [] arg0 ->
      let k = [arg0], fun [f2] arg0 ->
        let k = [f2], fun [f2] arg0 ->
          let k = [f2], fun [f2] arg0 ->
            let k = [], fun [] arg0 ->
              match arg0 with
              | None -> k g102
              | Some(t1) ->
                match t1 with
                | Super(t2,t3,t4) ->
                  let t5 = [t1,t4], fun [f1,f2] me [arg0,arg1,arg2] k ->
                    let t1 = PRIM_EqInt(arg2,f2) in
                    match t1 with
                    | true ->
                      let k = [f1,arg0], fun [f2,f3] arg0 ->
                        let t1 = FS[f2,arg0,f3] in
                        let t2 = Some[t1] in
                        k t2 in
                      g20 [g103,arg1] k
                    | false ->
                      let t2 = II[arg2] in
                      let k = [arg0,me,arg1,arg2], fun [f2,f3,f4,f5] arg0 ->
                        match arg0 with
                        | None ->
                          let t1 = PRIM_AddInt(f5,1) in
                          let t2 = II[f5] in
                          let t3 = Cons[t2,f4] in
                          f3 [f2,t3,t1] k
                        | Some(t1) ->
                          match t1 with
                          | Inode(t2,t3) ->
                            let t4 = PRIM_AddInt(f5,1) in
                            let k = [t4,f3,f4], fun [f2,f3,f4] arg0 -> f3 [arg0,f4,f2] k in
                            g6 [g106,f2,t3] k in
                      g97 [f1,t2] k in
                  let t6 = PRIM_AddInt(1,t3) in
                  let t7 = PRIM_SubInt(t2,1) in
                  let k = [t5], fun [f2] arg0 ->
                    let k = [f2], fun [f2] arg0 -> f2 [arg0,g108,0] k in
                    g2 [g107,arg0] k in
                  g9 [t6,t7] k in
            match arg0 with
            | true -> k g101
            | false ->
              let t1 = PRIM_StringIndex(f2,4) in
              let t2 = PRIM_StringIndex(f2,5) in
              let t3 = PRIM_StringIndex(f2,6) in
              let t4 = PRIM_CharOrd(t1) in
              let t5 = PRIM_CharOrd(t2) in
              let t6 = PRIM_CharOrd(t3) in
              let t7 = Super[t4,t5,t6] in
              let t8 = Some[t7] in
              k t8 in
          match arg0 with
          | true -> k g99
          | false -> k g100 in
        g56 [arg0,g98] k in
      g68 [arg0,0,4] k in
    match arg0 with
    | Block(t1) -> k t1 in
  g84 [t1] k in
let g110 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil -> k arg0
  | Cons(t1,t2) ->
    let k = [t2], fun [f2] arg0 -> g110 [arg0,f2] k in
    match arg0 with
    | FS(t3,t4,t5) ->
      let t6 = Cons[t1,t5] in
      let t7 = FS[t3,t4,t6] in
      k t7 in
let g111 = fun [arg0] k ->
  let k = [], fun [] arg0 ->
    let t1 = PRIM_CharChr(arg0) in
    k t1 in
  match arg0 with
  | BI(t1) -> k t1 in
let g112 = None in
let g114 = Nil in
let g113 = fun [arg0,arg1] k ->
  match arg1 with
  | Nil -> g20 [g114,arg0] k
  | Cons(t1,t2) ->
    match t1 with
    | Pair(t3,t4) ->
      let t5 = Cons[t3,arg0] in
      g113 [t5,t2] k in
let g115 = " [no args]" in
let g116 = "usage: " in
let g117 = "\n" in
let g118 = "Error: " in
let g119 = Unit in
let g120 = fun [arg0,arg1] k ->
  let t1 = [arg0,arg1], fun [f1,f2] [arg0] k ->
    match arg0 with
    | Cons(t1,t2) ->
      let k = [], fun [] arg0 ->
        let k = [], fun [] arg0 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 -> g41 [arg0] k in
              g22 [arg0] k in
            g26 [g118,arg0] k in
          g26 [arg0,g117] k in
        g26 [g116,arg0] k in
      g26 [f1,g115] k
    | Nil -> f2 [g119] k in
  let t2 = Command[t1] in
  let t3 = Pair[arg0,t2] in
  k t3 in
let g121 = " [int]" in
let g122 = "usage: " in
let g123 = "\n" in
let g124 = "Error: " in
let g125 = " [int]" in
let g126 = "usage: " in
let g127 = "\n" in
let g128 = "Error: " in
let g129 = " [int]" in
let g130 = "usage: " in
let g131 = "\n" in
let g132 = "Error: " in
let g133 = fun [arg0,arg1] k ->
  let t1 = [arg0,arg1], fun [f1,f2] [arg0] k ->
    match arg0 with
    | Nil ->
      let k = [], fun [] arg0 ->
        let k = [], fun [] arg0 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 -> g41 [arg0] k in
              g22 [arg0] k in
            g26 [g124,arg0] k in
          g26 [arg0,g123] k in
        g26 [g122,arg0] k in
      g26 [f1,g121] k
    | Cons(t1,t2) ->
      match t2 with
      | Cons(t3,t4) ->
        let k = [], fun [] arg0 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 -> g41 [arg0] k in
                g22 [arg0] k in
              g26 [g128,arg0] k in
            g26 [arg0,g127] k in
          g26 [g126,arg0] k in
        g26 [f1,g125] k
      | Nil ->
        let k = [f1,f2], fun [f2,f3] arg0 ->
          match arg0 with
          | None ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 ->
                  let k = [], fun [] arg0 ->
                    let k = [], fun [] arg0 -> g41 [arg0] k in
                    g22 [arg0] k in
                  g26 [g132,arg0] k in
                g26 [arg0,g131] k in
              g26 [g130,arg0] k in
            g26 [f2,g129] k
          | Some(t1) -> f3 [t1] k in
        g40 [t1] k in
  let t2 = Command[t1] in
  let t3 = Pair[arg0,t2] in
  k t3 in
let g134 = " [int] [int]" in
let g135 = "usage: " in
let g136 = "\n" in
let g137 = "Error: " in
let g138 = " [int] [int]" in
let g139 = "usage: " in
let g140 = "\n" in
let g141 = "Error: " in
let g142 = " [int] [int]" in
let g143 = "usage: " in
let g144 = "\n" in
let g145 = "Error: " in
let g146 = " [int] [int]" in
let g147 = "usage: " in
let g148 = "\n" in
let g149 = "Error: " in
let g150 = " [int] [int]" in
let g151 = "usage: " in
let g152 = "\n" in
let g153 = "Error: " in
let g154 = fun [arg0,arg1] k ->
  let t1 = [arg0,arg1], fun [f1,f2] [arg0] k ->
    match arg0 with
    | Nil ->
      let k = [], fun [] arg0 ->
        let k = [], fun [] arg0 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 -> g41 [arg0] k in
              g22 [arg0] k in
            g26 [g137,arg0] k in
          g26 [arg0,g136] k in
        g26 [g135,arg0] k in
      g26 [f1,g134] k
    | Cons(t1,t2) ->
      match t2 with
      | Nil ->
        let k = [], fun [] arg0 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 -> g41 [arg0] k in
                g22 [arg0] k in
              g26 [g141,arg0] k in
            g26 [arg0,g140] k in
          g26 [g139,arg0] k in
        g26 [f1,g138] k
      | Cons(t3,t4) ->
        match t4 with
        | Cons(t5,t6) ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 ->
                  let k = [], fun [] arg0 -> g41 [arg0] k in
                  g22 [arg0] k in
                g26 [g145,arg0] k in
              g26 [arg0,g144] k in
            g26 [g143,arg0] k in
          g26 [f1,g142] k
        | Nil ->
          let k = [f1,f2,t3], fun [f2,f3,f4] arg0 ->
            match arg0 with
            | None ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 ->
                  let k = [], fun [] arg0 ->
                    let k = [], fun [] arg0 ->
                      let k = [], fun [] arg0 -> g41 [arg0] k in
                      g22 [arg0] k in
                    g26 [g149,arg0] k in
                  g26 [arg0,g148] k in
                g26 [g147,arg0] k in
              g26 [f2,g146] k
            | Some(t1) ->
              let k = [f2,f3,t1], fun [f2,f3,f4] arg0 ->
                match arg0 with
                | None ->
                  let k = [], fun [] arg0 ->
                    let k = [], fun [] arg0 ->
                      let k = [], fun [] arg0 ->
                        let k = [], fun [] arg0 ->
                          let k = [], fun [] arg0 -> g41 [arg0] k in
                          g22 [arg0] k in
                        g26 [g153,arg0] k in
                      g26 [arg0,g152] k in
                    g26 [g151,arg0] k in
                  g26 [f2,g150] k
                | Some(t1) -> f3 [f4,t1] k in
              g40 [f4] k in
          g40 [t1] k in
  let t2 = Command[t1] in
  let t3 = Pair[arg0,t2] in
  k t3 in
let g155 = "\n" in
let g156 = "filesystem already mounted" in
let g157 = "Error: " in
let g158 = Unit in
let g159 = "\n" in
let g160 = "no filesystem found; try format" in
let g161 = "Error: " in
let g162 = "\n" in
let g163 = "no filesystem mounted; try mount" in
let g164 = "Error: " in
let g165 = Unit in
let g166 = "\n" in
let g167 = " : " in
let g168 = "file " in
let g169 = Unit in
let g170 = false in
let g171 = "\n" in
let g172 = "\n" in
let g173 = "no filesystem mounted; try mount" in
let g174 = "Error: " in
let g175 = "\n" in
let g176 = "inode is not allocated (no such file)" in
let g177 = "Error: " in
let g178 = Nil in
let g179 = Nil in
let g180 = None in
let g181 = "\n" in
let g182 = "no blocks available (disk is full)" in
let g183 = "Error: " in
let g184 = Nil in
let g185 = Nil in
let g186 = "" in
let g188 = Nil in
let g189 = "" in
let g187 = fun [arg0,arg1] k ->
  let t1 = PRIM_StringLength(arg1) in
  let t2 = PRIM_EqInt(t1,0) in
  match t2 with
  | true -> g20 [g188,arg0] k
  | false ->
    let t3 = PRIM_StringLength(arg1) in
    let t4 = PRIM_LessInt(128,t3) in
    let k = [arg0,arg1,t3], fun [f2,f3,f4] arg0 ->
      let t1 = PRIM_LessInt(128,f4) in
      let k = [f2,arg0], fun [f2,f3] arg0 ->
        let t1 = Cons[f3,f2] in
        g187 [t1,arg0] k in
      match t1 with
      | true ->
        let t2 = PRIM_SubInt(f4,128) in
        g68 [f3,128,t2] k
      | false -> k g189 in
    match t4 with
    | true -> g68 [arg1,0,128] k
    | false -> k arg1 in
let g190 = Nil in
let g191 = None in
let g192 = "\n" in
let g193 = "no blocks available (disk is full)" in
let g194 = "Error: " in
let g195 = false in
let g196 = true in
let g197 = Unit in
let g198 = Nil in
let g199 = Nil in
let g200 = Unit in
let g201 = "dump      : Display the raw data on disk." in
let g202 = "sector I  : Display the raw data in disk sector I." in
let g203 = "format    : Prepare disk with an empty filesystem; trashing existing contents." in
let g204 = "mount     : Discover an existing filesystem; allow files to be accessed." in
let g205 = "unmount   : Unmount the existing filesystem; required before format." in
let g206 = "debug     : Display internal information about a mounted filesystem." in
let g207 = "ls        : List all files together with their sizes." in
let g208 = "stat I    : Display internal information about inode(file) I." in
let g209 = "cat I     : Display the contents of file I." in
let g210 = "rm I      : Remove file F; returning resources for reuse." in
let g211 = "create    : Create new file; lines read from input." in
let g212 = "append I  : Append to existing file I; lines read from input." in
let g213 = "splat I N : Overwrite existing file I from offset N; lines read from input." in
let g214 = "wipe      : Wipe disk; fill it with commas." in
let g215 = Nil in
let g216 = Cons[g214,g215] in
let g217 = Cons[g213,g216] in
let g218 = Cons[g212,g217] in
let g219 = Cons[g211,g218] in
let g220 = Cons[g210,g219] in
let g221 = Cons[g209,g220] in
let g222 = Cons[g208,g221] in
let g223 = Cons[g207,g222] in
let g224 = Cons[g206,g223] in
let g225 = Cons[g205,g224] in
let g226 = Cons[g204,g225] in
let g227 = Cons[g203,g226] in
let g228 = Cons[g202,g227] in
let g229 = Cons[g201,g228] in
let g230 = fun [arg0] k ->
  let k = [], fun [] arg0 ->
    let k = [], fun [] arg0 ->
      let t1 = PRIM_PutChar('\n') in
      k t1 in
    g41 [arg0] k in
  g22 [arg0] k in
let g231 = fun [arg0] k -> g7 [g230,g229] k in
let g232 = "help" in
let g234 = false in
let g235 = true in
let g236 = Unit in
let g237 = false in
let g238 = true in
let g239 = Unit in
let g240 = "\\n" in
let g241 = Unit in
let g233 = fun [arg0] k ->
  let t1 = PRIM_LessInt(arg0,10) in
  let k = [arg0], fun [f2] arg0 ->
    match arg0 with
    | true -> k g236
    | false ->
      let k = [f2], fun [f2] arg0 ->
        let t1 = PRIM_LoadSec(f2,arg0) in
        let t2 = PRIM_FreezeBytes(arg0) in
        let t3 = [t2], fun [f1] me [arg0] k ->
          let t1 = PRIM_LessInt(arg0,512) in
          let k = [f1,arg0,me], fun [f2,f3,f4] arg0 ->
            match arg0 with
            | true -> k g239
            | false ->
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
                | true ->
                  let t4 = PRIM_PutChar('\n') in
                  k t4
                | false -> k g241 in
              match t2 with
              | true ->
                let k = [], fun [] arg0 -> g41 [arg0] k in
                g22 [g240] k
              | false ->
                let t3 = PRIM_CharOrd(t1) in
                let t4 = PRIM_EqInt(t3,8) in
                match t4 with
                | true ->
                  let t5 = PRIM_PutChar(t1) in
                  k t5
                | false ->
                  let t5 = PRIM_EqChar(t1,'\n') in
                  match t5 with
                  | true ->
                    let t6 = PRIM_PutChar(t1) in
                    k t6
                  | false ->
                    let t6 = PRIM_LessInt(26,t3) in
                    match t6 with
                    | true ->
                      let t7 = PRIM_PutChar(t1) in
                      k t7
                    | false ->
                      let t7 = PRIM_PutChar('^') in
                      let t8 = PRIM_AddInt(65,t3) in
                      let t9 = PRIM_SubInt(t8,1) in
                      let t10 = PRIM_CharChr(t9) in
                      let t11 = PRIM_PutChar(t10) in
                      k t11 in
          match t1 with
          | true -> k g237
          | false -> k g238 in
        let k = [f2], fun [f2] arg0 ->
          let t1 = PRIM_AddInt(f2,1) in
          g233 [t1] k in
        t3 [0] k in
      PRIM_MakeBytes(512) k in
  match t1 with
  | true -> k g234
  | false -> k g235 in
let g242 = fun [arg0] k -> g233 [0] k in
let g243 = "dump" in
let g244 = false in
let g245 = true in
let g246 = Unit in
let g247 = "\\n" in
let g248 = Unit in
let g249 = fun [arg0] k ->
  let k = [arg0], fun [f2] arg0 ->
    let t1 = PRIM_LoadSec(f2,arg0) in
    let t2 = PRIM_FreezeBytes(arg0) in
    let t3 = [t2], fun [f1] me [arg0] k ->
      let t1 = PRIM_LessInt(arg0,512) in
      let k = [f1,arg0,me], fun [f2,f3,f4] arg0 ->
        match arg0 with
        | true -> k g246
        | false ->
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
            | true ->
              let t4 = PRIM_PutChar('\n') in
              k t4
            | false -> k g248 in
          match t2 with
          | true ->
            let k = [], fun [] arg0 -> g41 [arg0] k in
            g22 [g247] k
          | false ->
            let t3 = PRIM_CharOrd(t1) in
            let t4 = PRIM_EqInt(t3,8) in
            match t4 with
            | true ->
              let t5 = PRIM_PutChar(t1) in
              k t5
            | false ->
              let t5 = PRIM_EqChar(t1,'\n') in
              match t5 with
              | true ->
                let t6 = PRIM_PutChar(t1) in
                k t6
              | false ->
                let t6 = PRIM_LessInt(26,t3) in
                match t6 with
                | true ->
                  let t7 = PRIM_PutChar(t1) in
                  k t7
                | false ->
                  let t7 = PRIM_PutChar('^') in
                  let t8 = PRIM_AddInt(65,t3) in
                  let t9 = PRIM_SubInt(t8,1) in
                  let t10 = PRIM_CharChr(t9) in
                  let t11 = PRIM_PutChar(t10) in
                  k t11 in
      match t1 with
      | true -> k g244
      | false -> k g245 in
    t3 [0] k in
  PRIM_MakeBytes(512) k in
let g250 = "sector" in
let g251 = "\n" in
let g252 = "cannot format a mounted filesystem; try unmount" in
let g253 = "Error: " in
let g254 = Nil in
let g255 = "BARE" in
let g256 = None in
let g257 = "format" in
let g258 = "mount" in
let g259 = "\n" in
let g260 = "no filesystem mounted; try mount" in
let g261 = "Error: " in
let g262 = None in
let g263 = "unmount" in
let g264 = "\n" in
let g265 = "no filesystem mounted; try mount" in
let g266 = "Error: " in
let g267 = "Filesystem found:\n" in
let g268 = "\n" in
let g269 = ", #inodes=" in
let g270 = ", #admin-blocks=1+" in
let g271 = "#blocks=" in
let g272 = "- superblock: " in
let g273 = "\n" in
let g274 = "- #free-blocks = " in
let g275 = "\n" in
let g276 = "- #free-inodes = " in
let g277 = "debug" in
let g278 = "ls" in
let g279 = "\n" in
let g280 = "no filesystem mounted; try mount" in
let g281 = "Error: " in
let g282 = "\n" in
let g283 = "unallocated" in
let g284 = "]" in
let g285 = "B" in
let g286 = fun [arg0] k ->
  let k = [], fun [] arg0 ->
    let k = [], fun [] arg0 -> g26 [g285,arg0] k in
    g31 [arg0] k in
  match arg0 with
  | BI(t1) -> k t1 in
let g287 = "," in
let g288 = ", blocks=[" in
let g289 = "Inode: size=" in
let g290 = " : " in
let g291 = "I" in
let g292 = "stat" in
let g293 = "\n" in
let g294 = "no filesystem mounted; try mount" in
let g295 = "Error: " in
let g296 = "\n" in
let g297 = "inode is not allocated (no such file)" in
let g298 = "Error: " in
let g299 = false in
let g300 = true in
let g301 = false in
let g302 = true in
let g303 = Unit in
let g304 = "cat" in
let g305 = "\n" in
let g306 = "no filesystem mounted; try mount" in
let g307 = "Error: " in
let g308 = "\n" in
let g309 = "inode is not allocated (no such file)" in
let g310 = "Error: " in
let g311 = None in
let g312 = Unit in
let g313 = "rm" in
let g314 = "\n" in
let g315 = "no filesystem mounted; try mount" in
let g316 = "Error: " in
let g317 = None in
let g318 = None in
let g319 = "\n" in
let g320 = "no inodes available (too many files)" in
let g321 = "Error: " in
let g322 = None in
let g323 = Nil in
let g324 = Unit in
let g325 = "; (to finish type ^D)\n" in
let g326 = "Creating file " in
let g327 = "create" in
let g328 = "; (to finish type ^D)\n" in
let g329 = "Appending to file " in
let g330 = "\n" in
let g331 = "no filesystem mounted; try mount" in
let g332 = "Error: " in
let g333 = None in
let g334 = "\n" in
let g335 = "inode is not allocated (no such file)" in
let g336 = "Error: " in
let g337 = None in
let g338 = Unit in
let g339 = "append" in
let g340 = "; (to finish type ^D)\n" in
let g341 = " from offset " in
let g342 = "Overwriting file " in
let g343 = "splat" in
let g344 = false in
let g345 = true in
let g346 = Unit in
let g347 = false in
let g348 = true in
let g349 = Unit in
let g350 = fun [arg0] k ->
  let k = [], fun [] arg0 ->
    let t1 = [arg0], fun [f1] me [arg0] k ->
      let t1 = PRIM_LessInt(arg0,512) in
      let k = [f1,arg0,me], fun [f2,f3,f4] arg0 ->
        match arg0 with
        | true -> k g346
        | false ->
          let t1 = PRIM_SetBytes(f2,f3,',') in
          let t2 = PRIM_AddInt(f3,1) in
          f4 [t2] k in
      match t1 with
      | true -> k g344
      | false -> k g345 in
    let k = [arg0], fun [f2] arg0 ->
      let t1 = PRIM_FreezeBytes(f2) in
      let t2 = [t1], fun [f1] me [arg0] k ->
        let t1 = PRIM_LessInt(arg0,10) in
        let k = [f1,arg0,me], fun [f2,f3,f4] arg0 ->
          match arg0 with
          | true -> k g349
          | false ->
            let t1 = PRIM_StoreSec(f3,f2) in
            let t2 = PRIM_AddInt(f3,1) in
            f4 [t2] k in
        match t1 with
        | true -> k g347
        | false -> k g348 in
      t2 [0] k in
    t1 [0] k in
  PRIM_MakeBytes(512) k in
let g351 = "wipe" in
let g352 = Nil in
let g353 = "> " in
let g354 = Unit in
let g355 = "exiting\n" in
let g356 = Nil in
let g357 = Nil in
let g358 = Unit in
let g359 = None in
let g360 = " : command not found" in
let g361 = "\n" in
let g362 = "Error: " in
let g363 = Nil in
let g364 = "Filesystem explorer" in
let g365 = "- sector_size: " in
let g366 = "- #sectors_on_disk: " in
let g367 = "- addressable disk: " in
let g368 = "- block_size: " in
let g369 = "- #blocks_on_disk: " in
let g370 = "- max_file_size (6 blocks): " in
let g371 = "\n" in
let g372 = " " in
let g373 = "Try: " in
let g374 = Unit in
let g375 = Unit in
let t1 = PRIM_MakeRef(g43) in
let t2 = [t1], fun [f1] [arg0] k ->
  let t1 = PRIM_DeRef(f1) in
  match t1 with
  | true ->
    let k = [], fun [] arg0 ->
      let k = [], fun [] arg0 ->
        let k = [], fun [] arg0 -> g41 [arg0] k in
        g22 [arg0] k in
      g26 [g45,arg0] k in
    g26 [arg0,g44] k
  | false -> k g46 in
let t3 = Cons['\EOT',g73] in
let k = [], fun [] arg0 ->
  let t1 = Cons['\NUL',g86] in
  let t2 = Cons['\NUL',t1] in
  let k = [arg0], fun [f2] arg0 ->
    let t1 = [arg0], fun [f1] [arg0,arg1,arg2] k ->
      let k = [f1,arg1,arg2], fun [f2,f3,f4] arg0 ->
        let t1 = PRIM_DivInt(arg0,16) in
        let t2 = PRIM_AddInt(t1,1) in
        let t3 = BI[t2] in
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
                    let t2 = Block[f2] in
                    let t3 = PRIM_AddInt(t1,1) in
                    let t4 = BI[t3] in
                    g83 [t4,t2] k in
                  match f2 with
                  | II(t2) -> k t2 in
                g72 [t3,t2,f4] k in
              match f2 with
              | II(t1) -> k t1 in
            match f4 with
            | None -> k f2
            | Some(t1) ->
              match t1 with
              | Inode(t2,t3) ->
                let t4 = PRIM_AddInt(1,t2) in
                let t5 = PRIM_DivInt(t4,256) in
                let t6 = PRIM_ModInt(t4,256) in
                let t7 = PRIM_CharChr(t6) in
                let t8 = PRIM_CharChr(t5) in
                let k = [t7,t8], fun [f2,f3] arg0 ->
                  let t1 = Cons[f3,arg0] in
                  let t2 = Cons[f2,t1] in
                  g24 [t2] k in
                g2 [g111,t3] k in
          match arg0 with
          | Block(t1) -> k t1 in
        g84 [t3] k in
      match arg1 with
      | II(t1) -> k t1 in
    let t2 = PRIM_MakeRef(g112) in
    let t3 = [t2], fun [f1] [arg0] k ->
      let t1 = PRIM_DeRef(f1) in
      match t1 with
      | Some(t2) ->
        let k = [], fun [] arg0 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 -> g41 [arg0] k in
            g22 [arg0] k in
          g26 [g157,arg0] k in
        g26 [g156,g155] k
      | None ->
        let k = [f1], fun [f2] arg0 ->
          match arg0 with
          | None ->
            let k = [], fun [] arg0 ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 -> g41 [arg0] k in
                g22 [arg0] k in
              g26 [g161,arg0] k in
            g26 [g160,g159] k
          | Some(t1) ->
            let t2 = Some[t1] in
            let t3 = PRIM_SetRef(f2,t2) in
            k t3 in
        g109 [g158] k in
    let t4 = [t2], fun [f1] [arg0] k ->
      let t1 = PRIM_DeRef(f1) in
      match t1 with
      | None ->
        let k = [], fun [] arg0 ->
          let k = [], fun [] arg0 ->
            let k = [], fun [] arg0 -> g41 [arg0] k in
            g22 [arg0] k in
          g26 [g164,arg0] k in
        g26 [g163,g162] k
      | Some(t2) ->
        match t2 with
        | FS(t3,t4,t5) ->
          let k = [], fun [] arg0 ->
            let k = [arg0], fun [f2] arg0 ->
              let t1 = PRIM_SubInt(arg0,1) in
              let k = [f2], fun [f2] arg0 ->
                let t1 = [f2], fun [f1] [arg0] k ->
                  let t1 = II[arg0] in
                  let k = [arg0], fun [f2] arg0 ->
                    match arg0 with
                    | None -> k g165
                    | Some(t1) ->
                      let k = [f2], fun [f2] arg0 ->
                        let k = [f2], fun [f2] arg0 ->
                          let k = [f2], fun [f2] arg0 ->
                            let k = [f2], fun [f2] arg0 ->
                              let k = [arg0], fun [f2] arg0 ->
                                let k = [], fun [] arg0 ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 -> g41 [arg0] k in
                                    g22 [arg0] k in
                                  g26 [g168,arg0] k in
                                g26 [arg0,f2] k in
                              g31 [f2] k in
                            g26 [g167,arg0] k in
                          g26 [arg0,g166] k in
                        g31 [arg0] k in
                      match t1 with
                      | Inode(t2,t3) -> k t2 in
                  g97 [f1,t1] k in
                g7 [t1,arg0] k in
              g9 [0,t1] k in
            match arg0 with
            | Super(t1,t2,t3) -> k t3 in
          match t2 with
          | FS(t6,t7,t8) -> k t6 in
    let t5 = [t1,t2], fun [f1,f2] me [arg0,arg1] k ->
      let k = [f1,f2,arg0,me,arg1], fun [f2,f3,f4,f5,f6] arg0 ->
        let t1 = PRIM_StringLength(arg0) in
        let t2 = PRIM_LessInt(0,t1) in
        let k = [f2,f3,f4,f5,f6,arg0,t1], fun [f2,f3,f4,f5,f6,f7,f8] arg0 ->
          let k = [f2,f3,f4,f5,f6,arg0], fun [f2,f3,f4,f5,f6,f7] arg0 ->
            let t1 = PRIM_DeRef(f3) in
            let k = [f4,f5,f6,f7,arg0], fun [f2,f3,f4,f5,f6] arg0 ->
              match f5 with
              | true -> k g200
              | false ->
                let t1 = PRIM_StringLength(f6) in
                let t2 = PRIM_AddInt(f4,t1) in
                f3 [f2,t2] k in
            match t1 with
            | None ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 ->
                  let k = [], fun [] arg0 -> g41 [arg0] k in
                  g22 [arg0] k in
                g26 [g174,arg0] k in
              g26 [g173,g172] k
            | Some(t2) ->
              let k = [f2,f3,f4,f6,arg0,t2], fun [f2,f3,f4,f5,f6,f7] arg0 ->
                let k = [f2,f3,f4,f5,f6,f7,arg0], fun [f2,f3,f4,f5,f6,f7,f8] arg0 ->
                  match arg0 with
                  | None ->
                    let k = [], fun [] arg0 ->
                      let k = [], fun [] arg0 ->
                        let k = [], fun [] arg0 -> g41 [arg0] k in
                        g22 [arg0] k in
                      g26 [g177,arg0] k in
                    g26 [g176,g175] k
                  | Some(t1) ->
                    let k = [f2,f3,f4,f5,f6,f7,f8,t1], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg0 ->
                      let t1 = PRIM_StringLength(f6) in
                      let t2 = PRIM_AddInt(f5,t1) in
                      let t3 = PRIM_LessInt(arg0,t2) in
                      let k = [f2,f3,f4,f5,f6,f7,f8,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg0 ->
                        let t1 = [f2,f3,f4,f8,arg0], fun [f1,f2,f3,f4,f5] me [arg0,arg1,arg2,arg3,arg4] k ->
                          match arg4 with
                          | Nil ->
                            let k = [f1,f2,f3,f4,f5,arg0,arg2], fun [f2,f3,f4,f5,f6,f7,f8] arg0 ->
                              let k = [f2,f3,f4,f5,f6,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8] arg0 ->
                                let k = [f2,f3,f4,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7] arg0 ->
                                  let t1 = Inode[f6,arg0] in
                                  let t2 = Some[t1] in
                                  let k = [f3,f7], fun [f2,f3] arg0 ->
                                    let t1 = Some[f3] in
                                    let t2 = PRIM_SetRef(f2,t1) in
                                    k t2 in
                                  f2 [f5,f4,t2] k in
                                g20 [f8,arg0] k in
                              g20 [g179,arg0] k in
                            g20 [g178,arg1] k
                          | Cons(t1,t2) ->
                            match arg2 with
                            | Cons(t3,t4) ->
                              let k = [arg0,me,arg1,t2,t3,t4], fun [f2,f3,f4,f5,f6,f7] arg0 ->
                                let t1 = Cons[f6,f4] in
                                f3 [f2,t1,f7,0,f5] k in
                              g85 [t3,arg3,t1] k
                            | Nil ->
                              let k = [me,arg1,arg3,t1,t2], fun [f2,f3,f4,f5,f6] arg0 ->
                                match arg0 with
                                | None ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 ->
                                      let k = [], fun [] arg0 -> g41 [arg0] k in
                                      g22 [arg0] k in
                                    g26 [g183,arg0] k in
                                  g26 [g182,g181] k
                                | Some(t1) ->
                                  match t1 with
                                  | Pair(t2,t3) ->
                                    let k = [f2,f3,f6,t2,t3], fun [f2,f3,f4,f5,f6] arg0 ->
                                      let t1 = Cons[f6,f3] in
                                      f2 [f5,t1,g184,0,f4] k in
                                    g85 [t3,f4,f5] k in
                              match arg0 with
                              | FS(t3,t4,t5) ->
                                match t5 with
                                | Nil -> k g180
                                | Cons(t6,t7) ->
                                  let t8 = FS[t3,t4,t7] in
                                  let t9 = Pair[t8,t6] in
                                  let t10 = Some[t9] in
                                  k t10 in
                        let t2 = PRIM_ModInt(f5,128) in
                        let t3 = PRIM_SubInt(128,t2) in
                        let t4 = PRIM_StringLength(f6) in
                        let t5 = PRIM_EqInt(t4,0) in
                        let k = [f5,f7,f9,t1], fun [f2,f3,f4,f5] arg0 ->
                          let t1 = [f2,f5,arg0], fun [f1,f2,f3] me [arg0,arg1,arg2,arg3] k ->
                            let t1 = PRIM_EqInt(arg0,0) in
                            match t1 with
                            | true ->
                              let t2 = PRIM_ModInt(f1,128) in
                              f2 [arg1,arg2,arg3,t2,f3] k
                            | false ->
                              match arg3 with
                              | Cons(t2,t3) ->
                                let t4 = Cons[t2,arg2] in
                                let t5 = PRIM_SubInt(arg0,1) in
                                me [t5,arg1,t4,t3] k
                              | Nil ->
                                let k = [arg0,me,arg2], fun [f2,f3,f4] arg0 ->
                                  match arg0 with
                                  | None ->
                                    let k = [], fun [] arg0 ->
                                      let k = [], fun [] arg0 ->
                                        let k = [], fun [] arg0 -> g41 [arg0] k in
                                        g22 [arg0] k in
                                      g26 [g194,arg0] k in
                                    g26 [g193,g192] k
                                  | Some(t1) ->
                                    match t1 with
                                    | Pair(t2,t3) ->
                                      let k = [f2,f3,f4,t2,t3], fun [f2,f3,f4,f5,f6] arg0 ->
                                        let t1 = [arg0], fun [f1] me [arg0] k ->
                                          let t1 = PRIM_LessInt(arg0,128) in
                                          let k = [f1,arg0,me], fun [f2,f3,f4] arg0 ->
                                            match arg0 with
                                            | true -> k g197
                                            | false ->
                                              let t1 = PRIM_SetBytes(f2,f3,'\NUL') in
                                              let t2 = PRIM_AddInt(f3,1) in
                                              f4 [t2] k in
                                          match t1 with
                                          | true -> k g195
                                          | false -> k g196 in
                                        let k = [f2,f3,f4,f5,f6,arg0], fun [f2,f3,f4,f5,f6,f7] arg0 ->
                                          let t1 = PRIM_FreezeBytes(f7) in
                                          let t2 = Block[t1] in
                                          let k = [f2,f3,f4,f5,f6], fun [f2,f3,f4,f5,f6] arg0 ->
                                            let t1 = Cons[f6,f4] in
                                            let t2 = PRIM_SubInt(f2,1) in
                                            f3 [t2,f5,t1,g198] k in
                                          g83 [f6,t2] k in
                                        t1 [0] k in
                                      PRIM_MakeBytes(128) k in
                                match arg1 with
                                | FS(t2,t3,t4) ->
                                  match t4 with
                                  | Nil -> k g191
                                  | Cons(t5,t6) ->
                                    let t7 = FS[t2,t3,t6] in
                                    let t8 = Pair[t7,t5] in
                                    let t9 = Some[t8] in
                                    k t9 in
                          let k = [f2,f3,t1], fun [f2,f3,f4] arg0 ->
                            let t1 = PRIM_DivInt(f2,128) in
                            f4 [t1,f3,g199,arg0] k in
                          match f4 with
                          | Inode(t2,t3) -> k t3 in
                        match t5 with
                        | true -> k g185
                        | false ->
                          let t6 = PRIM_StringLength(f6) in
                          let t7 = PRIM_LessInt(t3,t6) in
                          let k = [f6,t3,t6], fun [f2,f3,f4] arg0 ->
                            let t1 = PRIM_LessInt(f3,f4) in
                            let k = [arg0], fun [f2] arg0 ->
                              let k = [f2], fun [f2] arg0 ->
                                let t1 = Cons[f2,arg0] in
                                k t1 in
                              g187 [g190,arg0] k in
                            match t1 with
                            | true ->
                              let t2 = PRIM_SubInt(f4,f3) in
                              g68 [f2,f3,t2] k
                            | false -> k g186 in
                          match t7 with
                          | true -> g68 [f6,0,t3] k
                          | false -> k f6 in
                      match t3 with
                      | true -> k t2
                      | false -> k arg0 in
                    match t1 with
                    | Inode(t2,t3) -> k t2 in
                g97 [arg0,f4] k in
              match t2 with
              | FS(t3,t4,t5) -> k t3 in
          match arg0 with
          | true ->
            let t1 = PRIM_SubInt(f8,1) in
            g68 [f7,0,t1] k
          | false -> g26 [f7,g171] k in
        match t2 with
        | true ->
          let t3 = PRIM_SubInt(t1,1) in
          let t4 = PRIM_StringIndex(arg0,t3) in
          let t5 = PRIM_EqChar(t4,'\EOT') in
          k t5
        | false -> k g170 in
      g79 [g169] k in
    let k = [f2,t1,t2,t3,t4,t5], fun [f2,f3,f4,f5,f6,f7] arg0 ->
      let k = [f2,f3,f4,arg0,f5,f6,f7], fun [f2,f3,f4,f5,f6,f7,f8] arg0 ->
        let k = [f2,f3,f4,f5,f6,arg0,f7,f8], fun [f2,f3,f4,f5,f6,f7,f8,f9] arg0 ->
          let t1 = [f3,f4], fun [f1,f2] [arg0] k ->
            let t1 = PRIM_DeRef(f2) in
            match t1 with
            | Some(t2) ->
              let k = [], fun [] arg0 ->
                let k = [], fun [] arg0 ->
                  let k = [], fun [] arg0 -> g41 [arg0] k in
                  g22 [arg0] k in
                g26 [g253,arg0] k in
              g26 [g252,g251] k
            | None ->
              let t2 = Cons['P',g254] in
              let t3 = Cons['\ENQ',t2] in
              let t4 = Cons['(',t3] in
              let k = [f1], fun [f2] arg0 ->
                let k = [f2], fun [f2] arg0 ->
                  let t1 = Block[arg0] in
                  let t2 = BI[0] in
                  let k = [f2], fun [f2] arg0 ->
                    let k = [f2], fun [f2] arg0 ->
                      let t1 = [f2], fun [f1] [arg0] k ->
                        let t1 = II[arg0] in
                        let t2 = Super[40,5,80] in
                        f1 [t2,t1,g256] k in
                      g7 [t1,arg0] k in
                    g9 [0,79] k in
                  g83 [t2,t1] k in
                g26 [g255,arg0] k in
              g24 [t4] k in
          let k = [f2,f3,f4,f5,f6,f7,f8,arg0,f9], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10] arg0 ->
            let k = [f2,f3,f4,f5,f6,f7,f8,f9,arg0,f10], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11] arg0 ->
              let t1 = [f4], fun [f1] [arg0] k ->
                let t1 = PRIM_DeRef(f1) in
                match t1 with
                | None ->
                  let k = [], fun [] arg0 ->
                    let k = [], fun [] arg0 ->
                      let k = [], fun [] arg0 -> g41 [arg0] k in
                      g22 [arg0] k in
                    g26 [g261,arg0] k in
                  g26 [g260,g259] k
                | Some(t2) ->
                  let t3 = PRIM_SetRef(f1,g262) in
                  k t3 in
              let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,arg0,f11], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12] arg0 ->
                let t1 = [f4], fun [f1] [arg0] k ->
                  let t1 = PRIM_DeRef(f1) in
                  match t1 with
                  | None ->
                    let k = [], fun [] arg0 ->
                      let k = [], fun [] arg0 ->
                        let k = [], fun [] arg0 -> g41 [arg0] k in
                        g22 [arg0] k in
                      g26 [g266,arg0] k in
                    g26 [g265,g264] k
                  | Some(t2) ->
                    match t2 with
                    | FS(t3,t4,t5) ->
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
                                                      g26 [g276,arg0] k in
                                                    g26 [arg0,g275] k in
                                                  g31 [arg0] k in
                                                g1 [f2] k in
                                              g41 [arg0] k in
                                            g22 [arg0] k in
                                          g26 [g274,arg0] k in
                                        g26 [arg0,g273] k in
                                      g31 [arg0] k in
                                    g1 [f3] k in
                                  g41 [arg0] k in
                                g22 [arg0] k in
                              g26 [g272,arg0] k in
                            g26 [arg0,g268] k in
                          match f2 with
                          | Super(t1,t2,t3) ->
                            let k = [t1,t2], fun [f2,f3] arg0 ->
                              let k = [f2,f3], fun [f2,f3] arg0 ->
                                let k = [arg0,f2], fun [f2,f3] arg0 ->
                                  let k = [f3], fun [f2] arg0 ->
                                    let k = [f2], fun [f2] arg0 ->
                                      let k = [arg0], fun [f2] arg0 ->
                                        let k = [], fun [] arg0 -> g26 [g271,arg0] k in
                                        g26 [arg0,f2] k in
                                      g31 [f2] k in
                                    g26 [g270,arg0] k in
                                  g26 [arg0,f2] k in
                                g31 [f3] k in
                              g26 [g269,arg0] k in
                            g31 [t3] k in
                        g41 [arg0] k in
                      g22 [g267] k in
                let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,arg0,f12], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13] arg0 ->
                  let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,arg0,f13], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14] arg0 ->
                    let t1 = [f4], fun [f1] [arg0] k ->
                      let t1 = PRIM_DeRef(f1) in
                      match t1 with
                      | None ->
                        let k = [], fun [] arg0 ->
                          let k = [], fun [] arg0 ->
                            let k = [], fun [] arg0 -> g41 [arg0] k in
                            g22 [arg0] k in
                          g26 [g281,arg0] k in
                        g26 [g280,g279] k
                      | Some(t2) ->
                        let k = [arg0], fun [f2] arg0 ->
                          let t1 = II[f2] in
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
                                    g26 [g291,arg0] k in
                                  g31 [f2] k in
                                g26 [g290,arg0] k in
                              g26 [arg0,g282] k in
                            match arg0 with
                            | None -> k g283
                            | Some(t1) ->
                              match t1 with
                              | Inode(t2,t3) ->
                                let k = [t2], fun [f2] arg0 ->
                                  let k = [f2], fun [f2] arg0 ->
                                    let k = [f2], fun [f2] arg0 ->
                                      let k = [f2], fun [f2] arg0 ->
                                        let k = [arg0], fun [f2] arg0 ->
                                          let k = [], fun [] arg0 -> g26 [g289,arg0] k in
                                          g26 [arg0,f2] k in
                                        g31 [f2] k in
                                      g26 [g288,arg0] k in
                                    g26 [arg0,g284] k in
                                  g61 [g287,arg0] k in
                                g2 [g286,t3] k in
                          g97 [arg0,t1] k in
                        match t2 with
                        | FS(t3,t4,t5) -> k t3 in
                    let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15] arg0 ->
                      let t1 = [f4], fun [f1] [arg0] k ->
                        let k = [f1,arg0], fun [f2,f3] arg0 ->
                          let t1 = [f2,f3,arg0], fun [f1,f2,f3] me [arg0] k ->
                            let t1 = PRIM_DeRef(f1) in
                            let k = [f3,arg0,me], fun [f2,f3,f4] arg0 ->
                              let t1 = PRIM_EqInt(arg0,0) in
                              match t1 with
                              | true -> k g303
                              | false ->
                                let t2 = PRIM_FreezeBytes(f2) in
                                let t3 = PRIM_EqInt(arg0,128) in
                                let k = [f3,f4,arg0], fun [f2,f3,f4] arg0 ->
                                  let t1 = PRIM_AddInt(f2,f4) in
                                  f3 [t1] k in
                                match t3 with
                                | true ->
                                  let k = [], fun [] arg0 -> g41 [arg0] k in
                                  g22 [t2] k
                                | false ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 -> g41 [arg0] k in
                                    g22 [arg0] k in
                                  g68 [t2,0,arg0] k in
                            match t1 with
                            | None ->
                              let k = [], fun [] arg0 ->
                                let k = [], fun [] arg0 ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 -> k 0 in
                                    g41 [arg0] k in
                                  g22 [arg0] k in
                                g26 [g295,arg0] k in
                              g26 [g294,g293] k
                            | Some(t2) ->
                              let k = [f2,f3,arg0], fun [f2,f3,f4] arg0 ->
                                let t1 = II[f2] in
                                let k = [f3,f4], fun [f2,f3] arg0 ->
                                  match arg0 with
                                  | None ->
                                    let k = [], fun [] arg0 ->
                                      let k = [], fun [] arg0 ->
                                        let k = [], fun [] arg0 ->
                                          let k = [], fun [] arg0 -> k 0 in
                                          g41 [arg0] k in
                                        g22 [arg0] k in
                                      g26 [g298,arg0] k in
                                    g26 [g297,g296] k
                                  | Some(t1) ->
                                    let t2 = [f2], fun [f1] me [arg0,arg1,arg2] k ->
                                      let t1 = PRIM_LessInt(0,arg1) in
                                      let k = [f1,arg0,me,arg1,arg2], fun [f2,f3,f4,f5,f6] arg0 ->
                                        match arg0 with
                                        | true -> k 0
                                        | false ->
                                          match f3 with
                                          | Nil -> k 0
                                          | Cons(t1,t2) ->
                                            let t3 = PRIM_LessInt(f6,128) in
                                            let k = [f2,f4,f5,f6,t1,t2], fun [f2,f3,f4,f5,f6,f7] arg0 ->
                                              match arg0 with
                                              | true ->
                                                let t1 = PRIM_SubInt(f5,128) in
                                                f3 [f7,f4,t1] k
                                              | false ->
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
                                                      | Block(t1) -> k t1 in
                                                    g84 [f4] k in
                                                  match t1 with
                                                  | true -> k 128
                                                  | false -> k arg0 in
                                                match t2 with
                                                | true -> k t1
                                                | false -> k f4 in
                                            match t3 with
                                            | true -> k g301
                                            | false -> k g302 in
                                      match t1 with
                                      | true -> k g299
                                      | false -> k g300 in
                                    let k = [f3,t1,t2], fun [f2,f3,f4] arg0 ->
                                      let k = [f2,f4,arg0], fun [f2,f3,f4] arg0 ->
                                        let t1 = PRIM_SubInt(arg0,f2) in
                                        f3 [f4,t1,f2] k in
                                      match f3 with
                                      | Inode(t1,t2) -> k t1 in
                                    match t1 with
                                    | Inode(t3,t4) -> k t4 in
                                g97 [arg0,t1] k in
                              match t2 with
                              | FS(t3,t4,t5) -> k t3 in
                          t1 [0] k in
                        PRIM_MakeBytes(128) k in
                      let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16] arg0 ->
                        let t1 = [f3,f4], fun [f1,f2] [arg0] k ->
                          let t1 = PRIM_DeRef(f2) in
                          match t1 with
                          | None ->
                            let k = [], fun [] arg0 ->
                              let k = [], fun [] arg0 ->
                                let k = [], fun [] arg0 -> g41 [arg0] k in
                                g22 [arg0] k in
                              g26 [g307,arg0] k in
                            g26 [g306,g305] k
                          | Some(t2) ->
                            let k = [f1,f2,arg0,t2], fun [f2,f3,f4,f5] arg0 ->
                              let t1 = II[f4] in
                              let k = [f2,f3,f4,f5,arg0], fun [f2,f3,f4,f5,f6] arg0 ->
                                match arg0 with
                                | None ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 ->
                                      let k = [], fun [] arg0 -> g41 [arg0] k in
                                      g22 [arg0] k in
                                    g26 [g310,arg0] k in
                                  g26 [g309,g308] k
                                | Some(t1) ->
                                  match t1 with
                                  | Inode(t2,t3) ->
                                    let k = [f2,f3,f4,f6,t3], fun [f2,f3,f4,f5,f6] arg0 ->
                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                        let t1 = II[f4] in
                                        let k = [f3,arg0], fun [f2,f3] arg0 ->
                                          let t1 = Some[f3] in
                                          let t2 = PRIM_SetRef(f2,t1) in
                                          k g312 in
                                        f2 [f5,t1,g311] k in
                                      g110 [arg0,f6] k in
                                    match f5 with
                                    | FS(t4,t5,t6) ->
                                      let t7 = II[f4] in
                                      let t8 = Cons[t7,t5] in
                                      let t9 = FS[t4,t8,t6] in
                                      k t9 in
                              g97 [arg0,t1] k in
                            match t2 with
                            | FS(t3,t4,t5) -> k t3 in
                        let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17] arg0 ->
                          let t1 = [f3,f4,f14], fun [f1,f2,f3] [arg0] k ->
                            let t1 = PRIM_DeRef(f2) in
                            let k = [f3], fun [f2] arg0 ->
                              match arg0 with
                              | None -> k g324
                              | Some(t1) ->
                                let k = [f2,t1], fun [f2,f3] arg0 ->
                                  let k = [f2,f3], fun [f2,f3] arg0 ->
                                    let k = [f2,f3], fun [f2,f3] arg0 ->
                                      let k = [f2,f3], fun [f2,f3] arg0 ->
                                        let k = [f2,f3], fun [f2,f3] arg0 ->
                                          let k = [f2,f3], fun [f2,f3] arg0 -> f2 [f3,0] k in
                                          g41 [arg0] k in
                                        g22 [arg0] k in
                                      g26 [g326,arg0] k in
                                    g26 [arg0,g325] k in
                                  g31 [arg0] k in
                                match t1 with
                                | II(t2) -> k t2 in
                            match t1 with
                            | None ->
                              let k = [], fun [] arg0 ->
                                let k = [], fun [] arg0 ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 -> k g317 in
                                    g41 [arg0] k in
                                  g22 [arg0] k in
                                g26 [g316,arg0] k in
                              g26 [g315,g314] k
                            | Some(t2) ->
                              let k = [f1,f2], fun [f2,f3] arg0 ->
                                match arg0 with
                                | None ->
                                  let k = [], fun [] arg0 ->
                                    let k = [], fun [] arg0 ->
                                      let k = [], fun [] arg0 ->
                                        let k = [], fun [] arg0 -> k g322 in
                                        g41 [arg0] k in
                                      g22 [arg0] k in
                                    g26 [g321,arg0] k in
                                  g26 [g320,g319] k
                                | Some(t1) ->
                                  match t1 with
                                  | Pair(t2,t3) ->
                                    let k = [f2,f3,t2,t3], fun [f2,f3,f4,f5] arg0 ->
                                      let t1 = Inode[0,g323] in
                                      let t2 = Some[t1] in
                                      let k = [f3,f4,f5], fun [f2,f3,f4] arg0 ->
                                        let t1 = Some[f3] in
                                        let t2 = PRIM_SetRef(f2,t1) in
                                        let t3 = Some[f4] in
                                        k t3 in
                                      f2 [arg0,f5,t2] k in
                                    match t2 with
                                    | FS(t4,t5,t6) -> k t4 in
                              match t2 with
                              | FS(t3,t4,t5) ->
                                match t4 with
                                | Nil -> k g318
                                | Cons(t6,t7) ->
                                  let t8 = FS[t3,t7,t5] in
                                  let t9 = Pair[t8,t6] in
                                  let t10 = Some[t9] in
                                  k t10 in
                          let k = [f2,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17] arg0 ->
                            let t1 = [f3,f13], fun [f1,f2] [arg0] k ->
                              let k = [f1,f2,arg0], fun [f2,f3,f4] arg0 ->
                                let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                  let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                      let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                        let t1 = PRIM_DeRef(f2) in
                                        let k = [f3,f4], fun [f2,f3] arg0 ->
                                          match arg0 with
                                          | None -> k g338
                                          | Some(t1) ->
                                            let k = [f2,f3], fun [f2,f3] arg0 ->
                                              let t1 = II[f3] in
                                              f2 [t1,arg0] k in
                                            match t1 with
                                            | Inode(t2,t3) -> k t2 in
                                        match t1 with
                                        | None ->
                                          let k = [], fun [] arg0 ->
                                            let k = [], fun [] arg0 ->
                                              let k = [], fun [] arg0 ->
                                                let k = [], fun [] arg0 -> k g333 in
                                                g41 [arg0] k in
                                              g22 [arg0] k in
                                            g26 [g332,arg0] k in
                                          g26 [g331,g330] k
                                        | Some(t2) ->
                                          let k = [f4], fun [f2] arg0 ->
                                            let t1 = II[f2] in
                                            let k = [], fun [] arg0 ->
                                              match arg0 with
                                              | None ->
                                                let k = [], fun [] arg0 ->
                                                  let k = [], fun [] arg0 ->
                                                    let k = [], fun [] arg0 ->
                                                      let k = [], fun [] arg0 -> k g337 in
                                                      g41 [arg0] k in
                                                    g22 [arg0] k in
                                                  g26 [g336,arg0] k in
                                                g26 [g335,g334] k
                                              | Some(t1) ->
                                                let t2 = Some[t1] in
                                                k t2 in
                                            g97 [arg0,t1] k in
                                          match t2 with
                                          | FS(t3,t4,t5) -> k t3 in
                                      g41 [arg0] k in
                                    g22 [arg0] k in
                                  g26 [g329,arg0] k in
                                g26 [arg0,g328] k in
                              g31 [arg0] k in
                            let k = [f2,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17] arg0 ->
                              let t1 = [f12], fun [f1] [arg0,arg1] k ->
                                let k = [f1,arg0,arg1], fun [f2,f3,f4] arg0 ->
                                  let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                      let k = [f2,f3,f4,arg0], fun [f2,f3,f4,f5] arg0 ->
                                        let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                          let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                              let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                let t1 = II[f3] in
                                                f2 [t1,f4] k in
                                              g41 [arg0] k in
                                            g22 [arg0] k in
                                          g26 [g342,arg0] k in
                                        g26 [arg0,f5] k in
                                      g31 [f3] k in
                                    g26 [g341,arg0] k in
                                  g26 [arg0,g340] k in
                                g31 [arg1] k in
                              let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f13,f14,f15,f16,f17,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17] arg0 ->
                                let k = [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,arg0], fun [f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18] arg0 ->
                                  let t1 = Cons[arg0,g352] in
                                  let t2 = Cons[f18,t1] in
                                  let t3 = Cons[f17,t2] in
                                  let t4 = Cons[f16,t3] in
                                  let t5 = Cons[f15,t4] in
                                  let t6 = Cons[f14,t5] in
                                  let t7 = Cons[f13,t6] in
                                  let t8 = Cons[f12,t7] in
                                  let t9 = Cons[f11,t8] in
                                  let t10 = Cons[f10,t9] in
                                  let t11 = Cons[f9,t10] in
                                  let t12 = Cons[f8,t11] in
                                  let t13 = Cons[f7,t12] in
                                  let t14 = Cons[f5,t13] in
                                  let t15 = Cons[f3,t14] in
                                  let t16 = Cmap[t15] in
                                  let t17 = [f2,t16], fun [f1,f2] me [arg0] k ->
                                    let k = [f1,f2,arg0,me], fun [f2,f3,f4,f5] arg0 ->
                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                              let k = [f3,f4,f5,arg0], fun [f2,f3,f4,f5] arg0 ->
                                                match arg0 with
                                                | true ->
                                                  let k = [], fun [] arg0 -> g41 [arg0] k in
                                                  g22 [g355] k
                                                | false ->
                                                  let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                      let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                        let k = [f3,f4], fun [f2,f3] arg0 ->
                                                          let t1 = PRIM_AddInt(f2,1) in
                                                          f3 [t1] k in
                                                        match arg0 with
                                                        | Nil -> k g358
                                                        | Cons(t1,t2) ->
                                                          let t3 = [t1], fun [f1] me [arg0] k ->
                                                            match arg0 with
                                                            | Nil -> k g359
                                                            | Cons(t1,t2) ->
                                                              match t1 with
                                                              | Pair(t3,t4) ->
                                                                let k = [me,t2,t4], fun [f2,f3,f4] arg0 ->
                                                                  match arg0 with
                                                                  | true ->
                                                                    let t1 = Some[f4] in
                                                                    k t1
                                                                  | false -> f2 [f3] k in
                                                                g56 [t3,f1] k in
                                                          let k = [t1,t2,t3], fun [f2,f3,f4] arg0 ->
                                                            let k = [f2,f3], fun [f2,f3] arg0 ->
                                                              match arg0 with
                                                              | None ->
                                                                let k = [], fun [] arg0 ->
                                                                  let k = [], fun [] arg0 ->
                                                                    let k = [], fun [] arg0 ->
                                                                      let k = [], fun [] arg0 -> g41 [arg0] k in
                                                                      g22 [arg0] k in
                                                                    g26 [g362,arg0] k in
                                                                  g26 [arg0,g361] k in
                                                                g26 [f2,g360] k
                                                              | Some(t1) ->
                                                                match t1 with
                                                                | Command(t2) -> t2 [f3] k in
                                                            f4 [arg0] k in
                                                          match f2 with
                                                          | Cmap(t4) -> k t4 in
                                                      g20 [g357,arg0] k in
                                                    g62 [g356,arg0] k in
                                                  g22 [f5] k in
                                              g56 [arg0,f2] k in
                                            g79 [g354] k in
                                          g41 [arg0] k in
                                        g22 [arg0] k in
                                      g26 [arg0,g353] k in
                                    g31 [arg0] k in
                                  let k = [f4,f6,t17], fun [f2,f3,f4] arg0 ->
                                    let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                      let k = [f2,f3,f4,arg0], fun [f2,f3,f4,f5] arg0 ->
                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                          let t1 = PRIM_PutChar('\n') in
                                          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                              let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                  let t1 = PRIM_PutChar('\n') in
                                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                    let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                          let t1 = PRIM_PutChar('\n') in
                                                          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                              let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                  let t1 = PRIM_PutChar('\n') in
                                                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                    let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                          let t1 = PRIM_PutChar('\n') in
                                                                          let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                            let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                              let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                                let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                                  let t1 = PRIM_PutChar('\n') in
                                                                                  let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                                    let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                                      let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                                        let k = [f2,f3,f4,f5], fun [f2,f3,f4,f5] arg0 ->
                                                                                          let t1 = PRIM_PutChar('\n') in
                                                                                          let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                                                            let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                                                              let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                                                                let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                                                                  let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
                                                                                                    let k = [f3,f4], fun [f2,f3] arg0 ->
                                                                                                      let k = [f3], fun [f2] arg0 -> f2 [1] k in
                                                                                                      f2 [g375] k in
                                                                                                    f2 [g374] k in
                                                                                                  g41 [arg0] k in
                                                                                                g22 [arg0] k in
                                                                                              g26 [g373,arg0] k in
                                                                                            g26 [arg0,g371] k in
                                                                                          g61 [g372,f5] k in
                                                                                        g41 [arg0] k in
                                                                                      g22 [arg0] k in
                                                                                    g26 [g370,arg0] k in
                                                                                  g31 [768] k in
                                                                                g41 [arg0] k in
                                                                              g22 [arg0] k in
                                                                            g26 [g369,arg0] k in
                                                                          g31 [40] k in
                                                                        g41 [arg0] k in
                                                                      g22 [arg0] k in
                                                                    g26 [g368,arg0] k in
                                                                  g31 [128] k in
                                                                g41 [arg0] k in
                                                              g22 [arg0] k in
                                                            g26 [g367,arg0] k in
                                                          g31 [5120] k in
                                                        g41 [arg0] k in
                                                      g22 [arg0] k in
                                                    g26 [g366,arg0] k in
                                                  g31 [10] k in
                                                g41 [arg0] k in
                                              g22 [arg0] k in
                                            g26 [g365,arg0] k in
                                          g31 [512] k in
                                        g41 [arg0] k in
                                      g22 [g364] k in
                                    g113 [g363,arg0] k in
                                  match t16 with
                                  | Cmap(t18) -> k t18 in
                                g120 [g351,g350] k in
                              g154 [g343,t1] k in
                            g133 [g339,t1] k in
                          g120 [g327,t1] k in
                        g133 [g313,t1] k in
                      g133 [g304,t1] k in
                    g133 [g292,t1] k in
                  g120 [g278,f8] k in
                g120 [g277,t1] k in
              g120 [g263,t1] k in
            g120 [g258,f6] k in
          g120 [g257,t1] k in
        g133 [g250,g249] k in
      g120 [g243,g242] k in
    g120 [g232,g231] k in
  g24 [t2] k in
g24 [t3] k
