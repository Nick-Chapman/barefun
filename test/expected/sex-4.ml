(*Stage4 (CCF)*)
let k () = ()
let g2 = Unit0 in
let g1 = fun arg k ->
  match arg with
  | Nil0 -> k g2
  | Cons1(t1,t2) ->
    let t3 = PRIM_PutChar(t1) in
    g1 t2 k in
let g5 = "internal:" in
let g4 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g5,arg) in
      let t3 = Cons1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,1) in
        arg t1 k in
      g4 t3 k in
  k t1 in
let g6 = Nil0 in
let g7 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g7 t5 k in
  k t1 in
let g8 = Nil0 in
let g9 = Nil0 in
let g11 = "user-code:" in
let g10 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_LessInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_StringIndex(g11,arg) in
      let t3 = Cons1[t2,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_SubInt(f2,1) in
        arg t1 k in
      g10 t3 k in
  k t1 in
let g12 = Nil0 in
let g13 = fun arg k ->
  let t1 = [arg], fun [f1] arg k ->
    let t1 = PRIM_EqInt(arg,0) in
    match t1 with
    | true1 -> k f1
    | false0 ->
      let t2 = PRIM_ModInt(arg,10) in
      let t3 = PRIM_AddInt(48,t2) in
      let t4 = PRIM_CharChr(t3) in
      let t5 = Cons1[t4,f1] in
      let k = [arg], fun [f2] arg ->
        let t1 = PRIM_DivInt(f2,10) in
        arg t1 k in
      g13 t5 k in
  k t1 in
let g14 = Nil0 in
let g15 = Nil0 in
let g16 = Unit0 in
let g17 = false0 in
let g18 = true1 in
let g19 = Unit0 in
let g20 = false0 in
let g21 = Unit0 in
let g3 = fun arg k ->
  let k = [arg], fun [f2] arg ->
    let k = [f2], fun [f2] arg ->
      let k = [f2], fun [f2] arg ->
        let t1 = PRIM_EqInt(f2,0) in
        let k = [f2], fun [f2] arg ->
          let k = [f2], fun [f2] arg ->
            let t1 = PRIM_PutChar('\n') in
            let t2 = PRIM_DumpSec(f2) in
            let t3 = PRIM_MakeBytes(512) in
            let t4 = PRIM_LoadSec(f2,t3) in
            let t5 = PRIM_FreezeBytes(t3) in
            let k = [f2,t5], fun [f2,f3] arg ->
              let k = [f2,f3], fun [f2,f3] arg ->
                let k = [f2,f3], fun [f2,f3] arg ->
                  let t1 = PRIM_EqInt(f2,0) in
                  let k = [f2,f3], fun [f2,f3] arg ->
                    let k = [f2,f3], fun [f2,f3] arg ->
                      let t1 = [f3], fun [f1] me arg k ->
                        let t1 = PRIM_ModInt(arg,64) in
                        let t2 = PRIM_EqInt(t1,0) in
                        let k = [f1,arg,me], fun [f2,f3,f4] arg ->
                          let t1 = PRIM_LessInt(f3,512) in
                          let k = [f2,f3,f4], fun [f2,f3,f4] arg ->
                            match arg with
                            | true1 -> k g19
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
                              | true1 -> k g20
                              | false0 ->
                                let t4 = PRIM_LessInt(t2,127) in
                                k t4 in
                          match t1 with
                          | true1 -> k g17
                          | false0 -> k g18 in
                        match t2 with
                        | true1 ->
                          let t3 = PRIM_PutChar('\n') in
                          k t3
                        | false0 -> k g16 in
                      let k = [f2], fun [f2] arg ->
                        let t1 = PRIM_PutChar('\n') in
                        let t2 = PRIM_GetChar(g21) in
                        let t3 = PRIM_AddInt(f2,1) in
                        g3 t3 k in
                      t1 0 k in
                    g1 arg k in
                  match t1 with
                  | true1 ->
                    let t2 = Cons1['0',g14] in
                    k t2
                  | false0 ->
                    let k = [f2], fun [f2] arg -> arg f2 k in
                    g13 g15 k in
                g1 arg k in
              arg 9 k in
            g10 g12 k in
          g1 arg k in
        match t1 with
        | true1 ->
          let t2 = Cons1['0',g8] in
          k t2
        | false0 ->
          let k = [f2], fun [f2] arg -> arg f2 k in
          g7 g9 k in
      g1 arg k in
    arg 8 k in
  g4 g6 k in
g3 1 k
