(*stage3*)
let k () = ()
let u_6_g1 = fun put_chars_2_11'8_me xs_1_11'18_arg k ->
  match xs_1_11'18_arg with
  | Nil0 ->
    let con_1_13'10_t1 = Unit0 in
    k con_1_13'10_t1
  | Cons1(x_3_14'4_t1,xs_4_14'7_t2) ->
    let u_5_t3 = PRIM_PutChar(x_3_14'4_t1) in
    put_chars_2_11'8_me xs_4_14'7_t2 k in
let u_9_g2 = 2 in
let u_10_g3 = 1 in
let u_13_g4 = 2 in
let u_14_g5 = fun fib_8_22'8_me n_7_22'12_arg k ->
  let uLET_2_0'0_t1 = PRIM_LessInt(n_7_22'12_arg,u_9_g2) in
  match uLET_2_0'0_t1 with
  | true1 -> k n_7_22'12_arg
  | false0 ->
    let uLET_4_0'0_t2 = PRIM_SubInt(n_7_22'12_arg,u_10_g3) in
    let k = [n_7_22'12_arg,fib_8_22'8_me], fun [n_7_22'12_f1,fib_8_22'8_f2] u_11_arg ->
      let uLET_3_0'0_t1 = [u_11_arg], fun [u_11_f1] f_12_arg k ->
        let prim_5_0'0_t1 = PRIM_AddInt(u_11_f1,f_12_arg) in
        k prim_5_0'0_t1 in
      let uLET_7_0'0_t2 = PRIM_SubInt(n_7_22'12_f1,u_13_g4) in
      let k = [uLET_3_0'0_t1], fun [uLET_3_0'0_f1] app_6_24'39_arg -> uLET_3_0'0_f1 app_6_24'39_arg k in
      fib_8_22'8_f2 uLET_7_0'0_t2 k in
    fib_8_22'8_me uLET_4_0'0_t2 k in
