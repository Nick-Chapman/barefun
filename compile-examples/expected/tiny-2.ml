(*Stage2 (NbE)*)
let mainloop =
  fix (fun mainloop _ ->
    let gotten = PRIM_GetChar(Unit0) in
    let _ = PRIM_PutChar(gotten) in
    let _ = PRIM_PutChar(gotten) in
    (mainloop Unit0)) in
(mainloop Unit0)
