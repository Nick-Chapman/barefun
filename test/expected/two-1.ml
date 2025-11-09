(*Stage1 (Exp)*)
let + = (fun x -> (fun y -> PRIM_AddInt(x, y))) in
let % = (fun x -> (fun y -> PRIM_ModInt(x, y))) in
let ( * ) = (fun x -> (fun y -> PRIM_MulInt(x, y))) in
let - = (fun x -> (fun y -> PRIM_SubInt(x, y))) in
let / = (fun x -> (fun y -> PRIM_DivInt(x, y))) in
let :: = (fun x -> (fun y -> Cons(x, y))) in
let < = (fun x -> (fun y -> PRIM_LessInt(x, y))) in
let = = (fun x -> (fun y -> PRIM_EqInt(x, y))) in
let chr = (fun x -> PRIM_CharChr(x)) in
let eq_char = (fun x -> (fun y -> PRIM_EqChar(x, y))) in
let get_char = (fun x -> PRIM_GetChar(x)) in
let ord = (fun x -> PRIM_CharOrd(x)) in
let put_char = (fun x -> PRIM_PutChar(x)) in
let string_index = (fun x -> (fun y -> PRIM_StringIndex(x, y))) in
let string_length = (fun x -> PRIM_StringLength(x)) in
let make_bytes = (fun x -> PRIM_MakeBytes(x)) in
let freeze_bytes = (fun x -> PRIM_FreezeBytes(x)) in
let thaw_bytes = (fun x -> PRIM_ThawBytes(x)) in
let set_bytes = (fun x -> (fun y -> (fun z -> PRIM_SetBytes(x, y, z)))) in
let get_bytes = (fun x -> (fun y -> PRIM_GetBytes(x, y))) in
let ref = (fun x -> PRIM_MakeRef(x)) in
let ! = (fun x -> PRIM_DeRef(x)) in
let := = (fun x -> (fun y -> PRIM_SetRef(x, y))) in
let crash = (fun x -> PRIM_Crash(x)) in
let load_sector = (fun x -> (fun y -> PRIM_LoadSec(x, y))) in
let store_sector = (fun x -> (fun y -> PRIM_StoreSec(x, y))) in
let free_words = (fun x -> PRIM_FreeWords(x)) in
let get_ticks = (fun x -> PRIM_Get_ticks(x)) in
let init_interrupt_mode = (fun x -> PRIM_Init_interrupt_mode(x)) in
let wait_for_interrupt = (fun x -> PRIM_Wait_for_interrupt(x)) in
let is_keyboard_ready = (fun x -> PRIM_Is_keyboard_ready(x)) in
let get_keyboard_last_scancode = (fun x -> PRIM_Get_keyboard_last_scancode(x)) in
let noinline = (fun x -> PRIM_Noinline(x)) in
let is_comptime_known = (fun x -> PRIM_IsComptimeKnown(x)) in
let two = (noinline (fun x -> (fun y -> ((+ x) y)))) in
let numA = (noinline (fun _ -> 60)) in
let numB = (noinline (fun _ -> 5)) in
let call_two =
  (noinline
  (fun _ ->
    let a = (numA Unit) in
    let b = (numB Unit) in
    let res = ((two a) b) in
    res)) in
let main =
  (fun _ ->
    let res = (call_two Unit) in
    (put_char (chr res))) in
(main Unit)
