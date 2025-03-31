(*stage2*)
let k () = ()
let _ = Unit0 in
let x = 'X' in
let _ = PRIM_PutChar(x) in
let x = Unit0 in
let x = PRIM_GetChar(x) in
let _ = PRIM_PutChar(x) in
let x = 'Y' in
let _ = PRIM_PutChar(x) in
let x = Unit0 in
let x = PRIM_GetChar(x) in
let _ = PRIM_PutChar(x) in
let x = 'Z' in
let prim_0'0 = PRIM_PutChar(x) in
k prim_0'0
