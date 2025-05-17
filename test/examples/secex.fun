
(* Sector explorer *)

let noinline = let rec block f a = let _ = block in f a in block

let not b =
  match b with
  | true -> false
  | false -> true

let (>) a b = b < a
let (>=) a b = not (a < b)

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

let rec get_scan () =
  (*let () = put_char '.' in*)
  let () = wait_for_interrupt () in
  if is_keyboard_ready() then get_keyboard_last_scancode () else
    get_scan()

(* space are place holders for unknown scancodes *)
let tableL : string =
  "  1234567890-= \tqwertyuiop[]\n asdfghjkl;'` \\zxcvbnm,./"

let tableU : string =
  "  !@#$%^&*()_+ \tQWERTYUIOP{}\n ASDFGHJKL:\"~ |ZXCVBNM<>?"

let tableC : string =
  "   @            QWERTYUIOP    ASDFGHJKL     ZXCVBNM"

let get_char : unit -> char =
  let r_shifted = ref false in
  let r_controlled = ref false in
  let rec loop shifted controlled =
    let n = ord (get_scan()) in
    let shift_pressed = if (n = 42) then true else (n = 54) in
    let shift_released = if (n = 170) then true else (n = 182) in
    let release_scancode = (n > 128) in
    let control_pressed = (n = 29) in
    let control_released = (n = 157) in
    let ok d = (r_shifted := shifted; r_controlled := controlled; d) in
    let unknown() = (put_scancode n; loop shifted controlled) in
    if control_pressed then loop shifted (true) else
      if control_released then loop shifted (false) else
        if shift_pressed then loop (true) controlled else
          if shift_released then loop (false) controlled else
            if release_scancode then loop shifted controlled else
              if n = 14 then ok (chr 127) else
                if n = 57 then ok ' ' else
                  let table = if controlled then tableC else if shifted then tableU else tableL in
                  let max = string_length table in
                  if n < 0 then unknown() else
                    if n >= max then unknown() else
                      let decoded = string_index table n in
                      if eq_char decoded ' '
                      then unknown()
                      else
                        if controlled
                        then ok (chr (ord decoded - ord '@'))
                        else ok decoded
  in
  fun () ->
  loop (!r_shifted) (!r_controlled)


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
