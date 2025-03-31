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
  let y = 2 in
  let uLET_0'0 = PRIM_LessInt(n,y) in
  match uLET_0'0 with
  | true1 -> k n
  | false0 ->
    let y = 1 in
    let uLET_0'0 = PRIM_SubInt(n,y) in
    let k [n,fib] x =
      let uLET_0'0 = fun [x] y k ->
        let prim_0'0 = PRIM_AddInt(x,y) in
        k prim_0'0 in
      let y = 2 in
      let uLET_0'0 = PRIM_SubInt(n,y) in
      let k [uLET_0'0] app_24'39 = uLET_0'0 app_24'39 k in
      fib uLET_0'0 k in
    fib uLET_0'0 k) in
let _ = Unit0 in
let n = 20 in
let k [put_chars,n] res =
  let s = "fib " in
  let prim_0'0 = PRIM_Explode(s) in
  let k [put_chars,n,res] _ =
    let x = '0' in
    let ord0 = PRIM_CharOrd(x) in
    let loop = fix (fun [ord0] loop acc k ->
      let lam_5'19 = fun [ord0,acc,loop] i k ->
        let y = 0 in
        let uLET_0'0 = PRIM_EqInt(i,y) in
        match uLET_0'0 with
        | true1 -> k acc
        | false0 ->
          let y = 10 in
          let c = PRIM_ModInt(i,y) in
          let x = PRIM_AddInt(ord0,c) in
          let x = PRIM_CharChr(x) in
          let uLET_0'0 = fun [x] y k ->
            let con_0'0 = Cons1[x,y] in
            k con_0'0 in
          let k [loop,i] app_7'36 =
            let k [i] app_7'11 =
              let y = 10 in
              let uLET_0'0 = PRIM_DivInt(i,y) in
              app_7'11 uLET_0'0 k in
            loop app_7'36 k in
          uLET_0'0 acc k in
      k lam_5'19) in
    let y = 0 in
    let uLET_0'0 = PRIM_EqInt(n,y) in
    let k [put_chars,res] uLET_3'6 =
      let k [put_chars,res] _ =
        let s = " --> " in
        let prim_0'0 = PRIM_Explode(s) in
        let k [put_chars,res] _ =
          let x = '0' in
          let ord0 = PRIM_CharOrd(x) in
          let loop = fix (fun [ord0] loop acc k ->
            let lam_5'19 = fun [ord0,acc,loop] i k ->
              let y = 0 in
              let uLET_0'0 = PRIM_EqInt(i,y) in
              match uLET_0'0 with
              | true1 -> k acc
              | false0 ->
                let y = 10 in
                let c = PRIM_ModInt(i,y) in
                let x = PRIM_AddInt(ord0,c) in
                let x = PRIM_CharChr(x) in
                let uLET_0'0 = fun [x] y k ->
                  let con_0'0 = Cons1[x,y] in
                  k con_0'0 in
                let k [loop,i] app_7'36 =
                  let k [i] app_7'11 =
                    let y = 10 in
                    let uLET_0'0 = PRIM_DivInt(i,y) in
                    app_7'11 uLET_0'0 k in
                  loop app_7'36 k in
                uLET_0'0 acc k in
            k lam_5'19) in
          let y = 0 in
          let uLET_0'0 = PRIM_EqInt(res,y) in
          let k [put_chars] uLET_3'6 =
            let k [] _ =
              let _ = Unit0 in
              let x = '\n' in
              let prim_0'0 = PRIM_PutChar(x) in
              k prim_0'0 in
            put_chars uLET_3'6 k in
          match uLET_0'0 with
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
      put_chars uLET_3'6 k in
    match uLET_0'0 with
    | true1 ->
      let lit_9'17 = '0' in
      let con_9'20 = Nil0 in
      let con_9'17 = Cons1[lit_9'17,con_9'20] in
      k con_9'17
    | false0 ->
      let con_9'32 = Nil0 in
      let k [n] app_9'32 = app_9'32 n k in
      loop con_9'32 k in
  put_chars prim_0'0 k in
fib n k
