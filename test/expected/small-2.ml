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
        let x = PRIM_StringIndex("LOAD\n",i) in
        ((explode_loop Cons1(x, acc)) PRIM_SubInt(i,1)))) in
let _ = (put_chars ((explode_loop Nil0) 4)) in
let mainloop =
  fix (fun mainloop _ ->
    let explode_loop =
      fix (fun explode_loop acc ->
        (fun i ->
          match PRIM_LessInt(i,0) with
          | true1 -> acc
          | false0 ->
            let x = PRIM_StringIndex("> ",i) in
            ((explode_loop Cons1(x, acc)) PRIM_SubInt(i,1)))) in
    let _ = (put_chars ((explode_loop Nil0) 1)) in
    let readloop =
      fix (fun readloop sofar ->
        let theChar = PRIM_GetChar(Unit0) in
        match PRIM_EqChar(theChar,'\n') with
        | true1 ->
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
    let _ = PRIM_PutChar('\n') in
    (mainloop Unit0)) in
let explode_loop =
  fix (fun explode_loop acc ->
    (fun i ->
      match PRIM_LessInt(i,0) with
      | true1 -> acc
      | false0 ->
        let x = PRIM_StringIndex("Welcome to small: a proto readline\n",i) in
        ((explode_loop Cons1(x, acc)) PRIM_SubInt(i,1)))) in
let _ = (put_chars ((explode_loop Nil0) 34)) in
let _ = (mainloop Unit0) in
let explode_loop =
  fix (fun explode_loop acc ->
    (fun i ->
      match PRIM_LessInt(i,0) with
      | true1 -> acc
      | false0 ->
        let x = PRIM_StringIndex("NEVER\n",i) in
        ((explode_loop Cons1(x, acc)) PRIM_SubInt(i,1)))) in
(put_chars ((explode_loop Nil0) 5))
