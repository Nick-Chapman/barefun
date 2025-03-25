(*stage1*)
let + = (fun x -> (fun y -> PRIM_AddInt(x,y))) in
let - = (fun x -> (fun y -> PRIM_SubInt(x,y))) in
let ( * ) = (fun x -> (fun y -> PRIM_MulInt(x,y))) in
let / = (fun x -> (fun y -> PRIM_DivInt(x,y))) in
let % = (fun x -> (fun y -> PRIM_ModInt(x,y))) in
let < = (fun x -> (fun y -> PRIM_LessInt(x,y))) in
let = = (fun x -> (fun y -> PRIM_EqInt(x,y))) in
let eq_char = (fun x -> (fun y -> PRIM_EqChar(x,y))) in
let ord = (fun x -> PRIM_CharOrd(x)) in
let chr = (fun x -> PRIM_CharChr(x)) in
let explode = (fun x -> PRIM_Explode(x)) in
let put_char = (fun x -> PRIM_PutChar(x)) in
let get_char = (fun x -> PRIM_GetChar(x)) in
let :: = (fun x -> (fun y -> Cons1(x, y))) in
let not = (fun b ->
  match b with
  | true1 -> false0
  | false0 -> true1) in
let > = (fun a -> (fun b -> ((< b) a))) in
let <= = (fun a -> (fun b -> (not ((< b) a)))) in
let >= = (fun a -> (fun b -> (not ((< a) b)))) in
let parse_digit = (fun c ->
  let n = ((- (ord c)) (ord '0')) in
  match ((>= n) 0) with
  | true1 ->
    match ((<= n) 9) with
    | true1 -> Some0(n)
    | false0 -> None1
  | false0 -> None1) in
let parse_num = (fun s ->
  let loop = fix (fun loop acc ->
    (fun xs ->
      match xs with
      | Nil0 -> Some0(acc)
      | Cons1(x,xs) ->
        match (parse_digit x) with
        | None1 -> None1
        | Some0(d) -> ((loop ((+ ((( * ) 10) acc)) d)) xs))) in
  ((loop 0) s)) in
