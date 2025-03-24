[transform3]
----------
let k () = ()
let put_char_g1 =
  (fun x_arg k ->
    let v20_t1 = PRIM_PutChar[x_arg] in
    k v20_t1) in
let get_char_g2 =
  (fun x_arg k ->
    let v21_t1 = PRIM_GetChar[x_arg] in
    k v21_t1) in
let u24_g3 = 'X' in
let u27_g4 = 'Y' in
let u30_g5 = 'Z' in
let main_g6 =
  (fun __arg k ->
    let k = [], fun [] __arg ->
      let k = [], fun [] __arg ->
        let k = [], fun [] __arg ->
          let k = [], fun [] __arg -> put_char_g1 u30_g5 k in
          let k = [], fun [] u28_arg -> put_char_g1 u28_arg k in
          let u29_t1 = Tag_0 in
          get_char_g2 u29_t1 k in
        put_char_g1 u27_g4 k in
      let k = [], fun [] u25_arg -> put_char_g1 u25_arg k in
      let u26_t1 = Tag_0 in
      get_char_g2 u26_t1 k in
    put_char_g1 u24_g3 k) in
let u31_t1 = Tag_0 in
main_g6 u31_t1 k
----------
