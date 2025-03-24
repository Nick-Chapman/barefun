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
    let k [mainloop_me] __arg =
      let u5_t1 = Tag_0 in
      mainloop_f1 u5_t1 k in
    let k [] u3_arg = put_char_g1 u3_arg k in
    let u4_t1 = Tag_0 in
    get_char_g2 u4_t1 k) in
let k [] main_arg =
  let u6_t1 = Tag_0 in
  main_arg u6_t1 k in
k mainloop_g3
----------
