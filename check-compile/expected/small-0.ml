[ast]
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
let :: = (fun x -> (fun y -> ::(x, y))) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | [][] -> Unit
    | ::[x,xsMore] ->
      let _ = (put_char x) in
      (put_chars xsMore)) in
let put_string = (fun s -> (put_chars (explode s))) in
let reverse =
  (fun ysStart ->
    let revloop =
      fix (fun revloop acc ->
        (fun ys ->
          match ys with
          | [][] -> acc
          | ::[y,ysMore] -> ((revloop ((:: y) acc)) ysMore))) in
    ((revloop []) ysStart)) in
let newline = (fun _ -> (put_char '\n')) in
let read_line =
  (fun _ ->
    let readloop =
      fix (fun readloop sofar ->
        let c = (get_char Unit) in
        match ((eq_char c) '\n') with
        | true[] ->
          let _ = (newline Unit) in
          (reverse sofar)
        | false[] ->
          let _ = (put_char c) in
          (readloop ((:: c) sofar))) in
    (readloop [])) in
let main =
  fix (fun main _ ->
    let _ = (put_string "> ") in
    let _ = (put_chars (read_line Unit)) in
    let _ = (newline Unit) in
    (main Unit)) in
----------
