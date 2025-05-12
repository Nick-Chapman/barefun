
(* Convert scancodes to ascii codes; defining basic echo loop. *)

let rec get_scancode () =
  let () = wait_for_interrupt () in
  if is_keyboard_ready() then get_keyboard_last_scancode () else
    get_scancode()

let not b =
  match b with
  | true -> false
  | false -> true

let (>) a b = b < a
let (>=) a b = not (a < b)

let tableL = "  1234567890-= \tqwertyuiop[]\n asdfghjkl;'` \\zxcvbnm,./"
let tableU = "  !@#$%^&*()_+ \tQWERTYUIOP{}\n ASDFGHJKL:\"~ |ZXCVBNM<>?"
let tableC = "   @            QWERTYUIOP    ASDFGHJKL     ZXCVBNM"

let get_char : unit -> char =
  let r_shifted = ref false in
  let r_controlled = ref false in
  let rec loop shifted controlled =
    let n = ord (get_scancode()) in
    let shift_pressed = if (n = 42) then true else (n = 54) in
    let shift_released = if (n = 170) then true else (n = 182) in
    let release_scancode = (n > 128) in
    let control_pressed = (n = 29) in
    let control_released = (n = 157) in
    let ok d = (r_shifted := shifted; r_controlled := controlled; d) in
    let ignore() = loop shifted controlled in
    if control_pressed then loop shifted (true) else
      if control_released then loop shifted (false) else
        if shift_pressed then loop (true) controlled else
          if shift_released then loop (false) controlled else
            if release_scancode then loop shifted controlled else
              if n = 14 then ok (chr 127) else
                if n = 57 then ok ' ' else
                  let table = if controlled then tableC else if shifted then tableU else tableL in
                  let max = string_length table in
                  if n < 0 then ignore() else
                    if n >= max then ignore() else
                      let decoded = string_index table n in
                      if eq_char decoded ' '
                      then ignore()
                      else
                        if controlled
                        then ok (chr (ord decoded - ord '@'))
                        else ok decoded
  in
  fun () ->
  loop (!r_shifted) (!r_controlled)


let rec main () =
  let char = get_char() in
  put_char char;
  main ()
