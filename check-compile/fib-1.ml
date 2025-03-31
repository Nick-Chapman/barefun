(*stage1*)
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> Unit0
    | Cons1(x,xs) ->
      let _ = PRIM_PutChar(x) in
      (put_chars xs)) in
let fib =
  fix (fun fib n ->
    match let y = 2 in
    PRIM_LessInt(n,y) with
    | true1 -> n
    | false0 ->
      (let x =
        (fib
        let y = 1 in
        PRIM_SubInt(n,y)) in
      (fun y -> PRIM_AddInt(x,y))
      (fib
      let y = 2 in
      PRIM_SubInt(n,y)))) in
let _ = Unit0 in
let n = 20 in
let res = (fib n) in
let _ =
  let s = "fib " in
  (put_chars PRIM_Explode(s)) in
let _ =
  (put_chars
  let ord0 =
    let x = '0' in
    PRIM_CharOrd(x) in
  let loop =
    fix (fun loop acc ->
      (fun i ->
        match let y = 0 in
        PRIM_EqInt(i,y) with
        | true1 -> acc
        | false0 ->
          ((loop
          (let x =
            let c =
              let y = 10 in
              PRIM_ModInt(i,y) in
            let x = PRIM_AddInt(ord0,c) in
            PRIM_CharChr(x) in
          (fun y -> Cons1(x, y))
          acc))
          let y = 10 in
          PRIM_DivInt(i,y)))) in
  match let y = 0 in
  PRIM_EqInt(n,y) with
  | true1 -> Cons1('0', Nil0)
  | false0 -> ((loop Nil0) n)) in
let _ =
  let s = " --> " in
  (put_chars PRIM_Explode(s)) in
let _ =
  (put_chars
  let ord0 =
    let x = '0' in
    PRIM_CharOrd(x) in
  let loop =
    fix (fun loop acc ->
      (fun i ->
        match let y = 0 in
        PRIM_EqInt(i,y) with
        | true1 -> acc
        | false0 ->
          ((loop
          (let x =
            let c =
              let y = 10 in
              PRIM_ModInt(i,y) in
            let x = PRIM_AddInt(ord0,c) in
            PRIM_CharChr(x) in
          (fun y -> Cons1(x, y))
          acc))
          let y = 10 in
          PRIM_DivInt(i,y)))) in
  match let y = 0 in
  PRIM_EqInt(res,y) with
  | true1 -> Cons1('0', Nil0)
  | false0 -> ((loop Nil0) res)) in
let _ = Unit0 in
let x = '\n' in
PRIM_PutChar(x)
