(*stage3*)
let k () = ()
let g2 = 'X' in
let g3 = Unit0 in
let g4 = 'Y' in
let g5 = Unit0 in
let g6 = 'Z' in
let t1 = PRIM_PutChar(g2) in
let t2 = PRIM_GetChar(g3) in
let t3 = PRIM_PutChar(t2) in
let t4 = PRIM_PutChar(g4) in
let t5 = PRIM_GetChar(g5) in
let t6 = PRIM_PutChar(t5) in
let t7 = PRIM_PutChar(g6) in
k t7
