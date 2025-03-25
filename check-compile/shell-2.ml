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
let not = fun [] b k ->
  match b with
  | true1 ->
    let con_24 = false0 in
    k con_24
  | false0 ->
    let con_25 = true1 in
    k con_25 in
let > = fun [<] a k ->
  let lam_27 = fun [<,a] b k ->
    let k [a] app_26_7'16 = app_26_7'16 a k in
    < b k in
  k lam_27 in
let <= = fun [<,not] a k ->
  let lam_30 = fun [<,a,not] b k ->
    let k [not] app_28_8'24 = not app_28_8'24 k in
    let k [a] app_29_8'22 = app_29_8'22 a k in
    < b k in
  k lam_30 in
let >= = fun [<,not] a k ->
  let lam_33 = fun [<,a,not] b k ->
    let k [not] app_31_9'24 = not app_31_9'24 k in
    let k [b] app_32_9'22 = app_32_9'22 b k in
    < a k in
  k lam_33 in
let parse_digit = fun [-,<=,>=,ord] c k ->
  let k [<=,>=] n =
    let k [<=,n] app_38_16'10 =
      match app_38_16'10 with
      | true1 ->
        let k [n] app_41_16'25 =
          match app_41_16'25 with
          | true1 ->
            let con_44 = Some0[n] in
            k con_44
          | false0 ->
            let con_45 = None1 in
            k con_45 in
        let k [] app_42_16'22 =
          let lit_43_16'25 = 9 in
          app_42_16'22 lit_43_16'25 k in
        <= n k
      | false0 ->
        let con_46 = None1 in
        k con_46 in
    let k [] app_39_16'7 =
      let lit_40_16'10 = 0 in
      app_39_16'7 lit_40_16'10 k in
    >= n k in
  let k [ord] app_34_14'16 =
    let k [app_34_14'16] app_36_14'22 = app_34_14'16 app_36_14'22 k in
    let lit_37_14'22 = '0' in
    ord lit_37_14'22 k in
  let k [-] app_35_14'14 = - app_35_14'14 k in
  ord c k in
let parse_num = fun [( * ),+,parse_digit] s k ->
  let loop = fix (fun [( * ),+,parse_digit] loop acc k ->
    let lam_56 = fun [( * ),+,acc,loop,parse_digit] xs k ->
      match xs with
      | Nil0 ->
        let con_47 = Some0[acc] in
        k con_47
      | Cons1(x,xs) ->
        let k [( * ),+,acc,loop,xs] app_48_23'26 =
          match app_48_23'26 with
          | None1 ->
            let con_49 = None1 in
            k con_49
          | Some0(d) ->
            let k [xs] app_50_25'25 = app_50_25'25 xs k in
            let k [loop] app_51_25'37 = loop app_51_25'37 k in
            let k [d] app_52_25'35 = app_52_25'35 d k in
            let k [+] app_53_25'31 = + app_53_25'31 k in
            let k [acc] app_54_25'29 = app_54_25'29 acc k in
            let lit_55_25'26 = 10 in
            ( * ) lit_55_25'26 k in
        parse_digit x k in
    k lam_56) in
  let k [s] app_57_27'7 = app_57_27'7 s k in
  let lit_58_27'7 = 0 in
  loop lit_58_27'7 k in
let cons = fun [::] x k ->
  let lam_60 = fun [::,x] xs k ->
    let k [xs] app_59_29'18 = app_59_29'18 xs k in
    :: x k in
  k lam_60 in
let eq_list = fix (fun [] eq_list eq k ->
  let lam_70 = fun [eq,eq_list] xs k ->
    let lam_69 = fun [eq,eq_list,xs] ys k ->
      match xs with
      | Nil0 ->
        match ys with
        | Nil0 ->
          let con_61 = true1 in
          k con_61
        | Cons1(_,_) ->
          let con_62 = false0 in
          k con_62
      | Cons1(x,xs) ->
        match ys with
        | Nil0 ->
          let con_63 = false0 in
          k con_63
        | Cons1(y,ys) ->
          let k [eq,eq_list,xs,ys] app_64_38'16 =
            match app_64_38'16 with
            | true1 ->
              let k [ys] app_66_38'34 = app_66_38'34 ys k in
              let k [xs] app_67_38'31 = app_67_38'31 xs k in
              eq_list eq k
            | false0 ->
              let con_68 = false0 in
              k con_68 in
          let k [y] app_65_38'14 = app_65_38'14 y k in
          eq x k in
    k lam_69 in
  k lam_70) in
let eq_char_list = fun [eq_char,eq_list] a k ->
  let lam_73 = fun [a,eq_char,eq_list] b k ->
    let k [b] app_71_40'39 = app_71_40'39 b k in
    let k [a] app_72_40'31 = app_72_40'31 a k in
    eq_list eq_char k in
  k lam_73 in
let append = fix (fun [cons] append xs k ->
  let lam_77 = fun [append,cons,xs] ys k ->
    match xs with
    | Nil0 -> k ys
    | Cons1(x,xs) ->
      let k [append,xs,ys] app_74_45'18 =
        let k [app_74_45'18] app_75_45'31 = app_74_45'18 app_75_45'31 k in
        let k [ys] app_76_45'28 = app_76_45'28 ys k in
        append xs k in
      cons x k in
  k lam_77) in
let reverse = fun [cons] xs k ->
  let loop = fix (fun [cons] loop acc k ->
    let lam_81 = fun [acc,cons,loop] xs k ->
      match xs with
      | Nil0 -> k acc
      | Cons1(x,xs) ->
        let k [xs] app_78_51'20 = app_78_51'20 xs k in
        let k [loop] app_79_51'28 = loop app_79_51'28 k in
        let k [acc] app_80_51'26 = app_80_51'26 acc k in
        cons x k in
    k lam_81) in
  let k [xs] app_82_53'7 = app_82_53'7 xs k in
  let con_83_53'7 = Nil0 in
  loop con_83_53'7 k in
let map = fix (fun [::] map f k ->
  let lam_89 = fun [::,f,map] xs k ->
    match xs with
    | Nil0 ->
      let con_84 = Nil0 in
      k con_84
    | Cons1(x,xs) ->
      let k [f,map,xs] app_85_58'17 =
        let k [app_85_58'17] app_87_58'26 = app_85_58'17 app_87_58'26 k in
        let k [xs] app_88_58'24 = app_88_58'24 xs k in
        map f k in
      let k [::] app_86_58'15 = :: app_86_58'15 k in
      f x k in
  k lam_89) in
let length = fix (fun [+] length xs k ->
  match xs with
  | Nil0 ->
    let lit_90 = 0 in
    k lit_90
  | Cons1(_,xs) ->
    let k [length,xs] app_91_63'17 =
      let k [app_91_63'17] app_93_63'27 = app_91_63'17 app_93_63'27 k in
      length xs k in
    let lit_92_63'17 = 1 in
    + lit_92_63'17 k) in
let chars_of_int = fun [%,+,/,=,chr,cons,ord] i k ->
  let k [%,+,/,=,chr,cons,i] ord0 =
    let char_of_digit = fun [+,chr,ord0] c k ->
      let k [chr] app_95_67'36 = chr app_95_67'36 k in
      let k [c] app_96_67'34 = app_96_67'34 c k in
      + ord0 k in
    let loop = fix (fun [%,/,=,char_of_digit,cons] loop acc k ->
      let lam_110 = fun [%,/,=,acc,char_of_digit,cons,loop] i k ->
        let k [%,/,acc,char_of_digit,cons,i,loop] app_97_69'11 =
          match app_97_69'11 with
          | true1 -> k acc
          | false0 ->
            let k [/,i] app_100_70'11 =
              let k [app_100_70'11] app_107_70'48 = app_100_70'11 app_107_70'48 k in
              let k [] app_108_70'47 =
                let lit_109_70'48 = 10 in
                app_108_70'47 lit_109_70'48 k in
              / i k in
            let k [loop] app_101_70'40 = loop app_101_70'40 k in
            let k [acc] app_102_70'17 = app_102_70'17 acc k in
            let k [cons] app_103_70'32 = cons app_103_70'32 k in
            let k [char_of_digit] app_104_70'35 = char_of_digit app_104_70'35 k in
            let k [] app_105_70'34 =
              let lit_106_70'35 = 10 in
              app_105_70'34 lit_106_70'35 k in
            % i k in
        let k [] app_98_69'9 =
          let lit_99_69'11 = 0 in
          app_98_69'9 lit_99_69'11 k in
        = i k in
      k lam_110) in
    let k [cons,i,loop] app_111_72'9 =
      match app_111_72'9 with
      | true1 ->
        let k [] app_114_72'21 =
          let con_116_72'25 = Nil0 in
          app_114_72'21 con_116_72'25 k in
        let lit_115_72'21 = '0' in
        cons lit_115_72'21 k
      | false0 ->
        let k [i] app_117_72'38 = app_117_72'38 i k in
        let con_118_72'38 = Nil0 in
        loop con_118_72'38 k in
    let k [] app_112_72'7 =
      let lit_113_72'9 = 0 in
      app_112_72'7 lit_113_72'9 k in
    = i k in
  let lit_94_66'17 = '0' in
  ord lit_94_66'17 k in
let put_chars = fix (fun [put_char] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_119 = Unit0 in
    k con_119
  | Cons1(x,xs) ->
    let k [put_chars,xs] _ = put_chars xs k in
    put_char x k) in
let put_string = fun [explode,put_chars] s k ->
  let k [put_chars] app_120_79'38 = put_chars app_120_79'38 k in
  explode s k in
let put_int = fun [chars_of_int,put_chars] i k ->
  let k [put_chars] app_121_81'40 = put_chars app_121_81'40 k in
  chars_of_int i k in
let newline = fun [put_char] _ k ->
  let lit_122_83'26 = '\n' in
  put_char lit_122_83'26 k in
let put_string_newline = fun [newline,put_string] s k ->
  let k [newline] _ =
    let con_123_87'10 = Unit0 in
    newline con_123_87'10 k in
  put_string s k in
let read_line = fun [<=,=,>,chr,cons,eq_char,get_char,newline,ord,put_char,reverse] _ k ->
  let loop = fix (fun [<=,=,>,chr,cons,eq_char,get_char,newline,ord,put_char,reverse] loop acc k ->
    let k [<=,=,>,acc,chr,cons,eq_char,loop,newline,ord,put_char,reverse] c =
      let k [<=,=,>,acc,c,chr,cons,eq_char,loop,newline,put_char,reverse] n =
        let k [<=,=,>,acc,c,chr,cons,loop,n,newline,put_char,reverse] app_125_93'17 =
          match app_125_93'17 with
          | true1 ->
            let k [acc,reverse] _ = reverse acc k in
            let con_128_93'35 = Unit0 in
            newline con_128_93'35 k
          | false0 ->
            let k [=,>,acc,c,chr,cons,loop,n,put_char] app_129_94'14 =
              match app_129_94'14 with
              | true1 -> loop acc k
              | false0 ->
                let k [=,acc,c,chr,cons,loop,n,put_char] app_132_95'15 =
                  match app_132_95'15 with
                  | true1 -> loop acc k
                  | false0 ->
                    let k [acc,c,chr,cons,loop,put_char] app_135_96'17 =
                      match app_135_96'17 with
                      | true1 ->
                        match acc with
                        | Nil0 -> loop acc k
                        | Cons1(_,tail) ->
                          let k [chr,loop,put_char,tail] _ =
                            let k [chr,loop,put_char,tail] _ =
                              let k [loop,tail] _ = loop tail k in
                              let k [put_char] app_141_103'29 = put_char app_141_103'29 k in
                              let lit_142_103'29 = 8 in
                              chr lit_142_103'29 k in
                            let lit_140_102'24 = ' ' in
                            put_char lit_140_102'24 k in
                          let k [put_char] app_138_101'29 = put_char app_138_101'29 k in
                          let lit_139_101'29 = 8 in
                          chr lit_139_101'29 k
                      | false0 ->
                        let k [acc,c,cons,loop] _ =
                          let k [loop] app_143_106'38 = loop app_143_106'38 k in
                          let k [acc] app_144_106'36 = app_144_106'36 acc k in
                          cons c k in
                        put_char c k in
                    let k [] app_136_96'15 =
                      let lit_137_96'17 = 127 in
                      app_136_96'15 lit_137_96'17 k in
                    = n k in
                let k [] app_133_95'13 =
                  let lit_134_95'15 = 127 in
                  app_133_95'13 lit_134_95'15 k in
                > n k in
            let k [] app_130_94'11 =
              let lit_131_94'14 = 31 in
              app_130_94'11 lit_131_94'14 k in
            <= n k in
        let k [] app_126_93'15 =
          let lit_127_93'17 = '\n' in
          app_126_93'15 lit_127_93'17 k in
        eq_char c k in
      ord c k in
    let con_124_91'21 = Unit0 in
    get_char con_124_91'21 k) in
  let con_145_108'7 = Nil0 in
  loop con_145_108'7 k in
let fib = fix (fun [+,-,<] fib n k ->
  let k [+,-,fib,n] app_146_112'9 =
    match app_146_112'9 with
    | true1 -> k n
    | false0 ->
      let k [-,fib,n] app_149_112'33 =
        let k [app_149_112'33] app_154_112'39 = app_149_112'33 app_154_112'39 k in
        let k [fib] app_155_112'42 = fib app_155_112'42 k in
        let k [] app_156_112'41 =
          let lit_157_112'42 = 2 in
          app_156_112'41 lit_157_112'42 k in
        - n k in
      let k [+] app_150_112'27 = + app_150_112'27 k in
      let k [fib] app_151_112'30 = fib app_151_112'30 k in
      let k [] app_152_112'29 =
        let lit_153_112'30 = 1 in
        app_152_112'29 lit_153_112'30 k in
      - n k in
  let k [] app_147_112'7 =
    let lit_148_112'9 = 2 in
    app_147_112'7 lit_148_112'9 k in
  < n k) in
let fact = fix (fun [( * ),-,>=] fact n k ->
  let k [( * ),-,fact,n] app_158_116'10 =
    match app_158_116'10 with
    | true1 ->
      let k [n] app_161_116'28 = app_161_116'28 n k in
      let k [( * )] app_162_116'22 = ( * ) app_162_116'22 k in
      let k [fact] app_163_116'25 = fact app_163_116'25 k in
      let k [] app_164_116'24 =
        let lit_165_116'25 = 1 in
        app_164_116'24 lit_165_116'25 k in
      - n k
    | false0 ->
      let lit_166 = 1 in
      k lit_166 in
  let k [] app_159_116'7 =
    let lit_160_116'10 = 2 in
    app_159_116'7 lit_160_116'10 k in
  >= n k) in
let error = fun [newline,put_string] s k ->
  let k [newline,put_string,s] _ =
    let k [newline] _ =
      let con_168_118'58 = Unit0 in
      newline con_168_118'58 k in
    put_string s k in
  let lit_167_118'25 = "ERROR: " in
  put_string lit_167_118'25 k in
let runfib = fun [error,fib,newline,parse_num,put_int,put_string] args k ->
  let k [args,error,fib,newline,parse_num,put_int,put_string] _ =
    match args with
    | Nil0 ->
      let lit_170_123'16 = "expected an argument" in
      error lit_170_123'16 k
    | Cons1(arg1,more) ->
      match more with
      | Cons1(_,_) ->
        let lit_171_126'21 = "expected exactly one argument" in
        error lit_171_126'21 k
      | Nil0 ->
        let k [error,fib,newline,put_int,put_string] app_172_128'24 =
          match app_172_128'24 with
          | None1 ->
            let lit_173_129'24 = "expected arg1 to be numeric" in
            error lit_173_129'24 k
          | Some0(n) ->
            let k [n,newline,put_int,put_string] res =
              let k [newline,put_int,put_string,res] _ =
                let k [newline,put_int,res] _ =
                  let k [newline] _ =
                    let con_175_135'19 = Unit0 in
                    newline con_175_135'19 k in
                  put_int res k in
                let lit_174_133'22 = " --> " in
                put_string lit_174_133'22 k in
              put_int n k in
            fib n k in
        parse_num arg1 k in
  let lit_169_121'13 = "fib: " in
  put_string lit_169_121'13 k in
let runfact = fun [error,fact,newline,parse_num,put_int,put_string] args k ->
  let k [args,error,fact,newline,parse_num,put_int,put_string] _ =
    match args with
    | Nil0 ->
      let lit_177_140'16 = "expected an argument" in
      error lit_177_140'16 k
    | Cons1(arg1,more) ->
      match more with
      | Cons1(_,_) ->
        let lit_178_143'21 = "expected exactly one argument" in
        error lit_178_143'21 k
      | Nil0 ->
        let k [error,fact,newline,put_int,put_string] app_179_145'24 =
          match app_179_145'24 with
          | None1 ->
            let lit_180_146'24 = "expected arg1 to be numeric" in
            error lit_180_146'24 k
          | Some0(n) ->
            let k [n,newline,put_int,put_string] res =
              let k [newline,put_int,put_string,res] _ =
                let k [newline,put_int,res] _ =
                  let k [newline] _ =
                    let con_182_152'19 = Unit0 in
                    newline con_182_152'19 k in
                  put_int res k in
                let lit_181_150'22 = " --> " in
                put_string lit_181_150'22 k in
              put_int n k in
            fact n k in
        parse_num arg1 k in
  let lit_176_138'13 = "fact: " in
  put_string lit_176_138'13 k in
let fallback = fun [+,append,eq_char,explode,length,map,newline,put_char,put_chars,put_int] line k ->
  let k [+,append,explode,length,line,newline,put_char,put_chars,put_int] star_the_ohs =
    let k [append,explode,line,newline,put_char,put_chars,put_int,star_the_ohs] n =
      let k [n,newline,put_char,put_int] _ =
        let k [n,newline,put_char,put_int] _ =
          let k [n,newline,put_char,put_int] _ =
            let k [newline,put_char] _ =
              let k [newline] _ =
                let con_199_162'10 = Unit0 in
                newline con_199_162'10 k in
              let lit_198_161'11 = '}' in
              put_char lit_198_161'11 k in
            put_int n k in
          let lit_197_159'11 = '{' in
          put_char lit_197_159'11 k in
        let lit_196_158'11 = ' ' in
        put_char lit_196_158'11 k in
      let k [put_chars] app_191_157'44 = put_chars app_191_157'44 k in
      let k [line,star_the_ohs] app_192_157'20 =
        let k [app_192_157'20] app_195_157'58 = app_192_157'20 app_195_157'58 k in
        star_the_ohs line k in
      let k [append] app_193_157'29 = append app_193_157'29 k in
      let lit_194_157'29 = "You wrote: " in
      explode lit_194_157'29 k in
    let k [length,line] app_188_156'14 =
      let k [app_188_156'14] app_190_156'23 = app_188_156'14 app_190_156'23 k in
      length line k in
    let lit_189_156'10 = 100 in
    + lit_189_156'10 k in
  let lam_183 = fun [eq_char] c k ->
    let k [c] app_184_155'48 =
      match app_184_155'48 with
      | true1 ->
        let lit_187 = '*' in
        k lit_187
      | false0 -> k c in
    let k [] app_185_155'46 =
      let lit_186_155'48 = 'o' in
      app_185_155'46 lit_186_155'48 k in
    eq_char c k in
  map lam_183 k in
let split_words = fun [::,eq_char,reverse] s k ->
  let loop = fix (fun [::,eq_char,reverse] loop accWs k ->
    let lam_217 = fun [::,accWs,eq_char,loop,reverse] accCs k ->
      let lam_216 = fun [::,accCs,accWs,eq_char,loop,reverse] xs k ->
        match xs with
        | Nil0 ->
          let k [reverse] app_200_167'38 = reverse app_200_167'38 k in
          let k [accWs] app_201_167'35 = app_201_167'35 accWs k in
          let k [::] app_202_167'29 = :: app_202_167'29 k in
          reverse accCs k
        | Cons1(x,xs) ->
          let k [::,accCs,accWs,loop,reverse,x,xs] app_203_170'20 =
            match app_203_170'20 with
            | true1 ->
              let k [xs] app_206_170'59 = app_206_170'59 xs k in
              let k [] app_207_170'34 =
                let con_211_170'59 = Nil0 in
                app_207_170'34 con_211_170'59 k in
              let k [loop] app_208_170'52 = loop app_208_170'52 k in
              let k [accWs] app_209_170'49 = app_209_170'49 accWs k in
              let k [::] app_210_170'43 = :: app_210_170'43 k in
              reverse accCs k
            | false0 ->
              let k [xs] app_212_171'23 = app_212_171'23 xs k in
              let k [::,accCs,x] app_213_171'17 =
                let k [app_213_171'17] app_214_171'27 = app_213_171'17 app_214_171'27 k in
                let k [accCs] app_215_171'25 = app_215_171'25 accCs k in
                :: x k in
              loop accWs k in
          let k [] app_204_170'18 =
            let lit_205_170'20 = ' ' in
            app_204_170'18 lit_205_170'20 k in
          eq_char x k in
      k lam_216 in
    k lam_217) in
  let k [s] app_218_173'10 = app_218_173'10 s k in
  let k [] app_219_173'7 =
    let con_221_173'10 = Nil0 in
    app_219_173'7 con_221_173'10 k in
  let con_220_173'7 = Nil0 in
  loop con_220_173'7 k in
let execute = fun [eq_char_list,explode,fallback,runfact,runfib,split_words] line k ->
  let k [eq_char_list,explode,fallback,line,runfact,runfib] words =
    match words with
    | Nil0 ->
      let con_222 = Unit0 in
      k con_222
    | Cons1(command,args) ->
      let k [args,command,eq_char_list,explode,fallback,line,runfact,runfib] app_223_180'29 =
        match app_223_180'29 with
        | true1 -> runfib args k
        | false0 ->
          let k [args,fallback,line,runfact] app_227_181'31 =
            match app_227_181'31 with
            | true1 -> runfact args k
            | false0 -> fallback line k in
          let k [explode] app_228_181'23 =
            let k [app_228_181'23] app_229_181'40 = app_228_181'23 app_229_181'40 k in
            let lit_230_181'40 = "fact" in
            explode lit_230_181'40 k in
          eq_char_list command k in
      let k [explode] app_224_180'21 =
        let k [app_224_180'21] app_225_180'38 = app_224_180'21 app_225_180'38 k in
        let lit_226_180'38 = "fib" in
        explode lit_226_180'38 k in
      eq_char_list command k in
  split_words line k in
let mainloop = fix (fun [execute,put_char,read_line] mainloop _ k ->
  let k [execute,mainloop,put_char,read_line] _ =
    let k [execute,mainloop,read_line] _ =
      let k [execute,mainloop] xs =
        let k [mainloop] _ =
          let con_234_189'11 = Unit0 in
          mainloop con_234_189'11 k in
        execute xs k in
      let con_233_187'21 = Unit0 in
      read_line con_233_187'21 k in
    let lit_232_186'11 = ' ' in
    put_char lit_232_186'11 k in
  let lit_231_185'11 = '>' in
  put_char lit_231_185'11 k) in
let k [mainloop,put_string_newline] _ =
  let main = fun [mainloop,put_string_newline] _ k ->
    let k [mainloop,put_string_newline] _ =
      let k [put_string_newline] _ =
        let lit_238_196'21 = "NEVER" in
        put_string_newline lit_238_196'21 k in
      let con_237_195'20 = Unit0 in
      mainloop con_237_195'20 k in
    let lit_236_194'21 = "RUN" in
    put_string_newline lit_236_194'21 k in
  let con_239_0'0 = Unit0 in
  main con_239_0'0 k in
let lit_235_191'28 = "LOAD" in
put_string_newline lit_235_191'28 k
