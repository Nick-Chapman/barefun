
let not b =
  match b with
  | true -> false
  | false -> true

let (>) a b = b < a
let (<=) a b = not (b < a)
let (>=) a b = not (a < b)

let cons x xs = x :: xs

let rec eq_list eq xs ys =
  match xs with
  | [] -> (match ys with | [] -> true | _::_ -> false)
  | x::xs ->
     match ys with
     | [] -> false
     | y::ys ->
        if eq x y then eq_list eq xs ys else false

let eq_char_list = eq_list eq_char

let rec append xs ys = (* non tail-recursive version *)
  match xs with
  | [] -> ys
  | x::xs -> cons x (append xs ys)

let reverse =
  let rec loop acc xs =
    match xs with
    | [] -> acc
    | x::xs -> loop (cons x acc) xs
  in
  loop []

let rec map f xs =
  match xs with
  | [] -> []
  | x::xs -> f x :: map f xs

let rec length xs =
  match xs with
  | [] -> 0
  | _::xs -> (+) 1 (length xs)

let chars_of_int =
  let ord0 = ord '0' in
  let char_of_digit c = chr (ord0 + c) in
  let rec loop acc i =
    if i = 0 then acc else
      loop (cons (char_of_digit (i%10)) acc) (i/10)
  in
  fun i ->
  if i = 0 then cons '0' [] else loop [] i

let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xs -> put_char x; put_chars xs

let put_string s = put_chars (explode s)

let put_int i = put_chars (chars_of_int i)

let newline () = put_char '\n'

let read_line =
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
  fun () -> loop []

let rec fib n =
  (*put_int n; newline ();*)
  if n < 2 then n else fib (n-1) + fib (n-2)

let rec fact n =
  (*put_int n; newline ();*)
  if n >= 2 then fact (n-1) * n else 1

let runfib () =
  let n = 10 in
  let res = fib n in
  put_string "fib ";
  put_int n;
  put_string " --> ";
  put_int res;
  newline ()

let runfact () =
  let n = 6 in
  let res = fact n in
  put_string "fact ";
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

type 'a option = Some of 'a | None

let maybe_special line =
  if eq_char_list line (explode "runfib") then Some (runfib) else (* TODO: fix parser to avoid need for parens *)
    if eq_char_list line (explode "runfact") then Some (runfact) else
      None

let execute line =
  match maybe_special line with
  | None -> fallback line
  | Some (f) -> f ()

let rec main () =
  put_char '>';
  put_char ' ';
  let xs = read_line () in
  execute xs;
  main ()
