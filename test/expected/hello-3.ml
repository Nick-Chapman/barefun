(*Stage3 (ANF)*)
let k () = ()
let put_chars = fix (fun [] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con = Unit0 in
    k con
  | Cons1(x,xsMore) ->
    let _ = PRIM_PutChar(x) in
    put_chars xsMore k) in
let explode_loop = fix (fun [] explode_loop acc k ->
  let lam = fun [acc,explode_loop] i k ->
    let prim = PRIM_LessInt(i,0) in
    match prim with
    | true1 -> k acc
    | false0 ->
      let lit = "Hello, world!\n" in
      let x = PRIM_StringIndex(lit,i) in
      let con = Cons1[x,acc] in
      let k [i] app =
        let prim = PRIM_SubInt(i,1) in
        app prim k in
      explode_loop con k in
  k lam) in
let con = Nil0 in
let k [put_chars] app =
  let k [put_chars] app = put_chars app k in
  app 13 k in
explode_loop con k
