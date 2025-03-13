
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

let convert_o_to_sttar c = if eq_char c 'o' then '*' else c

let star_the_ohs = map convert_o_to_sttar

let not b =
  match b with
  | true -> false
  | false -> true

let get_char_echoing () =
  let c = get_char () in
  let () = put_char c in
  c

let read_line =
  let rec loop acc =
    let c = get_char_echoing () in
    if not (eq_char c '\n') then loop (cons c acc) else reverse acc
  in
  fun () -> loop Nil

let rec put_chars xs =
  match xs with
  | Nil -> ()
  | Cons (x,xs) ->
     let () = put_char x in
     put_chars xs

let message = cons 'Y' (cons 'o' (cons 'u' (cons ':' (cons ' ' Nil))))

let start =
  let rec loop () =
    let () = put_char '>' in
    let xs = read_line () in
    let () = put_chars (append message (star_the_ohs xs)) in
    let () = put_char '\n' in
    loop ()
  in
  loop

let main = start
