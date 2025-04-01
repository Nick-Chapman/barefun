(*stage1*)
let _ = Unit0 in
let _ = PRIM_PutChar('X') in
let x = Unit0 in
let x = PRIM_GetChar(x) in
let _ = PRIM_PutChar(x) in
let _ = PRIM_PutChar('Y') in
let x = Unit0 in
let x = PRIM_GetChar(x) in
let _ = PRIM_PutChar(x) in
PRIM_PutChar('Z')
