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
  let k = [n_7_22'12_arg,fib_8_22'8_me], fun [n_7_22'12_f1,fib_8_22'8_f2] uLET_2_0'0_arg ->
    match uLET_2_0'0_arg with
    | true1 -> k n_7_22'12_f1
    | false0 ->
      let k = [n_7_22'12_f1,fib_8_22'8_f2], fun [n_7_22'12_f1,fib_8_22'8_f2] uLET_4_0'0_arg ->
        let k = [uLET_4_0'0_arg], fun [uLET_4_0'0_f1] app_9_24'39_arg -> uLET_4_0'0_f1 app_9_24'39_arg k in
        let k = [fib_8_22'8_f2], fun [fib_8_22'8_f1] uLET_10_0'0_arg -> fib_8_22'8_f1 uLET_10_0'0_arg k in
        let prim_11_0'0_t1 = PRIM_SubInt(n_7_22'12_f1,u_13_g4) in
        k prim_11_0'0_t1 in
      let k = [], fun [] u_11_arg ->
        let lam_8_0'0_t1 = [u_11_arg], fun [u_11_f1] f_12_arg k ->
          let prim_7_0'0_t1 = PRIM_AddInt(u_11_f1,f_12_arg) in
          k prim_7_0'0_t1 in
        k lam_8_0'0_t1 in
      let k = [fib_8_22'8_f2], fun [fib_8_22'8_f1] uLET_5_0'0_arg -> fib_8_22'8_f1 uLET_5_0'0_arg k in
      let prim_6_0'0_t1 = PRIM_SubInt(n_7_22'12_f1,u_10_g3) in
      k prim_6_0'0_t1 in
  let prim_3_0'0_t1 = PRIM_LessInt(n_7_22'12_arg,u_9_g2) in
  k prim_3_0'0_t1 in
