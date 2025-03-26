(*stage1*)
let +_3 = (fun x_1 -> (fun y_2 -> PRIM_AddInt(x_1,y_2))) in
let -_6 = (fun x_4 -> (fun y_5 -> PRIM_SubInt(x_4,y_5))) in
let ( * )_9 = (fun x_7 -> (fun y_8 -> PRIM_MulInt(x_7,y_8))) in
let /_12 = (fun x_10 -> (fun y_11 -> PRIM_DivInt(x_10,y_11))) in
let %_15 = (fun x_13 -> (fun y_14 -> PRIM_ModInt(x_13,y_14))) in
let <_18 = (fun x_16 -> (fun y_17 -> PRIM_LessInt(x_16,y_17))) in
let =_21 = (fun x_19 -> (fun y_20 -> PRIM_EqInt(x_19,y_20))) in
let eq_char_24 = (fun x_22 -> (fun y_23 -> PRIM_EqChar(x_22,y_23))) in
let ord_26 = (fun x_25 -> PRIM_CharOrd(x_25)) in
let chr_28 = (fun x_27 -> PRIM_CharChr(x_27)) in
let explode_30 = (fun x_29 -> PRIM_Explode(x_29)) in
let put_char_32 = (fun x_31 -> PRIM_PutChar(x_31)) in
let get_char_34 = (fun x_33 -> PRIM_GetChar(x_33)) in
let ::_37 = (fun x_35 -> (fun y_36 -> Cons1(x_35, y_36))) in
let main_43 = let mainloop_42 = fix (fun mainloop_39 __38 ->
  let gotten_40 = (get_char_34 Unit0) in
  let __41 = (put_char_32 gotten_40) in
  (mainloop_39 Unit0)) in
mainloop_42 in
(main_43 Unit0)
