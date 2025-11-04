(*Stage2 (NbE)*)
let explode =
  (fun [s] ->
    let explode_loop =
      fix (fun explode_loop [acc,i] ->
        match PRIM_LessInt(i, 0) with
        | true1 -> acc
        | false0 ->
          let x = PRIM_StringIndex(s, i) in
          explode_loop [Cons1(x, acc), PRIM_SubInt(i, 1)]) in
    let x = PRIM_StringLength(s) in
    explode_loop [Nil0, PRIM_SubInt(x, 1)]) in
let put_chars =
  fix (fun put_chars [xs] ->
    match xs with
    | Nil0 -> Unit0
    | Cons1(x,xs) ->
      let _ = PRIM_PutChar(x) in
      put_chars [xs]) in
let put_int =
  (fun [i] ->
    match PRIM_LessInt(i, 0) with
    | true1 ->
      let i = PRIM_SubInt(0, i) in
      let loop =
        fix (fun loop [acc,i] ->
          match PRIM_EqInt(i, 0) with
          | true1 -> acc
          | false0 ->
            let c = PRIM_ModInt(i, 10) in
            let x = PRIM_AddInt(48, c) in
            let x = PRIM_CharChr(x) in
            loop [Cons1(x, acc), PRIM_DivInt(i, 10)]) in
      let y =
        match PRIM_EqInt(i, 0) with
        | true1 -> Cons1('0', Nil0)
        | false0 -> loop [Nil0, i] in
      put_chars [Cons1('-', y)]
    | false0 ->
      let loop =
        fix (fun loop [acc,i] ->
          match PRIM_EqInt(i, 0) with
          | true1 -> acc
          | false0 ->
            let c = PRIM_ModInt(i, 10) in
            let x = PRIM_AddInt(48, c) in
            let x = PRIM_CharChr(x) in
            loop [Cons1(x, acc), PRIM_DivInt(i, 10)]) in
      put_chars
      [match PRIM_EqInt(i, 0) with
      | true1 -> Cons1('0', Nil0)
      | false0 -> loop [Nil0, i]]) in
let drop =
  fix (fun drop [i,xs] ->
    match PRIM_EqInt(i, 0) with
    | true1 -> xs
    | false0 ->
      match xs with
      | Nil0 -> Nil0
      | Cons1(_,xs) -> drop [PRIM_SubInt(i, 1), xs]) in
let local0 = PRIM_MakeRef(VALUE0(0)) in
let local1 = PRIM_MakeRef(VALUE0(0)) in
let local_at_put =
  (fun [i,v] ->
    match PRIM_EqInt(i, 0) with
    | true1 -> PRIM_SetRef(local0, v)
    | false0 ->
      match PRIM_EqInt(i, 1) with
      | true1 -> PRIM_SetRef(local1, v)
      | false0 -> PRIM_Crash("local_at_put")) in
let local_at =
  (fun [i] ->
    match PRIM_EqInt(i, 0) with
    | true1 -> PRIM_DeRef(local0)
    | false0 ->
      match PRIM_EqInt(i, 1) with
      | true1 -> PRIM_DeRef(local1)
      | false0 -> PRIM_Crash("local_at")) in
let acc = PRIM_MakeRef(VALUE0(0)) in
let loop =
  fix (fun loop [ops] ->
    match ops with
    | Nil0 -> PRIM_Crash("run out of instructions")
    | Cons1(op,ops) ->
      match op with
      | LOAD_IMMEDIATE0(v) ->
        let _ = PRIM_SetRef(acc, v) in
        loop [ops]
      | STORE_LOCAL1(i) ->
        let _ = local_at_put [i, PRIM_DeRef(acc)] in
        loop [ops]
      | LOAD_LOCAL2(i) ->
        let y = local_at [i] in
        let _ = PRIM_SetRef(acc, y) in
        loop [ops]
      | ADD3(i,j) ->
        let v1 = local_at [i] in
        let v2 = local_at [j] in
        let x =
          match v1 with
          | VALUE0(i) -> i in
        let y =
          match v2 with
          | VALUE0(i) -> i in
        let y = VALUE0(PRIM_AddInt(x, y)) in
        let _ = PRIM_SetRef(acc, y) in
        loop [ops]
      | DEC4 ->
        let v = PRIM_DeRef(acc) in
        let x =
          match v with
          | VALUE0(i) -> i in
        let y = VALUE0(PRIM_SubInt(x, 1)) in
        let _ = PRIM_SetRef(acc, y) in
        loop [ops]
      | PRINTI6 ->
        let v = PRIM_DeRef(acc) in
        let _ =
          put_int
          [match v with
          | VALUE0(i) -> i] in
        loop [ops]
      | PRINT5(s) ->
        let _ = put_chars [explode [s]] in
        loop [ops]
      | JMPNZ7(address) ->
        let v = PRIM_DeRef(acc) in
        let x =
          match v with
          | VALUE0(i) -> i in
        let b = PRIM_EqInt(x, 0) in
        match match b with
        | true1 -> false0
        | false0 -> true1 with
        | true1 -> loop [drop [address, Cons1(LOAD_IMMEDIATE0(VALUE0(0)), Cons1(STORE_LOCAL1(0), Cons1(LOAD_IMMEDIATE0(VALUE0(10)), Cons1(STORE_LOCAL1(1), Cons1(ADD3(0, 1), Cons1(STORE_LOCAL1(0), Cons1(LOAD_LOCAL2(1), Cons1(DEC4, Cons1(STORE_LOCAL1(1), Cons1(JMPNZ7(4), Cons1(PRINT5("(Ocaml)Result: "), Cons1(LOAD_LOCAL2(0), Cons1(PRINTI6, Cons1(PRINT5("\n"), Cons1(HALT8, Nil0)))))))))))))))]]
        | false0 -> loop [ops]
      | HALT8 -> Unit0) in
let _ = loop [Cons1(LOAD_IMMEDIATE0(VALUE0(0)), Cons1(STORE_LOCAL1(0), Cons1(LOAD_IMMEDIATE0(VALUE0(10)), Cons1(STORE_LOCAL1(1), Cons1(ADD3(0, 1), Cons1(STORE_LOCAL1(0), Cons1(LOAD_LOCAL2(1), Cons1(DEC4, Cons1(STORE_LOCAL1(1), Cons1(JMPNZ7(4), Cons1(PRINT5("(Ocaml)Result: "), Cons1(LOAD_LOCAL2(0), Cons1(PRINTI6, Cons1(PRINT5("\n"), Cons1(HALT8, Nil0)))))))))))))))] in
Unit0
