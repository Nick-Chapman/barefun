(*stage0*)
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
let :: = (fun x -> (fun y -> Cons(x, y))) in
let not = (fun b ->
  match b with
  | true -> false
  | false -> true) in
let > = (fun a -> (fun b -> ((< b) a))) in
let <= = (fun a -> (fun b -> (not ((< b) a)))) in
let >= = (fun a -> (fun b -> (not ((< a) b)))) in
let put_char = (fun c ->
  let backspace = 8 in
  let n = (ord c) in
  match ((= n) backspace) with
  | true -> (put_char c)
  | false ->
    match ((eq_char c) '\n') with
    | true -> (put_char c)
    | false ->
      match ((> n) 26) with
      | true -> (put_char c)
      | false ->
        let _ = (put_char '^') in
        (put_char (chr ((- ((+ (ord 'A')) n)) 1)))) in
let erase_char = (fun _ ->
  let backspace = (chr 8) in
  let _ = (put_char backspace) in
  let _ = (put_char ' ') in
  (put_char backspace)) in
type _ = Some | None
let parse_digit = (fun c ->
  let n = ((- (ord c)) (ord '0')) in
  match ((>= n) 0) with
  | true ->
    match ((<= n) 9) with
    | true -> Some(n)
    | false -> None
  | false -> None) in
let parse_num = (fun s ->
  let loop = fix (fun loop acc ->
    (fun xs ->
      match xs with
      | Nil -> Some(acc)
      | Cons(x,xs) ->
        match (parse_digit x) with
        | None -> None
        | Some(d) -> ((loop ((+ ((( * ) 10) acc)) d)) xs))) in
  ((loop 0) s)) in
let cons = (fun x -> (fun xs -> ((:: x) xs))) in
let eq_list = fix (fun eq_list eq ->
  (fun xs ->
    (fun ys ->
      match xs with
      | Nil ->
        match ys with
        | Nil -> true
        | Cons(_,_) -> false
      | Cons(x,xs) ->
        match ys with
        | Nil -> false
        | Cons(y,ys) ->
          match ((eq x) y) with
          | true -> (((eq_list eq) xs) ys)
          | false -> false))) in
let eq_char_list = (fun a -> (fun b -> (((eq_list eq_char) a) b))) in
let append = fix (fun append xs ->
  (fun ys ->
    match xs with
    | Nil -> ys
    | Cons(x,xs) -> ((cons x) ((append xs) ys)))) in
let reverse = (fun xs ->
  let loop = fix (fun loop acc ->
    (fun xs ->
      match xs with
      | Nil -> acc
      | Cons(x,xs) -> ((loop ((cons x) acc)) xs))) in
  ((loop Nil) xs)) in
let map = fix (fun map f ->
  (fun xs ->
    match xs with
    | Nil -> Nil
    | Cons(x,xs) -> ((:: (f x)) ((map f) xs)))) in
let length = fix (fun length xs ->
  match xs with
  | Nil -> 0
  | Cons(_,xs) -> ((+ 1) (length xs))) in
let chars_of_int = (fun i ->
  let ord0 = (ord '0') in
  let char_of_digit = (fun c -> (chr ((+ ord0) c))) in
  let loop = fix (fun loop acc ->
    (fun i ->
      match ((= i) 0) with
      | true -> acc
      | false -> ((loop ((cons (char_of_digit ((% i) 10))) acc)) ((/ i) 10)))) in
  match ((= i) 0) with
  | true -> ((cons '0') Nil)
  | false -> ((loop Nil) i)) in
let put_chars = fix (fun put_chars xs ->
  match xs with
  | Nil -> Unit
  | Cons(x,xs) ->
    let _ = (put_char x) in
    (put_chars xs)) in
let put_string = (fun s -> (put_chars (explode s))) in
let put_int = (fun i -> (put_chars (chars_of_int i))) in
let newline = (fun _ -> (put_char '\n')) in
let read_line = (fun _ ->
  let controlD = (chr 4) in
  let loop = fix (fun loop acc ->
    let c = (get_char Unit) in
    let n = (ord c) in
    match ((eq_char c) '\n') with
    | true ->
      let _ = (newline Unit) in
      (reverse acc)
    | false ->
      match ((eq_char c) controlD) with
      | true ->
        let _ = (put_char c) in
        let _ = (newline Unit) in
        (reverse ((:: controlD) acc))
      | false ->
        match ((> n) 127) with
        | true -> (loop acc)
        | false ->
          match ((= n) 127) with
          | true ->
            match acc with
            | Nil -> (loop acc)
            | Cons(c,tail) ->
              let _ = match ((<= (ord c)) 26) with
              | true -> (erase_char Unit)
              | false -> Unit in
              let _ = (erase_char Unit) in
              (loop tail)
          | false ->
            let _ = (put_char c) in
            (loop ((cons c) acc))) in
  (loop Nil)) in
