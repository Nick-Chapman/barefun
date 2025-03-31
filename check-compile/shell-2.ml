(*stage2*)
let k () = ()
let r = fix (fun [] r f k -> k f) in
let noinline = r in
let lam_14'29 = fun [] c k ->
  let backspace = 8 in
  let n = PRIM_CharOrd(c) in
  let prim_0'0 = PRIM_EqInt(n,backspace) in
  match prim_0'0 with
  | true1 ->
    let prim_0'0 = PRIM_PutChar(c) in
    k prim_0'0
  | false0 ->
    let y = '\n' in
    let uLET_0'0 = PRIM_EqChar(c,y) in
    match uLET_0'0 with
    | true1 ->
      let prim_0'0 = PRIM_PutChar(c) in
      k prim_0'0
    | false0 ->
      let b = 26 in
      let uLET_9'10 = PRIM_LessInt(b,n) in
      match uLET_9'10 with
      | true1 ->
        let prim_0'0 = PRIM_PutChar(c) in
        k prim_0'0
      | false0 ->
        let x = '^' in
        let _ = PRIM_PutChar(x) in
        let x = 'A' in
        let x = PRIM_CharOrd(x) in
        let uLET_0'0 = fun [x] y k ->
          let prim_0'0 = PRIM_AddInt(x,y) in
          k prim_0'0 in
        let k [] x =
          let uLET_0'0 = fun [x] y k ->
            let prim_0'0 = PRIM_SubInt(x,y) in
            k prim_0'0 in
          let lit_20'52 = 1 in
          let k [] x =
            let x = PRIM_CharChr(x) in
            let prim_0'0 = PRIM_PutChar(x) in
            k prim_0'0 in
          uLET_0'0 lit_20'52 k in
        uLET_0'0 n k in
