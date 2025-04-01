(*stage1*)
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> Unit0
    | Cons1(x,xsMore) ->
      let _ = PRIM_PutChar(x) in
      (put_chars xsMore)) in
let _ = (put_chars PRIM_Explode("LOAD\n")) in
let mainloop =
  fix (fun mainloop _ ->
    let _ = (put_chars PRIM_Explode("> ")) in
    let _ = Unit0 in
    let readloop =
      fix (fun readloop sofar ->
        let x = Unit0 in
        let theChar = PRIM_GetChar(x) in
        match PRIM_EqChar(theChar,'\n') with
        | true1 ->
          let _ = Unit0 in
          let _ = PRIM_PutChar('\n') in
          let revloop =
            fix (fun revloop acc ->
              (fun ys ->
                match ys with
                | Nil0 -> acc
                | Cons1(y,ysMore) -> ((revloop Cons1(y, acc)) ysMore))) in
          ((revloop Nil0) sofar)
        | false0 ->
          let _ = PRIM_PutChar(theChar) in
          (readloop Cons1(theChar, sofar))) in
    let _ = (put_chars (readloop Nil0)) in
    let _ = Unit0 in
    let _ = PRIM_PutChar('\n') in
    (mainloop Unit0)) in
let _ = Unit0 in
let _ = (put_chars PRIM_Explode("RUN\n")) in
let _ = (mainloop Unit0) in
(put_chars PRIM_Explode("NEVER\n"))
