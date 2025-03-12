
let cons x xs = Cons (x,xs)

let reverse =
  let rec loop acc xs =
    match xs with
    | Nil -> acc
    | Cons (x,xs) -> loop (cons x acc) xs
  in
  loop Nil

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
    if not (eq_char c '\n') then loop (cons c acc) else acc
  in
  fun () -> loop Nil

let rec put_chars xs =
  match xs with
  | Nil -> ()
  | Cons (x,xs) ->
     let () = put_char x in
     put_chars xs

let start =
  let rec loop () =
    let () = put_char '>' in
    let xs = read_line () in
    let () = put_chars (reverse xs) in
    let () = put_char '\n' in
    loop ()
  in
  loop

let main = start
