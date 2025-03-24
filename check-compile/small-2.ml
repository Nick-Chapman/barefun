[transform2]
----------
let k () = ()
let eq_char =
  (fun[] x k ->
    let v2 =
      (fun[x] y k ->
        let v1 = PRIM_EqChar[x,y] in
        k v1) in
    k v2) in
let explode =
  (fun[] x k ->
    let v3 = PRIM_Explode[x] in
    k v3) in
let put_char =
  (fun[] x k ->
    let v4 = PRIM_PutChar[x] in
    k v4) in
let get_char =
  (fun[] x k ->
    let v5 = PRIM_GetChar[x] in
    k v5) in
let :: =
  (fun[] x k ->
    let v7 =
      (fun[x] y k ->
        let v6 = Tag_1[x,y] in
        k v6) in
    k v7) in
let put_chars =
  fix (fun[put_char] put_chars xs k ->
    match xs with
    | Tag_0 ->
      let v8 = Tag_0 in
      k v8
    | Tag_1(x,xsMore) ->
      let k [put_char,put_chars,x,xsMore] _ = put_chars xsMore k in
      put_char x k) in
let put_string =
  (fun[explode,put_chars] s k ->
    let k [explode,put_chars,s] u9 = put_chars u9 k in
    explode s k) in
let reverse =
  (fun[::] ysStart k ->
    let revloop =
      fix (fun[::] revloop acc k ->
        let v13 =
          (fun[::,acc,revloop] ys k ->
            match ys with
            | Tag_0 -> k acc
            | Tag_1(y,ysMore) ->
              let k [::,acc,revloop,y,ysMore] u10 = u10 ysMore k in
              let k [::,acc,revloop,y] u11 = revloop u11 k in
              let k [::,acc,y] u12 = u12 acc k in
              :: y k) in
        k v13) in
    let k [revloop,ysStart] u14 = u14 ysStart k in
    let u15 = Tag_0 in
    revloop u15 k) in
let newline =
  (fun[put_char] _ k ->
    let u16 = '\n' in
    put_char u16 k) in
let read_line =
  (fun[::,eq_char,get_char,newline,put_char,reverse] _ k ->
    let readloop =
      fix (fun[::,eq_char,get_char,newline,put_char,reverse] readloop sofar k ->
        let k [::,eq_char,get_char,newline,put_char,readloop,reverse,sofar] c =
          let k [::,c,eq_char,newline,put_char,readloop,reverse,sofar] u18 =
            match u18 with
            | Tag_1 ->
              let k [newline,reverse,sofar] _ = reverse sofar k in
              let u21 = Tag_0 in
              newline u21 k
            | Tag_0 ->
              let k [::,c,put_char,readloop,sofar] _ =
                let k [::,c,readloop,sofar] u22 = readloop u22 k in
                let k [::,c,sofar] u23 = u23 sofar k in
                :: c k in
              put_char c k in
          let k [c,eq_char] u19 =
            let u20 = '\n' in
            u19 u20 k in
          eq_char c k in
        let u17 = Tag_0 in
        get_char u17 k) in
    let u24 = Tag_0 in
    readloop u24 k) in
let main =
  fix (fun[newline,put_chars,put_string,read_line] main _ k ->
    let k [main,newline,put_chars,put_string,read_line] _ =
      let k [main,newline,put_chars,read_line] _ =
        let k [main,newline] _ =
          let u29 = Tag_0 in
          main u29 k in
        let u28 = Tag_0 in
        newline u28 k in
      let k [put_chars,read_line] u26 = put_chars u26 k in
      let u27 = Tag_0 in
      read_line u27 k in
    let u25 = "> " in
    put_string u25 k) in
let u30 = Tag_0 in
main u30 k
----------
