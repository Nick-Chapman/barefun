(*stage3*)
let k () = ()
let u_2_g1 = 'X' in
let u_7_g2 = 'Y' in
let u_12_g3 = 'Z' in
let u_1_t1 = Unit0 in
let k = [], fun [] u_3_arg ->
  let k = [], fun [] u_6_arg ->
    let k = [], fun [] u_8_arg ->
      let k = [], fun [] u_11_arg ->
        let prim_7_0'0_t1 = PRIM_PutChar(u_12_g3) in
        k prim_7_0'0_t1 in
      let k = [], fun [] u_10_arg ->
        let prim_6_0'0_t1 = PRIM_PutChar(u_10_arg) in
        k prim_6_0'0_t1 in
      let u_9_t1 = Unit0 in
      let prim_5_0'0_t2 = PRIM_GetChar(u_9_t1) in
      k prim_5_0'0_t2 in
    let prim_4_0'0_t1 = PRIM_PutChar(u_7_g2) in
    k prim_4_0'0_t1 in
  let k = [], fun [] u_5_arg ->
    let prim_3_0'0_t1 = PRIM_PutChar(u_5_arg) in
    k prim_3_0'0_t1 in
  let u_4_t1 = Unit0 in
  let prim_2_0'0_t2 = PRIM_GetChar(u_4_t1) in
  k prim_2_0'0_t2 in
let prim_1_0'0_t2 = PRIM_PutChar(u_2_g1) in
k prim_1_0'0_t2
