[transform1]
----------
let + = (fun x -> (fun y -> PRIM:AddInt[x,y])) in
let - = (fun x -> (fun y -> PRIM:SubInt[x,y])) in
let ( * ) = (fun x -> (fun y -> PRIM:MulInt[x,y])) in
let / = (fun x -> (fun y -> PRIM:DivInt[x,y])) in
let % = (fun x -> (fun y -> PRIM:ModInt[x,y])) in
let < = (fun x -> (fun y -> PRIM:LessInt[x,y])) in
let = = (fun x -> (fun y -> PRIM:EqInt[x,y])) in
let eq_char = (fun x -> (fun y -> PRIM:EqChar[x,y])) in
let ord = (fun x -> PRIM:CharOrd[x]) in
let chr = (fun x -> PRIM:CharChr[x]) in
let explode = (fun x -> PRIM:Explode[x]) in
let put_char = (fun x -> PRIM:PutChar[x]) in
let get_char = (fun x -> PRIM:GetChar[x]) in
let :: = (fun x -> (fun y -> Tag_1(x, y))) in
let chars_of_int =
  let ord0 = (ord '0') in
  let char_of_digit = (fun c -> (chr ((+ ord0) c))) in
  let loop =
    fix (fun loop acc ->
      (fun i ->
        match ((= i) 0) with
        | Tag_1[] -> acc
        | Tag_0[] -> ((loop ((:: (char_of_digit ((% i) 10))) acc)) ((/ i) 10)))) in
  (fun i ->
    match ((= i) 0) with
    | Tag_1[] -> ((:: '0') Tag_0)
    | Tag_0[] -> ((loop Tag_0) i)) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Tag_0[] -> Tag_0
    | Tag_1[x,xs] ->
      let _ = (put_char x) in
      (put_chars xs)) in
let put_string = (fun s -> (put_chars (explode s))) in
let put_int = (fun i -> (put_chars (chars_of_int i))) in
let newline = (fun _ -> (put_char '\n')) in
let fib =
  fix (fun fib n ->
    match ((< n) 2) with
    | Tag_1[] -> n
    | Tag_0[] -> ((+ (fib ((- n) 1))) (fib ((- n) 2)))) in
let runfib =
  (fun n ->
    let res = (fib n) in
    let _ = (put_string "fib ") in
    let _ = (put_int n) in
    let _ = (put_string " --> ") in
    let _ = (put_int res) in
    (newline Tag_0)) in
let main = (fun _ -> (runfib 20)) in
(main Tag_0)
----------
