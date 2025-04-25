
(* basic readline: collect typed chars; with backspace editing *)

let not b =
  match b with
  | true -> false
  | false -> true

let (>) a b = b < a
let (<=) a b = not (b < a)

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
