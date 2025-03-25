(*stage3*)
let k () = ()
let eq_char_g1 = fun x_arg k ->
  let lam_16_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_15_t1 = PRIM_EqChar(x_f1,y_arg) in
    k prim_15_t1 in
  k lam_16_t1 in
let explode_g2 = fun x_arg k ->
  let prim_19_t1 = PRIM_Explode(x_arg) in
  k prim_19_t1 in
let put_char_g3 = fun x_arg k ->
  let prim_20_t1 = PRIM_PutChar(x_arg) in
  k prim_20_t1 in
let get_char_g4 = fun x_arg k ->
  let prim_21_t1 = PRIM_GetChar(x_arg) in
  k prim_21_t1 in
let ::_g5 = fun x_arg k ->
  let lam_23_t1 = [x_arg], fun [x_f1] y_arg k ->
    let con_22_t1 = Cons1[x_f1,y_arg] in
    k con_22_t1 in
  k lam_23_t1 in
let put_chars_g6 = fun put_chars_me xs_arg k ->
  match xs_arg with
  | Nil0 ->
    let con_24_t1 = Unit0 in
    k con_24_t1
  | Cons1(x_t1,xsMore_t2) ->
    let k = [put_chars_me,xsMore_t2], fun [put_chars_f1,xsMore_f2] __arg -> put_chars_f1 xsMore_f2 k in
    put_char_g3 x_t1 k in
let put_string_g7 = fun s_arg k ->
  let k = [], fun [] app_25_7'38_arg -> put_chars_g6 app_25_7'38_arg k in
  explode_g2 s_arg k in
let revloop_g8 = fun revloop_me acc_arg k ->
  let lam_29_t1 = [acc_arg,revloop_me], fun [acc_f1,revloop_f2] ys_arg k ->
    match ys_arg with
    | Nil0 -> k acc_f1
    | Cons1(y_t1,ysMore_t2) ->
      let k = [ysMore_t2], fun [ysMore_f1] app_26_13'27_arg -> app_26_13'27_arg ysMore_f1 k in
      let k = [revloop_f2], fun [revloop_f1] app_27_13'33_arg -> revloop_f1 app_27_13'33_arg k in
      let k = [acc_f1], fun [acc_f1] app_28_13'30_arg -> app_28_13'30_arg acc_f1 k in
      ::_g5 y_t1 k in
  k lam_29_t1 in
let reverse_g9 = fun ysStart_arg k ->
  let k = [ysStart_arg], fun [ysStart_f1] app_30_15'10_arg -> app_30_15'10_arg ysStart_f1 k in
  let con_31_15'10_t1 = Nil0 in
  revloop_g8 con_31_15'10_t1 k in
let lit_32_17'26_g10 = '\n' in
let newline_g11 = fun __arg k -> put_char_g3 lit_32_17'26_g10 k in
let lit_36_23'22_g12 = '\n' in
let readloop_g13 = fun readloop_me sofar_arg k ->
  let k = [readloop_me,sofar_arg], fun [readloop_f1,sofar_f2] theChar_arg ->
    let gotten_arg = theChar_arg in
    let k = [gotten_arg,readloop_f1,sofar_f2], fun [gotten_f1,readloop_f2,sofar_f3] app_34_23'22_arg ->
      match app_34_23'22_arg with
      | true1 ->
        let k = [sofar_f3], fun [sofar_f1] __arg -> reverse_g9 sofar_f1 k in
        let con_37_23'40_t1 = Unit0 in
        newline_g11 con_37_23'40_t1 k
      | false0 ->
        let k = [gotten_f1,readloop_f2,sofar_f3], fun [gotten_f1,readloop_f2,sofar_f3] __arg ->
          let k = [readloop_f2], fun [readloop_f1] app_38_24'44_arg -> readloop_f1 app_38_24'44_arg k in
          let k = [sofar_f3], fun [sofar_f1] app_39_24'41_arg -> app_39_24'41_arg sofar_f1 k in
          ::_g5 gotten_f1 k in
        put_char_g3 gotten_f1 k in
    let k = [], fun [] app_35_23'15_arg -> app_35_23'15_arg lit_36_23'22_g12 k in
    eq_char_g1 gotten_arg k in
  let con_33_21'27_t1 = Unit0 in
  get_char_g4 con_33_21'27_t1 k in
let read_line_g14 = fun __arg k ->
  let con_40_26'11_t1 = Nil0 in
  readloop_g13 con_40_26'11_t1 k in
let lit_41_29'13_g15 = "> " in
let main_g16 = fun main_me __arg k ->
  let k = [main_me], fun [main_f1] __arg ->
    let k = [main_f1], fun [main_f1] __arg ->
      let k = [main_f1], fun [main_f1] __arg ->
        let con_45_32'6_t1 = Unit0 in
        main_f1 con_45_32'6_t1 k in
      let con_44_31'9_t1 = Unit0 in
      newline_g11 con_44_31'9_t1 k in
    let k = [], fun [] app_42_30'23_arg -> put_chars_g6 app_42_30'23_arg k in
    let con_43_30'23_t1 = Unit0 in
    read_line_g14 con_43_30'23_t1 k in
  put_string_g7 lit_41_29'13_g15 k in
let con_46_0'0_t1 = Unit0 in
main_g16 con_46_0'0_t1 k
