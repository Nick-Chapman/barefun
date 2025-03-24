[ast]
----------
let + = (fun x -> (fun y -> PRIM:AddInt[x,y])) in
let - = (fun x -> (fun y -> PRIM:SubInt[x,y])) in
let ( * ) = (fun x -> (fun y -> PRIM:MulInt[x,y])) in
let / = (fun x -> (fun y -> PRIM:DivInt[x,y])) in
let % = (fun x -> (fun y -> PRIM:ModInt[x,y])) in
let < = (fun x -> (fun y -> PRIM:LessInt[x,y])) in
let = = (fun x -> (fun y -> PRIM:EqInt[x,y])) in
let eq_char = (fun x -> (fun y -> PRIM:EqChar[x,y])) in
let ord = (fun x -> PRIM:CharOrd[x]) in
let chr = (fun x -> PRIM:CharChr[x]) in
let explode = (fun x -> PRIM:Explode[x]) in
let put_char = (fun x -> PRIM:PutChar[x]) in
let get_char = (fun x -> PRIM:GetChar[x]) in
let :: = (fun x -> (fun y -> ::(x, y))) in
let not =
  (fun b ->
    match b with
    | true[] -> false
    | false[] -> true) in
let > = (fun a -> (fun b -> ((< b) a))) in
let <= = (fun a -> (fun b -> (not ((< b) a)))) in
let >= = (fun a -> (fun b -> (not ((< a) b)))) in
type _ = Some | None
let parse_digit =
  (fun c ->
    let n = ((- (ord c)) (ord '0')) in
    match ((>= n) 0) with
    | true[] ->
      match ((<= n) 9) with
      | true[] -> Some(n)
      | false[] -> None
    | false[] -> None) in
let parse_num =
  let loop =
    fix (fun loop acc ->
      (fun xs ->
        match xs with
        | [][] -> Some(acc)
        | ::[x,xs] ->
          match (parse_digit x) with
          | None[] -> None
          | Some[d] -> ((loop ((+ ((( * ) 10) acc)) d)) xs))) in
  (loop 0) in
let cons = (fun x -> (fun xs -> ((:: x) xs))) in
let eq_list =
  fix (fun eq_list eq ->
    (fun xs ->
      (fun ys ->
        match xs with
        | [][] ->
          match ys with
          | [][] -> true
          | ::[_,_] -> false
        | ::[x,xs] ->
          match ys with
          | [][] -> false
          | ::[y,ys] ->
            match ((eq x) y) with
            | true[] -> (((eq_list eq) xs) ys)
            | false[] -> false))) in
let eq_char_list = (eq_list eq_char) in
let append =
  fix (fun append xs ->
    (fun ys ->
      match xs with
      | [][] -> ys
      | ::[x,xs] -> ((cons x) ((append xs) ys)))) in
let reverse =
  (fun xs ->
    let loop =
      fix (fun loop acc ->
        (fun xs ->
          match xs with
          | [][] -> acc
          | ::[x,xs] -> ((loop ((cons x) acc)) xs))) in
    ((loop []) xs)) in
let map =
  fix (fun map f ->
    (fun xs ->
      match xs with
      | [][] -> []
      | ::[x,xs] -> ((:: (f x)) ((map f) xs)))) in
let length =
  fix (fun length xs ->
    match xs with
    | [][] -> 0
    | ::[_,xs] -> ((+ 1) (length xs))) in
let chars_of_int =
  let ord0 = (ord '0') in
  let char_of_digit = (fun c -> (chr ((+ ord0) c))) in
  let loop =
    fix (fun loop acc ->
      (fun i ->
        match ((= i) 0) with
        | true[] -> acc
        | false[] -> ((loop ((cons (char_of_digit ((% i) 10))) acc)) ((/ i) 10)))) in
  (fun i ->
    match ((= i) 0) with
    | true[] -> ((cons '0') [])
    | false[] -> ((loop []) i)) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | [][] -> Unit
    | ::[x,xs] ->
      let _ = (put_char x) in
      (put_chars xs)) in
let put_string = (fun s -> (put_chars (explode s))) in
let put_int = (fun i -> (put_chars (chars_of_int i))) in
let newline = (fun _ -> (put_char '\n')) in
let put_string_newline =
  (fun s ->
    let _ = (put_string s) in
    (newline Unit)) in
