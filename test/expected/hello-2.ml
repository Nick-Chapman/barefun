(*Stage2 (NbE)*)
let put_chars =
  fix (fun put_chars (xs) ->
    (match xs with
    | Nil -> Unit
    | Cons(x,xsMore) ->
      let _ = prim_PutChar(x) in
      put_chars (xsMore))) in
let explode_loop =
  fix (fun explode_loop (acc,i) ->
    (match prim_LessInt(i, 0) with
    | true -> acc
    | false ->
      let x = prim_StringIndex("Hello, world!\n", i) in
      explode_loop (Cons(x, acc), prim_SubInt(i, 1)))) in
put_chars (explode_loop (Nil, 13))
