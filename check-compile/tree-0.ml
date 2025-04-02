(*stage0*)
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
let :: = (fun x -> (fun y -> Cons(x, y))) in
let chars_of_int =
  let ord0 = (ord '0') in
  let char_of_digit = (fun c -> (chr ((+ ord0) c))) in
  let loop =
    fix (fun loop acc ->
      (fun i ->
        match ((= i) 0) with
        | true -> acc
        | false -> ((loop ((:: (char_of_digit ((% i) 10))) acc)) ((/ i) 10)))) in
  (fun i ->
    match ((= i) 0) with
    | true -> Cons('0', Nil)
    | false -> ((loop Nil) i)) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil -> Unit
    | Cons(x,xs) ->
      let _ = (put_char x) in
      (put_chars xs)) in
let put_int = (fun i -> (put_chars (chars_of_int i))) in
type _ = Num | Add | Sub
let eval =
  fix (fun eval e ->
    match e with
    | Num(n) -> n
    | Add(e1,e2) -> ((+ (eval e1)) (eval e2))
    | Sub(e1,e2) -> ((- (eval e1)) (eval e2))) in
let num = (fun n -> Num(n)) in
let example1 = Sub((num 1000), Add((num 42), (num 3))) in
let main = (fun _ -> (put_int (eval example1))) in