let read_line =
  let loop =
    fix (fun loop acc ->
      let c = (get_char Unit) in
      let n = (ord c) in
      match ((eq_char c) '\n') with
      | true[] ->
        let _ = (newline Unit) in
        (reverse acc)
      | false[] ->
        match ((<= n) 31) with
        | true[] -> (loop acc)
        | false[] ->
          match ((> n) 127) with
          | true[] -> (loop acc)
          | false[] ->
            match ((= n) 127) with
            | true[] ->
              match acc with
              | [][] -> (loop acc)
              | ::[_,tail] ->
                let _ = (put_char (chr 8)) in
                let _ = (put_char ' ') in
                let _ = (put_char (chr 8)) in
                (loop tail)
            | false[] ->
              let _ = (put_char c) in
              (loop ((cons c) acc))) in
  (fun _ -> (loop [])) in
let fib =
  fix (fun fib n ->
    match ((< n) 2) with
    | true[] -> n
    | false[] -> ((+ (fib ((- n) 1))) (fib ((- n) 2)))) in
let fact =
  fix (fun fact n ->
    match ((>= n) 2) with
    | true[] -> ((( * ) (fact ((- n) 1))) n)
    | false[] -> 1) in
let error =
  (fun s ->
    let _ = (put_string "ERROR: ") in
    let _ = (put_string s) in
    (newline Unit)) in
let runfib =
  (fun args ->
    let _ = (put_string "fib: ") in
    match args with
    | [][] -> (error "expected an argument")
    | ::[arg1,more] ->
      match more with
      | ::[_,_] -> (error "expected exactly one argument")
      | [][] ->
        match (parse_num arg1) with
        | None[] -> (error "expected arg1 to be numeric")
        | Some[n] ->
          let res = (fib n) in
          let _ = (put_int n) in
          let _ = (put_string " --> ") in
          let _ = (put_int res) in
          (newline Unit)) in
let runfact =
  (fun args ->
    let _ = (put_string "fact: ") in
    match args with
    | [][] -> (error "expected an argument")
    | ::[arg1,more] ->
      match more with
      | ::[_,_] -> (error "expected exactly one argument")
      | [][] ->
        match (parse_num arg1) with
        | None[] -> (error "expected arg1 to be numeric")
        | Some[n] ->
          let res = (fact n) in
          let _ = (put_int n) in
          let _ = (put_string " --> ") in
          let _ = (put_int res) in
          (newline Unit)) in
let fallback =
  (fun line ->
    let star_the_ohs =
      (map
      (fun c ->
        match ((eq_char c) 'o') with
        | true[] -> '*'
        | false[] -> c)) in
    let n = ((+ 100) (length line)) in
    let _ = (put_chars ((append (explode "You wrote: ")) (star_the_ohs line))) in
    let _ = (put_char ' ') in
    let _ = (put_char '{') in
    let _ = (put_int n) in
    let _ = (put_char '}') in
    (newline Unit)) in
let split_words =
  let loop =
    fix (fun loop accWs ->
      (fun accCs ->
        (fun xs ->
          match xs with
          | [][] -> (reverse ((:: (reverse accCs)) accWs))
          | ::[x,xs] ->
            match ((eq_char x) ' ') with
            | true[] -> (((loop ((:: (reverse accCs)) accWs)) []) xs)
            | false[] -> (((loop accWs) ((:: x) accCs)) xs)))) in
  ((loop []) []) in
let execute =
  (fun line ->
    let words = (split_words line) in
    match words with
    | [][] -> Unit
    | ::[command,args] ->
      match ((eq_char_list command) (explode "fib")) with
      | true[] -> (runfib args)
      | false[] ->
        match ((eq_char_list command) (explode "fact")) with
        | true[] -> (runfact args)
        | false[] -> (fallback line)) in
let mainloop =
  fix (fun mainloop _ ->
    let _ = (put_char '>') in
    let _ = (put_char ' ') in
    let xs = (read_line Unit) in
    let _ = (execute xs) in
    (mainloop Unit)) in
let _ = (put_string_newline "LOAD") in
let main =
  (fun _ ->
    let _ = (put_string_newline "RUN") in
    let _ = (mainloop Unit) in
    (put_string_newline "NEVER")) in
----------
