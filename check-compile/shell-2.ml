(*stage2*)
let k () = ()
let + = fun [] x k ->
  let lam_2_0'0 = fun [x] y k ->
    let prim_1_0'0 = PRIM_AddInt(x,y) in
    k prim_1_0'0 in
  k lam_2_0'0 in
let - = fun [] x k ->
  let lam_4_0'0 = fun [x] y k ->
    let prim_3_0'0 = PRIM_SubInt(x,y) in
    k prim_3_0'0 in
  k lam_4_0'0 in
let ( * ) = fun [] x k ->
  let lam_6_0'0 = fun [x] y k ->
    let prim_5_0'0 = PRIM_MulInt(x,y) in
    k prim_5_0'0 in
  k lam_6_0'0 in
let / = fun [] x k ->
  let lam_8_0'0 = fun [x] y k ->
    let prim_7_0'0 = PRIM_DivInt(x,y) in
    k prim_7_0'0 in
  k lam_8_0'0 in
let % = fun [] x k ->
  let lam_10_0'0 = fun [x] y k ->
    let prim_9_0'0 = PRIM_ModInt(x,y) in
    k prim_9_0'0 in
  k lam_10_0'0 in
let < = fun [] x k ->
  let lam_12_0'0 = fun [x] y k ->
    let prim_11_0'0 = PRIM_LessInt(x,y) in
    k prim_11_0'0 in
  k lam_12_0'0 in
let = = fun [] x k ->
  let lam_14_0'0 = fun [x] y k ->
    let prim_13_0'0 = PRIM_EqInt(x,y) in
    k prim_13_0'0 in
  k lam_14_0'0 in
let eq_char = fun [] x k ->
  let lam_16_0'0 = fun [x] y k ->
    let prim_15_0'0 = PRIM_EqChar(x,y) in
    k prim_15_0'0 in
  k lam_16_0'0 in
let ord = fun [] x k ->
  let prim_17_0'0 = PRIM_CharOrd(x) in
  k prim_17_0'0 in
let chr = fun [] x k ->
  let prim_18_0'0 = PRIM_CharChr(x) in
  k prim_18_0'0 in
let explode = fun [] x k ->
  let prim_19_0'0 = PRIM_Explode(x) in
  k prim_19_0'0 in
let put_char = fun [] x k ->
  let prim_20_0'0 = PRIM_PutChar(x) in
  k prim_20_0'0 in
let get_char = fun [] x k ->
  let prim_21_0'0 = PRIM_GetChar(x) in
  k prim_21_0'0 in
let :: = fun [] x k ->
  let lam_23_0'0 = fun [x] y k ->
    let con_22_0'0 = Cons1[x,y] in
    k con_22_0'0 in
  k lam_23_0'0 in
let not = fun [] b k ->
  match b with
  | true1 ->
    let con_24_4'12 = false0 in
    k con_24_4'12
  | false0 ->
    let con_25_5'13 = true1 in
    k con_25_5'13 in
let > = fun [<] a k ->
  let lam_27_7'10 = fun [<,a] b k ->
    let k [a] app_26_7'16 = app_26_7'16 a k in
    < b k in
  k lam_27_7'10 in
let <= = fun [<,not] a k ->
  let lam_30_8'11 = fun [<,a,not] b k ->
    let k [not] app_28_8'24 = not app_28_8'24 k in
    let k [a] app_29_8'22 = app_29_8'22 a k in
    < b k in
  k lam_30_8'11 in
let >= = fun [<,not] a k ->
  let lam_33_9'11 = fun [<,a,not] b k ->
    let k [not] app_31_9'24 = not app_31_9'24 k in
    let k [b] app_32_9'22 = app_32_9'22 b k in
    < a k in
  k lam_33_9'11 in
