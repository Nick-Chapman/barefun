(*stage2*)
let k () = ()
let + = fun [] x k ->
  let v2 = fun [x] y k ->
    let v1 = PRIM_AddInt(x,y) in
    k v1 in
  k v2 in
let - = fun [] x k ->
  let v4 = fun [x] y k ->
    let v3 = PRIM_SubInt(x,y) in
    k v3 in
  k v4 in
let ( * ) = fun [] x k ->
  let v6 = fun [x] y k ->
    let v5 = PRIM_MulInt(x,y) in
    k v5 in
  k v6 in
let / = fun [] x k ->
  let v8 = fun [x] y k ->
    let v7 = PRIM_DivInt(x,y) in
    k v7 in
  k v8 in
let % = fun [] x k ->
  let v10 = fun [x] y k ->
    let v9 = PRIM_ModInt(x,y) in
    k v9 in
  k v10 in
let < = fun [] x k ->
  let v12 = fun [x] y k ->
    let v11 = PRIM_LessInt(x,y) in
    k v11 in
  k v12 in
let = = fun [] x k ->
  let v14 = fun [x] y k ->
    let v13 = PRIM_EqInt(x,y) in
    k v13 in
  k v14 in
let eq_char = fun [] x k ->
  let v16 = fun [x] y k ->
    let v15 = PRIM_EqChar(x,y) in
    k v15 in
  k v16 in
let ord = fun [] x k ->
  let v17 = PRIM_CharOrd(x) in
  k v17 in
let chr = fun [] x k ->
  let v18 = PRIM_CharChr(x) in
  k v18 in
let explode = fun [] x k ->
  let v19 = PRIM_Explode(x) in
  k v19 in
let put_char = fun [] x k ->
  let v20 = PRIM_PutChar(x) in
  k v20 in
let get_char = fun [] x k ->
  let v21 = PRIM_GetChar(x) in
  k v21 in
let :: = fun [] x k ->
  let v23 = fun [x] y k ->
    let v22 = Cons1[x,y] in
    k v22 in
  k v23 in
let chars_of_int = fun [%,+,/,::,=,chr,ord] i k ->
  let k [%,+,/,::,=,chr,i] ord0 =
    let char_of_digit = fun [+,chr,ord0] c k ->
      let k [chr] u25_4'36 = chr u25_4'36 k in
      let k [c] u26_4'34 = u26_4'34 c k in
      + ord0 k in
    let loop = fix (fun [%,/,::,=,char_of_digit] loop acc k ->
      let v40 = fun [%,/,::,=,acc,char_of_digit,loop] i k ->
        let k [%,/,::,acc,char_of_digit,i,loop] u27_6'11 =
          match u27_6'11 with
          | true1 -> k acc
          | false0 ->
            let k [/,i] u30_7'11 =
              let k [u30_7'11] u37_7'44 = u30_7'11 u37_7'44 k in
              let k [] u38_7'43 =
                let u39_7'44 = 10 in
                u38_7'43 u39_7'44 k in
              / i k in
            let k [loop] u31_7'36 = loop u31_7'36 k in
            let k [acc] u32_7'33 = u32_7'33 acc k in
            let k [::] u33_7'26 = :: u33_7'26 k in
            let k [char_of_digit] u34_7'29 = char_of_digit u34_7'29 k in
            let k [] u35_7'28 =
              let u36_7'29 = 10 in
              u35_7'28 u36_7'29 k in
            % i k in
        let k [] u28_6'9 =
          let u29_6'11 = 0 in
          u28_6'9 u29_6'11 k in
        = i k in
      k v40) in
    let k [::,i,loop] u41_9'9 =
      match u41_9'9 with
      | true1 ->
        let k [] u44_9'20 =
          let u46_9'23 = Nil0 in
          u44_9'20 u46_9'23 k in
        let u45_9'16 = '0' in
        :: u45_9'16 k
      | false0 ->
        let k [i] u47_9'36 = u47_9'36 i k in
        let u48_9'36 = Nil0 in
        loop u48_9'36 k in
    let k [] u42_9'7 =
      let u43_9'9 = 0 in
      u42_9'7 u43_9'9 k in
    = i k in
  let u24_3'17 = '0' in
  ord u24_3'17 k in
let put_chars = fix (fun [put_char] put_chars xs k ->
  match xs with
  | Nil0 ->
    let v49 = Unit0 in
    k v49
  | Cons1(x,xs) ->
    let k [put_chars,xs] _ = put_chars xs k in
    put_char x k) in
let put_string = fun [explode,put_chars] s k ->
  let k [put_chars] u50_16'38 = put_chars u50_16'38 k in
  explode s k in
let put_int = fun [chars_of_int,put_chars] i k ->
  let k [put_chars] u51_18'40 = put_chars u51_18'40 k in
  chars_of_int i k in
let newline = fun [put_char] _ k ->
  let u52_20'26 = '\n' in
  put_char u52_20'26 k in
let fib = fix (fun [+,-,<] fib n k ->
  let k [+,-,fib,n] u53_24'9 =
    match u53_24'9 with
    | true1 -> k n
    | false0 ->
      let k [-,fib,n] u56_24'33 =
        let k [u56_24'33] u61_24'39 = u56_24'33 u61_24'39 k in
        let k [fib] u62_24'42 = fib u62_24'42 k in
        let k [] u63_24'41 =
          let u64_24'42 = 2 in
          u63_24'41 u64_24'42 k in
        - n k in
      let k [+] u57_24'27 = + u57_24'27 k in
      let k [fib] u58_24'30 = fib u58_24'30 k in
      let k [] u59_24'29 =
        let u60_24'30 = 1 in
        u59_24'29 u60_24'30 k in
      - n k in
  let k [] u54_24'7 =
    let u55_24'9 = 2 in
    u54_24'7 u55_24'9 k in
  < n k) in
let runfib = fun [fib,newline,put_int,put_string] n k ->
  let k [n,newline,put_int,put_string] res =
    let k [n,newline,put_int,put_string,res] _ =
      let k [newline,put_int,put_string,res] _ =
        let k [newline,put_int,res] _ =
          let k [newline] _ =
            let u67_32'10 = Unit0 in
            newline u67_32'10 k in
          put_int res k in
        let u66_30'13 = " --> " in
        put_string u66_30'13 k in
      put_int n k in
    let u65_28'13 = "fib " in
    put_string u65_28'13 k in
  fib n k in
let main = fun [runfib] _ k ->
  let u68_34'21 = 20 in
  runfib u68_34'21 k in
let u69_0'0 = Unit0 in
main u69_0'0 k
