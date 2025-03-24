[transform3]
----------
let k () = ()
let +_g1 =
  (fun x_arg k ->
    let v2_t1 =
      ([x_arg], fun[x_f1] y_arg k ->
        let v1_t1 = PRIM_AddInt[x_f1,y_arg] in
        k v1_t1) in
    k v2_t1) in
let -_g2 =
  (fun x_arg k ->
    let v4_t1 =
      ([x_arg], fun[x_f1] y_arg k ->
        let v3_t1 = PRIM_SubInt[x_f1,y_arg] in
        k v3_t1) in
    k v4_t1) in
let ( * )_g3 =
  (fun x_arg k ->
    let v6_t1 =
      ([x_arg], fun[x_f1] y_arg k ->
        let v5_t1 = PRIM_MulInt[x_f1,y_arg] in
        k v5_t1) in
    k v6_t1) in
let /_g4 =
  (fun x_arg k ->
    let v8_t1 =
      ([x_arg], fun[x_f1] y_arg k ->
        let v7_t1 = PRIM_DivInt[x_f1,y_arg] in
        k v7_t1) in
    k v8_t1) in
let %_g5 =
  (fun x_arg k ->
    let v10_t1 =
      ([x_arg], fun[x_f1] y_arg k ->
        let v9_t1 = PRIM_ModInt[x_f1,y_arg] in
        k v9_t1) in
    k v10_t1) in
let <_g6 =
  (fun x_arg k ->
    let v12_t1 =
      ([x_arg], fun[x_f1] y_arg k ->
        let v11_t1 = PRIM_LessInt[x_f1,y_arg] in
        k v11_t1) in
    k v12_t1) in
let =_g7 =
  (fun x_arg k ->
    let v14_t1 =
      ([x_arg], fun[x_f1] y_arg k ->
        let v13_t1 = PRIM_EqInt[x_f1,y_arg] in
        k v13_t1) in
    k v14_t1) in
let eq_char_g8 =
  (fun x_arg k ->
    let v16_t1 =
      ([x_arg], fun[x_f1] y_arg k ->
        let v15_t1 = PRIM_EqChar[x_f1,y_arg] in
        k v15_t1) in
    k v16_t1) in
let ord_g9 =
  (fun x_arg k ->
    let v17_t1 = PRIM_CharOrd[x_arg] in
    k v17_t1) in
let chr_g10 =
  (fun x_arg k ->
    let v18_t1 = PRIM_CharChr[x_arg] in
    k v18_t1) in
let explode_g11 =
  (fun x_arg k ->
    let v19_t1 = PRIM_Explode[x_arg] in
    k v19_t1) in
let put_char_g12 =
  (fun x_arg k ->
    let v20_t1 = PRIM_PutChar[x_arg] in
    k v20_t1) in
let get_char_g13 =
  (fun x_arg k ->
    let v21_t1 = PRIM_GetChar[x_arg] in
    k v21_t1) in
let ::_g14 =
  (fun x_arg k ->
    let v23_t1 =
      ([x_arg], fun[x_f1] y_arg k ->
        let v22_t1 = Tag_1[x_f1,y_arg] in
        k v22_t1) in
    k v23_t1) in
let not_g15 =
  (fun b_arg k ->
    match b_arg with
    | Tag_1 ->
      let v24_t1 = Tag_0 in
      k v24_t1
    | Tag_0 ->
      let v25_t1 = Tag_1 in
      k v25_t1) in
let >_g16 =
  (fun a_arg k ->
    let v27_t1 =
      ([a_arg], fun[a_f1] b_arg k ->
        let k = [a_f1], fun [a_f1] u26_arg -> u26_arg a_f1 k in
        <_g6 b_arg k) in
    k v27_t1) in
let <=_g17 =
  (fun a_arg k ->
    let v30_t1 =
      ([a_arg], fun[a_f1] b_arg k ->
        let k = [], fun [] u28_arg -> not_g15 u28_arg k in
        let k = [a_f1], fun [a_f1] u29_arg -> u29_arg a_f1 k in
        <_g6 b_arg k) in
    k v30_t1) in
let >=_g18 =
  (fun a_arg k ->
    let v33_t1 =
      ([a_arg], fun[a_f1] b_arg k ->
        let k = [], fun [] u31_arg -> not_g15 u31_arg k in
        let k = [b_arg], fun [b_f1] u32_arg -> u32_arg b_f1 k in
        <_g6 a_f1 k) in
    k v33_t1) in
