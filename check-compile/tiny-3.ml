[transform3]
----------
let k () = ()
let put_char_g1 =
  (fun x_arg k ->
    let v1_t1 = PRIM_PutChar[x_arg] in
    k v1_t1) in
let get_char_g2 =
  (fun x_arg k ->
    let v2_t1 = PRIM_GetChar[x_arg] in
    k v2_t1) in
let mainloop_g3 =
  fix (fun mainloop_me __arg k ->
    let k = [mainloop_me], fun [mainloop_f1] gotten_arg ->
      let k = [gotten_arg,mainloop_f1], fun [gotten_f1,mainloop_f2] __arg ->
        let u4_t1 = Tag_0 in
        mainloop_f2 u4_t1 k in
      put_char_g1 gotten_arg k in
    let u3_t1 = Tag_0 in
    get_char_g2 u3_t1 k) in
let k = [], fun [] main_arg ->
  let u5_t1 = Tag_0 in
  main_arg u5_t1 k in
k mainloop_g3
----------
