(*Stage2 (NbE)*)
let put_chars =
  fix (fun put_chars (xs) ->
    (match xs with
    | Nil0 -> Unit0
    | Cons1(x,xsMore) ->
      let _ = prim_PutChar(x) in
      put_chars (xsMore))) in
let explode_loop =
  fix (fun explode_loop (acc,i) ->
    (match prim_LessInt(i, 0) with
    | true1 -> acc
    | false0 ->
      let x = prim_StringIndex("Hello, world!\n", i) in
      explode_loop (Cons1(x, acc), prim_SubInt(i, 1)))) in
put_chars (explode_loop (Nil0, 13))
