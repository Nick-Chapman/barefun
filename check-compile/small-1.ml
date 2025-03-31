(*stage1*)
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> Unit0
    | Cons1(x,xsMore) ->
      let _ = PRIM_PutChar(x) in
      (put_chars xsMore)) in
let _ =
  let s = "LOAD\n" in
  (put_chars PRIM_Explode(s)) in
let mainloop =
  fix (fun mainloop _ ->
    let _ =
      let s = "> " in
      (put_chars PRIM_Explode(s)) in
    let _ =
      (put_chars
      let _ = Unit0 in
      let readloop =
        fix (fun readloop sofar ->
          let theChar =
            let x = Unit0 in
            PRIM_GetChar(x) in
          match let y = '\n' in
          PRIM_EqChar(theChar,y) with
          | true1 ->
            let _ =
              let _ = Unit0 in
              let x = '\n' in
              PRIM_PutChar(x) in
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
      (readloop Nil0)) in
    let _ =
      let _ = Unit0 in
      let x = '\n' in
      PRIM_PutChar(x) in
    (mainloop Unit0)) in
let _ = Unit0 in
let _ =
  let s = "RUN\n" in
  (put_chars PRIM_Explode(s)) in
let _ = (mainloop Unit0) in
let s = "NEVER\n" in
(put_chars PRIM_Explode(s))
