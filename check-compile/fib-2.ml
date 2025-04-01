(*stage2*)
let k () = ()
let put_chars = fix (fun [] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con_13'10 = Unit0 in
    k con_13'10
  | Cons1(x,xs) ->
    let _ = PRIM_PutChar(x) in
    put_chars xs k) in
let fib = fix (fun [] fib n k ->
  let lit_24'9 = 2 in
  let prim_0'0 = PRIM_LessInt(n,lit_24'9) in
  match prim_0'0 with
  | true1 -> k n
  | false0 ->
    let lit_24'30 = 1 in
    let prim_0'0 = PRIM_SubInt(n,lit_24'30) in
    let k [n,fib] x =
      let lit_24'42 = 2 in
      let prim_0'0 = PRIM_SubInt(n,lit_24'42) in
      let k [x] y =
        let prim_0'0 = PRIM_AddInt(x,y) in
        k prim_0'0 in
      fib prim_0'0 k in
    fib prim_0'0 k) in
let _ = Unit0 in
let lit_34'21 = 20 in
let k [put_chars] res =
  let lit_28'13 = "fib " in
  let prim_0'0 = PRIM_Explode(lit_28'13) in
  let k [put_chars,res] _ =
    let lit_3'17 = '0' in
    let ord0 = PRIM_CharOrd(lit_3'17) in
    let loop = fix (fun [ord0] loop acc k ->
      let lam_5'19 = fun [ord0,acc,loop] i k ->
        let lit_6'11 = 0 in
        let prim_0'0 = PRIM_EqInt(i,lit_6'11) in
        match prim_0'0 with
        | true1 -> k acc
        | false0 ->
          let lit_7'29 = 10 in
          let c = PRIM_ModInt(i,lit_7'29) in
          let x = PRIM_AddInt(ord0,c) in
          let x = PRIM_CharChr(x) in
          let con_0'0 = Cons1[x,acc] in
          let k [i] app_7'11 =
            let lit_7'44 = 10 in
            let prim_0'0 = PRIM_DivInt(i,lit_7'44) in
            app_7'11 prim_0'0 k in
          loop con_0'0 k in
      k lam_5'19) in
    let lit_34'21 = 20 in
    let lit_9'9 = 0 in
    let prim_0'0 = PRIM_EqInt(lit_34'21,lit_9'9) in
    let k [put_chars,res] case_9'2 =
      let k [put_chars,res] _ =
        let lit_30'13 = " --> " in
        let prim_0'0 = PRIM_Explode(lit_30'13) in
        let k [put_chars,res] _ =
          let lit_3'17 = '0' in
          let ord0 = PRIM_CharOrd(lit_3'17) in
          let loop = fix (fun [ord0] loop acc k ->
            let lam_5'19 = fun [ord0,acc,loop] i k ->
              let lit_6'11 = 0 in
              let prim_0'0 = PRIM_EqInt(i,lit_6'11) in
              match prim_0'0 with
              | true1 -> k acc
              | false0 ->
                let lit_7'29 = 10 in
                let c = PRIM_ModInt(i,lit_7'29) in
                let x = PRIM_AddInt(ord0,c) in
                let x = PRIM_CharChr(x) in
                let con_0'0 = Cons1[x,acc] in
                let k [i] app_7'11 =
                  let lit_7'44 = 10 in
                  let prim_0'0 = PRIM_DivInt(i,lit_7'44) in
                  app_7'11 prim_0'0 k in
                loop con_0'0 k in
            k lam_5'19) in
          let lit_9'9 = 0 in
          let prim_0'0 = PRIM_EqInt(res,lit_9'9) in
          let k [put_chars] case_9'2 =
            let k [] _ =
              let _ = Unit0 in
              let lit_20'26 = '\n' in
              let prim_0'0 = PRIM_PutChar(lit_20'26) in
              k prim_0'0 in
            put_chars case_9'2 k in
          match prim_0'0 with
          | true1 ->
            let lit_9'17 = '0' in
            let con_9'20 = Nil0 in
            let con_9'17 = Cons1[lit_9'17,con_9'20] in
            k con_9'17
          | false0 ->
            let con_9'32 = Nil0 in
            let k [res] app_9'32 = app_9'32 res k in
            loop con_9'32 k in
        put_chars prim_0'0 k in
      put_chars case_9'2 k in
    match prim_0'0 with
    | true1 ->
      let lit_9'17 = '0' in
      let con_9'20 = Nil0 in
      let con_9'17 = Cons1[lit_9'17,con_9'20] in
      k con_9'17
    | false0 ->
      let con_9'32 = Nil0 in
      let k [] app_9'32 =
        let lit_34'21 = 20 in
        app_9'32 lit_34'21 k in
      loop con_9'32 k in
  put_chars prim_0'0 k in
fib lit_34'21 k
