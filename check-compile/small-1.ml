(*stage1*)
let put_chars_6_2'8 =
  fix (fun put_chars_2_2'8 xs_1_2'18 ->
    match xs_1_2'18 with
    | Nil0 -> Unit0
    | Cons1(x_3_5'4,xsMore_4_5'7) ->
      let __5_5'27 = PRIM_PutChar(x_3_5'4) in
      (put_chars_2_2'8 xsMore_4_5'7)) in
let __8_28'4 =
  let s_7_7'15 = "LOAD\n" in
  (put_chars_6_2'8 PRIM_Explode(s_7_7'15)) in
let mainloop_34_30'8 =
  fix (fun mainloop_10_30'8 __9_30'17 ->
    let __12_31'17 =
      let s_11_7'15 = "> " in
      (put_chars_6_2'8 PRIM_Explode(s_11_7'15)) in
    let __30_32'26 =
      (put_chars_6_2'8
      let __13_19'14 = Unit0 in
      let readloop_29_20'10 =
        fix (fun readloop_15_20'10 sofar_14_20'19 ->
          let theChar_17_21'8 =
            let x_16_0'0 = Unit0 in
            PRIM_GetChar(x_16_0'0) in
          match let y_18_0'0 = '\n' in
          PRIM_EqChar(theChar_17_21'8,y_18_0'0) with
          | true1 ->
            let __21_23'42 =
              let __19_17'12 = Unit0 in
              let x_20_0'0 = '\n' in
              PRIM_PutChar(x_20_0'0) in
            let revloop_27_10'10 =
              fix (fun revloop_23_10'10 acc_22_10'18 ->
                (fun ys_24_10'22 ->
                  match ys_24_10'22 with
                  | Nil0 -> acc_22_10'18
                  | Cons1(y_25_13'6,ysMore_26_13'9) -> ((revloop_23_10'10 Cons1(y_25_13'6, acc_22_10'18)) ysMore_26_13'9))) in
            ((revloop_27_10'10 Nil0) sofar_14_20'19)
          | false0 ->
            let __28_24'22 = PRIM_PutChar(theChar_17_21'8) in
            (readloop_15_20'10 Cons1(theChar_17_21'8, sofar_14_20'19))) in
      (readloop_29_20'10 Nil0)) in
    let __33_33'11 =
      let __31_17'12 = Unit0 in
      let x_32_0'0 = '\n' in
      PRIM_PutChar(x_32_0'0) in
    (mainloop_10_30'8 Unit0)) in
let __35_36'9 = Unit0 in
let __37_37'20 =
  let s_36_7'15 = "RUN\n" in
  (put_chars_6_2'8 PRIM_Explode(s_36_7'15)) in
let __38_38'6 = (mainloop_34_30'8 Unit0) in
let s_39_7'15 = "NEVER\n" in
(put_chars_6_2'8 PRIM_Explode(s_39_7'15))
