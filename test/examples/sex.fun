(* Sector explorer *)

let not b =
  match b with
  | true -> false
  | false -> true

let (>=) a b = not (a < b)

let put_string s =
  let n = string_length s in
  let rec loop i =
    if i >= n then () else
      let c = string_index s i in
      (put_char c; loop (i+1))
  in
  loop 0

let put_int i =
  let ord0 = ord '0' in
  let char_of_digit c = chr (ord0 + c) in
  let rec loop i =
    if i = 0 then () else
      loop (i/10);
      put_char (char_of_digit (i%10))
  in
  if i = 0 then put_char '0' else loop i

let newline () = put_char '\n'

let read_sector : int -> string = fun n ->
  let bs = make_bytes 512 in
  load_sector n bs;
  freeze_bytes bs

let is_printable c =
  let n = ord c in
  if n < 32 then false else n < 127

let put_sector_string s =
  let rec loop i =
    (if i % 64 = 0 then newline() else ());
    if i >= 512 then () else
      let c = string_index s i in
      let c = if is_printable c then c else '.' in
      (put_char c; loop (i+1))
  in
  loop 0

let dump n =
  put_string "sector:"; put_int n;
  let s = read_sector n in
  put_sector_string s;
  put_string "(space="; put_int (get_sp()); put_string ")";
  newline()

let main () =
  let rec loop i =
    dump i;
    let _ : char = get_char () in
    loop (i+1)
  in
  loop 1 (* sectors start from 1 *)
