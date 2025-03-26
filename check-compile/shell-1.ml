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
let not_2'4 = (fun b_2'8 ->
  match b_2'8 with
  | true1 -> false0
  | false0 -> true1) in
let >_7'4 = (fun a_7'8 -> (fun b_7'10 -> ((<_0'0 b_7'10) a_7'8))) in
let <=_8'4 = (fun a_8'9 -> (fun b_8'11 -> (not_2'4 ((<_0'0 b_8'11) a_8'9)))) in
let >=_9'4 = (fun a_9'9 -> (fun b_9'11 -> (not_2'4 ((<_0'0 a_9'9) b_9'11)))) in
let put_char_12'4 = (fun c_12'13 ->
  let backspace_13'6 = 8 in
  let n_14'6 = (ord_0'0 c_12'13) in
  match ((=_0'0 n_14'6) backspace_13'6) with
  | true1 -> (put_char_0'0 c_12'13)
  | false0 ->
    match ((eq_char_0'0 c_12'13) '\n') with
    | true1 -> (put_char_0'0 c_12'13)
    | false0 ->
      match ((>_7'4 n_14'6) 26) with
      | true1 -> (put_char_0'0 c_12'13)
      | false0 ->
        let __18'21 = (put_char_0'0 '^') in
        (put_char_0'0 (chr_0'0 ((-_0'0 ((+_0'0 (ord_0'0 'A')) n_14'6)) 1)))) in
let erase_char_20'4 = (fun __20'15 ->
  let backspace_21'6 = (chr_0'0 8) in
  let __23'20 = (put_char_12'4 backspace_21'6) in
  let __24'14 = (put_char_12'4 ' ') in
  (put_char_12'4 backspace_21'6)) in
