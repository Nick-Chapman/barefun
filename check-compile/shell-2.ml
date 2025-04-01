(*stage2*)
let k () = ()
let block = fix (fun [] block f k ->
  let lam_2'31 = fun [f] a k -> f a k in
  k lam_2'31) in
let lam_0'0 = fun [] x k ->
  let prim_0'0 = PRIM_Explode(x) in
  k prim_0'0 in
let k [block] explode =
  let eq_list = fix (fun [] eq_list eq k ->
    let lam_51'19 = fun [eq,eq_list] xs k ->
      let lam_51'22 = fun [eq,eq_list,xs] ys k ->
        match xs with
        | Nil0 ->
          match ys with
          | Nil0 ->
            let con_53'33 = CID1 in
            k con_53'33
          | Cons1(_,_) ->
            let con_53'48 = CID0 in
            k con_53'48
        | Cons1(x,xs) ->
          match ys with
          | Nil0 ->
            let con_56'13 = CID0 in
            k con_56'13
          | Cons1(y,ys) ->
            let k [eq,eq_list,xs,y,ys] app_58'14 =
              let k [eq,eq_list,xs,ys] app_58'16 =
                match app_58'16 with
                | true1 ->
                  let k [xs,ys] app_58'31 =
                    let k [ys] app_58'34 = app_58'34 ys k in
                    app_58'31 xs k in
                  eq_list eq k
                | false0 ->
                  let con_58'45 = CID0 in
                  k con_58'45 in
              app_58'14 y k in
            eq x k in
      k lam_51'22 in
    k lam_51'19) in
  let append = fix (fun [] append xs k ->
    let lam_62'18 = fun [xs,append] ys k ->
      match xs with
      | Nil0 -> k ys
      | Cons1(x,xs) ->
        let k [ys,x] app_65'28 =
          let k [x] xs =
            let con_0'0 = CID1[x,xs] in
            k con_0'0 in
          app_65'28 ys k in
        append xs k in
    k lam_62'18) in
  let revloop = fix (fun [] revloop acc k ->
    let lam_67'20 = fun [acc,revloop] xs k ->
      match xs with
      | Nil0 -> k acc
      | Cons1(x,xs) ->
        let con_0'0 = CID1[x,acc] in
        let k [xs] app_70'21 = app_70'21 xs k in
        revloop con_0'0 k in
    k lam_67'20) in
  let map = fix (fun [] map f k ->
    let lam_74'14 = fun [f,map] xs k ->
      match xs with
      | Nil0 ->
        let con_76'10 = CID0 in
        k con_76'10
      | Cons1(x,xs) ->
        let k [f,map,xs] x =
          let k [xs,x] app_77'24 =
            let k [x] y =
              let con_0'0 = CID1[x,y] in
              k con_0'0 in
            app_77'24 xs k in
          map f k in
        f x k in
    k lam_74'14) in
  let length = fix (fun [] length xs k ->
    match xs with
    | Nil0 ->
      let lit_81'10 = 0 in
      k lit_81'10
    | Cons1(_,xs) ->
      let k [] y =
        let lit_82'17 = 1 in
        let prim_0'0 = PRIM_AddInt(lit_82'17,y) in
        k prim_0'0 in
      length xs k) in
  let put_chars = fix (fun [] put_chars xs k ->
    match xs with
    | Nil0 ->
      let con_95'10 = CID0 in
      k con_95'10
    | Cons1(x,xs) ->
      let n = PRIM_CharOrd(x) in
      let lit_17'18 = 8 in
      let prim_0'0 = PRIM_EqInt(n,lit_17'18) in
      let k [put_chars,xs] _ = put_chars xs k in
      match prim_0'0 with
      | true1 ->
        let prim_0'0 = PRIM_PutChar(x) in
        k prim_0'0
      | false0 ->
        let lit_20'17 = '\n' in
        let prim_0'0 = PRIM_EqChar(x,lit_20'17) in
        match prim_0'0 with
        | true1 ->
          let prim_0'0 = PRIM_PutChar(x) in
          k prim_0'0
        | false0 ->
          let lit_21'13 = 26 in
          let prim_0'0 = PRIM_LessInt(lit_21'13,n) in
          match prim_0'0 with
          | true1 ->
            let prim_0'0 = PRIM_PutChar(x) in
            k prim_0'0
          | false0 ->
            let lit_22'18 = '^' in
            let _ = PRIM_PutChar(lit_22'18) in
            let lit_0'0 = 65 in
            let x = PRIM_AddInt(lit_0'0,n) in
            let lit_22'52 = 1 in
            let x = PRIM_SubInt(x,lit_22'52) in
            let x = PRIM_CharChr(x) in
            let prim_0'0 = PRIM_PutChar(x) in
            k prim_0'0) in
  let readloop = fix (fun [revloop] readloop acc k ->
    let con_105'19 = CID0 in
    let c = PRIM_GetChar(con_105'19) in
    let n = PRIM_CharOrd(c) in
    let lit_108'15 = '\n' in
    let prim_0'0 = PRIM_EqChar(c,lit_108'15) in
    match prim_0'0 with
    | true1 ->
      let lit_102'26 = '\n' in
      let _ = PRIM_PutChar(lit_102'26) in
      let con_72'25 = CID0 in
      let k [acc] app_72'25 = app_72'25 acc k in
      revloop con_72'25 k
    | false0 ->
      let lit_0'0 = '\EOT' in
      let prim_0'0 = PRIM_EqChar(c,lit_0'0) in
      match prim_0'0 with
      | true1 ->
        let n = PRIM_CharOrd(c) in
        let lit_17'18 = 8 in
        let prim_0'0 = PRIM_EqInt(n,lit_17'18) in
        let k [revloop,acc] _ =
          let lit_102'26 = '\n' in
          let _ = PRIM_PutChar(lit_102'26) in
          let con_72'25 = CID0 in
          let k [acc] app_72'25 =
            let lit_0'0 = '\EOT' in
            let con_0'0 = CID1[lit_0'0,acc] in
            app_72'25 con_0'0 k in
          revloop con_72'25 k in
        match prim_0'0 with
        | true1 ->
          let prim_0'0 = PRIM_PutChar(c) in
          k prim_0'0
        | false0 ->
          let lit_20'17 = '\n' in
          let prim_0'0 = PRIM_EqChar(c,lit_20'17) in
          match prim_0'0 with
          | true1 ->
            let prim_0'0 = PRIM_PutChar(c) in
            k prim_0'0
          | false0 ->
            let lit_21'13 = 26 in
            let prim_0'0 = PRIM_LessInt(lit_21'13,n) in
            match prim_0'0 with
            | true1 ->
              let prim_0'0 = PRIM_PutChar(c) in
              k prim_0'0
            | false0 ->
              let lit_22'18 = '^' in
              let _ = PRIM_PutChar(lit_22'18) in
              let lit_0'0 = 65 in
              let x = PRIM_AddInt(lit_0'0,n) in
              let lit_22'52 = 1 in
              let x = PRIM_SubInt(x,lit_22'52) in
              let x = PRIM_CharChr(x) in
              let prim_0'0 = PRIM_PutChar(x) in
              k prim_0'0
      | false0 ->
        let lit_110'13 = 127 in
        let prim_0'0 = PRIM_LessInt(lit_110'13,n) in
        match prim_0'0 with
        | true1 -> readloop acc k
        | false0 ->
          let lit_111'15 = 127 in
          let prim_0'0 = PRIM_EqInt(n,lit_111'15) in
          match prim_0'0 with
          | true1 ->
            match acc with
            | Nil0 -> readloop acc k
            | Cons1(c,tail) ->
              let a = PRIM_CharOrd(c) in
              let lit_115'26 = 26 in
              let b = PRIM_LessInt(lit_115'26,a) in
              let k [readloop,tail] case_7'2 =
                let k [readloop,tail] _ =
                  let lit_0'0 = '\b' in
                  let _ = PRIM_PutChar(lit_0'0) in
                  let lit_28'11 = ' ' in
                  let _ = PRIM_PutChar(lit_28'11) in
                  let lit_0'0 = '\b' in
                  let _ = PRIM_PutChar(lit_0'0) in
                  readloop tail k in
                match case_7'2 with
                | true1 ->
                  let lit_0'0 = '\b' in
                  let _ = PRIM_PutChar(lit_0'0) in
                  let lit_28'11 = ' ' in
                  let _ = PRIM_PutChar(lit_28'11) in
                  let lit_0'0 = '\b' in
                  let prim_0'0 = PRIM_PutChar(lit_0'0) in
                  k prim_0'0
                | false0 ->
                  let con_115'53 = CID0 in
                  k con_115'53 in
              match b with
              | true1 ->
                let con_8'12 = CID0 in
                k con_8'12
              | false0 ->
                let con_9'13 = CID1 in
                k con_9'13
          | false0 ->
            let n = PRIM_CharOrd(c) in
            let lit_17'18 = 8 in
            let prim_0'0 = PRIM_EqInt(n,lit_17'18) in
            let k [acc,readloop,c] _ =
              let con_0'0 = CID1[c,acc] in
              readloop con_0'0 k in
            match prim_0'0 with
            | true1 ->
              let prim_0'0 = PRIM_PutChar(c) in
              k prim_0'0
            | false0 ->
              let lit_20'17 = '\n' in
              let prim_0'0 = PRIM_EqChar(c,lit_20'17) in
              match prim_0'0 with
              | true1 ->
                let prim_0'0 = PRIM_PutChar(c) in
                k prim_0'0
              | false0 ->
                let lit_21'13 = 26 in
                let prim_0'0 = PRIM_LessInt(lit_21'13,n) in
                match prim_0'0 with
                | true1 ->
                  let prim_0'0 = PRIM_PutChar(c) in
                  k prim_0'0
                | false0 ->
                  let lit_22'18 = '^' in
                  let _ = PRIM_PutChar(lit_22'18) in
                  let lit_0'0 = 65 in
                  let x = PRIM_AddInt(lit_0'0,n) in
                  let lit_22'52 = 1 in
                  let x = PRIM_SubInt(x,lit_22'52) in
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
    let k [n,fact] case_7'2 =
      match case_7'2 with
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
      let con_8'12 = CID0 in
      k con_8'12
    | false0 ->
      let con_9'13 = CID1 in
      k con_9'13) in
  let splitloop = fix (fun [revloop] splitloop accWs k ->
    let lam_194'24 = fun [revloop,accWs,splitloop] accCs k ->
      let lam_194'30 = fun [revloop,accWs,splitloop,accCs] xs k ->
        match xs with
        | Nil0 ->
          let con_72'25 = CID0 in
          let k [revloop,accWs,accCs] app_72'25 =
            let k [revloop,accWs] x =
              let con_72'25 = CID0 in
              let k [accWs,x] app_72'25 =
                let con_0'0 = CID1[x,accWs] in
                app_72'25 con_0'0 k in
              revloop con_72'25 k in
            app_72'25 accCs k in
          revloop con_72'25 k
        | Cons1(x,xs) ->
          let lit_199'18 = ' ' in
          let prim_0'0 = PRIM_EqChar(x,lit_199'18) in
          match prim_0'0 with
          | true1 ->
            let con_72'25 = CID0 in
            let k [accWs,splitloop,accCs,xs] app_72'25 =
              let k [accWs,splitloop,xs] x =
                let con_0'0 = CID1[x,accWs] in
                let k [xs] app_199'37 =
                  let con_199'62 = CID0 in
                  let k [xs] app_199'62 = app_199'62 xs k in
                  app_199'37 con_199'62 k in
                splitloop con_0'0 k in
              app_72'25 accCs k in
            revloop con_72'25 k
          | false0 ->
            let k [accCs,x,xs] app_200'20 =
              let con_0'0 = CID1[x,accCs] in
              let k [xs] app_200'26 = app_200'26 xs k in
              app_200'20 con_0'0 k in
            splitloop accWs k in
      k lam_194'30 in
    k lam_194'24) in
  let mainloop = fix (fun [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,splitloop] mainloop _ k ->
    let lit_216'13 = '>' in
    let lit_216'17 = ' ' in
    let con_216'20 = CID0 in
    let con_216'17 = CID1[lit_216'17,con_216'20] in
    let con_216'13 = CID1[lit_216'13,con_216'17] in
    let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,splitloop,mainloop] _ =
      let con_121'28 = CID0 in
      let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,splitloop,mainloop] xs =
        let lam_0'0 = fun [] x k ->
          let lam_0'0 = fun [x] y k ->
            let prim_0'0 = PRIM_EqChar(x,y) in
            k prim_0'0 in
          k lam_0'0 in
        let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,splitloop,mainloop,xs] app_60'33 =
          let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,splitloop,mainloop,xs] app_60'41 =
            let lit_0'0 = '\EOT' in
            let con_168'31 = CID0 in
            let con_0'0 = CID1[lit_0'0,con_168'31] in
            let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,splitloop,mainloop,xs] app_60'44 =
              match app_60'44 with
              | true1 ->
                let con_218'42 = CID0 in
                k con_218'42
              | false0 ->
                let con_203'12 = CID0 in
                let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,mainloop,xs] app_203'12 =
                  let con_203'15 = CID0 in
                  let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,mainloop,xs] app_203'15 =
                    let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,mainloop,xs] words =
                      let k [mainloop] _ =
                        let con_219'26 = CID0 in
                        mainloop con_219'26 k in
                      match words with
                      | Nil0 ->
                        let con_208'10 = CID0 in
                        k con_208'10
                      | Cons1(command,args) ->
                        let lit_210'38 = "fib" in
                        let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,xs,command,args] ys =
                          let lam_0'0 = fun [] x k ->
                            let lam_0'0 = fun [x] y k ->
                              let prim_0'0 = PRIM_EqChar(x,y) in
                              k prim_0'0 in
                            k lam_0'0 in
                          let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,xs,command,args,ys] app_60'33 =
                            let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,xs,command,args,ys] app_60'41 =
                              let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fib,fact,xs,command,args] app_60'44 =
                                match app_60'44 with
                                | true1 ->
                                  let lam_98'33 = fun [explode,put_chars] s k ->
                                    let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                    explode s k in
                                  let k [block,explode,put_chars,fib,args] app_98'28 =
                                    let lit_134'13 = "fib: " in
                                    let k [block,explode,put_chars,fib,args] _ =
                                      match args with
                                      | Nil0 ->
                                        let lam_98'33 = fun [explode,put_chars] s k ->
                                          let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                          explode s k in
                                        let k [block,explode,put_chars] app_98'28 =
                                          let lit_131'25 = "ERROR: " in
                                          let k [block,explode,put_chars] _ =
                                            let lam_98'33 = fun [explode,put_chars] s k ->
                                              let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                              explode s k in
                                            let k [] app_98'28 =
                                              let lit_136'16 = "expected an argument" in
                                              let k [] _ =
                                                let lit_102'26 = '\n' in
                                                let prim_0'0 = PRIM_PutChar(lit_102'26) in
                                                k prim_0'0 in
                                              app_98'28 lit_136'16 k in
                                            block lam_98'33 k in
                                          app_98'28 lit_131'25 k in
                                        block lam_98'33 k
                                      | Cons1(arg1,more) ->
                                        match more with
                                        | Cons1(_,_) ->
                                          let lam_98'33 = fun [explode,put_chars] s k ->
                                            let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                            explode s k in
                                          let k [block,explode,put_chars] app_98'28 =
                                            let lit_131'25 = "ERROR: " in
                                            let k [block,explode,put_chars] _ =
                                              let lam_98'33 = fun [explode,put_chars] s k ->
                                                let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                explode s k in
                                              let k [] app_98'28 =
                                                let lit_139'21 = "expected exactly one argument" in
                                                let k [] _ =
                                                  let lit_102'26 = '\n' in
                                                  let prim_0'0 = PRIM_PutChar(lit_102'26) in
                                                  k prim_0'0 in
                                                app_98'28 lit_139'21 k in
                                              block lam_98'33 k in
                                            app_98'28 lit_131'25 k in
                                          block lam_98'33 k
                                        | Nil0 ->
                                          let loop = fix (fun [] loop acc k ->
                                            let lam_39'19 = fun [acc,loop] xs k ->
                                              match xs with
                                              | Nil0 ->
                                                let con_41'12 = CID0[acc] in
                                                k con_41'12
                                              | Cons1(x,xs) ->
                                                let x = PRIM_CharOrd(x) in
                                                let lit_0'0 = 48 in
                                                let n = PRIM_SubInt(x,lit_0'0) in
                                                let lit_36'10 = 0 in
                                                let b = PRIM_LessInt(n,lit_36'10) in
                                                let k [acc,loop,xs,n] case_7'2 =
                                                  let k [acc,loop,xs] case_36'2 =
                                                    match case_36'2 with
                                                    | None1 ->
                                                      let con_44'18 = CID1 in
                                                      k con_44'18
                                                    | Some0(d) ->
                                                      let lit_45'26 = 10 in
                                                      let x = PRIM_MulInt(lit_45'26,acc) in
                                                      let prim_0'0 = PRIM_AddInt(x,d) in
                                                      let k [xs] app_45'25 = app_45'25 xs k in
                                                      loop prim_0'0 k in
                                                  match case_7'2 with
                                                  | true1 ->
                                                    let lit_36'25 = 9 in
                                                    let b = PRIM_LessInt(lit_36'25,n) in
                                                    let k [n] case_7'2 =
                                                      match case_7'2 with
                                                      | true1 ->
                                                        let con_36'32 = CID0[n] in
                                                        k con_36'32
                                                      | false0 ->
                                                        let con_36'45 = CID1 in
                                                        k con_36'45 in
                                                    match b with
                                                    | true1 ->
                                                      let con_8'12 = CID0 in
                                                      k con_8'12
                                                    | false0 ->
                                                      let con_9'13 = CID1 in
                                                      k con_9'13
                                                  | false0 ->
                                                    let con_36'55 = CID1 in
                                                    k con_36'55 in
                                                match b with
                                                | true1 ->
                                                  let con_8'12 = CID0 in
                                                  k con_8'12
                                                | false0 ->
                                                  let con_9'13 = CID1 in
                                                  k con_9'13 in
                                            k lam_39'19) in
                                          let lit_47'7 = 0 in
                                          let k [block,explode,put_chars,fib,arg1] app_47'7 =
                                            let k [block,explode,put_chars,fib] app_47'9 =
                                              match app_47'9 with
                                              | None1 ->
                                                let lam_98'33 = fun [explode,put_chars] s k ->
                                                  let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                  explode s k in
                                                let k [block,explode,put_chars] app_98'28 =
                                                  let lit_131'25 = "ERROR: " in
                                                  let k [block,explode,put_chars] _ =
                                                    let lam_98'33 = fun [explode,put_chars] s k ->
                                                      let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                      explode s k in
                                                    let k [] app_98'28 =
                                                      let lit_142'24 = "expected arg1 to be numeric" in
                                                      let k [] _ =
                                                        let lit_102'26 = '\n' in
                                                        let prim_0'0 = PRIM_PutChar(lit_102'26) in
                                                        k prim_0'0 in
                                                      app_98'28 lit_142'24 k in
                                                    block lam_98'33 k in
                                                  app_98'28 lit_131'25 k in
                                                block lam_98'33 k
                                              | Some0(n) ->
                                                let k [block,explode,put_chars,n] res =
                                                  let loop = fix (fun [] loop acc k ->
                                                    let lam_87'19 = fun [acc,loop] i k ->
                                                      let lit_88'11 = 0 in
                                                      let prim_0'0 = PRIM_EqInt(i,lit_88'11) in
                                                      match prim_0'0 with
                                                      | true1 -> k acc
                                                      | false0 ->
                                                        let lit_89'35 = 10 in
                                                        let c = PRIM_ModInt(i,lit_89'35) in
                                                        let lit_0'0 = 48 in
                                                        let x = PRIM_AddInt(lit_0'0,c) in
                                                        let x = PRIM_CharChr(x) in
                                                        let con_0'0 = CID1[x,acc] in
                                                        let k [i] app_89'11 =
                                                          let lit_89'48 = 10 in
                                                          let prim_0'0 = PRIM_DivInt(i,lit_89'48) in
                                                          app_89'11 prim_0'0 k in
                                                        loop con_0'0 k in
                                                    k lam_87'19) in
                                                  let lit_91'9 = 0 in
                                                  let prim_0'0 = PRIM_EqInt(n,lit_91'9) in
                                                  let k [block,explode,put_chars,res] case_91'2 =
                                                    let k [block,explode,put_chars,res] _ =
                                                      let lam_98'33 = fun [explode,put_chars] s k ->
                                                        let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                        explode s k in
                                                      let k [put_chars,res] app_98'28 =
                                                        let lit_146'22 = " --> " in
                                                        let k [put_chars,res] _ =
                                                          let loop = fix (fun [] loop acc k ->
                                                            let lam_87'19 = fun [acc,loop] i k ->
                                                              let lit_88'11 = 0 in
                                                              let prim_0'0 = PRIM_EqInt(i,lit_88'11) in
                                                              match prim_0'0 with
                                                              | true1 -> k acc
                                                              | false0 ->
                                                                let lit_89'35 = 10 in
                                                                let c = PRIM_ModInt(i,lit_89'35) in
                                                                let lit_0'0 = 48 in
                                                                let x = PRIM_AddInt(lit_0'0,c) in
                                                                let x = PRIM_CharChr(x) in
                                                                let con_0'0 = CID1[x,acc] in
                                                                let k [i] app_89'11 =
                                                                  let lit_89'48 = 10 in
                                                                  let prim_0'0 = PRIM_DivInt(i,lit_89'48) in
                                                                  app_89'11 prim_0'0 k in
                                                                loop con_0'0 k in
                                                            k lam_87'19) in
                                                          let lit_91'9 = 0 in
                                                          let prim_0'0 = PRIM_EqInt(res,lit_91'9) in
                                                          let k [put_chars] case_91'2 =
                                                            let k [] _ =
                                                              let lit_102'26 = '\n' in
                                                              let prim_0'0 = PRIM_PutChar(lit_102'26) in
                                                              k prim_0'0 in
                                                            put_chars case_91'2 k in
                                                          match prim_0'0 with
                                                          | true1 ->
                                                            let lit_91'21 = '0' in
                                                            let con_91'25 = CID0 in
                                                            let con_0'0 = CID1[lit_91'21,con_91'25] in
                                                            k con_0'0
                                                          | false0 ->
                                                            let con_91'38 = CID0 in
                                                            let k [res] app_91'38 = app_91'38 res k in
                                                            loop con_91'38 k in
                                                        app_98'28 lit_146'22 k in
                                                      block lam_98'33 k in
                                                    put_chars case_91'2 k in
                                                  match prim_0'0 with
                                                  | true1 ->
                                                    let lit_91'21 = '0' in
                                                    let con_91'25 = CID0 in
                                                    let con_0'0 = CID1[lit_91'21,con_91'25] in
                                                    k con_0'0
                                                  | false0 ->
                                                    let con_91'38 = CID0 in
                                                    let k [n] app_91'38 = app_91'38 n k in
                                                    loop con_91'38 k in
                                                fib n k in
                                            app_47'7 arg1 k in
                                          loop lit_47'7 k in
                                    app_98'28 lit_134'13 k in
                                  block lam_98'33 k
                                | false0 ->
                                  let lit_211'40 = "fact" in
                                  let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fact,xs,command,args] ys =
                                    let lam_0'0 = fun [] x k ->
                                      let lam_0'0 = fun [x] y k ->
                                        let prim_0'0 = PRIM_EqChar(x,y) in
                                        k prim_0'0 in
                                      k lam_0'0 in
                                    let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fact,xs,command,args,ys] app_60'33 =
                                      let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fact,xs,command,args,ys] app_60'41 =
                                        let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,fact,xs,command,args] app_60'44 =
                                          match app_60'44 with
                                          | true1 ->
                                            let lam_98'33 = fun [explode,put_chars] s k ->
                                              let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                              explode s k in
                                            let k [block,explode,put_chars,fact,args] app_98'28 =
                                              let lit_151'13 = "fact: " in
                                              let k [block,explode,put_chars,fact,args] _ =
                                                match args with
                                                | Nil0 ->
                                                  let lam_98'33 = fun [explode,put_chars] s k ->
                                                    let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                    explode s k in
                                                  let k [block,explode,put_chars] app_98'28 =
                                                    let lit_131'25 = "ERROR: " in
                                                    let k [block,explode,put_chars] _ =
                                                      let lam_98'33 = fun [explode,put_chars] s k ->
                                                        let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                        explode s k in
                                                      let k [] app_98'28 =
                                                        let lit_153'16 = "expected an argument" in
                                                        let k [] _ =
                                                          let lit_102'26 = '\n' in
                                                          let prim_0'0 = PRIM_PutChar(lit_102'26) in
                                                          k prim_0'0 in
                                                        app_98'28 lit_153'16 k in
                                                      block lam_98'33 k in
                                                    app_98'28 lit_131'25 k in
                                                  block lam_98'33 k
                                                | Cons1(arg1,more) ->
                                                  match more with
                                                  | Cons1(_,_) ->
                                                    let lam_98'33 = fun [explode,put_chars] s k ->
                                                      let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                      explode s k in
                                                    let k [block,explode,put_chars] app_98'28 =
                                                      let lit_131'25 = "ERROR: " in
                                                      let k [block,explode,put_chars] _ =
                                                        let lam_98'33 = fun [explode,put_chars] s k ->
                                                          let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                          explode s k in
                                                        let k [] app_98'28 =
                                                          let lit_156'21 = "expected exactly one argument" in
                                                          let k [] _ =
                                                            let lit_102'26 = '\n' in
                                                            let prim_0'0 = PRIM_PutChar(lit_102'26) in
                                                            k prim_0'0 in
                                                          app_98'28 lit_156'21 k in
                                                        block lam_98'33 k in
                                                      app_98'28 lit_131'25 k in
                                                    block lam_98'33 k
                                                  | Nil0 ->
                                                    let loop = fix (fun [] loop acc k ->
                                                      let lam_39'19 = fun [acc,loop] xs k ->
                                                        match xs with
                                                        | Nil0 ->
                                                          let con_41'12 = CID0[acc] in
                                                          k con_41'12
                                                        | Cons1(x,xs) ->
                                                          let x = PRIM_CharOrd(x) in
                                                          let lit_0'0 = 48 in
                                                          let n = PRIM_SubInt(x,lit_0'0) in
                                                          let lit_36'10 = 0 in
                                                          let b = PRIM_LessInt(n,lit_36'10) in
                                                          let k [acc,loop,xs,n] case_7'2 =
                                                            let k [acc,loop,xs] case_36'2 =
                                                              match case_36'2 with
                                                              | None1 ->
                                                                let con_44'18 = CID1 in
                                                                k con_44'18
                                                              | Some0(d) ->
                                                                let lit_45'26 = 10 in
                                                                let x = PRIM_MulInt(lit_45'26,acc) in
                                                                let prim_0'0 = PRIM_AddInt(x,d) in
                                                                let k [xs] app_45'25 = app_45'25 xs k in
                                                                loop prim_0'0 k in
                                                            match case_7'2 with
                                                            | true1 ->
                                                              let lit_36'25 = 9 in
                                                              let b = PRIM_LessInt(lit_36'25,n) in
                                                              let k [n] case_7'2 =
                                                                match case_7'2 with
                                                                | true1 ->
                                                                  let con_36'32 = CID0[n] in
                                                                  k con_36'32
                                                                | false0 ->
                                                                  let con_36'45 = CID1 in
                                                                  k con_36'45 in
                                                              match b with
                                                              | true1 ->
                                                                let con_8'12 = CID0 in
                                                                k con_8'12
                                                              | false0 ->
                                                                let con_9'13 = CID1 in
                                                                k con_9'13
                                                            | false0 ->
                                                              let con_36'55 = CID1 in
                                                              k con_36'55 in
                                                          match b with
                                                          | true1 ->
                                                            let con_8'12 = CID0 in
                                                            k con_8'12
                                                          | false0 ->
                                                            let con_9'13 = CID1 in
                                                            k con_9'13 in
                                                      k lam_39'19) in
                                                    let lit_47'7 = 0 in
                                                    let k [block,explode,put_chars,fact,arg1] app_47'7 =
                                                      let k [block,explode,put_chars,fact] app_47'9 =
                                                        match app_47'9 with
                                                        | None1 ->
                                                          let lam_98'33 = fun [explode,put_chars] s k ->
                                                            let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                            explode s k in
                                                          let k [block,explode,put_chars] app_98'28 =
                                                            let lit_131'25 = "ERROR: " in
                                                            let k [block,explode,put_chars] _ =
                                                              let lam_98'33 = fun [explode,put_chars] s k ->
                                                                let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                                explode s k in
                                                              let k [] app_98'28 =
                                                                let lit_159'24 = "expected arg1 to be numeric" in
                                                                let k [] _ =
                                                                  let lit_102'26 = '\n' in
                                                                  let prim_0'0 = PRIM_PutChar(lit_102'26) in
                                                                  k prim_0'0 in
                                                                app_98'28 lit_159'24 k in
                                                              block lam_98'33 k in
                                                            app_98'28 lit_131'25 k in
                                                          block lam_98'33 k
                                                        | Some0(n) ->
                                                          let k [block,explode,put_chars,n] res =
                                                            let loop = fix (fun [] loop acc k ->
                                                              let lam_87'19 = fun [acc,loop] i k ->
                                                                let lit_88'11 = 0 in
                                                                let prim_0'0 = PRIM_EqInt(i,lit_88'11) in
                                                                match prim_0'0 with
                                                                | true1 -> k acc
                                                                | false0 ->
                                                                  let lit_89'35 = 10 in
                                                                  let c = PRIM_ModInt(i,lit_89'35) in
                                                                  let lit_0'0 = 48 in
                                                                  let x = PRIM_AddInt(lit_0'0,c) in
                                                                  let x = PRIM_CharChr(x) in
                                                                  let con_0'0 = CID1[x,acc] in
                                                                  let k [i] app_89'11 =
                                                                    let lit_89'48 = 10 in
                                                                    let prim_0'0 = PRIM_DivInt(i,lit_89'48) in
                                                                    app_89'11 prim_0'0 k in
                                                                  loop con_0'0 k in
                                                              k lam_87'19) in
                                                            let lit_91'9 = 0 in
                                                            let prim_0'0 = PRIM_EqInt(n,lit_91'9) in
                                                            let k [block,explode,put_chars,res] case_91'2 =
                                                              let k [block,explode,put_chars,res] _ =
                                                                let lam_98'33 = fun [explode,put_chars] s k ->
                                                                  let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                                  explode s k in
                                                                let k [put_chars,res] app_98'28 =
                                                                  let lit_163'22 = " --> " in
                                                                  let k [put_chars,res] _ =
                                                                    let loop = fix (fun [] loop acc k ->
                                                                      let lam_87'19 = fun [acc,loop] i k ->
                                                                        let lit_88'11 = 0 in
                                                                        let prim_0'0 = PRIM_EqInt(i,lit_88'11) in
                                                                        match prim_0'0 with
                                                                        | true1 -> k acc
                                                                        | false0 ->
                                                                          let lit_89'35 = 10 in
                                                                          let c = PRIM_ModInt(i,lit_89'35) in
                                                                          let lit_0'0 = 48 in
                                                                          let x = PRIM_AddInt(lit_0'0,c) in
                                                                          let x = PRIM_CharChr(x) in
                                                                          let con_0'0 = CID1[x,acc] in
                                                                          let k [i] app_89'11 =
                                                                            let lit_89'48 = 10 in
                                                                            let prim_0'0 = PRIM_DivInt(i,lit_89'48) in
                                                                            app_89'11 prim_0'0 k in
                                                                          loop con_0'0 k in
                                                                      k lam_87'19) in
                                                                    let lit_91'9 = 0 in
                                                                    let prim_0'0 = PRIM_EqInt(res,lit_91'9) in
                                                                    let k [put_chars] case_91'2 =
                                                                      let k [] _ =
                                                                        let lit_102'26 = '\n' in
                                                                        let prim_0'0 = PRIM_PutChar(lit_102'26) in
                                                                        k prim_0'0 in
                                                                      put_chars case_91'2 k in
                                                                    match prim_0'0 with
                                                                    | true1 ->
                                                                      let lit_91'21 = '0' in
                                                                      let con_91'25 = CID0 in
                                                                      let con_0'0 = CID1[lit_91'21,con_91'25] in
                                                                      k con_0'0
                                                                    | false0 ->
                                                                      let con_91'38 = CID0 in
                                                                      let k [res] app_91'38 = app_91'38 res k in
                                                                      loop con_91'38 k in
                                                                  app_98'28 lit_163'22 k in
                                                                block lam_98'33 k in
                                                              put_chars case_91'2 k in
                                                            match prim_0'0 with
                                                            | true1 ->
                                                              let lit_91'21 = '0' in
                                                              let con_91'25 = CID0 in
                                                              let con_0'0 = CID1[lit_91'21,con_91'25] in
                                                              k con_0'0
                                                            | false0 ->
                                                              let con_91'38 = CID0 in
                                                              let k [n] app_91'38 = app_91'38 n k in
                                                              loop con_91'38 k in
                                                          fact n k in
                                                      app_47'7 arg1 k in
                                                    loop lit_47'7 k in
                                              app_98'28 lit_151'13 k in
                                            block lam_98'33 k
                                          | false0 ->
                                            let lit_212'42 = "rev" in
                                            let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,xs,command,args] ys =
                                              let lam_0'0 = fun [] x k ->
                                                let lam_0'0 = fun [x] y k ->
                                                  let prim_0'0 = PRIM_EqChar(x,y) in
                                                  k prim_0'0 in
                                                k lam_0'0 in
                                              let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,xs,command,args,ys] app_60'33 =
                                                let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,xs,args,ys] app_60'41 =
                                                  let k [block,explode,eq_list,append,revloop,map,length,put_chars,readloop,xs,args] app_60'44 =
                                                    match app_60'44 with
                                                    | true1 ->
                                                      match args with
                                                      | Cons1(_,_) ->
                                                        let lam_98'33 = fun [explode,put_chars] s k ->
                                                          let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                          explode s k in
                                                        let k [block,explode,put_chars] app_98'28 =
                                                          let lit_131'25 = "ERROR: " in
                                                          let k [block,explode,put_chars] _ =
                                                            let lam_98'33 = fun [explode,put_chars] s k ->
                                                              let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                              explode s k in
                                                            let k [] app_98'28 =
                                                              let lit_180'18 = "rev: expected no arguments" in
                                                              let k [] _ =
                                                                let lit_102'26 = '\n' in
                                                                let prim_0'0 = PRIM_PutChar(lit_102'26) in
                                                                k prim_0'0 in
                                                              app_98'28 lit_180'18 k in
                                                            block lam_98'33 k in
                                                          app_98'28 lit_131'25 k in
                                                        block lam_98'33 k
                                                      | Nil0 ->
                                                        let lam_98'33 = fun [explode,put_chars] s k ->
                                                          let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                          explode s k in
                                                        let k [eq_list,revloop,put_chars,readloop] app_98'28 =
                                                          let lit_182'16 = "(reverse typed lines until ^D)\n" in
                                                          let k [eq_list,revloop,put_chars,readloop] _ =
                                                            let loop = fix (fun [eq_list,revloop,put_chars,readloop] loop _ k ->
                                                              let con_121'28 = CID0 in
                                                              let k [eq_list,revloop,put_chars,loop] xs =
                                                                let lam_0'0 = fun [] x k ->
                                                                  let lam_0'0 = fun [x] y k ->
                                                                    let prim_0'0 = PRIM_EqChar(x,y) in
                                                                    k prim_0'0 in
                                                                  k lam_0'0 in
                                                                let k [revloop,put_chars,loop,xs] app_60'33 =
                                                                  let k [revloop,put_chars,loop,xs] app_60'41 =
                                                                    let lit_0'0 = '\EOT' in
                                                                    let con_168'31 = CID0 in
                                                                    let con_0'0 = CID1[lit_0'0,con_168'31] in
                                                                    let k [revloop,put_chars,loop,xs] app_60'44 =
                                                                      match app_60'44 with
                                                                      | true1 ->
                                                                        let con_173'44 = CID0 in
                                                                        k con_173'44
                                                                      | false0 ->
                                                                        let con_72'25 = CID0 in
                                                                        let k [put_chars,loop,xs] app_72'25 =
                                                                          let k [put_chars,loop] app_72'28 =
                                                                            let k [loop] _ =
                                                                              let lit_102'26 = '\n' in
                                                                              let _ = PRIM_PutChar(lit_102'26) in
                                                                              let con_174'46 = CID0 in
                                                                              loop con_174'46 k in
                                                                            put_chars app_72'28 k in
                                                                          app_72'25 xs k in
                                                                        revloop con_72'25 k in
                                                                    app_60'41 con_0'0 k in
                                                                  app_60'33 xs k in
                                                                eq_list lam_0'0 k in
                                                              readloop con_121'28 k) in
                                                            let con_176'6 = CID0 in
                                                            loop con_176'6 k in
                                                          app_98'28 lit_182'16 k in
                                                        block lam_98'33 k
                                                    | false0 ->
                                                      let lam_186'30 = fun [] c k ->
                                                        let lit_186'48 = 'o' in
                                                        let prim_0'0 = PRIM_EqChar(c,lit_186'48) in
                                                        match prim_0'0 with
                                                        | true1 ->
                                                          let lit_186'57 = '*' in
                                                          k lit_186'57
                                                        | false0 -> k c in
                                                      let k [block,explode,append,length,put_chars,xs] star_the_ohs =
                                                        let k [block,explode,append,put_chars,xs,star_the_ohs] n =
                                                          let lit_188'29 = "You wrote: \"" in
                                                          let k [block,explode,append,put_chars,xs,star_the_ohs,n] app_188'29 =
                                                            let k [block,explode,put_chars,xs,star_the_ohs,n] app_188'20 =
                                                              let k [block,explode,put_chars,n,app_188'20] app_188'60 =
                                                                let k [block,explode,put_chars,n] app_188'46 =
                                                                  let k [block,explode,put_chars,n] _ =
                                                                    let lam_98'33 = fun [explode,put_chars] s k ->
                                                                      let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                                      explode s k in
                                                                    let k [block,explode,put_chars,n] app_98'28 =
                                                                      let lit_189'13 = "\" (" in
                                                                      let k [block,explode,put_chars,n] _ =
                                                                        let loop = fix (fun [] loop acc k ->
                                                                          let lam_87'19 = fun [acc,loop] i k ->
                                                                            let lit_88'11 = 0 in
                                                                            let prim_0'0 = PRIM_EqInt(i,lit_88'11) in
                                                                            match prim_0'0 with
                                                                            | true1 -> k acc
                                                                            | false0 ->
                                                                              let lit_89'35 = 10 in
                                                                              let c = PRIM_ModInt(i,lit_89'35) in
                                                                              let lit_0'0 = 48 in
                                                                              let x = PRIM_AddInt(lit_0'0,c) in
                                                                              let x = PRIM_CharChr(x) in
                                                                              let con_0'0 = CID1[x,acc] in
                                                                              let k [i] app_89'11 =
                                                                                let lit_89'48 = 10 in
                                                                                let prim_0'0 = PRIM_DivInt(i,lit_89'48) in
                                                                                app_89'11 prim_0'0 k in
                                                                              loop con_0'0 k in
                                                                          k lam_87'19) in
                                                                        let lit_91'9 = 0 in
                                                                        let prim_0'0 = PRIM_EqInt(n,lit_91'9) in
                                                                        let k [block,explode,put_chars] case_91'2 =
                                                                          let k [block,explode,put_chars] _ =
                                                                            let lam_98'33 = fun [explode,put_chars] s k ->
                                                                              let k [put_chars] app_98'57 = put_chars app_98'57 k in
                                                                              explode s k in
                                                                            let k [] app_98'28 =
                                                                              let lit_191'13 = " chars)" in
                                                                              let k [] _ =
                                                                                let lit_102'26 = '\n' in
                                                                                let prim_0'0 = PRIM_PutChar(lit_102'26) in
                                                                                k prim_0'0 in
                                                                              app_98'28 lit_191'13 k in
                                                                            block lam_98'33 k in
                                                                          put_chars case_91'2 k in
                                                                        match prim_0'0 with
                                                                        | true1 ->
                                                                          let lit_91'21 = '0' in
                                                                          let con_91'25 = CID0 in
                                                                          let con_0'0 = CID1[lit_91'21,con_91'25] in
                                                                          k con_0'0
                                                                        | false0 ->
                                                                          let con_91'38 = CID0 in
                                                                          let k [n] app_91'38 = app_91'38 n k in
                                                                          loop con_91'38 k in
                                                                      app_98'28 lit_189'13 k in
                                                                    block lam_98'33 k in
                                                                  put_chars app_188'46 k in
                                                                app_188'20 app_188'60 k in
                                                              star_the_ohs xs k in
                                                            append app_188'29 k in
                                                          explode lit_188'29 k in
                                                        length xs k in
                                                      map lam_186'30 k in
                                                  app_60'41 ys k in
                                                app_60'33 command k in
                                              eq_list lam_0'0 k in
                                            explode lit_212'42 k in
                                        app_60'41 ys k in
                                      app_60'33 command k in
                                    eq_list lam_0'0 k in
                                  explode lit_211'40 k in
                              app_60'41 ys k in
                            app_60'33 command k in
                          eq_list lam_0'0 k in
                        explode lit_210'38 k in
                    app_203'15 xs k in
                  app_203'12 con_203'15 k in
                splitloop con_203'12 k in
            app_60'41 con_0'0 k in
          app_60'33 xs k in
        eq_list lam_0'0 k in
      readloop con_121'28 k in
    put_chars con_216'13 k) in
  let lam_98'33 = fun [explode,put_chars] s k ->
    let k [put_chars] app_98'57 = put_chars app_98'57 k in
    explode s k in
  let k [mainloop] app_98'28 =
    let lit_222'13 = "This is a shell prototype. Try: fib, fact, rev\n" in
    let k [mainloop] _ =
      let con_223'11 = CID0 in
      mainloop con_223'11 k in
    app_98'28 lit_222'13 k in
  block lam_98'33 k in
block lam_0'0 k
