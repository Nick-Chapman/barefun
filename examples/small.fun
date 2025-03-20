
let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xs -> put_char x; put_chars xs

let put_string s = put_chars (explode s)

let reverse =
  let rec loop acc xs =
    match xs with
    | [] -> acc
    | x::xs -> loop (x :: acc) xs
  in
  loop []

let newline () = put_char '\n'

let read_line =
  let rec loop acc =
    let c = get_char () in
    if eq_char c '\n' then (newline(); reverse acc) else
      (put_char c; loop (c ::  acc))
  in
  fun () -> loop []

let main =
  let rec mainloop () =
    put_string "> ";
    put_chars (read_line ());
    newline();
    mainloop ()
  in
  mainloop