let k [] put_char =
  let eq_list = fix (fun [] eq_list eq k ->
    let lam_49'19 = fun [eq,eq_list] xs k ->
      let lam_49'22 = fun [eq,eq_list,xs] ys k ->
        match xs with
        | Nil0 ->
          match ys with
          | Nil0 ->
            let con_51'33 = true1 in
            k con_51'33
          | Cons1(_,_) ->
            let con_51'48 = false0 in
            k con_51'48
        | Cons1(x,xs) ->
          match ys with
          | Nil0 ->
            let con_54'13 = false0 in
            k con_54'13
          | Cons1(y,ys) ->
            let k [eq,eq_list,xs,y,ys] app_56'14 =
              let k [eq,eq_list,xs,ys] app_56'16 =
                match app_56'16 with
                | true1 ->
                  let k [xs,ys] app_56'31 =
                    let k [ys] app_56'34 = app_56'34 ys k in
                    app_56'31 xs k in
                  eq_list eq k
                | false0 ->
                  let con_56'45 = false0 in
                  k con_56'45 in
              app_56'14 y k in
            eq x k in
      k lam_49'22 in
    k lam_49'19) in
  let append = fix (fun [] append xs k ->
    let lam_60'18 = fun [xs,append] ys k ->
      match xs with
      | Nil0 -> k ys
      | Cons1(x,xs) ->
        let k [ys,x] app_63'28 =
          let k [x] xs =
            let con_0'0 = Cons1[x,xs] in
            k con_0'0 in
          app_63'28 ys k in
        append xs k in
    k lam_60'18) in
  let map = fix (fun [] map f k ->
    let lam_73'14 = fun [f,map] xs k ->
      match xs with
      | Nil0 ->
        let con_75'10 = Nil0 in
        k con_75'10
      | Cons1(x,xs) ->
        let k [f,map,xs] x =
          let uLET_0'0 = fun [x] y k ->
            let con_0'0 = Cons1[x,y] in
            k con_0'0 in
          let k [uLET_0'0,xs] app_76'24 =
            let k [uLET_0'0] app_76'26 = uLET_0'0 app_76'26 k in
            app_76'24 xs k in
          map f k in
        f x k in
    k lam_73'14) in
  let length = fix (fun [] length xs k ->
    match xs with
    | Nil0 ->
      let lit_80'10 = 0 in
      k lit_80'10
    | Cons1(_,xs) ->
      let x = 1 in
      let uLET_0'0 = fun [x] y k ->
        let prim_0'0 = PRIM_AddInt(x,y) in
        k prim_0'0 in
      let k [uLET_0'0] app_81'27 = uLET_0'0 app_81'27 k in
      length xs k) in
  let put_chars = fix (fun [put_char] put_chars xs k ->
    match xs with
    | Nil0 ->
      let con_94'10 = Unit0 in
      k con_94'10
    | Cons1(x,xs) ->
      let k [put_chars,xs] _ = put_chars xs k in
      put_char x k) in
  let fib = fix (fun [] fib n k ->
    let y = 2 in
    let uLET_0'0 = PRIM_LessInt(n,y) in
    match uLET_0'0 with
    | true1 -> k n
    | false0 ->
      let y = 1 in
      let uLET_0'0 = PRIM_SubInt(n,y) in
      let k [n,fib] x =
        let uLET_0'0 = fun [x] y k ->
          let prim_0'0 = PRIM_AddInt(x,y) in
          k prim_0'0 in
        let y = 2 in
        let uLET_0'0 = PRIM_SubInt(n,y) in
        let k [uLET_0'0] app_125'39 = uLET_0'0 app_125'39 k in
        fib uLET_0'0 k in
      fib uLET_0'0 k) in
  let fact = fix (fun [] fact n k ->
    let b = 2 in
    let b = PRIM_LessInt(n,b) in
    let k [n,fact] uLET_11'11 =
      match uLET_11'11 with
      | true1 ->
        let y = 1 in
        let uLET_0'0 = PRIM_SubInt(n,y) in
        let k [n] x =
          let uLET_0'0 = fun [x] y k ->
            let prim_0'0 = PRIM_MulInt(x,y) in
            k prim_0'0 in
          uLET_0'0 n k in
        fact uLET_0'0 k
      | false0 ->
        let lit_129'37 = 1 in
        k lit_129'37 in
    match b with
    | true1 ->
      let con_6'12 = false0 in
      k con_6'12
    | false0 ->
      let con_7'13 = true1 in
      k con_7'13) in
  let x = 4 in
  let x = PRIM_CharChr(x) in
  let uLET_0'0 = fun [x] y k ->
    let con_0'0 = Cons1[x,y] in
    k con_0'0 in
  let con_168'31 = Nil0 in
  let k [put_char,eq_list,append,map,length,put_chars,fib,fact] single_controlD =
    let mainloop = fix (fun [put_char,eq_list,append,map,length,put_chars,fib,fact,single_controlD] mainloop _ k ->
      let lit_216'13 = '>' in
      let lit_216'17 = ' ' in
      let con_216'20 = Nil0 in
      let con_216'17 = Cons1[lit_216'17,con_216'20] in
      let con_216'13 = Cons1[lit_216'13,con_216'17] in
      let k [put_char,eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop] _ =
        let _ = Unit0 in
        let x = 4 in
        let controlD = PRIM_CharChr(x) in
        let loop = fix (fun [put_char,controlD] loop acc k ->
          let x = Unit0 in
          let c = PRIM_GetChar(x) in
          let n = PRIM_CharOrd(c) in
          let y = '\n' in
          let uLET_0'0 = PRIM_EqChar(c,y) in
          match uLET_0'0 with
          | true1 ->
            let _ = Unit0 in
            let lit_101'26 = '\n' in
            let k [acc] _ =
              let loop = fix (fun [] loop acc k ->
                let lam_66'19 = fun [acc,loop] xs k ->
                  match xs with
                  | Nil0 -> k acc
                  | Cons1(x,xs) ->
                    let con_0'0 = Cons1[x,acc] in
                    let k [xs] app_69'20 = app_69'20 xs k in
                    loop con_0'0 k in
                k lam_66'19) in
              let con_71'7 = Nil0 in
              let k [acc] app_71'7 = app_71'7 acc k in
              loop con_71'7 k in
            put_char lit_101'26 k
          | false0 ->
            let prim_0'0 = PRIM_EqChar(c,controlD) in
            match prim_0'0 with
            | true1 ->
              let k [put_char,controlD,acc] _ =
                let _ = Unit0 in
                let lit_101'26 = '\n' in
                let k [controlD,acc] _ =
                  let xs = Cons1[controlD,acc] in
                  let loop = fix (fun [] loop acc k ->
                    let lam_66'19 = fun [acc,loop] xs k ->
                      match xs with
                      | Nil0 -> k acc
                      | Cons1(x,xs) ->
                        let con_0'0 = Cons1[x,acc] in
                        let k [xs] app_69'20 = app_69'20 xs k in
                        loop con_0'0 k in
                    k lam_66'19) in
                  let con_71'7 = Nil0 in
                  let k [xs] app_71'7 = app_71'7 xs k in
                  loop con_71'7 k in
                put_char lit_101'26 k in
              put_char c k
            | false0 ->
              let b = 127 in
              let uLET_9'10 = PRIM_LessInt(b,n) in
              match uLET_9'10 with
              | true1 -> loop acc k
              | false0 ->
                let y = 127 in
                let uLET_0'0 = PRIM_EqInt(n,y) in
                match uLET_0'0 with
                | true1 ->
                  match acc with
                  | Nil0 -> loop acc k
                  | Cons1(c,tail) ->
                    let a = PRIM_CharOrd(c) in
                    let uLET_10'9 = fun [a] b k ->
                      let b = PRIM_LessInt(b,a) in
                      match b with
                      | true1 ->
                        let con_6'12 = false0 in
                        k con_6'12
                      | false0 ->
                        let con_7'13 = true1 in
                        k con_7'13 in
                    let lit_115'28 = 26 in
                    let k [put_char,loop,tail] app_115'28 =
                      let k [put_char,loop,tail] _ =
                        let _ = Unit0 in
                        let x = 8 in
                        let backspace = PRIM_CharChr(x) in
                        let k [put_char,loop,tail,backspace] _ =
                          let lit_26'11 = ' ' in
                          let k [put_char,loop,tail,backspace] _ =
                            let k [loop,tail] _ = loop tail k in
                            put_char backspace k in
                          put_char lit_26'11 k in
                        put_char backspace k in
                      match app_115'28 with
                      | true1 ->
                        let _ = Unit0 in
                        let x = 8 in
                        let backspace = PRIM_CharChr(x) in
                        let k [put_char,backspace] _ =
                          let lit_26'11 = ' ' in
                          let k [put_char,backspace] _ = put_char backspace k in
                          put_char lit_26'11 k in
                        put_char backspace k
                      | false0 ->
                        let con_115'55 = Unit0 in
                        k con_115'55 in
                    uLET_10'9 lit_115'28 k
                | false0 ->
                  let k [acc,loop,c] _ =
                    let con_0'0 = Cons1[c,acc] in
                    loop con_0'0 k in
                  put_char c k) in
        let con_121'7 = Nil0 in
        let k [put_char,eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop] xs =
          let lam_0'0 = fun [] x k ->
            let lam_0'0 = fun [x] y k ->
              let prim_0'0 = PRIM_EqChar(x,y) in
              k prim_0'0 in
            k lam_0'0 in
          let k [put_char,eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop,xs] app_58'31 =
            let k [put_char,eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop,xs] app_58'39 =
              let k [put_char,eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop,xs] app_58'41 =
                match app_58'41 with
                | true1 ->
                  let con_218'42 = Unit0 in
                  k con_218'42
                | false0 ->
                  let loop = fix (fun [] loop accWs k ->
                    let lam_195'21 = fun [accWs,loop] accCs k ->
                      let lam_195'27 = fun [accWs,loop,accCs] xs k ->
                        match xs with
                        | Nil0 ->
                          let loop = fix (fun [] loop acc k ->
                            let lam_66'19 = fun [acc,loop] xs k ->
                              match xs with
                              | Nil0 -> k acc
                              | Cons1(x,xs) ->
                                let con_0'0 = Cons1[x,acc] in
                                let k [xs] app_69'20 = app_69'20 xs k in
                                loop con_0'0 k in
                            k lam_66'19) in
                          let con_71'7 = Nil0 in
                          let k [accWs,accCs] app_71'7 =
                            let k [accWs] x =
                              let uLET_0'0 = fun [x] y k ->
                                let con_0'0 = Cons1[x,y] in
                                k con_0'0 in
                              let k [] xs =
                                let loop = fix (fun [] loop acc k ->
                                  let lam_66'19 = fun [acc,loop] xs k ->
                                    match xs with
                                    | Nil0 -> k acc
                                    | Cons1(x,xs) ->
                                      let con_0'0 = Cons1[x,acc] in
                                      let k [xs] app_69'20 = app_69'20 xs k in
                                      loop con_0'0 k in
                                  k lam_66'19) in
                                let con_71'7 = Nil0 in
                                let k [xs] app_71'7 = app_71'7 xs k in
                                loop con_71'7 k in
                              uLET_0'0 accWs k in
                            app_71'7 accCs k in
                          loop con_71'7 k
                        | Cons1(x,xs) ->
                          let y = ' ' in
                          let uLET_0'0 = PRIM_EqChar(x,y) in
                          match uLET_0'0 with
                          | true1 ->
                            let loop = fix (fun [] loop acc k ->
                              let lam_66'19 = fun [acc,loop] xs k ->
                                match xs with
                                | Nil0 -> k acc
                                | Cons1(x,xs) ->
                                  let con_0'0 = Cons1[x,acc] in
                                  let k [xs] app_69'20 = app_69'20 xs k in
                                  loop con_0'0 k in
                              k lam_66'19) in
                            let con_71'7 = Nil0 in
                            let k [accWs,loop,accCs,xs] app_71'7 =
                              let k [accWs,loop,xs] x =
                                let uLET_0'0 = fun [x] y k ->
                                  let con_0'0 = Cons1[x,y] in
                                  k con_0'0 in
                                let k [loop,xs] app_200'52 =
                                  let k [xs] app_200'34 =
                                    let con_200'59 = Nil0 in
                                    let k [xs] app_200'59 = app_200'59 xs k in
                                    app_200'34 con_200'59 k in
                                  loop app_200'52 k in
                                uLET_0'0 accWs k in
                              app_71'7 accCs k in
                            loop con_71'7 k
                          | false0 ->
                            let k [accCs,x,xs] app_201'17 =
                              let con_0'0 = Cons1[x,accCs] in
                              let k [xs] app_201'23 = app_201'23 xs k in
                              app_201'17 con_0'0 k in
                            loop accWs k in
                      k lam_195'27 in
                    k lam_195'21) in
                  let con_203'7 = Nil0 in
                  let k [put_char,eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop,xs] app_203'7 =
                    let con_203'10 = Nil0 in
                    let k [put_char,eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop,xs] app_203'10 =
                      let k [put_char,eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop,xs] words =
                        let k [mainloop] _ =
                          let con_219'26 = Unit0 in
                          mainloop con_219'26 k in
                        match words with
                        | Nil0 ->
                          let con_208'10 = Unit0 in
                          k con_208'10
                        | Cons1(command,args) ->
                          let x = "fib" in
                          let b = PRIM_Explode(x) in
                          let lam_0'0 = fun [] x k ->
                            let lam_0'0 = fun [x] y k ->
                              let prim_0'0 = PRIM_EqChar(x,y) in
                              k prim_0'0 in
                            k lam_0'0 in
                          let k [put_char,eq_list,append,map,length,put_chars,fib,fact,single_controlD,xs,command,args,b] app_58'31 =
                            let k [put_char,eq_list,append,map,length,put_chars,fib,fact,single_controlD,xs,command,args,b] app_58'39 =
                              let k [put_char,eq_list,append,map,length,put_chars,fib,fact,single_controlD,xs,command,args] uLET_58'19 =
                                match uLET_58'19 with
                                | true1 ->
                                  let s = "fib: " in
                                  let prim_0'0 = PRIM_Explode(s) in
                                  let k [put_char,put_chars,fib,args] _ =
                                    match args with
                                    | Nil0 ->
                                      let s = "expected an argument" in
                                      let s = "ERROR: " in
                                      let prim_0'0 = PRIM_Explode(s) in
                                      let k [put_char,put_chars,s] _ =
                                        let prim_0'0 = PRIM_Explode(s) in
                                        let k [put_char] _ =
                                          let _ = Unit0 in
                                          let lit_101'26 = '\n' in
                                          put_char lit_101'26 k in
                                        put_chars prim_0'0 k in
                                      put_chars prim_0'0 k
                                    | Cons1(arg1,more) ->
                                      match more with
                                      | Cons1(_,_) ->
                                        let s = "expected exactly one argument" in
                                        let s = "ERROR: " in
                                        let prim_0'0 = PRIM_Explode(s) in
                                        let k [put_char,put_chars,s] _ =
                                          let prim_0'0 = PRIM_Explode(s) in
                                          let k [put_char] _ =
                                            let _ = Unit0 in
                                            let lit_101'26 = '\n' in
                                            put_char lit_101'26 k in
                                          put_chars prim_0'0 k in
                                        put_chars prim_0'0 k
                                      | Nil0 ->
                                        let loop = fix (fun [] loop acc k ->
                                          let lam_37'19 = fun [acc,loop] xs k ->
                                            match xs with
                                            | Nil0 ->
                                              let con_39'12 = Some0[acc] in
                                              k con_39'12
                                            | Cons1(x,xs) ->
                                              let x = PRIM_CharOrd(x) in
                                              let uLET_0'0 = fun [x] y k ->
                                                let prim_0'0 = PRIM_SubInt(x,y) in
                                                k prim_0'0 in
                                              let x = '0' in
                                              let uLET_0'0 = PRIM_CharOrd(x) in
                                              let k [acc,loop,xs] n =
                                                let b = 0 in
                                                let b = PRIM_LessInt(n,b) in
                                                let k [acc,loop,xs,n] uLET_11'11 =
                                                  let k [acc,loop,xs] uLET_32'6 =
                                                    match uLET_32'6 with
                                                    | None1 ->
                                                      let con_42'18 = None1 in
                                                      k con_42'18
                                                    | Some0(d) ->
                                                      let x = 10 in
                                                      let uLET_0'0 = fun [x] y k ->
                                                        let prim_0'0 = PRIM_MulInt(x,y) in
                                                        k prim_0'0 in
                                                      let k [loop,xs,d] x =
                                                        let uLET_0'0 = fun [x] y k ->
                                                          let prim_0'0 = PRIM_AddInt(x,y) in
                                                          k prim_0'0 in
                                                        let k [loop,xs] app_43'37 =
                                                          let k [xs] app_43'25 = app_43'25 xs k in
                                                          loop app_43'37 k in
                                                        uLET_0'0 d k in
                                                      uLET_0'0 acc k in
                                                  match uLET_11'11 with
                                                  | true1 ->
                                                    let b = 9 in
                                                    let b = PRIM_LessInt(b,n) in
                                                    let k [n] uLET_10'11 =
                                                      match uLET_10'11 with
                                                      | true1 ->
                                                        let con_34'32 = Some0[n] in
                                                        k con_34'32
                                                      | false0 ->
                                                        let con_34'45 = None1 in
                                                        k con_34'45 in
                                                    match b with
                                                    | true1 ->
                                                      let con_6'12 = false0 in
                                                      k con_6'12
                                                    | false0 ->
                                                      let con_7'13 = true1 in
                                                      k con_7'13
                                                  | false0 ->
                                                    let con_34'55 = None1 in
                                                    k con_34'55 in
                                                match b with
                                                | true1 ->
                                                  let con_6'12 = false0 in
                                                  k con_6'12
                                                | false0 ->
                                                  let con_7'13 = true1 in
                                                  k con_7'13 in
                                              uLET_0'0 uLET_0'0 k in
                                          k lam_37'19) in
                                        let lit_45'7 = 0 in
                                        let k [put_char,put_chars,fib,arg1] app_45'7 =
                                          let k [put_char,put_chars,fib] uLET_37'10 =
                                            match uLET_37'10 with
                                            | None1 ->
                                              let s = "expected arg1 to be numeric" in
                                              let s = "ERROR: " in
                                              let prim_0'0 = PRIM_Explode(s) in
                                              let k [put_char,put_chars,s] _ =
                                                let prim_0'0 = PRIM_Explode(s) in
                                                let k [put_char] _ =
                                                  let _ = Unit0 in
                                                  let lit_101'26 = '\n' in
                                                  put_char lit_101'26 k in
                                                put_chars prim_0'0 k in
                                              put_chars prim_0'0 k
                                            | Some0(n) ->
                                              let k [put_char,put_chars,n] res =
                                                let x = '0' in
                                                let ord0 = PRIM_CharOrd(x) in
                                                let loop = fix (fun [ord0] loop acc k ->
                                                  let lam_86'19 = fun [ord0,acc,loop] i k ->
                                                    let y = 0 in
                                                    let uLET_0'0 = PRIM_EqInt(i,y) in
                                                    match uLET_0'0 with
                                                    | true1 -> k acc
                                                    | false0 ->
                                                      let y = 10 in
                                                      let c = PRIM_ModInt(i,y) in
                                                      let x = PRIM_AddInt(ord0,c) in
                                                      let x = PRIM_CharChr(x) in
                                                      let uLET_47'9 = fun [x] xs k ->
                                                        let con_0'0 = Cons1[x,xs] in
                                                        k con_0'0 in
                                                      let k [loop,i] app_88'40 =
                                                        let k [i] app_88'11 =
                                                          let y = 10 in
                                                          let uLET_0'0 = PRIM_DivInt(i,y) in
                                                          app_88'11 uLET_0'0 k in
                                                        loop app_88'40 k in
                                                      uLET_47'9 acc k in
                                                  k lam_86'19) in
                                                let y = 0 in
                                                let uLET_0'0 = PRIM_EqInt(n,y) in
                                                let k [put_char,put_chars,res] uLET_84'6 =
                                                  let k [put_char,put_chars,res] _ =
                                                    let s = " --> " in
                                                    let prim_0'0 = PRIM_Explode(s) in
                                                    let k [put_char,put_chars,res] _ =
                                                      let x = '0' in
                                                      let ord0 = PRIM_CharOrd(x) in
                                                      let loop = fix (fun [ord0] loop acc k ->
                                                        let lam_86'19 = fun [ord0,acc,loop] i k ->
                                                          let y = 0 in
                                                          let uLET_0'0 = PRIM_EqInt(i,y) in
                                                          match uLET_0'0 with
                                                          | true1 -> k acc
                                                          | false0 ->
                                                            let y = 10 in
                                                            let c = PRIM_ModInt(i,y) in
                                                            let x = PRIM_AddInt(ord0,c) in
                                                            let x = PRIM_CharChr(x) in
                                                            let uLET_47'9 = fun [x] xs k ->
                                                              let con_0'0 = Cons1[x,xs] in
                                                              k con_0'0 in
                                                            let k [loop,i] app_88'40 =
                                                              let k [i] app_88'11 =
                                                                let y = 10 in
                                                                let uLET_0'0 = PRIM_DivInt(i,y) in
                                                                app_88'11 uLET_0'0 k in
                                                              loop app_88'40 k in
                                                            uLET_47'9 acc k in
                                                        k lam_86'19) in
                                                      let y = 0 in
                                                      let uLET_0'0 = PRIM_EqInt(res,y) in
                                                      let k [put_char,put_chars] uLET_84'6 =
                                                        let k [put_char] _ =
                                                          let _ = Unit0 in
                                                          let lit_101'26 = '\n' in
                                                          put_char lit_101'26 k in
                                                        put_chars uLET_84'6 k in
                                                      match uLET_0'0 with
                                                      | true1 ->
                                                        let x = '0' in
                                                        let uLET_47'9 = fun [x] xs k ->
                                                          let con_0'0 = Cons1[x,xs] in
                                                          k con_0'0 in
                                                        let con_90'25 = Nil0 in
                                                        uLET_47'9 con_90'25 k
                                                      | false0 ->
                                                        let con_90'38 = Nil0 in
                                                        let k [res] app_90'38 = app_90'38 res k in
                                                        loop con_90'38 k in
                                                    put_chars prim_0'0 k in
                                                  put_chars uLET_84'6 k in
                                                match uLET_0'0 with
                                                | true1 ->
                                                  let x = '0' in
                                                  let uLET_47'9 = fun [x] xs k ->
                                                    let con_0'0 = Cons1[x,xs] in
                                                    k con_0'0 in
                                                  let con_90'25 = Nil0 in
                                                  uLET_47'9 con_90'25 k
                                                | false0 ->
                                                  let con_90'38 = Nil0 in
                                                  let k [n] app_90'38 = app_90'38 n k in
                                                  loop con_90'38 k in
                                              fib n k in
                                          app_45'7 arg1 k in
                                        loop lit_45'7 k in
                                  put_chars prim_0'0 k
                                | false0 ->
                                  let x = "fact" in
                                  let b = PRIM_Explode(x) in
                                  let lam_0'0 = fun [] x k ->
                                    let lam_0'0 = fun [x] y k ->
                                      let prim_0'0 = PRIM_EqChar(x,y) in
                                      k prim_0'0 in
                                    k lam_0'0 in
                                  let k [put_char,eq_list,append,map,length,put_chars,fact,single_controlD,xs,command,args,b] app_58'31 =
                                    let k [put_char,eq_list,append,map,length,put_chars,fact,single_controlD,xs,command,args,b] app_58'39 =
                                      let k [put_char,eq_list,append,map,length,put_chars,fact,single_controlD,xs,command,args] uLET_58'19 =
                                        match uLET_58'19 with
                                        | true1 ->
                                          let s = "fact: " in
                                          let prim_0'0 = PRIM_Explode(s) in
                                          let k [put_char,put_chars,fact,args] _ =
                                            match args with
                                            | Nil0 ->
                                              let s = "expected an argument" in
                                              let s = "ERROR: " in
                                              let prim_0'0 = PRIM_Explode(s) in
                                              let k [put_char,put_chars,s] _ =
                                                let prim_0'0 = PRIM_Explode(s) in
                                                let k [put_char] _ =
                                                  let _ = Unit0 in
                                                  let lit_101'26 = '\n' in
                                                  put_char lit_101'26 k in
                                                put_chars prim_0'0 k in
                                              put_chars prim_0'0 k
                                            | Cons1(arg1,more) ->
                                              match more with
                                              | Cons1(_,_) ->
                                                let s = "expected exactly one argument" in
                                                let s = "ERROR: " in
                                                let prim_0'0 = PRIM_Explode(s) in
                                                let k [put_char,put_chars,s] _ =
                                                  let prim_0'0 = PRIM_Explode(s) in
                                                  let k [put_char] _ =
                                                    let _ = Unit0 in
                                                    let lit_101'26 = '\n' in
                                                    put_char lit_101'26 k in
                                                  put_chars prim_0'0 k in
                                                put_chars prim_0'0 k
                                              | Nil0 ->
                                                let loop = fix (fun [] loop acc k ->
                                                  let lam_37'19 = fun [acc,loop] xs k ->
                                                    match xs with
                                                    | Nil0 ->
                                                      let con_39'12 = Some0[acc] in
                                                      k con_39'12
                                                    | Cons1(x,xs) ->
                                                      let x = PRIM_CharOrd(x) in
                                                      let uLET_0'0 = fun [x] y k ->
                                                        let prim_0'0 = PRIM_SubInt(x,y) in
                                                        k prim_0'0 in
                                                      let x = '0' in
                                                      let uLET_0'0 = PRIM_CharOrd(x) in
                                                      let k [acc,loop,xs] n =
                                                        let b = 0 in
                                                        let b = PRIM_LessInt(n,b) in
                                                        let k [acc,loop,xs,n] uLET_11'11 =
                                                          let k [acc,loop,xs] uLET_32'6 =
                                                            match uLET_32'6 with
                                                            | None1 ->
                                                              let con_42'18 = None1 in
                                                              k con_42'18
                                                            | Some0(d) ->
                                                              let x = 10 in
                                                              let uLET_0'0 = fun [x] y k ->
                                                                let prim_0'0 = PRIM_MulInt(x,y) in
                                                                k prim_0'0 in
                                                              let k [loop,xs,d] x =
                                                                let uLET_0'0 = fun [x] y k ->
                                                                  let prim_0'0 = PRIM_AddInt(x,y) in
                                                                  k prim_0'0 in
                                                                let k [loop,xs] app_43'37 =
                                                                  let k [xs] app_43'25 = app_43'25 xs k in
                                                                  loop app_43'37 k in
                                                                uLET_0'0 d k in
                                                              uLET_0'0 acc k in
                                                          match uLET_11'11 with
                                                          | true1 ->
                                                            let b = 9 in
                                                            let b = PRIM_LessInt(b,n) in
                                                            let k [n] uLET_10'11 =
                                                              match uLET_10'11 with
                                                              | true1 ->
                                                                let con_34'32 = Some0[n] in
                                                                k con_34'32
                                                              | false0 ->
                                                                let con_34'45 = None1 in
                                                                k con_34'45 in
                                                            match b with
                                                            | true1 ->
                                                              let con_6'12 = false0 in
                                                              k con_6'12
                                                            | false0 ->
                                                              let con_7'13 = true1 in
                                                              k con_7'13
                                                          | false0 ->
                                                            let con_34'55 = None1 in
                                                            k con_34'55 in
                                                        match b with
                                                        | true1 ->
                                                          let con_6'12 = false0 in
                                                          k con_6'12
                                                        | false0 ->
                                                          let con_7'13 = true1 in
                                                          k con_7'13 in
                                                      uLET_0'0 uLET_0'0 k in
                                                  k lam_37'19) in
                                                let lit_45'7 = 0 in
                                                let k [put_char,put_chars,fact,arg1] app_45'7 =
                                                  let k [put_char,put_chars,fact] uLET_37'10 =
                                                    match uLET_37'10 with
                                                    | None1 ->
                                                      let s = "expected arg1 to be numeric" in
                                                      let s = "ERROR: " in
                                                      let prim_0'0 = PRIM_Explode(s) in
                                                      let k [put_char,put_chars,s] _ =
                                                        let prim_0'0 = PRIM_Explode(s) in
                                                        let k [put_char] _ =
                                                          let _ = Unit0 in
                                                          let lit_101'26 = '\n' in
                                                          put_char lit_101'26 k in
                                                        put_chars prim_0'0 k in
                                                      put_chars prim_0'0 k
                                                    | Some0(n) ->
                                                      let k [put_char,put_chars,n] res =
                                                        let x = '0' in
                                                        let ord0 = PRIM_CharOrd(x) in
                                                        let loop = fix (fun [ord0] loop acc k ->
                                                          let lam_86'19 = fun [ord0,acc,loop] i k ->
                                                            let y = 0 in
                                                            let uLET_0'0 = PRIM_EqInt(i,y) in
                                                            match uLET_0'0 with
                                                            | true1 -> k acc
                                                            | false0 ->
                                                              let y = 10 in
                                                              let c = PRIM_ModInt(i,y) in
                                                              let x = PRIM_AddInt(ord0,c) in
                                                              let x = PRIM_CharChr(x) in
                                                              let uLET_47'9 = fun [x] xs k ->
                                                                let con_0'0 = Cons1[x,xs] in
                                                                k con_0'0 in
                                                              let k [loop,i] app_88'40 =
                                                                let k [i] app_88'11 =
                                                                  let y = 10 in
                                                                  let uLET_0'0 = PRIM_DivInt(i,y) in
                                                                  app_88'11 uLET_0'0 k in
                                                                loop app_88'40 k in
                                                              uLET_47'9 acc k in
                                                          k lam_86'19) in
                                                        let y = 0 in
                                                        let uLET_0'0 = PRIM_EqInt(n,y) in
                                                        let k [put_char,put_chars,res] uLET_84'6 =
                                                          let k [put_char,put_chars,res] _ =
                                                            let s = " --> " in
                                                            let prim_0'0 = PRIM_Explode(s) in
                                                            let k [put_char,put_chars,res] _ =
                                                              let x = '0' in
                                                              let ord0 = PRIM_CharOrd(x) in
                                                              let loop = fix (fun [ord0] loop acc k ->
                                                                let lam_86'19 = fun [ord0,acc,loop] i k ->
                                                                  let y = 0 in
                                                                  let uLET_0'0 = PRIM_EqInt(i,y) in
                                                                  match uLET_0'0 with
                                                                  | true1 -> k acc
                                                                  | false0 ->
                                                                    let y = 10 in
                                                                    let c = PRIM_ModInt(i,y) in
                                                                    let x = PRIM_AddInt(ord0,c) in
                                                                    let x = PRIM_CharChr(x) in
                                                                    let uLET_47'9 = fun [x] xs k ->
                                                                      let con_0'0 = Cons1[x,xs] in
                                                                      k con_0'0 in
                                                                    let k [loop,i] app_88'40 =
                                                                      let k [i] app_88'11 =
                                                                        let y = 10 in
                                                                        let uLET_0'0 = PRIM_DivInt(i,y) in
                                                                        app_88'11 uLET_0'0 k in
                                                                      loop app_88'40 k in
                                                                    uLET_47'9 acc k in
                                                                k lam_86'19) in
                                                              let y = 0 in
                                                              let uLET_0'0 = PRIM_EqInt(res,y) in
                                                              let k [put_char,put_chars] uLET_84'6 =
                                                                let k [put_char] _ =
                                                                  let _ = Unit0 in
                                                                  let lit_101'26 = '\n' in
                                                                  put_char lit_101'26 k in
                                                                put_chars uLET_84'6 k in
                                                              match uLET_0'0 with
                                                              | true1 ->
                                                                let x = '0' in
                                                                let uLET_47'9 = fun [x] xs k ->
                                                                  let con_0'0 = Cons1[x,xs] in
                                                                  k con_0'0 in
                                                                let con_90'25 = Nil0 in
                                                                uLET_47'9 con_90'25 k
                                                              | false0 ->
                                                                let con_90'38 = Nil0 in
                                                                let k [res] app_90'38 = app_90'38 res k in
                                                                loop con_90'38 k in
                                                            put_chars prim_0'0 k in
                                                          put_chars uLET_84'6 k in
                                                        match uLET_0'0 with
                                                        | true1 ->
                                                          let x = '0' in
                                                          let uLET_47'9 = fun [x] xs k ->
                                                            let con_0'0 = Cons1[x,xs] in
                                                            k con_0'0 in
                                                          let con_90'25 = Nil0 in
                                                          uLET_47'9 con_90'25 k
                                                        | false0 ->
                                                          let con_90'38 = Nil0 in
                                                          let k [n] app_90'38 = app_90'38 n k in
                                                          loop con_90'38 k in
                                                      fact n k in
                                                  app_45'7 arg1 k in
                                                loop lit_45'7 k in
                                          put_chars prim_0'0 k
                                        | false0 ->
                                          let x = "rev" in
                                          let b = PRIM_Explode(x) in
                                          let lam_0'0 = fun [] x k ->
                                            let lam_0'0 = fun [x] y k ->
                                              let prim_0'0 = PRIM_EqChar(x,y) in
                                              k prim_0'0 in
                                            k lam_0'0 in
                                          let k [put_char,eq_list,append,map,length,put_chars,single_controlD,xs,command,args,b] app_58'31 =
                                            let k [put_char,eq_list,append,map,length,put_chars,single_controlD,xs,args,b] app_58'39 =
                                              let k [put_char,eq_list,append,map,length,put_chars,single_controlD,xs,args] uLET_58'19 =
                                                match uLET_58'19 with
                                                | true1 ->
                                                  match args with
                                                  | Cons1(_,_) ->
                                                    let s = "rev: expected no arguments" in
                                                    let s = "ERROR: " in
                                                    let prim_0'0 = PRIM_Explode(s) in
                                                    let k [put_char,put_chars,s] _ =
                                                      let prim_0'0 = PRIM_Explode(s) in
                                                      let k [put_char] _ =
                                                        let _ = Unit0 in
                                                        let lit_101'26 = '\n' in
                                                        put_char lit_101'26 k in
                                                      put_chars prim_0'0 k in
                                                    put_chars prim_0'0 k
                                                  | Nil0 ->
                                                    let s = "(reverse typed lines until ^D)\n" in
                                                    let prim_0'0 = PRIM_Explode(s) in
                                                    let k [put_char,eq_list,put_chars,single_controlD] _ =
                                                      let _ = Unit0 in
                                                      let loop = fix (fun [put_char,eq_list,put_chars,single_controlD] loop _ k ->
                                                        let _ = Unit0 in
                                                        let x = 4 in
                                                        let controlD = PRIM_CharChr(x) in
                                                        let loop = fix (fun [put_char,controlD] loop acc k ->
                                                          let x = Unit0 in
                                                          let c = PRIM_GetChar(x) in
                                                          let n = PRIM_CharOrd(c) in
                                                          let y = '\n' in
                                                          let uLET_0'0 = PRIM_EqChar(c,y) in
                                                          match uLET_0'0 with
                                                          | true1 ->
                                                            let _ = Unit0 in
                                                            let lit_101'26 = '\n' in
                                                            let k [acc] _ =
                                                              let loop = fix (fun [] loop acc k ->
                                                                let lam_66'19 = fun [acc,loop] xs k ->
                                                                  match xs with
                                                                  | Nil0 -> k acc
                                                                  | Cons1(x,xs) ->
                                                                    let con_0'0 = Cons1[x,acc] in
                                                                    let k [xs] app_69'20 = app_69'20 xs k in
                                                                    loop con_0'0 k in
                                                                k lam_66'19) in
                                                              let con_71'7 = Nil0 in
                                                              let k [acc] app_71'7 = app_71'7 acc k in
                                                              loop con_71'7 k in
                                                            put_char lit_101'26 k
                                                          | false0 ->
                                                            let prim_0'0 = PRIM_EqChar(c,controlD) in
                                                            match prim_0'0 with
                                                            | true1 ->
                                                              let k [put_char,controlD,acc] _ =
                                                                let _ = Unit0 in
                                                                let lit_101'26 = '\n' in
                                                                let k [controlD,acc] _ =
                                                                  let xs = Cons1[controlD,acc] in
                                                                  let loop = fix (fun [] loop acc k ->
                                                                    let lam_66'19 = fun [acc,loop] xs k ->
                                                                      match xs with
                                                                      | Nil0 -> k acc
                                                                      | Cons1(x,xs) ->
                                                                        let con_0'0 = Cons1[x,acc] in
                                                                        let k [xs] app_69'20 = app_69'20 xs k in
                                                                        loop con_0'0 k in
                                                                    k lam_66'19) in
                                                                  let con_71'7 = Nil0 in
                                                                  let k [xs] app_71'7 = app_71'7 xs k in
                                                                  loop con_71'7 k in
                                                                put_char lit_101'26 k in
                                                              put_char c k
                                                            | false0 ->
                                                              let b = 127 in
                                                              let uLET_9'10 = PRIM_LessInt(b,n) in
                                                              match uLET_9'10 with
                                                              | true1 -> loop acc k
                                                              | false0 ->
                                                                let y = 127 in
                                                                let uLET_0'0 = PRIM_EqInt(n,y) in
                                                                match uLET_0'0 with
                                                                | true1 ->
                                                                  match acc with
                                                                  | Nil0 -> loop acc k
                                                                  | Cons1(c,tail) ->
                                                                    let a = PRIM_CharOrd(c) in
                                                                    let uLET_10'9 = fun [a] b k ->
                                                                      let b = PRIM_LessInt(b,a) in
                                                                      match b with
                                                                      | true1 ->
                                                                        let con_6'12 = false0 in
                                                                        k con_6'12
                                                                      | false0 ->
                                                                        let con_7'13 = true1 in
                                                                        k con_7'13 in
                                                                    let lit_115'28 = 26 in
                                                                    let k [put_char,loop,tail] app_115'28 =
                                                                      let k [put_char,loop,tail] _ =
                                                                        let _ = Unit0 in
                                                                        let x = 8 in
                                                                        let backspace = PRIM_CharChr(x) in
                                                                        let k [put_char,loop,tail,backspace] _ =
                                                                          let lit_26'11 = ' ' in
                                                                          let k [put_char,loop,tail,backspace] _ =
                                                                            let k [loop,tail] _ = loop tail k in
                                                                            put_char backspace k in
                                                                          put_char lit_26'11 k in
                                                                        put_char backspace k in
                                                                      match app_115'28 with
                                                                      | true1 ->
                                                                        let _ = Unit0 in
                                                                        let x = 8 in
                                                                        let backspace = PRIM_CharChr(x) in
                                                                        let k [put_char,backspace] _ =
                                                                          let lit_26'11 = ' ' in
                                                                          let k [put_char,backspace] _ = put_char backspace k in
                                                                          put_char lit_26'11 k in
                                                                        put_char backspace k
                                                                      | false0 ->
                                                                        let con_115'55 = Unit0 in
                                                                        k con_115'55 in
                                                                    uLET_10'9 lit_115'28 k
                                                                | false0 ->
                                                                  let k [acc,loop,c] _ =
                                                                    let con_0'0 = Cons1[c,acc] in
                                                                    loop con_0'0 k in
                                                                  put_char c k) in
                                                        let con_121'7 = Nil0 in
                                                        let k [put_char,eq_list,put_chars,single_controlD,loop] xs =
                                                          let lam_0'0 = fun [] x k ->
                                                            let lam_0'0 = fun [x] y k ->
                                                              let prim_0'0 = PRIM_EqChar(x,y) in
                                                              k prim_0'0 in
                                                            k lam_0'0 in
                                                          let k [put_char,put_chars,single_controlD,loop,xs] app_58'31 =
                                                            let k [put_char,put_chars,single_controlD,loop,xs] app_58'39 =
                                                              let k [put_char,put_chars,loop,xs] app_58'41 =
                                                                match app_58'41 with
                                                                | true1 ->
                                                                  let con_173'44 = Unit0 in
                                                                  k con_173'44
                                                                | false0 ->
                                                                  let loop = fix (fun [] loop acc k ->
                                                                    let lam_66'19 = fun [acc,loop] xs k ->
                                                                      match xs with
                                                                      | Nil0 -> k acc
                                                                      | Cons1(x,xs) ->
                                                                        let con_0'0 = Cons1[x,acc] in
                                                                        let k [xs] app_69'20 = app_69'20 xs k in
                                                                        loop con_0'0 k in
                                                                    k lam_66'19) in
                                                                  let con_71'7 = Nil0 in
                                                                  let k [put_char,put_chars,loop,xs] app_71'7 =
                                                                    let k [put_char,put_chars,loop] uLET_66'10 =
                                                                      let k [put_char,loop] _ =
                                                                        let _ = Unit0 in
                                                                        let lit_101'26 = '\n' in
                                                                        let k [loop] _ =
                                                                          let con_174'46 = Unit0 in
                                                                          loop con_174'46 k in
                                                                        put_char lit_101'26 k in
                                                                      put_chars uLET_66'10 k in
                                                                    app_71'7 xs k in
                                                                  loop con_71'7 k in
                                                              app_58'39 single_controlD k in
                                                            app_58'31 xs k in
                                                          eq_list lam_0'0 k in
                                                        loop con_121'7 k) in
                                                      let con_176'6 = Unit0 in
                                                      loop con_176'6 k in
                                                    put_chars prim_0'0 k
                                                | false0 ->
                                                  let lam_186'30 = fun [] c k ->
                                                    let y = 'o' in
                                                    let uLET_0'0 = PRIM_EqChar(c,y) in
                                                    match uLET_0'0 with
                                                    | true1 ->
                                                      let lit_186'57 = '*' in
                                                      k lit_186'57
                                                    | false0 -> k c in
                                                  let k [put_char,append,length,put_chars,xs] star_the_ohs =
                                                    let k [put_char,append,put_chars,xs,star_the_ohs] n =
                                                      let x = "You wrote: \"" in
                                                      let uLET_0'0 = PRIM_Explode(x) in
                                                      let k [put_char,put_chars,xs,star_the_ohs,n] app_188'20 =
                                                        let k [put_char,put_chars,app_188'20,n] app_188'60 =
                                                          let k [put_char,put_chars,n] app_188'46 =
                                                            let k [put_char,put_chars,n] _ =
                                                              let s = "\" (" in
                                                              let prim_0'0 = PRIM_Explode(s) in
                                                              let k [put_char,put_chars,n] _ =
                                                                let x = '0' in
                                                                let ord0 = PRIM_CharOrd(x) in
                                                                let loop = fix (fun [ord0] loop acc k ->
                                                                  let lam_86'19 = fun [ord0,acc,loop] i k ->
                                                                    let y = 0 in
                                                                    let uLET_0'0 = PRIM_EqInt(i,y) in
                                                                    match uLET_0'0 with
                                                                    | true1 -> k acc
                                                                    | false0 ->
                                                                      let y = 10 in
                                                                      let c = PRIM_ModInt(i,y) in
                                                                      let x = PRIM_AddInt(ord0,c) in
                                                                      let x = PRIM_CharChr(x) in
                                                                      let uLET_47'9 = fun [x] xs k ->
                                                                        let con_0'0 = Cons1[x,xs] in
                                                                        k con_0'0 in
                                                                      let k [loop,i] app_88'40 =
                                                                        let k [i] app_88'11 =
                                                                          let y = 10 in
                                                                          let uLET_0'0 = PRIM_DivInt(i,y) in
                                                                          app_88'11 uLET_0'0 k in
                                                                        loop app_88'40 k in
                                                                      uLET_47'9 acc k in
                                                                  k lam_86'19) in
                                                                let y = 0 in
                                                                let uLET_0'0 = PRIM_EqInt(n,y) in
                                                                let k [put_char,put_chars] uLET_84'6 =
                                                                  let k [put_char,put_chars] _ =
                                                                    let s = " chars)" in
                                                                    let prim_0'0 = PRIM_Explode(s) in
                                                                    let k [put_char] _ =
                                                                      let _ = Unit0 in
                                                                      let lit_101'26 = '\n' in
                                                                      put_char lit_101'26 k in
                                                                    put_chars prim_0'0 k in
                                                                  put_chars uLET_84'6 k in
                                                                match uLET_0'0 with
                                                                | true1 ->
                                                                  let x = '0' in
                                                                  let uLET_47'9 = fun [x] xs k ->
                                                                    let con_0'0 = Cons1[x,xs] in
                                                                    k con_0'0 in
                                                                  let con_90'25 = Nil0 in
                                                                  uLET_47'9 con_90'25 k
                                                                | false0 ->
                                                                  let con_90'38 = Nil0 in
                                                                  let k [n] app_90'38 = app_90'38 n k in
                                                                  loop con_90'38 k in
                                                              put_chars prim_0'0 k in
                                                            put_chars app_188'46 k in
                                                          app_188'20 app_188'60 k in
                                                        star_the_ohs xs k in
                                                      append uLET_0'0 k in
                                                    length xs k in
                                                  map lam_186'30 k in
                                              app_58'39 b k in
                                            app_58'31 command k in
                                          eq_list lam_0'0 k in
                                      app_58'39 b k in
                                    app_58'31 command k in
                                  eq_list lam_0'0 k in
                              app_58'39 b k in
                            app_58'31 command k in
                          eq_list lam_0'0 k in
                      app_203'10 xs k in
                    app_203'7 con_203'10 k in
                  loop con_203'7 k in
              app_58'39 single_controlD k in
            app_58'31 xs k in
          eq_list lam_0'0 k in
        loop con_121'7 k in
      put_chars con_216'13 k) in
    let _ = Unit0 in
    let s = "This is a shell prototype. Try: fib, fact, rev\n" in
    let prim_0'0 = PRIM_Explode(s) in
    let k [mainloop] _ =
      let con_223'11 = Unit0 in
      mainloop con_223'11 k in
    put_chars prim_0'0 k in
  uLET_0'0 con_168'31 k in
noinline lam_14'29 k