let u37_g19 = '0' in
let u40_g20 = 0 in
let u43_g21 = 9 in
let parse_digit_g22 =
  (fun c_arg k ->
    let k = [], fun [] n_arg ->
      let k = [n_arg], fun [n_f1] u38_arg ->
        match u38_arg with
        | Tag_1 ->
          let k = [n_f1], fun [n_f1] u41_arg ->
            match u41_arg with
            | Tag_1 ->
              let v44_t1 = Tag_0[n_f1] in
              k v44_t1
            | Tag_0 ->
              let v45_t1 = Tag_1 in
              k v45_t1 in
          let k = [], fun [] u42_arg -> u42_arg u43_g21 k in
          <=_g17 n_f1 k
        | Tag_0 ->
          let v46_t1 = Tag_1 in
          k v46_t1 in
      let k = [], fun [] u39_arg -> u39_arg u40_g20 k in
      >=_g18 n_arg k in
    let k = [], fun [] u34_arg ->
      let k = [u34_arg], fun [u34_f1] u36_arg -> u34_f1 u36_arg k in
      ord_g9 u37_g19 k in
    let k = [], fun [] u35_arg -> -_g2 u35_arg k in
    ord_g9 c_arg k) in
let u55_g23 = 10 in
let loop_g24 =
  fix (fun loop_me acc_arg k ->
    let v56_t1 =
      ([acc_arg,loop_me], fun[acc_f1,loop_f2] xs_arg k ->
        match xs_arg with
        | Tag_0 ->
          let v47_t1 = Tag_0[acc_f1] in
          k v47_t1
        | Tag_1(x_t1,xs_t2) ->
          let k = [acc_f1,loop_f2,xs_t2], fun [acc_f1,loop_f2,xs_f3] u48_arg ->
            match u48_arg with
            | Tag_1 ->
              let v49_t1 = Tag_1 in
              k v49_t1
            | Tag_0(d_t1) ->
              let k = [xs_f3], fun [xs_f1] u50_arg -> u50_arg xs_f1 k in
              let k = [loop_f2], fun [loop_f1] u51_arg -> loop_f1 u51_arg k in
              let k = [d_t1], fun [d_f1] u52_arg -> u52_arg d_f1 k in
              let k = [], fun [] u53_arg -> +_g1 u53_arg k in
              let k = [acc_f1], fun [acc_f1] u54_arg -> u54_arg acc_f1 k in
              ( * )_g3 u55_g23 k in
          parse_digit_g22 x_t1 k) in
    k v56_t1) in
let u57_g25 = 0 in
let cons_g26 =
  (fun x_arg k ->
    let v59_t1 =
      ([x_arg], fun[x_f1] xs_arg k ->
        let k = [xs_arg], fun [xs_f1] u58_arg -> u58_arg xs_f1 k in
        ::_g14 x_f1 k) in
    k v59_t1) in
let eq_list_g27 =
  fix (fun eq_list_me eq_arg k ->
    let v69_t1 =
      ([eq_arg,eq_list_me], fun[eq_f1,eq_list_f2] xs_arg k ->
        let v68_t1 =
          ([eq_f1,eq_list_f2,xs_arg], fun[eq_f1,eq_list_f2,xs_f3] ys_arg k ->
            match xs_f3 with
            | Tag_0 ->
              match ys_arg with
              | Tag_0 ->
                let v60_t1 = Tag_1 in
                k v60_t1
              | Tag_1(__t1,__t2) ->
                let v61_t3 = Tag_0 in
                k v61_t3
            | Tag_1(x_t1,xs_t2) ->
              match ys_arg with
              | Tag_0 ->
                let v62_t3 = Tag_0 in
                k v62_t3
              | Tag_1(y_t3,ys_t4) ->
                let k = [eq_f1,eq_list_f2,xs_t2,ys_t4], fun [eq_f1,eq_list_f2,xs_f3,ys_f4] u63_arg ->
                  match u63_arg with
                  | Tag_1 ->
                    let k = [ys_f4], fun [ys_f1] u65_arg -> u65_arg ys_f1 k in
                    let k = [xs_f3], fun [xs_f1] u66_arg -> u66_arg xs_f1 k in
                    eq_list_f2 eq_f1 k
                  | Tag_0 ->
                    let v67_t1 = Tag_0 in
                    k v67_t1 in
                let k = [y_t3], fun [y_f1] u64_arg -> u64_arg y_f1 k in
                eq_f1 x_t1 k) in
        k v68_t1) in
    k v69_t1) in
