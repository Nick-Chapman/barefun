(*Stage2 (NbE)*)
let _ = PRIM_PutChar('X') in
let x = PRIM_GetChar(CID0) in
let _ = PRIM_PutChar(x) in
let _ = PRIM_PutChar('Y') in
let x = PRIM_GetChar(CID0) in
let _ = PRIM_PutChar(x) in
PRIM_PutChar('Z')
