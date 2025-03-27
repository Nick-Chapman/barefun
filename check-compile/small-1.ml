(*stage1*)
let u_6 = fix (fun put_chars_2_2'8 xs_1_2'18 ->
  match xs_1_2'18 with
  | Nil0 -> Unit0
  | Cons1(x_3_5'4,xsMore_4_5'7) ->
    let u_5 = PRIM_PutChar(x_3_5'4) in
    (put_chars_2_2'8 xsMore_4_5'7)) in
let u_8 = let u_7 = "LOAD\n" in
(u_6 PRIM_Explode(u_7)) in
let u_34 = fix (fun mainloop_10_30'8 __9_30'17 ->
  let u_12 = let u_11 = "> " in
  (u_6 PRIM_Explode(u_11)) in
  let u_30 = (u_6
  let u_13 = Unit0 in
  let u_29 = fix (fun readloop_15_20'10 sofar_14_20'19 ->
    let u_17 = let u_16 = Unit0 in
    PRIM_GetChar(u_16) in
    match let u_18 = '\n' in
    PRIM_EqChar(u_17,u_18) with
    | true1 ->
      let u_21 = let u_19 = Unit0 in
      let u_20 = '\n' in
      PRIM_PutChar(u_20) in
      let u_27 = fix (fun revloop_23_10'10 acc_22_10'18 ->
        (fun f_24 ->
          match f_24 with
          | Nil0 -> acc_22_10'18
          | Cons1(y_25_13'6,ysMore_26_13'9) -> ((revloop_23_10'10 Cons1(y_25_13'6, acc_22_10'18)) ysMore_26_13'9))) in
      ((u_27 Nil0) sofar_14_20'19)
    | false0 ->
      let u_28 = PRIM_PutChar(u_17) in
      (readloop_15_20'10 Cons1(u_17, sofar_14_20'19))) in
  (u_29 Nil0)) in
  let u_33 = let u_31 = Unit0 in
  let u_32 = '\n' in
  PRIM_PutChar(u_32) in
  (mainloop_10_30'8 Unit0)) in
let u_35 = Unit0 in
let u_37 = let u_36 = "RUN\n" in
(u_6 PRIM_Explode(u_36)) in
let u_38 = (u_34 Unit0) in
let u_39 = "NEVER\n" in
(u_6 PRIM_Explode(u_39))
