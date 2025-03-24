[transform2]
----------
let k () = ()
let + =
  (fun[] x k ->
    let v2 =
      (fun[x] y k ->
        let v1 = PRIM_AddInt[x,y] in
        k v1) in
    k v2) in
let - =
  (fun[] x k ->
    let v4 =
      (fun[x] y k ->
        let v3 = PRIM_SubInt[x,y] in
        k v3) in
    k v4) in
let ( * ) =
  (fun[] x k ->
    let v6 =
      (fun[x] y k ->
        let v5 = PRIM_MulInt[x,y] in
        k v5) in
    k v6) in
let / =
  (fun[] x k ->
    let v8 =
      (fun[x] y k ->
        let v7 = PRIM_DivInt[x,y] in
        k v7) in
    k v8) in
let % =
  (fun[] x k ->
    let v10 =
      (fun[x] y k ->
        let v9 = PRIM_ModInt[x,y] in
        k v9) in
    k v10) in
let < =
  (fun[] x k ->
    let v12 =
      (fun[x] y k ->
        let v11 = PRIM_LessInt[x,y] in
        k v11) in
    k v12) in
let = =
  (fun[] x k ->
    let v14 =
      (fun[x] y k ->
        let v13 = PRIM_EqInt[x,y] in
        k v13) in
    k v14) in
let eq_char =
  (fun[] x k ->
    let v16 =
      (fun[x] y k ->
        let v15 = PRIM_EqChar[x,y] in
        k v15) in
    k v16) in
let ord =
  (fun[] x k ->
    let v17 = PRIM_CharOrd[x] in
    k v17) in
let chr =
  (fun[] x k ->
    let v18 = PRIM_CharChr[x] in
    k v18) in
let explode =
  (fun[] x k ->
    let v19 = PRIM_Explode[x] in
    k v19) in
let put_char =
  (fun[] x k ->
    let v20 = PRIM_PutChar[x] in
    k v20) in
let get_char =
  (fun[] x k ->
    let v21 = PRIM_GetChar[x] in
    k v21) in
let :: =
  (fun[] x k ->
    let v23 =
      (fun[x] y k ->
        let v22 = Tag_1[x,y] in
        k v22) in
    k v23) in
let k [+,-,<,explode,put_char] chars_of_int =
  let put_chars =
    fix (fun[put_char] put_chars xs k ->
      match xs with
      | Tag_0 ->
        let v50 = Tag_0 in
        k v50
      | Tag_1(x,xs) ->
        let k [put_chars,xs] _ = put_chars xs k in
        put_char x k) in
  let put_string =
    (fun[explode,put_chars] s k ->
      let k [put_chars] u51 = put_chars u51 k in
      explode s k) in
  let put_int =
    (fun[chars_of_int,put_chars] i k ->
      let k [put_chars] u52 = put_chars u52 k in
      chars_of_int i k) in
  let newline =
    (fun[put_char] _ k ->
      let u53 = '\n' in
      put_char u53 k) in
  let fib =
    fix (fun[+,-,<] fib n k ->
      let k [+,-,fib,n] u54 =
        match u54 with
        | Tag_1 -> k n
        | Tag_0 ->
          let k [-,fib,n] u57 =
            let k [u57] u62 = u57 u62 k in
            let k [fib] u63 = fib u63 k in
            let k [] u64 =
              let u65 = 2 in
              u64 u65 k in
            - n k in
          let k [+] u58 = + u58 k in
          let k [fib] u59 = fib u59 k in
          let k [] u60 =
            let u61 = 1 in
            u60 u61 k in
          - n k in
      let k [] u55 =
        let u56 = 2 in
        u55 u56 k in
      < n k) in
  let runfib =
    (fun[fib,newline,put_int,put_string] n k ->
      let k [n,newline,put_int,put_string] res =
        let k [n,newline,put_int,put_string,res] _ =
          let k [newline,put_int,put_string,res] _ =
            let k [newline,put_int,res] _ =
              let k [newline] _ =
                let u68 = Tag_0 in
                newline u68 k in
              put_int res k in
            let u67 = " --> " in
            put_string u67 k in
          put_int n k in
        let u66 = "fib " in
        put_string u66 k in
      fib n k) in
  let main =
    (fun[runfib] _ k ->
      let u69 = 20 in
      runfib u69 k) in
  let u70 = Tag_0 in
  main u70 k in
let k [%,+,/,::,=,chr] ord0 =
  let char_of_digit =
    (fun[+,chr,ord0] c k ->
      let k [chr] u25 = chr u25 k in
      let k [c] u26 = u26 c k in
      + ord0 k) in
  let loop =
    fix (fun[%,/,::,=,char_of_digit] loop acc k ->
      let v40 =
        (fun[%,/,::,=,acc,char_of_digit,loop] i k ->
          let k [%,/,::,acc,char_of_digit,i,loop] u27 =
            match u27 with
            | Tag_1 -> k acc
            | Tag_0 ->
              let k [/,i] u30 =
                let k [u30] u37 = u30 u37 k in
                let k [] u38 =
                  let u39 = 10 in
                  u38 u39 k in
                / i k in
              let k [loop] u31 = loop u31 k in
              let k [acc] u32 = u32 acc k in
              let k [::] u33 = :: u33 k in
              let k [char_of_digit] u34 = char_of_digit u34 k in
              let k [] u35 =
                let u36 = 10 in
                u35 u36 k in
              % i k in
          let k [] u28 =
            let u29 = 0 in
            u28 u29 k in
          = i k) in
      k v40) in
  let v49 =
    (fun[::,=,loop] i k ->
      let k [::,i,loop] u41 =
        match u41 with
        | Tag_1 ->
          let k [] u44 =
            let u46 = Tag_0 in
            u44 u46 k in
          let u45 = '0' in
          :: u45 k
        | Tag_0 ->
          let k [i] u47 = u47 i k in
          let u48 = Tag_0 in
          loop u48 k in
      let k [] u42 =
        let u43 = 0 in
        u42 u43 k in
      = i k) in
  k v49 in
let u24 = '0' in
ord u24 k
----------
