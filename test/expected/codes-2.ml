(*Stage2 (NbE)*)
let get_scancode =
  fix (fun get_scancode (_) ->
    let _ = prim_Wait_for_interrupt(Unit0) in
    (match prim_Is_keyboard_ready(Unit0) with
    | true1 -> prim_Get_keyboard_last_scancode(Unit0)
    | false0 -> get_scancode (Unit0))) in
let loop =
  fix (fun loop (_) ->
    let char = get_scancode (Unit0) in
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
    loop (Unit0)) in
let loop =
  fix (fun loop (i) ->
    (match prim_LessInt(i, 42) with
    | true1 ->
      let x = prim_StringIndex("Press/release keys; see the scan codes...\n", i) in
      let _ = prim_PutChar(x) in
      loop (prim_AddInt(i, 1))
    | false0 -> Unit0)) in
let _ = loop (0) in
let _ = prim_Init_interrupt_mode(Unit0) in
loop (Unit0)
