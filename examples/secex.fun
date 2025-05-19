
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

let newline () = put_char '\n'

let echoing_get_char () =
  let c = get_char () in
  put_char c;
  c

let get_num () =
  let c = echoing_get_char () in
  let n = ord c - ord '0' in
  n

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

let make_sector = noinline (fun c ->
  let buf = make_bytes 512 in
  let rec loop i =
    if i >= 512 then () else
      (set_bytes buf i c; loop (i+1))
  in
  loop 0;
  freeze_bytes buf)

let do_read_n n =
  let buf = make_bytes 512 in
  load_sector n buf;
  let s = freeze_bytes buf in
  put_sector_string s

let do_read () =
  let n = get_num () in
  newline();
  do_read_n n

let do_write () =
  let n = get_num () in
  let c = echoing_get_char () in
  let s = make_sector c in
  newline();
  store_sector n s

let rec xloop () =
  put_char '>';
  let c = echoing_get_char () in
  if eq_char c 'r' then (do_read (); xloop ()) else
    if eq_char c 'w' then (do_write (); xloop ()) else
      (put_string ": unknown command\n"; xloop())

let main () =
  put_string "type r<num> or w<num><char>\n";
  do_read_n 2;
  xloop()
