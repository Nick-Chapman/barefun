(*stage3*)
let k () = ()
let eq_char_g1 = fun x_arg k ->
  let v16_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v15_t1 = PRIM_EqChar(x_f1,y_arg) in
    k v15_t1 in
  k v16_t1 in
let explode_g2 = fun x_arg k ->
  let v19_t1 = PRIM_Explode(x_arg) in
  k v19_t1 in
let put_char_g3 = fun x_arg k ->
  let v20_t1 = PRIM_PutChar(x_arg) in
  k v20_t1 in
let get_char_g4 = fun x_arg k ->
  let v21_t1 = PRIM_GetChar(x_arg) in
  k v21_t1 in
let ::_g5 = fun x_arg k ->
  let v23_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v22_t1 = Tag_1[x_f1,y_arg] in
    k v22_t1 in
  k v23_t1 in
let put_chars_g6 = fun put_chars_me xs_arg k ->
  match xs_arg with
  | Tag_0 ->
    let v24_t1 = Tag_0 in
    k v24_t1
  | Tag_1(x_t1,xsMore_t2) ->
    let k = [put_chars_me,xsMore_t2], fun [put_chars_f1,xsMore_f2] __arg -> put_chars_f1 xsMore_f2 k in
    put_char_g3 x_t1 k in
let put_string_g7 = fun s_arg k ->
  let k = [], fun [] u25_arg -> put_chars_g6 u25_arg k in
  explode_g2 s_arg k in
let revloop_g8 = fun revloop_me acc_arg k ->
  let v29_t1 = [acc_arg,revloop_me], fun[acc_f1,revloop_f2] ys_arg k ->
    match ys_arg with
    | Tag_0 -> k acc_f1
    | Tag_1(y_t1,ysMore_t2) ->
      let k = [ysMore_t2], fun [ysMore_f1] u26_arg -> u26_arg ysMore_f1 k in
      let k = [revloop_f2], fun [revloop_f1] u27_arg -> revloop_f1 u27_arg k in
      let k = [acc_f1], fun [acc_f1] u28_arg -> u28_arg acc_f1 k in
      ::_g5 y_t1 k in
  k v29_t1 in
let reverse_g9 = fun ysStart_arg k ->
  let k = [ysStart_arg], fun [ysStart_f1] u30_arg -> u30_arg ysStart_f1 k in
  let u31_t1 = Tag_0 in
  revloop_g8 u31_t1 k in
let u32_g10 = '\n' in
let newline_g11 = fun __arg k -> put_char_g3 u32_g10 k in
let u36_g12 = '\n' in
let readloop_g13 = fun readloop_me sofar_arg k ->
  let k = [readloop_me,sofar_arg], fun [readloop_f1,sofar_f2] theChar_arg ->
    let gotten_arg = theChar_arg in
    let k = [gotten_arg,readloop_f1,sofar_f2], fun [gotten_f1,readloop_f2,sofar_f3] u34_arg ->
      match u34_arg with
      | Tag_1 ->
        let k = [sofar_f3], fun [sofar_f1] __arg -> reverse_g9 sofar_f1 k in
        let u37_t1 = Tag_0 in
        newline_g11 u37_t1 k
      | Tag_0 ->
        let k = [gotten_f1,readloop_f2,sofar_f3], fun [gotten_f1,readloop_f2,sofar_f3] __arg ->
          let k = [readloop_f2], fun [readloop_f1] u38_arg -> readloop_f1 u38_arg k in
          let k = [sofar_f3], fun [sofar_f1] u39_arg -> u39_arg sofar_f1 k in
          ::_g5 gotten_f1 k in
        put_char_g3 gotten_f1 k in
    let k = [], fun [] u35_arg -> u35_arg u36_g12 k in
    eq_char_g1 gotten_arg k in
  let u33_t1 = Tag_0 in
  get_char_g4 u33_t1 k in
let read_line_g14 = fun __arg k ->
  let u40_t1 = Tag_0 in
  readloop_g13 u40_t1 k in
let u41_g15 = "> " in
let main_g16 = fun main_me __arg k ->
  let k = [main_me], fun [main_f1] __arg ->
    let k = [main_f1], fun [main_f1] __arg ->
      let k = [main_f1], fun [main_f1] __arg ->
        let u45_t1 = Tag_0 in
        main_f1 u45_t1 k in
      let u44_t1 = Tag_0 in
      newline_g11 u44_t1 k in
    let k = [], fun [] u42_arg -> put_chars_g6 u42_arg k in
    let u43_t1 = Tag_0 in
    read_line_g14 u43_t1 k in
  put_string_g7 u41_g15 k in
let u46_t1 = Tag_0 in
main_g16 u46_t1 k