let u_16_g6 = 20 in
let u_18_g7 = "fib " in
let u_20_g8 = '0' in
let u_25_g9 = 0 in
let u_26_g10 = 10 in
let u_31_g11 = 10 in
let u_33_g12 = 0 in
let lit_29_9'17_g13 = '0' in
let u_35_g14 = " --> " in
let u_37_g15 = '0' in
let u_42_g16 = 0 in
let u_43_g17 = 10 in
let u_48_g18 = 10 in
let u_50_g19 = 0 in
let lit_51_9'17_g20 = '0' in
let u_53_g21 = '\n' in
let u_15_t1 = Unit0 in
let k = [], fun [] u_17_arg ->
  let k = [u_17_arg], fun [u_17_f1] u_19_arg ->
    let k = [u_17_f1], fun [u_17_f1] u_34_arg ->
      let k = [u_17_f1], fun [u_17_f1] u_36_arg ->
        let k = [], fun [] u_51_arg ->
          let u_52_t1 = Unit0 in
          let prim_56_0'0_t2 = PRIM_PutChar(u_53_g21) in
          k prim_56_0'0_t2 in
        let k = [], fun [] uLET_35_0'0_arg -> u_6_g1 uLET_35_0'0_arg k in
        let k = [u_17_f1], fun [u_17_f1] u_38_arg ->
          let u_49_t1 = [u_38_arg], fun [u_38_f1] loop_40_5'10_me acc_39_5'15_arg k ->
            let lam_48_0'0_t1 = [u_38_f1,acc_39_5'15_arg,loop_40_5'10_me], fun [u_38_f1,acc_39_5'15_f2,loop_40_5'10_f3] f_41_arg k ->
              let k = [u_38_f1,acc_39_5'15_f2,loop_40_5'10_f3,f_41_arg], fun [u_38_f1,acc_39_5'15_f2,loop_40_5'10_f3,f_41_f4] uLET_37_0'0_arg ->
                match uLET_37_0'0_arg with
                | true1 -> k acc_39_5'15_f2
                | false0 ->
                  let k = [f_41_f4], fun [f_41_f1] app_39_7'11_arg ->
                    let k = [app_39_7'11_arg], fun [app_39_7'11_f1] uLET_46_0'0_arg -> app_39_7'11_f1 uLET_46_0'0_arg k in
                    let prim_47_0'0_t1 = PRIM_DivInt(f_41_f1,u_48_g18) in
                    k prim_47_0'0_t1 in
                  let k = [loop_40_5'10_f3], fun [loop_40_5'10_f1] app_40_7'36_arg -> loop_40_5'10_f1 app_40_7'36_arg k in
                  let k = [acc_39_5'15_f2], fun [acc_39_5'15_f1] uLET_41_0'0_arg -> uLET_41_0'0_arg acc_39_5'15_f1 k in
                  let k = [], fun [] u_46_arg ->
                    let lam_45_0'0_t1 = [u_46_arg], fun [u_46_f1] f_47_arg k ->
                      let con_44_0'0_t1 = Cons1[u_46_f1,f_47_arg] in
                      k con_44_0'0_t1 in
                    k lam_45_0'0_t1 in
                  let k = [u_38_f1], fun [u_38_f1] u_44_arg ->
                    let u_45_t1 = PRIM_AddInt(u_38_f1,u_44_arg) in
                    let prim_43_0'0_t2 = PRIM_CharChr(u_45_t1) in
                    k prim_43_0'0_t2 in
                  let prim_42_0'0_t1 = PRIM_ModInt(f_41_f4,u_43_g17) in
                  k prim_42_0'0_t1 in
              let prim_38_0'0_t1 = PRIM_EqInt(f_41_arg,u_42_g16) in
              k prim_38_0'0_t1 in
            k lam_48_0'0_t1 in
          let k = [u_17_f1,u_49_t1], fun [u_17_f1,u_49_f2] uLET_49_0'0_arg ->
            match uLET_49_0'0_arg with
            | true1 ->
              let con_52_9'20_t1 = Nil0 in
              let con_53_9'17_t2 = Cons1[lit_51_9'17_g20,con_52_9'20_t1] in
              k con_53_9'17_t2
            | false0 ->
              let k = [u_17_f1], fun [u_17_f1] app_54_9'32_arg -> app_54_9'32_arg u_17_f1 k in
              let con_55_9'32_t1 = Nil0 in
              u_49_f2 con_55_9'32_t1 k in
          let prim_50_0'0_t2 = PRIM_EqInt(u_17_f1,u_50_g19) in
          k prim_50_0'0_t2 in
        let prim_36_0'0_t1 = PRIM_CharOrd(u_37_g15) in
        k prim_36_0'0_t1 in
      let prim_34_0'0_t1 = PRIM_Explode(u_35_g14) in
      u_6_g1 prim_34_0'0_t1 k in
    let k = [], fun [] uLET_13_0'0_arg -> u_6_g1 uLET_13_0'0_arg k in
    let k = [], fun [] u_21_arg ->
      let u_32_t1 = [u_21_arg], fun [u_21_f1] loop_23_5'10_me acc_22_5'15_arg k ->
        let lam_26_0'0_t1 = [u_21_f1,acc_22_5'15_arg,loop_23_5'10_me], fun [u_21_f1,acc_22_5'15_f2,loop_23_5'10_f3] f_24_arg k ->
          let k = [u_21_f1,acc_22_5'15_f2,loop_23_5'10_f3,f_24_arg], fun [u_21_f1,acc_22_5'15_f2,loop_23_5'10_f3,f_24_f4] uLET_15_0'0_arg ->
            match uLET_15_0'0_arg with
            | true1 -> k acc_22_5'15_f2
            | false0 ->
              let k = [f_24_f4], fun [f_24_f1] app_17_7'11_arg ->
                let k = [app_17_7'11_arg], fun [app_17_7'11_f1] uLET_24_0'0_arg -> app_17_7'11_f1 uLET_24_0'0_arg k in
                let prim_25_0'0_t1 = PRIM_DivInt(f_24_f1,u_31_g11) in
                k prim_25_0'0_t1 in
              let k = [loop_23_5'10_f3], fun [loop_23_5'10_f1] app_18_7'36_arg -> loop_23_5'10_f1 app_18_7'36_arg k in
              let k = [acc_22_5'15_f2], fun [acc_22_5'15_f1] uLET_19_0'0_arg -> uLET_19_0'0_arg acc_22_5'15_f1 k in
              let k = [], fun [] u_29_arg ->
                let lam_23_0'0_t1 = [u_29_arg], fun [u_29_f1] f_30_arg k ->
                  let con_22_0'0_t1 = Cons1[u_29_f1,f_30_arg] in
                  k con_22_0'0_t1 in
                k lam_23_0'0_t1 in
              let k = [u_21_f1], fun [u_21_f1] u_27_arg ->
                let u_28_t1 = PRIM_AddInt(u_21_f1,u_27_arg) in
                let prim_21_0'0_t2 = PRIM_CharChr(u_28_t1) in
                k prim_21_0'0_t2 in
              let prim_20_0'0_t1 = PRIM_ModInt(f_24_f4,u_26_g10) in
              k prim_20_0'0_t1 in
          let prim_16_0'0_t1 = PRIM_EqInt(f_24_arg,u_25_g9) in
          k prim_16_0'0_t1 in
        k lam_26_0'0_t1 in
      let k = [u_32_t1], fun [u_32_f1] uLET_27_0'0_arg ->
        match uLET_27_0'0_arg with
        | true1 ->
          let con_30_9'20_t1 = Nil0 in
          let con_31_9'17_t2 = Cons1[lit_29_9'17_g13,con_30_9'20_t1] in
          k con_31_9'17_t2
        | false0 ->
          let k = [], fun [] app_32_9'32_arg -> app_32_9'32_arg u_16_g6 k in
          let con_33_9'32_t1 = Nil0 in
          u_32_f1 con_33_9'32_t1 k in
      let prim_28_0'0_t2 = PRIM_EqInt(u_16_g6,u_33_g12) in
      k prim_28_0'0_t2 in
    let prim_14_0'0_t1 = PRIM_CharOrd(u_20_g8) in
    k prim_14_0'0_t1 in
  let prim_12_0'0_t1 = PRIM_Explode(u_18_g7) in
  u_6_g1 prim_12_0'0_t1 k in
u_14_g5 u_16_g6 k
