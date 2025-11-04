(*Stage4 (CCF)*)
let k () = ()
let g1 = Nil0 in
let g2 = fun [arg0] k ->
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
  t1 [g1,t3] k in
let g4 = Unit0 in
let g3 = fun [arg0] k ->
  match arg0 with
  | Nil0 -> k g4
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g3 [t2] k in
let g5 = fun [arg0,arg1] k ->
  let t1 = PRIM_EqInt(arg1,0) in
  match t1 with
  | true1 -> k arg0
  | false0 ->
    let t2 = PRIM_ModInt(arg1,10) in
    let t3 = PRIM_AddInt(48,t2) in
    let t4 = PRIM_CharChr(t3) in
    let t5 = PRIM_DivInt(arg1,10) in
    let t6 = Cons1[t4,arg0] in
    g5 [t6,t5] k in
let g6 = Nil0 in
let g7 = Nil0 in
let g8 = fun [arg0,arg1] k ->
  let t1 = PRIM_EqInt(arg1,0) in
  match t1 with
  | true1 -> k arg0
  | false0 ->
    let t2 = PRIM_ModInt(arg1,10) in
    let t3 = PRIM_AddInt(48,t2) in
    let t4 = PRIM_CharChr(t3) in
    let t5 = PRIM_DivInt(arg1,10) in
    let t6 = Cons1[t4,arg0] in
    g8 [t6,t5] k in
let g9 = Nil0 in
let g10 = Nil0 in
let g11 = fun [arg0] k ->
  let t1 = PRIM_LessInt(arg0,0) in
  match t1 with
  | true1 ->
    let t2 = PRIM_SubInt(0,arg0) in
    let t3 = PRIM_EqInt(t2,0) in
    let k = [], fun [] arg0 ->
      let t1 = Cons1['-',arg0] in
      g3 [t1] k in
    match t3 with
    | true1 ->
      let t4 = Cons1['0',g6] in
      k t4
    | false0 -> g5 [g7,t2] k
  | false0 ->
    let t2 = PRIM_EqInt(arg0,0) in
    let k = [], fun [] arg0 -> g3 [arg0] k in
    match t2 with
    | true1 ->
      let t3 = Cons1['0',g9] in
      k t3
    | false0 -> g8 [g10,arg0] k in
let g13 = Nil0 in
let g12 = fun [arg0,arg1] k ->
  let t1 = PRIM_EqInt(arg0,0) in
  match t1 with
  | true1 -> k arg1
  | false0 ->
    match arg1 with
    | Nil0 -> k g13
    | Cons1(t2,t3) ->
      let t4 = PRIM_SubInt(arg0,1) in
      g12 [t4,t3] k in
let g14 = "local_at_put" in
let g15 = "local_at" in
let g16 = "run out of instructions" in
let g17 = false0 in
let g18 = true1 in
let g19 = DEC4 in
let g20 = "(Ocaml)Result: " in
let g21 = PRINT5[g20] in
let g22 = PRINTI6 in
let g23 = "\n" in
let g24 = PRINT5[g23] in
let g25 = HALT8 in
let g26 = Nil0 in
let g27 = Cons1[g25,g26] in
let g28 = Cons1[g24,g27] in
let g29 = Cons1[g22,g28] in
let g30 = Unit0 in
let g31 = DEC4 in
let g32 = "(Ocaml)Result: " in
let g33 = PRINT5[g32] in
let g34 = PRINTI6 in
let g35 = "\n" in
let g36 = PRINT5[g35] in
let g37 = HALT8 in
let g38 = Nil0 in
let g39 = Cons1[g37,g38] in
let g40 = Cons1[g36,g39] in
let g41 = Cons1[g34,g40] in
let g42 = Unit0 in
let t1 = VALUE0[0] in
let t2 = PRIM_MakeRef(t1) in
let t3 = VALUE0[0] in
let t4 = PRIM_MakeRef(t3) in
let t5 = [t2,t4], fun [f1,f2] [arg0,arg1] k ->
  let t1 = PRIM_EqInt(arg0,0) in
  match t1 with
  | true1 ->
    let t2 = PRIM_SetRef(f1,arg1) in
    k t2
  | false0 ->
    let t2 = PRIM_EqInt(arg0,1) in
    match t2 with
    | true1 ->
      let t3 = PRIM_SetRef(f2,arg1) in
      k t3
    | false0 ->
      let t3 = PRIM_Crash(g14) in
      k t3 in
let t6 = [t2,t4], fun [f1,f2] [arg0] k ->
  let t1 = PRIM_EqInt(arg0,0) in
  match t1 with
  | true1 ->
    let t2 = PRIM_DeRef(f1) in
    k t2
  | false0 ->
    let t2 = PRIM_EqInt(arg0,1) in
    match t2 with
    | true1 ->
      let t3 = PRIM_DeRef(f2) in
      k t3
    | false0 ->
      let t3 = PRIM_Crash(g15) in
      k t3 in
