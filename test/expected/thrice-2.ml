(*Stage2 (NbE)*)
let decrease = (fun [b,a] -> PRIM_SubInt(a, b)) in
let thriceA = (fun [f,x] -> f [f [f [x]]]) in
let thriceB = (fun [f,x] -> f [f [f [x]]]) in
let res = thriceA [thriceB, decrease [1], 92] in
let x = PRIM_CharChr(res) in
PRIM_PutChar(x)
