
let not b =
  match b with
  | true -> false
  | false -> true

let (>) a b = b < a
let (<=) a b = not (b < a)
let (>=) a b = not (a < b)

type 'a option = Some of 'a | None

let parse_digit c =
  let n = ord c - ord '0' in
  (* TODO missing parens for "Some(x)" cause haskell evaluation to go wrong. parse mistake? *)
  if n >= 0 then if n <= 9 then Some(n) else None else None

let parse_num s =
  let rec loop acc xs =
    match xs with
    | [] -> Some(acc)
    | x::xs ->
        match parse_digit x with
        | None -> None
        | Some d -> loop (10 * acc + d) xs
  in
  loop 0 s

let cons x xs = x :: xs

let rec eq_list eq xs ys =
  match xs with
  | [] -> (match ys with | [] -> true | _::_ -> false)
  | x::xs ->
     match ys with
     | [] -> false
     | y::ys ->
        if eq x y then eq_list eq xs ys else false

let eq_char_list a b = eq_list eq_char a b

let rec append xs ys = (* non tail-recursive version *)
  match xs with
  | [] -> ys
  | x::xs -> cons x (append xs ys)

let reverse xs = (* eta reduce case ocaml type issue for multiple uses *)
  let rec loop acc xs =
    match xs with
    | [] -> acc
    | x::xs -> loop (cons x acc) xs
  in
  loop [] xs

let rec map f xs =
  match xs with
  | [] -> []
  | x::xs -> f x :: map f xs

let rec length xs =
  match xs with
  | [] -> 0
  | _::xs -> (+) 1 (length xs)

let chars_of_int i =
  let ord0 = ord '0' in
  let char_of_digit c = chr (ord0 + c) in
  let rec loop acc i =
    if i = 0 then acc else
      loop (cons (char_of_digit (i%10)) acc) (i/10)
  in
  if i = 0 then cons '0' [] else loop [] i

let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xs -> put_char x; put_chars xs

let put_string s = put_chars (explode s)

let put_int i = put_chars (chars_of_int i)

let newline () = put_char '\n'

let put_string_newline s =
  put_string s;
  newline ()

let read_line () =
  let rec loop acc =
    let c = get_char () in
    let n = ord c in
    if eq_char c '\n' then (newline(); reverse acc) else
      if n <= 31 then loop acc else
        if n > 127 then loop acc else
          if n = 127 then
            match acc with
            | [] -> loop acc
            | _::tail ->
               (* erase the previous char *)
               put_char (chr 8);
               put_char ' ';
               put_char (chr 8);
               loop tail
          else
            (put_char c; loop (cons c acc))
  in
  loop []

let rec fib n =
  (*put_int n; newline ();*)
  if n < 2 then n else fib (n-1) + fib (n-2)

let rec fact n =
  (*put_int n; newline ();*)
  if n >= 2 then fact (n-1) * n else 1

let error s = put_string "ERROR: "; put_string s; newline ()

let runfib args =
  put_string "fib: ";
  match args with
  | [] -> error "expected an argument"
  | arg1::more ->
     match more with
     | _::_ -> error "expected exactly one argument"
     | [] ->
        match parse_num arg1 with
        | None -> error "expected arg1 to be numeric"
        | Some n ->
           let res = fib n in
           put_int n;
           put_string " --> ";
           put_int res;
           newline ()

let runfact args =
  put_string "fact: ";
  match args with
  | [] -> error "expected an argument"
  | arg1::more ->
     match more with
     | _::_ -> error "expected exactly one argument"
     | [] ->
        match parse_num arg1 with
        | None -> error "expected arg1 to be numeric"
        | Some n ->
           let res = fact n in
           put_int n;
           put_string " --> ";
           put_int res;
           newline ()

let fallback line =
  let star_the_ohs = map (fun c -> if eq_char c 'o' then '*' else c) in
  let n = 100 + length line in
  put_chars (append (explode "You wrote: ") (star_the_ohs line));
  put_char ' ';
  put_char '{';
  put_int n;
  put_char '}';
  newline ()

let split_words s =
  let rec loop accWs accCs xs =
    match xs with
    | [] -> reverse (reverse accCs :: accWs)
    (* TODO: handle multiple space seps *)
    | x::xs ->
       if eq_char x ' ' then loop (reverse accCs :: accWs) [] xs
       else loop accWs (x::accCs) xs
  in
  loop [] [] s

let execute line =
  let words = split_words line in
  match words with
  | [] -> ()
  | command::args ->
     if eq_char_list command (explode "fib") then runfib args else
       if eq_char_list command (explode "fact") then runfact args else
         fallback line

let rec mainloop () =
  put_char '>';
  put_char ' ';
  let xs = read_line () in
  execute xs;
  mainloop ()

let () = put_string_newline "LOAD"

let main () =
  put_string_newline "RUN";
  let () = mainloop () in
  put_string_newline "NEVER"
