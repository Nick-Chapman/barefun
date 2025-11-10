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
let triangle =
  let rec triangle (n) =
    (match prim_LessInt(n, 1) with
    | true -> 0
    | false ->
      let y = triangle (prim_SubInt(n, 1)) in
      prim_AddInt(n, y)) in triangle in
let i = triangle (5) in
put_chars
((match prim_EqInt(i, 0) with
| true -> Cons('0', Nil)
| false -> loop (Nil, i)))
