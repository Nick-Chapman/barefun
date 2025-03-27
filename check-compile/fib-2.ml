(*stage2*)
let k () = ()
let u_6 = fix (fun [] put_chars_2_11'8 xs_1_11'18 k ->
  match xs_1_11'18 with
  | Nil0 ->
    let con_1_13'10 = Unit0 in
    k con_1_13'10
  | Cons1(x_3_14'4,xs_4_14'7) ->
    let u_5 = PRIM_PutChar(x_3_14'4) in
    put_chars_2_11'8 xs_4_14'7 k) in
let u_14 = fix (fun [] fib_8_22'8 n_7_22'12 k ->
  let k [n_7_22'12,fib_8_22'8] uLET_2_0'0 =
    match uLET_2_0'0 with
    | true1 -> k n_7_22'12
    | false0 ->
      let k [n_7_22'12,fib_8_22'8] uLET_4_0'0 =
        let k [uLET_4_0'0] app_9_24'39 = uLET_4_0'0 app_9_24'39 k in
        let k [fib_8_22'8] uLET_10_0'0 = fib_8_22'8 uLET_10_0'0 k in
        let u_13 = 2 in
        let prim_11_0'0 = PRIM_SubInt(n_7_22'12,u_13) in
        k prim_11_0'0 in
      let k [] u_11 =
        let lam_8_0'0 = fun [u_11] f_12 k ->
          let prim_7_0'0 = PRIM_AddInt(u_11,f_12) in
          k prim_7_0'0 in
        k lam_8_0'0 in
      let k [fib_8_22'8] uLET_5_0'0 = fib_8_22'8 uLET_5_0'0 k in
      let u_10 = 1 in
      let prim_6_0'0 = PRIM_SubInt(n_7_22'12,u_10) in
      k prim_6_0'0 in
  let u_9 = 2 in
  let prim_3_0'0 = PRIM_LessInt(n_7_22'12,u_9) in
  k prim_3_0'0) in
let u_15 = Unit0 in
let u_16 = 20 in
let k [u_6,u_16] u_17 =
  let k [u_6,u_16,u_17] u_19 =
    let k [u_6,u_17] u_34 =
      let k [u_6,u_17] u_36 =
        let k [] u_51 =
          let u_52 = Unit0 in
          let u_53 = '\n' in
          let prim_56_0'0 = PRIM_PutChar(u_53) in
          k prim_56_0'0 in
        let k [u_6] uLET_35_0'0 = u_6 uLET_35_0'0 k in
        let k [u_17] u_38 =
          let u_49 = fix (fun [u_38] loop_40_5'10 acc_39_5'15 k ->
            let lam_48_0'0 = fun [u_38,acc_39_5'15,loop_40_5'10] f_41 k ->
              let k [u_38,acc_39_5'15,loop_40_5'10,f_41] uLET_37_0'0 =
                match uLET_37_0'0 with
                | true1 -> k acc_39_5'15
                | false0 ->
                  let k [f_41] app_39_7'11 =
                    let k [app_39_7'11] uLET_46_0'0 = app_39_7'11 uLET_46_0'0 k in
                    let u_48 = 10 in
                    let prim_47_0'0 = PRIM_DivInt(f_41,u_48) in
                    k prim_47_0'0 in
                  let k [loop_40_5'10] app_40_7'36 = loop_40_5'10 app_40_7'36 k in
                  let k [acc_39_5'15] uLET_41_0'0 = uLET_41_0'0 acc_39_5'15 k in
                  let k [] u_46 =
                    let lam_45_0'0 = fun [u_46] f_47 k ->
                      let con_44_0'0 = Cons1[u_46,f_47] in
                      k con_44_0'0 in
                    k lam_45_0'0 in
                  let k [u_38] u_44 =
                    let u_45 = PRIM_AddInt(u_38,u_44) in
                    let prim_43_0'0 = PRIM_CharChr(u_45) in
                    k prim_43_0'0 in
                  let u_43 = 10 in
                  let prim_42_0'0 = PRIM_ModInt(f_41,u_43) in
                  k prim_42_0'0 in
              let u_42 = 0 in
              let prim_38_0'0 = PRIM_EqInt(f_41,u_42) in
              k prim_38_0'0 in
            k lam_48_0'0) in
          let k [u_17,u_49] uLET_49_0'0 =
            match uLET_49_0'0 with
            | true1 ->
              let lit_51_9'17 = '0' in
              let con_52_9'20 = Nil0 in
              let con_53_9'17 = Cons1[lit_51_9'17,con_52_9'20] in
              k con_53_9'17
            | false0 ->
              let k [u_17] app_54_9'32 = app_54_9'32 u_17 k in
              let con_55_9'32 = Nil0 in
              u_49 con_55_9'32 k in
          let u_50 = 0 in
          let prim_50_0'0 = PRIM_EqInt(u_17,u_50) in
          k prim_50_0'0 in
        let u_37 = '0' in
        let prim_36_0'0 = PRIM_CharOrd(u_37) in
        k prim_36_0'0 in
      let u_35 = " --> " in
      let prim_34_0'0 = PRIM_Explode(u_35) in
      u_6 prim_34_0'0 k in
    let k [u_6] uLET_13_0'0 = u_6 uLET_13_0'0 k in
    let k [u_16] u_21 =
      let u_32 = fix (fun [u_21] loop_23_5'10 acc_22_5'15 k ->
        let lam_26_0'0 = fun [u_21,acc_22_5'15,loop_23_5'10] f_24 k ->
          let k [u_21,acc_22_5'15,loop_23_5'10,f_24] uLET_15_0'0 =
            match uLET_15_0'0 with
            | true1 -> k acc_22_5'15
            | false0 ->
              let k [f_24] app_17_7'11 =
                let k [app_17_7'11] uLET_24_0'0 = app_17_7'11 uLET_24_0'0 k in
                let u_31 = 10 in
                let prim_25_0'0 = PRIM_DivInt(f_24,u_31) in
                k prim_25_0'0 in
              let k [loop_23_5'10] app_18_7'36 = loop_23_5'10 app_18_7'36 k in
              let k [acc_22_5'15] uLET_19_0'0 = uLET_19_0'0 acc_22_5'15 k in
              let k [] u_29 =
                let lam_23_0'0 = fun [u_29] f_30 k ->
                  let con_22_0'0 = Cons1[u_29,f_30] in
                  k con_22_0'0 in
                k lam_23_0'0 in
              let k [u_21] u_27 =
                let u_28 = PRIM_AddInt(u_21,u_27) in
                let prim_21_0'0 = PRIM_CharChr(u_28) in
                k prim_21_0'0 in
              let u_26 = 10 in
              let prim_20_0'0 = PRIM_ModInt(f_24,u_26) in
              k prim_20_0'0 in
          let u_25 = 0 in
          let prim_16_0'0 = PRIM_EqInt(f_24,u_25) in
          k prim_16_0'0 in
        k lam_26_0'0) in
      let k [u_16,u_32] uLET_27_0'0 =
        match uLET_27_0'0 with
        | true1 ->
          let lit_29_9'17 = '0' in
          let con_30_9'20 = Nil0 in
          let con_31_9'17 = Cons1[lit_29_9'17,con_30_9'20] in
          k con_31_9'17
        | false0 ->
          let k [u_16] app_32_9'32 = app_32_9'32 u_16 k in
          let con_33_9'32 = Nil0 in
          u_32 con_33_9'32 k in
      let u_33 = 0 in
      let prim_28_0'0 = PRIM_EqInt(u_16,u_33) in
      k prim_28_0'0 in
    let u_20 = '0' in
    let prim_14_0'0 = PRIM_CharOrd(u_20) in
    k prim_14_0'0 in
  let u_18 = "fib " in
  let prim_12_0'0 = PRIM_Explode(u_18) in
  u_6 prim_12_0'0 k in
u_14 u_16 k
