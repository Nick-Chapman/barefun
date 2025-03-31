(*stage1*)
let noinline =
  let r = fix (fun r f -> f) in
  r in
let put_char =
  (noinline
  (fun c ->
    let backspace = 8 in
    let n = PRIM_CharOrd(c) in
    match PRIM_EqInt(n,backspace) with
    | true1 -> PRIM_PutChar(c)
    | false0 ->
      match let y = '\n' in
      PRIM_EqChar(c,y) with
      | true1 -> PRIM_PutChar(c)
      | false0 ->
        match let b = 26 in
        PRIM_LessInt(b,n) with
        | true1 -> PRIM_PutChar(c)
        | false0 ->
          let _ =
            let x = '^' in
            PRIM_PutChar(x) in
          let x =
            let x =
              (let x =
                (let x =
                  let x = 'A' in
                  PRIM_CharOrd(x) in
                (fun y -> PRIM_AddInt(x,y))
                n) in
              (fun y -> PRIM_SubInt(x,y))
              1) in
            PRIM_CharChr(x) in
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
        (let x = (f x) in
        (fun y -> Cons1(x, y))
        ((map f) xs)))) in
let length =
  fix (fun length xs ->
    match xs with
    | Nil0 -> 0
    | Cons1(_,xs) ->
      (let x = 1 in
      (fun y -> PRIM_AddInt(x,y))
      (length xs))) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> Unit0
    | Cons1(x,xs) ->
      let _ = (put_char x) in
      (put_chars xs)) in
let fib =
  fix (fun fib n ->
    match let y = 2 in
    PRIM_LessInt(n,y) with
    | true1 -> n
    | false0 ->
      (let x =
        (fib
        let y = 1 in
        PRIM_SubInt(n,y)) in
      (fun y -> PRIM_AddInt(x,y))
      (fib
      let y = 2 in
      PRIM_SubInt(n,y)))) in
let fact =
  fix (fun fact n ->
    match let b = 2 in
    let b = PRIM_LessInt(n,b) in
    match b with
    | true1 -> false0
    | false0 -> true1 with
    | true1 ->
      (let x =
        (fact
        let y = 1 in
        PRIM_SubInt(n,y)) in
      (fun y -> PRIM_MulInt(x,y))
      n)
    | false0 -> 1) in
let single_controlD =
  (let x =
    let x = 4 in
    PRIM_CharChr(x) in
  (fun y -> Cons1(x, y))
  Nil0) in