let cons = (fun x -> (fun xs -> ((:: x) xs))) in
let eq_list = fix (fun eq_list eq ->
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
let eq_char_list = (fun a -> (fun b -> (((eq_list eq_char) a) b))) in
let append = fix (fun append xs ->
  (fun ys ->
    match xs with
    | Nil0 -> ys
    | Cons1(x,xs) -> ((cons x) ((append xs) ys)))) in
let reverse = (fun xs ->
  let loop = fix (fun loop acc ->
    (fun xs ->
      match xs with
      | Nil0 -> acc
      | Cons1(x,xs) -> ((loop ((cons x) acc)) xs))) in
  ((loop Nil0) xs)) in
let map = fix (fun map f ->
  (fun xs ->
    match xs with
    | Nil0 -> Nil0
    | Cons1(x,xs) -> ((:: (f x)) ((map f) xs)))) in
let length = fix (fun length xs ->
  match xs with
  | Nil0 -> 0
  | Cons1(_,xs) -> ((+ 1) (length xs))) in
let chars_of_int = (fun i ->
  let ord0 = (ord '0') in
  let char_of_digit = (fun c -> (chr ((+ ord0) c))) in
  let loop = fix (fun loop acc ->
    (fun i ->
      match ((= i) 0) with
      | true1 -> acc
      | false0 -> ((loop ((cons (char_of_digit ((% i) 10))) acc)) ((/ i) 10)))) in
  match ((= i) 0) with
  | true1 -> ((cons '0') Nil0)
  | false0 -> ((loop Nil0) i)) in
let put_chars = fix (fun put_chars xs ->
  match xs with
  | Nil0 -> Unit0
  | Cons1(x,xs) ->
    let _ = (put_char x) in
    (put_chars xs)) in
let put_string = (fun s -> (put_chars (explode s))) in
let put_int = (fun i -> (put_chars (chars_of_int i))) in
let newline = (fun _ -> (put_char '\n')) in
let put_string_newline = (fun s ->
  let _ = (put_string s) in
  (newline Unit0)) in
let read_line = (fun _ ->
  let loop = fix (fun loop acc ->
    let c = (get_char Unit0) in
    let n = (ord c) in
    match ((eq_char c) '\n') with
    | true1 ->
      let _ = (newline Unit0) in
      (reverse acc)
    | false0 ->
      match ((<= n) 31) with
      | true1 -> (loop acc)
      | false0 ->
        match ((> n) 127) with
        | true1 -> (loop acc)
        | false0 ->
          match ((= n) 127) with
          | true1 ->
            match acc with
            | Nil0 -> (loop acc)
            | Cons1(_,tail) ->
              let _ = (put_char (chr 8)) in
              let _ = (put_char ' ') in
              let _ = (put_char (chr 8)) in
              (loop tail)
          | false0 ->
            let _ = (put_char c) in
            (loop ((cons c) acc))) in
  (loop Nil0)) in
let fib = fix (fun fib n ->
  match ((< n) 2) with
  | true1 -> n
  | false0 -> ((+ (fib ((- n) 1))) (fib ((- n) 2)))) in
let fact = fix (fun fact n ->
  match ((>= n) 2) with
  | true1 -> ((( * ) (fact ((- n) 1))) n)
  | false0 -> 1) in
let error = (fun s ->
  let _ = (put_string "ERROR: ") in
  let _ = (put_string s) in
  (newline Unit0)) in
let runfib = (fun args ->
  let _ = (put_string "fib: ") in
  match args with
  | Nil0 -> (error "expected an argument")
  | Cons1(arg1,more) ->
    match more with
    | Cons1(_,_) -> (error "expected exactly one argument")
    | Nil0 ->
      match (parse_num arg1) with
      | None1 -> (error "expected arg1 to be numeric")
      | Some0(n) ->
        let res = (fib n) in
        let _ = (put_int n) in
        let _ = (put_string " --> ") in
        let _ = (put_int res) in
        (newline Unit0)) in
let runfact = (fun args ->
  let _ = (put_string "fact: ") in
  match args with
  | Nil0 -> (error "expected an argument")
  | Cons1(arg1,more) ->
    match more with
    | Cons1(_,_) -> (error "expected exactly one argument")
    | Nil0 ->
      match (parse_num arg1) with
      | None1 -> (error "expected arg1 to be numeric")
      | Some0(n) ->
        let res = (fact n) in
        let _ = (put_int n) in
        let _ = (put_string " --> ") in
        let _ = (put_int res) in
        (newline Unit0)) in
let fallback = (fun line ->
  let star_the_ohs = (map
  (fun c ->
    match ((eq_char c) 'o') with
    | true1 -> '*'
    | false0 -> c)) in
  let n = ((+ 100) (length line)) in
  let _ = (put_chars ((append (explode "You wrote: ")) (star_the_ohs line))) in
  let _ = (put_char ' ') in
  let _ = (put_char '{') in
  let _ = (put_int n) in
  let _ = (put_char '}') in
  (newline Unit0)) in
let split_words = (fun s ->
  let loop = fix (fun loop accWs ->
    (fun accCs ->
      (fun xs ->
        match xs with
        | Nil0 -> (reverse ((:: (reverse accCs)) accWs))
        | Cons1(x,xs) ->
          match ((eq_char x) ' ') with
          | true1 -> (((loop ((:: (reverse accCs)) accWs)) Nil0) xs)
          | false0 -> (((loop accWs) ((:: x) accCs)) xs)))) in
  (((loop Nil0) Nil0) s)) in
let execute = (fun line ->
  let words = (split_words line) in
  match words with
  | Nil0 -> Unit0
  | Cons1(command,args) ->
    match ((eq_char_list command) (explode "fib")) with
    | true1 -> (runfib args)
    | false0 ->
      match ((eq_char_list command) (explode "fact")) with
      | true1 -> (runfact args)
      | false0 -> (fallback line)) in
let mainloop = fix (fun mainloop _ ->
  let _ = (put_char '>') in
  let _ = (put_char ' ') in
  let xs = (read_line Unit0) in
  let _ = (execute xs) in
  (mainloop Unit0)) in
let _ = (put_string_newline "LOAD") in
let main = (fun _ ->
  let _ = (put_string_newline "RUN") in
  let _ = (mainloop Unit0) in
  (put_string_newline "NEVER")) in
(main Unit0)
