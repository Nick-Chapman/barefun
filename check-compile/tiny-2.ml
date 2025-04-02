(*Stage2 (NbE)*)
let mainloop =
  fix (fun mainloop _ ->
    let gotten = PRIM_GetChar(CID0) in
    let _ = PRIM_PutChar(gotten) in
    let _ = PRIM_PutChar(gotten) in
    (mainloop CID0)) in
(mainloop CID0)
