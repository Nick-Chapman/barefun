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
let ( * )_g3 = fun x_arg k ->
  let v6_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v5_t1 = PRIM_MulInt(x_f1,y_arg) in
    k v5_t1 in
  k v6_t1 in
let /_g4 = fun x_arg k ->
  let v8_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v7_t1 = PRIM_DivInt(x_f1,y_arg) in
    k v7_t1 in
  k v8_t1 in
let %_g5 = fun x_arg k ->
  let v10_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v9_t1 = PRIM_ModInt(x_f1,y_arg) in
    k v9_t1 in
  k v10_t1 in
let <_g6 = fun x_arg k ->
  let v12_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v11_t1 = PRIM_LessInt(x_f1,y_arg) in
    k v11_t1 in
  k v12_t1 in
let =_g7 = fun x_arg k ->
  let v14_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v13_t1 = PRIM_EqInt(x_f1,y_arg) in
    k v13_t1 in
  k v14_t1 in
let eq_char_g8 = fun x_arg k ->
  let v16_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v15_t1 = PRIM_EqChar(x_f1,y_arg) in
    k v15_t1 in
  k v16_t1 in
let ord_g9 = fun x_arg k ->
  let v17_t1 = PRIM_CharOrd(x_arg) in
  k v17_t1 in
let chr_g10 = fun x_arg k ->
  let v18_t1 = PRIM_CharChr(x_arg) in
  k v18_t1 in
let explode_g11 = fun x_arg k ->
  let v19_t1 = PRIM_Explode(x_arg) in
  k v19_t1 in
let put_char_g12 = fun x_arg k ->
  let v20_t1 = PRIM_PutChar(x_arg) in
  k v20_t1 in
let get_char_g13 = fun x_arg k ->
  let v21_t1 = PRIM_GetChar(x_arg) in
  k v21_t1 in
let ::_g14 = fun x_arg k ->
  let v23_t1 = [x_arg], fun[x_f1] y_arg k ->
    let v22_t1 = Cons1[x_f1,y_arg] in
    k v22_t1 in
  k v23_t1 in
let not_g15 = fun b_arg k ->
  match b_arg with
  | true1 ->
    let v24_t1 = false0 in
    k v24_t1
  | false0 ->
    let v25_t1 = true1 in
    k v25_t1 in
let >_g16 = fun a_arg k ->
  let v27_t1 = [a_arg], fun[a_f1] b_arg k ->
    let k = [a_f1], fun [a_f1] u26_arg -> u26_arg a_f1 k in
    <_g6 b_arg k in
  k v27_t1 in
let <=_g17 = fun a_arg k ->
  let v30_t1 = [a_arg], fun[a_f1] b_arg k ->
    let k = [], fun [] u28_arg -> not_g15 u28_arg k in
    let k = [a_f1], fun [a_f1] u29_arg -> u29_arg a_f1 k in
    <_g6 b_arg k in
  k v30_t1 in
let >=_g18 = fun a_arg k ->
  let v33_t1 = [a_arg], fun[a_f1] b_arg k ->
    let k = [], fun [] u31_arg -> not_g15 u31_arg k in
    let k = [b_arg], fun [b_f1] u32_arg -> u32_arg b_f1 k in
    <_g6 a_f1 k in
  k v33_t1 in
let u37_g19 = '0' in
let u40_g20 = 0 in
let u43_g21 = 9 in
let parse_digit_g22 = fun c_arg k ->
  let k = [], fun [] n_arg ->
    let k = [n_arg], fun [n_f1] u38_arg ->
      match u38_arg with
      | true1 ->
        let k = [n_f1], fun [n_f1] u41_arg ->
          match u41_arg with
          | true1 ->
            let v44_t1 = Some0[n_f1] in
            k v44_t1
          | false0 ->
            let v45_t1 = None1 in
            k v45_t1 in
        let k = [], fun [] u42_arg -> u42_arg u43_g21 k in
        <=_g17 n_f1 k
      | false0 ->
        let v46_t1 = None1 in
        k v46_t1 in
    let k = [], fun [] u39_arg -> u39_arg u40_g20 k in
    >=_g18 n_arg k in
  let k = [], fun [] u34_arg ->
    let k = [u34_arg], fun [u34_f1] u36_arg -> u34_f1 u36_arg k in
    ord_g9 u37_g19 k in
  let k = [], fun [] u35_arg -> -_g2 u35_arg k in
  ord_g9 c_arg k in
