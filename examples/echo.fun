
(* Convert scancodes to ascii codes; defining basic echo loop. *)

let put_string s =
  let n = string_length s in
  let rec loop i = if i < n then (put_char (string_index s i); loop (i+1)) else () in
  loop 0

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

let rec get_scancode () =
  let () = wait_for_interrupt () in
  if is_keyboard_ready() then get_keyboard_last_scancode () else
    get_scancode()

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
    let n = ord (get_scancode()) in
    let shift_pressed = (n = 42) || (n = 54) in
    let shift_released = (n = 170) || (n = 182) in
    let release_scancode = (n > 128) in
    let control_pressed = (n = 29) in
    let control_released = (n = 157) in
    let ok d = (r_shifted := shifted; r_controlled := controlled; d) in
    let unknown() = (put_scancode n; loop shifted controlled) in
    if control_pressed then loop shifted true else
      if control_released then loop shifted false else
        if shift_pressed then loop true controlled else
          if shift_released then loop false controlled else
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

let rec loop () = put_char (get_char()); loop ()

let main () =
  put_string "See scan codes converted to ASCII...\n";
  init_interrupt_mode();
  loop ()
