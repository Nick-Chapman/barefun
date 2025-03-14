
type 'a list = Nil | Cons of 'a * 'a list

let cons x xs = Cons (x,xs)

let rec eq_list eq xs ys =
  match xs with
  | Nil -> (match ys with | Nil -> true | Cons (_,_) -> false)
  | Cons (x,xs) ->
     match ys with
     | Nil -> false
     | Cons (y,ys) ->
        if eq x y then eq_list eq xs ys else false

let eq_char_list = eq_list eq_char

let rec append xs ys = (* non tail-recursive version *)
  match xs with
  | Nil -> ys
  | Cons (x,xs) -> cons x (append xs ys)

let reverse =
  let rec loop acc xs =
    match xs with
    | Nil -> acc
    | Cons (x,xs) -> loop (cons x acc) xs
  in
  loop Nil

let rec map f xs =
  match xs with
  | Nil -> Nil
  | Cons (x,xs) -> cons (f x) (map f xs)

let rec length xs =
  match xs with
  | Nil -> 0
  | Cons (_,xs) -> 1 + length xs

(*let not b =
  match b with
  | true -> false
  | false -> true*)

let chars_of_int =
  let ord0 = ord '0' in
  let char_of_digit c = chr (ord0 + c) in
  let rec loop acc i =
    if eq_int i 0 then acc else
      loop (cons (char_of_digit (i%10)) acc) (i/10)
  in
  fun i ->
  if eq_int i 0 then cons '0' Nil else loop Nil i

let rec put_chars xs =
  match xs with
  | Nil -> ()
  | Cons (x,xs) ->
     let () = put_char x in
     put_chars xs

let put_int i = put_chars (chars_of_int i)

let newline () = put_char '\n'

let read_line =
  let rec loop acc =
    let c = get_char () in
    let n = ord c in
    if eq_char c '\n' then let () = newline () in reverse acc else
      if less_int n 32 then loop acc else
        if less_int 127 n then loop acc else
          if eq_int n 127 then
            match acc with
            | Nil -> loop acc
            | Cons (_,tail) ->
               let () = put_char (chr 8) in
               let () = put_char ' ' in
               let () = put_char (chr 8) in
               loop tail
          else
            let () = put_char c in
            loop (cons c acc)
  in
  fun () -> loop Nil

let rec fib n =
  (*let () = put_int n in let () = newline () in*)
  if n < 2 then n else fib (n-1) + fib (n-2)

let runfib () =
  let n = 10 in
  let res = fib n in
  let () = put_chars (cons 'f' (cons 'i' (cons 'b' (cons ' ' Nil)))) in
  let () = put_int n in
  let () = put_chars (cons ' ' (cons '-' (cons '>' (cons ' ' Nil)))) in
  let () = put_int res in
  let () = newline () in
  ()

let fallback line =
  let message = cons 'Y' (cons 'o' (cons 'u' (cons ':' (cons ' ' Nil)))) in
  let star_the_ohs = map (fun c -> if eq_char c 'o' then '*' else c) in
  let n = 100 + length line in
  let () = put_chars (append message (star_the_ohs line)) in
  (* TODO: semicolon syntax *)
  let () = put_char ' ' in
  let () = put_char '{' in
  let () = put_int n in
  let () = put_char '}' in
  let () = newline () in
  ()

let runfibS = cons 'r' (cons 'u' (cons 'n' (cons 'f' (cons 'i' (cons 'b' Nil)))))

let execute line =
  if eq_char_list line runfibS then runfib () else
    fallback line

let main =
  let rec loop () =
    let () = put_char '>' in
    let xs = read_line () in
    let () = execute xs in
    loop ()
  in
  loop
