[transform1]
----------
let put_char = (fun x -> PRIM:PutChar[x]) in
let get_char = (fun x -> PRIM:GetChar[x]) in
let main =
  let mainloop =
    fix (fun mainloop _ ->
      let _ = (put_char (get_char Tag_0)) in
      (mainloop Tag_0)) in
  mainloop in
(main Tag_0)
----------