let t7 = VALUE0[0] in
let t8 = PRIM_MakeRef(t7) in
let t9 = [t5,t6,t8], fun [f1,f2,f3] me [arg0] k ->
  match arg0 with
  | Nil0 ->
    let t1 = PRIM_Crash(g16) in
    k t1
  | Cons1(t1,t2) ->
    match t1 with
    | LOAD_IMMEDIATE0(t3) ->
      let t4 = PRIM_SetRef(f3,t3) in
      me [t2] k
    | STORE_LOCAL1(t3) ->
      let t4 = PRIM_DeRef(f3) in
      let k = [me,t2], fun [f2,f3] arg0 -> f2 [f3] k in
      f1 [t3,t4] k
    | LOAD_LOCAL2(t3) ->
      let k = [f3,me,t2], fun [f2,f3,f4] arg0 ->
        let t1 = PRIM_SetRef(f2,arg0) in
        f3 [f4] k in
      f2 [t3] k
    | ADD3(t3,t4) ->
      let k = [f2,f3,me,t2,t4], fun [f2,f3,f4,f5,f6] arg0 ->
        let k = [f3,f4,f5,arg0], fun [f2,f3,f4,f5] arg0 ->
          let k = [f2,f3,f4,arg0], fun [f2,f3,f4,f5] arg0 ->
            let k = [f2,f3,f4,arg0], fun [f2,f3,f4,f5] arg0 ->
              let t1 = PRIM_AddInt(f5,arg0) in
              let t2 = VALUE0[t1] in
              let t3 = PRIM_SetRef(f2,t2) in
              f3 [f4] k in
            match f5 with
            | VALUE0(t1) -> k t1 in
          match f5 with
          | VALUE0(t1) -> k t1 in
        f2 [f6] k in
      f2 [t3] k
    | DEC4 ->
      let t3 = PRIM_DeRef(f3) in
      let k = [f3,me,t2], fun [f2,f3,f4] arg0 ->
        let t1 = PRIM_SubInt(arg0,1) in
        let t2 = VALUE0[t1] in
        let t3 = PRIM_SetRef(f2,t2) in
        f3 [f4] k in
      match t3 with
      | VALUE0(t4) -> k t4
    | PRINTI6 ->
      let t3 = PRIM_DeRef(f3) in
      let k = [me,t2], fun [f2,f3] arg0 ->
        let k = [f2,f3], fun [f2,f3] arg0 -> f2 [f3] k in
        g11 [arg0] k in
      match t3 with
      | VALUE0(t4) -> k t4
    | PRINT5(t3) ->
      let k = [me,t2], fun [f2,f3] arg0 ->
        let k = [f2,f3], fun [f2,f3] arg0 -> f2 [f3] k in
        g3 [arg0] k in
      g2 [t3] k
    | JMPNZ7(t3) ->
      let t4 = PRIM_DeRef(f3) in
      let k = [me,t2,t3], fun [f2,f3,f4] arg0 ->
        let t1 = PRIM_EqInt(arg0,0) in
        let k = [f2,f3,f4], fun [f2,f3,f4] arg0 ->
          match arg0 with
          | true1 ->
            let t1 = VALUE0[0] in
            let t2 = LOAD_IMMEDIATE0[t1] in
            let t3 = STORE_LOCAL1[0] in
            let t4 = VALUE0[10] in
            let t5 = LOAD_IMMEDIATE0[t4] in
            let t6 = STORE_LOCAL1[1] in
            let t7 = ADD3[0,1] in
            let t8 = STORE_LOCAL1[0] in
            let t9 = LOAD_LOCAL2[1] in
            let t10 = STORE_LOCAL1[1] in
            let t11 = JMPNZ7[4] in
            let t12 = LOAD_LOCAL2[0] in
            let t13 = Cons1[t12,g29] in
            let t14 = Cons1[g21,t13] in
            let t15 = Cons1[t11,t14] in
            let t16 = Cons1[t10,t15] in
            let t17 = Cons1[g19,t16] in
            let t18 = Cons1[t9,t17] in
            let t19 = Cons1[t8,t18] in
            let t20 = Cons1[t7,t19] in
            let t21 = Cons1[t6,t20] in
            let t22 = Cons1[t5,t21] in
            let t23 = Cons1[t3,t22] in
            let t24 = Cons1[t2,t23] in
            let k = [f2], fun [f2] arg0 -> f2 [arg0] k in
            g12 [f4,t24] k
          | false0 -> f2 [f3] k in
        match t1 with
        | true1 -> k g17
        | false0 -> k g18 in
      match t4 with
      | VALUE0(t5) -> k t5
    | HALT8 -> k g30 in
let t10 = VALUE0[0] in
let t11 = LOAD_IMMEDIATE0[t10] in
let t12 = STORE_LOCAL1[0] in
let t13 = VALUE0[10] in
let t14 = LOAD_IMMEDIATE0[t13] in
let t15 = STORE_LOCAL1[1] in
let t16 = ADD3[0,1] in
let t17 = STORE_LOCAL1[0] in
let t18 = LOAD_LOCAL2[1] in
let t19 = STORE_LOCAL1[1] in
let t20 = JMPNZ7[4] in
let t21 = LOAD_LOCAL2[0] in
let t22 = Cons1[t21,g41] in
let t23 = Cons1[g33,t22] in
let t24 = Cons1[t20,t23] in
let t25 = Cons1[t19,t24] in
let t26 = Cons1[g31,t25] in
let t27 = Cons1[t18,t26] in
let t28 = Cons1[t17,t27] in
let t29 = Cons1[t16,t28] in
let t30 = Cons1[t15,t29] in
let t31 = Cons1[t14,t30] in
let t32 = Cons1[t12,t31] in
let t33 = Cons1[t11,t32] in
let k = [], fun [] arg0 -> k g42 in
t9 [t33] k
