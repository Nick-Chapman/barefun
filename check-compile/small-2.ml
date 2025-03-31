(*stage2*)
let k () = ()
let put_chars = fix (fun [] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_4'10 = Unit0 in
    k con_4'10
  | Cons1(x,xsMore) ->
    let _ = PRIM_PutChar(x) in
    put_chars xsMore k) in
let s = "LOAD\n" in
let prim_0'0 = PRIM_Explode(s) in
let k [put_chars] _ =
  let mainloop = fix (fun [put_chars] mainloop _ k ->
    let s = "> " in
    let prim_0'0 = PRIM_Explode(s) in
    let k [put_chars,mainloop] _ =
      let _ = Unit0 in
      let readloop = fix (fun [] readloop sofar k ->
        let x = Unit0 in
        let theChar = PRIM_GetChar(x) in
        let y = '\n' in
        let uLET_0'0 = PRIM_EqChar(theChar,y) in
        match uLET_0'0 with
        | true1 ->
          let _ = Unit0 in
          let x = '\n' in
          let _ = PRIM_PutChar(x) in
          let revloop = fix (fun [] revloop acc k ->
            let lam_10'22 = fun [acc,revloop] ys k ->
              match ys with
              | Nil0 -> k acc
              | Cons1(y,ysMore) ->
                let con_0'0 = Cons1[y,acc] in
                let k [ysMore] app_13'27 = app_13'27 ysMore k in
                revloop con_0'0 k in
            k lam_10'22) in
          let con_15'10 = Nil0 in
          let k [sofar] app_15'10 = app_15'10 sofar k in
          revloop con_15'10 k
        | false0 ->
          let _ = PRIM_PutChar(theChar) in
          let con_0'0 = Cons1[theChar,sofar] in
          readloop con_0'0 k) in
      let con_26'11 = Nil0 in
      let k [put_chars,mainloop] uLET_19'14 =
        let k [mainloop] _ =
          let _ = Unit0 in
          let x = '\n' in
          let _ = PRIM_PutChar(x) in
          let con_34'10 = Unit0 in
          mainloop con_34'10 k in
        put_chars uLET_19'14 k in
      readloop con_26'11 k in
    put_chars prim_0'0 k) in
  let _ = Unit0 in
  let s = "RUN\n" in
  let prim_0'0 = PRIM_Explode(s) in
  let k [put_chars,mainloop] _ =
    let con_38'20 = Unit0 in
    let k [put_chars] _ =
      let s = "NEVER\n" in
      let prim_0'0 = PRIM_Explode(s) in
      put_chars prim_0'0 k in
    mainloop con_38'20 k in
  put_chars prim_0'0 k in
put_chars prim_0'0 k
