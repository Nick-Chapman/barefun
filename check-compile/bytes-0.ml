(*Stage0 (AST)*)
let + = (fun x -> (fun y -> PRIM_AddInt(x,y))) in
let % = (fun x -> (fun y -> PRIM_ModInt(x,y))) in
let ( * ) = (fun x -> (fun y -> PRIM_MulInt(x,y))) in
let - = (fun x -> (fun y -> PRIM_SubInt(x,y))) in
let / = (fun x -> (fun y -> PRIM_DivInt(x,y))) in
let :: = (fun x -> (fun y -> Cons(x, y))) in
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
let set_bytes = (fun x -> (fun y -> (fun z -> PRIM_SetBytes(x,y,z)))) in
let length =
  fix (fun length xs ->
    match xs with
    | Nil -> 0
    | Cons(_,xs) -> ((+ 1) (length xs))) in
let implode =
  (fun xs ->
    let b = (make_bytes (length xs)) in
    let loop =
      fix (fun loop i ->
        (fun xs ->
          match xs with
          | Nil -> Unit
          | Cons(x,xs) ->
            let _ = (((set_bytes b) i) x) in
            ((loop ((+ i) 1)) xs))) in
    let _ = ((loop 0) xs) in
    (freeze_bytes b)) in
let explode =
  (fun s ->
    let explode_loop =
      fix (fun explode_loop acc ->
        (fun i ->
          match ((< i) 0) with
          | true -> acc
          | false -> ((explode_loop ((:: ((string_index s) i)) acc)) ((- i) 1)))) in
    ((explode_loop Nil) ((- (string_length s)) 1))) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil -> Unit
    | Cons(x,xsMore) ->
      let _ = (put_char x) in
      (put_chars xsMore)) in
let put_string = (fun s -> (put_chars (explode s))) in
let main =
  (fun _ ->
    let _ = (put_string "One\n") in
    let _ = (put_string (freeze_bytes (make_bytes 5))) in
    (put_string (implode Cons('T', Cons('w', Cons('o', Cons('\n', Nil))))))) in
