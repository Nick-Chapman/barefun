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
let put_chars = fix (fun put_chars xs ->
  match xs with
  | Nil -> Unit
  | Cons(x,xsMore) ->
    let _ = (put_char x) in
    (put_chars xsMore)) in
let put_string = (fun s -> (put_chars (explode s))) in
let reverse = (fun ysStart ->
  let revloop = fix (fun revloop acc ->
    (fun ys ->
      match ys with
      | Nil -> acc
      | Cons(y,ysMore) -> ((revloop ((:: y) acc)) ysMore))) in
  ((revloop Nil) ysStart)) in
let newline = (fun _ -> (put_char '\n')) in
let read_line = (fun _ ->
  let readloop = fix (fun readloop sofar ->
    let theChar = (get_char Unit) in
    let gotten = theChar in
    match ((eq_char gotten) '\n') with
    | true ->
      let _ = (newline Unit) in
      (reverse sofar)
    | false ->
      let _ = (put_char gotten) in
      (readloop ((:: gotten) sofar))) in
  (readloop Nil)) in
let _ = (put_string "LOAD\n") in
let mainloop = fix (fun mainloop _ ->
  let _ = (put_string "> ") in
  let _ = (put_chars (read_line Unit)) in
  let _ = (newline Unit) in
  (mainloop Unit)) in
let main = (fun _ ->
  let _ = (put_string "RUN\n") in
  let _ = (mainloop Unit) in
  (put_string "NEVER\n")) in
