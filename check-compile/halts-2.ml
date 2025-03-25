(*stage2; un-normalized*)
let k () = ()
let + = fun [] x k ->
  let lam_2_0'0 = fun [x] y k ->
    let prim_1_0'0 = PRIM_AddInt(x,y) in
    k prim_1_0'0 in
  k lam_2_0'0 in
let - = fun [] x k ->
  let lam_4_0'0 = fun [x] y k ->
    let prim_3_0'0 = PRIM_SubInt(x,y) in
    k prim_3_0'0 in
  k lam_4_0'0 in
let ( * ) = fun [] x k ->
  let lam_6_0'0 = fun [x] y k ->
    let prim_5_0'0 = PRIM_MulInt(x,y) in
    k prim_5_0'0 in
  k lam_6_0'0 in
let / = fun [] x k ->
  let lam_8_0'0 = fun [x] y k ->
    let prim_7_0'0 = PRIM_DivInt(x,y) in
    k prim_7_0'0 in
  k lam_8_0'0 in
let % = fun [] x k ->
  let lam_10_0'0 = fun [x] y k ->
    let prim_9_0'0 = PRIM_ModInt(x,y) in
    k prim_9_0'0 in
  k lam_10_0'0 in
let < = fun [] x k ->
  let lam_12_0'0 = fun [x] y k ->
    let prim_11_0'0 = PRIM_LessInt(x,y) in
    k prim_11_0'0 in
  k lam_12_0'0 in
let = = fun [] x k ->
  let lam_14_0'0 = fun [x] y k ->
    let prim_13_0'0 = PRIM_EqInt(x,y) in
    k prim_13_0'0 in
  k lam_14_0'0 in
let eq_char = fun [] x k ->
  let lam_16_0'0 = fun [x] y k ->
    let prim_15_0'0 = PRIM_EqChar(x,y) in
    k prim_15_0'0 in
  k lam_16_0'0 in
let ord = fun [] x k ->
  let prim_17_0'0 = PRIM_CharOrd(x) in
  k prim_17_0'0 in
let chr = fun [] x k ->
  let prim_18_0'0 = PRIM_CharChr(x) in
  k prim_18_0'0 in
let explode = fun [] x k ->
  let prim_19_0'0 = PRIM_Explode(x) in
  k prim_19_0'0 in
let put_char = fun [] x k ->
  let prim_20_0'0 = PRIM_PutChar(x) in
  k prim_20_0'0 in
let get_char = fun [] x k ->
  let prim_21_0'0 = PRIM_GetChar(x) in
  k prim_21_0'0 in
let :: = fun [] x k ->
  let lam_23_0'0 = fun [x] y k ->
    let con_22_0'0 = Cons1[x,y] in
    k con_22_0'0 in
  k lam_23_0'0 in
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
