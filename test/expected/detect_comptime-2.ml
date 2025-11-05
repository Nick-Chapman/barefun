(*Stage2 (NbE)*)
let arg2 = 34 in
let _ = PRIM_PutChar('B') in
let dub = (fun [x] -> PRIM_AddInt(x, x)) in
let x = dub [arg2] in
let x = PRIM_CharChr(x) in
let _ = PRIM_PutChar(x) in
Unit0
