
let explode s =
  let rec loop acc i =
    if i = 0 then acc else
      loop (string_index s (i-1) :: acc) (i-1)
  in
  loop [] (string_length s)

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
    let theChar = get_char () in
    let gotten = theChar in
    if eq_char gotten '\n' then (newline(); reverse sofar) else
      (put_char gotten; readloop (gotten :: sofar))
  in
  readloop []

let () = put_string "LOAD\n"

let rec mainloop () =
  put_string "> ";
  put_chars (read_line ());
  newline();
  mainloop()

let main () =
  put_string "RUN\n";
  let () = mainloop () in
  put_string "NEVER\n"
