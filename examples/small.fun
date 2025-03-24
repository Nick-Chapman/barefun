
let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xsMore -> put_char x; put_chars xsMore

let put_string s = put_chars (explode s)

let reverse ysStart =
  let rec revloop acc ys =
    match ys with
    | [] -> acc
    | y::ysMore -> revloop (y :: acc) ysMore
  in
  revloop [] ysStart

let newline () = put_char '\n'

let read_line () =
  let rec readloop sofar =
    let c = get_char () in
    if eq_char c '\n' then (newline(); reverse sofar) else
      (put_char c; readloop (c :: sofar))
  in
  readloop []

let rec main () =
  put_string "> ";
  put_chars (read_line ());
  newline();
  main()
