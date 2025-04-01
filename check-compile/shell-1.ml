(*stage1*)
let r = fix (fun r f -> f) in
let put_char =
  (r
  (fun c ->
    let n = PRIM_CharOrd(c) in
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
          let x = PRIM_CharOrd('A') in
          let x = PRIM_AddInt(x,n) in
          let x = PRIM_SubInt(x,1) in
          let x = PRIM_CharChr(x) in
          PRIM_PutChar(x))) in
let eq_list =
  fix (fun eq_list eq ->
    (fun xs ->
      (fun ys ->
        match xs with
        | Nil0 ->
          match ys with
          | Nil0 -> true1
          | Cons1(_,_) -> false0
        | Cons1(x,xs) ->
          match ys with
          | Nil0 -> false0
          | Cons1(y,ys) ->
            match ((eq x) y) with
            | true1 -> (((eq_list eq) xs) ys)
            | false0 -> false0))) in
let append =
  fix (fun append xs ->
    (fun ys ->
      match xs with
      | Nil0 -> ys
      | Cons1(x,xs) ->
        let xs = ((append xs) ys) in
        Cons1(x, xs))) in
let map =
  fix (fun map f ->
    (fun xs ->
      match xs with
      | Nil0 -> Nil0
      | Cons1(x,xs) ->
        let x = (f x) in
        let y = ((map f) xs) in
        Cons1(x, y))) in
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
    | Nil0 -> Unit0
    | Cons1(x,xs) ->
      let _ = (put_char x) in
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
    | true1 -> false0
    | false0 -> true1 with
    | true1 ->
      let x = (fact PRIM_SubInt(n,1)) in
      PRIM_MulInt(x,n)
    | false0 -> 1) in
