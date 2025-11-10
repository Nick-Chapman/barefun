(*Stage2 (NbE)*)
let get_scancode =
  let rec get_scancode (_) =
    let _ = prim_Wait_for_interrupt(Unit) in
    (match prim_Is_keyboard_ready(Unit) with
    | true -> prim_Get_keyboard_last_scancode(Unit)
    | false -> get_scancode (Unit)) in get_scancode in
let loop =
  let rec loop (_) =
    let char = get_scancode (Unit) in
    let n = prim_CharOrd(char) in
    let z = prim_ModInt(n, 10) in
    let xy = prim_DivInt(n, 10) in
    let y = prim_ModInt(xy, 10) in
    let x = prim_DivInt(xy, 10) in
    let _ = prim_PutChar('{') in
    let x = prim_AddInt(x, 48) in
    let x = prim_CharChr(x) in
    let _ = prim_PutChar(x) in
    let x = prim_AddInt(y, 48) in
    let x = prim_CharChr(x) in
    let _ = prim_PutChar(x) in
    let x = prim_AddInt(z, 48) in
    let x = prim_CharChr(x) in
    let _ = prim_PutChar(x) in
    let _ = prim_PutChar('}') in
    let _ = prim_PutChar(' ') in
    loop (Unit) in loop in
let loop =
  let rec loop (i) =
    (match prim_LessInt(i, 42) with
    | true ->
      let x = prim_StringIndex("Press/release keys; see the scan codes...\n", i) in
      let _ = prim_PutChar(x) in
      loop (prim_AddInt(i, 1))
    | false -> Unit) in loop in
let _ = loop (0) in
let _ = prim_Init_interrupt_mode(Unit) in
loop (Unit)
