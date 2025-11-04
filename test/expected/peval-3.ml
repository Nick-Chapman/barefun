(*Stage3 (ANF)*)
let k () = ()
let explode = fun [] [s] k ->
  let explode_loop = fix (fun [s] explode_loop [acc,i] k ->
    let prim = PRIM_LessInt(i,0) in
    match prim with
    | true1 -> k acc
    | false0 ->
      let x = PRIM_StringIndex(s,i) in
      let prim = PRIM_SubInt(i,1) in
      let con = Cons1[x,acc] in
      explode_loop [con,prim] k) in
  let x = PRIM_StringLength(s) in
  let prim = PRIM_SubInt(x,1) in
  let con = Nil0 in
  explode_loop [con,prim] k in
let put_chars = fix (fun [] put_chars [xs] k ->
  match xs with
  | Nil0 ->
    let con = Unit0 in
    k con
  | Cons1(x,xs) ->
    let _ = PRIM_PutChar(x) in
    put_chars [xs] k) in
let put_int = fun [put_chars] [i] k ->
  let prim = PRIM_LessInt(i,0) in
  match prim with
  | true1 ->
    let i = PRIM_SubInt(0,i) in
    let loop = fix (fun [] loop [acc,i] k ->
      let prim = PRIM_EqInt(i,0) in
      match prim with
      | true1 -> k acc
      | false0 ->
        let c = PRIM_ModInt(i,10) in
        let x = PRIM_AddInt(48,c) in
        let x = PRIM_CharChr(x) in
        let prim = PRIM_DivInt(i,10) in
        let con = Cons1[x,acc] in
        loop [con,prim] k) in
    let prim = PRIM_EqInt(i,0) in
    let k [put_chars] y =
      let con = Cons1['-',y] in
      put_chars [con] k in
    match prim with
    | true1 ->
      let con = Nil0 in
      let con = Cons1['0',con] in
      k con
    | false0 ->
      let con = Nil0 in
      loop [con,i] k
  | false0 ->
    let loop = fix (fun [] loop [acc,i] k ->
      let prim = PRIM_EqInt(i,0) in
      match prim with
      | true1 -> k acc
      | false0 ->
        let c = PRIM_ModInt(i,10) in
        let x = PRIM_AddInt(48,c) in
        let x = PRIM_CharChr(x) in
        let prim = PRIM_DivInt(i,10) in
        let con = Cons1[x,acc] in
        loop [con,prim] k) in
    let prim = PRIM_EqInt(i,0) in
    let k [put_chars] case = put_chars [case] k in
    match prim with
    | true1 ->
      let con = Nil0 in
      let con = Cons1['0',con] in
      k con
    | false0 ->
      let con = Nil0 in
      loop [con,i] k in
let drop = fix (fun [] drop [i,xs] k ->
  let prim = PRIM_EqInt(i,0) in
  match prim with
  | true1 -> k xs
  | false0 ->
    match xs with
    | Nil0 ->
      let con = Nil0 in
      k con
    | Cons1(_,xs) ->
      let prim = PRIM_SubInt(i,1) in
      drop [prim,xs] k) in
let con = VALUE0[0] in
let local0 = PRIM_MakeRef(con) in
let con = VALUE0[0] in
let local1 = PRIM_MakeRef(con) in
let local_at_put = fun [local0,local1] [i,v] k ->
  let prim = PRIM_EqInt(i,0) in
  match prim with
  | true1 ->
    let prim = PRIM_SetRef(local0,v) in
    k prim
  | false0 ->
    let prim = PRIM_EqInt(i,1) in
    match prim with
    | true1 ->
      let prim = PRIM_SetRef(local1,v) in
      k prim
    | false0 ->
      let lit = "local_at_put" in
      let prim = PRIM_Crash(lit) in
      k prim in
let local_at = fun [local0,local1] [i] k ->
  let prim = PRIM_EqInt(i,0) in
  match prim with
  | true1 ->
    let prim = PRIM_DeRef(local0) in
    k prim
  | false0 ->
    let prim = PRIM_EqInt(i,1) in
    match prim with
    | true1 ->
      let prim = PRIM_DeRef(local1) in
      k prim
    | false0 ->
      let lit = "local_at" in
      let prim = PRIM_Crash(lit) in
      k prim in
