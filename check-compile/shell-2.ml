(*stage2*)
let k () = ()
let eq_list = fix (fun [] eq_list eq k ->
  let lam_49'19 = fun [eq,eq_list] xs k ->
    let lam_49'22 = fun [eq,eq_list,xs] ys k ->
      match xs with
      | Nil0 ->
        match ys with
        | Nil0 ->
          let con_51'33 = CID1 in
          k con_51'33
        | Cons1(_,_) ->
          let con_51'48 = CID0 in
          k con_51'48
      | Cons1(x,xs) ->
        match ys with
        | Nil0 ->
          let con_54'13 = CID0 in
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
                let con_56'45 = CID0 in
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
          let con_0'0 = CID1[x,xs] in
          k con_0'0 in
        app_63'28 ys k in
      append xs k in
  k lam_60'18) in
let map = fix (fun [] map f k ->
  let lam_73'14 = fun [f,map] xs k ->
    match xs with
    | Nil0 ->
      let con_75'10 = CID0 in
      k con_75'10
    | Cons1(x,xs) ->
      let k [f,map,xs] x =
        let k [xs,x] app_76'24 =
          let k [x] y =
            let con_0'0 = CID1[x,y] in
            k con_0'0 in
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
    let k [] y =
      let lit_81'17 = 1 in
      let prim_0'0 = PRIM_AddInt(lit_81'17,y) in
      k prim_0'0 in
    length xs k) in
