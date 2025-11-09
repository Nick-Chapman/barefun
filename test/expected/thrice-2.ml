(*Stage2 (NbE)*)
let decrease = (fun (b,a) -> prim_SubInt(a, b)) in
let thriceA = (fun (f,x) -> f (f (f (x)))) in
let thriceB = (fun (f,x) -> f (f (f (x)))) in
let res = thriceA (thriceB, decrease (1), 92) in
let x = prim_CharChr(res) in
prim_PutChar(x)