let u_16_g6 = 20 in
let u_18_g7 = "fib " in
let u_20_g8 = '0' in
let u_25_g9 = 0 in
let u_26_g10 = 10 in
let u_31_g11 = 10 in
let u_33_g12 = 0 in
let lit_18_9'17_g13 = '0' in
let u_35_g14 = " --> " in
let u_37_g15 = '0' in
let u_42_g16 = 0 in
let u_43_g17 = 10 in
let u_48_g18 = 10 in
let u_50_g19 = 0 in
let lit_33_9'17_g20 = '0' in
let u_53_g21 = '\n' in
let u_15_t1 = Unit0 in
let k = [], fun [] u_17_arg ->
  let prim_8_0'0_t1 = PRIM_Explode(u_18_g7) in
  let k = [u_17_arg], fun [u_17_f1] u_19_arg ->
    let u_21_t1 = PRIM_CharOrd(u_20_g8) in
    let u_32_t2 = [u_21_t1], fun [u_21_f1] loop_23_5'10_me acc_22_5'15_arg k ->
      let lam_16_0'0_t1 = [u_21_f1,acc_22_5'15_arg,loop_23_5'10_me], fun [u_21_f1,acc_22_5'15_f2,loop_23_5'10_f3] f_24_arg k ->
        let uLET_10_0'0_t1 = PRIM_EqInt(f_24_arg,u_25_g9) in
        match uLET_10_0'0_t1 with
        | true1 -> k acc_22_5'15_f2
        | false0 ->
          let u_27_t2 = PRIM_ModInt(f_24_arg,u_26_g10) in
          let u_28_t3 = PRIM_AddInt(u_21_f1,u_27_t2) in
          let u_29_t4 = PRIM_CharChr(u_28_t3) in
          let uLET_13_0'0_t5 = [u_29_t4], fun [u_29_f1] f_30_arg k ->
            let con_14_0'0_t1 = Cons1[u_29_f1,f_30_arg] in
            k con_14_0'0_t1 in
          let k = [loop_23_5'10_f3,f_24_arg], fun [loop_23_5'10_f1,f_24_f2] app_12_7'36_arg ->
            let k = [f_24_f2], fun [f_24_f1] app_11_7'11_arg ->
              let uLET_15_0'0_t1 = PRIM_DivInt(f_24_f1,u_31_g11) in
              app_11_7'11_arg uLET_15_0'0_t1 k in
            loop_23_5'10_f1 app_12_7'36_arg k in
          uLET_13_0'0_t5 acc_22_5'15_f2 k in
      k lam_16_0'0_t1 in
    let uLET_17_0'0_t3 = PRIM_EqInt(u_16_g6,u_33_g12) in
    let k = [u_17_f1], fun [u_17_f1] uLET_9_0'0_arg ->
      let k = [u_17_f1], fun [u_17_f1] u_34_arg ->
        let prim_23_0'0_t1 = PRIM_Explode(u_35_g14) in
        let k = [u_17_f1], fun [u_17_f1] u_36_arg ->
          let u_38_t1 = PRIM_CharOrd(u_37_g15) in
          let u_49_t2 = [u_38_t1], fun [u_38_f1] loop_40_5'10_me acc_39_5'15_arg k ->
            let lam_31_0'0_t1 = [u_38_f1,acc_39_5'15_arg,loop_40_5'10_me], fun [u_38_f1,acc_39_5'15_f2,loop_40_5'10_f3] f_41_arg k ->
              let uLET_25_0'0_t1 = PRIM_EqInt(f_41_arg,u_42_g16) in
              match uLET_25_0'0_t1 with
              | true1 -> k acc_39_5'15_f2
              | false0 ->
                let u_44_t2 = PRIM_ModInt(f_41_arg,u_43_g17) in
                let u_45_t3 = PRIM_AddInt(u_38_f1,u_44_t2) in
                let u_46_t4 = PRIM_CharChr(u_45_t3) in
                let uLET_28_0'0_t5 = [u_46_t4], fun [u_46_f1] f_47_arg k ->
                  let con_29_0'0_t1 = Cons1[u_46_f1,f_47_arg] in
                  k con_29_0'0_t1 in
                let k = [loop_40_5'10_f3,f_41_arg], fun [loop_40_5'10_f1,f_41_f2] app_27_7'36_arg ->
                  let k = [f_41_f2], fun [f_41_f1] app_26_7'11_arg ->
                    let uLET_30_0'0_t1 = PRIM_DivInt(f_41_f1,u_48_g18) in
                    app_26_7'11_arg uLET_30_0'0_t1 k in
                  loop_40_5'10_f1 app_27_7'36_arg k in
                uLET_28_0'0_t5 acc_39_5'15_f2 k in
            k lam_31_0'0_t1 in
          let uLET_32_0'0_t3 = PRIM_EqInt(u_17_f1,u_50_g19) in
          let k = [], fun [] uLET_24_0'0_arg ->
            let k = [], fun [] u_51_arg ->
              let u_52_t1 = Unit0 in
              let prim_38_0'0_t2 = PRIM_PutChar(u_53_g21) in
              k prim_38_0'0_t2 in
            u_6_g1 uLET_24_0'0_arg k in
          match uLET_32_0'0_t3 with
          | true1 ->
            let con_34_9'20_t4 = Nil0 in
            let con_35_9'17_t5 = Cons1[lit_33_9'17_g20,con_34_9'20_t4] in
            k con_35_9'17_t5
          | false0 ->
            let con_37_9'32_t4 = Nil0 in
            let k = [u_17_f1], fun [u_17_f1] app_36_9'32_arg -> app_36_9'32_arg u_17_f1 k in
            u_49_t2 con_37_9'32_t4 k in
        u_6_g1 prim_23_0'0_t1 k in
      u_6_g1 uLET_9_0'0_arg k in
    match uLET_17_0'0_t3 with
    | true1 ->
      let con_19_9'20_t4 = Nil0 in
      let con_20_9'17_t5 = Cons1[lit_18_9'17_g13,con_19_9'20_t4] in
      k con_20_9'17_t5
    | false0 ->
      let con_22_9'32_t4 = Nil0 in
      let k = [], fun [] app_21_9'32_arg -> app_21_9'32_arg u_16_g6 k in
      u_32_t2 con_22_9'32_t4 k in
  u_6_g1 prim_8_0'0_t1 k in
u_14_g5 u_16_g6 k
