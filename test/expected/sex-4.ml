(*Stage4 (CCF)*)
let k () = ()
let g1 = fun arg k ->
  let t1 = [arg], fun [f1] arg k -> f1 arg k in
  k t1 in
let g2 = false0 in
let g3 = true1 in
let g4 = Unit0 in
let g5 = fun arg k ->
  let t1 = PRIM_MakeBytes(512) in
  let t2 = [arg,t1], fun [f1,f2] me arg k ->
    let t1 = PRIM_LessInt(arg,512) in
    let k = [f1,f2,arg,me], fun [f2,f3,f4,f5] arg ->
      match arg with
      | true1 -> k g4
      | false0 ->
        let t1 = PRIM_SetBytes(f3,f4,f2) in
        let t2 = PRIM_AddInt(f4,1) in
        f5 t2 k in
    match t1 with
    | true1 -> k g2
    | false0 -> k g3 in
  let k = [t1], fun [f2] arg ->
    let t1 = PRIM_FreezeBytes(f2) in
    k t1 in
  t2 0 k in
let g6 = Unit0 in
let g7 = false0 in
let g8 = true1 in
let g9 = Unit0 in
let g10 = false0 in
let g11 = Unit0 in
let g12 = false0 in
let g13 = true1 in
let g14 = Unit0 in
let g15 = false0 in
let g16 = Unit0 in
let k = [], fun [] arg ->
  let t1 = PRIM_MakeBytes(512) in
  let t2 = PRIM_LoadSec(6,t1) in
  let t3 = PRIM_FreezeBytes(t1) in
  let t4 = [t3], fun [f1] me arg k ->
    let t1 = PRIM_ModInt(arg,64) in
    let t2 = PRIM_EqInt(t1,0) in
    let k = [f1,arg,me], fun [f2,f3,f4] arg ->
      let t1 = PRIM_LessInt(f3,512) in
      let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
        match arg with
        | true1 -> k g9
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
          | true1 -> k g10
          | false0 ->
            let t4 = PRIM_LessInt(t2,127) in
            k t4 in
      match t1 with
      | true1 -> k g7
      | false0 -> k g8 in
    match t2 with
    | true1 ->
      let t3 = PRIM_PutChar('\n') in
      k t3
    | false0 -> k g6 in
  let k = [t3], fun [f2] arg ->
    let t1 = PRIM_MakeBytes(512) in
    let t2 = PRIM_LoadSec(7,t1) in
    let t3 = PRIM_FreezeBytes(t1) in
    let t4 = [t3], fun [f1] me arg k ->
      let t1 = PRIM_ModInt(arg,64) in
      let t2 = PRIM_EqInt(t1,0) in
      let k = [f1,arg,me], fun [f2,f3,f4] arg ->
        let t1 = PRIM_LessInt(f3,512) in
        let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
          match arg with
          | true1 -> k g14
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
            | true1 -> k g15
            | false0 ->
              let t4 = PRIM_LessInt(t2,127) in
              k t4 in
        match t1 with
        | true1 -> k g12
        | false0 -> k g13 in
      match t2 with
      | true1 ->
        let t3 = PRIM_PutChar('\n') in
        k t3
      | false0 -> k g11 in
    let k = [f2,t3], fun [f2,f3] arg ->
      let t1 = PRIM_StoreSec(6,f3) in
      let t2 = PRIM_StoreSec(7,f2) in
      k g16 in
    t4 0 k in
  t4 0 k in
g1 g5 k
