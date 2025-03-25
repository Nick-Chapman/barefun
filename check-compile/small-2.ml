(*stage2*)
let k () = ()
let + = fun [] x k ->
  let lam_2_0'0 = fun [x] y k ->
    let prim_1_0'0 = PRIM_AddInt(x,y) in
    k prim_1_0'0 in
  k lam_2_0'0 in
let - = fun [] x k ->
  let lam_4_0'0 = fun [x] y k ->
    let prim_3_0'0 = PRIM_SubInt(x,y) in
    k prim_3_0'0 in
  k lam_4_0'0 in
let ( * ) = fun [] x k ->
  let lam_6_0'0 = fun [x] y k ->
    let prim_5_0'0 = PRIM_MulInt(x,y) in
    k prim_5_0'0 in
  k lam_6_0'0 in
let / = fun [] x k ->
  let lam_8_0'0 = fun [x] y k ->
    let prim_7_0'0 = PRIM_DivInt(x,y) in
    k prim_7_0'0 in
  k lam_8_0'0 in
let % = fun [] x k ->
  let lam_10_0'0 = fun [x] y k ->
    let prim_9_0'0 = PRIM_ModInt(x,y) in
    k prim_9_0'0 in
  k lam_10_0'0 in
let < = fun [] x k ->
  let lam_12_0'0 = fun [x] y k ->
    let prim_11_0'0 = PRIM_LessInt(x,y) in
    k prim_11_0'0 in
  k lam_12_0'0 in
let = = fun [] x k ->
  let lam_14_0'0 = fun [x] y k ->
    let prim_13_0'0 = PRIM_EqInt(x,y) in
    k prim_13_0'0 in
  k lam_14_0'0 in
let eq_char = fun [] x k ->
  let lam_16_0'0 = fun [x] y k ->
    let prim_15_0'0 = PRIM_EqChar(x,y) in
    k prim_15_0'0 in
  k lam_16_0'0 in
let ord = fun [] x k ->
  let prim_17_0'0 = PRIM_CharOrd(x) in
  k prim_17_0'0 in
let chr = fun [] x k ->
  let prim_18_0'0 = PRIM_CharChr(x) in
  k prim_18_0'0 in
let explode = fun [] x k ->
  let prim_19_0'0 = PRIM_Explode(x) in
  k prim_19_0'0 in
let put_char = fun [] x k ->
  let prim_20_0'0 = PRIM_PutChar(x) in
  k prim_20_0'0 in
let get_char = fun [] x k ->
  let prim_21_0'0 = PRIM_GetChar(x) in
  k prim_21_0'0 in
let :: = fun [] x k ->
  let lam_23_0'0 = fun [x] y k ->
    let con_22_0'0 = Cons1[x,y] in
    k con_22_0'0 in
  k lam_23_0'0 in
let put_chars = fix (fun [put_char] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_24_4'10 = Unit0 in
    k con_24_4'10
  | Cons1(x,xsMore) ->
    let k [put_chars,xsMore] _ = put_chars xsMore k in
    put_char x k) in
let put_string = fun [explode,put_chars] s k ->
  let k [put_chars] app_25_7'38 = put_chars app_25_7'38 k in
  explode s k in
let reverse = fun [::] ysStart k ->
  let revloop = fix (fun [::] revloop acc k ->
    let lam_29_10'22 = fun [::,acc,revloop] ys k ->
      match ys with
      | Nil0 -> k acc
      | Cons1(y,ysMore) ->
        let k [ysMore] app_26_13'27 = app_26_13'27 ysMore k in
        let k [revloop] app_27_13'33 = revloop app_27_13'33 k in
        let k [acc] app_28_13'30 = app_28_13'30 acc k in
        :: y k in
    k lam_29_10'22) in
  let k [ysStart] app_30_15'10 = app_30_15'10 ysStart k in
  let con_31_15'10 = Nil0 in
  revloop con_31_15'10 k in
let newline = fun [put_char] _ k ->
  let lit_32_17'26 = '\n' in
  put_char lit_32_17'26 k in
let read_line = fun [::,eq_char,get_char,newline,put_char,reverse] _ k ->
  let readloop = fix (fun [::,eq_char,get_char,newline,put_char,reverse] readloop sofar k ->
    let k [::,eq_char,newline,put_char,readloop,reverse,sofar] theChar =
      let gotten = theChar in
      let k [::,gotten,newline,put_char,readloop,reverse,sofar] app_34_23'22 =
        match app_34_23'22 with
        | true1 ->
          let k [reverse,sofar] _ = reverse sofar k in
          let con_37_23'40 = Unit0 in
          newline con_37_23'40 k
        | false0 ->
          let k [::,gotten,readloop,sofar] _ =
            let k [readloop] app_38_24'44 = readloop app_38_24'44 k in
            let k [sofar] app_39_24'41 = app_39_24'41 sofar k in
            :: gotten k in
          put_char gotten k in
      let k [] app_35_23'15 =
        let lit_36_23'22 = '\n' in
        app_35_23'15 lit_36_23'22 k in
      eq_char gotten k in
    let con_33_21'27 = Unit0 in
    get_char con_33_21'27 k) in
  let con_40_26'11 = Nil0 in
  readloop con_40_26'11 k in
let main = fix (fun [newline,put_chars,put_string,read_line] main _ k ->
  let k [main,newline,put_chars,read_line] _ =
    let k [main,newline] _ =
      let k [main] _ =
        let con_45_32'6 = Unit0 in
        main con_45_32'6 k in
      let con_44_31'9 = Unit0 in
      newline con_44_31'9 k in
    let k [put_chars] app_42_30'23 = put_chars app_42_30'23 k in
    let con_43_30'23 = Unit0 in
    read_line con_43_30'23 k in
  let lit_41_29'13 = "> " in
  put_string lit_41_29'13 k) in
let con_46_0'0 = Unit0 in
main con_46_0'0 k
