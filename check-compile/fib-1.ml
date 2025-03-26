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
let chars_of_int_2'4 = (fun i_2'17 ->
  let ord0_3'6 = (ord_0'0 '0') in
  let char_of_digit_4'6 = (fun c_4'20 -> (chr_0'0 ((+_0'0 ord0_3'6) c_4'20))) in
  let loop_5'10 = fix (fun loop_5'10 acc_5'15 ->
    (fun i_5'19 ->
      match ((=_0'0 i_5'19) 0) with
      | true1 -> acc_5'15
      | false0 -> ((loop_5'10 ((::_0'0 (char_of_digit_4'6 ((%_0'0 i_5'19) 10))) acc_5'15)) ((/_0'0 i_5'19) 10)))) in
  match ((=_0'0 i_2'17) 0) with
  | true1 -> Cons1('0', Nil0)
  | false0 -> ((loop_5'10 Nil0) i_2'17)) in
let put_chars_11'8 = fix (fun put_chars_11'8 xs_11'18 ->
  match xs_11'18 with
  | Nil0 -> Unit0
  | Cons1(x_14'4,xs_14'7) ->
    let __14'23 = (put_char_0'0 x_14'4) in
    (put_chars_11'8 xs_14'7)) in
let put_string_16'4 = (fun s_16'15 -> (put_chars_11'8 (explode_0'0 s_16'15))) in
let put_int_18'4 = (fun i_18'12 -> (put_chars_11'8 (chars_of_int_2'4 i_18'12))) in
let newline_20'4 = (fun __20'12 -> (put_char_0'0 '\n')) in
let fib_22'8 = fix (fun fib_22'8 n_22'12 ->
  match ((<_0'0 n_22'12) 2) with
  | true1 -> n_22'12
  | false0 -> ((+_0'0 (fib_22'8 ((-_0'0 n_22'12) 1))) (fib_22'8 ((-_0'0 n_22'12) 2)))) in
let runfib_26'4 = (fun n_26'11 ->
  let res_27'6 = (fib_22'8 n_26'11) in
  let __28'19 = (put_string_16'4 "fib ") in
  let __29'11 = (put_int_18'4 n_26'11) in
  let __30'20 = (put_string_16'4 " --> ") in
  let __31'13 = (put_int_18'4 res_27'6) in
  (newline_20'4 Unit0)) in
let main_34'4 = (fun __34'9 -> (runfib_26'4 20)) in
(main_34'4 Unit0)
