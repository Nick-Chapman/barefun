
let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xs -> put_char x; put_chars xs

let put_string s = put_chars (explode s)

let reverse xs =
  let rec revloop acc xs =
    match xs with
    | [] -> acc
    | x::xs -> revloop (x :: acc) xs
  in
  revloop [] xs

let newline () = put_char '\n'

let read_line () =
  let rec readloop acc =
    let c = get_char () in
    if eq_char c '\n' then (newline(); reverse acc) else
      (put_char c; readloop (c ::  acc))
  in
  readloop []

let rec main () =
  put_string "> ";
  put_chars (read_line ());
  newline();
  main()
