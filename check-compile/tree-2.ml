(*stage2*)
let k () = ()
let loop = fix (fun [] loop acc k ->
  let lam_5'19 = fun [acc,loop] i k ->
    let lit_6'11 = 0 in
    let prim_0'0 = PRIM_EqInt(i,lit_6'11) in
    match prim_0'0 with
    | true1 -> k acc
    | false0 ->
      let lit_7'29 = 10 in
      let c = PRIM_ModInt(i,lit_7'29) in
      let lit_0'0 = 48 in
      let x = PRIM_AddInt(lit_0'0,c) in
      let x = PRIM_CharChr(x) in
      let con_0'0 = CID1[x,acc] in
      let k [i] app_7'11 =
        let lit_7'44 = 10 in
        let prim_0'0 = PRIM_DivInt(i,lit_7'44) in
        app_7'11 prim_0'0 k in
      loop con_0'0 k in
  k lam_5'19) in
let put_chars = fix (fun [] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_13'10 = CID0 in
    k con_13'10
  | Cons1(x,xs) ->
    let _ = PRIM_PutChar(x) in
    put_chars xs k) in
let eval = fix (fun [] eval e k ->
  match e with
  | Num0(n) -> k n
  | Add1(e1,e2) ->
    let k [eval,e2] x =
      let k [x] y =
        let prim_0'0 = PRIM_AddInt(x,y) in
        k prim_0'0 in
      eval e2 k in
    eval e1 k
  | Sub2(e1,e2) ->
    let k [eval,e2] x =
      let k [x] y =
        let prim_0'0 = PRIM_SubInt(x,y) in
        k prim_0'0 in
      eval e2 k in
    eval e1 k) in
let lit_34'24 = 1000 in
let con_32'12 = CID0[lit_34'24] in
let lit_34'39 = 42 in
let con_32'12 = CID0[lit_34'39] in
let lit_34'47 = 3 in
let con_32'12 = CID0[lit_34'47] in
let con_34'30 = CID1[con_32'12,con_32'12] in
let con_34'15 = CID2[con_32'12,con_34'30] in
let k [loop,put_chars] i =
  let lit_9'18 = 0 in
  let prim_0'0 = PRIM_EqInt(i,lit_9'18) in
  let k [put_chars] case_9'11 = put_chars case_9'11 k in
  match prim_0'0 with
  | true1 ->
    let lit_9'26 = '0' in
    let con_9'29 = CID0 in
    let con_9'26 = CID1[lit_9'26,con_9'29] in
    k con_9'26
  | false0 ->
    let con_9'41 = CID0 in
    let k [i] app_9'41 = app_9'41 i k in
    loop con_9'41 k in
eval con_34'15 k
