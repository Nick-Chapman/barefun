(*Stage3 (ANF)*)
let k () = ()
let decrease = fun [] [b,a] k ->
  let prim = PRIM_SubInt(a,b) in
  k prim in
let thriceA = fun [] [f,x] k ->
  let k [f] appN =
    let k [f] appN = f [appN] k in
    f [appN] k in
  f [x] k in
let thriceB = fun [] [f,x] k ->
  let k [f] appN =
    let k [f] appN = f [appN] k in
    f [appN] k in
  f [x] k in
let k [thriceA,thriceB] appN =
  let k [] res =
    let x = PRIM_CharChr(res) in
    let prim = PRIM_PutChar(x) in
    k prim in
  thriceA [thriceB,appN,92] k in
decrease [1] k
