(*stage1*)
let _ = Unit0 in
let _ =
  let x = 'X' in
  PRIM_PutChar(x) in
let _ =
  let x =
    let x = Unit0 in
    PRIM_GetChar(x) in
  PRIM_PutChar(x) in
let _ =
  let x = 'Y' in
  PRIM_PutChar(x) in
let _ =
  let x =
    let x = Unit0 in
    PRIM_GetChar(x) in
  PRIM_PutChar(x) in
let x = 'Z' in
PRIM_PutChar(x)
