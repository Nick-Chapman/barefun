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
let read_line = fun [<=,=,>,cons,eq_char,erase_char,get_char,newline,ord,put_char,reverse] _ k ->
  let loop = fix (fun [<=,=,>,cons,eq_char,erase_char,get_char,newline,ord,put_char,reverse] loop acc k ->
    let k [<=,=,>,acc,cons,eq_char,erase_char,loop,newline,ord,put_char,reverse] c =
      let k [<=,=,>,acc,c,cons,eq_char,erase_char,loop,newline,ord,put_char,reverse] n =
        let k [<=,=,>,acc,c,cons,erase_char,loop,n,newline,ord,put_char,reverse] app_144_109'17 =
          match app_144_109'17 with
          | true1 ->
            let k [acc,reverse] _ = reverse acc k in
            let con_147_109'35 = Unit0 in
            newline con_147_109'35 k
          | false0 ->
            let k [<=,=,acc,c,cons,erase_char,loop,n,ord,put_char] app_148_111'15 =
              match app_148_111'15 with
              | true1 -> loop acc k
              | false0 ->
                let k [<=,acc,c,cons,erase_char,loop,ord,put_char] app_151_112'17 =
                  match app_151_112'17 with
                  | true1 ->
                    match acc with
                    | Nil0 -> loop acc k
                    | Cons1(c,tail) ->
                      let k [erase_char,loop,tail] _ =
                        let k [loop,tail] _ = loop tail k in
                        let con_160_117'25 = Unit0 in
                        erase_char con_160_117'25 k in
                      let k [erase_char] app_154_116'28 =
                        match app_154_116'28 with
                        | true1 ->
                          let con_158_116'47 = Unit0 in
                          erase_char con_158_116'47 k
                        | false0 ->
                          let con_159_116'55 = Unit0 in
                          k con_159_116'55 in
                      let k [] app_155_116'25 =
                        let lit_157_116'28 = 26 in
                        app_155_116'25 lit_157_116'28 k in
                      let k [<=] app_156_116'23 = <= app_156_116'23 k in
                      ord c k
                  | false0 ->
                    let k [acc,c,cons,loop] _ =
                      let k [loop] app_161_120'38 = loop app_161_120'38 k in
                      let k [acc] app_162_120'36 = app_162_120'36 acc k in
                      cons c k in
                    put_char c k in
                let k [] app_152_112'15 =
                  let lit_153_112'17 = 127 in
                  app_152_112'15 lit_153_112'17 k in
                = n k in
            let k [] app_149_111'13 =
              let lit_150_111'15 = 127 in
              app_149_111'13 lit_150_111'15 k in
            > n k in
        let k [] app_145_109'15 =
          let lit_146_109'17 = '\n' in
          app_145_109'15 lit_146_109'17 k in
        eq_char c k in
      ord c k in
    let con_143_107'21 = Unit0 in
    get_char con_143_107'21 k) in
  let con_163_122'7 = Nil0 in
  loop con_163_122'7 k in
let fib = fix (fun [+,-,<] fib n k ->
  let k [+,-,fib,n] app_164_126'9 =
    match app_164_126'9 with
    | true1 -> k n
    | false0 ->
      let k [-,fib,n] app_167_126'33 =
        let k [app_167_126'33] app_172_126'39 = app_167_126'33 app_172_126'39 k in
        let k [fib] app_173_126'42 = fib app_173_126'42 k in
        let k [] app_174_126'41 =
          let lit_175_126'42 = 2 in
          app_174_126'41 lit_175_126'42 k in
        - n k in
      let k [+] app_168_126'27 = + app_168_126'27 k in
      let k [fib] app_169_126'30 = fib app_169_126'30 k in
      let k [] app_170_126'29 =
        let lit_171_126'30 = 1 in
        app_170_126'29 lit_171_126'30 k in
      - n k in
  let k [] app_165_126'7 =
    let lit_166_126'9 = 2 in
    app_165_126'7 lit_166_126'9 k in
  < n k) in
let fact = fix (fun [( * ),-,>=] fact n k ->
  let k [( * ),-,fact,n] app_176_130'10 =
    match app_176_130'10 with
    | true1 ->
      let k [n] app_179_130'28 = app_179_130'28 n k in
      let k [( * )] app_180_130'22 = ( * ) app_180_130'22 k in
      let k [fact] app_181_130'25 = fact app_181_130'25 k in
      let k [] app_182_130'24 =
        let lit_183_130'25 = 1 in
        app_182_130'24 lit_183_130'25 k in
      - n k
    | false0 ->
      let lit_184_130'37 = 1 in
      k lit_184_130'37 in
  let k [] app_177_130'7 =
    let lit_178_130'10 = 2 in
    app_177_130'7 lit_178_130'10 k in
  >= n k) in
let error = fun [newline,put_string] s k ->
  let k [newline,put_string,s] _ =
    let k [newline] _ =
      let con_186_132'58 = Unit0 in
      newline con_186_132'58 k in
    put_string s k in
  let lit_185_132'25 = "ERROR: " in
  put_string lit_185_132'25 k in
let runfib = fun [error,fib,newline,parse_num,put_int,put_string] args k ->
  let k [args,error,fib,newline,parse_num,put_int,put_string] _ =
    match args with
    | Nil0 ->
      let lit_188_137'16 = "expected an argument" in
      error lit_188_137'16 k
    | Cons1(arg1,more) ->
      match more with
      | Cons1(_,_) ->
        let lit_189_140'21 = "expected exactly one argument" in
        error lit_189_140'21 k
      | Nil0 ->
        let k [error,fib,newline,put_int,put_string] app_190_142'24 =
          match app_190_142'24 with
          | None1 ->
            let lit_191_143'24 = "expected arg1 to be numeric" in
            error lit_191_143'24 k
          | Some0(n) ->
            let k [n,newline,put_int,put_string] res =
              let k [newline,put_int,put_string,res] _ =
                let k [newline,put_int,res] _ =
                  let k [newline] _ =
                    let con_193_149'19 = Unit0 in
                    newline con_193_149'19 k in
                  put_int res k in
                let lit_192_147'22 = " --> " in
                put_string lit_192_147'22 k in
              put_int n k in
            fib n k in
        parse_num arg1 k in
  let lit_187_135'13 = "fib: " in
  put_string lit_187_135'13 k in
let runfact = fun [error,fact,newline,parse_num,put_int,put_string] args k ->
  let k [args,error,fact,newline,parse_num,put_int,put_string] _ =
    match args with
    | Nil0 ->
      let lit_195_154'16 = "expected an argument" in
      error lit_195_154'16 k
    | Cons1(arg1,more) ->
      match more with
      | Cons1(_,_) ->
        let lit_196_157'21 = "expected exactly one argument" in
        error lit_196_157'21 k
      | Nil0 ->
        let k [error,fact,newline,put_int,put_string] app_197_159'24 =
          match app_197_159'24 with
          | None1 ->
            let lit_198_160'24 = "expected arg1 to be numeric" in
            error lit_198_160'24 k
          | Some0(n) ->
            let k [n,newline,put_int,put_string] res =
              let k [newline,put_int,put_string,res] _ =
                let k [newline,put_int,res] _ =
                  let k [newline] _ =
                    let con_200_166'19 = Unit0 in
                    newline con_200_166'19 k in
                  put_int res k in
                let lit_199_164'22 = " --> " in
                put_string lit_199_164'22 k in
              put_int n k in
            fact n k in
        parse_num arg1 k in
  let lit_194_152'13 = "fact: " in
  put_string lit_194_152'13 k in
let fallback = fun [append,eq_char,explode,length,map,newline,put_char,put_chars,put_int] line k ->
  let k [append,explode,length,line,newline,put_char,put_chars,put_int] star_the_ohs =
    let k [append,explode,line,newline,put_char,put_chars,put_int,star_the_ohs] n =
      let k [n,newline,put_char,put_int] _ =
        let k [n,newline,put_char,put_int] _ =
          let k [n,newline,put_char,put_int] _ =
            let k [newline,put_char] _ =
              let k [newline] _ =
                let con_214_176'10 = Unit0 in
                newline con_214_176'10 k in
              let lit_213_175'11 = '}' in
              put_char lit_213_175'11 k in
            put_int n k in
          let lit_212_173'11 = '{' in
          put_char lit_212_173'11 k in
        let lit_211_172'11 = ' ' in
        put_char lit_211_172'11 k in
      let k [put_chars] app_206_171'44 = put_chars app_206_171'44 k in
      let k [line,star_the_ohs] app_207_171'20 =
        let k [app_207_171'20] app_210_171'58 = app_207_171'20 app_210_171'58 k in
        star_the_ohs line k in
      let k [append] app_208_171'29 = append app_208_171'29 k in
      let lit_209_171'29 = "You wrote: " in
      explode lit_209_171'29 k in
    length line k in
  let lam_201_169'30 = fun [eq_char] c k ->
    let k [c] app_202_169'48 =
      match app_202_169'48 with
      | true1 ->
        let lit_205_169'57 = '*' in
        k lit_205_169'57
      | false0 -> k c in
    let k [] app_203_169'46 =
      let lit_204_169'48 = 'o' in
      app_203_169'46 lit_204_169'48 k in
    eq_char c k in
  map lam_201_169'30 k in
let split_words = fun [::,eq_char,reverse] s k ->
  let loop = fix (fun [::,eq_char,reverse] loop accWs k ->
    let lam_232_179'21 = fun [::,accWs,eq_char,loop,reverse] accCs k ->
      let lam_231_179'27 = fun [::,accCs,accWs,eq_char,loop,reverse] xs k ->
        match xs with
        | Nil0 ->
          let k [reverse] app_215_181'38 = reverse app_215_181'38 k in
          let k [accWs] app_216_181'35 = app_216_181'35 accWs k in
          let k [::] app_217_181'29 = :: app_217_181'29 k in
          reverse accCs k
        | Cons1(x,xs) ->
          let k [::,accCs,accWs,loop,reverse,x,xs] app_218_184'20 =
            match app_218_184'20 with
            | true1 ->
              let k [xs] app_221_184'59 = app_221_184'59 xs k in
              let k [] app_222_184'34 =
                let con_226_184'59 = Nil0 in
                app_222_184'34 con_226_184'59 k in
              let k [loop] app_223_184'52 = loop app_223_184'52 k in
              let k [accWs] app_224_184'49 = app_224_184'49 accWs k in
              let k [::] app_225_184'43 = :: app_225_184'43 k in
              reverse accCs k
            | false0 ->
              let k [xs] app_227_185'23 = app_227_185'23 xs k in
              let k [::,accCs,x] app_228_185'17 =
                let k [app_228_185'17] app_229_185'27 = app_228_185'17 app_229_185'27 k in
                let k [accCs] app_230_185'25 = app_230_185'25 accCs k in
                :: x k in
              loop accWs k in
          let k [] app_219_184'18 =
            let lit_220_184'20 = ' ' in
            app_219_184'18 lit_220_184'20 k in
          eq_char x k in
      k lam_231_179'27 in
    k lam_232_179'21) in
  let k [s] app_233_187'10 = app_233_187'10 s k in
  let k [] app_234_187'7 =
    let con_236_187'10 = Nil0 in
    app_234_187'7 con_236_187'10 k in
  let con_235_187'7 = Nil0 in
  loop con_235_187'7 k in
let execute = fun [eq_char_list,explode,fallback,runfact,runfib,split_words] line k ->
  let k [eq_char_list,explode,fallback,line,runfact,runfib] words =
    match words with
    | Nil0 ->
      let con_237_192'10 = Unit0 in
      k con_237_192'10
    | Cons1(command,args) ->
      let k [args,command,eq_char_list,explode,fallback,line,runfact,runfib] app_238_194'29 =
        match app_238_194'29 with
        | true1 -> runfib args k
        | false0 ->
          let k [args,fallback,line,runfact] app_242_195'31 =
            match app_242_195'31 with
            | true1 -> runfact args k
            | false0 -> fallback line k in
          let k [explode] app_243_195'23 =
            let k [app_243_195'23] app_244_195'40 = app_243_195'23 app_244_195'40 k in
            let lit_245_195'40 = "fact" in
            explode lit_245_195'40 k in
          eq_char_list command k in
      let k [explode] app_239_194'21 =
        let k [app_239_194'21] app_240_194'38 = app_239_194'21 app_240_194'38 k in
        let lit_241_194'38 = "fib" in
        explode lit_241_194'38 k in
      eq_char_list command k in
  split_words line k in
let mainloop = fix (fun [execute,put_char,read_line] mainloop _ k ->
  let k [execute,mainloop,put_char,read_line] _ =
    let k [execute,mainloop,read_line] _ =
      let k [execute,mainloop] xs =
        let k [mainloop] _ =
          let con_249_203'11 = Unit0 in
          mainloop con_249_203'11 k in
        execute xs k in
      let con_248_201'21 = Unit0 in
      read_line con_248_201'21 k in
    let lit_247_200'11 = ' ' in
    put_char lit_247_200'11 k in
  let lit_246_199'11 = '>' in
  put_char lit_246_199'11 k) in
let k [mainloop,put_string_newline] _ =
  let main = fun [mainloop,put_string_newline] _ k ->
    let k [mainloop,put_string_newline] _ =
      let k [put_string_newline] _ =
        let lit_253_210'21 = "NEVER" in
        put_string_newline lit_253_210'21 k in
      let con_252_209'20 = Unit0 in
      mainloop con_252_209'20 k in
    let lit_251_208'21 = "RUN" in
    put_string_newline lit_251_208'21 k in
  let con_254_0'0 = Unit0 in
  main con_254_0'0 k in
let lit_250_205'28 = "LOAD" in
put_string_newline lit_250_205'28 k
