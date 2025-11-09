(*Stage2 (NbE)*)
let two = (fun (x,y) -> prim_AddInt(x, y)) in
let numA = (fun (_) -> 60) in
let numB = (fun (_) -> 5) in
let call_two =
  (fun (_) ->
    let a = numA (Unit) in
    let b = numB (Unit) in
    let res = two (a, b) in
    res) in
let res = call_two (Unit) in
let x = prim_CharChr(res) in
prim_PutChar(x)
