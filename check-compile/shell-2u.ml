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
let not = fun [] b k ->
  match b with
  | true1 ->
    let con_4'12 = false0 in
    k con_4'12
  | false0 ->
    let con_5'13 = true1 in
    k con_5'13 in
let > = fun [<] a k ->
  let lam_7'10 = fun [<,a] b k ->
    let k [a] app_7'16 = app_7'16 a k in
    < b k in
  k lam_7'10 in
let <= = fun [<,not] a k ->
  let lam_8'11 = fun [<,not,a] b k ->
    let k [not,a] app_8'22 =
      let k [not] app_8'24 = not app_8'24 k in
      app_8'22 a k in
    < b k in
  k lam_8'11 in
let >= = fun [<,not] a k ->
  let lam_9'11 = fun [<,not,a] b k ->
    let k [not,b] app_9'22 =
      let k [not] app_9'24 = not app_9'24 k in
      app_9'22 b k in
    < a k in
  k lam_9'11 in
let put_char = fun [+,-,=,chr,eq_char,ord,put_char,>] c k ->
  let backspace = 8 in
  let k [+,-,=,chr,eq_char,ord,put_char,>,c,backspace] n =
    let k [+,-,chr,eq_char,ord,put_char,>,c,backspace,n] app_15'7 =
      let k [+,-,chr,eq_char,ord,put_char,>,c,n] app_15'9 =
        match app_15'9 with
        | true1 -> put_char c k
        | false0 ->
          let k [+,-,chr,ord,put_char,>,c,n] app_16'15 =
            let lit_16'17 = '\n' in
            let k [+,-,chr,ord,put_char,>,c,n] app_16'17 =
              match app_16'17 with
              | true1 -> put_char c k
              | false0 ->
                let k [+,-,chr,ord,put_char,c,n] app_17'11 =
                  let lit_17'13 = 26 in
                  let k [+,-,chr,ord,put_char,c,n] app_17'13 =
                    match app_17'13 with
                    | true1 -> put_char c k
                    | false0 ->
                      let lit_18'18 = '^' in
                      let k [+,-,chr,ord,put_char,n] _ =
                        let lit_18'42 = 'A' in
                        let k [+,-,chr,put_char,n] app_18'42 =
                          let k [-,chr,put_char,n] app_18'46 =
                            let k [-,chr,put_char] app_18'48 =
                              let k [chr,put_char] app_18'50 =
                                let lit_18'52 = 1 in
                                let k [chr,put_char] app_18'52 =
                                  let k [put_char] app_18'37 = put_char app_18'37 k in
                                  chr app_18'52 k in
                                app_18'50 lit_18'52 k in
                              - app_18'48 k in
                            app_18'46 n k in
                          + app_18'42 k in
                        ord lit_18'42 k in
                      put_char lit_18'18 k in
                  app_17'11 lit_17'13 k in
                > n k in
            app_16'15 lit_16'17 k in
          eq_char c k in
      app_15'7 backspace k in
    = n k in
  ord c k in
let erase_char = fun [chr,put_char] _ k ->
  let lit_21'22 = 8 in
  let k [put_char] backspace =
    let k [put_char,backspace] _ =
      let lit_24'11 = ' ' in
      let k [put_char,backspace] _ = put_char backspace k in
      put_char lit_24'11 k in
    put_char backspace k in
  chr lit_21'22 k in
