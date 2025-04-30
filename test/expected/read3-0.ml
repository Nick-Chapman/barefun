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
let thaw_bytes = (fun x -> PRIM_ThawBytes(x)) in
let set_bytes = (fun x -> (fun y -> (fun z -> PRIM_SetBytes(x,y,z)))) in
let get_bytes = (fun x -> (fun y -> PRIM_GetBytes(x,y))) in
let ref = (fun x -> PRIM_MakeRef(x)) in
let ! = (fun x -> PRIM_DeRef(x)) in
let := = (fun x -> (fun y -> PRIM_SetRef(x,y))) in
let crash = (fun x -> PRIM_Crash(x)) in
let load_sector = (fun x -> (fun y -> PRIM_LoadSec(x,y))) in
let store_sector = (fun x -> (fun y -> PRIM_StoreSec(x,y))) in
let get_sp = (fun x -> PRIM_GetStackPointer(x)) in
let read1 =
  (fun _ ->
    let c = (get_char Unit) in
    let _ = (put_char c) in
    c) in
type _ = Trip
let newline = (fun _ -> (put_char '\n')) in
let read3 =
  (fun _ ->
    let a = (read1 Unit) in
    let b = (read1 Unit) in
    let c = (read1 Unit) in
    let t = Trip(a, b, c) in
    let _ = (newline Unit) in
    t) in
let put3_n =
  (fun t ->
    match t with
    | Trip(a,b,c) ->
      let _ = (put_char a) in
      let _ = (put_char b) in
      (put_char c)) in
let put3 =
  (fun t ->
    let _ = (put3_n t) in
    (newline Unit)) in
let rot3 =
  (fun t ->
    match t with
    | Trip(a,b,c) -> Trip(b, c, a)) in
let main =
  (fun _ ->
    let prompt = Trip('3', '>', ' ') in
    let _ = (put3_n prompt) in
    let a = (read3 Unit) in
    let _ = (put3 a) in
    let b = (rot3 a) in
    let c = (rot3 b) in
    let _ = (put3 b) in
    let _ = (put3 c) in
    (put3 (rot3 c))) in
