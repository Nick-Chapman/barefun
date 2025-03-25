(*stage3*)
let k () = ()
let +_g1 = fun x_arg k ->
  let v2_t1 = [x_arg], fun [x_f1] y_arg k ->
    let v1_t1 = PRIM_AddInt(x_f1,y_arg) in
    k v1_t1 in
  k v2_t1 in
let -_g2 = fun x_arg k ->
  let v4_t1 = [x_arg], fun [x_f1] y_arg k ->
    let v3_t1 = PRIM_SubInt(x_f1,y_arg) in
    k v3_t1 in
  k v4_t1 in
let ( * )_g3 = fun x_arg k ->
  let v6_t1 = [x_arg], fun [x_f1] y_arg k ->
    let v5_t1 = PRIM_MulInt(x_f1,y_arg) in
    k v5_t1 in
  k v6_t1 in
let /_g4 = fun x_arg k ->
  let v8_t1 = [x_arg], fun [x_f1] y_arg k ->
    let v7_t1 = PRIM_DivInt(x_f1,y_arg) in
    k v7_t1 in
  k v8_t1 in
let %_g5 = fun x_arg k ->
  let v10_t1 = [x_arg], fun [x_f1] y_arg k ->
    let v9_t1 = PRIM_ModInt(x_f1,y_arg) in
    k v9_t1 in
  k v10_t1 in
let <_g6 = fun x_arg k ->
  let v12_t1 = [x_arg], fun [x_f1] y_arg k ->
    let v11_t1 = PRIM_LessInt(x_f1,y_arg) in
    k v11_t1 in
  k v12_t1 in
let =_g7 = fun x_arg k ->
  let v14_t1 = [x_arg], fun [x_f1] y_arg k ->
    let v13_t1 = PRIM_EqInt(x_f1,y_arg) in
    k v13_t1 in
  k v14_t1 in
let eq_char_g8 = fun x_arg k ->
  let v16_t1 = [x_arg], fun [x_f1] y_arg k ->
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
  let v23_t1 = [x_arg], fun [x_f1] y_arg k ->
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
  let v27_t1 = [a_arg], fun [a_f1] b_arg k ->
    let k = [a_f1], fun [a_f1] u26_7'16_arg -> u26_7'16_arg a_f1 k in
    <_g6 b_arg k in
  k v27_t1 in
let <=_g17 = fun a_arg k ->
  let v30_t1 = [a_arg], fun [a_f1] b_arg k ->
    let k = [], fun [] u28_8'24_arg -> not_g15 u28_8'24_arg k in
    let k = [a_f1], fun [a_f1] u29_8'22_arg -> u29_8'22_arg a_f1 k in
    <_g6 b_arg k in
  k v30_t1 in
let >=_g18 = fun a_arg k ->
  let v33_t1 = [a_arg], fun [a_f1] b_arg k ->
    let k = [], fun [] u31_9'24_arg -> not_g15 u31_9'24_arg k in
    let k = [b_arg], fun [b_f1] u32_9'22_arg -> u32_9'22_arg b_f1 k in
    <_g6 a_f1 k in
  k v33_t1 in
let u37_14'22_g19 = '0' in
let u40_16'10_g20 = 0 in
let u43_16'25_g21 = 9 in
let parse_digit_g22 = fun c_arg k ->
  let k = [], fun [] n_arg ->
    let k = [n_arg], fun [n_f1] u38_16'10_arg ->
      match u38_16'10_arg with
      | true1 ->
        let k = [n_f1], fun [n_f1] u41_16'25_arg ->
          match u41_16'25_arg with
          | true1 ->
            let v44_t1 = Some0[n_f1] in
            k v44_t1
          | false0 ->
            let v45_t1 = None1 in
            k v45_t1 in
        let k = [], fun [] u42_16'22_arg -> u42_16'22_arg u43_16'25_g21 k in
        <=_g17 n_f1 k
      | false0 ->
        let v46_t1 = None1 in
        k v46_t1 in
    let k = [], fun [] u39_16'7_arg -> u39_16'7_arg u40_16'10_g20 k in
    >=_g18 n_arg k in
  let k = [], fun [] u34_14'16_arg ->
    let k = [u34_14'16_arg], fun [u34_14'16_f1] u36_14'22_arg -> u34_14'16_f1 u36_14'22_arg k in
    ord_g9 u37_14'22_g19 k in
  let k = [], fun [] u35_14'14_arg -> -_g2 u35_14'14_arg k in
  ord_g9 c_arg k in
