(*stage1*)
let _ = Unit0 in
let _ = PRIM_PutChar('X') in
let _ =
  let x =
    let x = Unit0 in
    PRIM_GetChar(x) in
  PRIM_PutChar(x) in
let _ = PRIM_PutChar('Y') in
let _ =
  let x =
    let x = Unit0 in
    PRIM_GetChar(x) in
  PRIM_PutChar(x) in
PRIM_PutChar('Z')
