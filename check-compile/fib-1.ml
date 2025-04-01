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
    match PRIM_LessInt(n,2) with
    | true1 -> n
    | false0 ->
      (let x = (fib PRIM_SubInt(n,1)) in
      (fun y -> PRIM_AddInt(x,y))
      (fib PRIM_SubInt(n,2)))) in
let _ = Unit0 in
let res = (fib 20) in
let _ = (put_chars PRIM_Explode("fib ")) in
let _ =
  (put_chars
  let ord0 = PRIM_CharOrd('0') in
  let loop =
    fix (fun loop acc ->
      (fun i ->
        match PRIM_EqInt(i,0) with
        | true1 -> acc
        | false0 ->
          ((loop
          (let x =
            let c = PRIM_ModInt(i,10) in
            let x = PRIM_AddInt(ord0,c) in
            PRIM_CharChr(x) in
          (fun y -> Cons1(x, y))
          acc))
          PRIM_DivInt(i,10)))) in
  match PRIM_EqInt(20,0) with
  | true1 -> Cons1('0', Nil0)
  | false0 -> ((loop Nil0) 20)) in
let _ = (put_chars PRIM_Explode(" --> ")) in
let _ =
  (put_chars
  let ord0 = PRIM_CharOrd('0') in
  let loop =
    fix (fun loop acc ->
      (fun i ->
        match PRIM_EqInt(i,0) with
        | true1 -> acc
        | false0 ->
          ((loop
          (let x =
            let c = PRIM_ModInt(i,10) in
            let x = PRIM_AddInt(ord0,c) in
            PRIM_CharChr(x) in
          (fun y -> Cons1(x, y))
          acc))
          PRIM_DivInt(i,10)))) in
  match PRIM_EqInt(res,0) with
  | true1 -> Cons1('0', Nil0)
  | false0 -> ((loop Nil0) res)) in
let _ = Unit0 in
PRIM_PutChar('\n')
