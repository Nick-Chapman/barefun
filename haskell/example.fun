
let not b =
  match b with
  | True -> False
  | False -> True

let get_char_echoing () =
  let c = get_char () in
  let () = put_char c in
  c

let read_line =
  let loop acc =
    let c = get_char_echoing () in
    if not (eq_char c '\n') then loop (Cons (c,acc)) else acc
  in
  fun () -> loop Nil

let put_chars xs =
  match xs with
  | Nil -> ()
  | Cons (x,xs) ->
     let () = put_char x in
     put_chars xs

let start =
  let loop () =
    let () = put_char '>' in
    let xs = read_line () in
    let () = put_chars xs in
    let () = put_char '\n' in
    loop ()
  in
  loop

let main = start
