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
let is_even =
  fix (fun is_even n ->
    let is_odd =
      (fun n ->
        match ((= n) 0) with
        | true1 -> false0
        | false0 -> (is_even ((- n) 1))) in
    let is_even =
      (fun n ->
        match ((= n) 0) with
        | true1 -> true1
        | false0 -> (is_odd ((- n) 1))) in
    (is_even n)) in
let check =
  (fun n ->
    (put_char
    match (is_even n) with
    | true1 -> 'E'
    | false0 -> 'O')) in
let main =
  (fun _ ->
    let _ = (check 42) in
    (check 13)) in
(main Unit0)