let append_g28 =
  fix (fun append_me xs_arg k ->
    let v73_t1 =
      ([append_me,xs_arg], fun[append_f1,xs_f2] ys_arg k ->
        match xs_f2 with
        | Tag_0 -> k ys_arg
        | Tag_1(x_t1,xs_t2) ->
          let k = [append_f1,xs_t2,ys_arg], fun [append_f1,xs_f2,ys_f3] u70_arg ->
            let k = [u70_arg], fun [u70_f1] u71_arg -> u70_f1 u71_arg k in
            let k = [ys_f3], fun [ys_f1] u72_arg -> u72_arg ys_f1 k in
            append_f1 xs_f2 k in
          cons_g26 x_t1 k) in
    k v73_t1) in
let loop_g29 =
  fix (fun loop_me acc_arg k ->
    let v77_t1 =
      ([acc_arg,loop_me], fun[acc_f1,loop_f2] xs_arg k ->
        match xs_arg with
        | Tag_0 -> k acc_f1
        | Tag_1(x_t1,xs_t2) ->
          let k = [xs_t2], fun [xs_f1] u74_arg -> u74_arg xs_f1 k in
          let k = [loop_f2], fun [loop_f1] u75_arg -> loop_f1 u75_arg k in
          let k = [acc_f1], fun [acc_f1] u76_arg -> u76_arg acc_f1 k in
          cons_g26 x_t1 k) in
    k v77_t1) in
let reverse_g30 =
  (fun xs_arg k ->
    let k = [xs_arg], fun [xs_f1] u78_arg -> u78_arg xs_f1 k in
    let u79_t1 = Tag_0 in
    loop_g29 u79_t1 k) in
let map_g31 =
  fix (fun map_me f_arg k ->
    let v85_t1 =
      ([f_arg,map_me], fun[f_f1,map_f2] xs_arg k ->
        match xs_arg with
        | Tag_0 ->
          let v80_t1 = Tag_0 in
          k v80_t1
        | Tag_1(x_t1,xs_t2) ->
          let k = [f_f1,map_f2,xs_t2], fun [f_f1,map_f2,xs_f3] u81_arg ->
            let k = [u81_arg], fun [u81_f1] u83_arg -> u81_f1 u83_arg k in
            let k = [xs_f3], fun [xs_f1] u84_arg -> u84_arg xs_f1 k in
            map_f2 f_f1 k in
          let k = [], fun [] u82_arg -> ::_g14 u82_arg k in
          f_f1 x_t1 k) in
    k v85_t1) in
let v86_g32 = 0 in
let u88_g33 = 1 in
let length_g34 =
  fix (fun length_me xs_arg k ->
    match xs_arg with
    | Tag_0 -> k v86_g32
    | Tag_1(__t1,xs_t2) ->
      let k = [length_me,xs_t2], fun [length_f1,xs_f2] u87_arg ->
        let k = [u87_arg], fun [u87_f1] u89_arg -> u87_f1 u89_arg k in
        length_f1 xs_f2 k in
      +_g1 u88_g33 k) in
let u90_g35 = '0' in
let u95_g36 = 0 in
let u102_g37 = 10 in
let u105_g38 = 10 in
let u109_g39 = 0 in
let u111_g40 = '0' in
let put_chars_g41 =
  fix (fun put_chars_me xs_arg k ->
    match xs_arg with
    | Tag_0 ->
      let v116_t1 = Tag_0 in
      k v116_t1
    | Tag_1(x_t1,xs_t2) ->
      let k = [put_chars_me,xs_t2], fun [put_chars_f1,xs_f2] __arg -> put_chars_f1 xs_f2 k in
      put_char_g12 x_t1 k) in
let put_string_g42 =
  (fun s_arg k ->
    let k = [], fun [] u117_arg -> put_chars_g41 u117_arg k in
    explode_g11 s_arg k) in
let u119_g43 = '\n' in
let newline_g44 = (fun __arg k -> put_char_g12 u119_g43 k) in
let put_string_newline_g45 =
  (fun s_arg k ->
    let k = [], fun [] __arg ->
      let u120_t1 = Tag_0 in
      newline_g44 u120_t1 k in
    put_string_g42 s_arg k) in