let u55_25'26_g23 = 10 in
let loop_g24 = fun loop_me acc_arg k ->
  let v56_t1 = [acc_arg,loop_me], fun [acc_f1,loop_f2] xs_arg k ->
    match xs_arg with
    | Nil0 ->
      let v47_t1 = Some0[acc_f1] in
      k v47_t1
    | Cons1(x_t1,xs_t2) ->
      let k = [acc_f1,loop_f2,xs_t2], fun [acc_f1,loop_f2,xs_f3] u48_23'26_arg ->
        match u48_23'26_arg with
        | None1 ->
          let v49_t1 = None1 in
          k v49_t1
        | Some0(d_t1) ->
          let k = [xs_f3], fun [xs_f1] u50_25'25_arg -> u50_25'25_arg xs_f1 k in
          let k = [loop_f2], fun [loop_f1] u51_25'37_arg -> loop_f1 u51_25'37_arg k in
          let k = [d_t1], fun [d_f1] u52_25'35_arg -> u52_25'35_arg d_f1 k in
          let k = [], fun [] u53_25'31_arg -> +_g1 u53_25'31_arg k in
          let k = [acc_f1], fun [acc_f1] u54_25'29_arg -> u54_25'29_arg acc_f1 k in
          ( * )_g3 u55_25'26_g23 k in
      parse_digit_g22 x_t1 k in
  k v56_t1 in
let u58_27'7_g25 = 0 in
let parse_num_g26 = fun s_arg k ->
  let k = [s_arg], fun [s_f1] u57_27'7_arg -> u57_27'7_arg s_f1 k in
  loop_g24 u58_27'7_g25 k in
let cons_g27 = fun x_arg k ->
  let v60_t1 = [x_arg], fun [x_f1] xs_arg k ->
    let k = [xs_arg], fun [xs_f1] u59_29'18_arg -> u59_29'18_arg xs_f1 k in
    ::_g14 x_f1 k in
  k v60_t1 in
let eq_list_g28 = fun eq_list_me eq_arg k ->
  let v70_t1 = [eq_arg,eq_list_me], fun [eq_f1,eq_list_f2] xs_arg k ->
    let v69_t1 = [eq_f1,eq_list_f2,xs_arg], fun [eq_f1,eq_list_f2,xs_f3] ys_arg k ->
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
          let k = [eq_f1,eq_list_f2,xs_t2,ys_t4], fun [eq_f1,eq_list_f2,xs_f3,ys_f4] u64_38'16_arg ->
            match u64_38'16_arg with
            | true1 ->
              let k = [ys_f4], fun [ys_f1] u66_38'34_arg -> u66_38'34_arg ys_f1 k in
              let k = [xs_f3], fun [xs_f1] u67_38'31_arg -> u67_38'31_arg xs_f1 k in
              eq_list_f2 eq_f1 k
            | false0 ->
              let v68_t1 = false0 in
              k v68_t1 in
          let k = [y_t3], fun [y_f1] u65_38'14_arg -> u65_38'14_arg y_f1 k in
          eq_f1 x_t1 k in
    k v69_t1 in
  k v70_t1 in
let eq_char_list_g29 = fun a_arg k ->
  let v73_t1 = [a_arg], fun [a_f1] b_arg k ->
    let k = [b_arg], fun [b_f1] u71_40'39_arg -> u71_40'39_arg b_f1 k in
    let k = [a_f1], fun [a_f1] u72_40'31_arg -> u72_40'31_arg a_f1 k in
    eq_list_g28 eq_char_g8 k in
  k v73_t1 in
let append_g30 = fun append_me xs_arg k ->
  let v77_t1 = [append_me,xs_arg], fun [append_f1,xs_f2] ys_arg k ->
    match xs_f2 with
    | Nil0 -> k ys_arg
    | Cons1(x_t1,xs_t2) ->
      let k = [append_f1,xs_t2,ys_arg], fun [append_f1,xs_f2,ys_f3] u74_45'18_arg ->
        let k = [u74_45'18_arg], fun [u74_45'18_f1] u75_45'31_arg -> u74_45'18_f1 u75_45'31_arg k in
        let k = [ys_f3], fun [ys_f1] u76_45'28_arg -> u76_45'28_arg ys_f1 k in
        append_f1 xs_f2 k in
      cons_g27 x_t1 k in
  k v77_t1 in
