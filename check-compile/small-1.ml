(*stage1; un-normalized*)
let +_0'0 = (fun x_0'0 -> (fun y_0'0 -> PRIM_AddInt(x_0'0,y_0'0))) in
let -_0'0 = (fun x_0'0 -> (fun y_0'0 -> PRIM_SubInt(x_0'0,y_0'0))) in
let ( * )_0'0 = (fun x_0'0 -> (fun y_0'0 -> PRIM_MulInt(x_0'0,y_0'0))) in
let /_0'0 = (fun x_0'0 -> (fun y_0'0 -> PRIM_DivInt(x_0'0,y_0'0))) in
let %_0'0 = (fun x_0'0 -> (fun y_0'0 -> PRIM_ModInt(x_0'0,y_0'0))) in
let <_0'0 = (fun x_0'0 -> (fun y_0'0 -> PRIM_LessInt(x_0'0,y_0'0))) in
let =_0'0 = (fun x_0'0 -> (fun y_0'0 -> PRIM_EqInt(x_0'0,y_0'0))) in
let eq_char_0'0 = (fun x_0'0 -> (fun y_0'0 -> PRIM_EqChar(x_0'0,y_0'0))) in
let ord_0'0 = (fun x_0'0 -> PRIM_CharOrd(x_0'0)) in
let chr_0'0 = (fun x_0'0 -> PRIM_CharChr(x_0'0)) in
let explode_0'0 = (fun x_0'0 -> PRIM_Explode(x_0'0)) in
let put_char_0'0 = (fun x_0'0 -> PRIM_PutChar(x_0'0)) in
let get_char_0'0 = (fun x_0'0 -> PRIM_GetChar(x_0'0)) in
let ::_0'0 = (fun x_0'0 -> (fun y_0'0 -> Cons1(x_0'0, y_0'0))) in
let put_chars_2'8 = fix (fun put_chars_2'8 xs_2'18 ->
  match xs_2'18 with
  | Nil0 -> Unit0
  | Cons1(x_5'4,xsMore_5'7) ->
    let __5'27 = (put_char_0'0 x_5'4) in
    (put_chars_2'8 xsMore_5'7)) in
let put_string_7'4 = (fun s_7'15 -> (put_chars_2'8 (explode_0'0 s_7'15))) in
let reverse_9'4 = (fun ysStart_9'12 ->
  let revloop_10'10 = fix (fun revloop_10'10 acc_10'18 ->
    (fun ys_10'22 ->
      match ys_10'22 with
      | Nil0 -> acc_10'18
      | Cons1(y_13'6,ysMore_13'9) -> ((revloop_10'10 ((::_0'0 y_13'6) acc_10'18)) ysMore_13'9))) in
  ((revloop_10'10 Nil0) ysStart_9'12)) in
let newline_17'4 = (fun __17'12 -> (put_char_0'0 '\n')) in
let put_string_newline_19'4 = (fun s_19'23 ->
  let __20'14 = (put_string_7'4 s_19'23) in
  (newline_17'4 Unit0)) in
let read_line_23'4 = (fun __23'14 ->
  let readloop_24'10 = fix (fun readloop_24'10 sofar_24'19 ->
    let theChar_25'8 = (get_char_0'0 Unit0) in
    let gotten_26'8 = theChar_25'8 in
    match ((eq_char_0'0 gotten_26'8) '\n') with
    | true1 ->
      let __27'42 = (newline_17'4 Unit0) in
      (reverse_9'4 sofar_24'19)
    | false0 ->
      let __28'22 = (put_char_0'0 gotten_26'8) in
      (readloop_24'10 ((::_0'0 gotten_26'8) sofar_24'19))) in
  (readloop_24'10 Nil0)) in
let __32'4 = (put_string_newline_19'4 "LOAD") in
let mainloop_34'8 = fix (fun mainloop_34'8 __34'17 ->
  let __35'17 = (put_string_7'4 "> ") in
  let __36'26 = (put_chars_2'8 (read_line_23'4 Unit0)) in
  let __37'11 = (newline_17'4 Unit0) in
  (mainloop_34'8 Unit0)) in
let main_40'4 = (fun __40'9 ->
  let __41'26 = (put_string_newline_19'4 "RUN") in
  let __42'6 = (mainloop_34'8 Unit0) in
  (put_string_newline_19'4 "NEVER")) in
(main_40'4 Unit0)
