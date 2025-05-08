
(* basic readline: collect typed chars; with backspace editing *)

let not b =
  match b with
  | true -> false
  | false -> true

let (>) a b = b < a
let (<=) a b = not (b < a)
let (>=) a b = not (a < b)

let rec rev_onto acc xs =
  match xs with
  | [] -> acc
  | x::xs -> rev_onto (x :: acc) xs

let rev xs = rev_onto [] xs

let explode s =
  let rec explode_loop acc i =
    if i < 0 then acc else
      explode_loop (string_index s i :: acc) (i-1)
  in
  explode_loop [] (string_length s - 1)

(* A prettier put_char for control chars; also aligned with backspacing *)
let put_char c =
  let backspace = 8 in
  let n = ord c in
  if n = backspace then put_char c else
    if eq_char c '\n' then put_char c else
      if n > 26 then put_char c else
        (put_char '^'; put_char (chr (ord 'A' + n - 1 )))

let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xs -> put_char x; put_chars xs

let put_string s = put_chars (explode s)

let newline () = put_char '\n'

let erase_char () =
  let backspace = chr 8 in
  (* erase the previously echoed char on the terminal *)
  put_char backspace;
  put_char ' ';
  put_char backspace


let chars_of_int i =
  let ord0 = ord '0' in
  let char_of_digit c = chr (ord0 + c) in
  let rec loop acc i =
    if i = 0 then acc else
      loop (char_of_digit (i%10) :: acc) (i/10)
  in
  if i = 0 then ['0'] else loop [] i

let put_int i =
  if i < 0
  then put_chars ('-' :: chars_of_int (0 - i))
  else put_chars (chars_of_int i)


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
    let _release_scancode = (n > 128) in
    let control_pressed = (n = 29) in
    let control_released = (n = 157) in
    let ok d = (r_shifted := shifted; r_controlled := controlled; d) in
    let unknown() = (put_char '{'; put_int n; put_char '}'; loop shifted controlled) in
    (* TODO: work around haskell parser bug error for true/false as args using brakets *)
    if control_pressed then loop shifted (true) else
      if control_released then loop shifted (false) else
        if shift_pressed then loop (true) controlled else
          if shift_released then loop (false) controlled else
            if _release_scancode then loop shifted controlled else
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


let read_line () =
  let rec readloop acc =
    let c = get_char () in
    let n = ord c in
    let controlD = chr 4 in
    if eq_char c '\n' then (newline(); rev acc) else
      if eq_char c controlD then (put_char controlD; newline(); rev (controlD :: acc)) else
        if n > 127 then readloop acc else
          if n = 127 then
            match acc with
            | [] -> readloop acc
            | c::tail ->
               (if ord c <= 26 then erase_char () else ()); (* The ^ printed for control chars *)
               erase_char();
               readloop tail
          else
            (put_char c; readloop (c :: acc))
  in
  readloop []

let is_single_controlD line =
  match line with
  | [] -> false
  | x::_ -> eq_char x (chr 4)

let rec mainloop () =
  put_string "% ";
  let line = read_line () in
  if is_single_controlD line then () else
    (put_chars line; newline(); mainloop())

let main () =
  put_string "Readline: edit with backspace; exit with ^D.\n";
  mainloop ()
