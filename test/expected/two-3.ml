(*Stage3 (ANF)*)
let k () = ()
let two = fun [] [x,y] k ->
  let prim = PRIM_AddInt(x,y) in
  k prim in
let numA = fun [] [_] k -> k 60 in
let numB = fun [] [_] k -> k 5 in
let call_two = fun [two,numA,numB] [_] k ->
  let con = Unit0 in
  let k [two,numB] a =
    let con = Unit0 in
    let k [two,a] b =
      let k [] res = k res in
      two [a,b] k in
    numB [con] k in
  numA [con] k in
let con = Unit0 in
let k [] res =
  let x = PRIM_CharChr(res) in
  let prim = PRIM_PutChar(x) in
  k prim in
call_two [con] k
