(*stage1*)
let main_8_2'4 =
  let mainloop_7_3'10 =
    fix (fun mainloop_2_3'10 __1_3'19 ->
      let gotten_4_4'8 =
        let x_3_0'0 = Unit0 in
        PRIM_GetChar(x_3_0'0) in
      let __5_5'19 = PRIM_PutChar(gotten_4_4'8) in
      let __6_6'19 = PRIM_PutChar(gotten_4_4'8) in
      (mainloop_2_3'10 Unit0)) in
  mainloop_7_3'10 in
(main_8_2'4 Unit0)