let u55_g23 = 10 in
let loop_g24 = fun loop_me acc_arg k ->
  let v56_t1 = [acc_arg,loop_me], fun[acc_f1,loop_f2] xs_arg k ->
    match xs_arg with
    | Nil0 ->
      let v47_t1 = Some0[acc_f1] in
      k v47_t1
    | Cons1(x_t1,xs_t2) ->
      let k = [acc_f1,loop_f2,xs_t2], fun [acc_f1,loop_f2,xs_f3] u48_arg ->
        match u48_arg with
        | None1 ->
          let v49_t1 = None1 in
          k v49_t1
        | Some0(d_t1) ->
          let k = [xs_f3], fun [xs_f1] u50_arg -> u50_arg xs_f1 k in
          let k = [loop_f2], fun [loop_f1] u51_arg -> loop_f1 u51_arg k in
          let k = [d_t1], fun [d_f1] u52_arg -> u52_arg d_f1 k in
          let k = [], fun [] u53_arg -> +_g1 u53_arg k in
          let k = [acc_f1], fun [acc_f1] u54_arg -> u54_arg acc_f1 k in
          ( * )_g3 u55_g23 k in
      parse_digit_g22 x_t1 k in
  k v56_t1 in
let u58_g25 = 0 in
let parse_num_g26 = fun s_arg k ->
  let k = [s_arg], fun [s_f1] u57_arg -> u57_arg s_f1 k in
  loop_g24 u58_g25 k in
let cons_g27 = fun x_arg k ->
  let v60_t1 = [x_arg], fun[x_f1] xs_arg k ->
    let k = [xs_arg], fun [xs_f1] u59_arg -> u59_arg xs_f1 k in
    ::_g14 x_f1 k in
  k v60_t1 in
let eq_list_g28 = fun eq_list_me eq_arg k ->
  let v70_t1 = [eq_arg,eq_list_me], fun[eq_f1,eq_list_f2] xs_arg k ->
    let v69_t1 = [eq_f1,eq_list_f2,xs_arg], fun[eq_f1,eq_list_f2,xs_f3] ys_arg k ->
      match xs_f3 with
      | Nil0 ->
        match ys_arg with
        | Nil0 ->
          let v61_t1 = true1 in
          k v61_t1
        | Cons1(__t1,__t2) ->
          let v62_t3 = false0 in
          k v62_t3
      | Cons1(x_t1,xs_t2) ->
        match ys_arg with
        | Nil0 ->
          let v63_t3 = false0 in
          k v63_t3
        | Cons1(y_t3,ys_t4) ->
          let k = [eq_f1,eq_list_f2,xs_t2,ys_t4], fun [eq_f1,eq_list_f2,xs_f3,ys_f4] u64_arg ->
            match u64_arg with
            | true1 ->
              let k = [ys_f4], fun [ys_f1] u66_arg -> u66_arg ys_f1 k in
              let k = [xs_f3], fun [xs_f1] u67_arg -> u67_arg xs_f1 k in
              eq_list_f2 eq_f1 k
            | false0 ->
              let v68_t1 = false0 in
              k v68_t1 in
          let k = [y_t3], fun [y_f1] u65_arg -> u65_arg y_f1 k in
          eq_f1 x_t1 k in
    k v69_t1 in
  k v70_t1 in
let eq_char_list_g29 = fun a_arg k ->
  let v73_t1 = [a_arg], fun[a_f1] b_arg k ->
    let k = [b_arg], fun [b_f1] u71_arg -> u71_arg b_f1 k in
    let k = [a_f1], fun [a_f1] u72_arg -> u72_arg a_f1 k in
    eq_list_g28 eq_char_g8 k in
  k v73_t1 in
let append_g30 = fun append_me xs_arg k ->
  let v77_t1 = [append_me,xs_arg], fun[append_f1,xs_f2] ys_arg k ->
    match xs_f2 with
    | Nil0 -> k ys_arg
    | Cons1(x_t1,xs_t2) ->
      let k = [append_f1,xs_t2,ys_arg], fun [append_f1,xs_f2,ys_f3] u74_arg ->
        let k = [u74_arg], fun [u74_f1] u75_arg -> u74_f1 u75_arg k in
        let k = [ys_f3], fun [ys_f1] u76_arg -> u76_arg ys_f1 k in
        append_f1 xs_f2 k in
      cons_g27 x_t1 k in
  k v77_t1 in
