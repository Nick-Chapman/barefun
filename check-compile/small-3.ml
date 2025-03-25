(*stage3; un-normalized*)
let k () = ()
let eq_char_g1 = fun x_arg k ->
  let lam_16_0'0_t1 = [x_arg], fun [x_f1] y_arg k ->
    let prim_15_0'0_t1 = PRIM_EqChar(x_f1,y_arg) in
    k prim_15_0'0_t1 in
  k lam_16_0'0_t1 in
let explode_g2 = fun x_arg k ->
  let prim_19_0'0_t1 = PRIM_Explode(x_arg) in
  k prim_19_0'0_t1 in
let put_char_g3 = fun x_arg k ->
  let prim_20_0'0_t1 = PRIM_PutChar(x_arg) in
  k prim_20_0'0_t1 in
let get_char_g4 = fun x_arg k ->
  let prim_21_0'0_t1 = PRIM_GetChar(x_arg) in
  k prim_21_0'0_t1 in
let ::_g5 = fun x_arg k ->
  let lam_23_0'0_t1 = [x_arg], fun [x_f1] y_arg k ->
    let con_22_0'0_t1 = Cons1[x_f1,y_arg] in
    k con_22_0'0_t1 in
  k lam_23_0'0_t1 in
let put_chars_g6 = fun put_chars_me xs_arg k ->
  match xs_arg with
  | Nil0 ->
    let con_24_4'10_t1 = Unit0 in
    k con_24_4'10_t1
  | Cons1(x_t1,xsMore_t2) ->
    let k = [put_chars_me,xsMore_t2], fun [put_chars_f1,xsMore_f2] __arg -> put_chars_f1 xsMore_f2 k in
    put_char_g3 x_t1 k in
let put_string_g7 = fun s_arg k ->
  let k = [], fun [] app_25_7'38_arg -> put_chars_g6 app_25_7'38_arg k in
  explode_g2 s_arg k in
let revloop_g8 = fun revloop_me acc_arg k ->
  let lam_29_10'22_t1 = [acc_arg,revloop_me], fun [acc_f1,revloop_f2] ys_arg k ->
    match ys_arg with
    | Nil0 -> k acc_f1
    | Cons1(y_t1,ysMore_t2) ->
      let k = [ysMore_t2], fun [ysMore_f1] app_26_13'27_arg -> app_26_13'27_arg ysMore_f1 k in
      let k = [revloop_f2], fun [revloop_f1] app_27_13'33_arg -> revloop_f1 app_27_13'33_arg k in
      let k = [acc_f1], fun [acc_f1] app_28_13'30_arg -> app_28_13'30_arg acc_f1 k in
      ::_g5 y_t1 k in
  k lam_29_10'22_t1 in
let reverse_g9 = fun ysStart_arg k ->
  let k = [ysStart_arg], fun [ysStart_f1] app_30_15'10_arg -> app_30_15'10_arg ysStart_f1 k in
  let con_31_15'10_t1 = Nil0 in
  revloop_g8 con_31_15'10_t1 k in
let lit_32_17'26_g10 = '\n' in
let newline_g11 = fun __arg k -> put_char_g3 lit_32_17'26_g10 k in
let put_string_newline_g12 = fun s_arg k ->
  let k = [], fun [] __arg ->
    let con_33_21'10_t1 = Unit0 in
    newline_g11 con_33_21'10_t1 k in
  put_string_g7 s_arg k in
let lit_37_27'22_g13 = '\n' in
let readloop_g14 = fun readloop_me sofar_arg k ->
  let k = [readloop_me,sofar_arg], fun [readloop_f1,sofar_f2] theChar_arg ->
    let gotten_arg = theChar_arg in
    let k = [gotten_arg,readloop_f1,sofar_f2], fun [gotten_f1,readloop_f2,sofar_f3] app_35_27'22_arg ->
      match app_35_27'22_arg with
      | true1 ->
        let k = [sofar_f3], fun [sofar_f1] __arg -> reverse_g9 sofar_f1 k in
        let con_38_27'40_t1 = Unit0 in
        newline_g11 con_38_27'40_t1 k
      | false0 ->
        let k = [gotten_f1,readloop_f2,sofar_f3], fun [gotten_f1,readloop_f2,sofar_f3] __arg ->
          let k = [readloop_f2], fun [readloop_f1] app_39_28'44_arg -> readloop_f1 app_39_28'44_arg k in
          let k = [sofar_f3], fun [sofar_f1] app_40_28'41_arg -> app_40_28'41_arg sofar_f1 k in
          ::_g5 gotten_f1 k in
        put_char_g3 gotten_f1 k in
    let k = [], fun [] app_36_27'15_arg -> app_36_27'15_arg lit_37_27'22_g13 k in
    eq_char_g1 gotten_arg k in
  let con_34_25'27_t1 = Unit0 in
  get_char_g4 con_34_25'27_t1 k in
let read_line_g15 = fun __arg k ->
  let con_41_30'11_t1 = Nil0 in
  readloop_g14 con_41_30'11_t1 k in
let lit_42_32'28_g16 = "LOAD" in
let lit_43_35'13_g17 = "> " in
let mainloop_g18 = fun mainloop_me __arg k ->
  let k = [mainloop_me], fun [mainloop_f1] __arg ->
    let k = [mainloop_f1], fun [mainloop_f1] __arg ->
      let k = [mainloop_f1], fun [mainloop_f1] __arg ->
        let con_47_38'10_t1 = Unit0 in
        mainloop_f1 con_47_38'10_t1 k in
      let con_46_37'9_t1 = Unit0 in
      newline_g11 con_46_37'9_t1 k in
    let k = [], fun [] app_44_36'23_arg -> put_chars_g6 app_44_36'23_arg k in
    let con_45_36'23_t1 = Unit0 in
    read_line_g15 con_45_36'23_t1 k in
  put_string_g7 lit_43_35'13_g17 k in
let lit_48_41'21_g19 = "RUN" in
let lit_50_43'21_g20 = "NEVER" in
let main_g21 = fun __arg k ->
  let k = [], fun [] __arg ->
    let k = [], fun [] __arg -> put_string_newline_g12 lit_50_43'21_g20 k in
    let con_49_42'20_t1 = Unit0 in
    mainloop_g18 con_49_42'20_t1 k in
  put_string_newline_g12 lit_48_41'21_g19 k in
let k = [], fun [] __arg ->
  let con_51_0'0_t1 = Unit0 in
  main_g21 con_51_0'0_t1 k in
put_string_newline_g12 lit_42_32'28_g16 k
