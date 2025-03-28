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
  let u_9 = 2 in
  let uLET_2_0'0 = PRIM_LessInt(n_7_22'12,u_9) in
  match uLET_2_0'0 with
  | true1 -> k n_7_22'12
  | false0 ->
    let u_10 = 1 in
    let uLET_4_0'0 = PRIM_SubInt(n_7_22'12,u_10) in
    let k [n_7_22'12,fib_8_22'8] u_11 =
      let uLET_3_0'0 = fun [u_11] f_12 k ->
        let prim_5_0'0 = PRIM_AddInt(u_11,f_12) in
        k prim_5_0'0 in
      let u_13 = 2 in
      let uLET_7_0'0 = PRIM_SubInt(n_7_22'12,u_13) in
      let k [uLET_3_0'0] app_6_24'39 = uLET_3_0'0 app_6_24'39 k in
      fib_8_22'8 uLET_7_0'0 k in
    fib_8_22'8 uLET_4_0'0 k) in
let u_15 = Unit0 in
let u_16 = 20 in
let k [u_6,u_16] u_17 =
  let u_18 = "fib " in
  let prim_8_0'0 = PRIM_Explode(u_18) in
  let k [u_6,u_16,u_17] u_19 =
    let u_20 = '0' in
    let u_21 = PRIM_CharOrd(u_20) in
    let u_32 = fix (fun [u_21] loop_23_5'10 acc_22_5'15 k ->
      let lam_16_0'0 = fun [u_21,acc_22_5'15,loop_23_5'10] f_24 k ->
        let u_25 = 0 in
        let uLET_10_0'0 = PRIM_EqInt(f_24,u_25) in
        match uLET_10_0'0 with
        | true1 -> k acc_22_5'15
        | false0 ->
          let u_26 = 10 in
          let u_27 = PRIM_ModInt(f_24,u_26) in
          let u_28 = PRIM_AddInt(u_21,u_27) in
          let u_29 = PRIM_CharChr(u_28) in
          let uLET_13_0'0 = fun [u_29] f_30 k ->
            let con_14_0'0 = Cons1[u_29,f_30] in
            k con_14_0'0 in
          let k [loop_23_5'10,f_24] app_12_7'36 =
            let k [f_24] app_11_7'11 =
              let u_31 = 10 in
              let uLET_15_0'0 = PRIM_DivInt(f_24,u_31) in
              app_11_7'11 uLET_15_0'0 k in
            loop_23_5'10 app_12_7'36 k in
          uLET_13_0'0 acc_22_5'15 k in
      k lam_16_0'0) in
    let u_33 = 0 in
    let uLET_17_0'0 = PRIM_EqInt(u_16,u_33) in
    let k [u_6,u_17] uLET_9_0'0 =
      let k [u_6,u_17] u_34 =
        let u_35 = " --> " in
        let prim_23_0'0 = PRIM_Explode(u_35) in
        let k [u_6,u_17] u_36 =
          let u_37 = '0' in
          let u_38 = PRIM_CharOrd(u_37) in
          let u_49 = fix (fun [u_38] loop_40_5'10 acc_39_5'15 k ->
            let lam_31_0'0 = fun [u_38,acc_39_5'15,loop_40_5'10] f_41 k ->
              let u_42 = 0 in
              let uLET_25_0'0 = PRIM_EqInt(f_41,u_42) in
              match uLET_25_0'0 with
              | true1 -> k acc_39_5'15
              | false0 ->
                let u_43 = 10 in
                let u_44 = PRIM_ModInt(f_41,u_43) in
                let u_45 = PRIM_AddInt(u_38,u_44) in
                let u_46 = PRIM_CharChr(u_45) in
                let uLET_28_0'0 = fun [u_46] f_47 k ->
                  let con_29_0'0 = Cons1[u_46,f_47] in
                  k con_29_0'0 in
                let k [loop_40_5'10,f_41] app_27_7'36 =
                  let k [f_41] app_26_7'11 =
                    let u_48 = 10 in
                    let uLET_30_0'0 = PRIM_DivInt(f_41,u_48) in
                    app_26_7'11 uLET_30_0'0 k in
                  loop_40_5'10 app_27_7'36 k in
                uLET_28_0'0 acc_39_5'15 k in
            k lam_31_0'0) in
          let u_50 = 0 in
          let uLET_32_0'0 = PRIM_EqInt(u_17,u_50) in
          let k [u_6] uLET_24_0'0 =
            let k [] u_51 =
              let u_52 = Unit0 in
              let u_53 = '\n' in
              let prim_38_0'0 = PRIM_PutChar(u_53) in
              k prim_38_0'0 in
            u_6 uLET_24_0'0 k in
          match uLET_32_0'0 with
          | true1 ->
            let lit_33_9'17 = '0' in
            let con_34_9'20 = Nil0 in
            let con_35_9'17 = Cons1[lit_33_9'17,con_34_9'20] in
            k con_35_9'17
          | false0 ->
            let con_37_9'32 = Nil0 in
            let k [u_17] app_36_9'32 = app_36_9'32 u_17 k in
            u_49 con_37_9'32 k in
        u_6 prim_23_0'0 k in
      u_6 uLET_9_0'0 k in
    match uLET_17_0'0 with
    | true1 ->
      let lit_18_9'17 = '0' in
      let con_19_9'20 = Nil0 in
      let con_20_9'17 = Cons1[lit_18_9'17,con_19_9'20] in
      k con_20_9'17
    | false0 ->
      let con_22_9'32 = Nil0 in
      let k [u_16] app_21_9'32 = app_21_9'32 u_16 k in
      u_32 con_22_9'32 k in
  u_6 prim_8_0'0 k in
u_14 u_16 k
