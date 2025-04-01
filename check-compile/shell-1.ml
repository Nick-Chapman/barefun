(*stage1*)
let eq_list =
  fix (fun eq_list eq ->
    (fun xs ->
      (fun ys ->
        match xs with
        | Nil0 ->
          match ys with
          | Nil0 -> CID1
          | Cons1(_,_) -> CID0
        | Cons1(x,xs) ->
          match ys with
          | Nil0 -> CID0
          | Cons1(y,ys) ->
            match ((eq x) y) with
            | true1 -> (((eq_list eq) xs) ys)
            | false0 -> CID0))) in
let append =
  fix (fun append xs ->
    (fun ys ->
      match xs with
      | Nil0 -> ys
      | Cons1(x,xs) ->
        let xs = ((append xs) ys) in
        CID1(x, xs))) in
let map =
  fix (fun map f ->
    (fun xs ->
      match xs with
      | Nil0 -> CID0
      | Cons1(x,xs) ->
        let x = (f x) in
        let y = ((map f) xs) in
        CID1(x, y))) in
let length =
  fix (fun length xs ->
    match xs with
    | Nil0 -> 0
    | Cons1(_,xs) ->
      let y = (length xs) in
      PRIM_AddInt(1,y)) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> CID0
    | Cons1(x,xs) ->
      let n = PRIM_CharOrd(x) in
      let _ =
        match PRIM_EqInt(n,8) with
        | true1 -> PRIM_PutChar(x)
        | false0 ->
          match PRIM_EqChar(x,'\n') with
          | true1 -> PRIM_PutChar(x)
          | false0 ->
            match PRIM_LessInt(26,n) with
            | true1 -> PRIM_PutChar(x)
            | false0 ->
              let _ = PRIM_PutChar('^') in
              let x = PRIM_AddInt(65,n) in
              let x = PRIM_SubInt(x,1) in
              let x = PRIM_CharChr(x) in
              PRIM_PutChar(x) in
      (put_chars xs)) in
let fib =
  fix (fun fib n ->
    match PRIM_LessInt(n,2) with
    | true1 -> n
    | false0 ->
      let x = (fib PRIM_SubInt(n,1)) in
      let y = (fib PRIM_SubInt(n,2)) in
      PRIM_AddInt(x,y)) in
let fact =
  fix (fun fact n ->
    let b = PRIM_LessInt(n,2) in
    match match b with
    | true1 -> CID0
    | false0 -> CID1 with
    | true1 ->
      let x = (fact PRIM_SubInt(n,1)) in
      PRIM_MulInt(x,n)
    | false0 -> 1) in