let loop_g31 = fun loop_me acc_arg k ->
  let v81_t1 = [acc_arg,loop_me], fun[acc_f1,loop_f2] xs_arg k ->
    match xs_arg with
    | Nil0 -> k acc_f1
    | Cons1(x_t1,xs_t2) ->
      let k = [xs_t2], fun [xs_f1] u78_arg -> u78_arg xs_f1 k in
      let k = [loop_f2], fun [loop_f1] u79_arg -> loop_f1 u79_arg k in
      let k = [acc_f1], fun [acc_f1] u80_arg -> u80_arg acc_f1 k in
      cons_g27 x_t1 k in
  k v81_t1 in
let reverse_g32 = fun xs_arg k ->
  let k = [xs_arg], fun [xs_f1] u82_arg -> u82_arg xs_f1 k in
  let u83_t1 = Nil0 in
  loop_g31 u83_t1 k in
let map_g33 = fun map_me f_arg k ->
  let v89_t1 = [f_arg,map_me], fun[f_f1,map_f2] xs_arg k ->
    match xs_arg with
    | Nil0 ->
      let v84_t1 = Nil0 in
      k v84_t1
    | Cons1(x_t1,xs_t2) ->
      let k = [f_f1,map_f2,xs_t2], fun [f_f1,map_f2,xs_f3] u85_arg ->
        let k = [u85_arg], fun [u85_f1] u87_arg -> u85_f1 u87_arg k in
        let k = [xs_f3], fun [xs_f1] u88_arg -> u88_arg xs_f1 k in
        map_f2 f_f1 k in
      let k = [], fun [] u86_arg -> ::_g14 u86_arg k in
      f_f1 x_t1 k in
  k v89_t1 in
let v90_g34 = 0 in
let u92_g35 = 1 in
let length_g36 = fun length_me xs_arg k ->
  match xs_arg with
  | Nil0 -> k v90_g34
  | Cons1(__t1,xs_t2) ->
    let k = [length_me,xs_t2], fun [length_f1,xs_f2] u91_arg ->
      let k = [u91_arg], fun [u91_f1] u93_arg -> u91_f1 u93_arg k in
      length_f1 xs_f2 k in
    +_g1 u92_g35 k in
let u94_g37 = '0' in
let u99_g38 = 0 in
let u106_g39 = 10 in
let u109_g40 = 10 in
let u113_g41 = 0 in
let u115_g42 = '0' in
let chars_of_int_g43 = fun i_arg k ->
  let k = [i_arg], fun [i_f1] ord0_arg ->
    let char_of_digit_t1 = [ord0_arg], fun[ord0_f1] c_arg k ->
      let k = [], fun [] u95_arg -> chr_g10 u95_arg k in
      let k = [c_arg], fun [c_f1] u96_arg -> u96_arg c_f1 k in
      +_g1 ord0_f1 k in
    let loop_t2 = [char_of_digit_t1], fun [char_of_digit_f1] loop_me acc_arg k ->
      let v110_t1 = [acc_arg,char_of_digit_f1,loop_me], fun[acc_f1,char_of_digit_f2,loop_f3] i_arg k ->
        let k = [acc_f1,char_of_digit_f2,i_arg,loop_f3], fun [acc_f1,char_of_digit_f2,i_f3,loop_f4] u97_arg ->
          match u97_arg with
          | true1 -> k acc_f1
          | false0 ->
            let k = [i_f3], fun [i_f1] u100_arg ->
              let k = [u100_arg], fun [u100_f1] u107_arg -> u100_f1 u107_arg k in
              let k = [], fun [] u108_arg -> u108_arg u109_g40 k in
              /_g4 i_f1 k in
            let k = [loop_f4], fun [loop_f1] u101_arg -> loop_f1 u101_arg k in
            let k = [acc_f1], fun [acc_f1] u102_arg -> u102_arg acc_f1 k in
            let k = [], fun [] u103_arg -> cons_g27 u103_arg k in
            let k = [char_of_digit_f2], fun [char_of_digit_f1] u104_arg -> char_of_digit_f1 u104_arg k in
            let k = [], fun [] u105_arg -> u105_arg u106_g39 k in
            %_g5 i_f3 k in
        let k = [], fun [] u98_arg -> u98_arg u99_g38 k in
        =_g7 i_arg k in
      k v110_t1 in
    let k = [i_f1,loop_t2], fun [i_f1,loop_f2] u111_arg ->
      match u111_arg with
      | true1 ->
        let k = [], fun [] u114_arg ->
          let u116_t1 = Nil0 in
          u114_arg u116_t1 k in
        cons_g27 u115_g42 k
      | false0 ->
        let k = [i_f1], fun [i_f1] u117_arg -> u117_arg i_f1 k in
        let u118_t1 = Nil0 in
        loop_f2 u118_t1 k in
    let k = [], fun [] u112_arg -> u112_arg u113_g41 k in
    =_g7 i_f1 k in
  ord_g9 u94_g37 k in
