(*Stage3 (ANF)*)
let k () = ()
let put_chars = fix (fun [] put_chars [xs] k ->
  match xs with
  | Nil0 ->
    let con = Unit0 in
    k con
  | Cons1(x,xsMore) ->
    let _ = PRIM_PutChar(x) in
    put_chars [xsMore] k) in
let explode_loop = fix (fun [] explode_loop [acc,i] k ->
  let prim = PRIM_LessInt(i,0) in
  match prim with
  | true1 -> k acc
  | false0 ->
    let lit = "Hello, world!\n" in
    let x = PRIM_StringIndex(lit,i) in
    let prim = PRIM_SubInt(i,1) in
    let con = Cons1[x,acc] in
    explode_loop [con,prim] k) in
let con = Nil0 in
let k [put_chars] appN = put_chars [appN] k in
explode_loop [con,13] k
