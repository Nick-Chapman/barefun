(* fib forever *)

let explode s =
  let rec explode_loop acc i =
    if i < 0 then acc else
      explode_loop (string_index s i :: acc) (i-1)
  in
  explode_loop [] (string_length s - 1)

let chars_of_int i =
  let ord0 = ord '0' in
  let char_of_digit c = chr (ord0 + c) in
  let rec loop acc i =
    if i = 0 then acc else
      loop (char_of_digit (i%10) :: acc) (i/10)
  in
  if i = 0 then ['0'] else loop [] i

let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xs -> put_char x; put_chars xs

let put_string s = put_chars (explode s)

let put_int i = put_chars (chars_of_int i)

let newline () = put_char '\n'

let rec fib n =
  if n < 2 then n else fib (n-1) + fib (n-2)

let main () =
  put_string "Fib-forever...\n";
  let rec loop i =
    let res = fib i in
    put_string "fib ";
    put_int i;
    put_string " --> ";
    put_int res;
    put_string " (space="; put_int (get_sp()); put_string ")";
    newline ();
    loop (i+1)
  in
  loop 0
