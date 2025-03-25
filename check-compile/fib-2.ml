(*stage2*)
let k () = ()
let + = fun [] x k ->
  let lam_2 = fun [x] y k ->
    let prim_1 = PRIM_AddInt(x,y) in
    k prim_1 in
  k lam_2 in
let - = fun [] x k ->
  let lam_4 = fun [x] y k ->
    let prim_3 = PRIM_SubInt(x,y) in
    k prim_3 in
  k lam_4 in
let ( * ) = fun [] x k ->
  let lam_6 = fun [x] y k ->
    let prim_5 = PRIM_MulInt(x,y) in
    k prim_5 in
  k lam_6 in
let / = fun [] x k ->
  let lam_8 = fun [x] y k ->
    let prim_7 = PRIM_DivInt(x,y) in
    k prim_7 in
  k lam_8 in
let % = fun [] x k ->
  let lam_10 = fun [x] y k ->
    let prim_9 = PRIM_ModInt(x,y) in
    k prim_9 in
  k lam_10 in
let < = fun [] x k ->
  let lam_12 = fun [x] y k ->
    let prim_11 = PRIM_LessInt(x,y) in
    k prim_11 in
  k lam_12 in
let = = fun [] x k ->
  let lam_14 = fun [x] y k ->
    let prim_13 = PRIM_EqInt(x,y) in
    k prim_13 in
  k lam_14 in
let eq_char = fun [] x k ->
  let lam_16 = fun [x] y k ->
    let prim_15 = PRIM_EqChar(x,y) in
    k prim_15 in
  k lam_16 in
let ord = fun [] x k ->
  let prim_17 = PRIM_CharOrd(x) in
  k prim_17 in
let chr = fun [] x k ->
  let prim_18 = PRIM_CharChr(x) in
  k prim_18 in
let explode = fun [] x k ->
  let prim_19 = PRIM_Explode(x) in
  k prim_19 in
let put_char = fun [] x k ->
  let prim_20 = PRIM_PutChar(x) in
  k prim_20 in
let get_char = fun [] x k ->
  let prim_21 = PRIM_GetChar(x) in
  k prim_21 in
let :: = fun [] x k ->
  let lam_23 = fun [x] y k ->
    let con_22 = Cons1[x,y] in
    k con_22 in
  k lam_23 in
let chars_of_int = fun [%,+,/,::,=,chr,ord] i k ->
  let k [%,+,/,::,=,chr,i] ord0 =
    let char_of_digit = fun [+,chr,ord0] c k ->
      let k [chr] app_25_4'36 = chr app_25_4'36 k in
      let k [c] app_26_4'34 = app_26_4'34 c k in
      + ord0 k in
    let loop = fix (fun [%,/,::,=,char_of_digit] loop acc k ->
      let lam_40 = fun [%,/,::,=,acc,char_of_digit,loop] i k ->
        let k [%,/,::,acc,char_of_digit,i,loop] app_27_6'11 =
          match app_27_6'11 with
          | true1 -> k acc
          | false0 ->
            let k [/,i] app_30_7'11 =
              let k [app_30_7'11] app_37_7'44 = app_30_7'11 app_37_7'44 k in
              let k [] app_38_7'43 =
                let lit_39_7'44 = 10 in
                app_38_7'43 lit_39_7'44 k in
              / i k in
            let k [loop] app_31_7'36 = loop app_31_7'36 k in
            let k [acc] app_32_7'33 = app_32_7'33 acc k in
            let k [::] app_33_7'26 = :: app_33_7'26 k in
            let k [char_of_digit] app_34_7'29 = char_of_digit app_34_7'29 k in
            let k [] app_35_7'28 =
              let lit_36_7'29 = 10 in
              app_35_7'28 lit_36_7'29 k in
            % i k in
        let k [] app_28_6'9 =
          let lit_29_6'11 = 0 in
          app_28_6'9 lit_29_6'11 k in
        = i k in
      k lam_40) in
    let k [::,i,loop] app_41_9'9 =
      match app_41_9'9 with
      | true1 ->
        let k [] app_44_9'20 =
          let con_46_9'23 = Nil0 in
          app_44_9'20 con_46_9'23 k in
        let lit_45_9'16 = '0' in
        :: lit_45_9'16 k
      | false0 ->
        let k [i] app_47_9'36 = app_47_9'36 i k in
        let con_48_9'36 = Nil0 in
        loop con_48_9'36 k in
    let k [] app_42_9'7 =
      let lit_43_9'9 = 0 in
      app_42_9'7 lit_43_9'9 k in
    = i k in
  let lit_24_3'17 = '0' in
  ord lit_24_3'17 k in
let put_chars = fix (fun [put_char] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_49 = Unit0 in
    k con_49
  | Cons1(x,xs) ->
    let k [put_chars,xs] _ = put_chars xs k in
    put_char x k) in
let put_string = fun [explode,put_chars] s k ->
  let k [put_chars] app_50_16'38 = put_chars app_50_16'38 k in
  explode s k in
let put_int = fun [chars_of_int,put_chars] i k ->
  let k [put_chars] app_51_18'40 = put_chars app_51_18'40 k in
  chars_of_int i k in
let newline = fun [put_char] _ k ->
  let lit_52_20'26 = '\n' in
  put_char lit_52_20'26 k in
let fib = fix (fun [+,-,<] fib n k ->
  let k [+,-,fib,n] app_53_24'9 =
    match app_53_24'9 with
    | true1 -> k n
    | false0 ->
      let k [-,fib,n] app_56_24'33 =
        let k [app_56_24'33] app_61_24'39 = app_56_24'33 app_61_24'39 k in
        let k [fib] app_62_24'42 = fib app_62_24'42 k in
        let k [] app_63_24'41 =
          let lit_64_24'42 = 2 in
          app_63_24'41 lit_64_24'42 k in
        - n k in
      let k [+] app_57_24'27 = + app_57_24'27 k in
      let k [fib] app_58_24'30 = fib app_58_24'30 k in
      let k [] app_59_24'29 =
        let lit_60_24'30 = 1 in
        app_59_24'29 lit_60_24'30 k in
      - n k in
  let k [] app_54_24'7 =
    let lit_55_24'9 = 2 in
    app_54_24'7 lit_55_24'9 k in
  < n k) in
let runfib = fun [fib,newline,put_int,put_string] n k ->
  let k [n,newline,put_int,put_string] res =
    let k [n,newline,put_int,put_string,res] _ =
      let k [newline,put_int,put_string,res] _ =
        let k [newline,put_int,res] _ =
          let k [newline] _ =
            let con_67_32'10 = Unit0 in
            newline con_67_32'10 k in
          put_int res k in
        let lit_66_30'13 = " --> " in
        put_string lit_66_30'13 k in
      put_int n k in
    let lit_65_28'13 = "fib " in
    put_string lit_65_28'13 k in
  fib n k in
let main = fun [runfib] _ k ->
  let lit_68_34'21 = 20 in
  runfib lit_68_34'21 k in
let con_69_0'0 = Unit0 in
main con_69_0'0 k
