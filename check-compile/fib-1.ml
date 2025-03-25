(*stage1; un-normalized*)
let + = (fun x -> (fun y -> PRIM_AddInt(x,y))) in
let - = (fun x -> (fun y -> PRIM_SubInt(x,y))) in
let ( * ) = (fun x -> (fun y -> PRIM_MulInt(x,y))) in
let / = (fun x -> (fun y -> PRIM_DivInt(x,y))) in
let % = (fun x -> (fun y -> PRIM_ModInt(x,y))) in
let < = (fun x -> (fun y -> PRIM_LessInt(x,y))) in
let = = (fun x -> (fun y -> PRIM_EqInt(x,y))) in
let eq_char = (fun x -> (fun y -> PRIM_EqChar(x,y))) in
let ord = (fun x -> PRIM_CharOrd(x)) in
let chr = (fun x -> PRIM_CharChr(x)) in
let explode = (fun x -> PRIM_Explode(x)) in
let put_char = (fun x -> PRIM_PutChar(x)) in
let get_char = (fun x -> PRIM_GetChar(x)) in
let :: = (fun x -> (fun y -> Cons1(x, y))) in
let chars_of_int = (fun i ->
  let ord0 = (ord '0') in
  let char_of_digit = (fun c -> (chr ((+ ord0) c))) in
  let loop = fix (fun loop acc ->
    (fun i ->
      match ((= i) 0) with
      | true1 -> acc
      | false0 -> ((loop ((:: (char_of_digit ((% i) 10))) acc)) ((/ i) 10)))) in
  match ((= i) 0) with
  | true1 -> ((:: '0') Nil0)
  | false0 -> ((loop Nil0) i)) in
let put_chars = fix (fun put_chars xs ->
  match xs with
  | Nil0 -> Unit0
  | Cons1(x,xs) ->
    let _ = (put_char x) in
    (put_chars xs)) in
let put_string = (fun s -> (put_chars (explode s))) in
let put_int = (fun i -> (put_chars (chars_of_int i))) in
let newline = (fun _ -> (put_char '\n')) in
let fib = fix (fun fib n ->
  match ((< n) 2) with
  | true1 -> n
  | false0 -> ((+ (fib ((- n) 1))) (fib ((- n) 2)))) in
let runfib = (fun n ->
  let res = (fib n) in
  let _ = (put_string "fib ") in
  let _ = (put_int n) in
  let _ = (put_string " --> ") in
  let _ = (put_int res) in
  (newline Unit0)) in
let main = (fun _ -> (runfib 20)) in
(main Unit0)
