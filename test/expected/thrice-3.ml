(*Stage3 (ANF)*)
let k () = ()
let decrease = fun [] b k ->
  let lam = fun [b] a k ->
    let prim = PRIM_SubInt(a,b) in
    k prim in
  k lam in
let thriceA = fun [] f k ->
  let lam = fun [f] x k ->
    let k [f] app =
      let k [f] app = f app k in
      f app k in
    f x k in
  k lam in
let thriceB = fun [] f k ->
  let lam = fun [f] x k ->
    let k [f] app =
      let k [f] app = f app k in
      f app k in
    f x k in
  k lam in
let k [thriceA,thriceB] app =
  let k [app] app =
    let k [] app =
      let k [] res =
        let x = PRIM_CharChr(res) in
        let prim = PRIM_PutChar(x) in
        k prim in
      app 92 k in
    app app k in
  thriceA thriceB k in
decrease 1 k
