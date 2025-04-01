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
let thrice = fun [] f k ->
  let lam_2'13 = fun [f] x k ->
    let k [f] app_2'25 =
      let k [f] app_2'22 = f app_2'22 k in
      f app_2'25 k in
    f x k in
  k lam_2'13 in
let main = fun [+,chr,ord,put_char,thrice] _ k ->
  let start = '@' in
  let next = fun [+,chr,put_char] x k ->
    let k [+,put_char,x] app_6'29 =
      let k [+,x] _ =
        let k [] app_6'34 =
          let lit_6'35 = 1 in
          app_6'34 lit_6'35 k in
        + x k in
      put_char app_6'29 k in
    chr x k in
  let k [chr,ord,put_char,start,next] app_7'24 =
    let k [chr,ord,put_char,start] app_7'31 =
      let k [chr,put_char,app_7'31] app_7'41 =
        let k [chr,put_char] app_7'36 =
          let k [put_char] app_7'16 =
            let k [put_char] _ =
              let lit_8'11 = '\n' in
              put_char lit_8'11 k in
            put_char app_7'16 k in
          chr app_7'36 k in
        app_7'31 app_7'41 k in
      ord start k in
    app_7'24 next k in
  thrice thrice k in
let con_0'0 = Unit0 in
main con_0'0 k
