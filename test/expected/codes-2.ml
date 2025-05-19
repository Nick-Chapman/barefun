(*Stage2 (NbE)*)
let get_scancode =
  fix (fun get_scancode _ ->
    let _ = PRIM_Wait_for_interrupt(Unit0) in
    match PRIM_Is_keyboard_ready(Unit0) with
    | true1 -> PRIM_Get_keyboard_last_scancode(Unit0)
    | false0 -> (get_scancode Unit0)) in
let loop =
  fix (fun loop _ ->
    let char = (get_scancode Unit0) in
    let n = PRIM_CharOrd(char) in
    let z = PRIM_ModInt(n,10) in
    let xy = PRIM_DivInt(n,10) in
    let y = PRIM_ModInt(xy,10) in
    let x = PRIM_DivInt(xy,10) in
    let _ = PRIM_PutChar('{') in
    let x = PRIM_AddInt(x,48) in
    let x = PRIM_CharChr(x) in
    let _ = PRIM_PutChar(x) in
    let x = PRIM_AddInt(y,48) in
    let x = PRIM_CharChr(x) in
    let _ = PRIM_PutChar(x) in
    let x = PRIM_AddInt(z,48) in
    let x = PRIM_CharChr(x) in
    let _ = PRIM_PutChar(x) in
    let _ = PRIM_PutChar('}') in
    let _ = PRIM_PutChar(' ') in
    (loop Unit0)) in
let loop =
  fix (fun loop i ->
    match PRIM_LessInt(i,42) with
    | true1 ->
      let x = PRIM_StringIndex("Press/release keys; see the scan codes...\n",i) in
      let _ = PRIM_PutChar(x) in
      (loop PRIM_AddInt(i,1))
    | false0 -> Unit0) in
let _ = (loop 0) in
let _ = PRIM_Init_interrupt_mode(Unit0) in
(loop Unit0)