let loop_g31 = fun loop_me acc_arg k ->
  let v81_t1 = [acc_arg,loop_me], fun [acc_f1,loop_f2] xs_arg k ->
    match xs_arg with
    | Nil0 -> k acc_f1
    | Cons1(x_t1,xs_t2) ->
      let k = [xs_t2], fun [xs_f1] u78_51'20_arg -> u78_51'20_arg xs_f1 k in
      let k = [loop_f2], fun [loop_f1] u79_51'28_arg -> loop_f1 u79_51'28_arg k in
      let k = [acc_f1], fun [acc_f1] u80_51'26_arg -> u80_51'26_arg acc_f1 k in
      cons_g27 x_t1 k in
  k v81_t1 in
let reverse_g32 = fun xs_arg k ->
  let k = [xs_arg], fun [xs_f1] u82_53'7_arg -> u82_53'7_arg xs_f1 k in
  let u83_53'7_t1 = Nil0 in
  loop_g31 u83_53'7_t1 k in
let map_g33 = fun map_me f_arg k ->
  let v89_t1 = [f_arg,map_me], fun [f_f1,map_f2] xs_arg k ->
    match xs_arg with
    | Nil0 ->
      let v84_t1 = Nil0 in
      k v84_t1
    | Cons1(x_t1,xs_t2) ->
      let k = [f_f1,map_f2,xs_t2], fun [f_f1,map_f2,xs_f3] u85_58'17_arg ->
        let k = [u85_58'17_arg], fun [u85_58'17_f1] u87_58'26_arg -> u85_58'17_f1 u87_58'26_arg k in
        let k = [xs_f3], fun [xs_f1] u88_58'24_arg -> u88_58'24_arg xs_f1 k in
        map_f2 f_f1 k in
      let k = [], fun [] u86_58'15_arg -> ::_g14 u86_58'15_arg k in
      f_f1 x_t1 k in
  k v89_t1 in
let v90_g34 = 0 in
let u92_63'17_g35 = 1 in
let length_g36 = fun length_me xs_arg k ->
  match xs_arg with
  | Nil0 -> k v90_g34
  | Cons1(__t1,xs_t2) ->
    let k = [length_me,xs_t2], fun [length_f1,xs_f2] u91_63'17_arg ->
      let k = [u91_63'17_arg], fun [u91_63'17_f1] u93_63'27_arg -> u91_63'17_f1 u93_63'27_arg k in
      length_f1 xs_f2 k in
    +_g1 u92_63'17_g35 k in
