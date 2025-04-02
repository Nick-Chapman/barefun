(*Stage2 (NbE)*)
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> CID0
    | Cons1(x,xsMore) ->
      let _ = PRIM_PutChar(x) in
      (put_chars xsMore)) in
let block = fix (fun block x -> x) in
let x = (block "Hello, world!\n") in
(put_chars PRIM_Explode(x))
