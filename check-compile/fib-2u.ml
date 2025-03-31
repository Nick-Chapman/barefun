(*stage2; un-normalized*)
let k () = ()
let + = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_AddInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let - = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_SubInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let ( * ) = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_MulInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let / = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_DivInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let % = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_ModInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let < = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_LessInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let = = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_EqInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let eq_char = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_EqChar(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let ord = fun [] x k ->
  let prim_0'0 = PRIM_CharOrd(x) in
  k prim_0'0 in
let chr = fun [] x k ->
  let prim_0'0 = PRIM_CharChr(x) in
  k prim_0'0 in
let explode = fun [] x k ->
  let prim_0'0 = PRIM_Explode(x) in
  k prim_0'0 in
let put_char = fun [] x k ->
  let prim_0'0 = PRIM_PutChar(x) in
  k prim_0'0 in
let get_char = fun [] x k ->
  let prim_0'0 = PRIM_GetChar(x) in
  k prim_0'0 in
let :: = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let con_0'0 = Cons1[x,y] in
    k con_0'0 in
  k lam_0'0 in
let chars_of_int = fun [%,+,/,::,=,chr,ord] i k ->
  let lit_3'17 = '0' in
  let k [%,+,/,::,=,chr,i] ord0 =
    let char_of_digit = fun [+,chr,ord0] c k ->
      let k [chr,c] app_4'34 =
        let k [chr] app_4'36 = chr app_4'36 k in
        app_4'34 c k in
      + ord0 k in
    let loop = fix (fun [%,/,::,=,char_of_digit] loop acc k ->
      let lam_5'19 = fun [%,/,::,=,char_of_digit,loop,acc] i k ->
        let k [%,/,::,char_of_digit,loop,acc,i] app_6'9 =
          let lit_6'11 = 0 in
          let k [%,/,::,char_of_digit,loop,acc,i] app_6'11 =
            match app_6'11 with
            | true1 -> k acc
            | false0 ->
              let k [/,::,char_of_digit,loop,acc,i] app_7'28 =
                let lit_7'29 = 10 in
                let k [/,::,char_of_digit,loop,acc,i] app_7'29 =
                  let k [/,::,loop,acc,i] app_7'26 =
                    let k [/,loop,acc,i] app_7'33 =
                      let k [/,loop,i] app_7'36 =
                        let k [/,i] app_7'11 =
                          let k [app_7'11] app_7'43 =
                            let lit_7'44 = 10 in
                            let k [app_7'11] app_7'44 = app_7'11 app_7'44 k in
                            app_7'43 lit_7'44 k in
                          / i k in
                        loop app_7'36 k in
                      app_7'33 acc k in
                    :: app_7'26 k in
                  char_of_digit app_7'29 k in
                app_7'28 lit_7'29 k in
              % i k in
          app_6'9 lit_6'11 k in
        = i k in
      k lam_5'19) in
    let k [i,loop] app_9'7 =
      let lit_9'9 = 0 in
      let k [i,loop] app_9'9 =
        match app_9'9 with
        | true1 ->
          let lit_9'17 = '0' in
          let con_9'20 = Nil0 in
          let con_9'17 = Cons1[lit_9'17,con_9'20] in
          k con_9'17
        | false0 ->
          let con_9'32 = Nil0 in
          let k [i] app_9'32 = app_9'32 i k in
          loop con_9'32 k in
      app_9'7 lit_9'9 k in
    = i k in
  ord lit_3'17 k in
let put_chars = fix (fun [put_char] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_13'10 = Unit0 in
    k con_13'10
  | Cons1(x,xs) ->
    let k [put_chars,xs] _ = put_chars xs k in
    put_char x k) in
let put_string = fun [explode,put_chars] s k ->
  let k [put_chars] app_16'38 = put_chars app_16'38 k in
  explode s k in
let put_int = fun [chars_of_int,put_chars] i k ->
  let k [put_chars] app_18'40 = put_chars app_18'40 k in
  chars_of_int i k in
let newline = fun [put_char] _ k ->
  let lit_20'26 = '\n' in
  put_char lit_20'26 k in
let fib = fix (fun [+,-,<] fib n k ->
  let k [+,-,fib,n] app_24'7 =
    let lit_24'9 = 2 in
    let k [+,-,fib,n] app_24'9 =
      match app_24'9 with
      | true1 -> k n
      | false0 ->
        let k [+,-,fib,n] app_24'29 =
          let lit_24'30 = 1 in
          let k [+,-,fib,n] app_24'30 =
            let k [+,-,fib,n] app_24'27 =
              let k [-,fib,n] app_24'33 =
                let k [fib,app_24'33] app_24'41 =
                  let lit_24'42 = 2 in
                  let k [fib,app_24'33] app_24'42 =
                    let k [app_24'33] app_24'39 = app_24'33 app_24'39 k in
                    fib app_24'42 k in
                  app_24'41 lit_24'42 k in
                - n k in
              + app_24'27 k in
            fib app_24'30 k in
          app_24'29 lit_24'30 k in
        - n k in
    app_24'7 lit_24'9 k in
  < n k) in
let runfib = fun [put_string,put_int,newline,fib] n k ->
  let k [put_string,put_int,newline,n] res =
    let lit_28'13 = "fib " in
    let k [put_string,put_int,newline,n,res] _ =
      let k [put_string,put_int,newline,res] _ =
        let lit_30'13 = " --> " in
        let k [put_int,newline,res] _ =
          let k [newline] _ =
            let con_32'10 = Unit0 in
            newline con_32'10 k in
          put_int res k in
        put_string lit_30'13 k in
      put_int n k in
    put_string lit_28'13 k in
  fib n k in
let main = fun [runfib] _ k ->
  let lit_34'21 = 20 in
  runfib lit_34'21 k in
let con_0'0 = Unit0 in
main con_0'0 k
