(*Stage3 (ANF)*)
let k () = ()
let is_even = fix (fun [] is_even n k ->
  let lit_4'25 = 0 in
  let prim_0'0 = PRIM_EqInt(n,lit_4'25) in
  match prim_0'0 with
  | true1 ->
    let con_4'32 = CID1 in
    k con_4'32
  | false0 ->
    let lit_4'52 = 1 in
    let n = PRIM_SubInt(n,lit_4'52) in
    let lit_3'24 = 0 in
    let prim_0'0 = PRIM_EqInt(n,lit_3'24) in
    match prim_0'0 with
    | true1 ->
      let con_3'31 = CID0 in
      k con_3'31
    | false0 ->
      let lit_3'53 = 1 in
      let prim_0'0 = PRIM_SubInt(n,lit_3'53) in
      is_even prim_0'0 k) in
let lit_11'8 = 42 in
let k [is_even] app_8'23 =
  let k [is_even] x =
    let _ = PRIM_PutChar(x) in
    let lit_12'8 = 13 in
    let k [] app_8'23 =
      let k [] x =
        let prim_0'0 = PRIM_PutChar(x) in
        k prim_0'0 in
      match app_8'23 with
      | true1 ->
        let lit_8'30 = 'E' in
        k lit_8'30
      | false0 ->
        let lit_8'39 = 'O' in
        k lit_8'39 in
    is_even lit_12'8 k in
  match app_8'23 with
  | true1 ->
    let lit_8'30 = 'E' in
    k lit_8'30
  | false0 ->
    let lit_8'39 = 'O' in
    k lit_8'39 in
is_even lit_11'8 k