let mainloop =
  fix (fun mainloop _ ->
    let _ = (put_chars Cons1('>', Cons1(' ', Nil0))) in
    let xs =
      let _ = Unit0 in
      let controlD =
        let x = 4 in
        PRIM_CharChr(x) in
      let loop =
        fix (fun loop acc ->
          let c =
            let x = Unit0 in
            PRIM_GetChar(x) in
          let n = PRIM_CharOrd(c) in
          match let y = '\n' in
          PRIM_EqChar(c,y) with
          | true1 ->
            let _ =
              let _ = Unit0 in
              (put_char '\n') in
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
              let _ =
                let _ = Unit0 in
                (put_char '\n') in
              let xs = Cons1(controlD, acc) in
              let loop =
                fix (fun loop acc ->
                  (fun xs ->
                    match xs with
                    | Nil0 -> acc
                    | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
              ((loop Nil0) xs)
            | false0 ->
              match let b = 127 in
              PRIM_LessInt(b,n) with
              | true1 -> (loop acc)
              | false0 ->
                match let y = 127 in
                PRIM_EqInt(n,y) with
                | true1 ->
                  match acc with
                  | Nil0 -> (loop acc)
                  | Cons1(c,tail) ->
                    let _ =
                      match (let a = PRIM_CharOrd(c) in
                      (fun b ->
                        let b = PRIM_LessInt(b,a) in
                        match b with
                        | true1 -> false0
                        | false0 -> true1)
                      26) with
                      | true1 ->
                        let _ = Unit0 in
                        let backspace =
                          let x = 8 in
                          PRIM_CharChr(x) in
                        let _ = (put_char backspace) in
                        let _ = (put_char ' ') in
                        (put_char backspace)
                      | false0 -> Unit0 in
                    let _ =
                      let _ = Unit0 in
                      let backspace =
                        let x = 8 in
                        PRIM_CharChr(x) in
                      let _ = (put_char backspace) in
                      let _ = (put_char ' ') in
                      (put_char backspace) in
                    (loop tail)
                | false0 ->
                  let _ = (put_char c) in
                  (loop Cons1(c, acc))) in
      (loop Nil0) in
    match (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) xs) single_controlD) with
    | true1 -> Unit0
    | false0 ->
      let _ =
        let words =
          let loop =
            fix (fun loop accWs ->
              (fun accCs ->
                (fun xs ->
                  match xs with
                  | Nil0 ->
                    let xs =
                      (let x =
                        let loop =
                          fix (fun loop acc ->
                            (fun xs ->
                              match xs with
                              | Nil0 -> acc
                              | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
                        ((loop Nil0) accCs) in
                      (fun y -> Cons1(x, y))
                      accWs) in
                    let loop =
                      fix (fun loop acc ->
                        (fun xs ->
                          match xs with
                          | Nil0 -> acc
                          | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
                    ((loop Nil0) xs)
                  | Cons1(x,xs) ->
                    match let y = ' ' in
                    PRIM_EqChar(x,y) with
                    | true1 ->
                      (((loop
                      (let x =
                        let loop =
                          fix (fun loop acc ->
                            (fun xs ->
                              match xs with
                              | Nil0 -> acc
                              | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
                        ((loop Nil0) accCs) in
                      (fun y -> Cons1(x, y))
                      accWs))
                      Nil0)
                      xs)
                    | false0 -> (((loop accWs) Cons1(x, accCs)) xs)))) in
          (((loop Nil0) Nil0) xs) in
        match words with
        | Nil0 -> Unit0
        | Cons1(command,args) ->
          match let b =
            let x = "fib" in
            PRIM_Explode(x) in
          (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) command) b) with
          | true1 ->
            let _ =
              let s = "fib: " in
              (put_chars PRIM_Explode(s)) in
            match args with
            | Nil0 ->
              let s = "expected an argument" in
              let _ =
                let s = "ERROR: " in
                (put_chars PRIM_Explode(s)) in
              let _ = (put_chars PRIM_Explode(s)) in
              let _ = Unit0 in
              (put_char '\n')
            | Cons1(arg1,more) ->
              match more with
              | Cons1(_,_) ->
                let s = "expected exactly one argument" in
                let _ =
                  let s = "ERROR: " in
                  (put_chars PRIM_Explode(s)) in
                let _ = (put_chars PRIM_Explode(s)) in
                let _ = Unit0 in
                (put_char '\n')
              | Nil0 ->
                match let loop =
                  fix (fun loop acc ->
                    (fun xs ->
                      match xs with
                      | Nil0 -> Some0(acc)
                      | Cons1(x,xs) ->
                        match let n =
                          (let x = PRIM_CharOrd(x) in
                          (fun y -> PRIM_SubInt(x,y))
                          let x = '0' in
                          PRIM_CharOrd(x)) in
                        match let b = 0 in
                        let b = PRIM_LessInt(n,b) in
                        match b with
                        | true1 -> false0
                        | false0 -> true1 with
                        | true1 ->
                          match let b = 9 in
                          let b = PRIM_LessInt(b,n) in
                          match b with
                          | true1 -> false0
                          | false0 -> true1 with
                          | true1 -> Some0(n)
                          | false0 -> None1
                        | false0 -> None1 with
                        | None1 -> None1
                        | Some0(d) ->
                          ((loop
                          (let x =
                            (let x = 10 in
                            (fun y -> PRIM_MulInt(x,y))
                            acc) in
                          (fun y -> PRIM_AddInt(x,y))
                          d))
                          xs))) in
                ((loop 0) arg1) with
                | None1 ->
                  let s = "expected arg1 to be numeric" in
                  let _ =
                    let s = "ERROR: " in
                    (put_chars PRIM_Explode(s)) in
                  let _ = (put_chars PRIM_Explode(s)) in
                  let _ = Unit0 in
                  (put_char '\n')
                | Some0(n) ->
                  let res = (fib n) in
                  let _ =
                    (put_chars
                    let ord0 =
                      let x = '0' in
                      PRIM_CharOrd(x) in
                    let loop =
                      fix (fun loop acc ->
                        (fun i ->
                          match let y = 0 in
                          PRIM_EqInt(i,y) with
                          | true1 -> acc
                          | false0 ->
                            ((loop
                            (let x =
                              let c =
                                let y = 10 in
                                PRIM_ModInt(i,y) in
                              let x = PRIM_AddInt(ord0,c) in
                              PRIM_CharChr(x) in
                            (fun xs -> Cons1(x, xs))
                            acc))
                            let y = 10 in
                            PRIM_DivInt(i,y)))) in
                    match let y = 0 in
                    PRIM_EqInt(n,y) with
                    | true1 ->
                      (let x = '0' in
                      (fun xs -> Cons1(x, xs))
                      Nil0)
                    | false0 -> ((loop Nil0) n)) in
                  let _ =
                    let s = " --> " in
                    (put_chars PRIM_Explode(s)) in
                  let _ =
                    (put_chars
                    let ord0 =
                      let x = '0' in
                      PRIM_CharOrd(x) in
                    let loop =
                      fix (fun loop acc ->
                        (fun i ->
                          match let y = 0 in
                          PRIM_EqInt(i,y) with
                          | true1 -> acc
                          | false0 ->
                            ((loop
                            (let x =
                              let c =
                                let y = 10 in
                                PRIM_ModInt(i,y) in
                              let x = PRIM_AddInt(ord0,c) in
                              PRIM_CharChr(x) in
                            (fun xs -> Cons1(x, xs))
                            acc))
                            let y = 10 in
                            PRIM_DivInt(i,y)))) in
                    match let y = 0 in
                    PRIM_EqInt(res,y) with
                    | true1 ->
                      (let x = '0' in
                      (fun xs -> Cons1(x, xs))
                      Nil0)
                    | false0 -> ((loop Nil0) res)) in
                  let _ = Unit0 in
                  (put_char '\n')
          | false0 ->
            match let b =
              let x = "fact" in
              PRIM_Explode(x) in
            (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) command) b) with
            | true1 ->
              let _ =
                let s = "fact: " in
                (put_chars PRIM_Explode(s)) in
              match args with
              | Nil0 ->
                let s = "expected an argument" in
                let _ =
                  let s = "ERROR: " in
                  (put_chars PRIM_Explode(s)) in
                let _ = (put_chars PRIM_Explode(s)) in
                let _ = Unit0 in
                (put_char '\n')
              | Cons1(arg1,more) ->
                match more with
                | Cons1(_,_) ->
                  let s = "expected exactly one argument" in
                  let _ =
                    let s = "ERROR: " in
                    (put_chars PRIM_Explode(s)) in
                  let _ = (put_chars PRIM_Explode(s)) in
                  let _ = Unit0 in
                  (put_char '\n')
                | Nil0 ->
                  match let loop =
                    fix (fun loop acc ->
                      (fun xs ->
                        match xs with
                        | Nil0 -> Some0(acc)
                        | Cons1(x,xs) ->
                          match let n =
                            (let x = PRIM_CharOrd(x) in
                            (fun y -> PRIM_SubInt(x,y))
                            let x = '0' in
                            PRIM_CharOrd(x)) in
                          match let b = 0 in
                          let b = PRIM_LessInt(n,b) in
                          match b with
                          | true1 -> false0
                          | false0 -> true1 with
                          | true1 ->
                            match let b = 9 in
                            let b = PRIM_LessInt(b,n) in
                            match b with
                            | true1 -> false0
                            | false0 -> true1 with
                            | true1 -> Some0(n)
                            | false0 -> None1
                          | false0 -> None1 with
                          | None1 -> None1
                          | Some0(d) ->
                            ((loop
                            (let x =
                              (let x = 10 in
                              (fun y -> PRIM_MulInt(x,y))
                              acc) in
                            (fun y -> PRIM_AddInt(x,y))
                            d))
                            xs))) in
                  ((loop 0) arg1) with
                  | None1 ->
                    let s = "expected arg1 to be numeric" in
                    let _ =
                      let s = "ERROR: " in
                      (put_chars PRIM_Explode(s)) in
                    let _ = (put_chars PRIM_Explode(s)) in
                    let _ = Unit0 in
                    (put_char '\n')
                  | Some0(n) ->
                    let res = (fact n) in
                    let _ =
                      (put_chars
                      let ord0 =
                        let x = '0' in
                        PRIM_CharOrd(x) in
                      let loop =
                        fix (fun loop acc ->
                          (fun i ->
                            match let y = 0 in
                            PRIM_EqInt(i,y) with
                            | true1 -> acc
                            | false0 ->
                              ((loop
                              (let x =
                                let c =
                                  let y = 10 in
                                  PRIM_ModInt(i,y) in
                                let x = PRIM_AddInt(ord0,c) in
                                PRIM_CharChr(x) in
                              (fun xs -> Cons1(x, xs))
                              acc))
                              let y = 10 in
                              PRIM_DivInt(i,y)))) in
                      match let y = 0 in
                      PRIM_EqInt(n,y) with
                      | true1 ->
                        (let x = '0' in
                        (fun xs -> Cons1(x, xs))
                        Nil0)
                      | false0 -> ((loop Nil0) n)) in
                    let _ =
                      let s = " --> " in
                      (put_chars PRIM_Explode(s)) in
                    let _ =
                      (put_chars
                      let ord0 =
                        let x = '0' in
                        PRIM_CharOrd(x) in
                      let loop =
                        fix (fun loop acc ->
                          (fun i ->
                            match let y = 0 in
                            PRIM_EqInt(i,y) with
                            | true1 -> acc
                            | false0 ->
                              ((loop
                              (let x =
                                let c =
                                  let y = 10 in
                                  PRIM_ModInt(i,y) in
                                let x = PRIM_AddInt(ord0,c) in
                                PRIM_CharChr(x) in
                              (fun xs -> Cons1(x, xs))
                              acc))
                              let y = 10 in
                              PRIM_DivInt(i,y)))) in
                      match let y = 0 in
                      PRIM_EqInt(res,y) with
                      | true1 ->
                        (let x = '0' in
                        (fun xs -> Cons1(x, xs))
                        Nil0)
                      | false0 -> ((loop Nil0) res)) in
                    let _ = Unit0 in
                    (put_char '\n')
            | false0 ->
              match let b =
                let x = "rev" in
                PRIM_Explode(x) in
              (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) command) b) with
              | true1 ->
                match args with
                | Cons1(_,_) ->
                  let s = "rev: expected no arguments" in
                  let _ =
                    let s = "ERROR: " in
                    (put_chars PRIM_Explode(s)) in
                  let _ = (put_chars PRIM_Explode(s)) in
                  let _ = Unit0 in
                  (put_char '\n')
                | Nil0 ->
                  let _ =
                    let s = "(reverse typed lines until ^D)\n" in
                    (put_chars PRIM_Explode(s)) in
                  let _ = Unit0 in
                  let loop =
                    fix (fun loop _ ->
                      let xs =
                        let _ = Unit0 in
                        let controlD =
                          let x = 4 in
                          PRIM_CharChr(x) in
                        let loop =
                          fix (fun loop acc ->
                            let c =
                              let x = Unit0 in
                              PRIM_GetChar(x) in
                            let n = PRIM_CharOrd(c) in
                            match let y = '\n' in
                            PRIM_EqChar(c,y) with
                            | true1 ->
                              let _ =
                                let _ = Unit0 in
                                (put_char '\n') in
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
                                let _ =
                                  let _ = Unit0 in
                                  (put_char '\n') in
                                let xs = Cons1(controlD, acc) in
                                let loop =
                                  fix (fun loop acc ->
                                    (fun xs ->
                                      match xs with
                                      | Nil0 -> acc
                                      | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
                                ((loop Nil0) xs)
                              | false0 ->
                                match let b = 127 in
                                PRIM_LessInt(b,n) with
                                | true1 -> (loop acc)
                                | false0 ->
                                  match let y = 127 in
                                  PRIM_EqInt(n,y) with
                                  | true1 ->
                                    match acc with
                                    | Nil0 -> (loop acc)
                                    | Cons1(c,tail) ->
                                      let _ =
                                        match (let a = PRIM_CharOrd(c) in
                                        (fun b ->
                                          let b = PRIM_LessInt(b,a) in
                                          match b with
                                          | true1 -> false0
                                          | false0 -> true1)
                                        26) with
                                        | true1 ->
                                          let _ = Unit0 in
                                          let backspace =
                                            let x = 8 in
                                            PRIM_CharChr(x) in
                                          let _ = (put_char backspace) in
                                          let _ = (put_char ' ') in
                                          (put_char backspace)
                                        | false0 -> Unit0 in
                                      let _ =
                                        let _ = Unit0 in
                                        let backspace =
                                          let x = 8 in
                                          PRIM_CharChr(x) in
                                        let _ = (put_char backspace) in
                                        let _ = (put_char ' ') in
                                        (put_char backspace) in
                                      (loop tail)
                                  | false0 ->
                                    let _ = (put_char c) in
                                    (loop Cons1(c, acc))) in
                        (loop Nil0) in
                      match (((eq_list (fun x -> (fun y -> PRIM_EqChar(x,y)))) xs) single_controlD) with
                      | true1 -> Unit0
                      | false0 ->
                        let _ =
                          (put_chars
                          let loop =
                            fix (fun loop acc ->
                              (fun xs ->
                                match xs with
                                | Nil0 -> acc
                                | Cons1(x,xs) -> ((loop Cons1(x, acc)) xs))) in
                          ((loop Nil0) xs)) in
                        let _ =
                          let _ = Unit0 in
                          (put_char '\n') in
                        (loop Unit0)) in
                  (loop Unit0)
              | false0 ->
                let star_the_ohs =
                  (map
                  (fun c ->
                    match let y = 'o' in
                    PRIM_EqChar(c,y) with
                    | true1 -> '*'
                    | false0 -> c)) in
                let n = (length xs) in
                let _ =
                  (put_chars
                  ((append
                  let x = "You wrote: \"" in
                  PRIM_Explode(x))
                  (star_the_ohs xs))) in
                let _ =
                  let s = "\" (" in
                  (put_chars PRIM_Explode(s)) in
                let _ =
                  (put_chars
                  let ord0 =
                    let x = '0' in
                    PRIM_CharOrd(x) in
                  let loop =
                    fix (fun loop acc ->
                      (fun i ->
                        match let y = 0 in
                        PRIM_EqInt(i,y) with
                        | true1 -> acc
                        | false0 ->
                          ((loop
                          (let x =
                            let c =
                              let y = 10 in
                              PRIM_ModInt(i,y) in
                            let x = PRIM_AddInt(ord0,c) in
                            PRIM_CharChr(x) in
                          (fun xs -> Cons1(x, xs))
                          acc))
                          let y = 10 in
                          PRIM_DivInt(i,y)))) in
                  match let y = 0 in
                  PRIM_EqInt(n,y) with
                  | true1 ->
                    (let x = '0' in
                    (fun xs -> Cons1(x, xs))
                    Nil0)
                  | false0 -> ((loop Nil0) n)) in
                let _ =
                  let s = " chars)" in
                  (put_chars PRIM_Explode(s)) in
                let _ = Unit0 in
                (put_char '\n') in
      (mainloop Unit0)) in
let _ = Unit0 in
let _ =
  let s = "This is a shell prototype. Try: fib, fact, rev\n" in
  (put_chars PRIM_Explode(s)) in
(mainloop Unit0)
