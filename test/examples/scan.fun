
(* example: NB access to keyboard scancodes... *)

let (>) a b = b < a

let noinline = let rec block f a = let _ = block in f a in block

let explode = noinline (fun s ->
  let rec explode_loop acc i =
    if i < 0 then acc else
      explode_loop (string_index s i :: acc) (i-1)
  in
  explode_loop [] (string_length s - 1))

let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xs -> put_char x; put_chars xs

let put_string s = put_chars (explode s)

let error s = put_string "error: "; put_string s; put_char '\n'; crash()

let put_hex_nibble n =
  if n < 0 then error "put_hex_nibble<0" else
    if n > 15 then error "put_hex_nibble>15" else
    let offset = if n > 9 then ord 'a' - 10 else ord '0' in
    put_char (chr (n+offset))

let put_hex_byte c =
  let n = ord c in
  let lo = n % 16 in
  let hi = (n / 16) in
  put_hex_nibble hi;
  put_hex_nibble lo

let rec get_scan () =
  let () = wait_a_tick () in
  if is_keyboard_ready() then get_keyboard_last_scancode () else
    (*let () = put_char ',' in*)
    get_scan()

(* TODO: convert scan code to ascii char *)

let main () =
  put_string "Scan test...\n";
  let rec loop () =
    let c = get_scan() in
    put_hex_byte c;
    put_char ' ';
    loop ()
  in
  loop ()

