
let cons x xs = Cons (x,xs)

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

let not b =
  match b with
  | true -> false
  | false -> true

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

let message = cons 'Y' (cons 'o' (cons 'u' (cons ':' (cons ' ' Nil))))

let star_the_ohs = map (fun c -> if eq_char c 'o' then '*' else c)

let start =
  let rec loop () =
    let () = put_char '>' in
    let xs = read_line () in
    let n = 100 + length xs in
    let () = put_chars (append message (star_the_ohs xs)) in
    (* TODO: semicolon syntax *)
    let () = put_char ' ' in
    let () = put_char '{' in
    let () = put_int n in
    let () = put_char '}' in
    let () = put_char '\n' in
    loop ()
  in
  loop

let main = start
