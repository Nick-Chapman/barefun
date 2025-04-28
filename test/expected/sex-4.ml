(*Stage4 (CCF)*)
let k () = ()
let g3 = false0 in
let g4 = true1 in
let g5 = Unit0 in
let g6 = "sector:" in
let g2 = fun arg k ->
  let t1 = PRIM_LessInt(arg,7) in
  let k = [arg], fun [f2] arg ->
    match arg with
    | true1 -> k g5
    | false0 ->
      let t1 = PRIM_StringIndex(g6,f2) in
      let t2 = PRIM_PutChar(t1) in
      let t3 = PRIM_AddInt(f2,1) in
      g2 t3 k in
  match t1 with
  | true1 -> k g3
  | false0 -> k g4 in
let g8 = Unit0 in
let g7 = fun arg k ->
  let t1 = PRIM_EqInt(arg,0) in
  match t1 with
  | true1 -> k g8
  | false0 ->
    let t2 = PRIM_DivInt(arg,10) in
    let k = [arg], fun [f2] arg ->
      let t1 = PRIM_ModInt(f2,10) in
      let t2 = PRIM_AddInt(48,t1) in
      let t3 = PRIM_CharChr(t2) in
      let t4 = PRIM_PutChar(t3) in
      k t4 in
    g7 t2 k in
let g9 = Unit0 in
let g10 = false0 in
let g11 = true1 in
let g12 = Unit0 in
let g13 = false0 in
let g15 = false0 in
let g16 = true1 in
let g17 = Unit0 in
let g18 = "(space=" in
let g14 = fun arg k ->
  let t1 = PRIM_LessInt(arg,7) in
  let k = [arg], fun [f2] arg ->
    match arg with
    | true1 -> k g17
    | false0 ->
      let t1 = PRIM_StringIndex(g18,f2) in
      let t2 = PRIM_PutChar(t1) in
      let t3 = PRIM_AddInt(f2,1) in
      g14 t3 k in
  match t1 with
  | true1 -> k g15
  | false0 -> k g16 in
let g19 = Unit0 in
let g21 = Unit0 in
let g20 = fun arg k ->
  let t1 = PRIM_EqInt(arg,0) in
  match t1 with
  | true1 -> k g21
  | false0 ->
    let t2 = PRIM_DivInt(arg,10) in
    let k = [arg], fun [f2] arg ->
      let t1 = PRIM_ModInt(f2,10) in
      let t2 = PRIM_AddInt(48,t1) in
      let t3 = PRIM_CharChr(t2) in
      let t4 = PRIM_PutChar(t3) in
      k t4 in
    g20 t2 k in
let g23 = false0 in
let g24 = true1 in
let g25 = Unit0 in
let g26 = ")" in
let g22 = fun arg k ->
  let t1 = PRIM_LessInt(arg,1) in
  let k = [arg], fun [f2] arg ->
    match arg with
    | true1 -> k g25
    | false0 ->
      let t1 = PRIM_StringIndex(g26,f2) in
      let t2 = PRIM_PutChar(t1) in
      let t3 = PRIM_AddInt(f2,1) in
      g22 t3 k in
  match t1 with
  | true1 -> k g23
  | false0 -> k g24 in
let g27 = Unit0 in
let g1 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let t1 = PRIM_EqInt(f2,0) in
    let k = [f2], fun [f2] arg ->
      let t1 = PRIM_MakeBytes(512) in
      let t2 = PRIM_LoadSec(f2,t1) in
      let t3 = PRIM_FreezeBytes(t1) in
      let t4 = [t3], fun [f1] me arg k ->
        let t1 = PRIM_ModInt(arg,64) in
        let t2 = PRIM_EqInt(t1,0) in
        let k = [f1,arg,me], fun [f2,f3,f4] arg ->
          let t1 = PRIM_LessInt(f3,512) in
          let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
            match arg with
            | true1 -> k g12
            | false0 ->
              let t1 = PRIM_StringIndex(f2,f3) in
              let t2 = PRIM_CharOrd(t1) in
              let t3 = PRIM_LessInt(t2,32) in
              let k = [f3,f4,t1], fun [f2,f3,f4] arg ->
                let k = [f2,f3], fun [f2,f3] arg ->
                  let t1 = PRIM_PutChar(arg) in
                  let t2 = PRIM_AddInt(f2,1) in
                  f3 t2 k in
                match arg with
                | true1 -> k f4
                | false0 -> k '.' in
              match t3 with
              | true1 -> k g13
              | false0 ->
                let t4 = PRIM_LessInt(t2,127) in
                k t4 in
          match t1 with
          | true1 -> k g10
          | false0 -> k g11 in
        match t2 with
        | true1 ->
          let t3 = PRIM_PutChar('\n') in
          k t3
        | false0 -> k g9 in
      let k = [f2], fun [f2] arg ->
        let k = [f2], fun [f2] arg ->
          let t1 = PRIM_GetStackPointer(g19) in
          let t2 = PRIM_EqInt(t1,0) in
          let k = [f2], fun [f2] arg ->
            let k = [f2], fun [f2] arg ->
              let t1 = PRIM_PutChar('\n') in
              let t2 = PRIM_GetChar(g27) in
              let t3 = PRIM_AddInt(f2,1) in
              g1 t3 k in
            g22 0 k in
          match t2 with
          | true1 ->
            let t3 = PRIM_PutChar('0') in
            k t3
          | false0 -> g20 t1 k in
        g14 0 k in
      t4 0 k in
    match t1 with
    | true1 ->
      let t2 = PRIM_PutChar('0') in
      k t2
    | false0 -> g7 f2 k in
  g2 0 k in
g1 1 k
