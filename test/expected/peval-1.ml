(*Stage1 (Exp)*)
let + = (fun x -> (fun y -> PRIM_AddInt(x, y))) in
let % = (fun x -> (fun y -> PRIM_ModInt(x, y))) in
let ( * ) = (fun x -> (fun y -> PRIM_MulInt(x, y))) in
let - = (fun x -> (fun y -> PRIM_SubInt(x, y))) in
let / = (fun x -> (fun y -> PRIM_DivInt(x, y))) in
let :: = (fun x -> (fun y -> Cons1(x, y))) in
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
let goal = 10 in
let not =
  (fun b ->
    match b with
    | true1 -> false0
    | false0 -> true1) in
let explode =
  (noinline
  (fun s ->
    let explode_loop =
      fix (fun explode_loop acc ->
        (fun i ->
          match ((< i) 0) with
          | true1 -> acc
          | false0 -> ((explode_loop ((:: ((string_index s) i)) acc)) ((- i) 1)))) in
    ((explode_loop Nil0) ((- (string_length s)) 1)))) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> Unit0
    | Cons1(x,xs) ->
      let _ = (put_char x) in
      (put_chars xs)) in
let put_string = (fun s -> (put_chars (explode s))) in
let chars_of_int =
  (fun i ->
    let ord0 = (ord '0') in
    let char_of_digit = (fun c -> (chr ((+ ord0) c))) in
    let loop =
      fix (fun loop acc ->
        (fun i ->
          match ((= i) 0) with
          | true1 -> acc
          | false0 -> ((loop ((:: (char_of_digit ((% i) 10))) acc)) ((/ i) 10)))) in
    match ((= i) 0) with
    | true1 -> Cons1('0', Nil0)
    | false0 -> ((loop Nil0) i)) in
let put_int =
  (noinline
  (fun i ->
    match ((< i) 0) with
    | true1 -> (put_chars ((:: '-') (chars_of_int ((- 0) i))))
    | false0 -> (put_chars (chars_of_int i)))) in
let deVal =
  (fun v ->
    match v with
    | VALUE0(i) -> i) in
let vadd = (fun v1 -> (fun v2 -> VALUE0(((+ (deVal v1)) (deVal v2))))) in
let vdec = (fun v -> VALUE0(((- (deVal v)) 1))) in
let program =
  let result = 0 in
  let loopc = 1 in
  Cons1(LOAD_IMMEDIATE0(VALUE0(0)), Cons1(STORE_LOCAL1(result), Cons1(LOAD_IMMEDIATE0(VALUE0(goal)), Cons1(STORE_LOCAL1(loopc), Cons1(ADD3(result, loopc), Cons1(STORE_LOCAL1(result), Cons1(LOAD_LOCAL2(loopc), Cons1(DEC4, Cons1(STORE_LOCAL1(loopc), Cons1(JMPNZ7(4), Cons1(PRINT5("(Ocaml)Result: "), Cons1(LOAD_LOCAL2(result), Cons1(PRINTI6, Cons1(PRINT5("\n"), Cons1(HALT8, Nil0))))))))))))))) in
let drop =
  fix (fun drop i ->
    (fun xs ->
      match ((= i) 0) with
      | true1 -> xs
      | false0 ->
        match xs with
        | Nil0 -> Nil0
        | Cons1(_,xs) -> ((drop ((- i) 1)) xs))) in
let execute =
  (fun program0 ->
    let setPC = (fun i -> ((drop i) program0)) in
    let zero = VALUE0(0) in
    let local0 = (ref zero) in
    let local1 = (ref zero) in
    let local_at_put =
      (noinline
      (fun i ->
        (fun v ->
          match ((= i) 0) with
          | true1 -> ((:= local0) v)
          | false0 ->
            match ((= i) 1) with
            | true1 -> ((:= local1) v)
            | false0 -> (crash "local_at_put")))) in
    let local_at =
      (noinline
      (fun i ->
        match ((= i) 0) with
        | true1 -> (! local0)
        | false0 ->
          match ((= i) 1) with
          | true1 -> (! local1)
          | false0 -> (crash "local_at"))) in
    let acc = (ref zero) in
    let loop =
      fix (fun loop ops ->
        match ops with
        | Nil0 -> (crash "run out of instructions")
        | Cons1(op,ops) ->
          match op with
          | LOAD_IMMEDIATE0(v) ->
            let _ = ((:= acc) v) in
            (loop ops)
          | STORE_LOCAL1(i) ->
            let _ = ((local_at_put i) (! acc)) in
            (loop ops)
          | LOAD_LOCAL2(i) ->
            let _ = ((:= acc) (local_at i)) in
            (loop ops)
          | ADD3(i,j) ->
            let _ = ((:= acc) ((vadd (local_at i)) (local_at j))) in
            (loop ops)
          | DEC4 ->
            let _ = ((:= acc) (vdec (! acc))) in
            (loop ops)
          | PRINTI6 ->
            let _ = (put_int (deVal (! acc))) in
            (loop ops)
          | PRINT5(s) ->
            let _ = (put_string s) in
            (loop ops)
          | JMPNZ7(address) ->
            match (not ((= (deVal (! acc))) 0)) with
            | true1 -> (loop (setPC address))
            | false0 -> (loop ops)
          | HALT8 -> Unit0) in
    (loop program0)) in
let main =
  (fun _ ->
    let _ = (execute program) in
    Unit0) in
(main Unit0)
