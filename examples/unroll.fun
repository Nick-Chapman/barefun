
let chars_of_int =
  let ord0 = ord '0' in
  let char_of_digit c = chr (ord0 + c) in
  let rec loop acc i =
    if i = 0 then acc else
      loop (char_of_digit (i%10) :: acc) (i/10)
  in
  fun i -> if i = 0 then ['0'] else loop [] i

let rec put_chars xs =
  match xs with
  | [] -> ()
  | x::xs -> put_char x; put_chars xs

let put_int i = put_chars (chars_of_int i)

let [@unroll] rec triangle n =
  if n < 1 then 0 else n + triangle (n-1)

let main () = put_int (triangle 5)
