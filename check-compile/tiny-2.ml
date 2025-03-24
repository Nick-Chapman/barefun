[transform2]
----------
let k () = ()
let put_char =
  (fun[] x k ->
    let v1 = PRIM_PutChar[x] in
    k v1) in
let get_char =
  (fun[] x k ->
    let v2 = PRIM_GetChar[x] in
    k v2) in
let k [get_char,put_char] main =
  let u5 = Tag_0 in
  main u5 k in
let mainloop =
  fix (fun[get_char,put_char] mainloop _ k ->
    let k [get_char,mainloop,put_char] gotten =
      let k [gotten,mainloop,put_char] _ =
        let u4 = Tag_0 in
        mainloop u4 k in
      put_char gotten k in
    let u3 = Tag_0 in
    get_char u3 k) in
k mainloop
----------