let u94_66'17_g37 = '0' in
let u99_69'11_g38 = 0 in
let u106_70'35_g39 = 10 in
let u109_70'48_g40 = 10 in
let u113_72'9_g41 = 0 in
let u115_72'21_g42 = '0' in
let chars_of_int_g43 = fun i_arg k ->
  let k = [i_arg], fun [i_f1] ord0_arg ->
    let char_of_digit_t1 = [ord0_arg], fun [ord0_f1] c_arg k ->
      let k = [], fun [] u95_67'36_arg -> chr_g10 u95_67'36_arg k in
      let k = [c_arg], fun [c_f1] u96_67'34_arg -> u96_67'34_arg c_f1 k in
      +_g1 ord0_f1 k in
    let loop_t2 = [char_of_digit_t1], fun [char_of_digit_f1] loop_me acc_arg k ->
      let v110_t1 = [acc_arg,char_of_digit_f1,loop_me], fun [acc_f1,char_of_digit_f2,loop_f3] i_arg k ->
        let k = [acc_f1,char_of_digit_f2,i_arg,loop_f3], fun [acc_f1,char_of_digit_f2,i_f3,loop_f4] u97_69'11_arg ->
          match u97_69'11_arg with
          | true1 -> k acc_f1
          | false0 ->
            let k = [i_f3], fun [i_f1] u100_70'11_arg ->
              let k = [u100_70'11_arg], fun [u100_70'11_f1] u107_70'48_arg -> u100_70'11_f1 u107_70'48_arg k in
              let k = [], fun [] u108_70'47_arg -> u108_70'47_arg u109_70'48_g40 k in
              /_g4 i_f1 k in
            let k = [loop_f4], fun [loop_f1] u101_70'40_arg -> loop_f1 u101_70'40_arg k in
            let k = [acc_f1], fun [acc_f1] u102_70'17_arg -> u102_70'17_arg acc_f1 k in
            let k = [], fun [] u103_70'32_arg -> cons_g27 u103_70'32_arg k in
            let k = [char_of_digit_f2], fun [char_of_digit_f1] u104_70'35_arg -> char_of_digit_f1 u104_70'35_arg k in
            let k = [], fun [] u105_70'34_arg -> u105_70'34_arg u106_70'35_g39 k in
            %_g5 i_f3 k in
        let k = [], fun [] u98_69'9_arg -> u98_69'9_arg u99_69'11_g38 k in
        =_g7 i_arg k in
      k v110_t1 in
    let k = [i_f1,loop_t2], fun [i_f1,loop_f2] u111_72'9_arg ->
      match u111_72'9_arg with
      | true1 ->
        let k = [], fun [] u114_72'21_arg ->
          let u116_72'25_t1 = Nil0 in
          u114_72'21_arg u116_72'25_t1 k in
        cons_g27 u115_72'21_g42 k
      | false0 ->
        let k = [i_f1], fun [i_f1] u117_72'38_arg -> u117_72'38_arg i_f1 k in
        let u118_72'38_t1 = Nil0 in
        loop_f2 u118_72'38_t1 k in
    let k = [], fun [] u112_72'7_arg -> u112_72'7_arg u113_72'9_g41 k in
    =_g7 i_f1 k in
  ord_g9 u94_66'17_g37 k in
let put_chars_g44 = fun put_chars_me xs_arg k ->
  match xs_arg with
  | Nil0 ->
    let v119_t1 = Unit0 in
    k v119_t1
  | Cons1(x_t1,xs_t2) ->
    let k = [put_chars_me,xs_t2], fun [put_chars_f1,xs_f2] __arg -> put_chars_f1 xs_f2 k in
    put_char_g12 x_t1 k in
let put_string_g45 = fun s_arg k ->
  let k = [], fun [] u120_79'38_arg -> put_chars_g44 u120_79'38_arg k in
  explode_g11 s_arg k in
let put_int_g46 = fun i_arg k ->
  let k = [], fun [] u121_81'40_arg -> put_chars_g44 u121_81'40_arg k in
  chars_of_int_g43 i_arg k in
let u122_83'26_g47 = '\n' in
let newline_g48 = fun __arg k -> put_char_g12 u122_83'26_g47 k in
let put_string_newline_g49 = fun s_arg k ->
  let k = [], fun [] __arg ->
    let u123_87'10_t1 = Unit0 in
    newline_g48 u123_87'10_t1 k in
  put_string_g45 s_arg k in