let put_chars_g44 = fun put_chars_me xs_arg k ->
  match xs_arg with
  | Nil0 ->
    let v119_t1 = Unit0 in
    k v119_t1
  | Cons1(x_t1,xs_t2) ->
    let k = [put_chars_me,xs_t2], fun [put_chars_f1,xs_f2] __arg -> put_chars_f1 xs_f2 k in
    put_char_g12 x_t1 k in
let put_string_g45 = fun s_arg k ->
  let k = [], fun [] u120_arg -> put_chars_g44 u120_arg k in
  explode_g11 s_arg k in
let put_int_g46 = fun i_arg k ->
  let k = [], fun [] u121_arg -> put_chars_g44 u121_arg k in
  chars_of_int_g43 i_arg k in
let u122_g47 = '\n' in
let newline_g48 = fun __arg k -> put_char_g12 u122_g47 k in
let put_string_newline_g49 = fun s_arg k ->
  let k = [], fun [] __arg ->
    let u123_t1 = Unit0 in
    newline_g48 u123_t1 k in
  put_string_g45 s_arg k in
let u127_g50 = '\n' in
let u131_g51 = 31 in
let u134_g52 = 127 in
let u137_g53 = 127 in
let u139_g54 = 8 in
let u140_g55 = ' ' in
let u142_g56 = 8 in
let loop_g57 = fun loop_me acc_arg k ->
  let k = [acc_arg,loop_me], fun [acc_f1,loop_f2] c_arg ->
    let k = [acc_f1,c_arg,loop_f2], fun [acc_f1,c_f2,loop_f3] n_arg ->
      let k = [acc_f1,c_f2,loop_f3,n_arg], fun [acc_f1,c_f2,loop_f3,n_f4] u125_arg ->
        match u125_arg with
        | true1 ->
          let k = [acc_f1], fun [acc_f1] __arg -> reverse_g32 acc_f1 k in
          let u128_t1 = Unit0 in
          newline_g48 u128_t1 k
        | false0 ->
          let k = [acc_f1,c_f2,loop_f3,n_f4], fun [acc_f1,c_f2,loop_f3,n_f4] u129_arg ->
            match u129_arg with
            | true1 -> loop_f3 acc_f1 k
            | false0 ->
              let k = [acc_f1,c_f2,loop_f3,n_f4], fun [acc_f1,c_f2,loop_f3,n_f4] u132_arg ->
                match u132_arg with
                | true1 -> loop_f3 acc_f1 k
                | false0 ->
                  let k = [acc_f1,c_f2,loop_f3], fun [acc_f1,c_f2,loop_f3] u135_arg ->
                    match u135_arg with
                    | true1 ->
                      match acc_f1 with
                      | Nil0 -> loop_f3 acc_f1 k
                      | Cons1(__t1,tail_t2) ->
                        let k = [loop_f3,tail_t2], fun [loop_f1,tail_f2] __arg ->
                          let k = [loop_f1,tail_f2], fun [loop_f1,tail_f2] __arg ->
                            let k = [loop_f1,tail_f2], fun [loop_f1,tail_f2] __arg -> loop_f1 tail_f2 k in
                            let k = [], fun [] u141_arg -> put_char_g12 u141_arg k in
                            chr_g10 u142_g56 k in
                          put_char_g12 u140_g55 k in
                        let k = [], fun [] u138_arg -> put_char_g12 u138_arg k in
                        chr_g10 u139_g54 k
                    | false0 ->
                      let k = [acc_f1,c_f2,loop_f3], fun [acc_f1,c_f2,loop_f3] __arg ->
                        let k = [loop_f3], fun [loop_f1] u143_arg -> loop_f1 u143_arg k in
                        let k = [acc_f1], fun [acc_f1] u144_arg -> u144_arg acc_f1 k in
                        cons_g27 c_f2 k in
                      put_char_g12 c_f2 k in
                  let k = [], fun [] u136_arg -> u136_arg u137_g53 k in
                  =_g7 n_f4 k in
              let k = [], fun [] u133_arg -> u133_arg u134_g52 k in
              >_g16 n_f4 k in
          let k = [], fun [] u130_arg -> u130_arg u131_g51 k in
          <=_g17 n_f4 k in
      let k = [], fun [] u126_arg -> u126_arg u127_g50 k in
      eq_char_g8 c_f2 k in
    ord_g9 c_arg k in
  let u124_t1 = Unit0 in
  get_char_g13 u124_t1 k in
