(*stage1*)
let +_3_0'0 = (fun x_1_0'0 -> (fun y_2_0'0 -> PRIM_AddInt(x_1_0'0,y_2_0'0))) in
let -_6_0'0 = (fun x_4_0'0 -> (fun y_5_0'0 -> PRIM_SubInt(x_4_0'0,y_5_0'0))) in
let ( * )_9_0'0 = (fun x_7_0'0 -> (fun y_8_0'0 -> PRIM_MulInt(x_7_0'0,y_8_0'0))) in
let /_12_0'0 = (fun x_10_0'0 -> (fun y_11_0'0 -> PRIM_DivInt(x_10_0'0,y_11_0'0))) in
let %_15_0'0 = (fun x_13_0'0 -> (fun y_14_0'0 -> PRIM_ModInt(x_13_0'0,y_14_0'0))) in
let <_18_0'0 = (fun x_16_0'0 -> (fun y_17_0'0 -> PRIM_LessInt(x_16_0'0,y_17_0'0))) in
let =_21_0'0 = (fun x_19_0'0 -> (fun y_20_0'0 -> PRIM_EqInt(x_19_0'0,y_20_0'0))) in
let eq_char_24_0'0 = (fun x_22_0'0 -> (fun y_23_0'0 -> PRIM_EqChar(x_22_0'0,y_23_0'0))) in
let ord_26_0'0 = (fun x_25_0'0 -> PRIM_CharOrd(x_25_0'0)) in
let chr_28_0'0 = (fun x_27_0'0 -> PRIM_CharChr(x_27_0'0)) in
let explode_30_0'0 = (fun x_29_0'0 -> PRIM_Explode(x_29_0'0)) in
let put_char_32_0'0 = (fun x_31_0'0 -> PRIM_PutChar(x_31_0'0)) in
let get_char_34_0'0 = (fun x_33_0'0 -> PRIM_GetChar(x_33_0'0)) in
let ::_37_0'0 = (fun x_35_0'0 -> (fun y_36_0'0 -> Cons1(x_35_0'0, y_36_0'0))) in
let main_43_2'4 = let mainloop_42_3'10 = fix (fun mainloop_39_3'10 __38_3'19 ->
  let gotten_40_4'8 = (get_char_34_0'0 Unit0) in
  let __41_5'19 = (put_char_32_0'0 gotten_40_4'8) in
  (mainloop_39_3'10 Unit0)) in
mainloop_42_3'10 in
(main_43_2'4 Unit0)
