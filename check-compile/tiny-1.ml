[transform1]
----------
let put_char = (fun x -> PRIM:PutChar[x]) in
let get_char = (fun x -> PRIM:GetChar[x]) in
let main =
  let mainloop =
    fix (fun mainloop _ ->
      let gotten = (get_char Tag_0) in
      let _ = (put_char gotten) in
      (mainloop Tag_0)) in
  mainloop in
(main Tag_0)
----------
