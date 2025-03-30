(*stage3*)
let k () = ()
let con_1_13'10_g1 = Unit0 in
let put_chars_6_11'8_g2 = fun put_chars_2_11'8_me xs_1_11'18_arg k ->
  match xs_1_11'18_arg with
  | Nil0 -> k con_1_13'10_g1
  | Cons1(x_3_14'4_t1,xs_4_14'7_t2) ->
    let __5_14'23_t3 = PRIM_PutChar(x_3_14'4_t1) in
    put_chars_2_11'8_me xs_4_14'7_t2 k in
let y_9_0'0_g3 = 2 in
let y_10_0'0_g4 = 1 in
let y_13_0'0_g5 = 2 in
let fib_14_22'8_g6 = fun fib_8_22'8_me n_7_22'12_arg k ->
  let uLET_2_0'0_t1 = PRIM_LessInt(n_7_22'12_arg,y_9_0'0_g3) in
  match uLET_2_0'0_t1 with
  | true1 -> k n_7_22'12_arg
  | false0 ->
    let uLET_4_0'0_t2 = PRIM_SubInt(n_7_22'12_arg,y_10_0'0_g4) in
    let k = [n_7_22'12_arg,fib_8_22'8_me], fun [n_7_22'12_f1,fib_8_22'8_f2] x_11_0'0_arg ->
      let uLET_3_0'0_t1 = [x_11_0'0_arg], fun [x_11_0'0_f1] y_12_0'0_arg k ->
        let prim_5_0'0_t1 = PRIM_AddInt(x_11_0'0_f1,y_12_0'0_arg) in
        k prim_5_0'0_t1 in
      let uLET_7_0'0_t2 = PRIM_SubInt(n_7_22'12_f1,y_13_0'0_g5) in
      let k = [uLET_3_0'0_t1], fun [uLET_3_0'0_f1] app_6_24'39_arg -> uLET_3_0'0_f1 app_6_24'39_arg k in
      fib_8_22'8_f2 uLET_7_0'0_t2 k in
    fib_8_22'8_me uLET_4_0'0_t2 k in
let n_16_26'11_g7 = 20 in
let s_18_16'15_g8 = "fib " in
let x_20_0'0_g9 = '0' in
let y_25_0'0_g10 = 0 in
let y_26_0'0_g11 = 10 in
let y_31_0'0_g12 = 10 in
let y_33_0'0_g13 = 0 in
let lit_18_9'17_g14 = '0' in
let con_19_9'20_g15 = Nil0 in
let con_22_9'32_g16 = Nil0 in
let s_35_16'15_g17 = " --> " in
let x_37_0'0_g18 = '0' in
let y_42_0'0_g19 = 0 in
let y_43_0'0_g20 = 10 in
let y_48_0'0_g21 = 10 in
let y_50_0'0_g22 = 0 in
let lit_33_9'17_g23 = '0' in
let con_34_9'20_g24 = Nil0 in
let con_37_9'32_g25 = Nil0 in
let x_53_0'0_g26 = '\n' in
let k = [], fun [] res_17_27'6_arg ->
  let prim_8_0'0_t1 = PRIM_Explode(s_18_16'15_g8) in
  let k = [res_17_27'6_arg], fun [res_17_27'6_f1] __19_28'19_arg ->
    let ord0_21_3'6_t1 = PRIM_CharOrd(x_20_0'0_g9) in
    let loop_32_5'10_t2 = [ord0_21_3'6_t1], fun [ord0_21_3'6_f1] loop_23_5'10_me acc_22_5'15_arg k ->
      let lam_16_5'19_t1 = [ord0_21_3'6_f1,acc_22_5'15_arg,loop_23_5'10_me], fun [ord0_21_3'6_f1,acc_22_5'15_f2,loop_23_5'10_f3] i_24_5'19_arg k ->
        let uLET_10_0'0_t1 = PRIM_EqInt(i_24_5'19_arg,y_25_0'0_g10) in
        match uLET_10_0'0_t1 with
        | true1 -> k acc_22_5'15_f2
        | false0 ->
          let c_27_4'20_t2 = PRIM_ModInt(i_24_5'19_arg,y_26_0'0_g11) in
          let x_28_0'0_t3 = PRIM_AddInt(ord0_21_3'6_f1,c_27_4'20_t2) in
          let x_29_0'0_t4 = PRIM_CharChr(x_28_0'0_t3) in
          let uLET_13_0'0_t5 = [x_29_0'0_t4], fun [x_29_0'0_f1] y_30_0'0_arg k ->
            let con_14_0'0_t1 = Cons1[x_29_0'0_f1,y_30_0'0_arg] in
            k con_14_0'0_t1 in
          let k = [loop_23_5'10_f3,i_24_5'19_arg], fun [loop_23_5'10_f1,i_24_5'19_f2] app_12_7'36_arg ->
            let k = [i_24_5'19_f2], fun [i_24_5'19_f1] app_11_7'11_arg ->
              let uLET_15_0'0_t1 = PRIM_DivInt(i_24_5'19_f1,y_31_0'0_g12) in
              app_11_7'11_arg uLET_15_0'0_t1 k in
            loop_23_5'10_f1 app_12_7'36_arg k in
          uLET_13_0'0_t5 acc_22_5'15_f2 k in
      k lam_16_5'19_t1 in
    let uLET_17_0'0_t3 = PRIM_EqInt(n_16_26'11_g7,y_33_0'0_g13) in
    let k = [res_17_27'6_f1], fun [res_17_27'6_f1] uLET_9_3'6_arg ->
      let k = [res_17_27'6_f1], fun [res_17_27'6_f1] __34_29'11_arg ->
        let prim_23_0'0_t1 = PRIM_Explode(s_35_16'15_g17) in
        let k = [res_17_27'6_f1], fun [res_17_27'6_f1] __36_30'20_arg ->
          let ord0_38_3'6_t1 = PRIM_CharOrd(x_37_0'0_g18) in
          let loop_49_5'10_t2 = [ord0_38_3'6_t1], fun [ord0_38_3'6_f1] loop_40_5'10_me acc_39_5'15_arg k ->
            let lam_31_5'19_t1 = [ord0_38_3'6_f1,acc_39_5'15_arg,loop_40_5'10_me], fun [ord0_38_3'6_f1,acc_39_5'15_f2,loop_40_5'10_f3] i_41_5'19_arg k ->
              let uLET_25_0'0_t1 = PRIM_EqInt(i_41_5'19_arg,y_42_0'0_g19) in
              match uLET_25_0'0_t1 with
              | true1 -> k acc_39_5'15_f2
              | false0 ->
                let c_44_4'20_t2 = PRIM_ModInt(i_41_5'19_arg,y_43_0'0_g20) in
                let x_45_0'0_t3 = PRIM_AddInt(ord0_38_3'6_f1,c_44_4'20_t2) in
                let x_46_0'0_t4 = PRIM_CharChr(x_45_0'0_t3) in
                let uLET_28_0'0_t5 = [x_46_0'0_t4], fun [x_46_0'0_f1] y_47_0'0_arg k ->
                  let con_29_0'0_t1 = Cons1[x_46_0'0_f1,y_47_0'0_arg] in
                  k con_29_0'0_t1 in
                let k = [loop_40_5'10_f3,i_41_5'19_arg], fun [loop_40_5'10_f1,i_41_5'19_f2] app_27_7'36_arg ->
                  let k = [i_41_5'19_f2], fun [i_41_5'19_f1] app_26_7'11_arg ->
                    let uLET_30_0'0_t1 = PRIM_DivInt(i_41_5'19_f1,y_48_0'0_g21) in
                    app_26_7'11_arg uLET_30_0'0_t1 k in
                  loop_40_5'10_f1 app_27_7'36_arg k in
                uLET_28_0'0_t5 acc_39_5'15_f2 k in
            k lam_31_5'19_t1 in
          let uLET_32_0'0_t3 = PRIM_EqInt(res_17_27'6_f1,y_50_0'0_g22) in
          let k = [], fun [] uLET_24_3'6_arg ->
            let k = [], fun [] __51_31'13_arg ->
              let prim_38_0'0_t1 = PRIM_PutChar(x_53_0'0_g26) in
              k prim_38_0'0_t1 in
            put_chars_6_11'8_g2 uLET_24_3'6_arg k in
          match uLET_32_0'0_t3 with
          | true1 ->
            let con_35_9'17_t4 = Cons1[lit_33_9'17_g23,con_34_9'20_g24] in
            k con_35_9'17_t4
          | false0 ->
            let k = [res_17_27'6_f1], fun [res_17_27'6_f1] app_36_9'32_arg -> app_36_9'32_arg res_17_27'6_f1 k in
            loop_49_5'10_t2 con_37_9'32_g25 k in
        put_chars_6_11'8_g2 prim_23_0'0_t1 k in
      put_chars_6_11'8_g2 uLET_9_3'6_arg k in
    match uLET_17_0'0_t3 with
    | true1 ->
      let con_20_9'17_t4 = Cons1[lit_18_9'17_g14,con_19_9'20_g15] in
      k con_20_9'17_t4
    | false0 ->
      let k = [], fun [] app_21_9'32_arg -> app_21_9'32_arg n_16_26'11_g7 k in
      loop_32_5'10_t2 con_22_9'32_g16 k in
  put_chars_6_11'8_g2 prim_8_0'0_t1 k in
fib_14_22'8_g6 n_16_26'11_g7 k
