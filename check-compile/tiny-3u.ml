(*stage3; un-normalized*)
let k () = ()
let put_char_0'0_g1 = fun x_0'0_arg k ->
  let prim_20_0'0_t1 = PRIM_PutChar(x_0'0_arg) in
  k prim_20_0'0_t1 in
let get_char_0'0_g2 = fun x_0'0_arg k ->
  let prim_21_0'0_t1 = PRIM_GetChar(x_0'0_arg) in
  k prim_21_0'0_t1 in
let mainloop_3'10_g3 = fun mainloop_3'10_me __3'19_arg k ->
  let con_24_4'26_t1 = Unit0 in
  let k = [mainloop_3'10_me], fun [mainloop_3'10_f1] gotten_4'8_arg ->
    let k = [mainloop_3'10_f1], fun [mainloop_3'10_f1] __5'19_arg ->
      let con_25_6'13_t1 = Unit0 in
      mainloop_3'10_f1 con_25_6'13_t1 k in
    put_char_0'0_g1 gotten_4'8_arg k in
  get_char_0'0_g2 con_24_4'26_t1 k in
let main_2'4_g3 = mainloop_3'10_g3 in
let con_26_0'0_t1 = Unit0 in
main_2'4_g3 con_26_0'0_t1 k
