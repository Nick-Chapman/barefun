(*stage1*)
let mainloop =
  fix (fun mainloop _ ->
    let x = Unit0 in
    let gotten = PRIM_GetChar(x) in
    let _ = PRIM_PutChar(gotten) in
    let _ = PRIM_PutChar(gotten) in
    (mainloop Unit0)) in
(mainloop Unit0)
