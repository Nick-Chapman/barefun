(*stage2; un-normalized*)
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
let put_string_newline = fun [newline,put_string] s k ->
  let k [newline] _ =
    let con_33_21'10 = Unit0 in
    newline con_33_21'10 k in
  put_string s k in
let read_line = fun [::,eq_char,get_char,newline,put_char,reverse] _ k ->
  let readloop = fix (fun [::,eq_char,get_char,newline,put_char,reverse] readloop sofar k ->
    let k [::,eq_char,newline,put_char,readloop,reverse,sofar] theChar =
      let gotten = theChar in
      let k [::,gotten,newline,put_char,readloop,reverse,sofar] app_35_27'22 =
        match app_35_27'22 with
        | true1 ->
          let k [reverse,sofar] _ = reverse sofar k in
          let con_38_27'40 = Unit0 in
          newline con_38_27'40 k
        | false0 ->
          let k [::,gotten,readloop,sofar] _ =
            let k [readloop] app_39_28'44 = readloop app_39_28'44 k in
            let k [sofar] app_40_28'41 = app_40_28'41 sofar k in
            :: gotten k in
          put_char gotten k in
      let k [] app_36_27'15 =
        let lit_37_27'22 = '\n' in
        app_36_27'15 lit_37_27'22 k in
      eq_char gotten k in
    let con_34_25'27 = Unit0 in
    get_char con_34_25'27 k) in
  let con_41_30'11 = Nil0 in
  readloop con_41_30'11 k in
let k [newline,put_chars,put_string,put_string_newline,read_line] _ =
  let mainloop = fix (fun [newline,put_chars,put_string,read_line] mainloop _ k ->
    let k [mainloop,newline,put_chars,read_line] _ =
      let k [mainloop,newline] _ =
        let k [mainloop] _ =
          let con_47_38'10 = Unit0 in
          mainloop con_47_38'10 k in
        let con_46_37'9 = Unit0 in
        newline con_46_37'9 k in
      let k [put_chars] app_44_36'23 = put_chars app_44_36'23 k in
      let con_45_36'23 = Unit0 in
      read_line con_45_36'23 k in
    let lit_43_35'13 = "> " in
    put_string lit_43_35'13 k) in
  let main = fun [mainloop,put_string_newline] _ k ->
    let k [mainloop,put_string_newline] _ =
      let k [put_string_newline] _ =
        let lit_50_43'21 = "NEVER" in
        put_string_newline lit_50_43'21 k in
      let con_49_42'20 = Unit0 in
      mainloop con_49_42'20 k in
    let lit_48_41'21 = "RUN" in
    put_string_newline lit_48_41'21 k in
  let con_51_0'0 = Unit0 in
  main con_51_0'0 k in
let lit_42_32'28 = "LOAD" in
put_string_newline lit_42_32'28 k
