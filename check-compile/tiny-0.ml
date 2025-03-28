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
let main =
  let mainloop =
    fix (fun mainloop _ ->
      let gotten = (get_char Unit) in
      let _ = (put_char gotten) in
      (mainloop Unit)) in
  mainloop in