let fib = fix (fun fib n ->
  match ((< n) 2) with
  | true -> n
  | false -> ((+ (fib ((- n) 1))) (fib ((- n) 2)))) in
let fact = fix (fun fact n ->
  match ((>= n) 2) with
  | true -> ((( * ) (fact ((- n) 1))) n)
  | false -> 1) in
let error = (fun s ->
  let _ = (put_string "ERROR: ") in
  let _ = (put_string s) in
  (newline Unit)) in
let runfib = (fun args ->
  let _ = (put_string "fib: ") in
  match args with
  | Nil -> (error "expected an argument")
  | Cons(arg1,more) ->
    match more with
    | Cons(_,_) -> (error "expected exactly one argument")
    | Nil ->
      match (parse_num arg1) with
      | None -> (error "expected arg1 to be numeric")
      | Some(n) ->
        let res = (fib n) in
        let _ = (put_int n) in
        let _ = (put_string " --> ") in
        let _ = (put_int res) in
        (newline Unit)) in
let runfact = (fun args ->
  let _ = (put_string "fact: ") in
  match args with
  | Nil -> (error "expected an argument")
  | Cons(arg1,more) ->
    match more with
    | Cons(_,_) -> (error "expected exactly one argument")
    | Nil ->
      match (parse_num arg1) with
      | None -> (error "expected arg1 to be numeric")
      | Some(n) ->
        let res = (fact n) in
        let _ = (put_int n) in
        let _ = (put_string " --> ") in
        let _ = (put_int res) in
        (newline Unit)) in
let single_controlD = ((:: (chr 4)) Nil) in
let rev = (fun _ ->
  let loop = fix (fun loop _ ->
    let xs = (read_line Unit) in
    match ((eq_char_list xs) single_controlD) with
    | true -> Unit
    | false ->
      let _ = (put_chars (reverse xs)) in
      let _ = (newline Unit) in
      (loop Unit)) in
  (loop Unit)) in
let runrev = (fun args ->
  match args with
  | Cons(_,_) -> (error "rev: expected no arguments")
  | Nil ->
    let _ = (put_string "(reverse typed lines until ^D)\n") in
    (rev Unit)) in
let fallback = (fun line ->
  let star_the_ohs = (map
  (fun c ->
    match ((eq_char c) 'o') with
    | true -> '*'
    | false -> c)) in
  let n = (length line) in
  let _ = (put_chars ((append (explode "You wrote: \"")) (star_the_ohs line))) in
  let _ = (put_string "\" (") in
  let _ = (put_int n) in
  let _ = (put_string " chars)") in
  (newline Unit)) in
let split_words = (fun s ->
  let loop = fix (fun loop accWs ->
    (fun accCs ->
      (fun xs ->
        match xs with
        | Nil -> (reverse ((:: (reverse accCs)) accWs))
        | Cons(x,xs) ->
          match ((eq_char x) ' ') with
          | true -> (((loop ((:: (reverse accCs)) accWs)) Nil) xs)
          | false -> (((loop accWs) ((:: x) accCs)) xs)))) in
  (((loop Nil) Nil) s)) in
let execute = (fun line ->
  let words = (split_words line) in
  match words with
  | Nil -> Unit
  | Cons(command,args) ->
    match ((eq_char_list command) (explode "fib")) with
    | true -> (runfib args)
    | false ->
      match ((eq_char_list command) (explode "fact")) with
      | true -> (runfact args)
      | false ->
        match ((eq_char_list command) (explode "rev")) with
        | true -> (runrev args)
        | false -> (fallback line)) in
let mainloop = fix (fun mainloop _ ->
  let _ = (put_chars Cons('>', Cons(' ', Nil))) in
  let xs = (read_line Unit) in
  match ((eq_char_list xs) single_controlD) with
  | true -> Unit
  | false ->
    let _ = (execute xs) in
    (mainloop Unit)) in
let main = (fun _ ->
  let _ = (put_string "This is a shell prototype. Try: fib, fact, rev\n") in
  (mainloop Unit)) in