let u124_g46 = '\n' in
let u128_g47 = 31 in
let u131_g48 = 127 in
let u134_g49 = 127 in
let u136_g50 = 8 in
let u137_g51 = ' ' in
let u139_g52 = 8 in
let loop_g53 =
  fix (fun loop_me acc_arg k ->
    let k = [acc_arg,loop_me], fun [acc_f1,loop_f2] c_arg ->
      let k = [acc_f1,c_arg,loop_f2], fun [acc_f1,c_f2,loop_f3] n_arg ->
        let k = [acc_f1,c_f2,loop_f3,n_arg], fun [acc_f1,c_f2,loop_f3,n_f4] u122_arg ->
          match u122_arg with
          | Tag_1 ->
            let k = [acc_f1], fun [acc_f1] __arg -> reverse_g30 acc_f1 k in
            let u125_t1 = Tag_0 in
            newline_g44 u125_t1 k
          | Tag_0 ->
            let k = [acc_f1,c_f2,loop_f3,n_f4], fun [acc_f1,c_f2,loop_f3,n_f4] u126_arg ->
              match u126_arg with
              | Tag_1 -> loop_f3 acc_f1 k
              | Tag_0 ->
                let k = [acc_f1,c_f2,loop_f3,n_f4], fun [acc_f1,c_f2,loop_f3,n_f4] u129_arg ->
                  match u129_arg with
                  | Tag_1 -> loop_f3 acc_f1 k
                  | Tag_0 ->
                    let k = [acc_f1,c_f2,loop_f3], fun [acc_f1,c_f2,loop_f3] u132_arg ->
                      match u132_arg with
                      | Tag_1 ->
                        match acc_f1 with
                        | Tag_0 -> loop_f3 acc_f1 k
                        | Tag_1(__t1,tail_t2) ->
                          let k = [loop_f3,tail_t2], fun [loop_f1,tail_f2] __arg ->
                            let k = [loop_f1,tail_f2], fun [loop_f1,tail_f2] __arg ->
                              let k = [loop_f1,tail_f2], fun [loop_f1,tail_f2] __arg -> loop_f1 tail_f2 k in
                              let k = [], fun [] u138_arg -> put_char_g12 u138_arg k in
                              chr_g10 u139_g52 k in
                            put_char_g12 u137_g51 k in
                          let k = [], fun [] u135_arg -> put_char_g12 u135_arg k in
                          chr_g10 u136_g50 k
                      | Tag_0 ->
                        let k = [acc_f1,c_f2,loop_f3], fun [acc_f1,c_f2,loop_f3] __arg ->
                          let k = [loop_f3], fun [loop_f1] u140_arg -> loop_f1 u140_arg k in
                          let k = [acc_f1], fun [acc_f1] u141_arg -> u141_arg acc_f1 k in
                          cons_g26 c_f2 k in
                        put_char_g12 c_f2 k in
                    let k = [], fun [] u133_arg -> u133_arg u134_g49 k in
                    =_g7 n_f4 k in
                let k = [], fun [] u130_arg -> u130_arg u131_g48 k in
                >_g16 n_f4 k in
            let k = [], fun [] u127_arg -> u127_arg u128_g47 k in
            <=_g17 n_f4 k in
        let k = [], fun [] u123_arg -> u123_arg u124_g46 k in
        eq_char_g8 c_f2 k in
      ord_g9 c_arg k in
    let u121_t1 = Tag_0 in
    get_char_g13 u121_t1 k) in
let v143_g54 =
  (fun __arg k ->
    let u142_t1 = Tag_0 in
    loop_g53 u142_t1 k) in
let u146_g55 = 2 in
let u151_g56 = 1 in
let u155_g57 = 2 in
let fib_g58 =
  fix (fun fib_me n_arg k ->
    let k = [fib_me,n_arg], fun [fib_f1,n_f2] u144_arg ->
      match u144_arg with
      | Tag_1 -> k n_f2
      | Tag_0 ->
        let k = [fib_f1,n_f2], fun [fib_f1,n_f2] u147_arg ->
          let k = [u147_arg], fun [u147_f1] u152_arg -> u147_f1 u152_arg k in
          let k = [fib_f1], fun [fib_f1] u153_arg -> fib_f1 u153_arg k in
          let k = [], fun [] u154_arg -> u154_arg u155_g57 k in
          -_g2 n_f2 k in
        let k = [], fun [] u148_arg -> +_g1 u148_arg k in
        let k = [fib_f1], fun [fib_f1] u149_arg -> fib_f1 u149_arg k in
        let k = [], fun [] u150_arg -> u150_arg u151_g56 k in
        -_g2 n_f2 k in
    let k = [], fun [] u145_arg -> u145_arg u146_g55 k in
    <_g6 n_arg k) in
