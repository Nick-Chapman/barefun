(*Stage1 (Exp)*)
let + = (fun x -> (fun y -> PRIM_AddInt(x,y))) in
let % = (fun x -> (fun y -> PRIM_ModInt(x,y))) in
let ( * ) = (fun x -> (fun y -> PRIM_MulInt(x,y))) in
let - = (fun x -> (fun y -> PRIM_SubInt(x,y))) in
let / = (fun x -> (fun y -> PRIM_DivInt(x,y))) in
let :: = (fun x -> (fun y -> Cons1(x, y))) in
let < = (fun x -> (fun y -> PRIM_LessInt(x,y))) in
let = = (fun x -> (fun y -> PRIM_EqInt(x,y))) in
let chr = (fun x -> PRIM_CharChr(x)) in
let eq_char = (fun x -> (fun y -> PRIM_EqChar(x,y))) in
let get_char = (fun x -> PRIM_GetChar(x)) in
let ord = (fun x -> PRIM_CharOrd(x)) in
let put_char = (fun x -> PRIM_PutChar(x)) in
let string_index = (fun x -> (fun y -> PRIM_StringIndex(x,y))) in
let string_length = (fun x -> PRIM_StringLength(x)) in
let make_bytes = (fun x -> PRIM_MakeBytes(x)) in
let freeze_bytes = (fun x -> PRIM_FreezeBytes(x)) in
let thaw_bytes = (fun x -> PRIM_ThawBytes(x)) in
let set_bytes = (fun x -> (fun y -> (fun z -> PRIM_SetBytes(x,y,z)))) in
let get_bytes = (fun x -> (fun y -> PRIM_GetBytes(x,y))) in
let ref = (fun x -> PRIM_MakeRef(x)) in
let ! = (fun x -> PRIM_DeRef(x)) in
let := = (fun x -> (fun y -> PRIM_SetRef(x,y))) in
let crash = (fun x -> PRIM_Crash(x)) in
let load_sector = (fun x -> (fun y -> PRIM_LoadSec(x,y))) in
let store_sector = (fun x -> (fun y -> PRIM_StoreSec(x,y))) in
let free_words = (fun x -> PRIM_FreeWords(x)) in
let explode =
  (fun s ->
    let explode_loop =
      fix (fun explode_loop acc ->
        (fun i ->
          match ((< i) 0) with
          | true1 -> acc
          | false0 -> ((explode_loop ((:: ((string_index s) i)) acc)) ((- i) 1)))) in
    ((explode_loop Nil0) ((- (string_length s)) 1))) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> Unit0
    | Cons1(x,xsMore) ->
      let _ = (put_char x) in
      (put_chars xsMore)) in
let put_string = (fun s -> (put_chars (explode s))) in
let reverse =
  (fun ysStart ->
    let revloop =
      fix (fun revloop acc ->
        (fun ys ->
          match ys with
          | Nil0 -> acc
          | Cons1(y,ysMore) -> ((revloop ((:: y) acc)) ysMore))) in
    ((revloop Nil0) ysStart)) in
let newline = (fun _ -> (put_char '\n')) in
let read_line =
  (fun _ ->
    let readloop =
      fix (fun readloop sofar ->
        let theChar = (get_char Unit0) in
        let gotten = theChar in
        match ((eq_char gotten) '\n') with
        | true1 ->
          let _ = (newline Unit0) in
          (reverse sofar)
        | false0 ->
          let _ = (put_char gotten) in
          (readloop ((:: gotten) sofar))) in
    (readloop Nil0)) in
let _ = (put_string "LOAD\n") in
let mainloop =
  fix (fun mainloop _ ->
    let _ = (put_string "> ") in
    let _ = (put_chars (read_line Unit0)) in
    let _ = (newline Unit0) in
    (mainloop Unit0)) in
let main =
  (fun _ ->
    let _ = (put_string "Welcome to small: a proto readline\n") in
    let _ = (mainloop Unit0) in
    (put_string "NEVER\n")) in
(main Unit0)