let read_line_g58 = fun __arg k ->
  let u145_t1 = Nil0 in
  loop_g57 u145_t1 k in
let u148_g59 = 2 in
let u153_g60 = 1 in
let u157_g61 = 2 in
let fib_g62 = fun fib_me n_arg k ->
  let k = [fib_me,n_arg], fun [fib_f1,n_f2] u146_arg ->
    match u146_arg with
    | true1 -> k n_f2
    | false0 ->
      let k = [fib_f1,n_f2], fun [fib_f1,n_f2] u149_arg ->
        let k = [u149_arg], fun [u149_f1] u154_arg -> u149_f1 u154_arg k in
        let k = [fib_f1], fun [fib_f1] u155_arg -> fib_f1 u155_arg k in
        let k = [], fun [] u156_arg -> u156_arg u157_g61 k in
        -_g2 n_f2 k in
      let k = [], fun [] u150_arg -> +_g1 u150_arg k in
      let k = [fib_f1], fun [fib_f1] u151_arg -> fib_f1 u151_arg k in
      let k = [], fun [] u152_arg -> u152_arg u153_g60 k in
      -_g2 n_f2 k in
  let k = [], fun [] u147_arg -> u147_arg u148_g59 k in
  <_g6 n_arg k in
let u160_g63 = 2 in
let u165_g64 = 1 in
let v166_g65 = 1 in
let fact_g66 = fun fact_me n_arg k ->
  let k = [fact_me,n_arg], fun [fact_f1,n_f2] u158_arg ->
    match u158_arg with
    | true1 ->
      let k = [n_f2], fun [n_f1] u161_arg -> u161_arg n_f1 k in
      let k = [], fun [] u162_arg -> ( * )_g3 u162_arg k in
      let k = [fact_f1], fun [fact_f1] u163_arg -> fact_f1 u163_arg k in
      let k = [], fun [] u164_arg -> u164_arg u165_g64 k in
      -_g2 n_f2 k
    | false0 -> k v166_g65 in
  let k = [], fun [] u159_arg -> u159_arg u160_g63 k in
  >=_g18 n_arg k in
let u167_g67 = "ERROR: " in
let error_g68 = fun s_arg k ->
  let k = [s_arg], fun [s_f1] __arg ->
    let k = [], fun [] __arg ->
      let u168_t1 = Unit0 in
      newline_g48 u168_t1 k in
    put_string_g45 s_f1 k in
  put_string_g45 u167_g67 k in
let u169_g69 = "fib: " in
let u170_g70 = "expected an argument" in
let u171_g71 = "expected exactly one argument" in
let u173_g72 = "expected arg1 to be numeric" in
let u174_g73 = " --> " in
let runfib_g74 = fun args_arg k ->
  let k = [args_arg], fun [args_f1] __arg ->
    match args_f1 with
    | Nil0 -> error_g68 u170_g70 k
    | Cons1(arg1_t1,more_t2) ->
      match more_t2 with
      | Cons1(__t3,__t4) -> error_g68 u171_g71 k
      | Nil0 ->
        let k = [], fun [] u172_arg ->
          match u172_arg with
          | None1 -> error_g68 u173_g72 k
          | Some0(n_t1) ->
            let k = [n_t1], fun [n_f1] res_arg ->
              let k = [res_arg], fun [res_f1] __arg ->
                let k = [res_f1], fun [res_f1] __arg ->
                  let k = [], fun [] __arg ->
                    let u175_t1 = Unit0 in
                    newline_g48 u175_t1 k in
                  put_int_g46 res_f1 k in
                put_string_g45 u174_g73 k in
              put_int_g46 n_f1 k in
            fib_g62 n_t1 k in
        parse_num_g26 arg1_t1 k in
  put_string_g45 u169_g69 k in
