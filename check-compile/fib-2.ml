(*stage2*)
let k () = ()
let put_chars_6_11'8 = fix (fun [] put_chars_2_11'8 xs_1_11'18 k ->
  match xs_1_11'18 with
  | Nil0 ->
    let con_1_13'10 = Unit0 in
    k con_1_13'10
  | Cons1(x_3_14'4,xs_4_14'7) ->
    let __5_14'23 = PRIM_PutChar(x_3_14'4) in
    put_chars_2_11'8 xs_4_14'7 k) in
let fib_14_22'8 = fix (fun [] fib_8_22'8 n_7_22'12 k ->
  let y_9_0'0 = 2 in
  let uLET_2_0'0 = PRIM_LessInt(n_7_22'12,y_9_0'0) in
  match uLET_2_0'0 with
  | true1 -> k n_7_22'12
  | false0 ->
    let y_10_0'0 = 1 in
    let uLET_4_0'0 = PRIM_SubInt(n_7_22'12,y_10_0'0) in
    let k [n_7_22'12,fib_8_22'8] x_11_0'0 =
      let uLET_3_0'0 = fun [x_11_0'0] y_12_0'0 k ->
        let prim_5_0'0 = PRIM_AddInt(x_11_0'0,y_12_0'0) in
        k prim_5_0'0 in
      let y_13_0'0 = 2 in
      let uLET_7_0'0 = PRIM_SubInt(n_7_22'12,y_13_0'0) in
      let k [uLET_3_0'0] app_6_24'39 = uLET_3_0'0 app_6_24'39 k in
      fib_8_22'8 uLET_7_0'0 k in
    fib_8_22'8 uLET_4_0'0 k) in
let __15_34'9 = Unit0 in
let n_16_26'11 = 20 in
let k [put_chars_6_11'8,n_16_26'11] res_17_27'6 =
  let s_18_16'15 = "fib " in
  let prim_8_0'0 = PRIM_Explode(s_18_16'15) in
  let k [put_chars_6_11'8,n_16_26'11,res_17_27'6] __19_28'19 =
    let x_20_0'0 = '0' in
    let ord0_21_3'6 = PRIM_CharOrd(x_20_0'0) in
    let loop_32_5'10 = fix (fun [ord0_21_3'6] loop_23_5'10 acc_22_5'15 k ->
      let lam_16_5'19 = fun [ord0_21_3'6,acc_22_5'15,loop_23_5'10] i_24_5'19 k ->
        let y_25_0'0 = 0 in
        let uLET_10_0'0 = PRIM_EqInt(i_24_5'19,y_25_0'0) in
        match uLET_10_0'0 with
        | true1 -> k acc_22_5'15
        | false0 ->
          let y_26_0'0 = 10 in
          let c_27_4'20 = PRIM_ModInt(i_24_5'19,y_26_0'0) in
          let x_28_0'0 = PRIM_AddInt(ord0_21_3'6,c_27_4'20) in
          let x_29_0'0 = PRIM_CharChr(x_28_0'0) in
          let uLET_13_0'0 = fun [x_29_0'0] y_30_0'0 k ->
            let con_14_0'0 = Cons1[x_29_0'0,y_30_0'0] in
            k con_14_0'0 in
          let k [loop_23_5'10,i_24_5'19] app_12_7'36 =
            let k [i_24_5'19] app_11_7'11 =
              let y_31_0'0 = 10 in
              let uLET_15_0'0 = PRIM_DivInt(i_24_5'19,y_31_0'0) in
              app_11_7'11 uLET_15_0'0 k in
            loop_23_5'10 app_12_7'36 k in
          uLET_13_0'0 acc_22_5'15 k in
      k lam_16_5'19) in
    let y_33_0'0 = 0 in
    let uLET_17_0'0 = PRIM_EqInt(n_16_26'11,y_33_0'0) in
    let k [put_chars_6_11'8,res_17_27'6] uLET_9_3'6 =
      let k [put_chars_6_11'8,res_17_27'6] __34_29'11 =
        let s_35_16'15 = " --> " in
        let prim_23_0'0 = PRIM_Explode(s_35_16'15) in
        let k [put_chars_6_11'8,res_17_27'6] __36_30'20 =
          let x_37_0'0 = '0' in
          let ord0_38_3'6 = PRIM_CharOrd(x_37_0'0) in
          let loop_49_5'10 = fix (fun [ord0_38_3'6] loop_40_5'10 acc_39_5'15 k ->
            let lam_31_5'19 = fun [ord0_38_3'6,acc_39_5'15,loop_40_5'10] i_41_5'19 k ->
              let y_42_0'0 = 0 in
              let uLET_25_0'0 = PRIM_EqInt(i_41_5'19,y_42_0'0) in
              match uLET_25_0'0 with
              | true1 -> k acc_39_5'15
              | false0 ->
                let y_43_0'0 = 10 in
                let c_44_4'20 = PRIM_ModInt(i_41_5'19,y_43_0'0) in
                let x_45_0'0 = PRIM_AddInt(ord0_38_3'6,c_44_4'20) in
                let x_46_0'0 = PRIM_CharChr(x_45_0'0) in
                let uLET_28_0'0 = fun [x_46_0'0] y_47_0'0 k ->
                  let con_29_0'0 = Cons1[x_46_0'0,y_47_0'0] in
                  k con_29_0'0 in
                let k [loop_40_5'10,i_41_5'19] app_27_7'36 =
                  let k [i_41_5'19] app_26_7'11 =
                    let y_48_0'0 = 10 in
                    let uLET_30_0'0 = PRIM_DivInt(i_41_5'19,y_48_0'0) in
                    app_26_7'11 uLET_30_0'0 k in
                  loop_40_5'10 app_27_7'36 k in
                uLET_28_0'0 acc_39_5'15 k in
            k lam_31_5'19) in
          let y_50_0'0 = 0 in
          let uLET_32_0'0 = PRIM_EqInt(res_17_27'6,y_50_0'0) in
          let k [put_chars_6_11'8] uLET_24_3'6 =
            let k [] __51_31'13 =
              let __52_20'12 = Unit0 in
              let x_53_0'0 = '\n' in
              let prim_38_0'0 = PRIM_PutChar(x_53_0'0) in
              k prim_38_0'0 in
            put_chars_6_11'8 uLET_24_3'6 k in
          match uLET_32_0'0 with
          | true1 ->
            let lit_33_9'17 = '0' in
            let con_34_9'20 = Nil0 in
            let con_35_9'17 = Cons1[lit_33_9'17,con_34_9'20] in
            k con_35_9'17
          | false0 ->
            let con_37_9'32 = Nil0 in
            let k [res_17_27'6] app_36_9'32 = app_36_9'32 res_17_27'6 k in
            loop_49_5'10 con_37_9'32 k in
        put_chars_6_11'8 prim_23_0'0 k in
      put_chars_6_11'8 uLET_9_3'6 k in
    match uLET_17_0'0 with
    | true1 ->
      let lit_18_9'17 = '0' in
      let con_19_9'20 = Nil0 in
      let con_20_9'17 = Cons1[lit_18_9'17,con_19_9'20] in
      k con_20_9'17
    | false0 ->
      let con_22_9'32 = Nil0 in
      let k [n_16_26'11] app_21_9'32 = app_21_9'32 n_16_26'11 k in
      loop_32_5'10 con_22_9'32 k in
  put_chars_6_11'8 prim_8_0'0 k in
fib_14_22'8 n_16_26'11 k
