(*Stage4 (CCF)*)
let k () = ()
let g1 = 'X' in
let g2 = CID0 in
let g3 = 'Y' in
let g4 = CID0 in
let g5 = 'Z' in
let t1 = PRIM_PutChar(g1) in
let t2 = PRIM_GetChar(g2) in
let t3 = PRIM_PutChar(t2) in
let t4 = PRIM_PutChar(g3) in
let t5 = PRIM_GetChar(g4) in
let t6 = PRIM_PutChar(t5) in
let t7 = PRIM_PutChar(g5) in
k t7
