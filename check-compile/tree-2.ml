(*Stage2 (NbE)*)
let loop =
  fix (fun loop acc ->
    (fun i ->
      match PRIM_EqInt(i,0) with
      | true1 -> acc
      | false0 ->
        let c = PRIM_ModInt(i,10) in
        let x = PRIM_AddInt(48,c) in
        let x = PRIM_CharChr(x) in
        ((loop CID1(x, acc)) PRIM_DivInt(i,10)))) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> CID0
    | Cons1(x,xs) ->
      let _ = PRIM_PutChar(x) in
      (put_chars xs)) in
let eval =
  fix (fun eval e ->
    match e with
    | Num0(n) -> n
    | Add1(e1,e2) ->
      let x = (eval e1) in
      let y = (eval e2) in
      PRIM_AddInt(x,y)
    | Sub2(e1,e2) ->
      let x = (eval e1) in
      let y = (eval e2) in
      PRIM_SubInt(x,y)) in
let i = (eval CID2(CID0(1000), CID1(CID0(42), CID0(3)))) in
(put_chars
match PRIM_EqInt(i,0) with
| true1 -> CID1('0', CID0)
| false0 -> ((loop CID0) i))
