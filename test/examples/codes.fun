
(* Repeatedly get and display the keyboard scan codes *)

let put_string s =
  let n = string_length s in
  let rec loop i = if i < n then (put_char (string_index s i); loop (i+1)) else () in
  loop 0

let rec get_scancode () =
  let () = wait_for_interrupt () in
  if is_keyboard_ready() then get_keyboard_last_scancode () else
    get_scancode()

let put_digit n = put_char (chr (n + ord '0'))

let put_scancode xyz =
  let z = xyz % 10 in
  let xy = xyz / 10 in
  let y = xy % 10 in
  let x = xy / 10 in
  put_char '{';
  put_digit x;
  put_digit y;
  put_digit z;
  put_char '}'

let rec loop () =
  let char = get_scancode() in
  let n = ord char in
  put_scancode n;
  put_char ' ';
  loop ()

let main () =
  put_string "Press/release keys; see the scan codes...\n";
  init_interrupt_mode();
  loop()
