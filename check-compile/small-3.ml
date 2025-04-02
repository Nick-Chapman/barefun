(*Stage3 (ANF)*)
let k () = ()
let put_chars = fix (fun [] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_4'10 = CID0 in
    k con_4'10
  | Cons1(x,xsMore) ->
    let _ = PRIM_PutChar(x) in
    put_chars xsMore k) in
let lit_0'0 = 'L' in
let lit_0'0 = 'O' in
let lit_0'0 = 'A' in
let lit_0'0 = 'D' in
let lit_0'0 = '\n' in
let con_0'0 = CID0 in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let con_0'0 = CID1[lit_0'0,con_0'0] in
let k [put_chars] _ =
  let mainloop = fix (fun [put_chars] mainloop _ k ->
    let lit_0'0 = '>' in
    let lit_0'0 = ' ' in
    let con_0'0 = CID0 in
    let con_0'0 = CID1[lit_0'0,con_0'0] in
    let con_0'0 = CID1[lit_0'0,con_0'0] in
    let k [put_chars,mainloop] _ =
      let readloop = fix (fun [] readloop sofar k ->
        let con_21'27 = CID0 in
        let theChar = PRIM_GetChar(con_21'27) in
        let lit_23'22 = '\n' in
        let prim_0'0 = PRIM_EqChar(theChar,lit_23'22) in
        match prim_0'0 with
        | true1 ->
          let lit_17'26 = '\n' in
          let _ = PRIM_PutChar(lit_17'26) in
          let revloop = fix (fun [] revloop acc k ->
            let lam_10'22 = fun [acc,revloop] ys k ->
              match ys with
              | Nil0 -> k acc
              | Cons1(y,ysMore) ->
                let con_0'0 = CID1[y,acc] in
                let k [ysMore] app_13'27 = app_13'27 ysMore k in
                revloop con_0'0 k in
            k lam_10'22) in
          let con_15'10 = CID0 in
          let k [sofar] app_15'10 = app_15'10 sofar k in
          revloop con_15'10 k
        | false0 ->
          let _ = PRIM_PutChar(theChar) in
          let con_0'0 = CID1[theChar,sofar] in
          readloop con_0'0 k) in
      let con_26'11 = CID0 in
      let k [put_chars,mainloop] app_26'11 =
        let k [mainloop] _ =
          let lit_17'26 = '\n' in
          let _ = PRIM_PutChar(lit_17'26) in
          let con_34'10 = CID0 in
          mainloop con_34'10 k in
        put_chars app_26'11 k in
      readloop con_26'11 k in
    put_chars con_0'0 k) in
  let lit_0'0 = 'R' in
  let lit_0'0 = 'U' in
  let lit_0'0 = 'N' in
  let lit_0'0 = '\n' in
  let con_0'0 = CID0 in
  let con_0'0 = CID1[lit_0'0,con_0'0] in
  let con_0'0 = CID1[lit_0'0,con_0'0] in
  let con_0'0 = CID1[lit_0'0,con_0'0] in
  let con_0'0 = CID1[lit_0'0,con_0'0] in
  let k [put_chars,mainloop] _ =
    let con_38'20 = CID0 in
    let k [put_chars] _ =
      let lit_0'0 = 'N' in
      let lit_0'0 = 'E' in
      let lit_0'0 = 'V' in
      let lit_0'0 = 'E' in
      let lit_0'0 = 'R' in
      let lit_0'0 = '\n' in
      let con_0'0 = CID0 in
      let con_0'0 = CID1[lit_0'0,con_0'0] in
      let con_0'0 = CID1[lit_0'0,con_0'0] in
      let con_0'0 = CID1[lit_0'0,con_0'0] in
      let con_0'0 = CID1[lit_0'0,con_0'0] in
      let con_0'0 = CID1[lit_0'0,con_0'0] in
      let con_0'0 = CID1[lit_0'0,con_0'0] in
      put_chars con_0'0 k in
    mainloop con_38'20 k in
  put_chars con_0'0 k in
put_chars con_0'0 k
