(*stage2; un-normalized*)
let k () = ()
let + = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_AddInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let - = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_SubInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let ( * ) = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_MulInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let / = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_DivInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let % = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_ModInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let < = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_LessInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let = = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_EqInt(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let eq_char = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let prim_0'0 = PRIM_EqChar(x,y) in
    k prim_0'0 in
  k lam_0'0 in
let ord = fun [] x k ->
  let prim_0'0 = PRIM_CharOrd(x) in
  k prim_0'0 in
let chr = fun [] x k ->
  let prim_0'0 = PRIM_CharChr(x) in
  k prim_0'0 in
let explode = fun [] x k ->
  let prim_0'0 = PRIM_Explode(x) in
  k prim_0'0 in
let put_char = fun [] x k ->
  let prim_0'0 = PRIM_PutChar(x) in
  k prim_0'0 in
let get_char = fun [] x k ->
  let prim_0'0 = PRIM_GetChar(x) in
  k prim_0'0 in
let :: = fun [] x k ->
  let lam_0'0 = fun [x] y k ->
    let con_0'0 = Cons1[x,y] in
    k con_0'0 in
  k lam_0'0 in
let mainloop = fix (fun [get_char,put_char] mainloop _ k ->
  let con_4'26 = Unit0 in
  let k [put_char,mainloop] gotten =
    let k [put_char,mainloop,gotten] _ =
      let k [mainloop] _ =
        let con_7'13 = Unit0 in
        mainloop con_7'13 k in
      put_char gotten k in
    put_char gotten k in
  get_char con_4'26 k) in
let main = mainloop in
let con_0'0 = Unit0 in
main con_0'0 k
