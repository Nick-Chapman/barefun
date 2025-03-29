(*stage2*)
let k () = ()
let put_chars_6_2'8 = fix (fun [] put_chars_2_2'8 xs_1_2'18 k ->
  match xs_1_2'18 with
  | Nil0 ->
    let con_1_4'10 = Unit0 in
    k con_1_4'10
  | Cons1(x_3_5'4,xsMore_4_5'7) ->
    let __5_5'27 = PRIM_PutChar(x_3_5'4) in
    put_chars_2_2'8 xsMore_4_5'7 k) in
let s_7_7'15 = "LOAD\n" in
let prim_2_0'0 = PRIM_Explode(s_7_7'15) in
let k [put_chars_6_2'8] __8_28'4 =
  let mainloop_34_30'8 = fix (fun [put_chars_6_2'8] mainloop_10_30'8 __9_30'17 k ->
    let s_11_7'15 = "> " in
    let prim_3_0'0 = PRIM_Explode(s_11_7'15) in
    let k [put_chars_6_2'8,mainloop_10_30'8] __12_31'17 =
      let __13_19'14 = Unit0 in
      let readloop_29_20'10 = fix (fun [] readloop_15_20'10 sofar_14_20'19 k ->
        let x_16_0'0 = Unit0 in
        let theChar_17_21'8 = PRIM_GetChar(x_16_0'0) in
        let y_18_0'0 = '\n' in
        let uLET_5_0'0 = PRIM_EqChar(theChar_17_21'8,y_18_0'0) in
        match uLET_5_0'0 with
        | true1 ->
          let __19_17'12 = Unit0 in
          let x_20_0'0 = '\n' in
          let __21_23'42 = PRIM_PutChar(x_20_0'0) in
          let revloop_27_10'10 = fix (fun [] revloop_23_10'10 acc_22_10'18 k ->
            let lam_8_10'22 = fun [acc_22_10'18,revloop_23_10'10] ys_24_10'22 k ->
              match ys_24_10'22 with
              | Nil0 -> k acc_22_10'18
              | Cons1(y_25_13'6,ysMore_26_13'9) ->
                let con_7_0'0 = Cons1[y_25_13'6,acc_22_10'18] in
                let k [ysMore_26_13'9] app_6_13'27 = app_6_13'27 ysMore_26_13'9 k in
                revloop_23_10'10 con_7_0'0 k in
            k lam_8_10'22) in
          let con_10_15'10 = Nil0 in
          let k [sofar_14_20'19] app_9_15'10 = app_9_15'10 sofar_14_20'19 k in
          revloop_27_10'10 con_10_15'10 k
        | false0 ->
          let __28_24'22 = PRIM_PutChar(theChar_17_21'8) in
          let con_11_0'0 = Cons1[theChar_17_21'8,sofar_14_20'19] in
          readloop_15_20'10 con_11_0'0 k) in
      let con_12_26'11 = Nil0 in
      let k [put_chars_6_2'8,mainloop_10_30'8] uLET_4_19'14 =
        let k [mainloop_10_30'8] __30_32'26 =
          let __31_17'12 = Unit0 in
          let x_32_0'0 = '\n' in
          let __33_33'11 = PRIM_PutChar(x_32_0'0) in
          let con_13_34'10 = Unit0 in
          mainloop_10_30'8 con_13_34'10 k in
        put_chars_6_2'8 uLET_4_19'14 k in
      readloop_29_20'10 con_12_26'11 k in
    put_chars_6_2'8 prim_3_0'0 k) in
  let __35_36'9 = Unit0 in
  let s_36_7'15 = "RUN\n" in
  let prim_14_0'0 = PRIM_Explode(s_36_7'15) in
  let k [put_chars_6_2'8,mainloop_34_30'8] __37_37'20 =
    let con_15_38'20 = Unit0 in
    let k [put_chars_6_2'8] __38_38'6 =
      let s_39_7'15 = "NEVER\n" in
      let prim_16_0'0 = PRIM_Explode(s_39_7'15) in
      put_chars_6_2'8 prim_16_0'0 k in
    mainloop_34_30'8 con_15_38'20 k in
  put_chars_6_2'8 prim_14_0'0 k in
put_chars_6_2'8 prim_2_0'0 k