let u158_g59 = 2 in
let u163_g60 = 1 in
let v164_g61 = 1 in
let fact_g62 =
  fix (fun fact_me n_arg k ->
    let k = [fact_me,n_arg], fun [fact_f1,n_f2] u156_arg ->
      match u156_arg with
      | Tag_1 ->
        let k = [n_f2], fun [n_f1] u159_arg -> u159_arg n_f1 k in
        let k = [], fun [] u160_arg -> ( * )_g3 u160_arg k in
        let k = [fact_f1], fun [fact_f1] u161_arg -> fact_f1 u161_arg k in
        let k = [], fun [] u162_arg -> u162_arg u163_g60 k in
        -_g2 n_f2 k
      | Tag_0 -> k v164_g61 in
    let k = [], fun [] u157_arg -> u157_arg u158_g59 k in
    >=_g18 n_arg k) in
let u165_g63 = "ERROR: " in
let error_g64 =
  (fun s_arg k ->
    let k = [s_arg], fun [s_f1] __arg ->
      let k = [], fun [] __arg ->
        let u166_t1 = Tag_0 in
        newline_g44 u166_t1 k in
      put_string_g42 s_f1 k in
    put_string_g42 u165_g63 k) in
let u167_g65 = "fib: " in
let u168_g66 = "expected an argument" in
let u169_g67 = "expected exactly one argument" in
let u171_g68 = "expected arg1 to be numeric" in
let u172_g69 = " --> " in
let u174_g70 = "fact: " in
let u175_g71 = "expected an argument" in
let u176_g72 = "expected exactly one argument" in
let u178_g73 = "expected arg1 to be numeric" in
let u179_g74 = " --> " in
let u184_g75 = 'o' in
let v185_g76 = '*' in
let u181_g77 =
  (fun c_arg k ->
    let k = [c_arg], fun [c_f1] u182_arg ->
      match u182_arg with
      | Tag_1 -> k v185_g76
      | Tag_0 -> k c_f1 in
    let k = [], fun [] u183_arg -> u183_arg u184_g75 k in
    eq_char_g8 c_arg k) in
let u187_g78 = 100 in
let u192_g79 = "You wrote: " in
let u194_g80 = ' ' in
let u195_g81 = '{' in
let u196_g82 = '}' in
let u203_g83 = ' ' in
let loop_g84 =
  fix (fun loop_me accWs_arg k ->
    let v215_t1 =
      ([accWs_arg,loop_me], fun[accWs_f1,loop_f2] accCs_arg k ->
        let v214_t1 =
          ([accCs_arg,accWs_f1,loop_f2], fun[accCs_f1,accWs_f2,loop_f3] xs_arg k ->
            match xs_arg with
            | Tag_0 ->
              let k = [], fun [] u198_arg -> reverse_g30 u198_arg k in
              let k = [accWs_f2], fun [accWs_f1] u199_arg -> u199_arg accWs_f1 k in
              let k = [], fun [] u200_arg -> ::_g14 u200_arg k in
              reverse_g30 accCs_f1 k
            | Tag_1(x_t1,xs_t2) ->
              let k = [accCs_f1,accWs_f2,loop_f3,x_t1,xs_t2], fun [accCs_f1,accWs_f2,loop_f3,x_f4,xs_f5] u201_arg ->
                match u201_arg with
                | Tag_1 ->
                  let k = [xs_f5], fun [xs_f1] u204_arg -> u204_arg xs_f1 k in
                  let k = [], fun [] u205_arg ->
                    let u209_t1 = Tag_0 in
                    u205_arg u209_t1 k in
                  let k = [loop_f3], fun [loop_f1] u206_arg -> loop_f1 u206_arg k in
                  let k = [accWs_f2], fun [accWs_f1] u207_arg -> u207_arg accWs_f1 k in
                  let k = [], fun [] u208_arg -> ::_g14 u208_arg k in
                  reverse_g30 accCs_f1 k
                | Tag_0 ->
                  let k = [xs_f5], fun [xs_f1] u210_arg -> u210_arg xs_f1 k in
                  let k = [accCs_f1,x_f4], fun [accCs_f1,x_f2] u211_arg ->
                    let k = [u211_arg], fun [u211_f1] u212_arg -> u211_f1 u212_arg k in
                    let k = [accCs_f1], fun [accCs_f1] u213_arg -> u213_arg accCs_f1 k in
                    ::_g14 x_f2 k in
                  loop_f3 accWs_f2 k in
              let k = [], fun [] u202_arg -> u202_arg u203_g83 k in
              eq_char_g8 x_t1 k) in
        k v214_t1) in
    k v215_t1) in
