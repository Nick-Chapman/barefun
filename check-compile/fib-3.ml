(*stage3*)
let k () = ()
let +_g1 = fun x_arg k ->
  let v2_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v1_t1 = PRIM_AddInt(x_f1,y_arg) in
    k v1_t1 in
  k v2_t1 in
let -_g2 = fun x_arg k ->
  let v4_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v3_t1 = PRIM_SubInt(x_f1,y_arg) in
    k v3_t1 in
  k v4_t1 in
let /_g3 = fun x_arg k ->
  let v8_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v7_t1 = PRIM_DivInt(x_f1,y_arg) in
    k v7_t1 in
  k v8_t1 in
let %_g4 = fun x_arg k ->
  let v10_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v9_t1 = PRIM_ModInt(x_f1,y_arg) in
    k v9_t1 in
  k v10_t1 in
let <_g5 = fun x_arg k ->
  let v12_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v11_t1 = PRIM_LessInt(x_f1,y_arg) in
    k v11_t1 in
  k v12_t1 in
let =_g6 = fun x_arg k ->
  let v14_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v13_t1 = PRIM_EqInt(x_f1,y_arg) in
    k v13_t1 in
  k v14_t1 in
let ord_g7 = fun x_arg k ->
  let v17_t1 = PRIM_CharOrd(x_arg) in
  k v17_t1 in
let chr_g8 = fun x_arg k ->
  let v18_t1 = PRIM_CharChr(x_arg) in
  k v18_t1 in
let explode_g9 = fun x_arg k ->
  let v19_t1 = PRIM_Explode(x_arg) in
  k v19_t1 in
let put_char_g10 = fun x_arg k ->
  let v20_t1 = PRIM_PutChar(x_arg) in
  k v20_t1 in
let ::_g11 = fun x_arg k ->
  let v23_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v22_t1 = Tag_1[x_f1,y_arg] in
    k v22_t1 in
  k v23_t1 in
let u24_g12 = '0' in
let u29_g13 = 0 in
let u36_g14 = 10 in
let u39_g15 = 10 in
let u43_g16 = 0 in
let u45_g17 = '0' in
let chars_of_int_g18 = fun i_arg k ->
  let k = [i_arg], fun [i_f1] ord0_arg ->
    let char_of_digit_t1 = [ord0_arg], fun[ord0_f1] c_arg k ->
      let k = [], fun [] u25_arg -> chr_g8 u25_arg k in
      let k = [c_arg], fun [c_f1] u26_arg -> u26_arg c_f1 k in
      +_g1 ord0_f1 k in
    let loop_t2 = [char_of_digit_t1], fun [char_of_digit_f1] loop_me acc_arg k ->
      let v40_t1 = [acc_arg,char_of_digit_f1,loop_me], fun[acc_f1,char_of_digit_f2,loop_f3] i_arg k ->
        let k = [acc_f1,char_of_digit_f2,i_arg,loop_f3], fun [acc_f1,char_of_digit_f2,i_f3,loop_f4] u27_arg ->
          match u27_arg with
          | Tag_1 -> k acc_f1
          | Tag_0 ->
            let k = [i_f3], fun [i_f1] u30_arg ->
              let k = [u30_arg], fun [u30_f1] u37_arg -> u30_f1 u37_arg k in
              let k = [], fun [] u38_arg -> u38_arg u39_g15 k in
              /_g3 i_f1 k in
            let k = [loop_f4], fun [loop_f1] u31_arg -> loop_f1 u31_arg k in
            let k = [acc_f1], fun [acc_f1] u32_arg -> u32_arg acc_f1 k in
            let k = [], fun [] u33_arg -> ::_g11 u33_arg k in
            let k = [char_of_digit_f2], fun [char_of_digit_f1] u34_arg -> char_of_digit_f1 u34_arg k in
            let k = [], fun [] u35_arg -> u35_arg u36_g14 k in
            %_g4 i_f3 k in
        let k = [], fun [] u28_arg -> u28_arg u29_g13 k in
        =_g6 i_arg k in
      k v40_t1 in
    let k = [i_f1,loop_t2], fun [i_f1,loop_f2] u41_arg ->
      match u41_arg with
      | Tag_1 ->
        let k = [], fun [] u44_arg ->
          let u46_t1 = Tag_0 in
          u44_arg u46_t1 k in
        ::_g11 u45_g17 k
      | Tag_0 ->
        let k = [i_f1], fun [i_f1] u47_arg -> u47_arg i_f1 k in
        let u48_t1 = Tag_0 in
        loop_f2 u48_t1 k in
    let k = [], fun [] u42_arg -> u42_arg u43_g16 k in
    =_g6 i_f1 k in
  ord_g7 u24_g12 k in
let put_chars_g19 = fun put_chars_me xs_arg k ->
  match xs_arg with
  | Tag_0 ->
    let v49_t1 = Tag_0 in
    k v49_t1
  | Tag_1(x_t1,xs_t2) ->
    let k = [put_chars_me,xs_t2], fun [put_chars_f1,xs_f2] __arg -> put_chars_f1 xs_f2 k in
    put_char_g10 x_t1 k in
let put_string_g20 = fun s_arg k ->
  let k = [], fun [] u50_arg -> put_chars_g19 u50_arg k in
  explode_g9 s_arg k in
let put_int_g21 = fun i_arg k ->
  let k = [], fun [] u51_arg -> put_chars_g19 u51_arg k in
  chars_of_int_g18 i_arg k in
let u52_g22 = '\n' in
let newline_g23 = fun __arg k -> put_char_g10 u52_g22 k in
let u55_g24 = 2 in
let u60_g25 = 1 in
let u64_g26 = 2 in
let fib_g27 = fun fib_me n_arg k ->
  let k = [fib_me,n_arg], fun [fib_f1,n_f2] u53_arg ->
    match u53_arg with
    | Tag_1 -> k n_f2
    | Tag_0 ->
      let k = [fib_f1,n_f2], fun [fib_f1,n_f2] u56_arg ->
        let k = [u56_arg], fun [u56_f1] u61_arg -> u56_f1 u61_arg k in
        let k = [fib_f1], fun [fib_f1] u62_arg -> fib_f1 u62_arg k in
        let k = [], fun [] u63_arg -> u63_arg u64_g26 k in
        -_g2 n_f2 k in
      let k = [], fun [] u57_arg -> +_g1 u57_arg k in
      let k = [fib_f1], fun [fib_f1] u58_arg -> fib_f1 u58_arg k in
      let k = [], fun [] u59_arg -> u59_arg u60_g25 k in
      -_g2 n_f2 k in
  let k = [], fun [] u54_arg -> u54_arg u55_g24 k in
  <_g5 n_arg k in
let u65_g28 = "fib " in
let u66_g29 = " --> " in
let runfib_g30 = fun n_arg k ->
  let k = [n_arg], fun [n_f1] res_arg ->
    let k = [n_f1,res_arg], fun [n_f1,res_f2] __arg ->
      let k = [res_f2], fun [res_f1] __arg ->
        let k = [res_f1], fun [res_f1] __arg ->
          let k = [], fun [] __arg ->
            let u67_t1 = Tag_0 in
            newline_g23 u67_t1 k in
          put_int_g21 res_f1 k in
        put_string_g20 u66_g29 k in
      put_int_g21 n_f1 k in
    put_string_g20 u65_g28 k in
  fib_g27 n_arg k in
let u68_g31 = 20 in
let main_g32 = fun __arg k -> runfib_g30 u68_g31 k in
let u69_t1 = Tag_0 in
main_g32 u69_t1 k
