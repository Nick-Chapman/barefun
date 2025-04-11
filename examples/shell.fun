
let noinline = let rec block f a = let _ = block in f a in block

let rec length xs =
  match xs with
  | [] -> 0
  | _::xs -> (+) 1 (length xs)

let cons x xs = x :: xs

let rec append xs ys = (* non tail-recursive version *)
  match xs with
  | [] -> ys
  | x::xs -> cons x (append xs ys)

let implode xs =
  let b = make_bytes (length xs) in
  let rec loop i xs =
    match xs with
    | [] -> ()
    | x::xs -> set_bytes b i x; loop (i+1) xs
  in
  loop 0 xs;
  freeze_bytes b

let implode = noinline implode

let explode s =
  let rec explode_loop acc i =
    if i < 0 then acc else
      explode_loop (string_index s i :: acc) (i-1)
  in
  explode_loop [] (string_length s - 1)

let explode = noinline explode

let string_append s1 s2 = implode (append (explode s1) (explode s2))

let not b =
  match b with
  | true -> false
  | false -> true

let (>) a b = b < a
let (<=) a b = not (b < a)
let (>=) a b = not (a < b)

(* A prettier put_char for control chars; also aligned with backspacing *)
let put_char = (fun c -> (* TODO: inline_only_constant_argument *)
  let backspace = 8 in
  let n = ord c in
  if n = backspace then put_char c else
    if eq_char c '\n' then put_char c else
      if n > 26 then put_char c else
        (put_char '^'; put_char (chr (ord 'A' + n - 1 ))))

let erase_char () =
  let backspace = chr 8 in
  (* erase the previously echoed char on the terminal *)
  put_char backspace;
  put_char ' ';
  put_char backspace

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

let rec eq_list eq xs ys =
  match xs with
  | [] -> (match ys with | [] -> true | _::_ -> false)
  | x::xs ->
     match ys with
     | [] -> false
     | y::ys ->
        if eq x y then eq_list eq xs ys else false

let eq_char_list xs ys = eq_list eq_char xs ys

let eq_string s1 s2 = eq_char_list (explode s1) (explode s2)

let rec revloop acc xs =
  match xs with
  | [] -> acc
  | x::xs -> revloop (cons x acc) xs

let reverse xs = revloop [] xs

let rec map f xs =
  match xs with
  | [] -> []
  | x::xs -> f x :: map f xs

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

let put_string s = put_chars (explode s) (* could avoid explode *)

let put_int i = put_chars (chars_of_int i)

let newline () = put_char '\n'

let rec readloop acc =
  let c = get_char () in
  let n = ord c in
  let controlD = chr 4 in
  if eq_char c '\n' then (newline(); reverse acc) else
    if eq_char c controlD then (put_char controlD; newline(); reverse (controlD :: acc)) else
      if n > 127 then readloop acc else
        if n = 127 then
          match acc with
          | [] -> readloop acc
          | c::tail ->
             (if ord c <= 26 then erase_char () else ()); (* The ^ printed for control chars *)
             erase_char();
             readloop tail
        else
          (put_char c; readloop (cons c acc))

let read_line () = implode (readloop [])

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
        match parse_num (explode arg1) with
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
        match parse_num (explode arg1) with
        | None -> error "expected arg1 to be numeric"
        | Some n ->
           let res = fact n in
           put_int n;
           put_string " --> ";
           put_int res;
           newline ()


let single_controlD = implode (chr 4 :: [])

let reverse_string s = implode (reverse (explode s))

let rev() =
  let rec loop() =
    let line = read_line () in
    if eq_string line single_controlD then () else
      (put_string (reverse_string line); newline(); loop())
  in
  loop()

let runrev args =
  match args with
  | _::_ -> error "rev: expected no arguments"
  | [] ->
     put_string "(reverse typed lines until ^D)\n";
     rev()

let fallback line =
  let star_the_ohs = map (fun c -> if eq_char c 'o' then '*' else c) in
  let n = string_length line in
  put_string (string_append "You wrote: \"" (implode (star_the_ohs (explode line))));
  put_string "\" (";
  put_int n;
  put_string " chars)";
  newline ()

let rec splitloop accWs accCs xs =
  match xs with
  | [] -> reverse (implode (reverse accCs) :: accWs)
  | x::xs ->
     if eq_char x ' ' then splitloop (implode (reverse accCs) :: accWs) [] xs
     else splitloop accWs (x::accCs) xs

let split_words s = (* eta expand for efficiency; smaller continuation frames *)
  splitloop [] [] s

let execute line =
  let words = split_words (explode line) in
  match words with
  | [] -> ()
  | command::args ->
     if eq_string command "fib" then runfib args else
       if eq_string command "fact" then runfact args else
         if eq_string command "rev" then runrev args else
           fallback line

let rec mainloop () =
  put_chars ['>';' '];
  let line = read_line () in
  if eq_string line single_controlD then () else
    (execute line; mainloop ())

let main () =
  put_string "This is a shell prototype. Try: fib, fact, rev\n";
  mainloop ()