let u127_93'17_g50 = '\n' in
let u131_94'14_g51 = 31 in
let u134_95'15_g52 = 127 in
let u137_96'17_g53 = 127 in
let u139_101'29_g54 = 8 in
let u140_102'24_g55 = ' ' in
let u142_103'29_g56 = 8 in
let loop_g57 = fun loop_me acc_arg k ->
  let k = [acc_arg,loop_me], fun [acc_f1,loop_f2] c_arg ->
    let k = [acc_f1,c_arg,loop_f2], fun [acc_f1,c_f2,loop_f3] n_arg ->
      let k = [acc_f1,c_f2,loop_f3,n_arg], fun [acc_f1,c_f2,loop_f3,n_f4] u125_93'17_arg ->
        match u125_93'17_arg with
        | true1 ->
          let k = [acc_f1], fun [acc_f1] __arg -> reverse_g32 acc_f1 k in
          let u128_93'35_t1 = Unit0 in
          newline_g48 u128_93'35_t1 k
        | false0 ->
          let k = [acc_f1,c_f2,loop_f3,n_f4], fun [acc_f1,c_f2,loop_f3,n_f4] u129_94'14_arg ->
            match u129_94'14_arg with
            | true1 -> loop_f3 acc_f1 k
            | false0 ->
              let k = [acc_f1,c_f2,loop_f3,n_f4], fun [acc_f1,c_f2,loop_f3,n_f4] u132_95'15_arg ->
                match u132_95'15_arg with
                | true1 -> loop_f3 acc_f1 k
                | false0 ->
                  let k = [acc_f1,c_f2,loop_f3], fun [acc_f1,c_f2,loop_f3] u135_96'17_arg ->
                    match u135_96'17_arg with
                    | true1 ->
                      match acc_f1 with
                      | Nil0 -> loop_f3 acc_f1 k
                      | Cons1(__t1,tail_t2) ->
                        let k = [loop_f3,tail_t2], fun [loop_f1,tail_f2] __arg ->
                          let k = [loop_f1,tail_f2], fun [loop_f1,tail_f2] __arg ->
                            let k = [loop_f1,tail_f2], fun [loop_f1,tail_f2] __arg -> loop_f1 tail_f2 k in
                            let k = [], fun [] u141_103'29_arg -> put_char_g12 u141_103'29_arg k in
                            chr_g10 u142_103'29_g56 k in
                          put_char_g12 u140_102'24_g55 k in
                        let k = [], fun [] u138_101'29_arg -> put_char_g12 u138_101'29_arg k in
                        chr_g10 u139_101'29_g54 k
                    | false0 ->
                      let k = [acc_f1,c_f2,loop_f3], fun [acc_f1,c_f2,loop_f3] __arg ->
                        let k = [loop_f3], fun [loop_f1] u143_106'38_arg -> loop_f1 u143_106'38_arg k in
                        let k = [acc_f1], fun [acc_f1] u144_106'36_arg -> u144_106'36_arg acc_f1 k in
                        cons_g27 c_f2 k in
                      put_char_g12 c_f2 k in
                  let k = [], fun [] u136_96'15_arg -> u136_96'15_arg u137_96'17_g53 k in
                  =_g7 n_f4 k in
              let k = [], fun [] u133_95'13_arg -> u133_95'13_arg u134_95'15_g52 k in
              >_g16 n_f4 k in
          let k = [], fun [] u130_94'11_arg -> u130_94'11_arg u131_94'14_g51 k in
          <=_g17 n_f4 k in
      let k = [], fun [] u126_93'15_arg -> u126_93'15_arg u127_93'17_g50 k in
      eq_char_g8 c_f2 k in
    ord_g9 c_arg k in
  let u124_91'21_t1 = Unit0 in
  get_char_g13 u124_91'21_t1 k in
let read_line_g58 = fun __arg k ->
  let u145_108'7_t1 = Nil0 in
  loop_g57 u145_108'7_t1 k in
let u148_112'9_g59 = 2 in
let u153_112'30_g60 = 1 in
let u157_112'42_g61 = 2 in
let fib_g62 = fun fib_me n_arg k ->
  let k = [fib_me,n_arg], fun [fib_f1,n_f2] u146_112'9_arg ->
    match u146_112'9_arg with
    | true1 -> k n_f2
    | false0 ->
      let k = [fib_f1,n_f2], fun [fib_f1,n_f2] u149_112'33_arg ->
        let k = [u149_112'33_arg], fun [u149_112'33_f1] u154_112'39_arg -> u149_112'33_f1 u154_112'39_arg k in
        let k = [fib_f1], fun [fib_f1] u155_112'42_arg -> fib_f1 u155_112'42_arg k in
        let k = [], fun [] u156_112'41_arg -> u156_112'41_arg u157_112'42_g61 k in
        -_g2 n_f2 k in
      let k = [], fun [] u150_112'27_arg -> +_g1 u150_112'27_arg k in
      let k = [fib_f1], fun [fib_f1] u151_112'30_arg -> fib_f1 u151_112'30_arg k in
      let k = [], fun [] u152_112'29_arg -> u152_112'29_arg u153_112'30_g60 k in
      -_g2 n_f2 k in
  let k = [], fun [] u147_112'7_arg -> u147_112'7_arg u148_112'9_g59 k in
  <_g6 n_arg k in
