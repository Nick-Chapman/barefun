(*Stage4 (CCF)*)
let k () = ()
let g1 = Unit0 in
let g2 = Unit0 in
let t1 = PRIM_PutChar('X') in
let t2 = PRIM_GetChar(g1) in
let t3 = PRIM_PutChar(t2) in
let t4 = PRIM_PutChar('Y') in
let t5 = PRIM_GetChar(g2) in
let t6 = PRIM_PutChar(t5) in
let t7 = PRIM_PutChar('Z') in
k t7
