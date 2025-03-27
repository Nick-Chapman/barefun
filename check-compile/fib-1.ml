(*stage1*)
let u_6 = fix (fun put_chars_2_11'8 xs_1_11'18 ->
  match xs_1_11'18 with
  | Nil0 -> Unit0
  | Cons1(x_3_14'4,xs_4_14'7) ->
    let u_5 = PRIM_PutChar(x_3_14'4) in
    (put_chars_2_11'8 xs_4_14'7)) in
let u_14 = fix (fun fib_8_22'8 n_7_22'12 ->
  match let u_9 = 2 in
  PRIM_LessInt(n_7_22'12,u_9) with
  | true1 -> n_7_22'12
  | false0 ->
    (let u_11 = (fib_8_22'8
    let u_10 = 1 in
    PRIM_SubInt(n_7_22'12,u_10)) in
    (fun f_12 -> PRIM_AddInt(u_11,f_12))
    (fib_8_22'8
    let u_13 = 2 in
    PRIM_SubInt(n_7_22'12,u_13)))) in
let u_15 = Unit0 in
let u_16 = 20 in
let u_17 = (u_14 u_16) in
let u_19 = let u_18 = "fib " in
(u_6 PRIM_Explode(u_18)) in
let u_34 = (u_6
let u_21 = let u_20 = '0' in
PRIM_CharOrd(u_20) in
let u_32 = fix (fun loop_23_5'10 acc_22_5'15 ->
  (fun f_24 ->
    match let u_25 = 0 in
    PRIM_EqInt(f_24,u_25) with
    | true1 -> acc_22_5'15
    | false0 ->
      ((loop_23_5'10
      (let u_29 = let u_27 = let u_26 = 10 in
      PRIM_ModInt(f_24,u_26) in
      let u_28 = PRIM_AddInt(u_21,u_27) in
      PRIM_CharChr(u_28) in
      (fun f_30 -> Cons1(u_29, f_30))
      acc_22_5'15))
      let u_31 = 10 in
      PRIM_DivInt(f_24,u_31)))) in
match let u_33 = 0 in
PRIM_EqInt(u_16,u_33) with
| true1 -> Cons1('0', Nil0)
| false0 -> ((u_32 Nil0) u_16)) in
let u_36 = let u_35 = " --> " in
(u_6 PRIM_Explode(u_35)) in
let u_51 = (u_6
let u_38 = let u_37 = '0' in
PRIM_CharOrd(u_37) in
let u_49 = fix (fun loop_40_5'10 acc_39_5'15 ->
  (fun f_41 ->
    match let u_42 = 0 in
    PRIM_EqInt(f_41,u_42) with
    | true1 -> acc_39_5'15
    | false0 ->
      ((loop_40_5'10
      (let u_46 = let u_44 = let u_43 = 10 in
      PRIM_ModInt(f_41,u_43) in
      let u_45 = PRIM_AddInt(u_38,u_44) in
      PRIM_CharChr(u_45) in
      (fun f_47 -> Cons1(u_46, f_47))
      acc_39_5'15))
      let u_48 = 10 in
      PRIM_DivInt(f_41,u_48)))) in
match let u_50 = 0 in
PRIM_EqInt(u_17,u_50) with
| true1 -> Cons1('0', Nil0)
| false0 -> ((u_49 Nil0) u_17)) in
let u_52 = Unit0 in
let u_53 = '\n' in
PRIM_PutChar(u_53)
