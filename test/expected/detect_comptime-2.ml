(*Stage2 (NbE)*)
let arg2 = 34 in
let _ = prim_PutChar('B') in
let dub = (fun (x) -> prim_AddInt(x, x)) in
let x = dub (arg2) in
let x = prim_CharChr(x) in
let _ = prim_PutChar(x) in
Unit
