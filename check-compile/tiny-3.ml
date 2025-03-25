(*stage3*)
let k () = ()
let put_char_g1 = fun x_arg k ->
  let prim_20_t1 = PRIM_PutChar(x_arg) in
  k prim_20_t1 in
let get_char_g2 = fun x_arg k ->
  let prim_21_t1 = PRIM_GetChar(x_arg) in
  k prim_21_t1 in
let mainloop_g3 = fun mainloop_me __arg k ->
  let k = [mainloop_me], fun [mainloop_f1] gotten_arg ->
    let k = [mainloop_f1], fun [mainloop_f1] __arg ->
      let con_25_6'13_t1 = Unit0 in
      mainloop_f1 con_25_6'13_t1 k in
    put_char_g1 gotten_arg k in
  let con_24_4'26_t1 = Unit0 in
  get_char_g2 con_24_4'26_t1 k in
let k = [], fun [] main_arg ->
  let con_26_0'0_t1 = Unit0 in
  main_arg con_26_0'0_t1 k in
k mainloop_g3
