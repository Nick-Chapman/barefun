
(* example: build strings using the builtin "bytes" ops *)

let noinline = let rec block f a = let _ = block in f a in block

let rec length xs =
  match xs with
  | [] -> 0
  | _::xs -> (+) 1 (length xs)

let implode xs =
  let b = make_bytes (length xs) in
  let rec loop i xs =
    match xs with
    | [] -> ()
    | x::xs -> set_bytes b i x; loop (i+1) xs
  in
  loop 0 xs;
  freeze_bytes b

let implode = noinline implode

let explode s =
  let rec explode_loop acc i =
    if i < 0 then acc else
      explode_loop (string_index s i :: acc) (i-1)
  in
  explode_loop [] (string_length s - 1)

let explode = noinline explode

let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xsMore -> put_char x; put_chars xsMore

let put_string s = put_chars (explode s)

let main () =
  put_string "One\n";
  put_string (freeze_bytes (make_bytes 5));
  put_string (implode ['T';'w';'o';'\n'])
