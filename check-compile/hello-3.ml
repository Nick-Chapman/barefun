(*Stage3 (ANF)*)
let k () = ()
let put_chars = fix (fun [] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_4'10 = CID0 in
    k con_4'10
  | Cons1(x,xsMore) ->
    let _ = PRIM_PutChar(x) in
    put_chars xsMore k) in
let block = fix (fun [] block x k -> k x) in
let lit_12'13 = "Hello, world!\n" in
let k [put_chars] x =
  let prim_0'0 = PRIM_Explode(x) in
  put_chars prim_0'0 k in
block lit_12'13 k
