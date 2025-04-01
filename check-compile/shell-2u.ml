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
let block = fix (fun [] block f k ->
  let lam_2'31 = fun [block,f] a k ->
    let _ = block in
    f a k in
  k lam_2'31) in
let noinline = block in
let k [%,( * ),+,-,/,::,<,=,chr,eq_char,get_char,ord,put_char,noinline] explode =
  let not = fun [] b k ->
    match b with
    | true1 ->
      let con_8'12 = false0 in
      k con_8'12
    | false0 ->
      let con_9'13 = true1 in
      k con_9'13 in
  let > = fun [<] a k ->
    let lam_11'10 = fun [<,a] b k ->
      let k [a] app_11'16 = app_11'16 a k in
      < b k in
    k lam_11'10 in
  let <= = fun [<,not] a k ->
    let lam_12'11 = fun [<,not,a] b k ->
      let k [not,a] app_12'22 =
        let k [not] app_12'24 = not app_12'24 k in
        app_12'22 a k in
      < b k in
    k lam_12'11 in
  let >= = fun [<,not] a k ->
    let lam_13'11 = fun [<,not,a] b k ->
      let k [not,b] app_13'22 =
        let k [not] app_13'24 = not app_13'24 k in
        app_13'22 b k in
      < a k in
    k lam_13'11 in
  let put_char = fun [+,-,=,chr,eq_char,ord,put_char,>] c k ->
    let backspace = 8 in
    let k [+,-,=,chr,eq_char,ord,put_char,>,c,backspace] n =
      let k [+,-,chr,eq_char,ord,put_char,>,c,backspace,n] app_19'7 =
        let k [+,-,chr,eq_char,ord,put_char,>,c,n] app_19'9 =
          match app_19'9 with
          | true1 -> put_char c k
          | false0 ->
            let k [+,-,chr,ord,put_char,>,c,n] app_20'15 =
              let lit_20'17 = '\n' in
              let k [+,-,chr,ord,put_char,>,c,n] app_20'17 =
                match app_20'17 with
                | true1 -> put_char c k
                | false0 ->
                  let k [+,-,chr,ord,put_char,c,n] app_21'11 =
                    let lit_21'13 = 26 in
                    let k [+,-,chr,ord,put_char,c,n] app_21'13 =
                      match app_21'13 with
                      | true1 -> put_char c k
                      | false0 ->
                        let lit_22'18 = '^' in
                        let k [+,-,chr,ord,put_char,n] _ =
                          let lit_22'42 = 'A' in
                          let k [+,-,chr,put_char,n] app_22'42 =
                            let k [-,chr,put_char,n] app_22'46 =
                              let k [-,chr,put_char] app_22'48 =
                                let k [chr,put_char] app_22'50 =
                                  let lit_22'52 = 1 in
                                  let k [chr,put_char] app_22'52 =
                                    let k [put_char] app_22'37 = put_char app_22'37 k in
                                    chr app_22'52 k in
                                  app_22'50 lit_22'52 k in
                                - app_22'48 k in
                              app_22'46 n k in
                            + app_22'42 k in
                          ord lit_22'42 k in
                        put_char lit_22'18 k in
                    app_21'11 lit_21'13 k in
                  > n k in
              app_20'15 lit_20'17 k in
            eq_char c k in
        app_19'7 backspace k in
      = n k in
    ord c k in
  let erase_char = fun [chr,put_char] _ k ->
    let lit_25'22 = 8 in
    let k [put_char] backspace =
      let k [put_char,backspace] _ =
        let lit_28'11 = ' ' in
        let k [put_char,backspace] _ = put_char backspace k in
        put_char lit_28'11 k in
      put_char backspace k in
    chr lit_25'22 k in
  let parse_digit = fun [-,ord,<=,>=] c k ->
    let k [-,ord,<=,>=] app_34'14 =
      let k [ord,<=,>=] app_34'16 =
        let lit_34'22 = '0' in
        let k [<=,>=,app_34'16] app_34'22 =
          let k [<=,>=] n =
            let k [<=,n] app_36'7 =
              let lit_36'10 = 0 in
              let k [<=,n] app_36'10 =
                match app_36'10 with
                | true1 ->
                  let k [n] app_36'22 =
                    let lit_36'25 = 9 in
                    let k [n] app_36'25 =
                      match app_36'25 with
                      | true1 ->
                        let con_36'32 = Some0[n] in
                        k con_36'32
                      | false0 ->
                        let con_36'45 = None1 in
                        k con_36'45 in
                    app_36'22 lit_36'25 k in
                  <= n k
                | false0 ->
                  let con_36'55 = None1 in
                  k con_36'55 in
              app_36'7 lit_36'10 k in
            >= n k in
          app_34'16 app_34'22 k in
        ord lit_34'22 k in
      - app_34'14 k in
    ord c k in
  let parse_num = fun [( * ),+,parse_digit] s k ->
    let loop = fix (fun [( * ),+,parse_digit] loop acc k ->
      let lam_39'19 = fun [( * ),+,parse_digit,loop,acc] xs k ->
        match xs with
        | Nil0 ->
          let con_41'12 = Some0[acc] in
          k con_41'12
        | Cons1(x,xs) ->
          let k [( * ),+,loop,acc,xs] app_43'26 =
            match app_43'26 with
            | None1 ->
              let con_44'18 = None1 in
              k con_44'18
            | Some0(d) ->
              let lit_45'26 = 10 in
              let k [+,loop,acc,xs,d] app_45'29 =
                let k [+,loop,xs,d] app_45'31 =
                  let k [loop,xs,d] app_45'35 =
                    let k [loop,xs] app_45'37 =
                      let k [xs] app_45'25 = app_45'25 xs k in
                      loop app_45'37 k in
                    app_45'35 d k in
                  + app_45'31 k in
                app_45'29 acc k in
              ( * ) lit_45'26 k in
          parse_digit x k in
      k lam_39'19) in
    let lit_47'7 = 0 in
    let k [s] app_47'7 = app_47'7 s k in
    loop lit_47'7 k in
  let cons = fun [::] x k ->
    let lam_49'11 = fun [::,x] xs k ->
      let k [xs] app_49'18 = app_49'18 xs k in
      :: x k in
    k lam_49'11 in
  let eq_list = fix (fun [] eq_list eq k ->
    let lam_51'19 = fun [eq_list,eq] xs k ->
      let lam_51'22 = fun [eq_list,eq,xs] ys k ->
        match xs with
        | Nil0 ->
          match ys with
          | Nil0 ->
            let con_53'33 = true1 in
            k con_53'33
          | Cons1(_,_) ->
            let con_53'48 = false0 in
            k con_53'48
        | Cons1(x,xs) ->
          match ys with
          | Nil0 ->
            let con_56'13 = false0 in
            k con_56'13
          | Cons1(y,ys) ->
            let k [eq_list,eq,xs,y,ys] app_58'14 =
              let k [eq_list,eq,xs,ys] app_58'16 =
                match app_58'16 with
                | true1 ->
                  let k [xs,ys] app_58'31 =
                    let k [ys] app_58'34 = app_58'34 ys k in
                    app_58'31 xs k in
                  eq_list eq k
                | false0 ->
                  let con_58'45 = false0 in
                  k con_58'45 in
              app_58'14 y k in
            eq x k in
      k lam_51'22 in
    k lam_51'19) in
  let eq_char_list = fun [eq_char,eq_list] xs k ->
    let lam_60'20 = fun [eq_char,eq_list,xs] ys k ->
      let k [xs,ys] app_60'33 =
        let k [ys] app_60'41 = app_60'41 ys k in
        app_60'33 xs k in
      eq_list eq_char k in
    k lam_60'20 in
  let append = fix (fun [cons] append xs k ->
    let lam_62'18 = fun [cons,append,xs] ys k ->
      match xs with
      | Nil0 -> k ys
      | Cons1(x,xs) ->
        let k [append,ys,xs] app_65'18 =
          let k [ys,app_65'18] app_65'28 =
            let k [app_65'18] app_65'31 = app_65'18 app_65'31 k in
            app_65'28 ys k in
          append xs k in
        cons x k in
    k lam_62'18) in
  let revloop = fix (fun [cons] revloop acc k ->
    let lam_67'20 = fun [cons,revloop,acc] xs k ->
      match xs with
      | Nil0 -> k acc
      | Cons1(x,xs) ->
        let k [revloop,acc,xs] app_70'27 =
          let k [revloop,xs] app_70'29 =
            let k [xs] app_70'21 = app_70'21 xs k in
            revloop app_70'29 k in
          app_70'27 acc k in
        cons x k in
    k lam_67'20) in
  let reverse = fun [revloop] xs k ->
    let con_72'25 = Nil0 in
    let k [xs] app_72'25 = app_72'25 xs k in
    revloop con_72'25 k in
  let map = fix (fun [::] map f k ->
    let lam_74'14 = fun [::,map,f] xs k ->
      match xs with
      | Nil0 ->
        let con_76'10 = Nil0 in
        k con_76'10
      | Cons1(x,xs) ->
        let k [::,map,f,xs] app_77'15 =
          let k [map,f,xs] app_77'17 =
            let k [xs,app_77'17] app_77'24 =
              let k [app_77'17] app_77'26 = app_77'17 app_77'26 k in
              app_77'24 xs k in
            map f k in
          :: app_77'15 k in
        f x k in
    k lam_74'14) in
  let length = fix (fun [+] length xs k ->
    match xs with
    | Nil0 ->
      let lit_81'10 = 0 in
      k lit_81'10
    | Cons1(_,xs) ->
      let lit_82'17 = 1 in
      let k [length,xs] app_82'17 =
        let k [app_82'17] app_82'27 = app_82'17 app_82'27 k in
        length xs k in
      + lit_82'17 k) in
  let chars_of_int = fun [%,+,/,=,chr,ord,cons] i k ->
    let lit_85'17 = '0' in
    let k [%,+,/,=,chr,cons,i] ord0 =
      let char_of_digit = fun [+,chr,ord0] c k ->
        let k [chr,c] app_86'34 =
          let k [chr] app_86'36 = chr app_86'36 k in
          app_86'34 c k in
        + ord0 k in
      let loop = fix (fun [%,/,=,cons,char_of_digit] loop acc k ->
        let lam_87'19 = fun [%,/,=,cons,char_of_digit,loop,acc] i k ->
          let k [%,/,cons,char_of_digit,loop,acc,i] app_88'9 =
            let lit_88'11 = 0 in
            let k [%,/,cons,char_of_digit,loop,acc,i] app_88'11 =
              match app_88'11 with
              | true1 -> k acc
              | false0 ->
                let k [/,cons,char_of_digit,loop,acc,i] app_89'34 =
                  let lit_89'35 = 10 in
                  let k [/,cons,char_of_digit,loop,acc,i] app_89'35 =
                    let k [/,cons,loop,acc,i] app_89'32 =
                      let k [/,loop,acc,i] app_89'17 =
                        let k [/,loop,i] app_89'40 =
                          let k [/,i] app_89'11 =
                            let k [app_89'11] app_89'47 =
                              let lit_89'48 = 10 in
                              let k [app_89'11] app_89'48 = app_89'11 app_89'48 k in
                              app_89'47 lit_89'48 k in
                            / i k in
                          loop app_89'40 k in
                        app_89'17 acc k in
                      cons app_89'32 k in
                    char_of_digit app_89'35 k in
                  app_89'34 lit_89'35 k in
                % i k in
            app_88'9 lit_88'11 k in
          = i k in
        k lam_87'19) in
      let k [cons,i,loop] app_91'7 =
        let lit_91'9 = 0 in
        let k [cons,i,loop] app_91'9 =
          match app_91'9 with
          | true1 ->
            let lit_91'21 = '0' in
            let k [] app_91'21 =
              let con_91'25 = Nil0 in
              app_91'21 con_91'25 k in
            cons lit_91'21 k
          | false0 ->
            let con_91'38 = Nil0 in
            let k [i] app_91'38 = app_91'38 i k in
            loop con_91'38 k in
        app_91'7 lit_91'9 k in
      = i k in
    ord lit_85'17 k in
  let put_chars = fix (fun [put_char] put_chars xs k ->
    match xs with
    | Nil0 ->
      let con_95'10 = Unit0 in
      k con_95'10
    | Cons1(x,xs) ->
      let k [put_chars,xs] _ = put_chars xs k in
      put_char x k) in
  let put_string = fun [noinline,explode,put_chars] s k ->
    let lam_98'33 = fun [explode,put_chars] s k ->
      let k [put_chars] app_98'57 = put_chars app_98'57 k in
      explode s k in
    let k [s] app_98'28 = app_98'28 s k in
    noinline lam_98'33 k in
  let put_int = fun [chars_of_int,put_chars] i k ->
    let k [put_chars] app_100'40 = put_chars app_100'40 k in
    chars_of_int i k in
  let newline = fun [put_char] _ k ->
    let lit_102'26 = '\n' in
    put_char lit_102'26 k in
  let readloop = fix (fun [::,=,chr,eq_char,get_char,ord,>,<=,put_char,erase_char,cons,reverse,newline] readloop acc k ->
    let con_105'19 = Unit0 in
    let k [::,=,chr,eq_char,ord,>,<=,put_char,erase_char,cons,reverse,newline,readloop,acc] c =
      let k [::,=,chr,eq_char,ord,>,<=,put_char,erase_char,cons,reverse,newline,readloop,acc,c] n =
        let lit_107'21 = 4 in
        let k [::,=,eq_char,ord,>,<=,put_char,erase_char,cons,reverse,newline,readloop,acc,c,n] controlD =
          let k [::,=,eq_char,ord,>,<=,put_char,erase_char,cons,reverse,newline,readloop,acc,c,n,controlD] app_108'13 =
            let lit_108'15 = '\n' in
            let k [::,=,eq_char,ord,>,<=,put_char,erase_char,cons,reverse,newline,readloop,acc,c,n,controlD] app_108'15 =
              match app_108'15 with
              | true1 ->
                let con_108'33 = Unit0 in
                let k [reverse,acc] _ = reverse acc k in
                newline con_108'33 k
              | false0 ->
                let k [::,=,ord,>,<=,put_char,erase_char,cons,reverse,newline,readloop,acc,c,n,controlD] app_109'15 =
                  let k [::,=,ord,>,<=,put_char,erase_char,cons,reverse,newline,readloop,acc,c,n,controlD] app_109'17 =
                    match app_109'17 with
                    | true1 ->
                      let k [::,reverse,newline,acc,controlD] _ =
                        let con_109'51 = Unit0 in
                        let k [::,reverse,acc,controlD] _ =
                          let k [reverse,acc] app_109'73 =
                            let k [reverse] app_109'76 = reverse app_109'76 k in
                            app_109'73 acc k in
                          :: controlD k in
                        newline con_109'51 k in
                      put_char c k
                    | false0 ->
                      let k [=,ord,<=,put_char,erase_char,cons,readloop,acc,c,n] app_110'11 =
                        let lit_110'13 = 127 in
                        let k [=,ord,<=,put_char,erase_char,cons,readloop,acc,c,n] app_110'13 =
                          match app_110'13 with
                          | true1 -> readloop acc k
                          | false0 ->
                            let k [ord,<=,put_char,erase_char,cons,readloop,acc,c] app_111'13 =
                              let lit_111'15 = 127 in
                              let k [ord,<=,put_char,erase_char,cons,readloop,acc,c] app_111'15 =
                                match app_111'15 with
                                | true1 ->
                                  match acc with
                                  | Nil0 -> readloop acc k
                                  | Cons1(c,tail) ->
                                    let k [<=,erase_char,readloop,tail] app_115'21 =
                                      let k [erase_char,readloop,tail] app_115'23 =
                                        let lit_115'26 = 26 in
                                        let k [erase_char,readloop,tail] app_115'26 =
                                          let k [erase_char,readloop,tail] _ =
                                            let con_116'23 = Unit0 in
                                            let k [readloop,tail] _ = readloop tail k in
                                            erase_char con_116'23 k in
                                          match app_115'26 with
                                          | true1 ->
                                            let con_115'45 = Unit0 in
                                            erase_char con_115'45 k
                                          | false0 ->
                                            let con_115'53 = Unit0 in
                                            k con_115'53 in
                                        app_115'23 lit_115'26 k in
                                      <= app_115'21 k in
                                    ord c k
                                | false0 ->
                                  let k [cons,readloop,acc,c] _ =
                                    let k [readloop,acc] app_119'38 =
                                      let k [readloop] app_119'40 = readloop app_119'40 k in
                                      app_119'38 acc k in
                                    cons c k in
                                  put_char c k in
                              app_111'13 lit_111'15 k in
                            = n k in
                        app_110'11 lit_110'13 k in
                      > n k in
                  app_109'15 controlD k in
                eq_char c k in
            app_108'13 lit_108'15 k in
          eq_char c k in
        chr lit_107'21 k in
      ord c k in
    get_char con_105'19 k) in
  let read_line = fun [readloop] _ k ->
    let con_121'28 = Nil0 in
    readloop con_121'28 k in
  let fib = fix (fun [+,-,<] fib n k ->
    let k [+,-,fib,n] app_125'7 =
      let lit_125'9 = 2 in
      let k [+,-,fib,n] app_125'9 =
        match app_125'9 with
        | true1 -> k n
        | false0 ->
          let k [+,-,fib,n] app_125'29 =
            let lit_125'30 = 1 in
            let k [+,-,fib,n] app_125'30 =
              let k [+,-,fib,n] app_125'27 =
                let k [-,fib,n] app_125'33 =
                  let k [fib,app_125'33] app_125'41 =
                    let lit_125'42 = 2 in
                    let k [fib,app_125'33] app_125'42 =
                      let k [app_125'33] app_125'39 = app_125'33 app_125'39 k in
                      fib app_125'42 k in
                    app_125'41 lit_125'42 k in
                  - n k in
                + app_125'27 k in
              fib app_125'30 k in
            app_125'29 lit_125'30 k in
          - n k in
      app_125'7 lit_125'9 k in
    < n k) in
  let fact = fix (fun [( * ),-,>=] fact n k ->
    let k [( * ),-,fact,n] app_129'7 =
      let lit_129'10 = 2 in
      let k [( * ),-,fact,n] app_129'10 =
        match app_129'10 with
        | true1 ->
          let k [( * ),fact,n] app_129'24 =
            let lit_129'25 = 1 in
            let k [( * ),fact,n] app_129'25 =
              let k [( * ),n] app_129'22 =
                let k [n] app_129'28 = app_129'28 n k in
                ( * ) app_129'22 k in
              fact app_129'25 k in
            app_129'24 lit_129'25 k in
          - n k
        | false0 ->
          let lit_129'37 = 1 in
          k lit_129'37 in
      app_129'7 lit_129'10 k in
    >= n k) in
  let error = fun [put_string,newline] s k ->
    let lit_131'25 = "ERROR: " in
    let k [put_string,newline,s] _ =
      let k [newline] _ =
        let con_131'58 = Unit0 in
        newline con_131'58 k in
      put_string s k in
    put_string lit_131'25 k in
  let runfib = fun [parse_num,put_string,put_int,newline,fib,error] args k ->
    let lit_134'13 = "fib: " in
    let k [parse_num,put_string,put_int,newline,fib,error,args] _ =
      match args with
      | Nil0 ->
        let lit_136'16 = "expected an argument" in
        error lit_136'16 k
      | Cons1(arg1,more) ->
        match more with
        | Cons1(_,_) ->
          let lit_139'21 = "expected exactly one argument" in
          error lit_139'21 k
        | Nil0 ->
          let k [put_string,put_int,newline,fib,error] app_141'24 =
            match app_141'24 with
            | None1 ->
              let lit_142'24 = "expected arg1 to be numeric" in
              error lit_142'24 k
            | Some0(n) ->
              let k [put_string,put_int,newline,n] res =
                let k [put_string,put_int,newline,res] _ =
                  let lit_146'22 = " --> " in
                  let k [put_int,newline,res] _ =
                    let k [newline] _ =
                      let con_148'19 = Unit0 in
                      newline con_148'19 k in
                    put_int res k in
                  put_string lit_146'22 k in
                put_int n k in
              fib n k in
          parse_num arg1 k in
    put_string lit_134'13 k in
  let runfact = fun [parse_num,put_string,put_int,newline,fact,error] args k ->
    let lit_151'13 = "fact: " in
    let k [parse_num,put_string,put_int,newline,fact,error,args] _ =
      match args with
      | Nil0 ->
        let lit_153'16 = "expected an argument" in
        error lit_153'16 k
      | Cons1(arg1,more) ->
        match more with
        | Cons1(_,_) ->
          let lit_156'21 = "expected exactly one argument" in
          error lit_156'21 k
        | Nil0 ->
          let k [put_string,put_int,newline,fact,error] app_158'24 =
            match app_158'24 with
            | None1 ->
              let lit_159'24 = "expected arg1 to be numeric" in
              error lit_159'24 k
            | Some0(n) ->
              let k [put_string,put_int,newline,n] res =
                let k [put_string,put_int,newline,res] _ =
                  let lit_163'22 = " --> " in
                  let k [put_int,newline,res] _ =
                    let k [newline] _ =
                      let con_165'19 = Unit0 in
                      newline con_165'19 k in
                    put_int res k in
                  put_string lit_163'22 k in
                put_int n k in
              fact n k in
          parse_num arg1 k in
    put_string lit_151'13 k in
  let lit_168'26 = 4 in
  let k [::,eq_char,explode,eq_char_list,append,reverse,map,length,put_chars,put_string,put_int,newline,read_line,error,runfib,runfact] app_168'26 =
    let k [::,eq_char,explode,eq_char_list,append,reverse,map,length,put_chars,put_string,put_int,newline,read_line,error,runfib,runfact] app_168'28 =
      let con_168'31 = Nil0 in
      let k [::,eq_char,explode,eq_char_list,append,reverse,map,length,put_chars,put_string,put_int,newline,read_line,error,runfib,runfact] single_controlD =
        let rev = fun [eq_char_list,reverse,put_chars,newline,read_line,single_controlD] _ k ->
          let loop = fix (fun [eq_char_list,reverse,put_chars,newline,read_line,single_controlD] loop _ k ->
            let con_172'23 = Unit0 in
            let k [eq_char_list,reverse,put_chars,newline,single_controlD,loop] xs =
              let k [reverse,put_chars,newline,single_controlD,loop,xs] app_173'20 =
                let k [reverse,put_chars,newline,loop,xs] app_173'23 =
                  match app_173'23 with
                  | true1 ->
                    let con_173'44 = Unit0 in
                    k con_173'44
                  | false0 ->
                    let k [put_chars,newline,loop] app_174'26 =
                      let k [newline,loop] _ =
                        let con_174'38 = Unit0 in
                        let k [loop] _ =
                          let con_174'46 = Unit0 in
                          loop con_174'46 k in
                        newline con_174'38 k in
                      put_chars app_174'26 k in
                    reverse xs k in
                app_173'20 single_controlD k in
              eq_char_list xs k in
            read_line con_172'23 k) in
          let con_176'6 = Unit0 in
          loop con_176'6 k in
        let runrev = fun [put_string,error,rev] args k ->
          match args with
          | Cons1(_,_) ->
            let lit_180'18 = "rev: expected no arguments" in
            error lit_180'18 k
          | Nil0 ->
            let lit_182'16 = "(reverse typed lines until ^D)\n" in
            let k [rev] _ =
              let con_183'8 = Unit0 in
              rev con_183'8 k in
            put_string lit_182'16 k in
        let fallback = fun [eq_char,explode,append,map,length,put_chars,put_string,put_int,newline] line k ->
          let lam_186'30 = fun [eq_char] c k ->
            let k [c] app_186'46 =
              let lit_186'48 = 'o' in
              let k [c] app_186'48 =
                match app_186'48 with
                | true1 ->
                  let lit_186'57 = '*' in
                  k lit_186'57
                | false0 -> k c in
              app_186'46 lit_186'48 k in
            eq_char c k in
          let k [explode,append,length,put_chars,put_string,put_int,newline,line] star_the_ohs =
            let k [explode,append,put_chars,put_string,put_int,newline,line,star_the_ohs] n =
              let lit_188'29 = "You wrote: \"" in
              let k [append,put_chars,put_string,put_int,newline,line,star_the_ohs,n] app_188'29 =
                let k [put_chars,put_string,put_int,newline,line,star_the_ohs,n] app_188'20 =
                  let k [put_chars,put_string,put_int,newline,n,app_188'20] app_188'60 =
                    let k [put_chars,put_string,put_int,newline,n] app_188'46 =
                      let k [put_string,put_int,newline,n] _ =
                        let lit_189'13 = "\" (" in
                        let k [put_string,put_int,newline,n] _ =
                          let k [put_string,newline] _ =
                            let lit_191'13 = " chars)" in
                            let k [newline] _ =
                              let con_192'10 = Unit0 in
                              newline con_192'10 k in
                            put_string lit_191'13 k in
                          put_int n k in
                        put_string lit_189'13 k in
                      put_chars app_188'46 k in
                    app_188'20 app_188'60 k in
                  star_the_ohs line k in
                append app_188'29 k in
              explode lit_188'29 k in
            length line k in
          map lam_186'30 k in
        let splitloop = fix (fun [::,eq_char,reverse] splitloop accWs k ->
          let lam_194'24 = fun [::,eq_char,reverse,splitloop,accWs] accCs k ->
            let lam_194'30 = fun [::,eq_char,reverse,splitloop,accWs,accCs] xs k ->
              match xs with
              | Nil0 ->
                let k [::,reverse,accWs] app_196'27 =
                  let k [reverse,accWs] app_196'33 =
                    let k [reverse] app_196'36 = reverse app_196'36 k in
                    app_196'33 accWs k in
                  :: app_196'27 k in
                reverse accCs k
              | Cons1(x,xs) ->
                let k [::,reverse,splitloop,accWs,accCs,x,xs] app_199'16 =
                  let lit_199'18 = ' ' in
                  let k [::,reverse,splitloop,accWs,accCs,x,xs] app_199'18 =
                    match app_199'18 with
                    | true1 ->
                      let k [::,splitloop,accWs,xs] app_199'46 =
                        let k [splitloop,accWs,xs] app_199'52 =
                          let k [splitloop,xs] app_199'55 =
                            let k [xs] app_199'37 =
                              let con_199'62 = Nil0 in
                              let k [xs] app_199'62 = app_199'62 xs k in
                              app_199'37 con_199'62 k in
                            splitloop app_199'55 k in
                          app_199'52 accWs k in
                        :: app_199'46 k in
                      reverse accCs k
                    | false0 ->
                      let k [::,accCs,x,xs] app_200'20 =
                        let k [accCs,xs,app_200'20] app_200'28 =
                          let k [xs,app_200'20] app_200'30 =
                            let k [xs] app_200'26 = app_200'26 xs k in
                            app_200'20 app_200'30 k in
                          app_200'28 accCs k in
                        :: x k in
                      splitloop accWs k in
                  app_199'16 lit_199'18 k in
                eq_char x k in
            k lam_194'30 in
          k lam_194'24) in
        let split_words = fun [splitloop] s k ->
          let con_203'12 = Nil0 in
          let k [s] app_203'12 =
            let con_203'15 = Nil0 in
            let k [s] app_203'15 = app_203'15 s k in
            app_203'12 con_203'15 k in
          splitloop con_203'12 k in
        let execute = fun [explode,eq_char_list,runfib,runfact,runrev,fallback,split_words] line k ->
          let k [explode,eq_char_list,runfib,runfact,runrev,fallback,line] words =
            match words with
            | Nil0 ->
              let con_208'10 = Unit0 in
              k con_208'10
            | Cons1(command,args) ->
              let k [explode,eq_char_list,runfib,runfact,runrev,fallback,line,command,args] app_210'21 =
                let lit_210'38 = "fib" in
                let k [explode,eq_char_list,runfib,runfact,runrev,fallback,line,command,args,app_210'21] app_210'38 =
                  let k [explode,eq_char_list,runfib,runfact,runrev,fallback,line,command,args] app_210'29 =
                    match app_210'29 with
                    | true1 -> runfib args k
                    | false0 ->
                      let k [explode,eq_char_list,runfact,runrev,fallback,line,command,args] app_211'23 =
                        let lit_211'40 = "fact" in
                        let k [explode,eq_char_list,runfact,runrev,fallback,line,command,args,app_211'23] app_211'40 =
                          let k [explode,eq_char_list,runfact,runrev,fallback,line,command,args] app_211'31 =
                            match app_211'31 with
                            | true1 -> runfact args k
                            | false0 ->
                              let k [explode,runrev,fallback,line,args] app_212'25 =
                                let lit_212'42 = "rev" in
                                let k [runrev,fallback,line,args,app_212'25] app_212'42 =
                                  let k [runrev,fallback,line,args] app_212'33 =
                                    match app_212'33 with
                                    | true1 -> runrev args k
                                    | false0 -> fallback line k in
                                  app_212'25 app_212'42 k in
                                explode lit_212'42 k in
                              eq_char_list command k in
                          app_211'23 app_211'40 k in
                        explode lit_211'40 k in
                      eq_char_list command k in
                  app_210'21 app_210'38 k in
                explode lit_210'38 k in
              eq_char_list command k in
          split_words line k in
        let mainloop = fix (fun [eq_char_list,put_chars,read_line,single_controlD,execute] mainloop _ k ->
          let lit_216'13 = '>' in
          let lit_216'17 = ' ' in
          let con_216'20 = Nil0 in
          let con_216'17 = Cons1[lit_216'17,con_216'20] in
          let con_216'13 = Cons1[lit_216'13,con_216'17] in
          let k [eq_char_list,read_line,single_controlD,execute,mainloop] _ =
            let con_217'21 = Unit0 in
            let k [eq_char_list,single_controlD,execute,mainloop] xs =
              let k [single_controlD,execute,mainloop,xs] app_218'18 =
                let k [execute,mainloop,xs] app_218'21 =
                  match app_218'21 with
                  | true1 ->
                    let con_218'42 = Unit0 in
                    k con_218'42
                  | false0 ->
                    let k [mainloop] _ =
                      let con_219'26 = Unit0 in
                      mainloop con_219'26 k in
                    execute xs k in
                app_218'18 single_controlD k in
              eq_char_list xs k in
            read_line con_217'21 k in
          put_chars con_216'13 k) in
        let main = fun [put_string,mainloop] _ k ->
          let lit_222'13 = "This is a shell prototype. Try: fib, fact, rev\n" in
          let k [mainloop] _ =
            let con_223'11 = Unit0 in
            mainloop con_223'11 k in
          put_string lit_222'13 k in
        let con_0'0 = Unit0 in
        main con_0'0 k in
      app_168'28 con_168'31 k in
    :: app_168'26 k in
  chr lit_168'26 k in
noinline explode k
