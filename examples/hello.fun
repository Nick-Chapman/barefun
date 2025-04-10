
(* TODO: make this version work when numbers are signed *)
(*let explode s =
  let rec loop acc i =
    if i < 0 then acc else
      loop (string_index s i :: acc) (i-1)
  in
  loop [] (string_length s - 1)*)

let explode s =
  let rec explode_loop acc i =
    if i = 0 then acc else
      explode_loop (string_index s (i-1) :: acc) (i-1)
  in
  explode_loop [] (string_length s)

let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xsMore -> put_char x; put_chars xsMore

let put_string s = put_chars (explode s)

let main () =
  put_string "Hello, world!\n"
