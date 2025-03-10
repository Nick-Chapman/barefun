
let read_line =
  let rec loop acc =
    let c = get_char () in
    let () = put_char c in
    if not (eq_char c '\n') then loop (Cons (c,acc)) else acc
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
    let () = put_chars xs in
    let () = put_char '\n' in
    loop ()
  in
  loop