let u223_g85 = "fib" in
let u227_g86 = "fact" in
let u228_g87 = '>' in
let u229_g88 = ' ' in
let u232_g89 = "LOAD" in
let u233_g90 = "RUN" in
let u235_g91 = "NEVER" in
let k = [], fun [] parse_num_arg ->
  let k = [parse_num_arg], fun [parse_num_f1] eq_char_list_arg ->
    let k = [eq_char_list_arg,parse_num_f1], fun [eq_char_list_f1,parse_num_f2] chars_of_int_arg ->
      let put_int_t1 =
        ([chars_of_int_arg], fun[chars_of_int_f1] i_arg k ->
          let k = [], fun [] u118_arg -> put_chars_g41 u118_arg k in
          chars_of_int_f1 i_arg k) in
      let k = [eq_char_list_f1,parse_num_f2,put_int_t1], fun [eq_char_list_f1,parse_num_f2,put_int_f3] read_line_arg ->
        let runfib_t1 =
          ([parse_num_f2,put_int_f3], fun[parse_num_f1,put_int_f2] args_arg k ->
            let k = [args_arg,parse_num_f1,put_int_f2], fun [args_f1,parse_num_f2,put_int_f3] __arg ->
              match args_f1 with
              | Tag_0 -> error_g64 u168_g66 k
              | Tag_1(arg1_t1,more_t2) ->
                match more_t2 with
                | Tag_1(__t3,__t4) -> error_g64 u169_g67 k
                | Tag_0 ->
                  let k = [put_int_f3], fun [put_int_f1] u170_arg ->
                    match u170_arg with
                    | Tag_1 -> error_g64 u171_g68 k
                    | Tag_0(n_t1) ->
                      let k = [n_t1,put_int_f1], fun [n_f1,put_int_f2] res_arg ->
                        let k = [put_int_f2,res_arg], fun [put_int_f1,res_f2] __arg ->
                          let k = [put_int_f1,res_f2], fun [put_int_f1,res_f2] __arg ->
                            let k = [], fun [] __arg ->
                              let u173_t1 = Tag_0 in
                              newline_g44 u173_t1 k in
                            put_int_f1 res_f2 k in
                          put_string_g42 u172_g69 k in
                        put_int_f2 n_f1 k in
                      fib_g58 n_t1 k in
                  parse_num_f2 arg1_t1 k in
            put_string_g42 u167_g65 k) in
        let runfact_t2 =
          ([parse_num_f2,put_int_f3], fun[parse_num_f1,put_int_f2] args_arg k ->
            let k = [args_arg,parse_num_f1,put_int_f2], fun [args_f1,parse_num_f2,put_int_f3] __arg ->
              match args_f1 with
              | Tag_0 -> error_g64 u175_g71 k
              | Tag_1(arg1_t1,more_t2) ->
                match more_t2 with
                | Tag_1(__t3,__t4) -> error_g64 u176_g72 k
                | Tag_0 ->
                  let k = [put_int_f3], fun [put_int_f1] u177_arg ->
                    match u177_arg with
                    | Tag_1 -> error_g64 u178_g73 k
                    | Tag_0(n_t1) ->
                      let k = [n_t1,put_int_f1], fun [n_f1,put_int_f2] res_arg ->
                        let k = [put_int_f2,res_arg], fun [put_int_f1,res_f2] __arg ->
                          let k = [put_int_f1,res_f2], fun [put_int_f1,res_f2] __arg ->
                            let k = [], fun [] __arg ->
                              let u180_t1 = Tag_0 in
                              newline_g44 u180_t1 k in
                            put_int_f1 res_f2 k in
                          put_string_g42 u179_g74 k in
                        put_int_f2 n_f1 k in
                      fact_g62 n_t1 k in
                  parse_num_f2 arg1_t1 k in
            put_string_g42 u174_g70 k) in
        let fallback_t3 =
          ([put_int_f3], fun[put_int_f1] line_arg k ->
            let k = [line_arg,put_int_f1], fun [line_f1,put_int_f2] star_the_ohs_arg ->
              let k = [line_f1,put_int_f2,star_the_ohs_arg], fun [line_f1,put_int_f2,star_the_ohs_f3] n_arg ->
                let k = [n_arg,put_int_f2], fun [n_f1,put_int_f2] __arg ->
                  let k = [n_f1,put_int_f2], fun [n_f1,put_int_f2] __arg ->
                    let k = [n_f1,put_int_f2], fun [n_f1,put_int_f2] __arg ->
                      let k = [], fun [] __arg ->
                        let k = [], fun [] __arg ->
                          let u197_t1 = Tag_0 in
                          newline_g44 u197_t1 k in
                        put_char_g12 u196_g82 k in
                      put_int_f2 n_f1 k in
                    put_char_g12 u195_g81 k in
                  put_char_g12 u194_g80 k in
                let k = [], fun [] u189_arg -> put_chars_g41 u189_arg k in
                let k = [line_f1,star_the_ohs_f3], fun [line_f1,star_the_ohs_f2] u190_arg ->
                  let k = [u190_arg], fun [u190_f1] u193_arg -> u190_f1 u193_arg k in
                  star_the_ohs_f2 line_f1 k in
                let k = [], fun [] u191_arg -> append_g28 u191_arg k in
                explode_g11 u192_g79 k in
              let k = [line_f1], fun [line_f1] u186_arg ->
                let k = [u186_arg], fun [u186_f1] u188_arg -> u186_f1 u188_arg k in
                length_g34 line_f1 k in
              +_g1 u187_g78 k in
            map_g31 u181_g77 k) in
        let k = [eq_char_list_f1,fallback_t3,read_line_arg,runfact_t2,runfib_t1], fun [eq_char_list_f1,fallback_f2,read_line_f3,runfact_f4,runfib_f5] split_words_arg ->
          let execute_t1 =
            ([eq_char_list_f1,fallback_f2,runfact_f4,runfib_f5,split_words_arg], fun[eq_char_list_f1,fallback_f2,runfact_f3,runfib_f4,split_words_f5] line_arg k ->
              let k = [eq_char_list_f1,fallback_f2,line_arg,runfact_f3,runfib_f4], fun [eq_char_list_f1,fallback_f2,line_f3,runfact_f4,runfib_f5] words_arg ->
                match words_arg with
                | Tag_0 ->
                  let v219_t1 = Tag_0 in
                  k v219_t1
                | Tag_1(command_t1,args_t2) ->
                  let k = [args_t2,command_t1,eq_char_list_f1,fallback_f2,line_f3,runfact_f4,runfib_f5], fun [args_f1,command_f2,eq_char_list_f3,fallback_f4,line_f5,runfact_f6,runfib_f7] u220_arg ->
                    match u220_arg with
                    | Tag_1 -> runfib_f7 args_f1 k
                    | Tag_0 ->
                      let k = [args_f1,fallback_f4,line_f5,runfact_f6], fun [args_f1,fallback_f2,line_f3,runfact_f4] u224_arg ->
                        match u224_arg with
                        | Tag_1 -> runfact_f4 args_f1 k
                        | Tag_0 -> fallback_f2 line_f3 k in
                      let k = [], fun [] u225_arg ->
                        let k = [u225_arg], fun [u225_f1] u226_arg -> u225_f1 u226_arg k in
                        explode_g11 u227_g86 k in
                      eq_char_list_f3 command_f2 k in
                  let k = [], fun [] u221_arg ->
                    let k = [u221_arg], fun [u221_f1] u222_arg -> u221_f1 u222_arg k in
                    explode_g11 u223_g85 k in
                  eq_char_list_f1 command_t1 k in
              split_words_f5 line_arg k) in
          let mainloop_t2 =
            [execute_t1,read_line_f3], fix (fun[execute_f1,read_line_f2] mainloop_me __arg k ->
              let k = [execute_f1,mainloop_me,read_line_f2], fun [execute_f1,mainloop_f2,read_line_f3] __arg ->
                let k = [execute_f1,mainloop_f2,read_line_f3], fun [execute_f1,mainloop_f2,read_line_f3] __arg ->
                  let k = [execute_f1,mainloop_f2], fun [execute_f1,mainloop_f2] xs_arg ->
                    let k = [mainloop_f2], fun [mainloop_f1] __arg ->
                      let u231_t1 = Tag_0 in
                      mainloop_f1 u231_t1 k in
                    execute_f1 xs_arg k in
                  let u230_t1 = Tag_0 in
                  read_line_f3 u230_t1 k in
                put_char_g12 u229_g88 k in
              put_char_g12 u228_g87 k) in
          let k = [mainloop_t2], fun [mainloop_f1] __arg ->
            let main_t1 =
              ([mainloop_f1], fun[mainloop_f1] __arg k ->
                let k = [mainloop_f1], fun [mainloop_f1] __arg ->
                  let k = [], fun [] __arg -> put_string_newline_g45 u235_g91 k in
                  let u234_t1 = Tag_0 in
                  mainloop_f1 u234_t1 k in
                put_string_newline_g45 u233_g90 k) in
            let u236_t2 = Tag_0 in
            main_t1 u236_t2 k in
          put_string_newline_g45 u232_g89 k in
        let k = [], fun [] u216_arg ->
          let u218_t1 = Tag_0 in
          u216_arg u218_t1 k in
        let u217_t4 = Tag_0 in
        loop_g84 u217_t4 k in
      k v143_g54 in
    let k = [], fun [] ord0_arg ->
      let char_of_digit_t1 =
        ([ord0_arg], fun[ord0_f1] c_arg k ->
          let k = [], fun [] u91_arg -> chr_g10 u91_arg k in
          let k = [c_arg], fun [c_f1] u92_arg -> u92_arg c_f1 k in
          +_g1 ord0_f1 k) in
      let loop_t2 =
        [char_of_digit_t1], fix (fun[char_of_digit_f1] loop_me acc_arg k ->
          let v106_t1 =
            ([acc_arg,char_of_digit_f1,loop_me], fun[acc_f1,char_of_digit_f2,loop_f3] i_arg k ->
              let k = [acc_f1,char_of_digit_f2,i_arg,loop_f3], fun [acc_f1,char_of_digit_f2,i_f3,loop_f4] u93_arg ->
                match u93_arg with
                | Tag_1 -> k acc_f1
                | Tag_0 ->
                  let k = [i_f3], fun [i_f1] u96_arg ->
                    let k = [u96_arg], fun [u96_f1] u103_arg -> u96_f1 u103_arg k in
                    let k = [], fun [] u104_arg -> u104_arg u105_g38 k in
                    /_g4 i_f1 k in
                  let k = [loop_f4], fun [loop_f1] u97_arg -> loop_f1 u97_arg k in
                  let k = [acc_f1], fun [acc_f1] u98_arg -> u98_arg acc_f1 k in
                  let k = [], fun [] u99_arg -> cons_g26 u99_arg k in
                  let k = [char_of_digit_f2], fun [char_of_digit_f1] u100_arg -> char_of_digit_f1 u100_arg k in
                  let k = [], fun [] u101_arg -> u101_arg u102_g37 k in
                  %_g5 i_f3 k in
              let k = [], fun [] u94_arg -> u94_arg u95_g36 k in
              =_g7 i_arg k) in
          k v106_t1) in
      let v115_t3 =
        ([loop_t2], fun[loop_f1] i_arg k ->
          let k = [i_arg,loop_f1], fun [i_f1,loop_f2] u107_arg ->
            match u107_arg with
            | Tag_1 ->
              let k = [], fun [] u110_arg ->
                let u112_t1 = Tag_0 in
                u110_arg u112_t1 k in
              cons_g26 u111_g40 k
            | Tag_0 ->
              let k = [i_f1], fun [i_f1] u113_arg -> u113_arg i_f1 k in
              let u114_t1 = Tag_0 in
              loop_f2 u114_t1 k in
          let k = [], fun [] u108_arg -> u108_arg u109_g39 k in
          =_g7 i_arg k) in
      k v115_t3 in
    ord_g9 u90_g35 k in
  eq_list_g27 eq_char_g8 k in
loop_g24 u57_g25 k
----------
