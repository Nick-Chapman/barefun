(*stage3; un-normalized*)
let k () = ()
let put_char_g1 = fun x_arg k ->
  let prim_20_0'0_t1 = PRIM_PutChar(x_arg) in
  k prim_20_0'0_t1 in
let get_char_g2 = fun x_arg k ->
  let prim_21_0'0_t1 = PRIM_GetChar(x_arg) in
  k prim_21_0'0_t1 in
let lit_24_3'11_g3 = 'X' in
let lit_27_5'11_g4 = 'Y' in
let lit_30_7'11_g5 = 'Z' in
let main_g6 = fun __arg k ->
  let k = [], fun [] __arg ->
    let k = [], fun [] __arg ->
      let k = [], fun [] __arg ->
        let k = [], fun [] __arg -> put_char_g1 lit_30_7'11_g5 k in
        let k = [], fun [] app_28_6'21_arg -> put_char_g1 app_28_6'21_arg k in
        let con_29_6'21_t1 = Unit0 in
        get_char_g2 con_29_6'21_t1 k in
      put_char_g1 lit_27_5'11_g4 k in
    let k = [], fun [] app_25_4'21_arg -> put_char_g1 app_25_4'21_arg k in
    let con_26_4'21_t1 = Unit0 in
    get_char_g2 con_26_4'21_t1 k in
  put_char_g1 lit_24_3'11_g3 k in
let con_31_0'0_t1 = Unit0 in
main_g6 con_31_0'0_t1 k
