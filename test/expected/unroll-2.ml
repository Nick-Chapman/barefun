(*Stage2 (NbE)*)
let loop =
  let rec loop (acc,i) =
    (match prim_EqInt(i, 0) with
    | true -> acc
    | false ->
      let c = prim_ModInt(i, 10) in
      let x = prim_AddInt(48, c) in
      let x = prim_CharChr(x) in
      loop (Cons(x, acc), prim_DivInt(i, 10))) in loop in
let put_chars =
  let rec put_chars (xs) =
    (match xs with
    | Nil -> Unit
    | Cons(x,xs) ->
      let _ = prim_PutChar(x) in
      put_chars (xs)) in put_chars in
put_chars (loop (Nil, 15))