let x = PRIM_CharChr(4) in
let y = Nil0 in
let single_controlD = Cons1(x, y) in
let mainloop =
  fix (fun mainloop _ ->
    let _ = (put_chars Cons1('>', Cons1(' ', Nil0))) in
    let _ = Unit0 in
    let controlD = PRIM_CharChr(4) in
    let loop =
      fix (fun loop acc ->
        let x = Unit0 in
        let c = PRIM_GetChar(x) in
        let n = PRIM_CharOrd(c) in
        match PRIM_EqChar(c,'\n') with
        | true1 ->
          let _ = Unit0 in
          let _ = (put_char '\n') in
          let loop =
            fix (fun loop acc ->
              (fun xs ->
                match xs with
                | Nil0 -> acc
                | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
          ((loop Nil0) acc)
        | false0 ->
          match PRIM_EqChar(c,controlD) with
          | true1 ->
            let _ = (put_char c) in
            let _ = Unit0 in
            let _ = (put_char '\n') in
            let xs = Cons1(controlD, acc) in
            let loop =
              fix (fun loop acc ->
                (fun xs ->
                  match xs with
                  | Nil0 -> acc
                  | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
            ((loop Nil0) xs)
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
                    | true1 -> false0
                    | false0 -> true1 with
                    | true1 ->
                      let _ = Unit0 in
                      let backspace = PRIM_CharChr(8) in
                      let _ = (put_char backspace) in
                      let _ = (put_char ' ') in
                      (put_char backspace)
                    | false0 -> Unit0 in
                  let _ = Unit0 in
                  let backspace = PRIM_CharChr(8) in
                  let _ = (put_char backspace) in
                  let _ = (put_char ' ') in
                  let _ = (put_char backspace) in
                  (loop tail)
              | false0 ->
                let _ = (put_char c) in
                (loop Cons1(c, acc))) in
    let xs = (loop Nil0) in
    match (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) xs) single_controlD) with
    | true1 -> Unit0
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
                      | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
                let x = ((loop Nil0) accCs) in
                let xs = Cons1(x, accWs) in
                let loop =
                  fix (fun loop acc ->
                    (fun xs ->
                      match xs with
                      | Nil0 -> acc
                      | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
                ((loop Nil0) xs)
              | Cons1(x,xs) ->
                match PRIM_EqChar(x,' ') with
                | true1 ->
                  let loop =
                    fix (fun loop acc ->
                      (fun xs ->
                        match xs with
                        | Nil0 -> acc
                        | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
                  let x = ((loop Nil0) accCs) in
                  (((loop Cons1(x, accWs)) Nil0) xs)
                | false0 -> (((loop accWs) Cons1(x, accCs)) xs)))) in
      let words = (((loop Nil0) Nil0) xs) in
      let _ =
        match words with
        | Nil0 -> Unit0
        | Cons1(command,args) ->
          let b = PRIM_Explode("fib") in
          match (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) command) b) with
          | true1 ->
            let _ = (put_chars PRIM_Explode("fib: ")) in
            match args with
            | Nil0 ->
              let _ = (put_chars PRIM_Explode("ERROR: ")) in
              let _ = (put_chars PRIM_Explode("expected an argument")) in
              let _ = Unit0 in
              (put_char '\n')
            | Cons1(arg1,more) ->
              match more with
              | Cons1(_,_) ->
                let _ = (put_chars PRIM_Explode("ERROR: ")) in
                let _ = (put_chars PRIM_Explode("expected exactly one argument")) in
                let _ = Unit0 in
                (put_char '\n')
              | Nil0 ->
                let loop =
                  fix (fun loop acc ->
                    (fun xs ->
                      match xs with
                      | Nil0 -> Some0(acc)
                      | Cons1(x,xs) ->
                        let x = PRIM_CharOrd(x) in
                        let y = PRIM_CharOrd('0') in
                        let n = PRIM_SubInt(x,y) in
                        let b = PRIM_LessInt(n,0) in
                        match match match b with
                        | true1 -> false0
                        | false0 -> true1 with
                        | true1 ->
                          let b = PRIM_LessInt(9,n) in
                          match match b with
                          | true1 -> false0
                          | false0 -> true1 with
                          | true1 -> Some0(n)
                          | false0 -> None1
                        | false0 -> None1 with
                        | None1 -> None1
                        | Some0(d) ->
                          let x = PRIM_MulInt(10,acc) in
                          ((loop PRIM_AddInt(x,d)) xs))) in
                match ((loop 0) arg1) with
                | None1 ->
                  let _ = (put_chars PRIM_Explode("ERROR: ")) in
                  let _ = (put_chars PRIM_Explode("expected arg1 to be numeric")) in
                  let _ = Unit0 in
                  (put_char '\n')
                | Some0(n) ->
                  let res = (fib n) in
                  let ord0 = PRIM_CharOrd('0') in
                  let loop =
                    fix (fun loop acc ->
                      (fun i ->
                        match PRIM_EqInt(i,0) with
                        | true1 -> acc
                        | false0 ->
                          let c = PRIM_ModInt(i,10) in
                          let x = PRIM_AddInt(ord0,c) in
                          let x = PRIM_CharChr(x) in
                          ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                  let _ =
                    (put_chars
                    match PRIM_EqInt(n,0) with
                    | true1 ->
                      let xs = Nil0 in
                      Cons1('0', xs)
                    | false0 -> ((loop Nil0) n)) in
                  let _ = (put_chars PRIM_Explode(" --> ")) in
                  let ord0 = PRIM_CharOrd('0') in
                  let loop =
                    fix (fun loop acc ->
                      (fun i ->
                        match PRIM_EqInt(i,0) with
                        | true1 -> acc
                        | false0 ->
                          let c = PRIM_ModInt(i,10) in
                          let x = PRIM_AddInt(ord0,c) in
                          let x = PRIM_CharChr(x) in
                          ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                  let _ =
                    (put_chars
                    match PRIM_EqInt(res,0) with
                    | true1 ->
                      let xs = Nil0 in
                      Cons1('0', xs)
                    | false0 -> ((loop Nil0) res)) in
                  let _ = Unit0 in
                  (put_char '\n')
          | false0 ->
            let b = PRIM_Explode("fact") in
            match (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) command) b) with
            | true1 ->
              let _ = (put_chars PRIM_Explode("fact: ")) in
              match args with
              | Nil0 ->
                let _ = (put_chars PRIM_Explode("ERROR: ")) in
                let _ = (put_chars PRIM_Explode("expected an argument")) in
                let _ = Unit0 in
                (put_char '\n')
              | Cons1(arg1,more) ->
                match more with
                | Cons1(_,_) ->
                  let _ = (put_chars PRIM_Explode("ERROR: ")) in
                  let _ = (put_chars PRIM_Explode("expected exactly one argument")) in
                  let _ = Unit0 in
                  (put_char '\n')
                | Nil0 ->
                  let loop =
                    fix (fun loop acc ->
                      (fun xs ->
                        match xs with
                        | Nil0 -> Some0(acc)
                        | Cons1(x,xs) ->
                          let x = PRIM_CharOrd(x) in
                          let y = PRIM_CharOrd('0') in
                          let n = PRIM_SubInt(x,y) in
                          let b = PRIM_LessInt(n,0) in
                          match match match b with
                          | true1 -> false0
                          | false0 -> true1 with
                          | true1 ->
                            let b = PRIM_LessInt(9,n) in
                            match match b with
                            | true1 -> false0
                            | false0 -> true1 with
                            | true1 -> Some0(n)
                            | false0 -> None1
                          | false0 -> None1 with
                          | None1 -> None1
                          | Some0(d) ->
                            let x = PRIM_MulInt(10,acc) in
                            ((loop PRIM_AddInt(x,d)) xs))) in
                  match ((loop 0) arg1) with
                  | None1 ->
                    let _ = (put_chars PRIM_Explode("ERROR: ")) in
                    let _ = (put_chars PRIM_Explode("expected arg1 to be numeric")) in
                    let _ = Unit0 in
                    (put_char '\n')
                  | Some0(n) ->
                    let res = (fact n) in
                    let ord0 = PRIM_CharOrd('0') in
                    let loop =
                      fix (fun loop acc ->
                        (fun i ->
                          match PRIM_EqInt(i,0) with
                          | true1 -> acc
                          | false0 ->
                            let c = PRIM_ModInt(i,10) in
                            let x = PRIM_AddInt(ord0,c) in
                            let x = PRIM_CharChr(x) in
                            ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                    let _ =
                      (put_chars
                      match PRIM_EqInt(n,0) with
                      | true1 ->
                        let xs = Nil0 in
                        Cons1('0', xs)
                      | false0 -> ((loop Nil0) n)) in
                    let _ = (put_chars PRIM_Explode(" --> ")) in
                    let ord0 = PRIM_CharOrd('0') in
                    let loop =
                      fix (fun loop acc ->
                        (fun i ->
                          match PRIM_EqInt(i,0) with
                          | true1 -> acc
                          | false0 ->
                            let c = PRIM_ModInt(i,10) in
                            let x = PRIM_AddInt(ord0,c) in
                            let x = PRIM_CharChr(x) in
                            ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                    let _ =
                      (put_chars
                      match PRIM_EqInt(res,0) with
                      | true1 ->
                        let xs = Nil0 in
                        Cons1('0', xs)
                      | false0 -> ((loop Nil0) res)) in
                    let _ = Unit0 in
                    (put_char '\n')
            | false0 ->
              let b = PRIM_Explode("rev") in
              match (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) command) b) with
              | true1 ->
                match args with
                | Cons1(_,_) ->
                  let _ = (put_chars PRIM_Explode("ERROR: ")) in
                  let _ = (put_chars PRIM_Explode("rev: expected no arguments")) in
                  let _ = Unit0 in
                  (put_char '\n')
                | Nil0 ->
                  let _ = (put_chars PRIM_Explode("(reverse typed lines until ^D)\n")) in
                  let _ = Unit0 in
                  let loop =
                    fix (fun loop _ ->
                      let _ = Unit0 in
                      let controlD = PRIM_CharChr(4) in
                      let loop =
                        fix (fun loop acc ->
                          let x = Unit0 in
                          let c = PRIM_GetChar(x) in
                          let n = PRIM_CharOrd(c) in
                          match PRIM_EqChar(c,'\n') with
                          | true1 ->
                            let _ = Unit0 in
                            let _ = (put_char '\n') in
                            let loop =
                              fix (fun loop acc ->
                                (fun xs ->
                                  match xs with
                                  | Nil0 -> acc
                                  | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
                            ((loop Nil0) acc)
                          | false0 ->
                            match PRIM_EqChar(c,controlD) with
                            | true1 ->
                              let _ = (put_char c) in
                              let _ = Unit0 in
                              let _ = (put_char '\n') in
                              let xs = Cons1(controlD, acc) in
                              let loop =
                                fix (fun loop acc ->
                                  (fun xs ->
                                    match xs with
                                    | Nil0 -> acc
                                    | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
                              ((loop Nil0) xs)
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
                                      | true1 -> false0
                                      | false0 -> true1 with
                                      | true1 ->
                                        let _ = Unit0 in
                                        let backspace = PRIM_CharChr(8) in
                                        let _ = (put_char backspace) in
                                        let _ = (put_char ' ') in
                                        (put_char backspace)
                                      | false0 -> Unit0 in
                                    let _ = Unit0 in
                                    let backspace = PRIM_CharChr(8) in
                                    let _ = (put_char backspace) in
                                    let _ = (put_char ' ') in
                                    let _ = (put_char backspace) in
                                    (loop tail)
                                | false0 ->
                                  let _ = (put_char c) in
                                  (loop Cons1(c, acc))) in
                      let xs = (loop Nil0) in
                      match (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) xs) single_controlD) with
                      | true1 -> Unit0
                      | false0 ->
                        let loop =
                          fix (fun loop acc ->
                            (fun xs ->
                              match xs with
                              | Nil0 -> acc
                              | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
                        let _ = (put_chars ((loop Nil0) xs)) in
                        let _ = Unit0 in
                        let _ = (put_char '\n') in
                        (loop Unit0)) in
                  (loop Unit0)
              | false0 ->
                let star_the_ohs =
                  (map
                  (fun c ->
                    match PRIM_EqChar(c,'o') with
                    | true1 -> '*'
                    | false0 -> c)) in
                let n = (length xs) in
                let _ = (put_chars ((append PRIM_Explode("You wrote: \"")) (star_the_ohs xs))) in
                let _ = (put_chars PRIM_Explode("\" (")) in
                let ord0 = PRIM_CharOrd('0') in
                let loop =
                  fix (fun loop acc ->
                    (fun i ->
                      match PRIM_EqInt(i,0) with
                      | true1 -> acc
                      | false0 ->
                        let c = PRIM_ModInt(i,10) in
                        let x = PRIM_AddInt(ord0,c) in
                        let x = PRIM_CharChr(x) in
                        ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                let _ =
                  (put_chars
                  match PRIM_EqInt(n,0) with
                  | true1 ->
                    let xs = Nil0 in
                    Cons1('0', xs)
                  | false0 -> ((loop Nil0) n)) in
                let _ = (put_chars PRIM_Explode(" chars)")) in
                let _ = Unit0 in
                (put_char '\n') in
      (mainloop Unit0)) in
let _ = Unit0 in
let _ = (put_chars PRIM_Explode("This is a shell prototype. Try: fib, fact, rev\n")) in
(mainloop Unit0)
