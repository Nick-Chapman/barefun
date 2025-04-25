(* Simple user defined datatype for numeric exps *)
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

type exp = Num of int | Add of exp * exp | Sub of exp * exp

let rec eval e =
  match e with
  | Num n -> n
  | Add(e1,e2) -> eval e1 + eval e2
  | Sub(e1,e2) -> eval e1 - eval e2

let example1 = Sub (Num 1000, Add (Num 42, Num 3))

let main() =
  put_int (eval example1)
