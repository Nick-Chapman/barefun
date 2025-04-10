
let explode s =
  let rec explode_loop acc i =
    if i < 0 then acc else
      explode_loop (string_index s i :: acc) (i-1)
  in
  explode_loop [] (string_length s - 1)

let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xsMore -> put_char x; put_chars xsMore

let put_string s = put_chars (explode s)

let main () =
  put_string "Hello, world!\n"