let parse_digit = fun [-,ord,<=,>=] c k ->
  let k [-,ord,<=,>=] app_30'14 =
    let k [ord,<=,>=] app_30'16 =
      let lit_30'22 = '0' in
      let k [<=,>=,app_30'16] app_30'22 =
        let k [<=,>=] n =
          let k [<=,n] app_32'7 =
            let lit_32'10 = 0 in
            let k [<=,n] app_32'10 =
              match app_32'10 with
              | true1 ->
                let k [n] app_32'22 =
                  let lit_32'25 = 9 in
                  let k [n] app_32'25 =
                    match app_32'25 with
                    | true1 ->
                      let con_32'32 = Some0[n] in
                      k con_32'32
                    | false0 ->
                      let con_32'45 = None1 in
                      k con_32'45 in
                  app_32'22 lit_32'25 k in
                <= n k
              | false0 ->
                let con_32'55 = None1 in
                k con_32'55 in
            app_32'7 lit_32'10 k in
          >= n k in
        app_30'16 app_30'22 k in
      ord lit_30'22 k in
    - app_30'14 k in
  ord c k in
let parse_num = fun [( * ),+,parse_digit] s k ->
  let loop = fix (fun [( * ),+,parse_digit] loop acc k ->
    let lam_35'19 = fun [( * ),+,parse_digit,loop,acc] xs k ->
      match xs with
      | Nil0 ->
        let con_37'12 = Some0[acc] in
        k con_37'12
      | Cons1(x,xs) ->
        let k [( * ),+,loop,acc,xs] app_39'26 =
          match app_39'26 with
          | None1 ->
            let con_40'18 = None1 in
            k con_40'18
          | Some0(d) ->
            let lit_41'26 = 10 in
            let k [+,loop,acc,xs,d] app_41'29 =
              let k [+,loop,xs,d] app_41'31 =
                let k [loop,xs,d] app_41'35 =
                  let k [loop,xs] app_41'37 =
                    let k [xs] app_41'25 = app_41'25 xs k in
                    loop app_41'37 k in
                  app_41'35 d k in
                + app_41'31 k in
              app_41'29 acc k in
            ( * ) lit_41'26 k in
        parse_digit x k in
    k lam_35'19) in
  let lit_43'7 = 0 in
  let k [s] app_43'7 = app_43'7 s k in
  loop lit_43'7 k in
let cons = fun [::] x k ->
  let lam_45'11 = fun [::,x] xs k ->
    let k [xs] app_45'18 = app_45'18 xs k in
    :: x k in
  k lam_45'11 in
let eq_list = fix (fun [] eq_list eq k ->
  let lam_47'19 = fun [eq_list,eq] xs k ->
    let lam_47'22 = fun [eq_list,eq,xs] ys k ->
      match xs with
      | Nil0 ->
        match ys with
        | Nil0 ->
          let con_49'33 = true1 in
          k con_49'33
        | Cons1(_,_) ->
          let con_49'48 = false0 in
          k con_49'48
      | Cons1(x,xs) ->
        match ys with
        | Nil0 ->
          let con_52'13 = false0 in
          k con_52'13
        | Cons1(y,ys) ->
          let k [eq_list,eq,xs,y,ys] app_54'14 =
            let k [eq_list,eq,xs,ys] app_54'16 =
              match app_54'16 with
              | true1 ->
                let k [xs,ys] app_54'31 =
                  let k [ys] app_54'34 = app_54'34 ys k in
                  app_54'31 xs k in
                eq_list eq k
              | false0 ->
                let con_54'45 = false0 in
                k con_54'45 in
            app_54'14 y k in
          eq x k in
    k lam_47'22 in
  k lam_47'19) in
let eq_char_list = fun [eq_char,eq_list] a k ->
  let lam_56'19 = fun [eq_char,eq_list,a] b k ->
    let k [a,b] app_56'31 =
      let k [b] app_56'39 = app_56'39 b k in
      app_56'31 a k in
    eq_list eq_char k in
  k lam_56'19 in
let append = fix (fun [cons] append xs k ->
  let lam_58'18 = fun [cons,append,xs] ys k ->
    match xs with
    | Nil0 -> k ys
    | Cons1(x,xs) ->
      let k [append,ys,xs] app_61'18 =
        let k [ys,app_61'18] app_61'28 =
          let k [app_61'18] app_61'31 = app_61'18 app_61'31 k in
          app_61'28 ys k in
        append xs k in
      cons x k in
  k lam_58'18) in
let reverse = fun [cons] xs k ->
  let loop = fix (fun [cons] loop acc k ->
    let lam_64'19 = fun [cons,loop,acc] xs k ->
      match xs with
      | Nil0 -> k acc
      | Cons1(x,xs) ->
        let k [loop,acc,xs] app_67'26 =
          let k [loop,xs] app_67'28 =
            let k [xs] app_67'20 = app_67'20 xs k in
            loop app_67'28 k in
          app_67'26 acc k in
        cons x k in
    k lam_64'19) in
  let con_69'7 = Nil0 in
  let k [xs] app_69'7 = app_69'7 xs k in
  loop con_69'7 k in
let map = fix (fun [::] map f k ->
  let lam_71'14 = fun [::,map,f] xs k ->
    match xs with
    | Nil0 ->
      let con_73'10 = Nil0 in
      k con_73'10
    | Cons1(x,xs) ->
      let k [::,map,f,xs] app_74'15 =
        let k [map,f,xs] app_74'17 =
          let k [xs,app_74'17] app_74'24 =
            let k [app_74'17] app_74'26 = app_74'17 app_74'26 k in
            app_74'24 xs k in
          map f k in
        :: app_74'15 k in
      f x k in
  k lam_71'14) in
let length = fix (fun [+] length xs k ->
  match xs with
  | Nil0 ->
    let lit_78'10 = 0 in
    k lit_78'10
  | Cons1(_,xs) ->
    let lit_79'17 = 1 in
    let k [length,xs] app_79'17 =
      let k [app_79'17] app_79'27 = app_79'17 app_79'27 k in
      length xs k in
    + lit_79'17 k) in
let chars_of_int = fun [%,+,/,=,chr,ord,cons] i k ->
  let lit_82'17 = '0' in
  let k [%,+,/,=,chr,cons,i] ord0 =
    let char_of_digit = fun [+,chr,ord0] c k ->
      let k [chr,c] app_83'34 =
        let k [chr] app_83'36 = chr app_83'36 k in
        app_83'34 c k in
      + ord0 k in
    let loop = fix (fun [%,/,=,cons,char_of_digit] loop acc k ->
      let lam_84'19 = fun [%,/,=,cons,char_of_digit,loop,acc] i k ->
        let k [%,/,cons,char_of_digit,loop,acc,i] app_85'9 =
          let lit_85'11 = 0 in
          let k [%,/,cons,char_of_digit,loop,acc,i] app_85'11 =
            match app_85'11 with
            | true1 -> k acc
            | false0 ->
              let k [/,cons,char_of_digit,loop,acc,i] app_86'34 =
                let lit_86'35 = 10 in
                let k [/,cons,char_of_digit,loop,acc,i] app_86'35 =
                  let k [/,cons,loop,acc,i] app_86'32 =
                    let k [/,loop,acc,i] app_86'17 =
                      let k [/,loop,i] app_86'40 =
                        let k [/,i] app_86'11 =
                          let k [app_86'11] app_86'47 =
                            let lit_86'48 = 10 in
                            let k [app_86'11] app_86'48 = app_86'11 app_86'48 k in
                            app_86'47 lit_86'48 k in
                          / i k in
                        loop app_86'40 k in
                      app_86'17 acc k in
                    cons app_86'32 k in
                  char_of_digit app_86'35 k in
                app_86'34 lit_86'35 k in
              % i k in
          app_85'9 lit_85'11 k in
        = i k in
      k lam_84'19) in
    let k [cons,i,loop] app_88'7 =
      let lit_88'9 = 0 in
      let k [cons,i,loop] app_88'9 =
        match app_88'9 with
        | true1 ->
          let lit_88'21 = '0' in
          let k [] app_88'21 =
            let con_88'25 = Nil0 in
            app_88'21 con_88'25 k in
          cons lit_88'21 k
        | false0 ->
          let con_88'38 = Nil0 in
          let k [i] app_88'38 = app_88'38 i k in
          loop con_88'38 k in
      app_88'7 lit_88'9 k in
    = i k in
  ord lit_82'17 k in
let put_chars = fix (fun [put_char] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_92'10 = Unit0 in
    k con_92'10
  | Cons1(x,xs) ->
    let k [put_chars,xs] _ = put_chars xs k in
    put_char x k) in
let put_string = fun [explode,put_chars] s k ->
  let k [put_chars] app_95'38 = put_chars app_95'38 k in
  explode s k in
let put_int = fun [chars_of_int,put_chars] i k ->
  let k [put_chars] app_97'40 = put_chars app_97'40 k in
  chars_of_int i k in
let newline = fun [put_char] _ k ->
  let lit_99'26 = '\n' in
  put_char lit_99'26 k in
let read_line = fun [::,=,chr,eq_char,get_char,ord,>,<=,put_char,erase_char,cons,reverse,newline] _ k ->
  let lit_102'21 = 4 in
  let k [::,=,eq_char,get_char,ord,>,<=,put_char,erase_char,cons,reverse,newline] controlD =
    let loop = fix (fun [::,=,eq_char,get_char,ord,>,<=,put_char,erase_char,cons,reverse,newline,controlD] loop acc k ->
      let con_104'21 = Unit0 in
      let k [::,=,eq_char,ord,>,<=,put_char,erase_char,cons,reverse,newline,controlD,loop,acc] c =
        let k [::,=,eq_char,ord,>,<=,put_char,erase_char,cons,reverse,newline,controlD,loop,acc,c] n =
          let k [::,=,eq_char,ord,>,<=,put_char,erase_char,cons,reverse,newline,controlD,loop,acc,c,n] app_106'15 =
            let lit_106'17 = '\n' in
            let k [::,=,eq_char,ord,>,<=,put_char,erase_char,cons,reverse,newline,controlD,loop,acc,c,n] app_106'17 =
              match app_106'17 with
              | true1 ->
                let con_106'35 = Unit0 in
                let k [reverse,acc] _ = reverse acc k in
                newline con_106'35 k
              | false0 ->
                let k [::,=,ord,>,<=,put_char,erase_char,cons,reverse,newline,controlD,loop,acc,c,n] app_107'17 =
                  let k [::,=,ord,>,<=,put_char,erase_char,cons,reverse,newline,controlD,loop,acc,c,n] app_107'19 =
                    match app_107'19 with
                    | true1 ->
                      let k [::,reverse,newline,controlD,acc] _ =
                        let con_107'53 = Unit0 in
                        let k [::,reverse,controlD,acc] _ =
                          let k [reverse,acc] app_107'75 =
                            let k [reverse] app_107'78 = reverse app_107'78 k in
                            app_107'75 acc k in
                          :: controlD k in
                        newline con_107'53 k in
                      put_char c k
                    | false0 ->
                      let k [=,ord,<=,put_char,erase_char,cons,loop,acc,c,n] app_108'13 =
                        let lit_108'15 = 127 in
                        let k [=,ord,<=,put_char,erase_char,cons,loop,acc,c,n] app_108'15 =
                          match app_108'15 with
                          | true1 -> loop acc k
                          | false0 ->
                            let k [ord,<=,put_char,erase_char,cons,loop,acc,c] app_109'15 =
                              let lit_109'17 = 127 in
                              let k [ord,<=,put_char,erase_char,cons,loop,acc,c] app_109'17 =
                                match app_109'17 with
                                | true1 ->
                                  match acc with
                                  | Nil0 -> loop acc k
                                  | Cons1(c,tail) ->
                                    let k [<=,erase_char,loop,tail] app_113'23 =
                                      let k [erase_char,loop,tail] app_113'25 =
                                        let lit_113'28 = 26 in
                                        let k [erase_char,loop,tail] app_113'28 =
                                          let k [erase_char,loop,tail] _ =
                                            let con_114'25 = Unit0 in
                                            let k [loop,tail] _ = loop tail k in
                                            erase_char con_114'25 k in
                                          match app_113'28 with
                                          | true1 ->
                                            let con_113'47 = Unit0 in
                                            erase_char con_113'47 k
                                          | false0 ->
                                            let con_113'55 = Unit0 in
                                            k con_113'55 in
                                        app_113'25 lit_113'28 k in
                                      <= app_113'23 k in
                                    ord c k
                                | false0 ->
                                  let k [cons,loop,acc,c] _ =
                                    let k [loop,acc] app_117'36 =
                                      let k [loop] app_117'38 = loop app_117'38 k in
                                      app_117'36 acc k in
                                    cons c k in
                                  put_char c k in
                              app_109'15 lit_109'17 k in
                            = n k in
                        app_108'13 lit_108'15 k in
                      > n k in
                  app_107'17 controlD k in
                eq_char c k in
            app_106'15 lit_106'17 k in
          eq_char c k in
        ord c k in
      get_char con_104'21 k) in
    let con_119'7 = Nil0 in
    loop con_119'7 k in
  chr lit_102'21 k in
let fib = fix (fun [+,-,<] fib n k ->
  let k [+,-,fib,n] app_123'7 =
    let lit_123'9 = 2 in
    let k [+,-,fib,n] app_123'9 =
      match app_123'9 with
      | true1 -> k n
      | false0 ->
        let k [+,-,fib,n] app_123'29 =
          let lit_123'30 = 1 in
          let k [+,-,fib,n] app_123'30 =
            let k [+,-,fib,n] app_123'27 =
              let k [-,fib,n] app_123'33 =
                let k [fib,app_123'33] app_123'41 =
                  let lit_123'42 = 2 in
                  let k [fib,app_123'33] app_123'42 =
                    let k [app_123'33] app_123'39 = app_123'33 app_123'39 k in
                    fib app_123'42 k in
                  app_123'41 lit_123'42 k in
                - n k in
              + app_123'27 k in
            fib app_123'30 k in
          app_123'29 lit_123'30 k in
        - n k in
    app_123'7 lit_123'9 k in
  < n k) in
let fact = fix (fun [( * ),-,>=] fact n k ->
  let k [( * ),-,fact,n] app_127'7 =
    let lit_127'10 = 2 in
    let k [( * ),-,fact,n] app_127'10 =
      match app_127'10 with
      | true1 ->
        let k [( * ),fact,n] app_127'24 =
          let lit_127'25 = 1 in
          let k [( * ),fact,n] app_127'25 =
            let k [( * ),n] app_127'22 =
              let k [n] app_127'28 = app_127'28 n k in
              ( * ) app_127'22 k in
            fact app_127'25 k in
          app_127'24 lit_127'25 k in
        - n k
      | false0 ->
        let lit_127'37 = 1 in
        k lit_127'37 in
    app_127'7 lit_127'10 k in
  >= n k) in
let error = fun [put_string,newline] s k ->
  let lit_129'25 = "ERROR: " in
  let k [put_string,newline,s] _ =
    let k [newline] _ =
      let con_129'58 = Unit0 in
      newline con_129'58 k in
    put_string s k in
  put_string lit_129'25 k in
let runfib = fun [parse_num,put_string,put_int,newline,fib,error] args k ->
  let lit_132'13 = "fib: " in
  let k [parse_num,put_string,put_int,newline,fib,error,args] _ =
    match args with
    | Nil0 ->
      let lit_134'16 = "expected an argument" in
      error lit_134'16 k
    | Cons1(arg1,more) ->
      match more with
      | Cons1(_,_) ->
        let lit_137'21 = "expected exactly one argument" in
        error lit_137'21 k
      | Nil0 ->
        let k [put_string,put_int,newline,fib,error] app_139'24 =
          match app_139'24 with
          | None1 ->
            let lit_140'24 = "expected arg1 to be numeric" in
            error lit_140'24 k
          | Some0(n) ->
            let k [put_string,put_int,newline,n] res =
              let k [put_string,put_int,newline,res] _ =
                let lit_144'22 = " --> " in
                let k [put_int,newline,res] _ =
                  let k [newline] _ =
                    let con_146'19 = Unit0 in
                    newline con_146'19 k in
                  put_int res k in
                put_string lit_144'22 k in
              put_int n k in
            fib n k in
        parse_num arg1 k in
  put_string lit_132'13 k in
let runfact = fun [parse_num,put_string,put_int,newline,fact,error] args k ->
  let lit_149'13 = "fact: " in
  let k [parse_num,put_string,put_int,newline,fact,error,args] _ =
    match args with
    | Nil0 ->
      let lit_151'16 = "expected an argument" in
      error lit_151'16 k
    | Cons1(arg1,more) ->
      match more with
      | Cons1(_,_) ->
        let lit_154'21 = "expected exactly one argument" in
        error lit_154'21 k
      | Nil0 ->
        let k [put_string,put_int,newline,fact,error] app_156'24 =
          match app_156'24 with
          | None1 ->
            let lit_157'24 = "expected arg1 to be numeric" in
            error lit_157'24 k
          | Some0(n) ->
            let k [put_string,put_int,newline,n] res =
              let k [put_string,put_int,newline,res] _ =
                let lit_161'22 = " --> " in
                let k [put_int,newline,res] _ =
                  let k [newline] _ =
                    let con_163'19 = Unit0 in
                    newline con_163'19 k in
                  put_int res k in
                put_string lit_161'22 k in
              put_int n k in
            fact n k in
        parse_num arg1 k in
  put_string lit_149'13 k in
let lit_166'26 = 4 in
let k [::,eq_char,explode,eq_char_list,append,reverse,map,length,put_chars,put_string,put_int,newline,read_line,error,runfib,runfact] app_166'26 =
  let k [::,eq_char,explode,eq_char_list,append,reverse,map,length,put_chars,put_string,put_int,newline,read_line,error,runfib,runfact] app_166'28 =
    let con_166'31 = Nil0 in
    let k [::,eq_char,explode,eq_char_list,append,reverse,map,length,put_chars,put_string,put_int,newline,read_line,error,runfib,runfact] single_controlD =
      let rev = fun [eq_char_list,reverse,put_chars,newline,read_line,single_controlD] _ k ->
        let loop = fix (fun [eq_char_list,reverse,put_chars,newline,read_line,single_controlD] loop _ k ->
          let con_170'23 = Unit0 in
          let k [eq_char_list,reverse,put_chars,newline,single_controlD,loop] xs =
            let k [reverse,put_chars,newline,single_controlD,loop,xs] app_171'20 =
              let k [reverse,put_chars,newline,loop,xs] app_171'23 =
                match app_171'23 with
                | true1 ->
                  let con_171'44 = Unit0 in
                  k con_171'44
                | false0 ->
                  let k [put_chars,newline,loop] app_172'26 =
                    let k [newline,loop] _ =
                      let con_172'38 = Unit0 in
                      let k [loop] _ =
                        let con_172'46 = Unit0 in
                        loop con_172'46 k in
                      newline con_172'38 k in
                    put_chars app_172'26 k in
                  reverse xs k in
              app_171'20 single_controlD k in
            eq_char_list xs k in
          read_line con_170'23 k) in
        let con_174'6 = Unit0 in
        loop con_174'6 k in
      let runrev = fun [put_string,error,rev] args k ->
        match args with
        | Cons1(_,_) ->
          let lit_178'18 = "rev: expected no arguments" in
          error lit_178'18 k
        | Nil0 ->
          let lit_180'16 = "(reverse typed lines until ^D)\n" in
          let k [rev] _ =
            let con_181'8 = Unit0 in
            rev con_181'8 k in
          put_string lit_180'16 k in
      let fallback = fun [eq_char,explode,append,map,length,put_chars,put_string,put_int,newline] line k ->
        let lam_184'30 = fun [eq_char] c k ->
          let k [c] app_184'46 =
            let lit_184'48 = 'o' in
            let k [c] app_184'48 =
              match app_184'48 with
              | true1 ->
                let lit_184'57 = '*' in
                k lit_184'57
              | false0 -> k c in
            app_184'46 lit_184'48 k in
          eq_char c k in
        let k [explode,append,length,put_chars,put_string,put_int,newline,line] star_the_ohs =
          let k [explode,append,put_chars,put_string,put_int,newline,line,star_the_ohs] n =
            let lit_186'29 = "You wrote: \"" in
            let k [append,put_chars,put_string,put_int,newline,line,star_the_ohs,n] app_186'29 =
              let k [put_chars,put_string,put_int,newline,line,star_the_ohs,n] app_186'20 =
                let k [put_chars,put_string,put_int,newline,n,app_186'20] app_186'60 =
                  let k [put_chars,put_string,put_int,newline,n] app_186'46 =
                    let k [put_string,put_int,newline,n] _ =
                      let lit_187'13 = "\" (" in
                      let k [put_string,put_int,newline,n] _ =
                        let k [put_string,newline] _ =
                          let lit_189'13 = " chars)" in
                          let k [newline] _ =
                            let con_190'10 = Unit0 in
                            newline con_190'10 k in
                          put_string lit_189'13 k in
                        put_int n k in
                      put_string lit_187'13 k in
                    put_chars app_186'46 k in
                  app_186'20 app_186'60 k in
                star_the_ohs line k in
              append app_186'29 k in
            explode lit_186'29 k in
          length line k in
        map lam_184'30 k in
      let split_words = fun [::,eq_char,reverse] s k ->
        let loop = fix (fun [::,eq_char,reverse] loop accWs k ->
          let lam_193'21 = fun [::,eq_char,reverse,loop,accWs] accCs k ->
            let lam_193'27 = fun [::,eq_char,reverse,loop,accWs,accCs] xs k ->
              match xs with
              | Nil0 ->
                let k [::,reverse,accWs] app_195'29 =
                  let k [reverse,accWs] app_195'35 =
                    let k [reverse] app_195'38 = reverse app_195'38 k in
                    app_195'35 accWs k in
                  :: app_195'29 k in
                reverse accCs k
              | Cons1(x,xs) ->
                let k [::,reverse,loop,accWs,accCs,x,xs] app_198'18 =
                  let lit_198'20 = ' ' in
                  let k [::,reverse,loop,accWs,accCs,x,xs] app_198'20 =
                    match app_198'20 with
                    | true1 ->
                      let k [::,loop,accWs,xs] app_198'43 =
                        let k [loop,accWs,xs] app_198'49 =
                          let k [loop,xs] app_198'52 =
                            let k [xs] app_198'34 =
                              let con_198'59 = Nil0 in
                              let k [xs] app_198'59 = app_198'59 xs k in
                              app_198'34 con_198'59 k in
                            loop app_198'52 k in
                          app_198'49 accWs k in
                        :: app_198'43 k in
                      reverse accCs k
                    | false0 ->
                      let k [::,accCs,x,xs] app_199'17 =
                        let k [accCs,xs,app_199'17] app_199'25 =
                          let k [xs,app_199'17] app_199'27 =
                            let k [xs] app_199'23 = app_199'23 xs k in
                            app_199'17 app_199'27 k in
                          app_199'25 accCs k in
                        :: x k in
                      loop accWs k in
                  app_198'18 lit_198'20 k in
                eq_char x k in
            k lam_193'27 in
          k lam_193'21) in
        let con_201'7 = Nil0 in
        let k [s] app_201'7 =
          let con_201'10 = Nil0 in
          let k [s] app_201'10 = app_201'10 s k in
          app_201'7 con_201'10 k in
        loop con_201'7 k in
      let execute = fun [explode,eq_char_list,runfib,runfact,runrev,fallback,split_words] line k ->
        let k [explode,eq_char_list,runfib,runfact,runrev,fallback,line] words =
          match words with
          | Nil0 ->
            let con_206'10 = Unit0 in
            k con_206'10
          | Cons1(command,args) ->
            let k [explode,eq_char_list,runfib,runfact,runrev,fallback,line,command,args] app_208'21 =
              let lit_208'38 = "fib" in
              let k [explode,eq_char_list,runfib,runfact,runrev,fallback,line,command,args,app_208'21] app_208'38 =
                let k [explode,eq_char_list,runfib,runfact,runrev,fallback,line,command,args] app_208'29 =
                  match app_208'29 with
                  | true1 -> runfib args k
                  | false0 ->
                    let k [explode,eq_char_list,runfact,runrev,fallback,line,command,args] app_209'23 =
                      let lit_209'40 = "fact" in
                      let k [explode,eq_char_list,runfact,runrev,fallback,line,command,args,app_209'23] app_209'40 =
                        let k [explode,eq_char_list,runfact,runrev,fallback,line,command,args] app_209'31 =
                          match app_209'31 with
                          | true1 -> runfact args k
                          | false0 ->
                            let k [explode,runrev,fallback,line,args] app_210'25 =
                              let lit_210'42 = "rev" in
                              let k [runrev,fallback,line,args,app_210'25] app_210'42 =
                                let k [runrev,fallback,line,args] app_210'33 =
                                  match app_210'33 with
                                  | true1 -> runrev args k
                                  | false0 -> fallback line k in
                                app_210'25 app_210'42 k in
                              explode lit_210'42 k in
                            eq_char_list command k in
                        app_209'23 app_209'40 k in
                      explode lit_209'40 k in
                    eq_char_list command k in
                app_208'21 app_208'38 k in
              explode lit_208'38 k in
            eq_char_list command k in
        split_words line k in
      let mainloop = fix (fun [eq_char_list,put_chars,read_line,single_controlD,execute] mainloop _ k ->
        let lit_214'13 = '>' in
        let lit_214'17 = ' ' in
        let con_214'20 = Nil0 in
        let con_214'17 = Cons1[lit_214'17,con_214'20] in
        let con_214'13 = Cons1[lit_214'13,con_214'17] in
        let k [eq_char_list,read_line,single_controlD,execute,mainloop] _ =
          let con_215'21 = Unit0 in
          let k [eq_char_list,single_controlD,execute,mainloop] xs =
            let k [single_controlD,execute,mainloop,xs] app_216'18 =
              let k [execute,mainloop,xs] app_216'21 =
                match app_216'21 with
                | true1 ->
                  let con_216'42 = Unit0 in
                  k con_216'42
                | false0 ->
                  let k [mainloop] _ =
                    let con_217'26 = Unit0 in
                    mainloop con_217'26 k in
                  execute xs k in
              app_216'18 single_controlD k in
            eq_char_list xs k in
          read_line con_215'21 k in
        put_chars con_214'13 k) in
      let main = fun [put_string,mainloop] _ k ->
        let lit_220'13 = "This is a shell prototype. Try: fib, fact, rev\n" in
        let k [mainloop] _ =
          let con_221'11 = Unit0 in
          mainloop con_221'11 k in
        put_string lit_220'13 k in
      let con_0'0 = Unit0 in
      main con_0'0 k in
    app_166'28 con_166'31 k in
  :: app_166'26 k in
chr lit_166'26 k