let u160_116'10_g63 = 2 in
let u165_116'25_g64 = 1 in
let v166_g65 = 1 in
let fact_g66 = fun fact_me n_arg k ->
  let k = [fact_me,n_arg], fun [fact_f1,n_f2] u158_116'10_arg ->
    match u158_116'10_arg with
    | true1 ->
      let k = [n_f2], fun [n_f1] u161_116'28_arg -> u161_116'28_arg n_f1 k in
      let k = [], fun [] u162_116'22_arg -> ( * )_g3 u162_116'22_arg k in
      let k = [fact_f1], fun [fact_f1] u163_116'25_arg -> fact_f1 u163_116'25_arg k in
      let k = [], fun [] u164_116'24_arg -> u164_116'24_arg u165_116'25_g64 k in
      -_g2 n_f2 k
    | false0 -> k v166_g65 in
  let k = [], fun [] u159_116'7_arg -> u159_116'7_arg u160_116'10_g63 k in
  >=_g18 n_arg k in
let u167_118'25_g67 = "ERROR: " in
let error_g68 = fun s_arg k ->
  let k = [s_arg], fun [s_f1] __arg ->
    let k = [], fun [] __arg ->
      let u168_118'58_t1 = Unit0 in
      newline_g48 u168_118'58_t1 k in
    put_string_g45 s_f1 k in
  put_string_g45 u167_118'25_g67 k in
let u169_121'13_g69 = "fib: " in
let u170_123'16_g70 = "expected an argument" in
let u171_126'21_g71 = "expected exactly one argument" in
let u173_129'24_g72 = "expected arg1 to be numeric" in
let u174_133'22_g73 = " --> " in
let runfib_g74 = fun args_arg k ->
  let k = [args_arg], fun [args_f1] __arg ->
    match args_f1 with
    | Nil0 -> error_g68 u170_123'16_g70 k
    | Cons1(arg1_t1,more_t2) ->
      match more_t2 with
      | Cons1(__t3,__t4) -> error_g68 u171_126'21_g71 k
      | Nil0 ->
        let k = [], fun [] u172_128'24_arg ->
          match u172_128'24_arg with
          | None1 -> error_g68 u173_129'24_g72 k
          | Some0(n_t1) ->
            let k = [n_t1], fun [n_f1] res_arg ->
              let k = [res_arg], fun [res_f1] __arg ->
                let k = [res_f1], fun [res_f1] __arg ->
                  let k = [], fun [] __arg ->
                    let u175_135'19_t1 = Unit0 in
                    newline_g48 u175_135'19_t1 k in
                  put_int_g46 res_f1 k in
                put_string_g45 u174_133'22_g73 k in
              put_int_g46 n_f1 k in
            fib_g62 n_t1 k in
        parse_num_g26 arg1_t1 k in
  put_string_g45 u169_121'13_g69 k in
let u176_138'13_g75 = "fact: " in
let u177_140'16_g76 = "expected an argument" in
let u178_143'21_g77 = "expected exactly one argument" in
let u180_146'24_g78 = "expected arg1 to be numeric" in
let u181_150'22_g79 = " --> " in
let runfact_g80 = fun args_arg k ->
  let k = [args_arg], fun [args_f1] __arg ->
    match args_f1 with
    | Nil0 -> error_g68 u177_140'16_g76 k
    | Cons1(arg1_t1,more_t2) ->
      match more_t2 with
      | Cons1(__t3,__t4) -> error_g68 u178_143'21_g77 k
      | Nil0 ->
        let k = [], fun [] u179_145'24_arg ->
          match u179_145'24_arg with
          | None1 -> error_g68 u180_146'24_g78 k
          | Some0(n_t1) ->
            let k = [n_t1], fun [n_f1] res_arg ->
              let k = [res_arg], fun [res_f1] __arg ->
                let k = [res_f1], fun [res_f1] __arg ->
                  let k = [], fun [] __arg ->
                    let u182_152'19_t1 = Unit0 in
                    newline_g48 u182_152'19_t1 k in
                  put_int_g46 res_f1 k in
                put_string_g45 u181_150'22_g79 k in
              put_int_g46 n_f1 k in
            fact_g66 n_t1 k in
        parse_num_g26 arg1_t1 k in
  put_string_g45 u176_138'13_g75 k in
