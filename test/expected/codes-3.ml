(*Stage3 (ANF)*)
let k () = ()
let get_scancode = fix (fun [] get_scancode [_] k ->
  let con = Unit0 in
  let _ = PRIM_Wait_for_interrupt(con) in
  let con = Unit0 in
  let prim = PRIM_Is_keyboard_ready(con) in
  match prim with
  | true1 ->
    let con = Unit0 in
    let prim = PRIM_Get_keyboard_last_scancode(con) in
    k prim
  | false0 ->
    let con = Unit0 in
    get_scancode [con] k) in
let loop = fix (fun [get_scancode] loop [_] k ->
  let con = Unit0 in
  let k [loop] char =
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
    let con = Unit0 in
    loop [con] k in
  get_scancode [con] k) in
let loop = fix (fun [] loop [i] k ->
  let prim = PRIM_LessInt(i,42) in
  match prim with
  | true1 ->
    let lit = "Press/release keys; see the scan codes...\n" in
    let x = PRIM_StringIndex(lit,i) in
    let _ = PRIM_PutChar(x) in
    let prim = PRIM_AddInt(i,1) in
    loop [prim] k
  | false0 ->
    let con = Unit0 in
    k con) in
let k [loop] _ =
  let con = Unit0 in
  let _ = PRIM_Init_interrupt_mode(con) in
  let con = Unit0 in
  loop [con] k in
loop [0] k
