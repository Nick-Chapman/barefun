(*stage1*)
let main =
  let mainloop =
    fix (fun mainloop _ ->
      let gotten =
        let x = Unit0 in
        PRIM_GetChar(x) in
      let _ = PRIM_PutChar(gotten) in
      let _ = PRIM_PutChar(gotten) in
      (mainloop Unit0)) in
  mainloop in
(main Unit0)
