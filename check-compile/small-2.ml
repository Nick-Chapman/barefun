(*Stage2 (NbE)*)
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> CID0
    | Cons1(x,xsMore) ->
      let _ = PRIM_PutChar(x) in
      (put_chars xsMore)) in
let _ = (put_chars CID1('L', CID1('O', CID1('A', CID1('D', CID1('\n', CID0)))))) in
let mainloop =
  fix (fun mainloop _ ->
    let _ = (put_chars CID1('>', CID1(' ', CID0))) in
    let readloop =
      fix (fun readloop sofar ->
        let theChar = PRIM_GetChar(CID0) in
        match PRIM_EqChar(theChar,'\n') with
        | true1 ->
          let _ = PRIM_PutChar('\n') in
          let revloop =
            fix (fun revloop acc ->
              (fun ys ->
                match ys with
                | Nil0 -> acc
                | Cons1(y,ysMore) -> ((revloop CID1(y, acc)) ysMore))) in
          ((revloop CID0) sofar)
        | false0 ->
          let _ = PRIM_PutChar(theChar) in
          (readloop CID1(theChar, sofar))) in
    let _ = (put_chars (readloop CID0)) in
    let _ = PRIM_PutChar('\n') in
    (mainloop CID0)) in
let _ = (put_chars CID1('R', CID1('U', CID1('N', CID1('\n', CID0))))) in
let _ = (mainloop CID0) in
(put_chars CID1('N', CID1('E', CID1('V', CID1('E', CID1('R', CID1('\n', CID0)))))))
