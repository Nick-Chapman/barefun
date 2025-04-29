(*Stage2 (NbE)*)
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> Unit0
    | Cons1(x,xsMore) ->
      let _ = PRIM_PutChar(x) in
      (put_chars xsMore)) in
let explode_loop =
  fix (fun explode_loop acc ->
    (fun i ->
      match PRIM_LessInt(i,0) with
      | true1 -> acc
      | false0 ->
        let x = PRIM_StringIndex("Hello, world!\n",i) in
        ((explode_loop Cons1(x, acc)) PRIM_SubInt(i,1)))) in
(put_chars ((explode_loop Nil0) 13))
