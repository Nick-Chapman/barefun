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
let outer =
  fix (fun outer [pc] ->
    let _ = PRIM_PutChar('x') in
    match PRIM_EqInt(pc, 0) with
    | true1 ->
      let _ = PRIM_PutChar('.') in
      let _ = PRIM_SetRef(acc, VALUE0(0)) in
      let _ = PRIM_PutChar('.') in
      let _ = local_at_put [0, PRIM_DeRef(acc)] in
      let _ = PRIM_PutChar('.') in
      let _ = PRIM_SetRef(acc, VALUE0(5)) in
      let _ = PRIM_PutChar('.') in
      let _ = local_at_put [1, PRIM_DeRef(acc)] in
      outer [4]
    | false0 ->
      match PRIM_EqInt(pc, 4) with
      | true1 ->
        let _ = PRIM_PutChar('.') in
        let v1 = local_at [0] in
        let v2 = local_at [1] in
        let x =
          match v1 with
          | VALUE0(i) -> i in
        let y =
          match v2 with
          | VALUE0(i) -> i in
        let y = VALUE0(PRIM_AddInt(x, y)) in
        let _ = PRIM_SetRef(acc, y) in
        let _ = PRIM_PutChar('.') in
        let _ = local_at_put [0, PRIM_DeRef(acc)] in
        let _ = PRIM_PutChar('.') in
        let y = local_at [1] in
        let _ = PRIM_SetRef(acc, y) in
        let _ = PRIM_PutChar('.') in
        let v = PRIM_DeRef(acc) in
        let x =
          match v with
          | VALUE0(i) -> i in
        let y = VALUE0(PRIM_SubInt(x, 1)) in
        let _ = PRIM_SetRef(acc, y) in
        let _ = PRIM_PutChar('.') in
        let _ = local_at_put [1, PRIM_DeRef(acc)] in
        let _ = PRIM_PutChar('.') in
        let v = PRIM_DeRef(acc) in
        let x =
          match v with
          | VALUE0(i) -> i in
        match PRIM_EqInt(x, 0) with
        | true1 ->
          let _ = PRIM_PutChar('.') in
          let _ = put_chars [explode ["(Ocaml)Result: "]] in
          let _ = PRIM_PutChar('.') in
          let y = local_at [0] in
          let _ = PRIM_SetRef(acc, y) in
          let _ = PRIM_PutChar('.') in
          let v = PRIM_DeRef(acc) in
          let _ =
            put_int
            [match v with
            | VALUE0(i) -> i] in
          let _ = PRIM_PutChar('.') in
          let _ = put_chars [explode ["\n"]] in
          let _ = PRIM_PutChar('.') in
          Unit0
        | false0 -> outer [4]
      | false0 -> PRIM_Crash("with_starting")) in
let _ = outer [0] in
Unit0