let put_char = fun [+,-,=,>,chr,eq_char,ord,put_char] c k ->
  let backspace = 8 in
  let k [+,-,=,>,backspace,c,chr,eq_char,ord,put_char] n =
    let k [+,-,>,c,chr,eq_char,n,ord,put_char] app_34_15'9 =
      match app_34_15'9 with
      | true1 -> put_char c k
      | false0 ->
        let k [+,-,>,c,chr,n,ord,put_char] app_36_16'17 =
          match app_36_16'17 with
          | true1 -> put_char c k
          | false0 ->
            let k [+,-,c,chr,n,ord,put_char] app_39_17'13 =
              match app_39_17'13 with
              | true1 -> put_char c k
              | false0 ->
                let k [+,-,chr,n,ord,put_char] _ =
                  let k [put_char] app_43_18'37 = put_char app_43_18'37 k in
                  let k [chr] app_44_18'52 = chr app_44_18'52 k in
                  let k [] app_45_18'50 =
                    let lit_50_18'52 = 1 in
                    app_45_18'50 lit_50_18'52 k in
                  let k [-] app_46_18'48 = - app_46_18'48 k in
                  let k [n] app_47_18'46 = app_47_18'46 n k in
                  let k [+] app_48_18'42 = + app_48_18'42 k in
                  let lit_49_18'42 = 'A' in
                  ord lit_49_18'42 k in
                let lit_42_18'18 = '^' in
                put_char lit_42_18'18 k in
            let k [] app_40_17'11 =
              let lit_41_17'13 = 26 in
              app_40_17'11 lit_41_17'13 k in
            > n k in
        let k [] app_37_16'15 =
          let lit_38_16'17 = '\n' in
          app_37_16'15 lit_38_16'17 k in
        eq_char c k in
    let k [backspace] app_35_15'7 = app_35_15'7 backspace k in
    = n k in
  ord c k in
let erase_char = fun [chr,put_char] _ k ->
  let k [put_char] backspace =
    let k [backspace,put_char] _ =
      let k [backspace,put_char] _ = put_char backspace k in
      let lit_52_24'11 = ' ' in
      put_char lit_52_24'11 k in
    put_char backspace k in
  let lit_51_21'22 = 8 in
  chr lit_51_21'22 k in
