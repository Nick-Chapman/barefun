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
let not = fun [] b k ->
  match b with
  | true1 ->
    let v24 = false0 in
    k v24
  | false0 ->
    let v25 = true1 in
    k v25 in
let > = fun [<] a k ->
  let v27 = fun [<,a] b k ->
    let k [a] u26_7'16 = u26_7'16 a k in
    < b k in
  k v27 in
let <= = fun [<,not] a k ->
  let v30 = fun [<,a,not] b k ->
    let k [not] u28_8'24 = not u28_8'24 k in
    let k [a] u29_8'22 = u29_8'22 a k in
    < b k in
  k v30 in
let >= = fun [<,not] a k ->
  let v33 = fun [<,a,not] b k ->
    let k [not] u31_9'24 = not u31_9'24 k in
    let k [b] u32_9'22 = u32_9'22 b k in
    < a k in
  k v33 in
let parse_digit = fun [-,<=,>=,ord] c k ->
  let k [<=,>=] n =
    let k [<=,n] u38_16'10 =
      match u38_16'10 with
      | true1 ->
        let k [n] u41_16'25 =
          match u41_16'25 with
          | true1 ->
            let v44 = Some0[n] in
            k v44
          | false0 ->
            let v45 = None1 in
            k v45 in
        let k [] u42_16'22 =
          let u43_16'25 = 9 in
          u42_16'22 u43_16'25 k in
        <= n k
      | false0 ->
        let v46 = None1 in
        k v46 in
    let k [] u39_16'7 =
      let u40_16'10 = 0 in
      u39_16'7 u40_16'10 k in
    >= n k in
  let k [ord] u34_14'16 =
    let k [u34_14'16] u36_14'22 = u34_14'16 u36_14'22 k in
    let u37_14'22 = '0' in
    ord u37_14'22 k in
  let k [-] u35_14'14 = - u35_14'14 k in
  ord c k in
let parse_num = fun [( * ),+,parse_digit] s k ->
  let loop = fix (fun [( * ),+,parse_digit] loop acc k ->
    let v56 = fun [( * ),+,acc,loop,parse_digit] xs k ->
      match xs with
      | Nil0 ->
        let v47 = Some0[acc] in
        k v47
      | Cons1(x,xs) ->
        let k [( * ),+,acc,loop,xs] u48_23'26 =
          match u48_23'26 with
          | None1 ->
            let v49 = None1 in
            k v49
          | Some0(d) ->
            let k [xs] u50_25'25 = u50_25'25 xs k in
            let k [loop] u51_25'37 = loop u51_25'37 k in
            let k [d] u52_25'35 = u52_25'35 d k in
            let k [+] u53_25'31 = + u53_25'31 k in
            let k [acc] u54_25'29 = u54_25'29 acc k in
            let u55_25'26 = 10 in
            ( * ) u55_25'26 k in
        parse_digit x k in
    k v56) in
  let k [s] u57_27'7 = u57_27'7 s k in
  let u58_27'7 = 0 in
  loop u58_27'7 k in
let cons = fun [::] x k ->
  let v60 = fun [::,x] xs k ->
    let k [xs] u59_29'18 = u59_29'18 xs k in
    :: x k in
  k v60 in
let eq_list = fix (fun [] eq_list eq k ->
  let v70 = fun [eq,eq_list] xs k ->
    let v69 = fun [eq,eq_list,xs] ys k ->
      match xs with
      | Nil0 ->
        match ys with
        | Nil0 ->
          let v61 = true1 in
          k v61
        | Cons1(_,_) ->
          let v62 = false0 in
          k v62
      | Cons1(x,xs) ->
        match ys with
        | Nil0 ->
          let v63 = false0 in
          k v63
        | Cons1(y,ys) ->
          let k [eq,eq_list,xs,ys] u64_38'16 =
            match u64_38'16 with
            | true1 ->
              let k [ys] u66_38'34 = u66_38'34 ys k in
              let k [xs] u67_38'31 = u67_38'31 xs k in
              eq_list eq k
            | false0 ->
              let v68 = false0 in
              k v68 in
          let k [y] u65_38'14 = u65_38'14 y k in
          eq x k in
    k v69 in
  k v70) in
let eq_char_list = fun [eq_char,eq_list] a k ->
  let v73 = fun [a,eq_char,eq_list] b k ->
    let k [b] u71_40'39 = u71_40'39 b k in
    let k [a] u72_40'31 = u72_40'31 a k in
    eq_list eq_char k in
  k v73 in
let append = fix (fun [cons] append xs k ->
  let v77 = fun [append,cons,xs] ys k ->
    match xs with
    | Nil0 -> k ys
    | Cons1(x,xs) ->
      let k [append,xs,ys] u74_45'18 =
        let k [u74_45'18] u75_45'31 = u74_45'18 u75_45'31 k in
        let k [ys] u76_45'28 = u76_45'28 ys k in
        append xs k in
      cons x k in
  k v77) in
let reverse = fun [cons] xs k ->
  let loop = fix (fun [cons] loop acc k ->
    let v81 = fun [acc,cons,loop] xs k ->
      match xs with
      | Nil0 -> k acc
      | Cons1(x,xs) ->
        let k [xs] u78_51'20 = u78_51'20 xs k in
        let k [loop] u79_51'28 = loop u79_51'28 k in
        let k [acc] u80_51'26 = u80_51'26 acc k in
        cons x k in
    k v81) in
  let k [xs] u82_53'7 = u82_53'7 xs k in
  let u83_53'7 = Nil0 in
  loop u83_53'7 k in
let map = fix (fun [::] map f k ->
  let v89 = fun [::,f,map] xs k ->
    match xs with
    | Nil0 ->
      let v84 = Nil0 in
      k v84
    | Cons1(x,xs) ->
      let k [f,map,xs] u85_58'17 =
        let k [u85_58'17] u87_58'26 = u85_58'17 u87_58'26 k in
        let k [xs] u88_58'24 = u88_58'24 xs k in
        map f k in
      let k [::] u86_58'15 = :: u86_58'15 k in
      f x k in
  k v89) in
let length = fix (fun [+] length xs k ->
  match xs with
  | Nil0 ->
    let v90 = 0 in
    k v90
  | Cons1(_,xs) ->
    let k [length,xs] u91_63'17 =
      let k [u91_63'17] u93_63'27 = u91_63'17 u93_63'27 k in
      length xs k in
    let u92_63'17 = 1 in
    + u92_63'17 k) in
let chars_of_int = fun [%,+,/,=,chr,cons,ord] i k ->
  let k [%,+,/,=,chr,cons,i] ord0 =
    let char_of_digit = fun [+,chr,ord0] c k ->
      let k [chr] u95_67'36 = chr u95_67'36 k in
      let k [c] u96_67'34 = u96_67'34 c k in
      + ord0 k in
    let loop = fix (fun [%,/,=,char_of_digit,cons] loop acc k ->
      let v110 = fun [%,/,=,acc,char_of_digit,cons,loop] i k ->
        let k [%,/,acc,char_of_digit,cons,i,loop] u97_69'11 =
          match u97_69'11 with
          | true1 -> k acc
          | false0 ->
            let k [/,i] u100_70'11 =
              let k [u100_70'11] u107_70'48 = u100_70'11 u107_70'48 k in
              let k [] u108_70'47 =
                let u109_70'48 = 10 in
                u108_70'47 u109_70'48 k in
              / i k in
            let k [loop] u101_70'40 = loop u101_70'40 k in
            let k [acc] u102_70'17 = u102_70'17 acc k in
            let k [cons] u103_70'32 = cons u103_70'32 k in
            let k [char_of_digit] u104_70'35 = char_of_digit u104_70'35 k in
            let k [] u105_70'34 =
              let u106_70'35 = 10 in
              u105_70'34 u106_70'35 k in
            % i k in
        let k [] u98_69'9 =
          let u99_69'11 = 0 in
          u98_69'9 u99_69'11 k in
        = i k in
      k v110) in
    let k [cons,i,loop] u111_72'9 =
      match u111_72'9 with
      | true1 ->
        let k [] u114_72'21 =
          let u116_72'25 = Nil0 in
          u114_72'21 u116_72'25 k in
        let u115_72'21 = '0' in
        cons u115_72'21 k
      | false0 ->
        let k [i] u117_72'38 = u117_72'38 i k in
        let u118_72'38 = Nil0 in
        loop u118_72'38 k in
    let k [] u112_72'7 =
      let u113_72'9 = 0 in
      u112_72'7 u113_72'9 k in
    = i k in
  let u94_66'17 = '0' in
  ord u94_66'17 k in
let put_chars = fix (fun [put_char] put_chars xs k ->
  match xs with
  | Nil0 ->
    let v119 = Unit0 in
    k v119
  | Cons1(x,xs) ->
    let k [put_chars,xs] _ = put_chars xs k in
    put_char x k) in
let put_string = fun [explode,put_chars] s k ->
  let k [put_chars] u120_79'38 = put_chars u120_79'38 k in
  explode s k in
let put_int = fun [chars_of_int,put_chars] i k ->
  let k [put_chars] u121_81'40 = put_chars u121_81'40 k in
  chars_of_int i k in
let newline = fun [put_char] _ k ->
  let u122_83'26 = '\n' in
  put_char u122_83'26 k in
let put_string_newline = fun [newline,put_string] s k ->
  let k [newline] _ =
    let u123_87'10 = Unit0 in
    newline u123_87'10 k in
  put_string s k in
let read_line = fun [<=,=,>,chr,cons,eq_char,get_char,newline,ord,put_char,reverse] _ k ->
  let loop = fix (fun [<=,=,>,chr,cons,eq_char,get_char,newline,ord,put_char,reverse] loop acc k ->
    let k [<=,=,>,acc,chr,cons,eq_char,loop,newline,ord,put_char,reverse] c =
      let k [<=,=,>,acc,c,chr,cons,eq_char,loop,newline,put_char,reverse] n =
        let k [<=,=,>,acc,c,chr,cons,loop,n,newline,put_char,reverse] u125_93'17 =
          match u125_93'17 with
          | true1 ->
            let k [acc,reverse] _ = reverse acc k in
            let u128_93'35 = Unit0 in
            newline u128_93'35 k
          | false0 ->
            let k [=,>,acc,c,chr,cons,loop,n,put_char] u129_94'14 =
              match u129_94'14 with
              | true1 -> loop acc k
              | false0 ->
                let k [=,acc,c,chr,cons,loop,n,put_char] u132_95'15 =
                  match u132_95'15 with
                  | true1 -> loop acc k
                  | false0 ->
                    let k [acc,c,chr,cons,loop,put_char] u135_96'17 =
                      match u135_96'17 with
                      | true1 ->
                        match acc with
                        | Nil0 -> loop acc k
                        | Cons1(_,tail) ->
                          let k [chr,loop,put_char,tail] _ =
                            let k [chr,loop,put_char,tail] _ =
                              let k [loop,tail] _ = loop tail k in
                              let k [put_char] u141_103'29 = put_char u141_103'29 k in
                              let u142_103'29 = 8 in
                              chr u142_103'29 k in
                            let u140_102'24 = ' ' in
                            put_char u140_102'24 k in
                          let k [put_char] u138_101'29 = put_char u138_101'29 k in
                          let u139_101'29 = 8 in
                          chr u139_101'29 k
                      | false0 ->
                        let k [acc,c,cons,loop] _ =
                          let k [loop] u143_106'38 = loop u143_106'38 k in
                          let k [acc] u144_106'36 = u144_106'36 acc k in
                          cons c k in
                        put_char c k in
                    let k [] u136_96'15 =
                      let u137_96'17 = 127 in
                      u136_96'15 u137_96'17 k in
                    = n k in
                let k [] u133_95'13 =
                  let u134_95'15 = 127 in
                  u133_95'13 u134_95'15 k in
                > n k in
            let k [] u130_94'11 =
              let u131_94'14 = 31 in
              u130_94'11 u131_94'14 k in
            <= n k in
        let k [] u126_93'15 =
          let u127_93'17 = '\n' in
          u126_93'15 u127_93'17 k in
        eq_char c k in
      ord c k in
    let u124_91'21 = Unit0 in
    get_char u124_91'21 k) in
  let u145_108'7 = Nil0 in
  loop u145_108'7 k in
let fib = fix (fun [+,-,<] fib n k ->
  let k [+,-,fib,n] u146_112'9 =
    match u146_112'9 with
    | true1 -> k n
    | false0 ->
      let k [-,fib,n] u149_112'33 =
        let k [u149_112'33] u154_112'39 = u149_112'33 u154_112'39 k in
        let k [fib] u155_112'42 = fib u155_112'42 k in
        let k [] u156_112'41 =
          let u157_112'42 = 2 in
          u156_112'41 u157_112'42 k in
        - n k in
      let k [+] u150_112'27 = + u150_112'27 k in
      let k [fib] u151_112'30 = fib u151_112'30 k in
      let k [] u152_112'29 =
        let u153_112'30 = 1 in
        u152_112'29 u153_112'30 k in
      - n k in
  let k [] u147_112'7 =
    let u148_112'9 = 2 in
    u147_112'7 u148_112'9 k in
  < n k) in
let fact = fix (fun [( * ),-,>=] fact n k ->
  let k [( * ),-,fact,n] u158_116'10 =
    match u158_116'10 with
    | true1 ->
      let k [n] u161_116'28 = u161_116'28 n k in
      let k [( * )] u162_116'22 = ( * ) u162_116'22 k in
      let k [fact] u163_116'25 = fact u163_116'25 k in
      let k [] u164_116'24 =
        let u165_116'25 = 1 in
        u164_116'24 u165_116'25 k in
      - n k
    | false0 ->
      let v166 = 1 in
      k v166 in
  let k [] u159_116'7 =
    let u160_116'10 = 2 in
    u159_116'7 u160_116'10 k in
  >= n k) in
let error = fun [newline,put_string] s k ->
  let k [newline,put_string,s] _ =
    let k [newline] _ =
      let u168_118'58 = Unit0 in
      newline u168_118'58 k in
    put_string s k in
  let u167_118'25 = "ERROR: " in
  put_string u167_118'25 k in
let runfib = fun [error,fib,newline,parse_num,put_int,put_string] args k ->
  let k [args,error,fib,newline,parse_num,put_int,put_string] _ =
    match args with
    | Nil0 ->
      let u170_123'16 = "expected an argument" in
      error u170_123'16 k
    | Cons1(arg1,more) ->
      match more with
      | Cons1(_,_) ->
        let u171_126'21 = "expected exactly one argument" in
        error u171_126'21 k
      | Nil0 ->
        let k [error,fib,newline,put_int,put_string] u172_128'24 =
          match u172_128'24 with
          | None1 ->
            let u173_129'24 = "expected arg1 to be numeric" in
            error u173_129'24 k
          | Some0(n) ->
            let k [n,newline,put_int,put_string] res =
              let k [newline,put_int,put_string,res] _ =
                let k [newline,put_int,res] _ =
                  let k [newline] _ =
                    let u175_135'19 = Unit0 in
                    newline u175_135'19 k in
                  put_int res k in
                let u174_133'22 = " --> " in
                put_string u174_133'22 k in
              put_int n k in
            fib n k in
        parse_num arg1 k in
  let u169_121'13 = "fib: " in
  put_string u169_121'13 k in
let runfact = fun [error,fact,newline,parse_num,put_int,put_string] args k ->
  let k [args,error,fact,newline,parse_num,put_int,put_string] _ =
    match args with
    | Nil0 ->
      let u177_140'16 = "expected an argument" in
      error u177_140'16 k
    | Cons1(arg1,more) ->
      match more with
      | Cons1(_,_) ->
        let u178_143'21 = "expected exactly one argument" in
        error u178_143'21 k
      | Nil0 ->
        let k [error,fact,newline,put_int,put_string] u179_145'24 =
          match u179_145'24 with
          | None1 ->
            let u180_146'24 = "expected arg1 to be numeric" in
            error u180_146'24 k
          | Some0(n) ->
            let k [n,newline,put_int,put_string] res =
              let k [newline,put_int,put_string,res] _ =
                let k [newline,put_int,res] _ =
                  let k [newline] _ =
                    let u182_152'19 = Unit0 in
                    newline u182_152'19 k in
                  put_int res k in
                let u181_150'22 = " --> " in
                put_string u181_150'22 k in
              put_int n k in
            fact n k in
        parse_num arg1 k in
  let u176_138'13 = "fact: " in
  put_string u176_138'13 k in
let fallback = fun [+,append,eq_char,explode,length,map,newline,put_char,put_chars,put_int] line k ->
  let k [+,append,explode,length,line,newline,put_char,put_chars,put_int] star_the_ohs =
    let k [append,explode,line,newline,put_char,put_chars,put_int,star_the_ohs] n =
      let k [n,newline,put_char,put_int] _ =
        let k [n,newline,put_char,put_int] _ =
          let k [n,newline,put_char,put_int] _ =
            let k [newline,put_char] _ =
              let k [newline] _ =
                let u199_162'10 = Unit0 in
                newline u199_162'10 k in
              let u198_161'11 = '}' in
              put_char u198_161'11 k in
            put_int n k in
          let u197_159'11 = '{' in
          put_char u197_159'11 k in
        let u196_158'11 = ' ' in
        put_char u196_158'11 k in
      let k [put_chars] u191_157'44 = put_chars u191_157'44 k in
      let k [line,star_the_ohs] u192_157'20 =
        let k [u192_157'20] u195_157'58 = u192_157'20 u195_157'58 k in
        star_the_ohs line k in
      let k [append] u193_157'29 = append u193_157'29 k in
      let u194_157'29 = "You wrote: " in
      explode u194_157'29 k in
    let k [length,line] u188_156'14 =
      let k [u188_156'14] u190_156'23 = u188_156'14 u190_156'23 k in
      length line k in
    let u189_156'10 = 100 in
    + u189_156'10 k in
  let u183 = fun [eq_char] c k ->
    let k [c] u184_155'48 =
      match u184_155'48 with
      | true1 ->
        let v187 = '*' in
        k v187
      | false0 -> k c in
    let k [] u185_155'46 =
      let u186_155'48 = 'o' in
      u185_155'46 u186_155'48 k in
    eq_char c k in
  map u183 k in
let split_words = fun [::,eq_char,reverse] s k ->
  let loop = fix (fun [::,eq_char,reverse] loop accWs k ->
    let v217 = fun [::,accWs,eq_char,loop,reverse] accCs k ->
      let v216 = fun [::,accCs,accWs,eq_char,loop,reverse] xs k ->
        match xs with
        | Nil0 ->
          let k [reverse] u200_167'38 = reverse u200_167'38 k in
          let k [accWs] u201_167'35 = u201_167'35 accWs k in
          let k [::] u202_167'29 = :: u202_167'29 k in
          reverse accCs k
        | Cons1(x,xs) ->
          let k [::,accCs,accWs,loop,reverse,x,xs] u203_170'20 =
            match u203_170'20 with
            | true1 ->
              let k [xs] u206_170'59 = u206_170'59 xs k in
              let k [] u207_170'34 =
                let u211_170'59 = Nil0 in
                u207_170'34 u211_170'59 k in
              let k [loop] u208_170'52 = loop u208_170'52 k in
              let k [accWs] u209_170'49 = u209_170'49 accWs k in
              let k [::] u210_170'43 = :: u210_170'43 k in
              reverse accCs k
            | false0 ->
              let k [xs] u212_171'23 = u212_171'23 xs k in
              let k [::,accCs,x] u213_171'17 =
                let k [u213_171'17] u214_171'27 = u213_171'17 u214_171'27 k in
                let k [accCs] u215_171'25 = u215_171'25 accCs k in
                :: x k in
              loop accWs k in
          let k [] u204_170'18 =
            let u205_170'20 = ' ' in
            u204_170'18 u205_170'20 k in
          eq_char x k in
      k v216 in
    k v217) in
  let k [s] u218_173'10 = u218_173'10 s k in
  let k [] u219_173'7 =
    let u221_173'10 = Nil0 in
    u219_173'7 u221_173'10 k in
  let u220_173'7 = Nil0 in
  loop u220_173'7 k in
let execute = fun [eq_char_list,explode,fallback,runfact,runfib,split_words] line k ->
  let k [eq_char_list,explode,fallback,line,runfact,runfib] words =
    match words with
    | Nil0 ->
      let v222 = Unit0 in
      k v222
    | Cons1(command,args) ->
      let k [args,command,eq_char_list,explode,fallback,line,runfact,runfib] u223_180'29 =
        match u223_180'29 with
        | true1 -> runfib args k
        | false0 ->
          let k [args,fallback,line,runfact] u227_181'31 =
            match u227_181'31 with
            | true1 -> runfact args k
            | false0 -> fallback line k in
          let k [explode] u228_181'23 =
            let k [u228_181'23] u229_181'40 = u228_181'23 u229_181'40 k in
            let u230_181'40 = "fact" in
            explode u230_181'40 k in
          eq_char_list command k in
      let k [explode] u224_180'21 =
        let k [u224_180'21] u225_180'38 = u224_180'21 u225_180'38 k in
        let u226_180'38 = "fib" in
        explode u226_180'38 k in
      eq_char_list command k in
  split_words line k in
let mainloop = fix (fun [execute,put_char,read_line] mainloop _ k ->
  let k [execute,mainloop,put_char,read_line] _ =
    let k [execute,mainloop,read_line] _ =
      let k [execute,mainloop] xs =
        let k [mainloop] _ =
          let u234_189'11 = Unit0 in
          mainloop u234_189'11 k in
        execute xs k in
      let u233_187'21 = Unit0 in
      read_line u233_187'21 k in
    let u232_186'11 = ' ' in
    put_char u232_186'11 k in
  let u231_185'11 = '>' in
  put_char u231_185'11 k) in
let k [mainloop,put_string_newline] _ =
  let main = fun [mainloop,put_string_newline] _ k ->
    let k [mainloop,put_string_newline] _ =
      let k [put_string_newline] _ =
        let u238_196'21 = "NEVER" in
        put_string_newline u238_196'21 k in
      let u237_195'20 = Unit0 in
      mainloop u237_195'20 k in
    let u236_194'21 = "RUN" in
    put_string_newline u236_194'21 k in
  let u239_0'0 = Unit0 in
  main u239_0'0 k in
let u235_191'28 = "LOAD" in
put_string_newline u235_191'28 k