let parse_digit_29'4 = (fun c_29'16 ->
  let n_30'6 = ((-_0'0 (ord_0'0 c_29'16)) (ord_0'0 '0')) in
  match ((>=_9'4 n_30'6) 0) with
  | true1 ->
    match ((<=_8'4 n_30'6) 9) with
    | true1 -> Some0(n_30'6)
    | false0 -> None1
  | false0 -> None1) in
let parse_num_34'4 = (fun s_34'14 ->
  let loop_35'10 = fix (fun loop_35'10 acc_35'15 ->
    (fun xs_35'19 ->
      match xs_35'19 with
      | Nil0 -> Some0(acc_35'15)
      | Cons1(x_38'6,xs_38'9) ->
        match (parse_digit_29'4 x_38'6) with
        | None1 -> None1
        | Some0(d_41'15) -> ((loop_35'10 ((+_0'0 ((( * )_0'0 10) acc_35'15)) d_41'15)) xs_38'9))) in
  ((loop_35'10 0) s_34'14)) in
let cons_45'4 = (fun x_45'9 -> (fun xs_45'11 -> ((::_0'0 x_45'9) xs_45'11))) in
let eq_list_47'8 = fix (fun eq_list_47'8 eq_47'16 ->
  (fun xs_47'19 ->
    (fun ys_47'22 ->
      match xs_47'19 with
      | Nil0 ->
        match ys_47'22 with
        | Nil0 -> true1
        | Cons1(__49'40,__49'43) -> false0
      | Cons1(x_50'4,xs_50'7) ->
        match ys_47'22 with
        | Nil0 -> false0
        | Cons1(y_53'7,ys_53'10) ->
          match ((eq_47'16 x_50'4) y_53'7) with
          | true1 -> (((eq_list_47'8 eq_47'16) xs_50'7) ys_53'10)
          | false0 -> false0))) in
let eq_char_list_56'4 = (fun a_56'17 -> (fun b_56'19 -> (((eq_list_47'8 eq_char_0'0) a_56'17) b_56'19))) in
let append_58'8 = fix (fun append_58'8 xs_58'15 ->
  (fun ys_58'18 ->
    match xs_58'15 with
    | Nil0 -> ys_58'18
    | Cons1(x_61'4,xs_61'7) -> ((cons_45'4 x_61'4) ((append_58'8 xs_61'7) ys_58'18)))) in
let reverse_63'4 = (fun xs_63'12 ->
  let loop_64'10 = fix (fun loop_64'10 acc_64'15 ->
    (fun xs_64'19 ->
      match xs_64'19 with
      | Nil0 -> acc_64'15
      | Cons1(x_67'6,xs_67'9) -> ((loop_64'10 ((cons_45'4 x_67'6) acc_64'15)) xs_67'9))) in
  ((loop_64'10 Nil0) xs_63'12)) in
let map_71'8 = fix (fun map_71'8 f_71'12 ->
  (fun xs_71'14 ->
    match xs_71'14 with
    | Nil0 -> Nil0
    | Cons1(x_74'4,xs_74'7) -> ((::_0'0 (f_71'12 x_74'4)) ((map_71'8 f_71'12) xs_74'7)))) in
let length_76'8 = fix (fun length_76'8 xs_76'15 ->
  match xs_76'15 with
  | Nil0 -> 0
  | Cons1(__79'4,xs_79'7) -> ((+_0'0 1) (length_76'8 xs_79'7))) in
let chars_of_int_81'4 = (fun i_81'17 ->
  let ord0_82'6 = (ord_0'0 '0') in
  let char_of_digit_83'6 = (fun c_83'20 -> (chr_0'0 ((+_0'0 ord0_82'6) c_83'20))) in
  let loop_84'10 = fix (fun loop_84'10 acc_84'15 ->
    (fun i_84'19 ->
      match ((=_0'0 i_84'19) 0) with
      | true1 -> acc_84'15
      | false0 -> ((loop_84'10 ((cons_45'4 (char_of_digit_83'6 ((%_0'0 i_84'19) 10))) acc_84'15)) ((/_0'0 i_84'19) 10)))) in
  match ((=_0'0 i_81'17) 0) with
  | true1 -> ((cons_45'4 '0') Nil0)
  | false0 -> ((loop_84'10 Nil0) i_81'17)) in
let put_chars_90'8 = fix (fun put_chars_90'8 xs_90'18 ->
  match xs_90'18 with
  | Nil0 -> Unit0
  | Cons1(x_93'4,xs_93'7) ->
    let __93'23 = (put_char_12'4 x_93'4) in
    (put_chars_90'8 xs_93'7)) in
let put_string_95'4 = (fun s_95'15 -> (put_chars_90'8 (explode_0'0 s_95'15))) in
let put_int_97'4 = (fun i_97'12 -> (put_chars_90'8 (chars_of_int_81'4 i_97'12))) in
let newline_99'4 = (fun __99'12 -> (put_char_12'4 '\n')) in
let put_string_newline_101'4 = (fun s_101'23 ->
  let __102'14 = (put_string_95'4 s_101'23) in
  (newline_99'4 Unit0)) in
let read_line_105'4 = (fun __105'14 ->
  let controlD_106'6 = (chr_0'0 4) in
  let loop_107'10 = fix (fun loop_107'10 acc_107'15 ->
    let c_108'8 = (get_char_0'0 Unit0) in
    let n_109'8 = (ord_0'0 c_108'8) in
    match ((eq_char_0'0 c_108'8) '\n') with
    | true1 ->
      let __110'37 = (newline_99'4 Unit0) in
      (reverse_63'4 acc_107'15)
    | false0 ->
      match ((eq_char_0'0 c_108'8) controlD_106'6) with
      | true1 ->
        let __111'44 = (put_char_12'4 c_108'8) in
        let __111'55 = (newline_99'4 Unit0) in
        (reverse_63'4 ((::_0'0 controlD_106'6) acc_107'15))
      | false0 ->
        match ((>_7'4 n_109'8) 127) with
        | true1 -> (loop_107'10 acc_107'15)
        | false0 ->
          match ((=_0'0 n_109'8) 127) with
          | true1 ->
            match acc_107'15 with
            | Nil0 -> (loop_107'10 acc_107'15)
            | Cons1(c_116'14,tail_116'17) ->
              let __117'58 = match ((<=_8'4 (ord_0'0 c_116'14)) 26) with
              | true1 -> (erase_char_20'4 Unit0)
              | false0 -> Unit0 in
              let __118'27 = (erase_char_20'4 Unit0) in
              (loop_107'10 tail_116'17)
          | false0 ->
            let __121'23 = (put_char_12'4 c_108'8) in
            (loop_107'10 ((cons_45'4 c_108'8) acc_107'15))) in
  (loop_107'10 Nil0)) in
let fib_125'8 = fix (fun fib_125'8 n_125'12 ->
  match ((<_0'0 n_125'12) 2) with
  | true1 -> n_125'12
  | false0 -> ((+_0'0 (fib_125'8 ((-_0'0 n_125'12) 1))) (fib_125'8 ((-_0'0 n_125'12) 2)))) in
let fact_129'8 = fix (fun fact_129'8 n_129'13 ->
  match ((>=_9'4 n_129'13) 2) with
  | true1 -> ((( * )_0'0 (fact_129'8 ((-_0'0 n_129'13) 1))) n_129'13)
  | false0 -> 1) in
let error_133'4 = (fun s_133'10 ->
  let __133'34 = (put_string_95'4 "ERROR: ") in
  let __133'48 = (put_string_95'4 s_133'10) in
  (newline_99'4 Unit0)) in
let runfib_135'4 = (fun args_135'11 ->
  let __136'20 = (put_string_95'4 "fib: ") in
  match args_135'11 with
  | Nil0 -> (error_133'4 "expected an argument")
  | Cons1(arg1_139'4,more_139'10) ->
    match more_139'10 with
    | Cons1(__141'7,__141'10) -> (error_133'4 "expected exactly one argument")
    | Nil0 ->
      match (parse_num_34'4 arg1_139'4) with
      | None1 -> (error_133'4 "expected arg1 to be numeric")
      | Some0(n_145'15) ->
        let res_146'15 = (fib_125'8 n_145'15) in
        let __147'20 = (put_int_97'4 n_145'15) in
        let __148'29 = (put_string_95'4 " --> ") in
        let __149'22 = (put_int_97'4 res_146'15) in
        (newline_99'4 Unit0)) in
let runfact_152'4 = (fun args_152'12 ->
  let __153'21 = (put_string_95'4 "fact: ") in
  match args_152'12 with
  | Nil0 -> (error_133'4 "expected an argument")
  | Cons1(arg1_156'4,more_156'10) ->
    match more_156'10 with
    | Cons1(__158'7,__158'10) -> (error_133'4 "expected exactly one argument")
    | Nil0 ->
      match (parse_num_34'4 arg1_156'4) with
      | None1 -> (error_133'4 "expected arg1 to be numeric")
      | Some0(n_162'15) ->
        let res_163'15 = (fact_129'8 n_162'15) in
        let __164'20 = (put_int_97'4 n_162'15) in
        let __165'29 = (put_string_95'4 " --> ") in
        let __166'22 = (put_int_97'4 res_163'15) in
        (newline_99'4 Unit0)) in
let single_controlD_170'4 = ((::_0'0 (chr_0'0 4)) Nil0) in
let rev_172'4 = (fun __172'7 ->
  let loop_173'10 = fix (fun loop_173'10 __173'14 ->
    let xs_174'8 = (read_line_105'4 Unit0) in
    match ((eq_char_list_56'4 xs_174'8) single_controlD_170'4) with
    | true1 -> Unit0
    | false0 ->
      let __176'29 = (put_chars_90'8 (reverse_63'4 xs_174'8)) in
      let __176'40 = (newline_99'4 Unit0) in
      (loop_173'10 Unit0)) in
  (loop_173'10 Unit0)) in
let runrev_180'4 = (fun args_180'11 ->
  match args_180'11 with
  | Cons1(__182'4,__182'7) -> (error_133'4 "rev: expected no arguments")
  | Nil0 ->
    let __184'56 = (put_string_newline_101'4 "(reverse typed lines until ^D)") in
    (rev_172'4 Unit0)) in
let fallback_187'4 = (fun line_187'13 ->
  let star_the_ohs_188'6 = (map_71'8
  (fun c_188'30 ->
    match ((eq_char_0'0 c_188'30) 'o') with
    | true1 -> '*'
    | false0 -> c_188'30)) in
  let n_189'6 = (length_76'8 line_187'13) in
  let __190'64 = (put_chars_90'8 ((append_58'8 (explode_0'0 "You wrote: ")) (star_the_ohs_188'6 line_187'13))) in
  let __191'14 = (put_char_12'4 ' ') in
  let __192'14 = (put_char_12'4 '{') in
  let __193'11 = (put_int_97'4 n_189'6) in
  let __194'14 = (put_char_12'4 '}') in
  (newline_99'4 Unit0)) in
let split_words_197'4 = (fun s_197'16 ->
  let loop_198'10 = fix (fun loop_198'10 accWs_198'15 ->
    (fun accCs_198'21 ->
      (fun xs_198'27 ->
        match xs_198'27 with
        | Nil0 -> (reverse_63'4 ((::_0'0 (reverse_63'4 accCs_198'21)) accWs_198'15))
        | Cons1(x_202'6,xs_202'9) ->
          match ((eq_char_0'0 x_202'6) ' ') with
          | true1 -> (((loop_198'10 ((::_0'0 (reverse_63'4 accCs_198'21)) accWs_198'15)) Nil0) xs_202'9)
          | false0 -> (((loop_198'10 accWs_198'15) ((::_0'0 x_202'6) accCs_198'21)) xs_202'9)))) in
  (((loop_198'10 Nil0) Nil0) s_197'16)) in
let execute_208'4 = (fun line_208'12 ->
  let words_209'6 = (split_words_197'4 line_208'12) in
  match words_209'6 with
  | Nil0 -> Unit0
  | Cons1(command_212'4,args_212'13) ->
    match ((eq_char_list_56'4 command_212'4) (explode_0'0 "fib")) with
    | true1 -> (runfib_135'4 args_212'13)
    | false0 ->
      match ((eq_char_list_56'4 command_212'4) (explode_0'0 "fact")) with
      | true1 -> (runfact_152'4 args_212'13)
      | false0 ->
        match ((eq_char_list_56'4 command_212'4) (explode_0'0 "rev")) with
        | true1 -> (runrev_180'4 args_212'13)
        | false0 -> (fallback_187'4 line_208'12)) in
let mainloop_218'8 = fix (fun mainloop_218'8 __218'17 ->
  let __219'21 = (put_chars_90'8 Cons1('>', Cons1(' ', Nil0))) in
  let xs_220'6 = (read_line_105'4 Unit0) in
  match ((eq_char_list_56'4 xs_220'6) single_controlD_170'4) with
  | true1 -> Unit0
  | false0 ->
    let __222'15 = (execute_208'4 xs_220'6) in
    (mainloop_218'8 Unit0)) in
let main_224'4 = (fun __224'9 ->
  let __225'69 = (put_string_newline_101'4 "This is a shell prototype. Try: fib, fact, rev") in
  (mainloop_218'8 Unit0)) in
(main_224'4 Unit0)