let parse_digit = fun [-,<=,>=,ord] c k ->
  let k [<=,>=] n =
    let k [<=,n] app_57_32'10 =
      match app_57_32'10 with
      | true1 ->
        let k [n] app_60_32'25 =
          match app_60_32'25 with
          | true1 ->
            let con_63_32'32 = Some0[n] in
            k con_63_32'32
          | false0 ->
            let con_64_32'45 = None1 in
            k con_64_32'45 in
        let k [] app_61_32'22 =
          let lit_62_32'25 = 9 in
          app_61_32'22 lit_62_32'25 k in
        <= n k
      | false0 ->
        let con_65_32'55 = None1 in
        k con_65_32'55 in
    let k [] app_58_32'7 =
      let lit_59_32'10 = 0 in
      app_58_32'7 lit_59_32'10 k in
    >= n k in
  let k [ord] app_53_30'16 =
    let k [app_53_30'16] app_55_30'22 = app_53_30'16 app_55_30'22 k in
    let lit_56_30'22 = '0' in
    ord lit_56_30'22 k in
  let k [-] app_54_30'14 = - app_54_30'14 k in
  ord c k in
let parse_num = fun [( * ),+,parse_digit] s k ->
  let loop = fix (fun [( * ),+,parse_digit] loop acc k ->
    let lam_75_35'19 = fun [( * ),+,acc,loop,parse_digit] xs k ->
      match xs with
      | Nil0 ->
        let con_66_37'12 = Some0[acc] in
        k con_66_37'12
      | Cons1(x,xs) ->
        let k [( * ),+,acc,loop,xs] app_67_39'26 =
          match app_67_39'26 with
          | None1 ->
            let con_68_40'18 = None1 in
            k con_68_40'18
          | Some0(d) ->
            let k [xs] app_69_41'25 = app_69_41'25 xs k in
            let k [loop] app_70_41'37 = loop app_70_41'37 k in
            let k [d] app_71_41'35 = app_71_41'35 d k in
            let k [+] app_72_41'31 = + app_72_41'31 k in
            let k [acc] app_73_41'29 = app_73_41'29 acc k in
            let lit_74_41'26 = 10 in
            ( * ) lit_74_41'26 k in
        parse_digit x k in
    k lam_75_35'19) in
  let k [s] app_76_43'7 = app_76_43'7 s k in
  let lit_77_43'7 = 0 in
  loop lit_77_43'7 k in
let cons = fun [::] x k ->
  let lam_79_45'11 = fun [::,x] xs k ->
    let k [xs] app_78_45'18 = app_78_45'18 xs k in
    :: x k in
  k lam_79_45'11 in
let eq_list = fix (fun [] eq_list eq k ->
  let lam_89_47'19 = fun [eq,eq_list] xs k ->
    let lam_88_47'22 = fun [eq,eq_list,xs] ys k ->
      match xs with
      | Nil0 ->
        match ys with
        | Nil0 ->
          let con_80_49'33 = true1 in
          k con_80_49'33
        | Cons1(_,_) ->
          let con_81_49'48 = false0 in
          k con_81_49'48
      | Cons1(x,xs) ->
        match ys with
        | Nil0 ->
          let con_82_52'13 = false0 in
          k con_82_52'13
        | Cons1(y,ys) ->
          let k [eq,eq_list,xs,ys] app_83_54'16 =
            match app_83_54'16 with
            | true1 ->
              let k [ys] app_85_54'34 = app_85_54'34 ys k in
              let k [xs] app_86_54'31 = app_86_54'31 xs k in
              eq_list eq k
            | false0 ->
              let con_87_54'45 = false0 in
              k con_87_54'45 in
          let k [y] app_84_54'14 = app_84_54'14 y k in
          eq x k in
    k lam_88_47'22 in
  k lam_89_47'19) in
let eq_char_list = fun [eq_char,eq_list] a k ->
  let lam_92_56'19 = fun [a,eq_char,eq_list] b k ->
    let k [b] app_90_56'39 = app_90_56'39 b k in
    let k [a] app_91_56'31 = app_91_56'31 a k in
    eq_list eq_char k in
  k lam_92_56'19 in
let append = fix (fun [cons] append xs k ->
  let lam_96_58'18 = fun [append,cons,xs] ys k ->
    match xs with
    | Nil0 -> k ys
    | Cons1(x,xs) ->
      let k [append,xs,ys] app_93_61'18 =
        let k [app_93_61'18] app_94_61'31 = app_93_61'18 app_94_61'31 k in
        let k [ys] app_95_61'28 = app_95_61'28 ys k in
        append xs k in
      cons x k in
  k lam_96_58'18) in
let reverse = fun [cons] xs k ->
  let loop = fix (fun [cons] loop acc k ->
    let lam_100_64'19 = fun [acc,cons,loop] xs k ->
      match xs with
      | Nil0 -> k acc
      | Cons1(x,xs) ->
        let k [xs] app_97_67'20 = app_97_67'20 xs k in
        let k [loop] app_98_67'28 = loop app_98_67'28 k in
        let k [acc] app_99_67'26 = app_99_67'26 acc k in
        cons x k in
    k lam_100_64'19) in
  let k [xs] app_101_69'7 = app_101_69'7 xs k in
  let con_102_69'7 = Nil0 in
  loop con_102_69'7 k in
let map = fix (fun [::] map f k ->
  let lam_108_71'14 = fun [::,f,map] xs k ->
    match xs with
    | Nil0 ->
      let con_103_73'10 = Nil0 in
      k con_103_73'10
    | Cons1(x,xs) ->
      let k [f,map,xs] app_104_74'17 =
        let k [app_104_74'17] app_106_74'26 = app_104_74'17 app_106_74'26 k in
        let k [xs] app_107_74'24 = app_107_74'24 xs k in
        map f k in
      let k [::] app_105_74'15 = :: app_105_74'15 k in
      f x k in
  k lam_108_71'14) in
let length = fix (fun [+] length xs k ->
  match xs with
  | Nil0 ->
    let lit_109_78'10 = 0 in
    k lit_109_78'10
  | Cons1(_,xs) ->
    let k [length,xs] app_110_79'17 =
      let k [app_110_79'17] app_112_79'27 = app_110_79'17 app_112_79'27 k in
      length xs k in
    let lit_111_79'17 = 1 in
    + lit_111_79'17 k) in
let chars_of_int = fun [%,+,/,=,chr,cons,ord] i k ->
  let k [%,+,/,=,chr,cons,i] ord0 =
    let char_of_digit = fun [+,chr,ord0] c k ->
      let k [chr] app_114_83'36 = chr app_114_83'36 k in
      let k [c] app_115_83'34 = app_115_83'34 c k in
      + ord0 k in
    let loop = fix (fun [%,/,=,char_of_digit,cons] loop acc k ->
      let lam_129_84'19 = fun [%,/,=,acc,char_of_digit,cons,loop] i k ->
        let k [%,/,acc,char_of_digit,cons,i,loop] app_116_85'11 =
          match app_116_85'11 with
          | true1 -> k acc
          | false0 ->
            let k [/,i] app_119_86'11 =
              let k [app_119_86'11] app_126_86'48 = app_119_86'11 app_126_86'48 k in
              let k [] app_127_86'47 =
                let lit_128_86'48 = 10 in
                app_127_86'47 lit_128_86'48 k in
              / i k in
            let k [loop] app_120_86'40 = loop app_120_86'40 k in
            let k [acc] app_121_86'17 = app_121_86'17 acc k in
            let k [cons] app_122_86'32 = cons app_122_86'32 k in
            let k [char_of_digit] app_123_86'35 = char_of_digit app_123_86'35 k in
            let k [] app_124_86'34 =
              let lit_125_86'35 = 10 in
              app_124_86'34 lit_125_86'35 k in
            % i k in
        let k [] app_117_85'9 =
          let lit_118_85'11 = 0 in
          app_117_85'9 lit_118_85'11 k in
        = i k in
      k lam_129_84'19) in
    let k [cons,i,loop] app_130_88'9 =
      match app_130_88'9 with
      | true1 ->
        let k [] app_133_88'21 =
          let con_135_88'25 = Nil0 in
          app_133_88'21 con_135_88'25 k in
        let lit_134_88'21 = '0' in
        cons lit_134_88'21 k
      | false0 ->
        let k [i] app_136_88'38 = app_136_88'38 i k in
        let con_137_88'38 = Nil0 in
        loop con_137_88'38 k in
    let k [] app_131_88'7 =
      let lit_132_88'9 = 0 in
      app_131_88'7 lit_132_88'9 k in
    = i k in
  let lit_113_82'17 = '0' in
  ord lit_113_82'17 k in
let put_chars = fix (fun [put_char] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_138_92'10 = Unit0 in
    k con_138_92'10
  | Cons1(x,xs) ->
    let k [put_chars,xs] _ = put_chars xs k in
    put_char x k) in
let put_string = fun [explode,put_chars] s k ->
  let k [put_chars] app_139_95'38 = put_chars app_139_95'38 k in
  explode s k in
let put_int = fun [chars_of_int,put_chars] i k ->
  let k [put_chars] app_140_97'40 = put_chars app_140_97'40 k in
  chars_of_int i k in
let newline = fun [put_char] _ k ->
  let lit_141_99'26 = '\n' in
  put_char lit_141_99'26 k in
let put_string_newline = fun [newline,put_string] s k ->
  let k [newline] _ =
    let con_142_103'10 = Unit0 in
    newline con_142_103'10 k in
  put_string s k in
let read_line = fun [::,<=,=,>,chr,cons,eq_char,erase_char,get_char,newline,ord,put_char,reverse] _ k ->
  let k [::,<=,=,>,cons,eq_char,erase_char,get_char,newline,ord,put_char,reverse] controlD =
    let loop = fix (fun [::,<=,=,>,cons,controlD,eq_char,erase_char,get_char,newline,ord,put_char,reverse] loop acc k ->
      let k [::,<=,=,>,acc,cons,controlD,eq_char,erase_char,loop,newline,ord,put_char,reverse] c =
        let k [::,<=,=,>,acc,c,cons,controlD,eq_char,erase_char,loop,newline,ord,put_char,reverse] n =
          let k [::,<=,=,>,acc,c,cons,controlD,eq_char,erase_char,loop,n,newline,ord,put_char,reverse] app_145_110'17 =
            match app_145_110'17 with
            | true1 ->
              let k [acc,reverse] _ = reverse acc k in
              let con_148_110'35 = Unit0 in
              newline con_148_110'35 k
            | false0 ->
              let k [::,<=,=,>,acc,c,cons,controlD,erase_char,loop,n,newline,ord,put_char,reverse] app_149_111'19 =
                match app_149_111'19 with
                | true1 ->
                  let k [::,acc,controlD,newline,reverse] _ =
                    let k [::,acc,controlD,reverse] _ =
                      let k [reverse] app_152_111'78 = reverse app_152_111'78 k in
                      let k [acc] app_153_111'75 = app_153_111'75 acc k in
                      :: controlD k in
                    let con_151_111'53 = Unit0 in
                    newline con_151_111'53 k in
                  put_char c k
                | false0 ->
                  let k [<=,=,acc,c,cons,erase_char,loop,n,ord,put_char] app_154_112'15 =
                    match app_154_112'15 with
                    | true1 -> loop acc k
                    | false0 ->
                      let k [<=,acc,c,cons,erase_char,loop,ord,put_char] app_157_113'17 =
                        match app_157_113'17 with
                        | true1 ->
                          match acc with
                          | Nil0 -> loop acc k
                          | Cons1(c,tail) ->
                            let k [erase_char,loop,tail] _ =
                              let k [loop,tail] _ = loop tail k in
                              let con_166_118'25 = Unit0 in
                              erase_char con_166_118'25 k in
                            let k [erase_char] app_160_117'28 =
                              match app_160_117'28 with
                              | true1 ->
                                let con_164_117'47 = Unit0 in
                                erase_char con_164_117'47 k
                              | false0 ->
                                let con_165_117'55 = Unit0 in
                                k con_165_117'55 in
                            let k [] app_161_117'25 =
                              let lit_163_117'28 = 26 in
                              app_161_117'25 lit_163_117'28 k in
                            let k [<=] app_162_117'23 = <= app_162_117'23 k in
                            ord c k
                        | false0 ->
                          let k [acc,c,cons,loop] _ =
                            let k [loop] app_167_121'38 = loop app_167_121'38 k in
                            let k [acc] app_168_121'36 = app_168_121'36 acc k in
                            cons c k in
                          put_char c k in
                      let k [] app_158_113'15 =
                        let lit_159_113'17 = 127 in
                        app_158_113'15 lit_159_113'17 k in
                      = n k in
                  let k [] app_155_112'13 =
                    let lit_156_112'15 = 127 in
                    app_155_112'13 lit_156_112'15 k in
                  > n k in
              let k [controlD] app_150_111'17 = app_150_111'17 controlD k in
              eq_char c k in
          let k [] app_146_110'15 =
            let lit_147_110'17 = '\n' in
            app_146_110'15 lit_147_110'17 k in
          eq_char c k in
        ord c k in
      let con_144_108'21 = Unit0 in
      get_char con_144_108'21 k) in
    let con_169_123'7 = Nil0 in
    loop con_169_123'7 k in
  let lit_143_106'21 = 4 in
  chr lit_143_106'21 k in
let fib = fix (fun [+,-,<] fib n k ->
  let k [+,-,fib,n] app_170_127'9 =
    match app_170_127'9 with
    | true1 -> k n
    | false0 ->
      let k [-,fib,n] app_173_127'33 =
        let k [app_173_127'33] app_178_127'39 = app_173_127'33 app_178_127'39 k in
        let k [fib] app_179_127'42 = fib app_179_127'42 k in
        let k [] app_180_127'41 =
          let lit_181_127'42 = 2 in
          app_180_127'41 lit_181_127'42 k in
        - n k in
      let k [+] app_174_127'27 = + app_174_127'27 k in
      let k [fib] app_175_127'30 = fib app_175_127'30 k in
      let k [] app_176_127'29 =
        let lit_177_127'30 = 1 in
        app_176_127'29 lit_177_127'30 k in
      - n k in
  let k [] app_171_127'7 =
    let lit_172_127'9 = 2 in
    app_171_127'7 lit_172_127'9 k in
  < n k) in
let fact = fix (fun [( * ),-,>=] fact n k ->
  let k [( * ),-,fact,n] app_182_131'10 =
    match app_182_131'10 with
    | true1 ->
      let k [n] app_185_131'28 = app_185_131'28 n k in
      let k [( * )] app_186_131'22 = ( * ) app_186_131'22 k in
      let k [fact] app_187_131'25 = fact app_187_131'25 k in
      let k [] app_188_131'24 =
        let lit_189_131'25 = 1 in
        app_188_131'24 lit_189_131'25 k in
      - n k
    | false0 ->
      let lit_190_131'37 = 1 in
      k lit_190_131'37 in
  let k [] app_183_131'7 =
    let lit_184_131'10 = 2 in
    app_183_131'7 lit_184_131'10 k in
  >= n k) in
let error = fun [newline,put_string] s k ->
  let k [newline,put_string,s] _ =
    let k [newline] _ =
      let con_192_133'58 = Unit0 in
      newline con_192_133'58 k in
    put_string s k in
  let lit_191_133'25 = "ERROR: " in
  put_string lit_191_133'25 k in
let runfib = fun [error,fib,newline,parse_num,put_int,put_string] args k ->
  let k [args,error,fib,newline,parse_num,put_int,put_string] _ =
    match args with
    | Nil0 ->
      let lit_194_138'16 = "expected an argument" in
      error lit_194_138'16 k
    | Cons1(arg1,more) ->
      match more with
      | Cons1(_,_) ->
        let lit_195_141'21 = "expected exactly one argument" in
        error lit_195_141'21 k
      | Nil0 ->
        let k [error,fib,newline,put_int,put_string] app_196_143'24 =
          match app_196_143'24 with
          | None1 ->
            let lit_197_144'24 = "expected arg1 to be numeric" in
            error lit_197_144'24 k
          | Some0(n) ->
            let k [n,newline,put_int,put_string] res =
              let k [newline,put_int,put_string,res] _ =
                let k [newline,put_int,res] _ =
                  let k [newline] _ =
                    let con_199_150'19 = Unit0 in
                    newline con_199_150'19 k in
                  put_int res k in
                let lit_198_148'22 = " --> " in
                put_string lit_198_148'22 k in
              put_int n k in
            fib n k in
        parse_num arg1 k in
  let lit_193_136'13 = "fib: " in
  put_string lit_193_136'13 k in
let runfact = fun [error,fact,newline,parse_num,put_int,put_string] args k ->
  let k [args,error,fact,newline,parse_num,put_int,put_string] _ =
    match args with
    | Nil0 ->
      let lit_201_155'16 = "expected an argument" in
      error lit_201_155'16 k
    | Cons1(arg1,more) ->
      match more with
      | Cons1(_,_) ->
        let lit_202_158'21 = "expected exactly one argument" in
        error lit_202_158'21 k
      | Nil0 ->
        let k [error,fact,newline,put_int,put_string] app_203_160'24 =
          match app_203_160'24 with
          | None1 ->
            let lit_204_161'24 = "expected arg1 to be numeric" in
            error lit_204_161'24 k
          | Some0(n) ->
            let k [n,newline,put_int,put_string] res =
              let k [newline,put_int,put_string,res] _ =
                let k [newline,put_int,res] _ =
                  let k [newline] _ =
                    let con_206_167'19 = Unit0 in
                    newline con_206_167'19 k in
                  put_int res k in
                let lit_205_165'22 = " --> " in
                put_string lit_205_165'22 k in
              put_int n k in
            fact n k in
        parse_num arg1 k in
  let lit_200_153'13 = "fact: " in
  put_string lit_200_153'13 k in
let k [::,append,eq_char,eq_char_list,error,explode,length,map,newline,put_char,put_chars,put_int,put_string_newline,read_line,reverse,runfact,runfib] single_controlD =
  let rev = fun [eq_char_list,newline,put_chars,read_line,reverse,single_controlD] _ k ->
    let loop = fix (fun [eq_char_list,newline,put_chars,read_line,reverse,single_controlD] loop _ k ->
      let k [eq_char_list,loop,newline,put_chars,reverse,single_controlD] xs =
        let k [loop,newline,put_chars,reverse,xs] app_212_175'23 =
          match app_212_175'23 with
          | true1 ->
            let con_214_175'44 = Unit0 in
            k con_214_175'44
          | false0 ->
            let k [loop,newline] _ =
              let k [loop] _ =
                let con_217_176'46 = Unit0 in
                loop con_217_176'46 k in
              let con_216_176'38 = Unit0 in
              newline con_216_176'38 k in
            let k [put_chars] app_215_176'26 = put_chars app_215_176'26 k in
            reverse xs k in
        let k [single_controlD] app_213_175'20 = app_213_175'20 single_controlD k in
        eq_char_list xs k in
      let con_211_174'23 = Unit0 in
      read_line con_211_174'23 k) in
    let con_218_178'6 = Unit0 in
    loop con_218_178'6 k in
  let runrev = fun [error,put_string_newline,rev] args k ->
    match args with
    | Cons1(_,_) ->
      let lit_219_182'18 = "rev: expected no arguments" in
      error lit_219_182'18 k
    | Nil0 ->
      let k [rev] _ =
        let con_221_185'8 = Unit0 in
        rev con_221_185'8 k in
      let lit_220_184'24 = "(reverse typed lines until ^D)" in
      put_string_newline lit_220_184'24 k in
  let fallback = fun [append,eq_char,explode,length,map,newline,put_char,put_chars,put_int] line k ->
    let k [append,explode,length,line,newline,put_char,put_chars,put_int] star_the_ohs =
      let k [append,explode,line,newline,put_char,put_chars,put_int,star_the_ohs] n =
        let k [n,newline,put_char,put_int] _ =
          let k [n,newline,put_char,put_int] _ =
            let k [n,newline,put_char,put_int] _ =
              let k [newline,put_char] _ =
                let k [newline] _ =
                  let con_235_195'10 = Unit0 in
                  newline con_235_195'10 k in
                let lit_234_194'11 = '}' in
                put_char lit_234_194'11 k in
              put_int n k in
            let lit_233_192'11 = '{' in
            put_char lit_233_192'11 k in
          let lit_232_191'11 = ' ' in
          put_char lit_232_191'11 k in
        let k [put_chars] app_227_190'44 = put_chars app_227_190'44 k in
        let k [line,star_the_ohs] app_228_190'20 =
          let k [app_228_190'20] app_231_190'58 = app_228_190'20 app_231_190'58 k in
          star_the_ohs line k in
        let k [append] app_229_190'29 = append app_229_190'29 k in
        let lit_230_190'29 = "You wrote: " in
        explode lit_230_190'29 k in
      length line k in
    let lam_222_188'30 = fun [eq_char] c k ->
      let k [c] app_223_188'48 =
        match app_223_188'48 with
        | true1 ->
          let lit_226_188'57 = '*' in
          k lit_226_188'57
        | false0 -> k c in
      let k [] app_224_188'46 =
        let lit_225_188'48 = 'o' in
        app_224_188'46 lit_225_188'48 k in
      eq_char c k in
    map lam_222_188'30 k in
  let split_words = fun [::,eq_char,reverse] s k ->
    let loop = fix (fun [::,eq_char,reverse] loop accWs k ->
      let lam_253_198'21 = fun [::,accWs,eq_char,loop,reverse] accCs k ->
        let lam_252_198'27 = fun [::,accCs,accWs,eq_char,loop,reverse] xs k ->
          match xs with
          | Nil0 ->
            let k [reverse] app_236_200'38 = reverse app_236_200'38 k in
            let k [accWs] app_237_200'35 = app_237_200'35 accWs k in
            let k [::] app_238_200'29 = :: app_238_200'29 k in
            reverse accCs k
          | Cons1(x,xs) ->
            let k [::,accCs,accWs,loop,reverse,x,xs] app_239_203'20 =
              match app_239_203'20 with
              | true1 ->
                let k [xs] app_242_203'59 = app_242_203'59 xs k in
                let k [] app_243_203'34 =
                  let con_247_203'59 = Nil0 in
                  app_243_203'34 con_247_203'59 k in
                let k [loop] app_244_203'52 = loop app_244_203'52 k in
                let k [accWs] app_245_203'49 = app_245_203'49 accWs k in
                let k [::] app_246_203'43 = :: app_246_203'43 k in
                reverse accCs k
              | false0 ->
                let k [xs] app_248_204'23 = app_248_204'23 xs k in
                let k [::,accCs,x] app_249_204'17 =
                  let k [app_249_204'17] app_250_204'27 = app_249_204'17 app_250_204'27 k in
                  let k [accCs] app_251_204'25 = app_251_204'25 accCs k in
                  :: x k in
                loop accWs k in
            let k [] app_240_203'18 =
              let lit_241_203'20 = ' ' in
              app_240_203'18 lit_241_203'20 k in
            eq_char x k in
        k lam_252_198'27 in
      k lam_253_198'21) in
    let k [s] app_254_206'10 = app_254_206'10 s k in
    let k [] app_255_206'7 =
      let con_257_206'10 = Nil0 in
      app_255_206'7 con_257_206'10 k in
    let con_256_206'7 = Nil0 in
    loop con_256_206'7 k in
  let execute = fun [eq_char_list,explode,fallback,runfact,runfib,runrev,split_words] line k ->
    let k [eq_char_list,explode,fallback,line,runfact,runfib,runrev] words =
      match words with
      | Nil0 ->
        let con_258_211'10 = Unit0 in
        k con_258_211'10
      | Cons1(command,args) ->
        let k [args,command,eq_char_list,explode,fallback,line,runfact,runfib,runrev] app_259_213'29 =
          match app_259_213'29 with
          | true1 -> runfib args k
          | false0 ->
            let k [args,command,eq_char_list,explode,fallback,line,runfact,runrev] app_263_214'31 =
              match app_263_214'31 with
              | true1 -> runfact args k
              | false0 ->
                let k [args,fallback,line,runrev] app_267_215'33 =
                  match app_267_215'33 with
                  | true1 -> runrev args k
                  | false0 -> fallback line k in
                let k [explode] app_268_215'25 =
                  let k [app_268_215'25] app_269_215'42 = app_268_215'25 app_269_215'42 k in
                  let lit_270_215'42 = "rev" in
                  explode lit_270_215'42 k in
                eq_char_list command k in
            let k [explode] app_264_214'23 =
              let k [app_264_214'23] app_265_214'40 = app_264_214'23 app_265_214'40 k in
              let lit_266_214'40 = "fact" in
              explode lit_266_214'40 k in
            eq_char_list command k in
        let k [explode] app_260_213'21 =
          let k [app_260_213'21] app_261_213'38 = app_260_213'21 app_261_213'38 k in
          let lit_262_213'38 = "fib" in
          explode lit_262_213'38 k in
        eq_char_list command k in
    split_words line k in
  let mainloop = fix (fun [eq_char_list,execute,put_char,read_line,single_controlD] mainloop _ k ->
    let k [eq_char_list,execute,mainloop,put_char,read_line,single_controlD] _ =
      let k [eq_char_list,execute,mainloop,read_line,single_controlD] _ =
        let k [eq_char_list,execute,mainloop,single_controlD] xs =
          let k [execute,mainloop,xs] app_274_222'21 =
            match app_274_222'21 with
            | true1 ->
              let con_276_222'42 = Unit0 in
              k con_276_222'42
            | false0 ->
              let k [mainloop] _ =
                let con_277_223'26 = Unit0 in
                mainloop con_277_223'26 k in
              execute xs k in
          let k [single_controlD] app_275_222'18 = app_275_222'18 single_controlD k in
          eq_char_list xs k in
        let con_273_221'21 = Unit0 in
        read_line con_273_221'21 k in
      let lit_272_220'11 = ' ' in
      put_char lit_272_220'11 k in
    let lit_271_219'11 = '>' in
    put_char lit_271_219'11 k) in
  let k [mainloop,put_string_newline] _ =
    let main = fun [mainloop,put_string_newline] _ k ->
      let k [mainloop,put_string_newline] _ =
        let k [put_string_newline] _ =
          let lit_281_230'21 = "EXIT" in
          put_string_newline lit_281_230'21 k in
        let con_280_229'20 = Unit0 in
        mainloop con_280_229'20 k in
      let lit_279_228'21 = "RUN" in
      put_string_newline lit_279_228'21 k in
    let con_282_0'0 = Unit0 in
    main con_282_0'0 k in
  let lit_278_225'28 = "LOAD" in
  put_string_newline lit_278_225'28 k in
let k [] app_207_170'28 =
  let con_210_170'31 = Nil0 in
  app_207_170'28 con_210_170'31 k in
let k [::] app_208_170'26 = :: app_208_170'26 k in
let lit_209_170'26 = 4 in
chr lit_209_170'26 k