let u176_g75 = "fact: " in
let u177_g76 = "expected an argument" in
let u178_g77 = "expected exactly one argument" in
let u180_g78 = "expected arg1 to be numeric" in
let u181_g79 = " --> " in
let runfact_g80 = fun args_arg k ->
  let k = [args_arg], fun [args_f1] __arg ->
    match args_f1 with
    | Nil0 -> error_g68 u177_g76 k
    | Cons1(arg1_t1,more_t2) ->
      match more_t2 with
      | Cons1(__t3,__t4) -> error_g68 u178_g77 k
      | Nil0 ->
        let k = [], fun [] u179_arg ->
          match u179_arg with
          | None1 -> error_g68 u180_g78 k
          | Some0(n_t1) ->
            let k = [n_t1], fun [n_f1] res_arg ->
              let k = [res_arg], fun [res_f1] __arg ->
                let k = [res_f1], fun [res_f1] __arg ->
                  let k = [], fun [] __arg ->
                    let u182_t1 = Unit0 in
                    newline_g48 u182_t1 k in
                  put_int_g46 res_f1 k in
                put_string_g45 u181_g79 k in
              put_int_g46 n_f1 k in
            fact_g66 n_t1 k in
        parse_num_g26 arg1_t1 k in
  put_string_g45 u176_g75 k in
let u186_g81 = 'o' in
let v187_g82 = '*' in
let u183_g83 = fun c_arg k ->
  let k = [c_arg], fun [c_f1] u184_arg ->
    match u184_arg with
    | true1 -> k v187_g82
    | false0 -> k c_f1 in
  let k = [], fun [] u185_arg -> u185_arg u186_g81 k in
  eq_char_g8 c_arg k in
let u189_g84 = 100 in
let u194_g85 = "You wrote: " in
let u196_g86 = ' ' in
let u197_g87 = '{' in
let u198_g88 = '}' in
let fallback_g89 = fun line_arg k ->
  let k = [line_arg], fun [line_f1] star_the_ohs_arg ->
    let k = [line_f1,star_the_ohs_arg], fun [line_f1,star_the_ohs_f2] n_arg ->
      let k = [n_arg], fun [n_f1] __arg ->
        let k = [n_f1], fun [n_f1] __arg ->
          let k = [n_f1], fun [n_f1] __arg ->
            let k = [], fun [] __arg ->
              let k = [], fun [] __arg ->
                let u199_t1 = Unit0 in
                newline_g48 u199_t1 k in
              put_char_g12 u198_g88 k in
            put_int_g46 n_f1 k in
          put_char_g12 u197_g87 k in
        put_char_g12 u196_g86 k in
      let k = [], fun [] u191_arg -> put_chars_g44 u191_arg k in
      let k = [line_f1,star_the_ohs_f2], fun [line_f1,star_the_ohs_f2] u192_arg ->
        let k = [u192_arg], fun [u192_f1] u195_arg -> u192_f1 u195_arg k in
        star_the_ohs_f2 line_f1 k in
      let k = [], fun [] u193_arg -> append_g30 u193_arg k in
      explode_g11 u194_g85 k in
    let k = [line_f1], fun [line_f1] u188_arg ->
      let k = [u188_arg], fun [u188_f1] u190_arg -> u188_f1 u190_arg k in
      length_g36 line_f1 k in
    +_g1 u189_g84 k in
  map_g33 u183_g83 k in
