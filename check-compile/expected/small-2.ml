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
    | Tag_1(x,xs) ->
      let k [put_char,put_chars,x,xs] _ = put_chars xs k in
      put_char x k) in
let put_string =
  (fun[explode,put_chars] s k ->
    let k [explode,put_chars,s] u9 = put_chars u9 k in
    explode s k) in
let reverse =
  (fun[::] xs k ->
    let revloop =
      fix (fun[::] revloop acc k ->
        let v13 =
          (fun[::,acc,revloop] xs k ->
            match xs with
            | Tag_0 -> k acc
            | Tag_1(x,xs) ->
              let k [::,acc,revloop,x,xs] u10 = u10 xs k in
              let k [::,acc,revloop,x] u11 = revloop u11 k in
              let k [::,acc,x] u12 = u12 acc k in
              :: x k) in
        k v13) in
    let k [revloop,xs] u14 = u14 xs k in
    let u15 = Tag_0 in
    revloop u15 k) in
let newline =
  (fun[put_char] _ k ->
    let u16 = '\n' in
    put_char u16 k) in
let read_line =
  (fun[::,eq_char,get_char,newline,put_char,reverse] _ k ->
    let readloop =
      fix (fun[::,eq_char,get_char,newline,put_char,reverse] readloop acc k ->
        let k [::,acc,eq_char,get_char,newline,put_char,readloop,reverse] c =
          let k [::,acc,c,eq_char,newline,put_char,readloop,reverse] u18 =
            match u18 with
            | Tag_1 ->
              let k [acc,newline,reverse] _ = reverse acc k in
              let u21 = Tag_0 in
              newline u21 k
            | Tag_0 ->
              let k [::,acc,c,put_char,readloop] _ =
                let k [::,acc,c,readloop] u22 = readloop u22 k in
                let k [::,acc,c] u23 = u23 acc k in
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
