[transform1]
----------
let eq_char = (fun x -> (fun y -> PRIM:EqChar[x,y])) in
let explode = (fun x -> PRIM:Explode[x]) in
let put_char = (fun x -> PRIM:PutChar[x]) in
let get_char = (fun x -> PRIM:GetChar[x]) in
let :: = (fun x -> (fun y -> Tag_1(x, y))) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Tag_0[] -> Tag_0
    | Tag_1[x,xsMore] ->
      let _ = (put_char x) in
      (put_chars xsMore)) in
let put_string = (fun s -> (put_chars (explode s))) in
let reverse =
  (fun ysStart ->
    let revloop =
      fix (fun revloop acc ->
        (fun ys ->
          match ys with
          | Tag_0[] -> acc
          | Tag_1[y,ysMore] -> ((revloop ((:: y) acc)) ysMore))) in
    ((revloop Tag_0) ysStart)) in
let newline = (fun _ -> (put_char '\n')) in
let read_line =
  (fun _ ->
    let readloop =
      fix (fun readloop sofar ->
        let c = (get_char Tag_0) in
        match ((eq_char c) '\n') with
        | Tag_1[] ->
          let _ = (newline Tag_0) in
          (reverse sofar)
        | Tag_0[] ->
          let _ = (put_char c) in
          (readloop ((:: c) sofar))) in
    (readloop Tag_0)) in
let main =
  fix (fun main _ ->
    let _ = (put_string "> ") in
    let _ = (put_chars (read_line Tag_0)) in
    let _ = (newline Tag_0) in
    (main Tag_0)) in
(main Tag_0)
----------
