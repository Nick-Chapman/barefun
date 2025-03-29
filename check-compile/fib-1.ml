(*stage1*)
let put_chars_6_11'8 =
  fix (fun put_chars_2_11'8 xs_1_11'18 ->
    match xs_1_11'18 with
    | Nil0 -> Unit0
    | Cons1(x_3_14'4,xs_4_14'7) ->
      let __5_14'23 = PRIM_PutChar(x_3_14'4) in
      (put_chars_2_11'8 xs_4_14'7)) in
let fib_14_22'8 =
  fix (fun fib_8_22'8 n_7_22'12 ->
    match let y_9_0'0 = 2 in
    PRIM_LessInt(n_7_22'12,y_9_0'0) with
    | true1 -> n_7_22'12
    | false0 ->
      (let x_11_0'0 =
        (fib_8_22'8
        let y_10_0'0 = 1 in
        PRIM_SubInt(n_7_22'12,y_10_0'0)) in
      (fun y_12_0'0 -> PRIM_AddInt(x_11_0'0,y_12_0'0))
      (fib_8_22'8
      let y_13_0'0 = 2 in
      PRIM_SubInt(n_7_22'12,y_13_0'0)))) in
let __15_34'9 = Unit0 in
let n_16_26'11 = 20 in
let res_17_27'6 = (fib_14_22'8 n_16_26'11) in
let __19_28'19 =
  let s_18_16'15 = "fib " in
  (put_chars_6_11'8 PRIM_Explode(s_18_16'15)) in
let __34_29'11 =
  (put_chars_6_11'8
  let ord0_21_3'6 =
    let x_20_0'0 = '0' in
    PRIM_CharOrd(x_20_0'0) in
  let loop_32_5'10 =
    fix (fun loop_23_5'10 acc_22_5'15 ->
      (fun i_24_5'19 ->
        match let y_25_0'0 = 0 in
        PRIM_EqInt(i_24_5'19,y_25_0'0) with
        | true1 -> acc_22_5'15
        | false0 ->
          ((loop_23_5'10
          (let x_29_0'0 =
            let c_27_4'20 =
              let y_26_0'0 = 10 in
              PRIM_ModInt(i_24_5'19,y_26_0'0) in
            let x_28_0'0 = PRIM_AddInt(ord0_21_3'6,c_27_4'20) in
            PRIM_CharChr(x_28_0'0) in
          (fun y_30_0'0 -> Cons1(x_29_0'0, y_30_0'0))
          acc_22_5'15))
          let y_31_0'0 = 10 in
          PRIM_DivInt(i_24_5'19,y_31_0'0)))) in
  match let y_33_0'0 = 0 in
  PRIM_EqInt(n_16_26'11,y_33_0'0) with
  | true1 -> Cons1('0', Nil0)
  | false0 -> ((loop_32_5'10 Nil0) n_16_26'11)) in
let __36_30'20 =
  let s_35_16'15 = " --> " in
  (put_chars_6_11'8 PRIM_Explode(s_35_16'15)) in
let __51_31'13 =
  (put_chars_6_11'8
  let ord0_38_3'6 =
    let x_37_0'0 = '0' in
    PRIM_CharOrd(x_37_0'0) in
  let loop_49_5'10 =
    fix (fun loop_40_5'10 acc_39_5'15 ->
      (fun i_41_5'19 ->
        match let y_42_0'0 = 0 in
        PRIM_EqInt(i_41_5'19,y_42_0'0) with
        | true1 -> acc_39_5'15
        | false0 ->
          ((loop_40_5'10
          (let x_46_0'0 =
            let c_44_4'20 =
              let y_43_0'0 = 10 in
              PRIM_ModInt(i_41_5'19,y_43_0'0) in
            let x_45_0'0 = PRIM_AddInt(ord0_38_3'6,c_44_4'20) in
            PRIM_CharChr(x_45_0'0) in
          (fun y_47_0'0 -> Cons1(x_46_0'0, y_47_0'0))
          acc_39_5'15))
          let y_48_0'0 = 10 in
          PRIM_DivInt(i_41_5'19,y_48_0'0)))) in
  match let y_50_0'0 = 0 in
  PRIM_EqInt(res_17_27'6,y_50_0'0) with
  | true1 -> Cons1('0', Nil0)
  | false0 -> ((loop_49_5'10 Nil0) res_17_27'6)) in
let __52_20'12 = Unit0 in
let x_53_0'0 = '\n' in
PRIM_PutChar(x_53_0'0)
