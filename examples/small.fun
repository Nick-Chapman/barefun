
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

let put_string_newline s = (* TODO: kill when we support \n in string literals *)
  put_string s;
  newline ()

let read_line () =
  let rec readloop sofar =
    let theChar = get_char () in
    let gotten = theChar in
    if eq_char gotten '\n' then (newline(); reverse sofar) else
      (put_char gotten; readloop (gotten :: sofar))
  in
  readloop []

let () = put_string_newline "LOAD"

let rec mainloop () =
  put_string "> ";
  put_chars (read_line ());
  newline();
  mainloop()

let main () =
  put_string_newline "RUN";
  let () = mainloop () in
  put_string_newline "NEVER"
