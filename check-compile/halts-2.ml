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
let main = fun [get_char,put_char] _ k ->
  let k [get_char,put_char] _ =
    let k [get_char,put_char] _ =
      let k [get_char,put_char] _ =
        let k [put_char] _ =
          let lit_30_7'11 = 'Z' in
          put_char lit_30_7'11 k in
        let k [put_char] app_28_6'21 = put_char app_28_6'21 k in
        let con_29_6'21 = Unit0 in
        get_char con_29_6'21 k in
      let lit_27_5'11 = 'Y' in
      put_char lit_27_5'11 k in
    let k [put_char] app_25_4'21 = put_char app_25_4'21 k in
    let con_26_4'21 = Unit0 in
    get_char con_26_4'21 k in
  let lit_24_3'11 = 'X' in
  put_char lit_24_3'11 k in
let con_31_0'0 = Unit0 in
main con_31_0'0 k