let u205_g90 = ' ' in
let loop_g91 = fun loop_me accWs_arg k ->
  let v217_t1 = [accWs_arg,loop_me], fun[accWs_f1,loop_f2] accCs_arg k ->
    let v216_t1 = [accCs_arg,accWs_f1,loop_f2], fun[accCs_f1,accWs_f2,loop_f3] xs_arg k ->
      match xs_arg with
      | Nil0 ->
        let k = [], fun [] u200_arg -> reverse_g32 u200_arg k in
        let k = [accWs_f2], fun [accWs_f1] u201_arg -> u201_arg accWs_f1 k in
        let k = [], fun [] u202_arg -> ::_g14 u202_arg k in
        reverse_g32 accCs_f1 k
      | Cons1(x_t1,xs_t2) ->
        let k = [accCs_f1,accWs_f2,loop_f3,x_t1,xs_t2], fun [accCs_f1,accWs_f2,loop_f3,x_f4,xs_f5] u203_arg ->
          match u203_arg with
          | true1 ->
            let k = [xs_f5], fun [xs_f1] u206_arg -> u206_arg xs_f1 k in
            let k = [], fun [] u207_arg ->
              let u211_t1 = Nil0 in
              u207_arg u211_t1 k in
            let k = [loop_f3], fun [loop_f1] u208_arg -> loop_f1 u208_arg k in
            let k = [accWs_f2], fun [accWs_f1] u209_arg -> u209_arg accWs_f1 k in
            let k = [], fun [] u210_arg -> ::_g14 u210_arg k in
            reverse_g32 accCs_f1 k
          | false0 ->
            let k = [xs_f5], fun [xs_f1] u212_arg -> u212_arg xs_f1 k in
            let k = [accCs_f1,x_f4], fun [accCs_f1,x_f2] u213_arg ->
              let k = [u213_arg], fun [u213_f1] u214_arg -> u213_f1 u214_arg k in
              let k = [accCs_f1], fun [accCs_f1] u215_arg -> u215_arg accCs_f1 k in
              ::_g14 x_f2 k in
            loop_f3 accWs_f2 k in
        let k = [], fun [] u204_arg -> u204_arg u205_g90 k in
        eq_char_g8 x_t1 k in
    k v216_t1 in
  k v217_t1 in
let split_words_g92 = fun s_arg k ->
  let k = [s_arg], fun [s_f1] u218_arg -> u218_arg s_f1 k in
  let k = [], fun [] u219_arg ->
    let u221_t1 = Nil0 in
    u219_arg u221_t1 k in
  let u220_t1 = Nil0 in
  loop_g91 u220_t1 k in
let u226_g93 = "fib" in
let u230_g94 = "fact" in
let execute_g95 = fun line_arg k ->
  let k = [line_arg], fun [line_f1] words_arg ->
    match words_arg with
    | Nil0 ->
      let v222_t1 = Unit0 in
      k v222_t1
    | Cons1(command_t1,args_t2) ->
      let k = [args_t2,command_t1,line_f1], fun [args_f1,command_f2,line_f3] u223_arg ->
        match u223_arg with
        | true1 -> runfib_g74 args_f1 k
        | false0 ->
          let k = [args_f1,line_f3], fun [args_f1,line_f2] u227_arg ->
            match u227_arg with
            | true1 -> runfact_g80 args_f1 k
            | false0 -> fallback_g89 line_f2 k in
          let k = [], fun [] u228_arg ->
            let k = [u228_arg], fun [u228_f1] u229_arg -> u228_f1 u229_arg k in
            explode_g11 u230_g94 k in
          eq_char_list_g29 command_f2 k in
      let k = [], fun [] u224_arg ->
        let k = [u224_arg], fun [u224_f1] u225_arg -> u224_f1 u225_arg k in
        explode_g11 u226_g93 k in
      eq_char_list_g29 command_t1 k in
  split_words_g92 line_arg k in
let u231_g96 = '>' in
let u232_g97 = ' ' in
let mainloop_g98 = fun mainloop_me __arg k ->
  let k = [mainloop_me], fun [mainloop_f1] __arg ->
    let k = [mainloop_f1], fun [mainloop_f1] __arg ->
      let k = [mainloop_f1], fun [mainloop_f1] xs_arg ->
        let k = [mainloop_f1], fun [mainloop_f1] __arg ->
          let u234_t1 = Unit0 in
          mainloop_f1 u234_t1 k in
        execute_g95 xs_arg k in
      let u233_t1 = Unit0 in
      read_line_g58 u233_t1 k in
    put_char_g12 u232_g97 k in
  put_char_g12 u231_g96 k in
let u235_g99 = "LOAD" in
let u236_g100 = "RUN" in
let u238_g101 = "NEVER" in
let main_g102 = fun __arg k ->
  let k = [], fun [] __arg ->
    let k = [], fun [] __arg -> put_string_newline_g49 u238_g101 k in
    let u237_t1 = Unit0 in
    mainloop_g98 u237_t1 k in
  put_string_newline_g49 u236_g100 k in
let k = [], fun [] __arg ->
  let u239_t1 = Unit0 in
  main_g102 u239_t1 k in
put_string_newline_g49 u235_g99 k
