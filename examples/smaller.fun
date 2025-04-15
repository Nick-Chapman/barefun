
(* smaller -- a readline with no use of strings of numbers *)

let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xsMore -> put_char x; put_chars xsMore

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
    let theChar = get_char () in
    let gotten = theChar in
    if eq_char gotten '\n' then (newline(); reverse sofar) else
      (put_char gotten; readloop (gotten :: sofar))
  in
  readloop []

let rec main () =
  put_char '%';
  put_char ' ';
  put_chars (read_line ());
  newline();
  main()