let put_chars = fix (fun [] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_94'10 = CID0 in
    k con_94'10
  | Cons1(x,xs) ->
    let n = PRIM_CharOrd(x) in
    let lit_15'18 = 8 in
    let prim_0'0 = PRIM_EqInt(n,lit_15'18) in
    let k [put_chars,xs] _ = put_chars xs k in
    match prim_0'0 with
    | true1 ->
      let prim_0'0 = PRIM_PutChar(x) in
      k prim_0'0
    | false0 ->
      let lit_18'17 = '\n' in
      let prim_0'0 = PRIM_EqChar(x,lit_18'17) in
      match prim_0'0 with
      | true1 ->
        let prim_0'0 = PRIM_PutChar(x) in
        k prim_0'0
      | false0 ->
        let lit_19'13 = 26 in
        let prim_0'0 = PRIM_LessInt(lit_19'13,n) in
        match prim_0'0 with
        | true1 ->
          let prim_0'0 = PRIM_PutChar(x) in
          k prim_0'0
        | false0 ->
          let lit_20'18 = '^' in
          let _ = PRIM_PutChar(lit_20'18) in
          let lit_0'0 = 65 in
          let x = PRIM_AddInt(lit_0'0,n) in
          let lit_20'52 = 1 in
          let x = PRIM_SubInt(x,lit_20'52) in
          let x = PRIM_CharChr(x) in
          let prim_0'0 = PRIM_PutChar(x) in
          k prim_0'0) in
let fib = fix (fun [] fib n k ->
  let lit_125'9 = 2 in
  let prim_0'0 = PRIM_LessInt(n,lit_125'9) in
  match prim_0'0 with
  | true1 -> k n
  | false0 ->
    let lit_125'30 = 1 in
    let prim_0'0 = PRIM_SubInt(n,lit_125'30) in
    let k [n,fib] x =
      let lit_125'42 = 2 in
      let prim_0'0 = PRIM_SubInt(n,lit_125'42) in
      let k [x] y =
        let prim_0'0 = PRIM_AddInt(x,y) in
        k prim_0'0 in
      fib prim_0'0 k in
    fib prim_0'0 k) in
let fact = fix (fun [] fact n k ->
  let lit_129'10 = 2 in
  let b = PRIM_LessInt(n,lit_129'10) in
  let k [n,fact] case_5'2 =
    match case_5'2 with
    | true1 ->
      let lit_129'25 = 1 in
      let prim_0'0 = PRIM_SubInt(n,lit_129'25) in
      let k [n] x =
        let prim_0'0 = PRIM_MulInt(x,n) in
        k prim_0'0 in
      fact prim_0'0 k
    | false0 ->
      let lit_129'37 = 1 in
      k lit_129'37 in
  match b with
  | true1 ->
    let con_6'12 = CID0 in
    k con_6'12
  | false0 ->
    let con_7'13 = CID1 in
    k con_7'13) in
let mainloop = fix (fun [eq_list,append,map,length,put_chars,fib,fact] mainloop _ k ->
  let lit_216'13 = '>' in
  let lit_216'17 = ' ' in
  let con_216'20 = CID0 in
  let con_216'17 = CID1[lit_216'17,con_216'20] in
  let con_216'13 = CID1[lit_216'13,con_216'17] in
  let k [eq_list,append,map,length,put_chars,fib,fact,mainloop] _ =
    let loop = fix (fun [] loop acc k ->
      let con_106'21 = CID0 in
      let c = PRIM_GetChar(con_106'21) in
      let n = PRIM_CharOrd(c) in
      let lit_108'17 = '\n' in
      let prim_0'0 = PRIM_EqChar(c,lit_108'17) in
      match prim_0'0 with
      | true1 ->
        let lit_101'26 = '\n' in
        let _ = PRIM_PutChar(lit_101'26) in
        let loop = fix (fun [] loop acc k ->
          let lam_66'19 = fun [acc,loop] xs k ->
            match xs with
            | Nil0 -> k acc
            | Cons1(x,xs) ->
              let con_0'0 = CID1[x,acc] in
              let k [xs] app_69'20 = app_69'20 xs k in
              loop con_0'0 k in
          k lam_66'19) in
        let con_71'7 = CID0 in
        let k [acc] app_71'7 = app_71'7 acc k in
        loop con_71'7 k
      | false0 ->
        let lit_0'0 = '\EOT' in
        let prim_0'0 = PRIM_EqChar(c,lit_0'0) in
        match prim_0'0 with
        | true1 ->
          let n = PRIM_CharOrd(c) in
          let lit_15'18 = 8 in
          let prim_0'0 = PRIM_EqInt(n,lit_15'18) in
          let k [acc] _ =
            let lit_101'26 = '\n' in
            let _ = PRIM_PutChar(lit_101'26) in
            let loop = fix (fun [] loop acc k ->
              let lam_66'19 = fun [acc,loop] xs k ->
                match xs with
                | Nil0 -> k acc
                | Cons1(x,xs) ->
                  let con_0'0 = CID1[x,acc] in
                  let k [xs] app_69'20 = app_69'20 xs k in
                  loop con_0'0 k in
              k lam_66'19) in
            let con_71'7 = CID0 in
            let k [acc] app_71'7 =
              let lit_0'0 = '\EOT' in
              let con_0'0 = CID1[lit_0'0,acc] in
              app_71'7 con_0'0 k in
            loop con_71'7 k in
          match prim_0'0 with
          | true1 ->
            let prim_0'0 = PRIM_PutChar(c) in
            k prim_0'0
          | false0 ->
            let lit_18'17 = '\n' in
            let prim_0'0 = PRIM_EqChar(c,lit_18'17) in
            match prim_0'0 with
            | true1 ->
              let prim_0'0 = PRIM_PutChar(c) in
              k prim_0'0
            | false0 ->
              let lit_19'13 = 26 in
              let prim_0'0 = PRIM_LessInt(lit_19'13,n) in
              match prim_0'0 with
              | true1 ->
                let prim_0'0 = PRIM_PutChar(c) in
                k prim_0'0
              | false0 ->
                let lit_20'18 = '^' in
                let _ = PRIM_PutChar(lit_20'18) in
                let lit_0'0 = 65 in
                let x = PRIM_AddInt(lit_0'0,n) in
                let lit_20'52 = 1 in
                let x = PRIM_SubInt(x,lit_20'52) in
                let x = PRIM_CharChr(x) in
                let prim_0'0 = PRIM_PutChar(x) in
                k prim_0'0
        | false0 ->
          let lit_110'15 = 127 in
          let prim_0'0 = PRIM_LessInt(lit_110'15,n) in
          match prim_0'0 with
          | true1 -> loop acc k
          | false0 ->
            let lit_111'17 = 127 in
            let prim_0'0 = PRIM_EqInt(n,lit_111'17) in
            match prim_0'0 with
            | true1 ->
              match acc with
              | Nil0 -> loop acc k
              | Cons1(c,tail) ->
                let a = PRIM_CharOrd(c) in
                let lit_115'28 = 26 in
                let b = PRIM_LessInt(lit_115'28,a) in
                let k [loop,tail] case_5'2 =
                  let k [loop,tail] _ =
                    let lit_0'0 = '\b' in
                    let _ = PRIM_PutChar(lit_0'0) in
                    let lit_26'11 = ' ' in
                    let _ = PRIM_PutChar(lit_26'11) in
                    let lit_0'0 = '\b' in
                    let _ = PRIM_PutChar(lit_0'0) in
                    loop tail k in
                  match case_5'2 with
                  | true1 ->
                    let lit_0'0 = '\b' in
                    let _ = PRIM_PutChar(lit_0'0) in
                    let lit_26'11 = ' ' in
                    let _ = PRIM_PutChar(lit_26'11) in
                    let lit_0'0 = '\b' in
                    let prim_0'0 = PRIM_PutChar(lit_0'0) in
                    k prim_0'0
                  | false0 ->
                    let con_115'55 = CID0 in
                    k con_115'55 in
                match b with
                | true1 ->
                  let con_6'12 = CID0 in
                  k con_6'12
                | false0 ->
                  let con_7'13 = CID1 in
                  k con_7'13
            | false0 ->
              let n = PRIM_CharOrd(c) in
              let lit_15'18 = 8 in
              let prim_0'0 = PRIM_EqInt(n,lit_15'18) in
              let k [acc,loop,c] _ =
                let con_0'0 = CID1[c,acc] in
                loop con_0'0 k in
              match prim_0'0 with
              | true1 ->
                let prim_0'0 = PRIM_PutChar(c) in
                k prim_0'0
              | false0 ->
                let lit_18'17 = '\n' in
                let prim_0'0 = PRIM_EqChar(c,lit_18'17) in
                match prim_0'0 with
                | true1 ->
                  let prim_0'0 = PRIM_PutChar(c) in
                  k prim_0'0
                | false0 ->
                  let lit_19'13 = 26 in
                  let prim_0'0 = PRIM_LessInt(lit_19'13,n) in
                  match prim_0'0 with
                  | true1 ->
                    let prim_0'0 = PRIM_PutChar(c) in
                    k prim_0'0
                  | false0 ->
                    let lit_20'18 = '^' in
                    let _ = PRIM_PutChar(lit_20'18) in
                    let lit_0'0 = 65 in
                    let x = PRIM_AddInt(lit_0'0,n) in
                    let lit_20'52 = 1 in
                    let x = PRIM_SubInt(x,lit_20'52) in
                    let x = PRIM_CharChr(x) in
                    let prim_0'0 = PRIM_PutChar(x) in
                    k prim_0'0) in
    let con_121'7 = CID0 in
    let k [eq_list,append,map,length,put_chars,fib,fact,mainloop] xs =
      let lam_0'0 = fun [] x k ->
        let lam_0'0 = fun [x] y k ->
          let prim_0'0 = PRIM_EqChar(x,y) in
          k prim_0'0 in
        k lam_0'0 in
      let k [eq_list,append,map,length,put_chars,fib,fact,mainloop,xs] app_58'31 =
        let k [eq_list,append,map,length,put_chars,fib,fact,mainloop,xs] app_58'39 =
          let lit_0'0 = '\EOT' in
          let con_168'31 = CID0 in
          let con_0'0 = CID1[lit_0'0,con_168'31] in
          let k [eq_list,append,map,length,put_chars,fib,fact,mainloop,xs] app_58'41 =
            match app_58'41 with
            | true1 ->
              let con_218'42 = CID0 in
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
                            let con_0'0 = CID1[x,acc] in
                            let k [xs] app_69'20 = app_69'20 xs k in
                            loop con_0'0 k in
                        k lam_66'19) in
                      let con_71'7 = CID0 in
                      let k [accWs,accCs] app_71'7 =
                        let k [accWs] x =
                          let loop = fix (fun [] loop acc k ->
                            let lam_66'19 = fun [acc,loop] xs k ->
                              match xs with
                              | Nil0 -> k acc
                              | Cons1(x,xs) ->
                                let con_0'0 = CID1[x,acc] in
                                let k [xs] app_69'20 = app_69'20 xs k in
                                loop con_0'0 k in
                            k lam_66'19) in
                          let con_71'7 = CID0 in
                          let k [accWs,x] app_71'7 =
                            let con_0'0 = CID1[x,accWs] in
                            app_71'7 con_0'0 k in
                          loop con_71'7 k in
                        app_71'7 accCs k in
                      loop con_71'7 k
                    | Cons1(x,xs) ->
                      let lit_200'20 = ' ' in
                      let prim_0'0 = PRIM_EqChar(x,lit_200'20) in
                      match prim_0'0 with
                      | true1 ->
                        let loop = fix (fun [] loop acc k ->
                          let lam_66'19 = fun [acc,loop] xs k ->
                            match xs with
                            | Nil0 -> k acc
                            | Cons1(x,xs) ->
                              let con_0'0 = CID1[x,acc] in
                              let k [xs] app_69'20 = app_69'20 xs k in
                              loop con_0'0 k in
                          k lam_66'19) in
                        let con_71'7 = CID0 in
                        let k [accWs,loop,accCs,xs] app_71'7 =
                          let k [accWs,loop,xs] x =
                            let con_0'0 = CID1[x,accWs] in
                            let k [xs] app_200'34 =
                              let con_200'59 = CID0 in
                              let k [xs] app_200'59 = app_200'59 xs k in
                              app_200'34 con_200'59 k in
                            loop con_0'0 k in
                          app_71'7 accCs k in
                        loop con_71'7 k
                      | false0 ->
                        let k [accCs,x,xs] app_201'17 =
                          let con_0'0 = CID1[x,accCs] in
                          let k [xs] app_201'23 = app_201'23 xs k in
                          app_201'17 con_0'0 k in
                        loop accWs k in
                  k lam_195'27 in
                k lam_195'21) in
              let con_203'7 = CID0 in
              let k [eq_list,append,map,length,put_chars,fib,fact,mainloop,xs] app_203'7 =
                let con_203'10 = CID0 in
                let k [eq_list,append,map,length,put_chars,fib,fact,mainloop,xs] app_203'10 =
                  let k [eq_list,append,map,length,put_chars,fib,fact,mainloop,xs] words =
                    let k [mainloop] _ =
                      let con_219'26 = CID0 in
                      mainloop con_219'26 k in
                    match words with
                    | Nil0 ->
                      let con_208'10 = CID0 in
                      k con_208'10
                    | Cons1(command,args) ->
                      let lam_0'0 = fun [] x k ->
                        let lam_0'0 = fun [x] y k ->
                          let prim_0'0 = PRIM_EqChar(x,y) in
                          k prim_0'0 in
                        k lam_0'0 in
                      let k [eq_list,append,map,length,put_chars,fib,fact,xs,command,args] app_58'31 =
                        let k [eq_list,append,map,length,put_chars,fib,fact,xs,command,args] app_58'39 =
                          let lit_0'0 = 'f' in
                          let lit_0'0 = 'i' in
                          let lit_0'0 = 'b' in
                          let con_0'0 = CID0 in
                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                          let k [eq_list,append,map,length,put_chars,fib,fact,xs,command,args] app_58'41 =
                            match app_58'41 with
                            | true1 ->
                              let lit_0'0 = 'f' in
                              let lit_0'0 = 'i' in
                              let lit_0'0 = 'b' in
                              let lit_0'0 = ':' in
                              let lit_0'0 = ' ' in
                              let con_0'0 = CID0 in
                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                              let k [put_chars,fib,args] _ =
                                match args with
                                | Nil0 ->
                                  let lit_0'0 = 'E' in
                                  let lit_0'0 = 'R' in
                                  let lit_0'0 = 'R' in
                                  let lit_0'0 = 'O' in
                                  let lit_0'0 = 'R' in
                                  let lit_0'0 = ':' in
                                  let lit_0'0 = ' ' in
                                  let con_0'0 = CID0 in
                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                  let k [put_chars] _ =
                                    let lit_0'0 = 'e' in
                                    let lit_0'0 = 'x' in
                                    let lit_0'0 = 'p' in
                                    let lit_0'0 = 'e' in
                                    let lit_0'0 = 'c' in
                                    let lit_0'0 = 't' in
                                    let lit_0'0 = 'e' in
                                    let lit_0'0 = 'd' in
                                    let lit_0'0 = ' ' in
                                    let lit_0'0 = 'a' in
                                    let lit_0'0 = 'n' in
                                    let lit_0'0 = ' ' in
                                    let lit_0'0 = 'a' in
                                    let lit_0'0 = 'r' in
                                    let lit_0'0 = 'g' in
                                    let lit_0'0 = 'u' in
                                    let lit_0'0 = 'm' in
                                    let lit_0'0 = 'e' in
                                    let lit_0'0 = 'n' in
                                    let lit_0'0 = 't' in
                                    let con_0'0 = CID0 in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let k [] _ =
                                      let lit_101'26 = '\n' in
                                      let prim_0'0 = PRIM_PutChar(lit_101'26) in
                                      k prim_0'0 in
                                    put_chars con_0'0 k in
                                  put_chars con_0'0 k
                                | Cons1(arg1,more) ->
                                  match more with
                                  | Cons1(_,_) ->
                                    let lit_0'0 = 'E' in
                                    let lit_0'0 = 'R' in
                                    let lit_0'0 = 'R' in
                                    let lit_0'0 = 'O' in
                                    let lit_0'0 = 'R' in
                                    let lit_0'0 = ':' in
                                    let lit_0'0 = ' ' in
                                    let con_0'0 = CID0 in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                    let k [put_chars] _ =
                                      let lit_0'0 = 'e' in
                                      let lit_0'0 = 'x' in
                                      let lit_0'0 = 'p' in
                                      let lit_0'0 = 'e' in
                                      let lit_0'0 = 'c' in
                                      let lit_0'0 = 't' in
                                      let lit_0'0 = 'e' in
                                      let lit_0'0 = 'd' in
                                      let lit_0'0 = ' ' in
                                      let lit_0'0 = 'e' in
                                      let lit_0'0 = 'x' in
                                      let lit_0'0 = 'a' in
                                      let lit_0'0 = 'c' in
                                      let lit_0'0 = 't' in
                                      let lit_0'0 = 'l' in
                                      let lit_0'0 = 'y' in
                                      let lit_0'0 = ' ' in
                                      let lit_0'0 = 'o' in
                                      let lit_0'0 = 'n' in
                                      let lit_0'0 = 'e' in
                                      let lit_0'0 = ' ' in
                                      let lit_0'0 = 'a' in
                                      let lit_0'0 = 'r' in
                                      let lit_0'0 = 'g' in
                                      let lit_0'0 = 'u' in
                                      let lit_0'0 = 'm' in
                                      let lit_0'0 = 'e' in
                                      let lit_0'0 = 'n' in
                                      let lit_0'0 = 't' in
                                      let con_0'0 = CID0 in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let k [] _ =
                                        let lit_101'26 = '\n' in
                                        let prim_0'0 = PRIM_PutChar(lit_101'26) in
                                        k prim_0'0 in
                                      put_chars con_0'0 k in
                                    put_chars con_0'0 k
                                  | Nil0 ->
                                    let loop = fix (fun [] loop acc k ->
                                      let lam_37'19 = fun [acc,loop] xs k ->
                                        match xs with
                                        | Nil0 ->
                                          let con_39'12 = CID0[acc] in
                                          k con_39'12
                                        | Cons1(x,xs) ->
                                          let x = PRIM_CharOrd(x) in
                                          let lit_0'0 = 48 in
                                          let n = PRIM_SubInt(x,lit_0'0) in
                                          let lit_34'10 = 0 in
                                          let b = PRIM_LessInt(n,lit_34'10) in
                                          let k [acc,loop,xs,n] case_5'2 =
                                            let k [acc,loop,xs] case_34'2 =
                                              match case_34'2 with
                                              | None1 ->
                                                let con_42'18 = CID1 in
                                                k con_42'18
                                              | Some0(d) ->
                                                let lit_43'26 = 10 in
                                                let x = PRIM_MulInt(lit_43'26,acc) in
                                                let prim_0'0 = PRIM_AddInt(x,d) in
                                                let k [xs] app_43'25 = app_43'25 xs k in
                                                loop prim_0'0 k in
                                            match case_5'2 with
                                            | true1 ->
                                              let lit_34'25 = 9 in
                                              let b = PRIM_LessInt(lit_34'25,n) in
                                              let k [n] case_5'2 =
                                                match case_5'2 with
                                                | true1 ->
                                                  let con_34'32 = CID0[n] in
                                                  k con_34'32
                                                | false0 ->
                                                  let con_34'45 = CID1 in
                                                  k con_34'45 in
                                              match b with
                                              | true1 ->
                                                let con_6'12 = CID0 in
                                                k con_6'12
                                              | false0 ->
                                                let con_7'13 = CID1 in
                                                k con_7'13
                                            | false0 ->
                                              let con_34'55 = CID1 in
                                              k con_34'55 in
                                          match b with
                                          | true1 ->
                                            let con_6'12 = CID0 in
                                            k con_6'12
                                          | false0 ->
                                            let con_7'13 = CID1 in
                                            k con_7'13 in
                                      k lam_37'19) in
                                    let lit_45'7 = 0 in
                                    let k [put_chars,fib,arg1] app_45'7 =
                                      let k [put_chars,fib] app_45'9 =
                                        match app_45'9 with
                                        | None1 ->
                                          let lit_0'0 = 'E' in
                                          let lit_0'0 = 'R' in
                                          let lit_0'0 = 'R' in
                                          let lit_0'0 = 'O' in
                                          let lit_0'0 = 'R' in
                                          let lit_0'0 = ':' in
                                          let lit_0'0 = ' ' in
                                          let con_0'0 = CID0 in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let k [put_chars] _ =
                                            let lit_0'0 = 'e' in
                                            let lit_0'0 = 'x' in
                                            let lit_0'0 = 'p' in
                                            let lit_0'0 = 'e' in
                                            let lit_0'0 = 'c' in
                                            let lit_0'0 = 't' in
                                            let lit_0'0 = 'e' in
                                            let lit_0'0 = 'd' in
                                            let lit_0'0 = ' ' in
                                            let lit_0'0 = 'a' in
                                            let lit_0'0 = 'r' in
                                            let lit_0'0 = 'g' in
                                            let lit_0'0 = '1' in
                                            let lit_0'0 = ' ' in
                                            let lit_0'0 = 't' in
                                            let lit_0'0 = 'o' in
                                            let lit_0'0 = ' ' in
                                            let lit_0'0 = 'b' in
                                            let lit_0'0 = 'e' in
                                            let lit_0'0 = ' ' in
                                            let lit_0'0 = 'n' in
                                            let lit_0'0 = 'u' in
                                            let lit_0'0 = 'm' in
                                            let lit_0'0 = 'e' in
                                            let lit_0'0 = 'r' in
                                            let lit_0'0 = 'i' in
                                            let lit_0'0 = 'c' in
                                            let con_0'0 = CID0 in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let k [] _ =
                                              let lit_101'26 = '\n' in
                                              let prim_0'0 = PRIM_PutChar(lit_101'26) in
                                              k prim_0'0 in
                                            put_chars con_0'0 k in
                                          put_chars con_0'0 k
                                        | Some0(n) ->
                                          let k [put_chars,n] res =
                                            let loop = fix (fun [] loop acc k ->
                                              let lam_86'19 = fun [acc,loop] i k ->
                                                let lit_87'11 = 0 in
                                                let prim_0'0 = PRIM_EqInt(i,lit_87'11) in
                                                match prim_0'0 with
                                                | true1 -> k acc
                                                | false0 ->
                                                  let lit_88'35 = 10 in
                                                  let c = PRIM_ModInt(i,lit_88'35) in
                                                  let lit_0'0 = 48 in
                                                  let x = PRIM_AddInt(lit_0'0,c) in
                                                  let x = PRIM_CharChr(x) in
                                                  let con_0'0 = CID1[x,acc] in
                                                  let k [i] app_88'11 =
                                                    let lit_88'48 = 10 in
                                                    let prim_0'0 = PRIM_DivInt(i,lit_88'48) in
                                                    app_88'11 prim_0'0 k in
                                                  loop con_0'0 k in
                                              k lam_86'19) in
                                            let lit_90'9 = 0 in
                                            let prim_0'0 = PRIM_EqInt(n,lit_90'9) in
                                            let k [put_chars,res] case_90'2 =
                                              let k [put_chars,res] _ =
                                                let lit_0'0 = ' ' in
                                                let lit_0'0 = '-' in
                                                let lit_0'0 = '-' in
                                                let lit_0'0 = '>' in
                                                let lit_0'0 = ' ' in
                                                let con_0'0 = CID0 in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let k [put_chars,res] _ =
                                                  let loop = fix (fun [] loop acc k ->
                                                    let lam_86'19 = fun [acc,loop] i k ->
                                                      let lit_87'11 = 0 in
                                                      let prim_0'0 = PRIM_EqInt(i,lit_87'11) in
                                                      match prim_0'0 with
                                                      | true1 -> k acc
                                                      | false0 ->
                                                        let lit_88'35 = 10 in
                                                        let c = PRIM_ModInt(i,lit_88'35) in
                                                        let lit_0'0 = 48 in
                                                        let x = PRIM_AddInt(lit_0'0,c) in
                                                        let x = PRIM_CharChr(x) in
                                                        let con_0'0 = CID1[x,acc] in
                                                        let k [i] app_88'11 =
                                                          let lit_88'48 = 10 in
                                                          let prim_0'0 = PRIM_DivInt(i,lit_88'48) in
                                                          app_88'11 prim_0'0 k in
                                                        loop con_0'0 k in
                                                    k lam_86'19) in
                                                  let lit_90'9 = 0 in
                                                  let prim_0'0 = PRIM_EqInt(res,lit_90'9) in
                                                  let k [put_chars] case_90'2 =
                                                    let k [] _ =
                                                      let lit_101'26 = '\n' in
                                                      let prim_0'0 = PRIM_PutChar(lit_101'26) in
                                                      k prim_0'0 in
                                                    put_chars case_90'2 k in
                                                  match prim_0'0 with
                                                  | true1 ->
                                                    let lit_90'21 = '0' in
                                                    let con_90'25 = CID0 in
                                                    let con_0'0 = CID1[lit_90'21,con_90'25] in
                                                    k con_0'0
                                                  | false0 ->
                                                    let con_90'38 = CID0 in
                                                    let k [res] app_90'38 = app_90'38 res k in
                                                    loop con_90'38 k in
                                                put_chars con_0'0 k in
                                              put_chars case_90'2 k in
                                            match prim_0'0 with
                                            | true1 ->
                                              let lit_90'21 = '0' in
                                              let con_90'25 = CID0 in
                                              let con_0'0 = CID1[lit_90'21,con_90'25] in
                                              k con_0'0
                                            | false0 ->
                                              let con_90'38 = CID0 in
                                              let k [n] app_90'38 = app_90'38 n k in
                                              loop con_90'38 k in
                                          fib n k in
                                      app_45'7 arg1 k in
                                    loop lit_45'7 k in
                              put_chars con_0'0 k
                            | false0 ->
                              let lam_0'0 = fun [] x k ->
                                let lam_0'0 = fun [x] y k ->
                                  let prim_0'0 = PRIM_EqChar(x,y) in
                                  k prim_0'0 in
                                k lam_0'0 in
                              let k [eq_list,append,map,length,put_chars,fact,xs,command,args] app_58'31 =
                                let k [eq_list,append,map,length,put_chars,fact,xs,command,args] app_58'39 =
                                  let lit_0'0 = 'f' in
                                  let lit_0'0 = 'a' in
                                  let lit_0'0 = 'c' in
                                  let lit_0'0 = 't' in
                                  let con_0'0 = CID0 in
                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                  let k [eq_list,append,map,length,put_chars,fact,xs,command,args] app_58'41 =
                                    match app_58'41 with
                                    | true1 ->
                                      let lit_0'0 = 'f' in
                                      let lit_0'0 = 'a' in
                                      let lit_0'0 = 'c' in
                                      let lit_0'0 = 't' in
                                      let lit_0'0 = ':' in
                                      let lit_0'0 = ' ' in
                                      let con_0'0 = CID0 in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let con_0'0 = CID1[lit_0'0,con_0'0] in
                                      let k [put_chars,fact,args] _ =
                                        match args with
                                        | Nil0 ->
                                          let lit_0'0 = 'E' in
                                          let lit_0'0 = 'R' in
                                          let lit_0'0 = 'R' in
                                          let lit_0'0 = 'O' in
                                          let lit_0'0 = 'R' in
                                          let lit_0'0 = ':' in
                                          let lit_0'0 = ' ' in
                                          let con_0'0 = CID0 in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let k [put_chars] _ =
                                            let lit_0'0 = 'e' in
                                            let lit_0'0 = 'x' in
                                            let lit_0'0 = 'p' in
                                            let lit_0'0 = 'e' in
                                            let lit_0'0 = 'c' in
                                            let lit_0'0 = 't' in
                                            let lit_0'0 = 'e' in
                                            let lit_0'0 = 'd' in
                                            let lit_0'0 = ' ' in
                                            let lit_0'0 = 'a' in
                                            let lit_0'0 = 'n' in
                                            let lit_0'0 = ' ' in
                                            let lit_0'0 = 'a' in
                                            let lit_0'0 = 'r' in
                                            let lit_0'0 = 'g' in
                                            let lit_0'0 = 'u' in
                                            let lit_0'0 = 'm' in
                                            let lit_0'0 = 'e' in
                                            let lit_0'0 = 'n' in
                                            let lit_0'0 = 't' in
                                            let con_0'0 = CID0 in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let k [] _ =
                                              let lit_101'26 = '\n' in
                                              let prim_0'0 = PRIM_PutChar(lit_101'26) in
                                              k prim_0'0 in
                                            put_chars con_0'0 k in
                                          put_chars con_0'0 k
                                        | Cons1(arg1,more) ->
                                          match more with
                                          | Cons1(_,_) ->
                                            let lit_0'0 = 'E' in
                                            let lit_0'0 = 'R' in
                                            let lit_0'0 = 'R' in
                                            let lit_0'0 = 'O' in
                                            let lit_0'0 = 'R' in
                                            let lit_0'0 = ':' in
                                            let lit_0'0 = ' ' in
                                            let con_0'0 = CID0 in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let con_0'0 = CID1[lit_0'0,con_0'0] in
                                            let k [put_chars] _ =
                                              let lit_0'0 = 'e' in
                                              let lit_0'0 = 'x' in
                                              let lit_0'0 = 'p' in
                                              let lit_0'0 = 'e' in
                                              let lit_0'0 = 'c' in
                                              let lit_0'0 = 't' in
                                              let lit_0'0 = 'e' in
                                              let lit_0'0 = 'd' in
                                              let lit_0'0 = ' ' in
                                              let lit_0'0 = 'e' in
                                              let lit_0'0 = 'x' in
                                              let lit_0'0 = 'a' in
                                              let lit_0'0 = 'c' in
                                              let lit_0'0 = 't' in
                                              let lit_0'0 = 'l' in
                                              let lit_0'0 = 'y' in
                                              let lit_0'0 = ' ' in
                                              let lit_0'0 = 'o' in
                                              let lit_0'0 = 'n' in
                                              let lit_0'0 = 'e' in
                                              let lit_0'0 = ' ' in
                                              let lit_0'0 = 'a' in
                                              let lit_0'0 = 'r' in
                                              let lit_0'0 = 'g' in
                                              let lit_0'0 = 'u' in
                                              let lit_0'0 = 'm' in
                                              let lit_0'0 = 'e' in
                                              let lit_0'0 = 'n' in
                                              let lit_0'0 = 't' in
                                              let con_0'0 = CID0 in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let con_0'0 = CID1[lit_0'0,con_0'0] in
                                              let k [] _ =
                                                let lit_101'26 = '\n' in
                                                let prim_0'0 = PRIM_PutChar(lit_101'26) in
                                                k prim_0'0 in
                                              put_chars con_0'0 k in
                                            put_chars con_0'0 k
                                          | Nil0 ->
                                            let loop = fix (fun [] loop acc k ->
                                              let lam_37'19 = fun [acc,loop] xs k ->
                                                match xs with
                                                | Nil0 ->
                                                  let con_39'12 = CID0[acc] in
                                                  k con_39'12
                                                | Cons1(x,xs) ->
                                                  let x = PRIM_CharOrd(x) in
                                                  let lit_0'0 = 48 in
                                                  let n = PRIM_SubInt(x,lit_0'0) in
                                                  let lit_34'10 = 0 in
                                                  let b = PRIM_LessInt(n,lit_34'10) in
                                                  let k [acc,loop,xs,n] case_5'2 =
                                                    let k [acc,loop,xs] case_34'2 =
                                                      match case_34'2 with
                                                      | None1 ->
                                                        let con_42'18 = CID1 in
                                                        k con_42'18
                                                      | Some0(d) ->
                                                        let lit_43'26 = 10 in
                                                        let x = PRIM_MulInt(lit_43'26,acc) in
                                                        let prim_0'0 = PRIM_AddInt(x,d) in
                                                        let k [xs] app_43'25 = app_43'25 xs k in
                                                        loop prim_0'0 k in
                                                    match case_5'2 with
                                                    | true1 ->
                                                      let lit_34'25 = 9 in
                                                      let b = PRIM_LessInt(lit_34'25,n) in
                                                      let k [n] case_5'2 =
                                                        match case_5'2 with
                                                        | true1 ->
                                                          let con_34'32 = CID0[n] in
                                                          k con_34'32
                                                        | false0 ->
                                                          let con_34'45 = CID1 in
                                                          k con_34'45 in
                                                      match b with
                                                      | true1 ->
                                                        let con_6'12 = CID0 in
                                                        k con_6'12
                                                      | false0 ->
                                                        let con_7'13 = CID1 in
                                                        k con_7'13
                                                    | false0 ->
                                                      let con_34'55 = CID1 in
                                                      k con_34'55 in
                                                  match b with
                                                  | true1 ->
                                                    let con_6'12 = CID0 in
                                                    k con_6'12
                                                  | false0 ->
                                                    let con_7'13 = CID1 in
                                                    k con_7'13 in
                                              k lam_37'19) in
                                            let lit_45'7 = 0 in
                                            let k [put_chars,fact,arg1] app_45'7 =
                                              let k [put_chars,fact] app_45'9 =
                                                match app_45'9 with
                                                | None1 ->
                                                  let lit_0'0 = 'E' in
                                                  let lit_0'0 = 'R' in
                                                  let lit_0'0 = 'R' in
                                                  let lit_0'0 = 'O' in
                                                  let lit_0'0 = 'R' in
                                                  let lit_0'0 = ':' in
                                                  let lit_0'0 = ' ' in
                                                  let con_0'0 = CID0 in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let k [put_chars] _ =
                                                    let lit_0'0 = 'e' in
                                                    let lit_0'0 = 'x' in
                                                    let lit_0'0 = 'p' in
                                                    let lit_0'0 = 'e' in
                                                    let lit_0'0 = 'c' in
                                                    let lit_0'0 = 't' in
                                                    let lit_0'0 = 'e' in
                                                    let lit_0'0 = 'd' in
                                                    let lit_0'0 = ' ' in
                                                    let lit_0'0 = 'a' in
                                                    let lit_0'0 = 'r' in
                                                    let lit_0'0 = 'g' in
                                                    let lit_0'0 = '1' in
                                                    let lit_0'0 = ' ' in
                                                    let lit_0'0 = 't' in
                                                    let lit_0'0 = 'o' in
                                                    let lit_0'0 = ' ' in
                                                    let lit_0'0 = 'b' in
                                                    let lit_0'0 = 'e' in
                                                    let lit_0'0 = ' ' in
                                                    let lit_0'0 = 'n' in
                                                    let lit_0'0 = 'u' in
                                                    let lit_0'0 = 'm' in
                                                    let lit_0'0 = 'e' in
                                                    let lit_0'0 = 'r' in
                                                    let lit_0'0 = 'i' in
                                                    let lit_0'0 = 'c' in
                                                    let con_0'0 = CID0 in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                    let k [] _ =
                                                      let lit_101'26 = '\n' in
                                                      let prim_0'0 = PRIM_PutChar(lit_101'26) in
                                                      k prim_0'0 in
                                                    put_chars con_0'0 k in
                                                  put_chars con_0'0 k
                                                | Some0(n) ->
                                                  let k [put_chars,n] res =
                                                    let loop = fix (fun [] loop acc k ->
                                                      let lam_86'19 = fun [acc,loop] i k ->
                                                        let lit_87'11 = 0 in
                                                        let prim_0'0 = PRIM_EqInt(i,lit_87'11) in
                                                        match prim_0'0 with
                                                        | true1 -> k acc
                                                        | false0 ->
                                                          let lit_88'35 = 10 in
                                                          let c = PRIM_ModInt(i,lit_88'35) in
                                                          let lit_0'0 = 48 in
                                                          let x = PRIM_AddInt(lit_0'0,c) in
                                                          let x = PRIM_CharChr(x) in
                                                          let con_0'0 = CID1[x,acc] in
                                                          let k [i] app_88'11 =
                                                            let lit_88'48 = 10 in
                                                            let prim_0'0 = PRIM_DivInt(i,lit_88'48) in
                                                            app_88'11 prim_0'0 k in
                                                          loop con_0'0 k in
                                                      k lam_86'19) in
                                                    let lit_90'9 = 0 in
                                                    let prim_0'0 = PRIM_EqInt(n,lit_90'9) in
                                                    let k [put_chars,res] case_90'2 =
                                                      let k [put_chars,res] _ =
                                                        let lit_0'0 = ' ' in
                                                        let lit_0'0 = '-' in
                                                        let lit_0'0 = '-' in
                                                        let lit_0'0 = '>' in
                                                        let lit_0'0 = ' ' in
                                                        let con_0'0 = CID0 in
                                                        let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                        let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                        let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                        let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                        let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                        let k [put_chars,res] _ =
                                                          let loop = fix (fun [] loop acc k ->
                                                            let lam_86'19 = fun [acc,loop] i k ->
                                                              let lit_87'11 = 0 in
                                                              let prim_0'0 = PRIM_EqInt(i,lit_87'11) in
                                                              match prim_0'0 with
                                                              | true1 -> k acc
                                                              | false0 ->
                                                                let lit_88'35 = 10 in
                                                                let c = PRIM_ModInt(i,lit_88'35) in
                                                                let lit_0'0 = 48 in
                                                                let x = PRIM_AddInt(lit_0'0,c) in
                                                                let x = PRIM_CharChr(x) in
                                                                let con_0'0 = CID1[x,acc] in
                                                                let k [i] app_88'11 =
                                                                  let lit_88'48 = 10 in
                                                                  let prim_0'0 = PRIM_DivInt(i,lit_88'48) in
                                                                  app_88'11 prim_0'0 k in
                                                                loop con_0'0 k in
                                                            k lam_86'19) in
                                                          let lit_90'9 = 0 in
                                                          let prim_0'0 = PRIM_EqInt(res,lit_90'9) in
                                                          let k [put_chars] case_90'2 =
                                                            let k [] _ =
                                                              let lit_101'26 = '\n' in
                                                              let prim_0'0 = PRIM_PutChar(lit_101'26) in
                                                              k prim_0'0 in
                                                            put_chars case_90'2 k in
                                                          match prim_0'0 with
                                                          | true1 ->
                                                            let lit_90'21 = '0' in
                                                            let con_90'25 = CID0 in
                                                            let con_0'0 = CID1[lit_90'21,con_90'25] in
                                                            k con_0'0
                                                          | false0 ->
                                                            let con_90'38 = CID0 in
                                                            let k [res] app_90'38 = app_90'38 res k in
                                                            loop con_90'38 k in
                                                        put_chars con_0'0 k in
                                                      put_chars case_90'2 k in
                                                    match prim_0'0 with
                                                    | true1 ->
                                                      let lit_90'21 = '0' in
                                                      let con_90'25 = CID0 in
                                                      let con_0'0 = CID1[lit_90'21,con_90'25] in
                                                      k con_0'0
                                                    | false0 ->
                                                      let con_90'38 = CID0 in
                                                      let k [n] app_90'38 = app_90'38 n k in
                                                      loop con_90'38 k in
                                                  fact n k in
                                              app_45'7 arg1 k in
                                            loop lit_45'7 k in
                                      put_chars con_0'0 k
                                    | false0 ->
                                      let lam_0'0 = fun [] x k ->
                                        let lam_0'0 = fun [x] y k ->
                                          let prim_0'0 = PRIM_EqChar(x,y) in
                                          k prim_0'0 in
                                        k lam_0'0 in
                                      let k [eq_list,append,map,length,put_chars,xs,command,args] app_58'31 =
                                        let k [eq_list,append,map,length,put_chars,xs,args] app_58'39 =
                                          let lit_0'0 = 'r' in
                                          let lit_0'0 = 'e' in
                                          let lit_0'0 = 'v' in
                                          let con_0'0 = CID0 in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                          let k [eq_list,append,map,length,put_chars,xs,args] app_58'41 =
                                            match app_58'41 with
                                            | true1 ->
                                              match args with
                                              | Cons1(_,_) ->
                                                let lit_0'0 = 'E' in
                                                let lit_0'0 = 'R' in
                                                let lit_0'0 = 'R' in
                                                let lit_0'0 = 'O' in
                                                let lit_0'0 = 'R' in
                                                let lit_0'0 = ':' in
                                                let lit_0'0 = ' ' in
                                                let con_0'0 = CID0 in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let k [put_chars] _ =
                                                  let lit_0'0 = 'r' in
                                                  let lit_0'0 = 'e' in
                                                  let lit_0'0 = 'v' in
                                                  let lit_0'0 = ':' in
                                                  let lit_0'0 = ' ' in
                                                  let lit_0'0 = 'e' in
                                                  let lit_0'0 = 'x' in
                                                  let lit_0'0 = 'p' in
                                                  let lit_0'0 = 'e' in
                                                  let lit_0'0 = 'c' in
                                                  let lit_0'0 = 't' in
                                                  let lit_0'0 = 'e' in
                                                  let lit_0'0 = 'd' in
                                                  let lit_0'0 = ' ' in
                                                  let lit_0'0 = 'n' in
                                                  let lit_0'0 = 'o' in
                                                  let lit_0'0 = ' ' in
                                                  let lit_0'0 = 'a' in
                                                  let lit_0'0 = 'r' in
                                                  let lit_0'0 = 'g' in
                                                  let lit_0'0 = 'u' in
                                                  let lit_0'0 = 'm' in
                                                  let lit_0'0 = 'e' in
                                                  let lit_0'0 = 'n' in
                                                  let lit_0'0 = 't' in
                                                  let lit_0'0 = 's' in
                                                  let con_0'0 = CID0 in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let k [] _ =
                                                    let lit_101'26 = '\n' in
                                                    let prim_0'0 = PRIM_PutChar(lit_101'26) in
                                                    k prim_0'0 in
                                                  put_chars con_0'0 k in
                                                put_chars con_0'0 k
                                              | Nil0 ->
                                                let lit_0'0 = '(' in
                                                let lit_0'0 = 'r' in
                                                let lit_0'0 = 'e' in
                                                let lit_0'0 = 'v' in
                                                let lit_0'0 = 'e' in
                                                let lit_0'0 = 'r' in
                                                let lit_0'0 = 's' in
                                                let lit_0'0 = 'e' in
                                                let lit_0'0 = ' ' in
                                                let lit_0'0 = 't' in
                                                let lit_0'0 = 'y' in
                                                let lit_0'0 = 'p' in
                                                let lit_0'0 = 'e' in
                                                let lit_0'0 = 'd' in
                                                let lit_0'0 = ' ' in
                                                let lit_0'0 = 'l' in
                                                let lit_0'0 = 'i' in
                                                let lit_0'0 = 'n' in
                                                let lit_0'0 = 'e' in
                                                let lit_0'0 = 's' in
                                                let lit_0'0 = ' ' in
                                                let lit_0'0 = 'u' in
                                                let lit_0'0 = 'n' in
                                                let lit_0'0 = 't' in
                                                let lit_0'0 = 'i' in
                                                let lit_0'0 = 'l' in
                                                let lit_0'0 = ' ' in
                                                let lit_0'0 = '^' in
                                                let lit_0'0 = 'D' in
                                                let lit_0'0 = ')' in
                                                let lit_0'0 = '\n' in
                                                let con_0'0 = CID0 in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                let k [eq_list,put_chars] _ =
                                                  let loop = fix (fun [eq_list,put_chars] loop _ k ->
                                                    let loop = fix (fun [] loop acc k ->
                                                      let con_106'21 = CID0 in
                                                      let c = PRIM_GetChar(con_106'21) in
                                                      let n = PRIM_CharOrd(c) in
                                                      let lit_108'17 = '\n' in
                                                      let prim_0'0 = PRIM_EqChar(c,lit_108'17) in
                                                      match prim_0'0 with
                                                      | true1 ->
                                                        let lit_101'26 = '\n' in
                                                        let _ = PRIM_PutChar(lit_101'26) in
                                                        let loop = fix (fun [] loop acc k ->
                                                          let lam_66'19 = fun [acc,loop] xs k ->
                                                            match xs with
                                                            | Nil0 -> k acc
                                                            | Cons1(x,xs) ->
                                                              let con_0'0 = CID1[x,acc] in
                                                              let k [xs] app_69'20 = app_69'20 xs k in
                                                              loop con_0'0 k in
                                                          k lam_66'19) in
                                                        let con_71'7 = CID0 in
                                                        let k [acc] app_71'7 = app_71'7 acc k in
                                                        loop con_71'7 k
                                                      | false0 ->
                                                        let lit_0'0 = '\EOT' in
                                                        let prim_0'0 = PRIM_EqChar(c,lit_0'0) in
                                                        match prim_0'0 with
                                                        | true1 ->
                                                          let n = PRIM_CharOrd(c) in
                                                          let lit_15'18 = 8 in
                                                          let prim_0'0 = PRIM_EqInt(n,lit_15'18) in
                                                          let k [acc] _ =
                                                            let lit_101'26 = '\n' in
                                                            let _ = PRIM_PutChar(lit_101'26) in
                                                            let loop = fix (fun [] loop acc k ->
                                                              let lam_66'19 = fun [acc,loop] xs k ->
                                                                match xs with
                                                                | Nil0 -> k acc
                                                                | Cons1(x,xs) ->
                                                                  let con_0'0 = CID1[x,acc] in
                                                                  let k [xs] app_69'20 = app_69'20 xs k in
                                                                  loop con_0'0 k in
                                                              k lam_66'19) in
                                                            let con_71'7 = CID0 in
                                                            let k [acc] app_71'7 =
                                                              let lit_0'0 = '\EOT' in
                                                              let con_0'0 = CID1[lit_0'0,acc] in
                                                              app_71'7 con_0'0 k in
                                                            loop con_71'7 k in
                                                          match prim_0'0 with
                                                          | true1 ->
                                                            let prim_0'0 = PRIM_PutChar(c) in
                                                            k prim_0'0
                                                          | false0 ->
                                                            let lit_18'17 = '\n' in
                                                            let prim_0'0 = PRIM_EqChar(c,lit_18'17) in
                                                            match prim_0'0 with
                                                            | true1 ->
                                                              let prim_0'0 = PRIM_PutChar(c) in
                                                              k prim_0'0
                                                            | false0 ->
                                                              let lit_19'13 = 26 in
                                                              let prim_0'0 = PRIM_LessInt(lit_19'13,n) in
                                                              match prim_0'0 with
                                                              | true1 ->
                                                                let prim_0'0 = PRIM_PutChar(c) in
                                                                k prim_0'0
                                                              | false0 ->
                                                                let lit_20'18 = '^' in
                                                                let _ = PRIM_PutChar(lit_20'18) in
                                                                let lit_0'0 = 65 in
                                                                let x = PRIM_AddInt(lit_0'0,n) in
                                                                let lit_20'52 = 1 in
                                                                let x = PRIM_SubInt(x,lit_20'52) in
                                                                let x = PRIM_CharChr(x) in
                                                                let prim_0'0 = PRIM_PutChar(x) in
                                                                k prim_0'0
                                                        | false0 ->
                                                          let lit_110'15 = 127 in
                                                          let prim_0'0 = PRIM_LessInt(lit_110'15,n) in
                                                          match prim_0'0 with
                                                          | true1 -> loop acc k
                                                          | false0 ->
                                                            let lit_111'17 = 127 in
                                                            let prim_0'0 = PRIM_EqInt(n,lit_111'17) in
                                                            match prim_0'0 with
                                                            | true1 ->
                                                              match acc with
                                                              | Nil0 -> loop acc k
                                                              | Cons1(c,tail) ->
                                                                let a = PRIM_CharOrd(c) in
                                                                let lit_115'28 = 26 in
                                                                let b = PRIM_LessInt(lit_115'28,a) in
                                                                let k [loop,tail] case_5'2 =
                                                                  let k [loop,tail] _ =
                                                                    let lit_0'0 = '\b' in
                                                                    let _ = PRIM_PutChar(lit_0'0) in
                                                                    let lit_26'11 = ' ' in
                                                                    let _ = PRIM_PutChar(lit_26'11) in
                                                                    let lit_0'0 = '\b' in
                                                                    let _ = PRIM_PutChar(lit_0'0) in
                                                                    loop tail k in
                                                                  match case_5'2 with
                                                                  | true1 ->
                                                                    let lit_0'0 = '\b' in
                                                                    let _ = PRIM_PutChar(lit_0'0) in
                                                                    let lit_26'11 = ' ' in
                                                                    let _ = PRIM_PutChar(lit_26'11) in
                                                                    let lit_0'0 = '\b' in
                                                                    let prim_0'0 = PRIM_PutChar(lit_0'0) in
                                                                    k prim_0'0
                                                                  | false0 ->
                                                                    let con_115'55 = CID0 in
                                                                    k con_115'55 in
                                                                match b with
                                                                | true1 ->
                                                                  let con_6'12 = CID0 in
                                                                  k con_6'12
                                                                | false0 ->
                                                                  let con_7'13 = CID1 in
                                                                  k con_7'13
                                                            | false0 ->
                                                              let n = PRIM_CharOrd(c) in
                                                              let lit_15'18 = 8 in
                                                              let prim_0'0 = PRIM_EqInt(n,lit_15'18) in
                                                              let k [acc,loop,c] _ =
                                                                let con_0'0 = CID1[c,acc] in
                                                                loop con_0'0 k in
                                                              match prim_0'0 with
                                                              | true1 ->
                                                                let prim_0'0 = PRIM_PutChar(c) in
                                                                k prim_0'0
                                                              | false0 ->
                                                                let lit_18'17 = '\n' in
                                                                let prim_0'0 = PRIM_EqChar(c,lit_18'17) in
                                                                match prim_0'0 with
                                                                | true1 ->
                                                                  let prim_0'0 = PRIM_PutChar(c) in
                                                                  k prim_0'0
                                                                | false0 ->
                                                                  let lit_19'13 = 26 in
                                                                  let prim_0'0 = PRIM_LessInt(lit_19'13,n) in
                                                                  match prim_0'0 with
                                                                  | true1 ->
                                                                    let prim_0'0 = PRIM_PutChar(c) in
                                                                    k prim_0'0
                                                                  | false0 ->
                                                                    let lit_20'18 = '^' in
                                                                    let _ = PRIM_PutChar(lit_20'18) in
                                                                    let lit_0'0 = 65 in
                                                                    let x = PRIM_AddInt(lit_0'0,n) in
                                                                    let lit_20'52 = 1 in
                                                                    let x = PRIM_SubInt(x,lit_20'52) in
                                                                    let x = PRIM_CharChr(x) in
                                                                    let prim_0'0 = PRIM_PutChar(x) in
                                                                    k prim_0'0) in
                                                    let con_121'7 = CID0 in
                                                    let k [eq_list,put_chars,loop] xs =
                                                      let lam_0'0 = fun [] x k ->
                                                        let lam_0'0 = fun [x] y k ->
                                                          let prim_0'0 = PRIM_EqChar(x,y) in
                                                          k prim_0'0 in
                                                        k lam_0'0 in
                                                      let k [put_chars,loop,xs] app_58'31 =
                                                        let k [put_chars,loop,xs] app_58'39 =
                                                          let lit_0'0 = '\EOT' in
                                                          let con_168'31 = CID0 in
                                                          let con_0'0 = CID1[lit_0'0,con_168'31] in
                                                          let k [put_chars,loop,xs] app_58'41 =
                                                            match app_58'41 with
                                                            | true1 ->
                                                              let con_173'44 = CID0 in
                                                              k con_173'44
                                                            | false0 ->
                                                              let loop = fix (fun [] loop acc k ->
                                                                let lam_66'19 = fun [acc,loop] xs k ->
                                                                  match xs with
                                                                  | Nil0 -> k acc
                                                                  | Cons1(x,xs) ->
                                                                    let con_0'0 = CID1[x,acc] in
                                                                    let k [xs] app_69'20 = app_69'20 xs k in
                                                                    loop con_0'0 k in
                                                                k lam_66'19) in
                                                              let con_71'7 = CID0 in
                                                              let k [put_chars,loop,xs] app_71'7 =
                                                                let k [put_chars,loop] app_71'10 =
                                                                  let k [loop] _ =
                                                                    let lit_101'26 = '\n' in
                                                                    let _ = PRIM_PutChar(lit_101'26) in
                                                                    let con_174'46 = CID0 in
                                                                    loop con_174'46 k in
                                                                  put_chars app_71'10 k in
                                                                app_71'7 xs k in
                                                              loop con_71'7 k in
                                                          app_58'39 con_0'0 k in
                                                        app_58'31 xs k in
                                                      eq_list lam_0'0 k in
                                                    loop con_121'7 k) in
                                                  let con_176'6 = CID0 in
                                                  loop con_176'6 k in
                                                put_chars con_0'0 k
                                            | false0 ->
                                              let lam_186'30 = fun [] c k ->
                                                let lit_186'48 = 'o' in
                                                let prim_0'0 = PRIM_EqChar(c,lit_186'48) in
                                                match prim_0'0 with
                                                | true1 ->
                                                  let lit_186'57 = '*' in
                                                  k lit_186'57
                                                | false0 -> k c in
                                              let k [append,length,put_chars,xs] star_the_ohs =
                                                let k [append,put_chars,xs,star_the_ohs] n =
                                                  let lit_0'0 = 'Y' in
                                                  let lit_0'0 = 'o' in
                                                  let lit_0'0 = 'u' in
                                                  let lit_0'0 = ' ' in
                                                  let lit_0'0 = 'w' in
                                                  let lit_0'0 = 'r' in
                                                  let lit_0'0 = 'o' in
                                                  let lit_0'0 = 't' in
                                                  let lit_0'0 = 'e' in
                                                  let lit_0'0 = ':' in
                                                  let lit_0'0 = ' ' in
                                                  let lit_0'0 = '"' in
                                                  let con_0'0 = CID0 in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                  let k [put_chars,xs,star_the_ohs,n] app_188'20 =
                                                    let k [put_chars,n,app_188'20] app_188'60 =
                                                      let k [put_chars,n] app_188'46 =
                                                        let k [put_chars,n] _ =
                                                          let lit_0'0 = '"' in
                                                          let lit_0'0 = ' ' in
                                                          let lit_0'0 = '(' in
                                                          let con_0'0 = CID0 in
                                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                          let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                          let k [put_chars,n] _ =
                                                            let loop = fix (fun [] loop acc k ->
                                                              let lam_86'19 = fun [acc,loop] i k ->
                                                                let lit_87'11 = 0 in
                                                                let prim_0'0 = PRIM_EqInt(i,lit_87'11) in
                                                                match prim_0'0 with
                                                                | true1 -> k acc
                                                                | false0 ->
                                                                  let lit_88'35 = 10 in
                                                                  let c = PRIM_ModInt(i,lit_88'35) in
                                                                  let lit_0'0 = 48 in
                                                                  let x = PRIM_AddInt(lit_0'0,c) in
                                                                  let x = PRIM_CharChr(x) in
                                                                  let con_0'0 = CID1[x,acc] in
                                                                  let k [i] app_88'11 =
                                                                    let lit_88'48 = 10 in
                                                                    let prim_0'0 = PRIM_DivInt(i,lit_88'48) in
                                                                    app_88'11 prim_0'0 k in
                                                                  loop con_0'0 k in
                                                              k lam_86'19) in
                                                            let lit_90'9 = 0 in
                                                            let prim_0'0 = PRIM_EqInt(n,lit_90'9) in
                                                            let k [put_chars] case_90'2 =
                                                              let k [put_chars] _ =
                                                                let lit_0'0 = ' ' in
                                                                let lit_0'0 = 'c' in
                                                                let lit_0'0 = 'h' in
                                                                let lit_0'0 = 'a' in
                                                                let lit_0'0 = 'r' in
                                                                let lit_0'0 = 's' in
                                                                let lit_0'0 = ')' in
                                                                let con_0'0 = CID0 in
                                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                                let con_0'0 = CID1[lit_0'0,con_0'0] in
                                                                let k [] _ =
                                                                  let lit_101'26 = '\n' in
                                                                  let prim_0'0 = PRIM_PutChar(lit_101'26) in
                                                                  k prim_0'0 in
                                                                put_chars con_0'0 k in
                                                              put_chars case_90'2 k in
                                                            match prim_0'0 with
                                                            | true1 ->
                                                              let lit_90'21 = '0' in
                                                              let con_90'25 = CID0 in
                                                              let con_0'0 = CID1[lit_90'21,con_90'25] in
                                                              k con_0'0
                                                            | false0 ->
                                                              let con_90'38 = CID0 in
                                                              let k [n] app_90'38 = app_90'38 n k in
                                                              loop con_90'38 k in
                                                          put_chars con_0'0 k in
                                                        put_chars app_188'46 k in
                                                      app_188'20 app_188'60 k in
                                                    star_the_ohs xs k in
                                                  append con_0'0 k in
                                                length xs k in
                                              map lam_186'30 k in
                                          app_58'39 con_0'0 k in
                                        app_58'31 command k in
                                      eq_list lam_0'0 k in
                                  app_58'39 con_0'0 k in
                                app_58'31 command k in
                              eq_list lam_0'0 k in
                          app_58'39 con_0'0 k in
                        app_58'31 command k in
                      eq_list lam_0'0 k in
                  app_203'10 xs k in
                app_203'7 con_203'10 k in
              loop con_203'7 k in
          app_58'39 con_0'0 k in
        app_58'31 xs k in
      eq_list lam_0'0 k in
    loop con_121'7 k in
  put_chars con_216'13 k) in
let lit_0'0 = 'T' in
let lit_0'0 = 'h' in
let lit_0'0 = 'i' in
let lit_0'0 = 's' in
let lit_0'0 = ' ' in
let lit_0'0 = 'i' in
let lit_0'0 = 's' in
let lit_0'0 = ' ' in
let lit_0'0 = 'a' in
let lit_0'0 = ' ' in
let lit_0'0 = 's' in
let lit_0'0 = 'h' in
let lit_0'0 = 'e' in
let lit_0'0 = 'l' in
let lit_0'0 = 'l' in
let lit_0'0 = ' ' in
let lit_0'0 = 'p' in
let lit_0'0 = 'r' in
let lit_0'0 = 'o' in
let lit_0'0 = 't' in
let lit_0'0 = 'o' in
let lit_0'0 = 't' in
let lit_0'0 = 'y' in
let lit_0'0 = 'p' in
let lit_0'0 = 'e' in
let lit_0'0 = '.' in
let lit_0'0 = ' ' in
let lit_0'0 = 'T' in
let lit_0'0 = 'r' in
let lit_0'0 = 'y' in
let lit_0'0 = ':' in
let lit_0'0 = ' ' in
let lit_0'0 = 'f' in
let lit_0'0 = 'i' in
let lit_0'0 = 'b' in
let lit_0'0 = ',' in
let lit_0'0 = ' ' in
let lit_0'0 = 'f' in
let lit_0'0 = 'a' in
let lit_0'0 = 'c' in
let lit_0'0 = 't' in
let lit_0'0 = ',' in
let lit_0'0 = ' ' in
let lit_0'0 = 'r' in
let lit_0'0 = 'e' in
let lit_0'0 = 'v' in
let lit_0'0 = '\n' in
let con_0'0 = CID0 in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let k [mainloop] _ =
  let con_223'11 = CID0 in
  mainloop con_223'11 k in
put_chars con_0'0 k
