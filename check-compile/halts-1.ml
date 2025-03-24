[transform1]
----------
let + = (fun x -> (fun y -> PRIM:AddInt[x,y])) in
let - = (fun x -> (fun y -> PRIM:SubInt[x,y])) in
let ( * ) = (fun x -> (fun y -> PRIM:MulInt[x,y])) in
let / = (fun x -> (fun y -> PRIM:DivInt[x,y])) in
let % = (fun x -> (fun y -> PRIM:ModInt[x,y])) in
let < = (fun x -> (fun y -> PRIM:LessInt[x,y])) in
let = = (fun x -> (fun y -> PRIM:EqInt[x,y])) in
let eq_char = (fun x -> (fun y -> PRIM:EqChar[x,y])) in
let ord = (fun x -> PRIM:CharOrd[x]) in
let chr = (fun x -> PRIM:CharChr[x]) in
let explode = (fun x -> PRIM:Explode[x]) in
let put_char = (fun x -> PRIM:PutChar[x]) in
let get_char = (fun x -> PRIM:GetChar[x]) in
let :: = (fun x -> (fun y -> Tag_1(x, y))) in
let main =
  (fun _ ->
    let _ = (put_char 'X') in
    let _ = (put_char (get_char Tag_0)) in
    let _ = (put_char 'Y') in
    let _ = (put_char (get_char Tag_0)) in
    (put_char 'Z')) in
(main Tag_0)
----------