let u186_155'48_g81 = 'o' in
let v187_g82 = '*' in
let u183_g83 = fun c_arg k ->
  let k = [c_arg], fun [c_f1] u184_155'48_arg ->
    match u184_155'48_arg with
    | true1 -> k v187_g82
    | false0 -> k c_f1 in
  let k = [], fun [] u185_155'46_arg -> u185_155'46_arg u186_155'48_g81 k in
  eq_char_g8 c_arg k in
let u189_156'10_g84 = 100 in
let u194_157'29_g85 = "You wrote: " in
let u196_158'11_g86 = ' ' in
let u197_159'11_g87 = '{' in
let u198_161'11_g88 = '}' in
let fallback_g89 = fun line_arg k ->
  let k = [line_arg], fun [line_f1] star_the_ohs_arg ->
    let k = [line_f1,star_the_ohs_arg], fun [line_f1,star_the_ohs_f2] n_arg ->
      let k = [n_arg], fun [n_f1] __arg ->
        let k = [n_f1], fun [n_f1] __arg ->
          let k = [n_f1], fun [n_f1] __arg ->
            let k = [], fun [] __arg ->
              let k = [], fun [] __arg ->
                let u199_162'10_t1 = Unit0 in
                newline_g48 u199_162'10_t1 k in
              put_char_g12 u198_161'11_g88 k in
            put_int_g46 n_f1 k in
          put_char_g12 u197_159'11_g87 k in
        put_char_g12 u196_158'11_g86 k in
      let k = [], fun [] u191_157'44_arg -> put_chars_g44 u191_157'44_arg k in
      let k = [line_f1,star_the_ohs_f2], fun [line_f1,star_the_ohs_f2] u192_157'20_arg ->
        let k = [u192_157'20_arg], fun [u192_157'20_f1] u195_157'58_arg -> u192_157'20_f1 u195_157'58_arg k in
        star_the_ohs_f2 line_f1 k in
      let k = [], fun [] u193_157'29_arg -> append_g30 u193_157'29_arg k in
      explode_g11 u194_157'29_g85 k in
    let k = [line_f1], fun [line_f1] u188_156'14_arg ->
      let k = [u188_156'14_arg], fun [u188_156'14_f1] u190_156'23_arg -> u188_156'14_f1 u190_156'23_arg k in
      length_g36 line_f1 k in
    +_g1 u189_156'10_g84 k in
  map_g33 u183_g83 k in
let u205_170'20_g90 = ' ' in
let loop_g91 = fun loop_me accWs_arg k ->
  let v217_t1 = [accWs_arg,loop_me], fun [accWs_f1,loop_f2] accCs_arg k ->
    let v216_t1 = [accCs_arg,accWs_f1,loop_f2], fun [accCs_f1,accWs_f2,loop_f3] xs_arg k ->
      match xs_arg with
      | Nil0 ->
        let k = [], fun [] u200_167'38_arg -> reverse_g32 u200_167'38_arg k in
        let k = [accWs_f2], fun [accWs_f1] u201_167'35_arg -> u201_167'35_arg accWs_f1 k in
        let k = [], fun [] u202_167'29_arg -> ::_g14 u202_167'29_arg k in
        reverse_g32 accCs_f1 k
      | Cons1(x_t1,xs_t2) ->
        let k = [accCs_f1,accWs_f2,loop_f3,x_t1,xs_t2], fun [accCs_f1,accWs_f2,loop_f3,x_f4,xs_f5] u203_170'20_arg ->
          match u203_170'20_arg with
          | true1 ->
            let k = [xs_f5], fun [xs_f1] u206_170'59_arg -> u206_170'59_arg xs_f1 k in
            let k = [], fun [] u207_170'34_arg ->
              let u211_170'59_t1 = Nil0 in
              u207_170'34_arg u211_170'59_t1 k in
            let k = [loop_f3], fun [loop_f1] u208_170'52_arg -> loop_f1 u208_170'52_arg k in
            let k = [accWs_f2], fun [accWs_f1] u209_170'49_arg -> u209_170'49_arg accWs_f1 k in
            let k = [], fun [] u210_170'43_arg -> ::_g14 u210_170'43_arg k in
            reverse_g32 accCs_f1 k
          | false0 ->
            let k = [xs_f5], fun [xs_f1] u212_171'23_arg -> u212_171'23_arg xs_f1 k in
            let k = [accCs_f1,x_f4], fun [accCs_f1,x_f2] u213_171'17_arg ->
              let k = [u213_171'17_arg], fun [u213_171'17_f1] u214_171'27_arg -> u213_171'17_f1 u214_171'27_arg k in
              let k = [accCs_f1], fun [accCs_f1] u215_171'25_arg -> u215_171'25_arg accCs_f1 k in
              ::_g14 x_f2 k in
            loop_f3 accWs_f2 k in
        let k = [], fun [] u204_170'18_arg -> u204_170'18_arg u205_170'20_g90 k in
        eq_char_g8 x_t1 k in
    k v216_t1 in
  k v217_t1 in
