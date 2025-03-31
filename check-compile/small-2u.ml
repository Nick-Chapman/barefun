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
let put_chars = fix (fun [put_char] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_4'10 = Unit0 in
    k con_4'10
  | Cons1(x,xsMore) ->
    let k [put_chars,xsMore] _ = put_chars xsMore k in
    put_char x k) in
let put_string = fun [explode,put_chars] s k ->
  let k [put_chars] app_7'38 = put_chars app_7'38 k in
  explode s k in
let reverse = fun [::] ysStart k ->
  let revloop = fix (fun [::] revloop acc k ->
    let lam_10'22 = fun [::,revloop,acc] ys k ->
      match ys with
      | Nil0 -> k acc
      | Cons1(y,ysMore) ->
        let k [revloop,acc,ysMore] app_13'30 =
          let k [revloop,ysMore] app_13'33 =
            let k [ysMore] app_13'27 = app_13'27 ysMore k in
            revloop app_13'33 k in
          app_13'30 acc k in
        :: y k in
    k lam_10'22) in
  let con_15'10 = Nil0 in
  let k [ysStart] app_15'10 = app_15'10 ysStart k in
  revloop con_15'10 k in
let newline = fun [put_char] _ k ->
  let lit_17'26 = '\n' in
  put_char lit_17'26 k in
let read_line = fun [::,eq_char,get_char,put_char,reverse,newline] _ k ->
  let readloop = fix (fun [::,eq_char,get_char,put_char,reverse,newline] readloop sofar k ->
    let con_21'27 = Unit0 in
    let k [::,eq_char,put_char,reverse,newline,readloop,sofar] theChar =
      let gotten = theChar in
      let k [::,put_char,reverse,newline,readloop,sofar,gotten] app_23'15 =
        let lit_23'22 = '\n' in
        let k [::,put_char,reverse,newline,readloop,sofar,gotten] app_23'22 =
          match app_23'22 with
          | true1 ->
            let con_23'40 = Unit0 in
            let k [reverse,sofar] _ = reverse sofar k in
            newline con_23'40 k
          | false0 ->
            let k [::,readloop,sofar,gotten] _ =
              let k [readloop,sofar] app_24'41 =
                let k [readloop] app_24'44 = readloop app_24'44 k in
                app_24'41 sofar k in
              :: gotten k in
            put_char gotten k in
        app_23'15 lit_23'22 k in
      eq_char gotten k in
    get_char con_21'27 k) in
  let con_26'11 = Nil0 in
  readloop con_26'11 k in
let lit_28'20 = "LOAD\n" in
let k [put_chars,put_string,newline,read_line] _ =
  let mainloop = fix (fun [put_chars,put_string,newline,read_line] mainloop _ k ->
    let lit_31'13 = "> " in
    let k [put_chars,newline,read_line,mainloop] _ =
      let con_32'23 = Unit0 in
      let k [put_chars,newline,mainloop] app_32'23 =
        let k [newline,mainloop] _ =
          let con_33'9 = Unit0 in
          let k [mainloop] _ =
            let con_34'10 = Unit0 in
            mainloop con_34'10 k in
          newline con_33'9 k in
        put_chars app_32'23 k in
      read_line con_32'23 k in
    put_string lit_31'13 k) in
  let main = fun [put_string,mainloop] _ k ->
    let lit_37'13 = "RUN\n" in
    let k [put_string,mainloop] _ =
      let con_38'20 = Unit0 in
      let k [put_string] _ =
        let lit_39'13 = "NEVER\n" in
        put_string lit_39'13 k in
      mainloop con_38'20 k in
    put_string lit_37'13 k in
  let con_0'0 = Unit0 in
  main con_0'0 k in
put_string lit_28'20 k
