(*Stage3 (ANF)*)
let k () = ()
let get_scancode = fix (fun [] get_scancode _ k ->
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
    get_scancode con k) in
let main = fix (fun [get_scancode] main _ k ->
  let con = Unit0 in
  let k [main] char =
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
    main con k in
  get_scancode con k) in
let con = Unit0 in
main con k
