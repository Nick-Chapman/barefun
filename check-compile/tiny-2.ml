(*stage2*)
let k () = ()
let + = fun [] x k ->
  let lam_2 = fun [x] y k ->
    let prim_1 = PRIM_AddInt(x,y) in
    k prim_1 in
  k lam_2 in
let - = fun [] x k ->
  let lam_4 = fun [x] y k ->
    let prim_3 = PRIM_SubInt(x,y) in
    k prim_3 in
  k lam_4 in
let ( * ) = fun [] x k ->
  let lam_6 = fun [x] y k ->
    let prim_5 = PRIM_MulInt(x,y) in
    k prim_5 in
  k lam_6 in
let / = fun [] x k ->
  let lam_8 = fun [x] y k ->
    let prim_7 = PRIM_DivInt(x,y) in
    k prim_7 in
  k lam_8 in
let % = fun [] x k ->
  let lam_10 = fun [x] y k ->
    let prim_9 = PRIM_ModInt(x,y) in
    k prim_9 in
  k lam_10 in
let < = fun [] x k ->
  let lam_12 = fun [x] y k ->
    let prim_11 = PRIM_LessInt(x,y) in
    k prim_11 in
  k lam_12 in
let = = fun [] x k ->
  let lam_14 = fun [x] y k ->
    let prim_13 = PRIM_EqInt(x,y) in
    k prim_13 in
  k lam_14 in
let eq_char = fun [] x k ->
  let lam_16 = fun [x] y k ->
    let prim_15 = PRIM_EqChar(x,y) in
    k prim_15 in
  k lam_16 in
let ord = fun [] x k ->
  let prim_17 = PRIM_CharOrd(x) in
  k prim_17 in
let chr = fun [] x k ->
  let prim_18 = PRIM_CharChr(x) in
  k prim_18 in
let explode = fun [] x k ->
  let prim_19 = PRIM_Explode(x) in
  k prim_19 in
let put_char = fun [] x k ->
  let prim_20 = PRIM_PutChar(x) in
  k prim_20 in
let get_char = fun [] x k ->
  let prim_21 = PRIM_GetChar(x) in
  k prim_21 in
let :: = fun [] x k ->
  let lam_23 = fun [x] y k ->
    let con_22 = Cons1[x,y] in
    k con_22 in
  k lam_23 in
let k [] main =
  let con_26_0'0 = Unit0 in
  main con_26_0'0 k in
let mainloop = fix (fun [get_char,put_char] mainloop _ k ->
  let k [mainloop,put_char] gotten =
    let k [mainloop] _ =
      let con_25_6'13 = Unit0 in
      mainloop con_25_6'13 k in
    put_char gotten k in
  let con_24_4'26 = Unit0 in
  get_char con_24_4'26 k) in
k mainloop
