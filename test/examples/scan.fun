
(* example: NB access to keyboard scancodes... *)

let not b =
  match b with
  | true -> false
  | false -> true

let (>=) a b = not (a < b)

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

(* TODO: make this work in ocaml/haskell emulation *)
let sleep nTicks = (* nTicks in milliseconds *)
  if nTicks < 1 then wait_for_interrupt () else
    let target = nTicks + get_ticks () in
    let rec wait () =
      let () = wait_for_interrupt() in
      let now = get_ticks () in
      if now = target then () else wait ()
    in
    wait ()

let rec get_scan () =
  (*let () = put_char '.' in*)
  let () = sleep 0 in
  if is_keyboard_ready() then get_keyboard_last_scancode () else
    get_scan()

(* ? are place holders for unknown scancodes -- ^@ would be better -- needs haskell parse support*)
let table : string =
  "??1234567890-=\b\tqwertyuiop[]\n?asdfghjkl;'`??zxcvbnm,./??? "
(* TODO: track shift press/release & decode shifted things *)

let decode_unshifted c =
  let max = string_length table in
  let n = ord c in
  if n < 0 then '?' else
    if n >= max then '?' else
      string_index table n

let decode_and_put_scan_code _shifted sc =
  let d = decode_unshifted sc in
  if eq_char d '?' then () else (* drop anything we dont know about, including release codes *)
    put_char d

let get_key_and_show () =
  let sc = get_scan() in
  (*decode_and_put_scan_code false sc*) (* TODO: This is broken: a parse issue on false?? *)
  let f = false in decode_and_put_scan_code f sc

let main () =
  put_string "[Scan test]\n";
  let rec loop () =
    get_key_and_show ();
    loop ()
  in
  loop ()
