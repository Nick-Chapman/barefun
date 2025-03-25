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
let put_chars = fix (fun[put_char] put_chars xs k ->
  match xs with
  | Tag_0 ->
    let v24 = Tag_0 in
    k v24
  | Tag_1(x,xsMore) ->
    let k [put_chars,xsMore] _ = put_chars xsMore k in
    put_char x k) in
let put_string = fun[explode,put_chars] s k ->
  let k [put_chars] u25 = put_chars u25 k in
  explode s k in
let reverse = fun[::] ysStart k ->
  let revloop = fix (fun[::] revloop acc k ->
    let v29 = fun[::,acc,revloop] ys k ->
      match ys with
      | Tag_0 -> k acc
      | Tag_1(y,ysMore) ->
        let k [ysMore] u26 = u26 ysMore k in
        let k [revloop] u27 = revloop u27 k in
        let k [acc] u28 = u28 acc k in
        :: y k in
    k v29) in
  let k [ysStart] u30 = u30 ysStart k in
  let u31 = Tag_0 in
  revloop u31 k in
let newline = fun[put_char] _ k ->
  let u32 = '\n' in
  put_char u32 k in
let read_line = fun[::,eq_char,get_char,newline,put_char,reverse] _ k ->
  let readloop = fix (fun[::,eq_char,get_char,newline,put_char,reverse] readloop sofar k ->
    let k [::,eq_char,newline,put_char,readloop,reverse,sofar] theChar =
      let gotten = theChar in
      let k [::,gotten,newline,put_char,readloop,reverse,sofar] u34 =
        match u34 with
        | Tag_1 ->
          let k [reverse,sofar] _ = reverse sofar k in
          let u37 = Tag_0 in
          newline u37 k
        | Tag_0 ->
          let k [::,gotten,readloop,sofar] _ =
            let k [readloop] u38 = readloop u38 k in
            let k [sofar] u39 = u39 sofar k in
            :: gotten k in
          put_char gotten k in
      let k [] u35 =
        let u36 = '\n' in
        u35 u36 k in
      eq_char gotten k in
    let u33 = Tag_0 in
    get_char u33 k) in
  let u40 = Tag_0 in
  readloop u40 k in
let main = fix (fun[newline,put_chars,put_string,read_line] main _ k ->
  let k [main,newline,put_chars,read_line] _ =
    let k [main,newline] _ =
      let k [main] _ =
        let u45 = Tag_0 in
        main u45 k in
      let u44 = Tag_0 in
      newline u44 k in
    let k [put_chars] u42 = put_chars u42 k in
    let u43 = Tag_0 in
    read_line u43 k in
  let u41 = "> " in
  put_string u41 k) in
let u46 = Tag_0 in
main u46 k