let mainloop =
  fix (fun mainloop _ ->
    let _ = (put_chars CID1('>', CID1(' ', CID0))) in
    let loop =
      fix (fun loop acc ->
        let c = PRIM_GetChar(CID0) in
        let n = PRIM_CharOrd(c) in
        match PRIM_EqChar(c,'\n') with
        | true1 ->
          let _ = PRIM_PutChar('\n') in
          let loop =
            fix (fun loop acc ->
              (fun xs ->
                match xs with
                | Nil0 -> acc
                | Cons1(x,xs) -> ((loop CID1(x, acc)) xs))) in
          ((loop CID0) acc)
        | false0 ->
          match PRIM_EqChar(c,'\EOT') with
          | true1 ->
            let n = PRIM_CharOrd(c) in
            let _ =
              match PRIM_EqInt(n,8) with
              | true1 -> PRIM_PutChar(c)
              | false0 ->
                match PRIM_EqChar(c,'\n') with
                | true1 -> PRIM_PutChar(c)
                | false0 ->
                  match PRIM_LessInt(26,n) with
                  | true1 -> PRIM_PutChar(c)
                  | false0 ->
                    let _ = PRIM_PutChar('^') in
                    let x = PRIM_AddInt(65,n) in
                    let x = PRIM_SubInt(x,1) in
                    let x = PRIM_CharChr(x) in
                    PRIM_PutChar(x) in
            let _ = PRIM_PutChar('\n') in
            let loop =
              fix (fun loop acc ->
                (fun xs ->
                  match xs with
                  | Nil0 -> acc
                  | Cons1(x,xs) -> ((loop CID1(x, acc)) xs))) in
            ((loop CID0) CID1('\EOT', acc))
          | false0 ->
            match PRIM_LessInt(127,n) with
            | true1 -> (loop acc)
            | false0 ->
              match PRIM_EqInt(n,127) with
              | true1 ->
                match acc with
                | Nil0 -> (loop acc)
                | Cons1(c,tail) ->
                  let a = PRIM_CharOrd(c) in
                  let b = PRIM_LessInt(26,a) in
                  let _ =
                    match match b with
                    | true1 -> CID0
                    | false0 -> CID1 with
                    | true1 ->
                      let _ = PRIM_PutChar('\b') in
                      let _ = PRIM_PutChar(' ') in
                      PRIM_PutChar('\b')
                    | false0 -> CID0 in
                  let _ = PRIM_PutChar('\b') in
                  let _ = PRIM_PutChar(' ') in
                  let _ = PRIM_PutChar('\b') in
                  (loop tail)
              | false0 ->
                let n = PRIM_CharOrd(c) in
                let _ =
                  match PRIM_EqInt(n,8) with
                  | true1 -> PRIM_PutChar(c)
                  | false0 ->
                    match PRIM_EqChar(c,'\n') with
                    | true1 -> PRIM_PutChar(c)
                    | false0 ->
                      match PRIM_LessInt(26,n) with
                      | true1 -> PRIM_PutChar(c)
                      | false0 ->
                        let _ = PRIM_PutChar('^') in
                        let x = PRIM_AddInt(65,n) in
                        let x = PRIM_SubInt(x,1) in
                        let x = PRIM_CharChr(x) in
                        PRIM_PutChar(x) in
                (loop CID1(c, acc))) in
    let xs = (loop CID0) in
    match (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) xs) CID1('\EOT', CID0)) with
    | true1 -> CID0
    | false0 ->
      let loop =
        fix (fun loop accWs ->
          (fun accCs ->
            (fun xs ->
              match xs with
              | Nil0 ->
                let loop =
                  fix (fun loop acc ->
                    (fun xs ->
                      match xs with
                      | Nil0 -> acc
                      | Cons1(x,xs) -> ((loop CID1(x, acc)) xs))) in
                let x = ((loop CID0) accCs) in
                let loop =
                  fix (fun loop acc ->
                    (fun xs ->
                      match xs with
                      | Nil0 -> acc
                      | Cons1(x,xs) -> ((loop CID1(x, acc)) xs))) in
                ((loop CID0) CID1(x, accWs))
              | Cons1(x,xs) ->
                match PRIM_EqChar(x,' ') with
                | true1 ->
                  let loop =
                    fix (fun loop acc ->
                      (fun xs ->
                        match xs with
                        | Nil0 -> acc
                        | Cons1(x,xs) -> ((loop CID1(x, acc)) xs))) in
                  let x = ((loop CID0) accCs) in
                  (((loop CID1(x, accWs)) CID0) xs)
                | false0 -> (((loop accWs) CID1(x, accCs)) xs)))) in
      let words = (((loop CID0) CID0) xs) in
      let _ =
        match words with
        | Nil0 -> CID0
        | Cons1(command,args) ->
          match (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) command) CID1('f', CID1('i', CID1('b', CID0)))) with
          | true1 ->
            let _ = (put_chars CID1('f', CID1('i', CID1('b', CID1(':', CID1(' ', CID0)))))) in
            match args with
            | Nil0 ->
              let _ = (put_chars CID1('E', CID1('R', CID1('R', CID1('O', CID1('R', CID1(':', CID1(' ', CID0)))))))) in
              let _ = (put_chars CID1('e', CID1('x', CID1('p', CID1('e', CID1('c', CID1('t', CID1('e', CID1('d', CID1(' ', CID1('a', CID1('n', CID1(' ', CID1('a', CID1('r', CID1('g', CID1('u', CID1('m', CID1('e', CID1('n', CID1('t', CID0))))))))))))))))))))) in
              PRIM_PutChar('\n')
            | Cons1(arg1,more) ->
              match more with
              | Cons1(_,_) ->
                let _ = (put_chars CID1('E', CID1('R', CID1('R', CID1('O', CID1('R', CID1(':', CID1(' ', CID0)))))))) in
                let _ = (put_chars CID1('e', CID1('x', CID1('p', CID1('e', CID1('c', CID1('t', CID1('e', CID1('d', CID1(' ', CID1('e', CID1('x', CID1('a', CID1('c', CID1('t', CID1('l', CID1('y', CID1(' ', CID1('o', CID1('n', CID1('e', CID1(' ', CID1('a', CID1('r', CID1('g', CID1('u', CID1('m', CID1('e', CID1('n', CID1('t', CID0)))))))))))))))))))))))))))))) in
                PRIM_PutChar('\n')
              | Nil0 ->
                let loop =
                  fix (fun loop acc ->
                    (fun xs ->
                      match xs with
                      | Nil0 -> CID0(acc)
                      | Cons1(x,xs) ->
                        let x = PRIM_CharOrd(x) in
                        let n = PRIM_SubInt(x,48) in
                        let b = PRIM_LessInt(n,0) in
                        match match match b with
                        | true1 -> CID0
                        | false0 -> CID1 with
                        | true1 ->
                          let b = PRIM_LessInt(9,n) in
                          match match b with
                          | true1 -> CID0
                          | false0 -> CID1 with
                          | true1 -> CID0(n)
                          | false0 -> CID1
                        | false0 -> CID1 with
                        | None1 -> CID1
                        | Some0(d) ->
                          let x = PRIM_MulInt(10,acc) in
                          ((loop PRIM_AddInt(x,d)) xs))) in
                match ((loop 0) arg1) with
                | None1 ->
                  let _ = (put_chars CID1('E', CID1('R', CID1('R', CID1('O', CID1('R', CID1(':', CID1(' ', CID0)))))))) in
                  let _ = (put_chars CID1('e', CID1('x', CID1('p', CID1('e', CID1('c', CID1('t', CID1('e', CID1('d', CID1(' ', CID1('a', CID1('r', CID1('g', CID1('1', CID1(' ', CID1('t', CID1('o', CID1(' ', CID1('b', CID1('e', CID1(' ', CID1('n', CID1('u', CID1('m', CID1('e', CID1('r', CID1('i', CID1('c', CID0)))))))))))))))))))))))))))) in
                  PRIM_PutChar('\n')
                | Some0(n) ->
                  let res = (fib n) in
                  let loop =
                    fix (fun loop acc ->
                      (fun i ->
                        match PRIM_EqInt(i,0) with
                        | true1 -> acc
                        | false0 ->
                          let c = PRIM_ModInt(i,10) in
                          let x = PRIM_AddInt(48,c) in
                          let x = PRIM_CharChr(x) in
                          ((loop CID1(x, acc)) PRIM_DivInt(i,10)))) in
                  let _ =
                    (put_chars
                    match PRIM_EqInt(n,0) with
                    | true1 -> CID1('0', CID0)
                    | false0 -> ((loop CID0) n)) in
                  let _ = (put_chars CID1(' ', CID1('-', CID1('-', CID1('>', CID1(' ', CID0)))))) in
                  let loop =
                    fix (fun loop acc ->
                      (fun i ->
                        match PRIM_EqInt(i,0) with
                        | true1 -> acc
                        | false0 ->
                          let c = PRIM_ModInt(i,10) in
                          let x = PRIM_AddInt(48,c) in
                          let x = PRIM_CharChr(x) in
                          ((loop CID1(x, acc)) PRIM_DivInt(i,10)))) in
                  let _ =
                    (put_chars
                    match PRIM_EqInt(res,0) with
                    | true1 -> CID1('0', CID0)
                    | false0 -> ((loop CID0) res)) in
                  PRIM_PutChar('\n')
          | false0 ->
            match (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) command) CID1('f', CID1('a', CID1('c', CID1('t', CID0))))) with
            | true1 ->
              let _ = (put_chars CID1('f', CID1('a', CID1('c', CID1('t', CID1(':', CID1(' ', CID0))))))) in
              match args with
              | Nil0 ->
                let _ = (put_chars CID1('E', CID1('R', CID1('R', CID1('O', CID1('R', CID1(':', CID1(' ', CID0)))))))) in
                let _ = (put_chars CID1('e', CID1('x', CID1('p', CID1('e', CID1('c', CID1('t', CID1('e', CID1('d', CID1(' ', CID1('a', CID1('n', CID1(' ', CID1('a', CID1('r', CID1('g', CID1('u', CID1('m', CID1('e', CID1('n', CID1('t', CID0))))))))))))))))))))) in
                PRIM_PutChar('\n')
              | Cons1(arg1,more) ->
                match more with
                | Cons1(_,_) ->
                  let _ = (put_chars CID1('E', CID1('R', CID1('R', CID1('O', CID1('R', CID1(':', CID1(' ', CID0)))))))) in
                  let _ = (put_chars CID1('e', CID1('x', CID1('p', CID1('e', CID1('c', CID1('t', CID1('e', CID1('d', CID1(' ', CID1('e', CID1('x', CID1('a', CID1('c', CID1('t', CID1('l', CID1('y', CID1(' ', CID1('o', CID1('n', CID1('e', CID1(' ', CID1('a', CID1('r', CID1('g', CID1('u', CID1('m', CID1('e', CID1('n', CID1('t', CID0)))))))))))))))))))))))))))))) in
                  PRIM_PutChar('\n')
                | Nil0 ->
                  let loop =
                    fix (fun loop acc ->
                      (fun xs ->
                        match xs with
                        | Nil0 -> CID0(acc)
                        | Cons1(x,xs) ->
                          let x = PRIM_CharOrd(x) in
                          let n = PRIM_SubInt(x,48) in
                          let b = PRIM_LessInt(n,0) in
                          match match match b with
                          | true1 -> CID0
                          | false0 -> CID1 with
                          | true1 ->
                            let b = PRIM_LessInt(9,n) in
                            match match b with
                            | true1 -> CID0
                            | false0 -> CID1 with
                            | true1 -> CID0(n)
                            | false0 -> CID1
                          | false0 -> CID1 with
                          | None1 -> CID1
                          | Some0(d) ->
                            let x = PRIM_MulInt(10,acc) in
                            ((loop PRIM_AddInt(x,d)) xs))) in
                  match ((loop 0) arg1) with
                  | None1 ->
                    let _ = (put_chars CID1('E', CID1('R', CID1('R', CID1('O', CID1('R', CID1(':', CID1(' ', CID0)))))))) in
                    let _ = (put_chars CID1('e', CID1('x', CID1('p', CID1('e', CID1('c', CID1('t', CID1('e', CID1('d', CID1(' ', CID1('a', CID1('r', CID1('g', CID1('1', CID1(' ', CID1('t', CID1('o', CID1(' ', CID1('b', CID1('e', CID1(' ', CID1('n', CID1('u', CID1('m', CID1('e', CID1('r', CID1('i', CID1('c', CID0)))))))))))))))))))))))))))) in
                    PRIM_PutChar('\n')
                  | Some0(n) ->
                    let res = (fact n) in
                    let loop =
                      fix (fun loop acc ->
                        (fun i ->
                          match PRIM_EqInt(i,0) with
                          | true1 -> acc
                          | false0 ->
                            let c = PRIM_ModInt(i,10) in
                            let x = PRIM_AddInt(48,c) in
                            let x = PRIM_CharChr(x) in
                            ((loop CID1(x, acc)) PRIM_DivInt(i,10)))) in
                    let _ =
                      (put_chars
                      match PRIM_EqInt(n,0) with
                      | true1 -> CID1('0', CID0)
                      | false0 -> ((loop CID0) n)) in
                    let _ = (put_chars CID1(' ', CID1('-', CID1('-', CID1('>', CID1(' ', CID0)))))) in
                    let loop =
                      fix (fun loop acc ->
                        (fun i ->
                          match PRIM_EqInt(i,0) with
                          | true1 -> acc
                          | false0 ->
                            let c = PRIM_ModInt(i,10) in
                            let x = PRIM_AddInt(48,c) in
                            let x = PRIM_CharChr(x) in
                            ((loop CID1(x, acc)) PRIM_DivInt(i,10)))) in
                    let _ =
                      (put_chars
                      match PRIM_EqInt(res,0) with
                      | true1 -> CID1('0', CID0)
                      | false0 -> ((loop CID0) res)) in
                    PRIM_PutChar('\n')
            | false0 ->
              match (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) command) CID1('r', CID1('e', CID1('v', CID0)))) with
              | true1 ->
                match args with
                | Cons1(_,_) ->
                  let _ = (put_chars CID1('E', CID1('R', CID1('R', CID1('O', CID1('R', CID1(':', CID1(' ', CID0)))))))) in
                  let _ = (put_chars CID1('r', CID1('e', CID1('v', CID1(':', CID1(' ', CID1('e', CID1('x', CID1('p', CID1('e', CID1('c', CID1('t', CID1('e', CID1('d', CID1(' ', CID1('n', CID1('o', CID1(' ', CID1('a', CID1('r', CID1('g', CID1('u', CID1('m', CID1('e', CID1('n', CID1('t', CID1('s', CID0))))))))))))))))))))))))))) in
                  PRIM_PutChar('\n')
                | Nil0 ->
                  let _ = (put_chars CID1('(', CID1('r', CID1('e', CID1('v', CID1('e', CID1('r', CID1('s', CID1('e', CID1(' ', CID1('t', CID1('y', CID1('p', CID1('e', CID1('d', CID1(' ', CID1('l', CID1('i', CID1('n', CID1('e', CID1('s', CID1(' ', CID1('u', CID1('n', CID1('t', CID1('i', CID1('l', CID1(' ', CID1('^', CID1('D', CID1(')', CID1('\n', CID0)))))))))))))))))))))))))))))))) in
                  let loop =
                    fix (fun loop _ ->
                      let loop =
                        fix (fun loop acc ->
                          let c = PRIM_GetChar(CID0) in
                          let n = PRIM_CharOrd(c) in
                          match PRIM_EqChar(c,'\n') with
                          | true1 ->
                            let _ = PRIM_PutChar('\n') in
                            let loop =
                              fix (fun loop acc ->
                                (fun xs ->
                                  match xs with
                                  | Nil0 -> acc
                                  | Cons1(x,xs) -> ((loop CID1(x, acc)) xs))) in
                            ((loop CID0) acc)
                          | false0 ->
                            match PRIM_EqChar(c,'\EOT') with
                            | true1 ->
                              let n = PRIM_CharOrd(c) in
                              let _ =
                                match PRIM_EqInt(n,8) with
                                | true1 -> PRIM_PutChar(c)
                                | false0 ->
                                  match PRIM_EqChar(c,'\n') with
                                  | true1 -> PRIM_PutChar(c)
                                  | false0 ->
                                    match PRIM_LessInt(26,n) with
                                    | true1 -> PRIM_PutChar(c)
                                    | false0 ->
                                      let _ = PRIM_PutChar('^') in
                                      let x = PRIM_AddInt(65,n) in
                                      let x = PRIM_SubInt(x,1) in
                                      let x = PRIM_CharChr(x) in
                                      PRIM_PutChar(x) in
                              let _ = PRIM_PutChar('\n') in
                              let loop =
                                fix (fun loop acc ->
                                  (fun xs ->
                                    match xs with
                                    | Nil0 -> acc
                                    | Cons1(x,xs) -> ((loop CID1(x, acc)) xs))) in
                              ((loop CID0) CID1('\EOT', acc))
                            | false0 ->
                              match PRIM_LessInt(127,n) with
                              | true1 -> (loop acc)
                              | false0 ->
                                match PRIM_EqInt(n,127) with
                                | true1 ->
                                  match acc with
                                  | Nil0 -> (loop acc)
                                  | Cons1(c,tail) ->
                                    let a = PRIM_CharOrd(c) in
                                    let b = PRIM_LessInt(26,a) in
                                    let _ =
                                      match match b with
                                      | true1 -> CID0
                                      | false0 -> CID1 with
                                      | true1 ->
                                        let _ = PRIM_PutChar('\b') in
                                        let _ = PRIM_PutChar(' ') in
                                        PRIM_PutChar('\b')
                                      | false0 -> CID0 in
                                    let _ = PRIM_PutChar('\b') in
                                    let _ = PRIM_PutChar(' ') in
                                    let _ = PRIM_PutChar('\b') in
                                    (loop tail)
                                | false0 ->
                                  let n = PRIM_CharOrd(c) in
                                  let _ =
                                    match PRIM_EqInt(n,8) with
                                    | true1 -> PRIM_PutChar(c)
                                    | false0 ->
                                      match PRIM_EqChar(c,'\n') with
                                      | true1 -> PRIM_PutChar(c)
                                      | false0 ->
                                        match PRIM_LessInt(26,n) with
                                        | true1 -> PRIM_PutChar(c)
                                        | false0 ->
                                          let _ = PRIM_PutChar('^') in
                                          let x = PRIM_AddInt(65,n) in
                                          let x = PRIM_SubInt(x,1) in
                                          let x = PRIM_CharChr(x) in
                                          PRIM_PutChar(x) in
                                  (loop CID1(c, acc))) in
                      let xs = (loop CID0) in
                      match (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) xs) CID1('\EOT', CID0)) with
                      | true1 -> CID0
                      | false0 ->
                        let loop =
                          fix (fun loop acc ->
                            (fun xs ->
                              match xs with
                              | Nil0 -> acc
                              | Cons1(x,xs) -> ((loop CID1(x, acc)) xs))) in
                        let _ = (put_chars ((loop CID0) xs)) in
                        let _ = PRIM_PutChar('\n') in
                        (loop CID0)) in
                  (loop CID0)
              | false0 ->
                let star_the_ohs =
                  (map
                  (fun c ->
                    match PRIM_EqChar(c,'o') with
                    | true1 -> '*'
                    | false0 -> c)) in
                let n = (length xs) in
                let _ = (put_chars ((append CID1('Y', CID1('o', CID1('u', CID1(' ', CID1('w', CID1('r', CID1('o', CID1('t', CID1('e', CID1(':', CID1(' ', CID1('"', CID0))))))))))))) (star_the_ohs xs))) in
                let _ = (put_chars CID1('"', CID1(' ', CID1('(', CID0)))) in
                let loop =
                  fix (fun loop acc ->
                    (fun i ->
                      match PRIM_EqInt(i,0) with
                      | true1 -> acc
                      | false0 ->
                        let c = PRIM_ModInt(i,10) in
                        let x = PRIM_AddInt(48,c) in
                        let x = PRIM_CharChr(x) in
                        ((loop CID1(x, acc)) PRIM_DivInt(i,10)))) in
                let _ =
                  (put_chars
                  match PRIM_EqInt(n,0) with
                  | true1 -> CID1('0', CID0)
                  | false0 -> ((loop CID0) n)) in
                let _ = (put_chars CID1(' ', CID1('c', CID1('h', CID1('a', CID1('r', CID1('s', CID1(')', CID0)))))))) in
                PRIM_PutChar('\n') in
      (mainloop CID0)) in
let _ = (put_chars CID1('T', CID1('h', CID1('i', CID1('s', CID1(' ', CID1('i', CID1('s', CID1(' ', CID1('a', CID1(' ', CID1('s', CID1('h', CID1('e', CID1('l', CID1('l', CID1(' ', CID1('p', CID1('r', CID1('o', CID1('t', CID1('o', CID1('t', CID1('y', CID1('p', CID1('e', CID1('.', CID1(' ', CID1('T', CID1('r', CID1('y', CID1(':', CID1(' ', CID1('f', CID1('i', CID1('b', CID1(',', CID1(' ', CID1('f', CID1('a', CID1('c', CID1('t', CID1(',', CID1(' ', CID1('r', CID1('e', CID1('v', CID1('\n', CID0)))))))))))))))))))))))))))))))))))))))))))))))) in
(mainloop CID0)
