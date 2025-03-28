(*stage2*)
let k () = ()
let u_6 = fix (fun [] put_chars_2_2'8 xs_1_2'18 k ->
  match xs_1_2'18 with
  | Nil0 ->
    let con_1_4'10 = Unit0 in
    k con_1_4'10
  | Cons1(x_3_5'4,xsMore_4_5'7) ->
    let u_5 = PRIM_PutChar(x_3_5'4) in
    put_chars_2_2'8 xsMore_4_5'7 k) in
let u_7 = "LOAD\n" in
let prim_2_0'0 = PRIM_Explode(u_7) in
let k [u_6] u_8 =
  let u_34 = fix (fun [u_6] mainloop_10_30'8 __9_30'17 k ->
    let u_11 = "> " in
    let prim_3_0'0 = PRIM_Explode(u_11) in
    let k [u_6,mainloop_10_30'8] u_12 =
      let u_13 = Unit0 in
      let u_29 = fix (fun [] readloop_15_20'10 sofar_14_20'19 k ->
        let u_16 = Unit0 in
        let u_17 = PRIM_GetChar(u_16) in
        let u_18 = '\n' in
        let uLET_5_0'0 = PRIM_EqChar(u_17,u_18) in
        match uLET_5_0'0 with
        | true1 ->
          let u_19 = Unit0 in
          let u_20 = '\n' in
          let u_21 = PRIM_PutChar(u_20) in
          let u_27 = fix (fun [] revloop_23_10'10 acc_22_10'18 k ->
            let lam_8_0'0 = fun [acc_22_10'18,revloop_23_10'10] f_24 k ->
              match f_24 with
              | Nil0 -> k acc_22_10'18
              | Cons1(y_25_13'6,ysMore_26_13'9) ->
                let con_7_0'0 = Cons1[y_25_13'6,acc_22_10'18] in
                let k [ysMore_26_13'9] app_6_13'27 = app_6_13'27 ysMore_26_13'9 k in
                revloop_23_10'10 con_7_0'0 k in
            k lam_8_0'0) in
          let con_10_15'10 = Nil0 in
          let k [sofar_14_20'19] app_9_15'10 = app_9_15'10 sofar_14_20'19 k in
          u_27 con_10_15'10 k
        | false0 ->
          let u_28 = PRIM_PutChar(u_17) in
          let con_11_0'0 = Cons1[u_17,sofar_14_20'19] in
          readloop_15_20'10 con_11_0'0 k) in
      let con_12_26'11 = Nil0 in
      let k [u_6,mainloop_10_30'8] uLET_4_0'0 =
        let k [mainloop_10_30'8] u_30 =
          let u_31 = Unit0 in
          let u_32 = '\n' in
          let u_33 = PRIM_PutChar(u_32) in
          let con_13_34'10 = Unit0 in
          mainloop_10_30'8 con_13_34'10 k in
        u_6 uLET_4_0'0 k in
      u_29 con_12_26'11 k in
    u_6 prim_3_0'0 k) in
  let u_35 = Unit0 in
  let u_36 = "RUN\n" in
  let prim_14_0'0 = PRIM_Explode(u_36) in
  let k [u_6,u_34] u_37 =
    let con_15_38'20 = Unit0 in
    let k [u_6] u_38 =
      let u_39 = "NEVER\n" in
      let prim_16_0'0 = PRIM_Explode(u_39) in
      u_6 prim_16_0'0 k in
    u_34 con_15_38'20 k in
  u_6 prim_14_0'0 k in
u_6 prim_2_0'0 k