let con = VALUE0[0] in
let acc = PRIM_MakeRef(con) in
let loop = fix (fun [explode,put_chars,put_int,drop,local_at_put,local_at,acc] loop [ops] k ->
  match ops with
  | Nil0 ->
    let lit = "run out of instructions" in
    let prim = PRIM_Crash(lit) in
    k prim
  | Cons1(op,ops) ->
    match op with
    | LOAD_IMMEDIATE0(v) ->
      let _ = PRIM_SetRef(acc,v) in
      loop [ops] k
    | STORE_LOCAL1(i) ->
      let prim = PRIM_DeRef(acc) in
      let k [loop,ops] _ = loop [ops] k in
      local_at_put [i,prim] k
    | LOAD_LOCAL2(i) ->
      let k [acc,loop,ops] y =
        let _ = PRIM_SetRef(acc,y) in
        loop [ops] k in
      local_at [i] k
    | ADD3(i,j) ->
      let k [local_at,acc,loop,ops,j] v1 =
        let k [acc,loop,ops,v1] v2 =
          let k [acc,loop,ops,v2] x =
            let k [acc,loop,ops,x] y =
              let prim = PRIM_AddInt(x,y) in
              let y = VALUE0[prim] in
              let _ = PRIM_SetRef(acc,y) in
              loop [ops] k in
            match v2 with
            | VALUE0(i) -> k i in
          match v1 with
          | VALUE0(i) -> k i in
        local_at [j] k in
      local_at [i] k
    | DEC4 ->
      let v = PRIM_DeRef(acc) in
      let k [acc,loop,ops] x =
        let prim = PRIM_SubInt(x,1) in
        let y = VALUE0[prim] in
        let _ = PRIM_SetRef(acc,y) in
        loop [ops] k in
      match v with
      | VALUE0(i) -> k i
    | PRINTI6 ->
      let v = PRIM_DeRef(acc) in
      let k [put_int,loop,ops] case =
        let k [loop,ops] _ = loop [ops] k in
        put_int [case] k in
      match v with
      | VALUE0(i) -> k i
    | PRINT5(s) ->
      let k [put_chars,loop,ops] appN =
        let k [loop,ops] _ = loop [ops] k in
        put_chars [appN] k in
      explode [s] k
    | JMPNZ7(address) ->
      let v = PRIM_DeRef(acc) in
      let k [drop,loop,ops,address] x =
        let b = PRIM_EqInt(x,0) in
        let k [drop,loop,ops,address] case =
          match case with
          | true1 ->
            let con = VALUE0[0] in
            let con = LOAD_IMMEDIATE0[con] in
            let con = STORE_LOCAL1[0] in
            let con = VALUE0[10] in
            let con = LOAD_IMMEDIATE0[con] in
            let con = STORE_LOCAL1[1] in
            let con = ADD3[0,1] in
            let con = STORE_LOCAL1[0] in
            let con = LOAD_LOCAL2[1] in
            let con = DEC4 in
            let con = STORE_LOCAL1[1] in
            let con = JMPNZ7[4] in
            let lit = "(Ocaml)Result: " in
            let con = PRINT5[lit] in
            let con = LOAD_LOCAL2[0] in
            let con = PRINTI6 in
            let lit = "\n" in
            let con = PRINT5[lit] in
            let con = HALT8 in
            let con = Nil0 in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let con = Cons1[con,con] in
            let k [loop] appN = loop [appN] k in
            drop [address,con] k
          | false0 -> loop [ops] k in
        match b with
        | true1 ->
          let con = false0 in
          k con
        | false0 ->
          let con = true1 in
          k con in
      match v with
      | VALUE0(i) -> k i
    | HALT8 ->
      let con = Unit0 in
      k con) in
let con = VALUE0[0] in
let con = LOAD_IMMEDIATE0[con] in
let con = STORE_LOCAL1[0] in
let con = VALUE0[10] in
let con = LOAD_IMMEDIATE0[con] in
let con = STORE_LOCAL1[1] in
let con = ADD3[0,1] in
let con = STORE_LOCAL1[0] in
let con = LOAD_LOCAL2[1] in
let con = DEC4 in
let con = STORE_LOCAL1[1] in
let con = JMPNZ7[4] in
let lit = "(Ocaml)Result: " in
let con = PRINT5[lit] in
let con = LOAD_LOCAL2[0] in
let con = PRINTI6 in
let lit = "\n" in
let con = PRINT5[lit] in
let con = HALT8 in
let con = Nil0 in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let con = Cons1[con,con] in
let k [] _ =
  let con = Unit0 in
  k con in
loop [con] k
