
let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xsMore -> put_char x; put_chars xsMore

let block = let rec block x = let _ = block in x in block

let put_string s = put_chars (explode (block s))

let main () =
  put_string "Hello, world!\n"