let split_words_g92 = fun s_arg k ->
  let k = [s_arg], fun [s_f1] u218_173'10_arg -> u218_173'10_arg s_f1 k in
  let k = [], fun [] u219_173'7_arg ->
    let u221_173'10_t1 = Nil0 in
    u219_173'7_arg u221_173'10_t1 k in
  let u220_173'7_t1 = Nil0 in
  loop_g91 u220_173'7_t1 k in
let u226_180'38_g93 = "fib" in
let u230_181'40_g94 = "fact" in
let execute_g95 = fun line_arg k ->
  let k = [line_arg], fun [line_f1] words_arg ->
    match words_arg with
    | Nil0 ->
      let v222_t1 = Unit0 in
      k v222_t1
    | Cons1(command_t1,args_t2) ->
      let k = [args_t2,command_t1,line_f1], fun [args_f1,command_f2,line_f3] u223_180'29_arg ->
        match u223_180'29_arg with
        | true1 -> runfib_g74 args_f1 k
        | false0 ->
          let k = [args_f1,line_f3], fun [args_f1,line_f2] u227_181'31_arg ->
            match u227_181'31_arg with
            | true1 -> runfact_g80 args_f1 k
            | false0 -> fallback_g89 line_f2 k in
          let k = [], fun [] u228_181'23_arg ->
            let k = [u228_181'23_arg], fun [u228_181'23_f1] u229_181'40_arg -> u228_181'23_f1 u229_181'40_arg k in
            explode_g11 u230_181'40_g94 k in
          eq_char_list_g29 command_f2 k in
      let k = [], fun [] u224_180'21_arg ->
        let k = [u224_180'21_arg], fun [u224_180'21_f1] u225_180'38_arg -> u224_180'21_f1 u225_180'38_arg k in
        explode_g11 u226_180'38_g93 k in
      eq_char_list_g29 command_t1 k in
  split_words_g92 line_arg k in
let u231_185'11_g96 = '>' in
let u232_186'11_g97 = ' ' in
let mainloop_g98 = fun mainloop_me __arg k ->
  let k = [mainloop_me], fun [mainloop_f1] __arg ->
    let k = [mainloop_f1], fun [mainloop_f1] __arg ->
      let k = [mainloop_f1], fun [mainloop_f1] xs_arg ->
        let k = [mainloop_f1], fun [mainloop_f1] __arg ->
          let u234_189'11_t1 = Unit0 in
          mainloop_f1 u234_189'11_t1 k in
        execute_g95 xs_arg k in
      let u233_187'21_t1 = Unit0 in
      read_line_g58 u233_187'21_t1 k in
    put_char_g12 u232_186'11_g97 k in
  put_char_g12 u231_185'11_g96 k in
let u235_191'28_g99 = "LOAD" in
let u236_194'21_g100 = "RUN" in
let u238_196'21_g101 = "NEVER" in
let main_g102 = fun __arg k ->
  let k = [], fun [] __arg ->
    let k = [], fun [] __arg -> put_string_newline_g49 u238_196'21_g101 k in
    let u237_195'20_t1 = Unit0 in
    mainloop_g98 u237_195'20_t1 k in
  put_string_newline_g49 u236_194'21_g100 k in
let k = [], fun [] __arg ->
  let u239_0'0_t1 = Unit0 in
  main_g102 u239_0'0_t1 k in
put_string_newline_g49 u235_191'28_g99 k
