[transform3]
----------
let k () = ()
let eq_char_g1 =
  (fun x_arg k ->
    let v2_t1 =
      (fun[x_arg] y_arg k ->
        let v1_t1 = PRIM_EqChar[x_f1,y_arg] in
        k v1_t1) in
    k v2_t1) in
let explode_g2 =
  (fun x_arg k ->
    let v3_t1 = PRIM_Explode[x_arg] in
    k v3_t1) in
let put_char_g3 =
  (fun x_arg k ->
    let v4_t1 = PRIM_PutChar[x_arg] in
    k v4_t1) in
let get_char_g4 =
  (fun x_arg k ->
    let v5_t1 = PRIM_GetChar[x_arg] in
    k v5_t1) in
let ::_g5 =
  (fun x_arg k ->
    let v7_t1 =
      (fun[x_arg] y_arg k ->
        let v6_t1 = Tag_1[x_f1,y_arg] in
        k v6_t1) in
    k v7_t1) in
let put_chars_g6 =
  fix (fun put_chars_me xs_arg k ->
    match xs_arg with
    | Tag_0 ->
      let v8_t1 = Tag_0 in
      k v8_t1
    | Tag_1(x_t1,xsMore_t2) ->
      let k [put_chars_me,x_t1,xsMore_t2] __arg = put_chars_f1 xsMore_f3 k in
      put_char_g3 x_t1 k) in
let put_string_g7 =
  (fun s_arg k ->
    let k [s_arg] u9_arg = put_chars_g6 u9_arg k in
    explode_g2 s_arg k) in
let revloop_g8 =
  fix (fun revloop_me acc_arg k ->
    let v13_t1 =
      (fun[acc_arg,revloop_me] ys_arg k ->
        match ys_arg with
        | Tag_0 -> k acc_f1
        | Tag_1(y_t1,ysMore_t2) ->
          let k [acc_f1,revloop_f2,y_t1,ysMore_t2] u10_arg = u10_arg ysMore_f4 k in
          let k [acc_f1,revloop_f2,y_t1] u11_arg = revloop_f2 u11_arg k in
          let k [acc_f1,y_t1] u12_arg = u12_arg acc_f1 k in
          ::_g5 y_t1 k) in
    k v13_t1) in
let reverse_g9 =
  (fun ysStart_arg k ->
    let k [ysStart_arg] u14_arg = u14_arg ysStart_f1 k in
    let u15_t1 = Tag_0 in
    revloop_g8 u15_t1 k) in
let u16_g10 = '\n' in
let newline_g11 = (fun __arg k -> put_char_g3 u16_g10 k) in
let u20_g12 = '\n' in
let readloop_g13 =
  fix (fun readloop_me sofar_arg k ->
    let k [readloop_me,sofar_arg] c_arg =
      let k [c_arg,readloop_f1,sofar_f2] u18_arg =
        match u18_arg with
        | Tag_1 ->
          let k [sofar_f3] __arg = reverse_g9 sofar_f1 k in
          let u21_t1 = Tag_0 in
          newline_g11 u21_t1 k
        | Tag_0 ->
          let k [c_f1,readloop_f2,sofar_f3] __arg =
            let k [c_f1,readloop_f2,sofar_f3] u22_arg = readloop_f2 u22_arg k in
            let k [c_f1,sofar_f3] u23_arg = u23_arg sofar_f2 k in
            ::_g5 c_f1 k in
          put_char_g3 c_f1 k in
      let k [c_arg] u19_arg = u19_arg u20_g12 k in
      eq_char_g1 c_arg k in
    let u17_t1 = Tag_0 in
    get_char_g4 u17_t1 k) in
let read_line_g14 =
  (fun __arg k ->
    let u24_t1 = Tag_0 in
    readloop_g13 u24_t1 k) in
let u25_g15 = "> " in
let main_g16 =
  fix (fun main_me __arg k ->
    let k [main_me] __arg =
      let k [main_f1] __arg =
        let k [main_f1] __arg =
          let u29_t1 = Tag_0 in
          main_f1 u29_t1 k in
        let u28_t1 = Tag_0 in
        newline_g11 u28_t1 k in
      let k [] u26_arg = put_chars_g6 u26_arg k in
      let u27_t1 = Tag_0 in
      read_line_g14 u27_t1 k in
    put_string_g7 u25_g15 k) in
let u30_t1 = Tag_0 in
main_g16 u30_t1 k
----------
