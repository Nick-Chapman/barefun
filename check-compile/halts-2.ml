(*stage2*)
let k () = ()
let + = fun[] x k ->
  let v2 = fun[x] y k ->
    let v1 = PRIM_AddInt(x,y) in
    k v1 in
  k v2 in
let - = fun[] x k ->
  let v4 = fun[x] y k ->
    let v3 = PRIM_SubInt(x,y) in
    k v3 in
  k v4 in
let ( * ) = fun[] x k ->
  let v6 = fun[x] y k ->
    let v5 = PRIM_MulInt(x,y) in
    k v5 in
  k v6 in
let / = fun[] x k ->
  let v8 = fun[x] y k ->
    let v7 = PRIM_DivInt(x,y) in
    k v7 in
  k v8 in
let % = fun[] x k ->
  let v10 = fun[x] y k ->
    let v9 = PRIM_ModInt(x,y) in
    k v9 in
  k v10 in
let < = fun[] x k ->
  let v12 = fun[x] y k ->
    let v11 = PRIM_LessInt(x,y) in
    k v11 in
  k v12 in
let = = fun[] x k ->
  let v14 = fun[x] y k ->
    let v13 = PRIM_EqInt(x,y) in
    k v13 in
  k v14 in
let eq_char = fun[] x k ->
  let v16 = fun[x] y k ->
    let v15 = PRIM_EqChar(x,y) in
    k v15 in
  k v16 in
let ord = fun[] x k ->
  let v17 = PRIM_CharOrd(x) in
  k v17 in
let chr = fun[] x k ->
  let v18 = PRIM_CharChr(x) in
  k v18 in
let explode = fun[] x k ->
  let v19 = PRIM_Explode(x) in
  k v19 in
let put_char = fun[] x k ->
  let v20 = PRIM_PutChar(x) in
  k v20 in
let get_char = fun[] x k ->
  let v21 = PRIM_GetChar(x) in
  k v21 in
let :: = fun[] x k ->
  let v23 = fun[x] y k ->
    let v22 = Tag_1[x,y] in
    k v22 in
  k v23 in
let main = fun[get_char,put_char] _ k ->
  let k [get_char,put_char] _ =
    let k [get_char,put_char] _ =
      let k [get_char,put_char] _ =
        let k [put_char] _ =
          let u30 = 'Z' in
          put_char u30 k in
        let k [put_char] u28 = put_char u28 k in
        let u29 = Tag_0 in
        get_char u29 k in
      let u27 = 'Y' in
      put_char u27 k in
    let k [put_char] u25 = put_char u25 k in
    let u26 = Tag_0 in
    get_char u26 k in
  let u24 = 'X' in
  put_char u24 k in
let u31 = Tag_0 in
main u31 k
