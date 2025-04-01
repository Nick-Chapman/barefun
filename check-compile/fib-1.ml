(*stage1*)
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> Unit0
    | Cons1(x,xs) ->
      let _ = PRIM_PutChar(x) in
      (put_chars xs)) in
let fib =
  fix (fun fib n ->
    match PRIM_LessInt(n,2) with
    | true1 -> n
    | false0 ->
      let x = (fib PRIM_SubInt(n,1)) in
      let y = (fib PRIM_SubInt(n,2)) in
      PRIM_AddInt(x,y)) in
let _ = Unit0 in
let res = (fib 20) in
let _ = (put_chars CID1('f', CID1('i', CID1('b', CID1(' ', CID0))))) in
let loop =
  fix (fun loop acc ->
    (fun i ->
      match PRIM_EqInt(i,0) with
      | true1 -> acc
      | false0 ->
        let c = PRIM_ModInt(i,10) in
        let x = PRIM_AddInt(48,c) in
        let x = PRIM_CharChr(x) in
        ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
let _ =
  (put_chars
  match CID0 with
  | true1 -> Cons1('0', Nil0)
  | false0 -> ((loop Nil0) 20)) in
let _ = (put_chars CID1(' ', CID1('-', CID1('-', CID1('>', CID1(' ', CID0)))))) in
let loop =
  fix (fun loop acc ->
    (fun i ->
      match PRIM_EqInt(i,0) with
      | true1 -> acc
      | false0 ->
        let c = PRIM_ModInt(i,10) in
        let x = PRIM_AddInt(48,c) in
        let x = PRIM_CharChr(x) in
        ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
let _ =
  (put_chars
  match PRIM_EqInt(res,0) with
  | true1 -> Cons1('0', Nil0)
  | false0 -> ((loop Nil0) res)) in
let _ = Unit0 in
PRIM_PutChar('\n')
