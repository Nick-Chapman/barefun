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
let put_chars_2'8 =
  fix (fun put_chars_2'8 xs_2'18 ->
    match xs_2'18 with
    | Nil0 -> Unit0
    | Cons1(x_5'4,xsMore_5'7) ->
      let __5'27 = (put_char_0'0 x_5'4) in
      (put_chars_2'8 xsMore_5'7)) in
let put_string_7'4 = (fun s_7'15 -> (put_chars_2'8 (explode_0'0 s_7'15))) in
let reverse_9'4 =
  (fun ysStart_9'12 ->
    let revloop_10'10 =
      fix (fun revloop_10'10 acc_10'18 ->
        (fun ys_10'22 ->
          match ys_10'22 with
          | Nil0 -> acc_10'18
          | Cons1(y_13'6,ysMore_13'9) -> ((revloop_10'10 ((::_0'0 y_13'6) acc_10'18)) ysMore_13'9))) in
    ((revloop_10'10 Nil0) ysStart_9'12)) in
let newline_17'4 = (fun __17'12 -> (put_char_0'0 '\n')) in
let read_line_19'4 =
  (fun __19'14 ->
    let readloop_20'10 =
      fix (fun readloop_20'10 sofar_20'19 ->
        let theChar_21'8 = (get_char_0'0 Unit0) in
        let gotten_22'8 = theChar_21'8 in
        match ((eq_char_0'0 gotten_22'8) '\n') with
        | true1 ->
          let __23'42 = (newline_17'4 Unit0) in
          (reverse_9'4 sofar_20'19)
        | false0 ->
          let __24'22 = (put_char_0'0 gotten_22'8) in
          (readloop_20'10 ((::_0'0 gotten_22'8) sofar_20'19))) in
    (readloop_20'10 Nil0)) in
let __28'4 = (put_string_7'4 "LOAD\n") in
let mainloop_30'8 =
  fix (fun mainloop_30'8 __30'17 ->
    let __31'17 = (put_string_7'4 "> ") in
    let __32'26 = (put_chars_2'8 (read_line_19'4 Unit0)) in
    let __33'11 = (newline_17'4 Unit0) in
    (mainloop_30'8 Unit0)) in
let main_36'4 =
  (fun __36'9 ->
    let __37'20 = (put_string_7'4 "RUN\n") in
    let __38'6 = (mainloop_30'8 Unit0) in
    (put_string_7'4 "NEVER\n")) in
(main_36'4 Unit0)
