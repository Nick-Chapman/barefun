(*stage2*)
let k () = ()
let eq_list = fix (fun [] eq_list eq k ->
  let lam_47'19 = fun [eq,eq_list] xs k ->
    let lam_47'22 = fun [eq,eq_list,xs] ys k ->
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
          let k [eq,eq_list,xs,y,ys] app_54'14 =
            let k [eq,eq_list,xs,ys] app_54'16 =
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
let append = fix (fun [] append xs k ->
  let lam_58'18 = fun [xs,append] ys k ->
    match xs with
    | Nil0 -> k ys
    | Cons1(x,xs) ->
      let k [ys,x] app_61'28 =
        let k [x] xs =
          let con_0'0 = Cons1[x,xs] in
          k con_0'0 in
        app_61'28 ys k in
      append xs k in
  k lam_58'18) in
let map = fix (fun [] map f k ->
  let lam_71'14 = fun [f,map] xs k ->
    match xs with
    | Nil0 ->
      let con_73'10 = Nil0 in
      k con_73'10
    | Cons1(x,xs) ->
      let k [f,map,xs] x =
        let uLET_0'0 = fun [x] y k ->
          let con_0'0 = Cons1[x,y] in
          k con_0'0 in
        let k [uLET_0'0,xs] app_74'24 =
          let k [uLET_0'0] app_74'26 = uLET_0'0 app_74'26 k in
          app_74'24 xs k in
        map f k in
      f x k in
  k lam_71'14) in
let length = fix (fun [] length xs k ->
  match xs with
  | Nil0 ->
    let lit_78'10 = 0 in
    k lit_78'10
  | Cons1(_,xs) ->
    let x = 1 in
    let uLET_0'0 = fun [x] y k ->
      let prim_0'0 = PRIM_AddInt(x,y) in
      k prim_0'0 in
    let k [uLET_0'0] app_79'27 = uLET_0'0 app_79'27 k in
    length xs k) in
let put_chars = fix (fun [] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_92'10 = Unit0 in
    k con_92'10
  | Cons1(x,xs) ->
    let backspace = 8 in
    let n = PRIM_CharOrd(x) in
    let prim_0'0 = PRIM_EqInt(n,backspace) in
    let k [put_chars,xs] _ = put_chars xs k in
    match prim_0'0 with
    | true1 ->
      let prim_0'0 = PRIM_PutChar(x) in
      k prim_0'0
    | false0 ->
      let y = '\n' in
      let uLET_0'0 = PRIM_EqChar(x,y) in
      match uLET_0'0 with
      | true1 ->
        let prim_0'0 = PRIM_PutChar(x) in
        k prim_0'0
      | false0 ->
        let b = 26 in
        let uLET_7'10 = PRIM_LessInt(b,n) in
        match uLET_7'10 with
        | true1 ->
          let prim_0'0 = PRIM_PutChar(x) in
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
            let lit_18'52 = 1 in
            let k [] x =
              let x = PRIM_CharChr(x) in
              let prim_0'0 = PRIM_PutChar(x) in
              k prim_0'0 in
            uLET_0'0 lit_18'52 k in
          uLET_0'0 n k) in
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
      let k [uLET_0'0] app_123'39 = uLET_0'0 app_123'39 k in
      fib uLET_0'0 k in
    fib uLET_0'0 k) in
let fact = fix (fun [] fact n k ->
  let b = 2 in
  let b = PRIM_LessInt(n,b) in
  let k [n,fact] uLET_9'11 =
    match uLET_9'11 with
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
      let lit_127'37 = 1 in
      k lit_127'37 in
  match b with
  | true1 ->
    let con_4'12 = false0 in
    k con_4'12
  | false0 ->
    let con_5'13 = true1 in
    k con_5'13) in
let x = 4 in
let x = PRIM_CharChr(x) in
let uLET_0'0 = fun [x] y k ->
  let con_0'0 = Cons1[x,y] in
  k con_0'0 in
let con_166'31 = Nil0 in
let k [eq_list,append,map,length,put_chars,fib,fact] single_controlD =
  let mainloop = fix (fun [eq_list,append,map,length,put_chars,fib,fact,single_controlD] mainloop _ k ->
    let lit_214'13 = '>' in
    let lit_214'17 = ' ' in
    let con_214'20 = Nil0 in
    let con_214'17 = Cons1[lit_214'17,con_214'20] in
    let con_214'13 = Cons1[lit_214'13,con_214'17] in
    let k [eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop] _ =
      let _ = Unit0 in
      let x = 4 in
      let controlD = PRIM_CharChr(x) in
      let loop = fix (fun [controlD] loop acc k ->
        let x = Unit0 in
        let c = PRIM_GetChar(x) in
        let n = PRIM_CharOrd(c) in
        let y = '\n' in
        let uLET_0'0 = PRIM_EqChar(c,y) in
        match uLET_0'0 with
        | true1 ->
          let _ = Unit0 in
          let c = '\n' in
          let backspace = 8 in
          let n = PRIM_CharOrd(c) in
          let prim_0'0 = PRIM_EqInt(n,backspace) in
          let k [acc] _ =
            let loop = fix (fun [] loop acc k ->
              let lam_64'19 = fun [acc,loop] xs k ->
                match xs with
                | Nil0 -> k acc
                | Cons1(x,xs) ->
                  let con_0'0 = Cons1[x,acc] in
                  let k [xs] app_67'20 = app_67'20 xs k in
                  loop con_0'0 k in
              k lam_64'19) in
            let con_69'7 = Nil0 in
            let k [acc] app_69'7 = app_69'7 acc k in
            loop con_69'7 k in
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
              let uLET_7'10 = PRIM_LessInt(b,n) in
              match uLET_7'10 with
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
                  let lit_18'52 = 1 in
                  let k [] x =
                    let x = PRIM_CharChr(x) in
                    let prim_0'0 = PRIM_PutChar(x) in
                    k prim_0'0 in
                  uLET_0'0 lit_18'52 k in
                uLET_0'0 n k
        | false0 ->
          let prim_0'0 = PRIM_EqChar(c,controlD) in
          match prim_0'0 with
          | true1 ->
            let backspace = 8 in
            let n = PRIM_CharOrd(c) in
            let prim_0'0 = PRIM_EqInt(n,backspace) in
            let k [controlD,acc] _ =
              let _ = Unit0 in
              let c = '\n' in
              let backspace = 8 in
              let n = PRIM_CharOrd(c) in
              let prim_0'0 = PRIM_EqInt(n,backspace) in
              let k [controlD,acc] _ =
                let xs = Cons1[controlD,acc] in
                let loop = fix (fun [] loop acc k ->
                  let lam_64'19 = fun [acc,loop] xs k ->
                    match xs with
                    | Nil0 -> k acc
                    | Cons1(x,xs) ->
                      let con_0'0 = Cons1[x,acc] in
                      let k [xs] app_67'20 = app_67'20 xs k in
                      loop con_0'0 k in
                  k lam_64'19) in
                let con_69'7 = Nil0 in
                let k [xs] app_69'7 = app_69'7 xs k in
                loop con_69'7 k in
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
                  let uLET_7'10 = PRIM_LessInt(b,n) in
                  match uLET_7'10 with
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
                      let lit_18'52 = 1 in
                      let k [] x =
                        let x = PRIM_CharChr(x) in
                        let prim_0'0 = PRIM_PutChar(x) in
                        k prim_0'0 in
                      uLET_0'0 lit_18'52 k in
                    uLET_0'0 n k in
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
                let uLET_7'10 = PRIM_LessInt(b,n) in
                match uLET_7'10 with
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
                    let lit_18'52 = 1 in
                    let k [] x =
                      let x = PRIM_CharChr(x) in
                      let prim_0'0 = PRIM_PutChar(x) in
                      k prim_0'0 in
                    uLET_0'0 lit_18'52 k in
                  uLET_0'0 n k
          | false0 ->
            let b = 127 in
            let uLET_7'10 = PRIM_LessInt(b,n) in
            match uLET_7'10 with
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
                  let uLET_8'9 = fun [a] b k ->
                    let b = PRIM_LessInt(b,a) in
                    match b with
                    | true1 ->
                      let con_4'12 = false0 in
                      k con_4'12
                    | false0 ->
                      let con_5'13 = true1 in
                      k con_5'13 in
                  let lit_113'28 = 26 in
                  let k [loop,tail] app_113'28 =
                    let k [loop,tail] _ =
                      let _ = Unit0 in
                      let x = 8 in
                      let backspace = PRIM_CharChr(x) in
                      let backspace = 8 in
                      let n = PRIM_CharOrd(backspace) in
                      let prim_0'0 = PRIM_EqInt(n,backspace) in
                      let k [loop,tail,backspace] _ =
                        let c = ' ' in
                        let backspace = 8 in
                        let n = PRIM_CharOrd(c) in
                        let prim_0'0 = PRIM_EqInt(n,backspace) in
                        let k [loop,tail,backspace] _ =
                          let backspace = 8 in
                          let n = PRIM_CharOrd(backspace) in
                          let prim_0'0 = PRIM_EqInt(n,backspace) in
                          let k [loop,tail] _ = loop tail k in
                          match prim_0'0 with
                          | true1 ->
                            let prim_0'0 = PRIM_PutChar(backspace) in
                            k prim_0'0
                          | false0 ->
                            let y = '\n' in
                            let uLET_0'0 = PRIM_EqChar(backspace,y) in
                            match uLET_0'0 with
                            | true1 ->
                              let prim_0'0 = PRIM_PutChar(backspace) in
                              k prim_0'0
                            | false0 ->
                              let b = 26 in
                              let uLET_7'10 = PRIM_LessInt(b,n) in
                              match uLET_7'10 with
                              | true1 ->
                                let prim_0'0 = PRIM_PutChar(backspace) in
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
                                  let lit_18'52 = 1 in
                                  let k [] x =
                                    let x = PRIM_CharChr(x) in
                                    let prim_0'0 = PRIM_PutChar(x) in
                                    k prim_0'0 in
                                  uLET_0'0 lit_18'52 k in
                                uLET_0'0 n k in
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
                            let uLET_7'10 = PRIM_LessInt(b,n) in
                            match uLET_7'10 with
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
                                let lit_18'52 = 1 in
                                let k [] x =
                                  let x = PRIM_CharChr(x) in
                                  let prim_0'0 = PRIM_PutChar(x) in
                                  k prim_0'0 in
                                uLET_0'0 lit_18'52 k in
                              uLET_0'0 n k in
                      match prim_0'0 with
                      | true1 ->
                        let prim_0'0 = PRIM_PutChar(backspace) in
                        k prim_0'0
                      | false0 ->
                        let y = '\n' in
                        let uLET_0'0 = PRIM_EqChar(backspace,y) in
                        match uLET_0'0 with
                        | true1 ->
                          let prim_0'0 = PRIM_PutChar(backspace) in
                          k prim_0'0
                        | false0 ->
                          let b = 26 in
                          let uLET_7'10 = PRIM_LessInt(b,n) in
                          match uLET_7'10 with
                          | true1 ->
                            let prim_0'0 = PRIM_PutChar(backspace) in
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
                              let lit_18'52 = 1 in
                              let k [] x =
                                let x = PRIM_CharChr(x) in
                                let prim_0'0 = PRIM_PutChar(x) in
                                k prim_0'0 in
                              uLET_0'0 lit_18'52 k in
                            uLET_0'0 n k in
                    match app_113'28 with
                    | true1 ->
                      let _ = Unit0 in
                      let x = 8 in
                      let backspace = PRIM_CharChr(x) in
                      let backspace = 8 in
                      let n = PRIM_CharOrd(backspace) in
                      let prim_0'0 = PRIM_EqInt(n,backspace) in
                      let k [backspace] _ =
                        let c = ' ' in
                        let backspace = 8 in
                        let n = PRIM_CharOrd(c) in
                        let prim_0'0 = PRIM_EqInt(n,backspace) in
                        let k [backspace] _ =
                          let backspace = 8 in
                          let n = PRIM_CharOrd(backspace) in
                          let prim_0'0 = PRIM_EqInt(n,backspace) in
                          match prim_0'0 with
                          | true1 ->
                            let prim_0'0 = PRIM_PutChar(backspace) in
                            k prim_0'0
                          | false0 ->
                            let y = '\n' in
                            let uLET_0'0 = PRIM_EqChar(backspace,y) in
                            match uLET_0'0 with
                            | true1 ->
                              let prim_0'0 = PRIM_PutChar(backspace) in
                              k prim_0'0
                            | false0 ->
                              let b = 26 in
                              let uLET_7'10 = PRIM_LessInt(b,n) in
                              match uLET_7'10 with
                              | true1 ->
                                let prim_0'0 = PRIM_PutChar(backspace) in
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
                                  let lit_18'52 = 1 in
                                  let k [] x =
                                    let x = PRIM_CharChr(x) in
                                    let prim_0'0 = PRIM_PutChar(x) in
                                    k prim_0'0 in
                                  uLET_0'0 lit_18'52 k in
                                uLET_0'0 n k in
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
                            let uLET_7'10 = PRIM_LessInt(b,n) in
                            match uLET_7'10 with
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
                                let lit_18'52 = 1 in
                                let k [] x =
                                  let x = PRIM_CharChr(x) in
                                  let prim_0'0 = PRIM_PutChar(x) in
                                  k prim_0'0 in
                                uLET_0'0 lit_18'52 k in
                              uLET_0'0 n k in
                      match prim_0'0 with
                      | true1 ->
                        let prim_0'0 = PRIM_PutChar(backspace) in
                        k prim_0'0
                      | false0 ->
                        let y = '\n' in
                        let uLET_0'0 = PRIM_EqChar(backspace,y) in
                        match uLET_0'0 with
                        | true1 ->
                          let prim_0'0 = PRIM_PutChar(backspace) in
                          k prim_0'0
                        | false0 ->
                          let b = 26 in
                          let uLET_7'10 = PRIM_LessInt(b,n) in
                          match uLET_7'10 with
                          | true1 ->
                            let prim_0'0 = PRIM_PutChar(backspace) in
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
                              let lit_18'52 = 1 in
                              let k [] x =
                                let x = PRIM_CharChr(x) in
                                let prim_0'0 = PRIM_PutChar(x) in
                                k prim_0'0 in
                              uLET_0'0 lit_18'52 k in
                            uLET_0'0 n k
                    | false0 ->
                      let con_113'55 = Unit0 in
                      k con_113'55 in
                  uLET_8'9 lit_113'28 k
              | false0 ->
                let backspace = 8 in
                let n = PRIM_CharOrd(c) in
                let prim_0'0 = PRIM_EqInt(n,backspace) in
                let k [acc,loop,c] _ =
                  let con_0'0 = Cons1[c,acc] in
                  loop con_0'0 k in
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
                    let uLET_7'10 = PRIM_LessInt(b,n) in
                    match uLET_7'10 with
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
                        let lit_18'52 = 1 in
                        let k [] x =
                          let x = PRIM_CharChr(x) in
                          let prim_0'0 = PRIM_PutChar(x) in
                          k prim_0'0 in
                        uLET_0'0 lit_18'52 k in
                      uLET_0'0 n k) in
      let con_119'7 = Nil0 in
      let k [eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop] xs =
        let lam_0'0 = fun [] x k ->
          let lam_0'0 = fun [x] y k ->
            let prim_0'0 = PRIM_EqChar(x,y) in
            k prim_0'0 in
          k lam_0'0 in
        let k [eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop,xs] app_56'31 =
          let k [eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop,xs] app_56'39 =
            let k [eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop,xs] app_56'41 =
              match app_56'41 with
              | true1 ->
                let con_216'42 = Unit0 in
                k con_216'42
              | false0 ->
                let loop = fix (fun [] loop accWs k ->
                  let lam_193'21 = fun [accWs,loop] accCs k ->
                    let lam_193'27 = fun [accWs,loop,accCs] xs k ->
                      match xs with
                      | Nil0 ->
                        let loop = fix (fun [] loop acc k ->
                          let lam_64'19 = fun [acc,loop] xs k ->
                            match xs with
                            | Nil0 -> k acc
                            | Cons1(x,xs) ->
                              let con_0'0 = Cons1[x,acc] in
                              let k [xs] app_67'20 = app_67'20 xs k in
                              loop con_0'0 k in
                          k lam_64'19) in
                        let con_69'7 = Nil0 in
                        let k [accWs,accCs] app_69'7 =
                          let k [accWs] x =
                            let uLET_0'0 = fun [x] y k ->
                              let con_0'0 = Cons1[x,y] in
                              k con_0'0 in
                            let k [] xs =
                              let loop = fix (fun [] loop acc k ->
                                let lam_64'19 = fun [acc,loop] xs k ->
                                  match xs with
                                  | Nil0 -> k acc
                                  | Cons1(x,xs) ->
                                    let con_0'0 = Cons1[x,acc] in
                                    let k [xs] app_67'20 = app_67'20 xs k in
                                    loop con_0'0 k in
                                k lam_64'19) in
                              let con_69'7 = Nil0 in
                              let k [xs] app_69'7 = app_69'7 xs k in
                              loop con_69'7 k in
                            uLET_0'0 accWs k in
                          app_69'7 accCs k in
                        loop con_69'7 k
                      | Cons1(x,xs) ->
                        let y = ' ' in
                        let uLET_0'0 = PRIM_EqChar(x,y) in
                        match uLET_0'0 with
                        | true1 ->
                          let loop = fix (fun [] loop acc k ->
                            let lam_64'19 = fun [acc,loop] xs k ->
                              match xs with
                              | Nil0 -> k acc
                              | Cons1(x,xs) ->
                                let con_0'0 = Cons1[x,acc] in
                                let k [xs] app_67'20 = app_67'20 xs k in
                                loop con_0'0 k in
                            k lam_64'19) in
                          let con_69'7 = Nil0 in
                          let k [accWs,loop,accCs,xs] app_69'7 =
                            let k [accWs,loop,xs] x =
                              let uLET_0'0 = fun [x] y k ->
                                let con_0'0 = Cons1[x,y] in
                                k con_0'0 in
                              let k [loop,xs] app_198'52 =
                                let k [xs] app_198'34 =
                                  let con_198'59 = Nil0 in
                                  let k [xs] app_198'59 = app_198'59 xs k in
                                  app_198'34 con_198'59 k in
                                loop app_198'52 k in
                              uLET_0'0 accWs k in
                            app_69'7 accCs k in
                          loop con_69'7 k
                        | false0 ->
                          let k [accCs,x,xs] app_199'17 =
                            let con_0'0 = Cons1[x,accCs] in
                            let k [xs] app_199'23 = app_199'23 xs k in
                            app_199'17 con_0'0 k in
                          loop accWs k in
                    k lam_193'27 in
                  k lam_193'21) in
                let con_201'7 = Nil0 in
                let k [eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop,xs] app_201'7 =
                  let con_201'10 = Nil0 in
                  let k [eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop,xs] app_201'10 =
                    let k [eq_list,append,map,length,put_chars,fib,fact,single_controlD,mainloop,xs] words =
                      let k [mainloop] _ =
                        let con_217'26 = Unit0 in
                        mainloop con_217'26 k in
                      match words with
                      | Nil0 ->
                        let con_206'10 = Unit0 in
                        k con_206'10
                      | Cons1(command,args) ->
                        let x = "fib" in
                        let b = PRIM_Explode(x) in
                        let lam_0'0 = fun [] x k ->
                          let lam_0'0 = fun [x] y k ->
                            let prim_0'0 = PRIM_EqChar(x,y) in
                            k prim_0'0 in
                          k lam_0'0 in
                        let k [eq_list,append,map,length,put_chars,fib,fact,single_controlD,xs,command,args,b] app_56'31 =
                          let k [eq_list,append,map,length,put_chars,fib,fact,single_controlD,xs,command,args,b] app_56'39 =
                            let k [eq_list,append,map,length,put_chars,fib,fact,single_controlD,xs,command,args] uLET_56'19 =
                              match uLET_56'19 with
                              | true1 ->
                                let s = "fib: " in
                                let prim_0'0 = PRIM_Explode(s) in
                                let k [put_chars,fib,args] _ =
                                  match args with
                                  | Nil0 ->
                                    let s = "expected an argument" in
                                    let s = "ERROR: " in
                                    let prim_0'0 = PRIM_Explode(s) in
                                    let k [put_chars,s] _ =
                                      let prim_0'0 = PRIM_Explode(s) in
                                      let k [] _ =
                                        let _ = Unit0 in
                                        let c = '\n' in
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
                                            let uLET_7'10 = PRIM_LessInt(b,n) in
                                            match uLET_7'10 with
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
                                                let lit_18'52 = 1 in
                                                let k [] x =
                                                  let x = PRIM_CharChr(x) in
                                                  let prim_0'0 = PRIM_PutChar(x) in
                                                  k prim_0'0 in
                                                uLET_0'0 lit_18'52 k in
                                              uLET_0'0 n k in
                                      put_chars prim_0'0 k in
                                    put_chars prim_0'0 k
                                  | Cons1(arg1,more) ->
                                    match more with
                                    | Cons1(_,_) ->
                                      let s = "expected exactly one argument" in
                                      let s = "ERROR: " in
                                      let prim_0'0 = PRIM_Explode(s) in
                                      let k [put_chars,s] _ =
                                        let prim_0'0 = PRIM_Explode(s) in
                                        let k [] _ =
                                          let _ = Unit0 in
                                          let c = '\n' in
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
                                              let uLET_7'10 = PRIM_LessInt(b,n) in
                                              match uLET_7'10 with
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
                                                  let lit_18'52 = 1 in
                                                  let k [] x =
                                                    let x = PRIM_CharChr(x) in
                                                    let prim_0'0 = PRIM_PutChar(x) in
                                                    k prim_0'0 in
                                                  uLET_0'0 lit_18'52 k in
                                                uLET_0'0 n k in
                                        put_chars prim_0'0 k in
                                      put_chars prim_0'0 k
                                    | Nil0 ->
                                      let loop = fix (fun [] loop acc k ->
                                        let lam_35'19 = fun [acc,loop] xs k ->
                                          match xs with
                                          | Nil0 ->
                                            let con_37'12 = Some0[acc] in
                                            k con_37'12
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
                                              let k [acc,loop,xs,n] uLET_9'11 =
                                                let k [acc,loop,xs] uLET_30'6 =
                                                  match uLET_30'6 with
                                                  | None1 ->
                                                    let con_40'18 = None1 in
                                                    k con_40'18
                                                  | Some0(d) ->
                                                    let x = 10 in
                                                    let uLET_0'0 = fun [x] y k ->
                                                      let prim_0'0 = PRIM_MulInt(x,y) in
                                                      k prim_0'0 in
                                                    let k [loop,xs,d] x =
                                                      let uLET_0'0 = fun [x] y k ->
                                                        let prim_0'0 = PRIM_AddInt(x,y) in
                                                        k prim_0'0 in
                                                      let k [loop,xs] app_41'37 =
                                                        let k [xs] app_41'25 = app_41'25 xs k in
                                                        loop app_41'37 k in
                                                      uLET_0'0 d k in
                                                    uLET_0'0 acc k in
                                                match uLET_9'11 with
                                                | true1 ->
                                                  let b = 9 in
                                                  let b = PRIM_LessInt(b,n) in
                                                  let k [n] uLET_8'11 =
                                                    match uLET_8'11 with
                                                    | true1 ->
                                                      let con_32'32 = Some0[n] in
                                                      k con_32'32
                                                    | false0 ->
                                                      let con_32'45 = None1 in
                                                      k con_32'45 in
                                                  match b with
                                                  | true1 ->
                                                    let con_4'12 = false0 in
                                                    k con_4'12
                                                  | false0 ->
                                                    let con_5'13 = true1 in
                                                    k con_5'13
                                                | false0 ->
                                                  let con_32'55 = None1 in
                                                  k con_32'55 in
                                              match b with
                                              | true1 ->
                                                let con_4'12 = false0 in
                                                k con_4'12
                                              | false0 ->
                                                let con_5'13 = true1 in
                                                k con_5'13 in
                                            uLET_0'0 uLET_0'0 k in
                                        k lam_35'19) in
                                      let lit_43'7 = 0 in
                                      let k [put_chars,fib,arg1] app_43'7 =
                                        let k [put_chars,fib] uLET_35'10 =
                                          match uLET_35'10 with
                                          | None1 ->
                                            let s = "expected arg1 to be numeric" in
                                            let s = "ERROR: " in
                                            let prim_0'0 = PRIM_Explode(s) in
                                            let k [put_chars,s] _ =
                                              let prim_0'0 = PRIM_Explode(s) in
                                              let k [] _ =
                                                let _ = Unit0 in
                                                let c = '\n' in
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
                                                    let uLET_7'10 = PRIM_LessInt(b,n) in
                                                    match uLET_7'10 with
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
                                                        let lit_18'52 = 1 in
                                                        let k [] x =
                                                          let x = PRIM_CharChr(x) in
                                                          let prim_0'0 = PRIM_PutChar(x) in
                                                          k prim_0'0 in
                                                        uLET_0'0 lit_18'52 k in
                                                      uLET_0'0 n k in
                                              put_chars prim_0'0 k in
                                            put_chars prim_0'0 k
                                          | Some0(n) ->
                                            let k [put_chars,n] res =
                                              let x = '0' in
                                              let ord0 = PRIM_CharOrd(x) in
                                              let loop = fix (fun [ord0] loop acc k ->
                                                let lam_84'19 = fun [ord0,acc,loop] i k ->
                                                  let y = 0 in
                                                  let uLET_0'0 = PRIM_EqInt(i,y) in
                                                  match uLET_0'0 with
                                                  | true1 -> k acc
                                                  | false0 ->
                                                    let y = 10 in
                                                    let c = PRIM_ModInt(i,y) in
                                                    let x = PRIM_AddInt(ord0,c) in
                                                    let x = PRIM_CharChr(x) in
                                                    let uLET_45'9 = fun [x] xs k ->
                                                      let con_0'0 = Cons1[x,xs] in
                                                      k con_0'0 in
                                                    let k [loop,i] app_86'40 =
                                                      let k [i] app_86'11 =
                                                        let y = 10 in
                                                        let uLET_0'0 = PRIM_DivInt(i,y) in
                                                        app_86'11 uLET_0'0 k in
                                                      loop app_86'40 k in
                                                    uLET_45'9 acc k in
                                                k lam_84'19) in
                                              let y = 0 in
                                              let uLET_0'0 = PRIM_EqInt(n,y) in
                                              let k [put_chars,res] uLET_82'6 =
                                                let k [put_chars,res] _ =
                                                  let s = " --> " in
                                                  let prim_0'0 = PRIM_Explode(s) in
                                                  let k [put_chars,res] _ =
                                                    let x = '0' in
                                                    let ord0 = PRIM_CharOrd(x) in
                                                    let loop = fix (fun [ord0] loop acc k ->
                                                      let lam_84'19 = fun [ord0,acc,loop] i k ->
                                                        let y = 0 in
                                                        let uLET_0'0 = PRIM_EqInt(i,y) in
                                                        match uLET_0'0 with
                                                        | true1 -> k acc
                                                        | false0 ->
                                                          let y = 10 in
                                                          let c = PRIM_ModInt(i,y) in
                                                          let x = PRIM_AddInt(ord0,c) in
                                                          let x = PRIM_CharChr(x) in
                                                          let uLET_45'9 = fun [x] xs k ->
                                                            let con_0'0 = Cons1[x,xs] in
                                                            k con_0'0 in
                                                          let k [loop,i] app_86'40 =
                                                            let k [i] app_86'11 =
                                                              let y = 10 in
                                                              let uLET_0'0 = PRIM_DivInt(i,y) in
                                                              app_86'11 uLET_0'0 k in
                                                            loop app_86'40 k in
                                                          uLET_45'9 acc k in
                                                      k lam_84'19) in
                                                    let y = 0 in
                                                    let uLET_0'0 = PRIM_EqInt(res,y) in
                                                    let k [put_chars] uLET_82'6 =
                                                      let k [] _ =
                                                        let _ = Unit0 in
                                                        let c = '\n' in
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
                                                            let uLET_7'10 = PRIM_LessInt(b,n) in
                                                            match uLET_7'10 with
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
                                                                let lit_18'52 = 1 in
                                                                let k [] x =
                                                                  let x = PRIM_CharChr(x) in
                                                                  let prim_0'0 = PRIM_PutChar(x) in
                                                                  k prim_0'0 in
                                                                uLET_0'0 lit_18'52 k in
                                                              uLET_0'0 n k in
                                                      put_chars uLET_82'6 k in
                                                    match uLET_0'0 with
                                                    | true1 ->
                                                      let x = '0' in
                                                      let uLET_45'9 = fun [x] xs k ->
                                                        let con_0'0 = Cons1[x,xs] in
                                                        k con_0'0 in
                                                      let con_88'25 = Nil0 in
                                                      uLET_45'9 con_88'25 k
                                                    | false0 ->
                                                      let con_88'38 = Nil0 in
                                                      let k [res] app_88'38 = app_88'38 res k in
                                                      loop con_88'38 k in
                                                  put_chars prim_0'0 k in
                                                put_chars uLET_82'6 k in
                                              match uLET_0'0 with
                                              | true1 ->
                                                let x = '0' in
                                                let uLET_45'9 = fun [x] xs k ->
                                                  let con_0'0 = Cons1[x,xs] in
                                                  k con_0'0 in
                                                let con_88'25 = Nil0 in
                                                uLET_45'9 con_88'25 k
                                              | false0 ->
                                                let con_88'38 = Nil0 in
                                                let k [n] app_88'38 = app_88'38 n k in
                                                loop con_88'38 k in
                                            fib n k in
                                        app_43'7 arg1 k in
                                      loop lit_43'7 k in
                                put_chars prim_0'0 k
                              | false0 ->
                                let x = "fact" in
                                let b = PRIM_Explode(x) in
                                let lam_0'0 = fun [] x k ->
                                  let lam_0'0 = fun [x] y k ->
                                    let prim_0'0 = PRIM_EqChar(x,y) in
                                    k prim_0'0 in
                                  k lam_0'0 in
                                let k [eq_list,append,map,length,put_chars,fact,single_controlD,xs,command,args,b] app_56'31 =
                                  let k [eq_list,append,map,length,put_chars,fact,single_controlD,xs,command,args,b] app_56'39 =
                                    let k [eq_list,append,map,length,put_chars,fact,single_controlD,xs,command,args] uLET_56'19 =
                                      match uLET_56'19 with
                                      | true1 ->
                                        let s = "fact: " in
                                        let prim_0'0 = PRIM_Explode(s) in
                                        let k [put_chars,fact,args] _ =
                                          match args with
                                          | Nil0 ->
                                            let s = "expected an argument" in
                                            let s = "ERROR: " in
                                            let prim_0'0 = PRIM_Explode(s) in
                                            let k [put_chars,s] _ =
                                              let prim_0'0 = PRIM_Explode(s) in
                                              let k [] _ =
                                                let _ = Unit0 in
                                                let c = '\n' in
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
                                                    let uLET_7'10 = PRIM_LessInt(b,n) in
                                                    match uLET_7'10 with
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
                                                        let lit_18'52 = 1 in
                                                        let k [] x =
                                                          let x = PRIM_CharChr(x) in
                                                          let prim_0'0 = PRIM_PutChar(x) in
                                                          k prim_0'0 in
                                                        uLET_0'0 lit_18'52 k in
                                                      uLET_0'0 n k in
                                              put_chars prim_0'0 k in
                                            put_chars prim_0'0 k
                                          | Cons1(arg1,more) ->
                                            match more with
                                            | Cons1(_,_) ->
                                              let s = "expected exactly one argument" in
                                              let s = "ERROR: " in
                                              let prim_0'0 = PRIM_Explode(s) in
                                              let k [put_chars,s] _ =
                                                let prim_0'0 = PRIM_Explode(s) in
                                                let k [] _ =
                                                  let _ = Unit0 in
                                                  let c = '\n' in
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
                                                      let uLET_7'10 = PRIM_LessInt(b,n) in
                                                      match uLET_7'10 with
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
                                                          let lit_18'52 = 1 in
                                                          let k [] x =
                                                            let x = PRIM_CharChr(x) in
                                                            let prim_0'0 = PRIM_PutChar(x) in
                                                            k prim_0'0 in
                                                          uLET_0'0 lit_18'52 k in
                                                        uLET_0'0 n k in
                                                put_chars prim_0'0 k in
                                              put_chars prim_0'0 k
                                            | Nil0 ->
                                              let loop = fix (fun [] loop acc k ->
                                                let lam_35'19 = fun [acc,loop] xs k ->
                                                  match xs with
                                                  | Nil0 ->
                                                    let con_37'12 = Some0[acc] in
                                                    k con_37'12
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
                                                      let k [acc,loop,xs,n] uLET_9'11 =
                                                        let k [acc,loop,xs] uLET_30'6 =
                                                          match uLET_30'6 with
                                                          | None1 ->
                                                            let con_40'18 = None1 in
                                                            k con_40'18
                                                          | Some0(d) ->
                                                            let x = 10 in
                                                            let uLET_0'0 = fun [x] y k ->
                                                              let prim_0'0 = PRIM_MulInt(x,y) in
                                                              k prim_0'0 in
                                                            let k [loop,xs,d] x =
                                                              let uLET_0'0 = fun [x] y k ->
                                                                let prim_0'0 = PRIM_AddInt(x,y) in
                                                                k prim_0'0 in
                                                              let k [loop,xs] app_41'37 =
                                                                let k [xs] app_41'25 = app_41'25 xs k in
                                                                loop app_41'37 k in
                                                              uLET_0'0 d k in
                                                            uLET_0'0 acc k in
                                                        match uLET_9'11 with
                                                        | true1 ->
                                                          let b = 9 in
                                                          let b = PRIM_LessInt(b,n) in
                                                          let k [n] uLET_8'11 =
                                                            match uLET_8'11 with
                                                            | true1 ->
                                                              let con_32'32 = Some0[n] in
                                                              k con_32'32
                                                            | false0 ->
                                                              let con_32'45 = None1 in
                                                              k con_32'45 in
                                                          match b with
                                                          | true1 ->
                                                            let con_4'12 = false0 in
                                                            k con_4'12
                                                          | false0 ->
                                                            let con_5'13 = true1 in
                                                            k con_5'13
                                                        | false0 ->
                                                          let con_32'55 = None1 in
                                                          k con_32'55 in
                                                      match b with
                                                      | true1 ->
                                                        let con_4'12 = false0 in
                                                        k con_4'12
                                                      | false0 ->
                                                        let con_5'13 = true1 in
                                                        k con_5'13 in
                                                    uLET_0'0 uLET_0'0 k in
                                                k lam_35'19) in
                                              let lit_43'7 = 0 in
                                              let k [put_chars,fact,arg1] app_43'7 =
                                                let k [put_chars,fact] uLET_35'10 =
                                                  match uLET_35'10 with
                                                  | None1 ->
                                                    let s = "expected arg1 to be numeric" in
                                                    let s = "ERROR: " in
                                                    let prim_0'0 = PRIM_Explode(s) in
                                                    let k [put_chars,s] _ =
                                                      let prim_0'0 = PRIM_Explode(s) in
                                                      let k [] _ =
                                                        let _ = Unit0 in
                                                        let c = '\n' in
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
                                                            let uLET_7'10 = PRIM_LessInt(b,n) in
                                                            match uLET_7'10 with
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
                                                                let lit_18'52 = 1 in
                                                                let k [] x =
                                                                  let x = PRIM_CharChr(x) in
                                                                  let prim_0'0 = PRIM_PutChar(x) in
                                                                  k prim_0'0 in
                                                                uLET_0'0 lit_18'52 k in
                                                              uLET_0'0 n k in
                                                      put_chars prim_0'0 k in
                                                    put_chars prim_0'0 k
                                                  | Some0(n) ->
                                                    let k [put_chars,n] res =
                                                      let x = '0' in
                                                      let ord0 = PRIM_CharOrd(x) in
                                                      let loop = fix (fun [ord0] loop acc k ->
                                                        let lam_84'19 = fun [ord0,acc,loop] i k ->
                                                          let y = 0 in
                                                          let uLET_0'0 = PRIM_EqInt(i,y) in
                                                          match uLET_0'0 with
                                                          | true1 -> k acc
                                                          | false0 ->
                                                            let y = 10 in
                                                            let c = PRIM_ModInt(i,y) in
                                                            let x = PRIM_AddInt(ord0,c) in
                                                            let x = PRIM_CharChr(x) in
                                                            let uLET_45'9 = fun [x] xs k ->
                                                              let con_0'0 = Cons1[x,xs] in
                                                              k con_0'0 in
                                                            let k [loop,i] app_86'40 =
                                                              let k [i] app_86'11 =
                                                                let y = 10 in
                                                                let uLET_0'0 = PRIM_DivInt(i,y) in
                                                                app_86'11 uLET_0'0 k in
                                                              loop app_86'40 k in
                                                            uLET_45'9 acc k in
                                                        k lam_84'19) in
                                                      let y = 0 in
                                                      let uLET_0'0 = PRIM_EqInt(n,y) in
                                                      let k [put_chars,res] uLET_82'6 =
                                                        let k [put_chars,res] _ =
                                                          let s = " --> " in
                                                          let prim_0'0 = PRIM_Explode(s) in
                                                          let k [put_chars,res] _ =
                                                            let x = '0' in
                                                            let ord0 = PRIM_CharOrd(x) in
                                                            let loop = fix (fun [ord0] loop acc k ->
                                                              let lam_84'19 = fun [ord0,acc,loop] i k ->
                                                                let y = 0 in
                                                                let uLET_0'0 = PRIM_EqInt(i,y) in
                                                                match uLET_0'0 with
                                                                | true1 -> k acc
                                                                | false0 ->
                                                                  let y = 10 in
                                                                  let c = PRIM_ModInt(i,y) in
                                                                  let x = PRIM_AddInt(ord0,c) in
                                                                  let x = PRIM_CharChr(x) in
                                                                  let uLET_45'9 = fun [x] xs k ->
                                                                    let con_0'0 = Cons1[x,xs] in
                                                                    k con_0'0 in
                                                                  let k [loop,i] app_86'40 =
                                                                    let k [i] app_86'11 =
                                                                      let y = 10 in
                                                                      let uLET_0'0 = PRIM_DivInt(i,y) in
                                                                      app_86'11 uLET_0'0 k in
                                                                    loop app_86'40 k in
                                                                  uLET_45'9 acc k in
                                                              k lam_84'19) in
                                                            let y = 0 in
                                                            let uLET_0'0 = PRIM_EqInt(res,y) in
                                                            let k [put_chars] uLET_82'6 =
                                                              let k [] _ =
                                                                let _ = Unit0 in
                                                                let c = '\n' in
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
                                                                    let uLET_7'10 = PRIM_LessInt(b,n) in
                                                                    match uLET_7'10 with
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
                                                                        let lit_18'52 = 1 in
                                                                        let k [] x =
                                                                          let x = PRIM_CharChr(x) in
                                                                          let prim_0'0 = PRIM_PutChar(x) in
                                                                          k prim_0'0 in
                                                                        uLET_0'0 lit_18'52 k in
                                                                      uLET_0'0 n k in
                                                              put_chars uLET_82'6 k in
                                                            match uLET_0'0 with
                                                            | true1 ->
                                                              let x = '0' in
                                                              let uLET_45'9 = fun [x] xs k ->
                                                                let con_0'0 = Cons1[x,xs] in
                                                                k con_0'0 in
                                                              let con_88'25 = Nil0 in
                                                              uLET_45'9 con_88'25 k
                                                            | false0 ->
                                                              let con_88'38 = Nil0 in
                                                              let k [res] app_88'38 = app_88'38 res k in
                                                              loop con_88'38 k in
                                                          put_chars prim_0'0 k in
                                                        put_chars uLET_82'6 k in
                                                      match uLET_0'0 with
                                                      | true1 ->
                                                        let x = '0' in
                                                        let uLET_45'9 = fun [x] xs k ->
                                                          let con_0'0 = Cons1[x,xs] in
                                                          k con_0'0 in
                                                        let con_88'25 = Nil0 in
                                                        uLET_45'9 con_88'25 k
                                                      | false0 ->
                                                        let con_88'38 = Nil0 in
                                                        let k [n] app_88'38 = app_88'38 n k in
                                                        loop con_88'38 k in
                                                    fact n k in
                                                app_43'7 arg1 k in
                                              loop lit_43'7 k in
                                        put_chars prim_0'0 k
                                      | false0 ->
                                        let x = "rev" in
                                        let b = PRIM_Explode(x) in
                                        let lam_0'0 = fun [] x k ->
                                          let lam_0'0 = fun [x] y k ->
                                            let prim_0'0 = PRIM_EqChar(x,y) in
                                            k prim_0'0 in
                                          k lam_0'0 in
                                        let k [eq_list,append,map,length,put_chars,single_controlD,xs,command,args,b] app_56'31 =
                                          let k [eq_list,append,map,length,put_chars,single_controlD,xs,args,b] app_56'39 =
                                            let k [eq_list,append,map,length,put_chars,single_controlD,xs,args] uLET_56'19 =
                                              match uLET_56'19 with
                                              | true1 ->
                                                match args with
                                                | Cons1(_,_) ->
                                                  let s = "rev: expected no arguments" in
                                                  let s = "ERROR: " in
                                                  let prim_0'0 = PRIM_Explode(s) in
                                                  let k [put_chars,s] _ =
                                                    let prim_0'0 = PRIM_Explode(s) in
                                                    let k [] _ =
                                                      let _ = Unit0 in
                                                      let c = '\n' in
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
                                                          let uLET_7'10 = PRIM_LessInt(b,n) in
                                                          match uLET_7'10 with
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
                                                              let lit_18'52 = 1 in
                                                              let k [] x =
                                                                let x = PRIM_CharChr(x) in
                                                                let prim_0'0 = PRIM_PutChar(x) in
                                                                k prim_0'0 in
                                                              uLET_0'0 lit_18'52 k in
                                                            uLET_0'0 n k in
                                                    put_chars prim_0'0 k in
                                                  put_chars prim_0'0 k
                                                | Nil0 ->
                                                  let s = "(reverse typed lines until ^D)\n" in
                                                  let prim_0'0 = PRIM_Explode(s) in
                                                  let k [eq_list,put_chars,single_controlD] _ =
                                                    let _ = Unit0 in
                                                    let loop = fix (fun [eq_list,put_chars,single_controlD] loop _ k ->
                                                      let _ = Unit0 in
                                                      let x = 4 in
                                                      let controlD = PRIM_CharChr(x) in
                                                      let loop = fix (fun [controlD] loop acc k ->
                                                        let x = Unit0 in
                                                        let c = PRIM_GetChar(x) in
                                                        let n = PRIM_CharOrd(c) in
                                                        let y = '\n' in
                                                        let uLET_0'0 = PRIM_EqChar(c,y) in
                                                        match uLET_0'0 with
                                                        | true1 ->
                                                          let _ = Unit0 in
                                                          let c = '\n' in
                                                          let backspace = 8 in
                                                          let n = PRIM_CharOrd(c) in
                                                          let prim_0'0 = PRIM_EqInt(n,backspace) in
                                                          let k [acc] _ =
                                                            let loop = fix (fun [] loop acc k ->
                                                              let lam_64'19 = fun [acc,loop] xs k ->
                                                                match xs with
                                                                | Nil0 -> k acc
                                                                | Cons1(x,xs) ->
                                                                  let con_0'0 = Cons1[x,acc] in
                                                                  let k [xs] app_67'20 = app_67'20 xs k in
                                                                  loop con_0'0 k in
                                                              k lam_64'19) in
                                                            let con_69'7 = Nil0 in
                                                            let k [acc] app_69'7 = app_69'7 acc k in
                                                            loop con_69'7 k in
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
                                                              let uLET_7'10 = PRIM_LessInt(b,n) in
                                                              match uLET_7'10 with
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
                                                                  let lit_18'52 = 1 in
                                                                  let k [] x =
                                                                    let x = PRIM_CharChr(x) in
                                                                    let prim_0'0 = PRIM_PutChar(x) in
                                                                    k prim_0'0 in
                                                                  uLET_0'0 lit_18'52 k in
                                                                uLET_0'0 n k
                                                        | false0 ->
                                                          let prim_0'0 = PRIM_EqChar(c,controlD) in
                                                          match prim_0'0 with
                                                          | true1 ->
                                                            let backspace = 8 in
                                                            let n = PRIM_CharOrd(c) in
                                                            let prim_0'0 = PRIM_EqInt(n,backspace) in
                                                            let k [controlD,acc] _ =
                                                              let _ = Unit0 in
                                                              let c = '\n' in
                                                              let backspace = 8 in
                                                              let n = PRIM_CharOrd(c) in
                                                              let prim_0'0 = PRIM_EqInt(n,backspace) in
                                                              let k [controlD,acc] _ =
                                                                let xs = Cons1[controlD,acc] in
                                                                let loop = fix (fun [] loop acc k ->
                                                                  let lam_64'19 = fun [acc,loop] xs k ->
                                                                    match xs with
                                                                    | Nil0 -> k acc
                                                                    | Cons1(x,xs) ->
                                                                      let con_0'0 = Cons1[x,acc] in
                                                                      let k [xs] app_67'20 = app_67'20 xs k in
                                                                      loop con_0'0 k in
                                                                  k lam_64'19) in
                                                                let con_69'7 = Nil0 in
                                                                let k [xs] app_69'7 = app_69'7 xs k in
                                                                loop con_69'7 k in
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
                                                                  let uLET_7'10 = PRIM_LessInt(b,n) in
                                                                  match uLET_7'10 with
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
                                                                      let lit_18'52 = 1 in
                                                                      let k [] x =
                                                                        let x = PRIM_CharChr(x) in
                                                                        let prim_0'0 = PRIM_PutChar(x) in
                                                                        k prim_0'0 in
                                                                      uLET_0'0 lit_18'52 k in
                                                                    uLET_0'0 n k in
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
                                                                let uLET_7'10 = PRIM_LessInt(b,n) in
                                                                match uLET_7'10 with
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
                                                                    let lit_18'52 = 1 in
                                                                    let k [] x =
                                                                      let x = PRIM_CharChr(x) in
                                                                      let prim_0'0 = PRIM_PutChar(x) in
                                                                      k prim_0'0 in
                                                                    uLET_0'0 lit_18'52 k in
                                                                  uLET_0'0 n k
                                                          | false0 ->
                                                            let b = 127 in
                                                            let uLET_7'10 = PRIM_LessInt(b,n) in
                                                            match uLET_7'10 with
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
                                                                  let uLET_8'9 = fun [a] b k ->
                                                                    let b = PRIM_LessInt(b,a) in
                                                                    match b with
                                                                    | true1 ->
                                                                      let con_4'12 = false0 in
                                                                      k con_4'12
                                                                    | false0 ->
                                                                      let con_5'13 = true1 in
                                                                      k con_5'13 in
                                                                  let lit_113'28 = 26 in
                                                                  let k [loop,tail] app_113'28 =
                                                                    let k [loop,tail] _ =
                                                                      let _ = Unit0 in
                                                                      let x = 8 in
                                                                      let backspace = PRIM_CharChr(x) in
                                                                      let backspace = 8 in
                                                                      let n = PRIM_CharOrd(backspace) in
                                                                      let prim_0'0 = PRIM_EqInt(n,backspace) in
                                                                      let k [loop,tail,backspace] _ =
                                                                        let c = ' ' in
                                                                        let backspace = 8 in
                                                                        let n = PRIM_CharOrd(c) in
                                                                        let prim_0'0 = PRIM_EqInt(n,backspace) in
                                                                        let k [loop,tail,backspace] _ =
                                                                          let backspace = 8 in
                                                                          let n = PRIM_CharOrd(backspace) in
                                                                          let prim_0'0 = PRIM_EqInt(n,backspace) in
                                                                          let k [loop,tail] _ = loop tail k in
                                                                          match prim_0'0 with
                                                                          | true1 ->
                                                                            let prim_0'0 = PRIM_PutChar(backspace) in
                                                                            k prim_0'0
                                                                          | false0 ->
                                                                            let y = '\n' in
                                                                            let uLET_0'0 = PRIM_EqChar(backspace,y) in
                                                                            match uLET_0'0 with
                                                                            | true1 ->
                                                                              let prim_0'0 = PRIM_PutChar(backspace) in
                                                                              k prim_0'0
                                                                            | false0 ->
                                                                              let b = 26 in
                                                                              let uLET_7'10 = PRIM_LessInt(b,n) in
                                                                              match uLET_7'10 with
                                                                              | true1 ->
                                                                                let prim_0'0 = PRIM_PutChar(backspace) in
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
                                                                                  let lit_18'52 = 1 in
                                                                                  let k [] x =
                                                                                    let x = PRIM_CharChr(x) in
                                                                                    let prim_0'0 = PRIM_PutChar(x) in
                                                                                    k prim_0'0 in
                                                                                  uLET_0'0 lit_18'52 k in
                                                                                uLET_0'0 n k in
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
                                                                            let uLET_7'10 = PRIM_LessInt(b,n) in
                                                                            match uLET_7'10 with
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
                                                                                let lit_18'52 = 1 in
                                                                                let k [] x =
                                                                                  let x = PRIM_CharChr(x) in
                                                                                  let prim_0'0 = PRIM_PutChar(x) in
                                                                                  k prim_0'0 in
                                                                                uLET_0'0 lit_18'52 k in
                                                                              uLET_0'0 n k in
                                                                      match prim_0'0 with
                                                                      | true1 ->
                                                                        let prim_0'0 = PRIM_PutChar(backspace) in
                                                                        k prim_0'0
                                                                      | false0 ->
                                                                        let y = '\n' in
                                                                        let uLET_0'0 = PRIM_EqChar(backspace,y) in
                                                                        match uLET_0'0 with
                                                                        | true1 ->
                                                                          let prim_0'0 = PRIM_PutChar(backspace) in
                                                                          k prim_0'0
                                                                        | false0 ->
                                                                          let b = 26 in
                                                                          let uLET_7'10 = PRIM_LessInt(b,n) in
                                                                          match uLET_7'10 with
                                                                          | true1 ->
                                                                            let prim_0'0 = PRIM_PutChar(backspace) in
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
                                                                              let lit_18'52 = 1 in
                                                                              let k [] x =
                                                                                let x = PRIM_CharChr(x) in
                                                                                let prim_0'0 = PRIM_PutChar(x) in
                                                                                k prim_0'0 in
                                                                              uLET_0'0 lit_18'52 k in
                                                                            uLET_0'0 n k in
                                                                    match app_113'28 with
                                                                    | true1 ->
                                                                      let _ = Unit0 in
                                                                      let x = 8 in
                                                                      let backspace = PRIM_CharChr(x) in
                                                                      let backspace = 8 in
                                                                      let n = PRIM_CharOrd(backspace) in
                                                                      let prim_0'0 = PRIM_EqInt(n,backspace) in
                                                                      let k [backspace] _ =
                                                                        let c = ' ' in
                                                                        let backspace = 8 in
                                                                        let n = PRIM_CharOrd(c) in
                                                                        let prim_0'0 = PRIM_EqInt(n,backspace) in
                                                                        let k [backspace] _ =
                                                                          let backspace = 8 in
                                                                          let n = PRIM_CharOrd(backspace) in
                                                                          let prim_0'0 = PRIM_EqInt(n,backspace) in
                                                                          match prim_0'0 with
                                                                          | true1 ->
                                                                            let prim_0'0 = PRIM_PutChar(backspace) in
                                                                            k prim_0'0
                                                                          | false0 ->
                                                                            let y = '\n' in
                                                                            let uLET_0'0 = PRIM_EqChar(backspace,y) in
                                                                            match uLET_0'0 with
                                                                            | true1 ->
                                                                              let prim_0'0 = PRIM_PutChar(backspace) in
                                                                              k prim_0'0
                                                                            | false0 ->
                                                                              let b = 26 in
                                                                              let uLET_7'10 = PRIM_LessInt(b,n) in
                                                                              match uLET_7'10 with
                                                                              | true1 ->
                                                                                let prim_0'0 = PRIM_PutChar(backspace) in
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
                                                                                  let lit_18'52 = 1 in
                                                                                  let k [] x =
                                                                                    let x = PRIM_CharChr(x) in
                                                                                    let prim_0'0 = PRIM_PutChar(x) in
                                                                                    k prim_0'0 in
                                                                                  uLET_0'0 lit_18'52 k in
                                                                                uLET_0'0 n k in
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
                                                                            let uLET_7'10 = PRIM_LessInt(b,n) in
                                                                            match uLET_7'10 with
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
                                                                                let lit_18'52 = 1 in
                                                                                let k [] x =
                                                                                  let x = PRIM_CharChr(x) in
                                                                                  let prim_0'0 = PRIM_PutChar(x) in
                                                                                  k prim_0'0 in
                                                                                uLET_0'0 lit_18'52 k in
                                                                              uLET_0'0 n k in
                                                                      match prim_0'0 with
                                                                      | true1 ->
                                                                        let prim_0'0 = PRIM_PutChar(backspace) in
                                                                        k prim_0'0
                                                                      | false0 ->
                                                                        let y = '\n' in
                                                                        let uLET_0'0 = PRIM_EqChar(backspace,y) in
                                                                        match uLET_0'0 with
                                                                        | true1 ->
                                                                          let prim_0'0 = PRIM_PutChar(backspace) in
                                                                          k prim_0'0
                                                                        | false0 ->
                                                                          let b = 26 in
                                                                          let uLET_7'10 = PRIM_LessInt(b,n) in
                                                                          match uLET_7'10 with
                                                                          | true1 ->
                                                                            let prim_0'0 = PRIM_PutChar(backspace) in
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
                                                                              let lit_18'52 = 1 in
                                                                              let k [] x =
                                                                                let x = PRIM_CharChr(x) in
                                                                                let prim_0'0 = PRIM_PutChar(x) in
                                                                                k prim_0'0 in
                                                                              uLET_0'0 lit_18'52 k in
                                                                            uLET_0'0 n k
                                                                    | false0 ->
                                                                      let con_113'55 = Unit0 in
                                                                      k con_113'55 in
                                                                  uLET_8'9 lit_113'28 k
                                                              | false0 ->
                                                                let backspace = 8 in
                                                                let n = PRIM_CharOrd(c) in
                                                                let prim_0'0 = PRIM_EqInt(n,backspace) in
                                                                let k [acc,loop,c] _ =
                                                                  let con_0'0 = Cons1[c,acc] in
                                                                  loop con_0'0 k in
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
                                                                    let uLET_7'10 = PRIM_LessInt(b,n) in
                                                                    match uLET_7'10 with
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
                                                                        let lit_18'52 = 1 in
                                                                        let k [] x =
                                                                          let x = PRIM_CharChr(x) in
                                                                          let prim_0'0 = PRIM_PutChar(x) in
                                                                          k prim_0'0 in
                                                                        uLET_0'0 lit_18'52 k in
                                                                      uLET_0'0 n k) in
                                                      let con_119'7 = Nil0 in
                                                      let k [eq_list,put_chars,single_controlD,loop] xs =
                                                        let lam_0'0 = fun [] x k ->
                                                          let lam_0'0 = fun [x] y k ->
                                                            let prim_0'0 = PRIM_EqChar(x,y) in
                                                            k prim_0'0 in
                                                          k lam_0'0 in
                                                        let k [put_chars,single_controlD,loop,xs] app_56'31 =
                                                          let k [put_chars,single_controlD,loop,xs] app_56'39 =
                                                            let k [put_chars,loop,xs] app_56'41 =
                                                              match app_56'41 with
                                                              | true1 ->
                                                                let con_171'44 = Unit0 in
                                                                k con_171'44
                                                              | false0 ->
                                                                let loop = fix (fun [] loop acc k ->
                                                                  let lam_64'19 = fun [acc,loop] xs k ->
                                                                    match xs with
                                                                    | Nil0 -> k acc
                                                                    | Cons1(x,xs) ->
                                                                      let con_0'0 = Cons1[x,acc] in
                                                                      let k [xs] app_67'20 = app_67'20 xs k in
                                                                      loop con_0'0 k in
                                                                  k lam_64'19) in
                                                                let con_69'7 = Nil0 in
                                                                let k [put_chars,loop,xs] app_69'7 =
                                                                  let k [put_chars,loop] uLET_64'10 =
                                                                    let k [loop] _ =
                                                                      let _ = Unit0 in
                                                                      let c = '\n' in
                                                                      let backspace = 8 in
                                                                      let n = PRIM_CharOrd(c) in
                                                                      let prim_0'0 = PRIM_EqInt(n,backspace) in
                                                                      let k [loop] _ =
                                                                        let con_172'46 = Unit0 in
                                                                        loop con_172'46 k in
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
                                                                          let uLET_7'10 = PRIM_LessInt(b,n) in
                                                                          match uLET_7'10 with
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
                                                                              let lit_18'52 = 1 in
                                                                              let k [] x =
                                                                                let x = PRIM_CharChr(x) in
                                                                                let prim_0'0 = PRIM_PutChar(x) in
                                                                                k prim_0'0 in
                                                                              uLET_0'0 lit_18'52 k in
                                                                            uLET_0'0 n k in
                                                                    put_chars uLET_64'10 k in
                                                                  app_69'7 xs k in
                                                                loop con_69'7 k in
                                                            app_56'39 single_controlD k in
                                                          app_56'31 xs k in
                                                        eq_list lam_0'0 k in
                                                      loop con_119'7 k) in
                                                    let con_174'6 = Unit0 in
                                                    loop con_174'6 k in
                                                  put_chars prim_0'0 k
                                              | false0 ->
                                                let lam_184'30 = fun [] c k ->
                                                  let y = 'o' in
                                                  let uLET_0'0 = PRIM_EqChar(c,y) in
                                                  match uLET_0'0 with
                                                  | true1 ->
                                                    let lit_184'57 = '*' in
                                                    k lit_184'57
                                                  | false0 -> k c in
                                                let k [append,length,put_chars,xs] star_the_ohs =
                                                  let k [append,put_chars,xs,star_the_ohs] n =
                                                    let x = "You wrote: \"" in
                                                    let uLET_0'0 = PRIM_Explode(x) in
                                                    let k [put_chars,xs,star_the_ohs,n] app_186'20 =
                                                      let k [put_chars,app_186'20,n] app_186'60 =
                                                        let k [put_chars,n] app_186'46 =
                                                          let k [put_chars,n] _ =
                                                            let s = "\" (" in
                                                            let prim_0'0 = PRIM_Explode(s) in
                                                            let k [put_chars,n] _ =
                                                              let x = '0' in
                                                              let ord0 = PRIM_CharOrd(x) in
                                                              let loop = fix (fun [ord0] loop acc k ->
                                                                let lam_84'19 = fun [ord0,acc,loop] i k ->
                                                                  let y = 0 in
                                                                  let uLET_0'0 = PRIM_EqInt(i,y) in
                                                                  match uLET_0'0 with
                                                                  | true1 -> k acc
                                                                  | false0 ->
                                                                    let y = 10 in
                                                                    let c = PRIM_ModInt(i,y) in
                                                                    let x = PRIM_AddInt(ord0,c) in
                                                                    let x = PRIM_CharChr(x) in
                                                                    let uLET_45'9 = fun [x] xs k ->
                                                                      let con_0'0 = Cons1[x,xs] in
                                                                      k con_0'0 in
                                                                    let k [loop,i] app_86'40 =
                                                                      let k [i] app_86'11 =
                                                                        let y = 10 in
                                                                        let uLET_0'0 = PRIM_DivInt(i,y) in
                                                                        app_86'11 uLET_0'0 k in
                                                                      loop app_86'40 k in
                                                                    uLET_45'9 acc k in
                                                                k lam_84'19) in
                                                              let y = 0 in
                                                              let uLET_0'0 = PRIM_EqInt(n,y) in
                                                              let k [put_chars] uLET_82'6 =
                                                                let k [put_chars] _ =
                                                                  let s = " chars)" in
                                                                  let prim_0'0 = PRIM_Explode(s) in
                                                                  let k [] _ =
                                                                    let _ = Unit0 in
                                                                    let c = '\n' in
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
                                                                        let uLET_7'10 = PRIM_LessInt(b,n) in
                                                                        match uLET_7'10 with
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
                                                                            let lit_18'52 = 1 in
                                                                            let k [] x =
                                                                              let x = PRIM_CharChr(x) in
                                                                              let prim_0'0 = PRIM_PutChar(x) in
                                                                              k prim_0'0 in
                                                                            uLET_0'0 lit_18'52 k in
                                                                          uLET_0'0 n k in
                                                                  put_chars prim_0'0 k in
                                                                put_chars uLET_82'6 k in
                                                              match uLET_0'0 with
                                                              | true1 ->
                                                                let x = '0' in
                                                                let uLET_45'9 = fun [x] xs k ->
                                                                  let con_0'0 = Cons1[x,xs] in
                                                                  k con_0'0 in
                                                                let con_88'25 = Nil0 in
                                                                uLET_45'9 con_88'25 k
                                                              | false0 ->
                                                                let con_88'38 = Nil0 in
                                                                let k [n] app_88'38 = app_88'38 n k in
                                                                loop con_88'38 k in
                                                            put_chars prim_0'0 k in
                                                          put_chars app_186'46 k in
                                                        app_186'20 app_186'60 k in
                                                      star_the_ohs xs k in
                                                    append uLET_0'0 k in
                                                  length xs k in
                                                map lam_184'30 k in
                                            app_56'39 b k in
                                          app_56'31 command k in
                                        eq_list lam_0'0 k in
                                    app_56'39 b k in
                                  app_56'31 command k in
                                eq_list lam_0'0 k in
                            app_56'39 b k in
                          app_56'31 command k in
                        eq_list lam_0'0 k in
                    app_201'10 xs k in
                  app_201'7 con_201'10 k in
                loop con_201'7 k in
            app_56'39 single_controlD k in
          app_56'31 xs k in
        eq_list lam_0'0 k in
      loop con_119'7 k in
    put_chars con_214'13 k) in
  let _ = Unit0 in
  let s = "This is a shell prototype. Try: fib, fact, rev\n" in
  let prim_0'0 = PRIM_Explode(s) in
  let k [mainloop] _ =
    let con_221'11 = Unit0 in
    mainloop con_221'11 k in
  put_chars prim_0'0 k in
uLET_0'0 con_166'31 k
