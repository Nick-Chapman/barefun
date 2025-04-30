(*Stage3 (ANF)*)
let k () = ()
let put_chars = fix (fun [] put_chars xs k ->
  match xs with
  | Nil0 ->
    let con = Unit0 in
    k con
  | Cons1(x,xsMore) ->
    let _ = PRIM_PutChar(x) in
    put_chars xsMore k) in
let explode_loop = fix (fun [] explode_loop acc k ->
  let lam = fun [acc,explode_loop] i k ->
    let prim = PRIM_LessInt(i,0) in
    match prim with
    | true1 -> k acc
    | false0 ->
      let lit = "LOAD\n" in
      let x = PRIM_StringIndex(lit,i) in
      let con = Cons1[x,acc] in
      let k [i] app =
        let prim = PRIM_SubInt(i,1) in
        app prim k in
      explode_loop con k in
  k lam) in
let con = Nil0 in
let k [put_chars] app =
  let k [put_chars] app =
    let k [put_chars] _ =
      let mainloop = fix (fun [put_chars] mainloop _ k ->
        let explode_loop = fix (fun [] explode_loop acc k ->
          let lam = fun [acc,explode_loop] i k ->
            let prim = PRIM_LessInt(i,0) in
            match prim with
            | true1 -> k acc
            | false0 ->
              let lit = "> " in
              let x = PRIM_StringIndex(lit,i) in
              let con = Cons1[x,acc] in
              let k [i] app =
                let prim = PRIM_SubInt(i,1) in
                app prim k in
              explode_loop con k in
          k lam) in
        let con = Nil0 in
        let k [put_chars,mainloop] app =
          let k [put_chars,mainloop] app =
            let k [put_chars,mainloop] _ =
              let readloop = fix (fun [] readloop sofar k ->
                let con = Unit0 in
                let theChar = PRIM_GetChar(con) in
                let prim = PRIM_EqChar(theChar,'\n') in
                match prim with
                | true1 ->
                  let _ = PRIM_PutChar('\n') in
                  let revloop = fix (fun [] revloop acc k ->
                    let lam = fun [acc,revloop] ys k ->
                      match ys with
                      | Nil0 -> k acc
                      | Cons1(y,ysMore) ->
                        let con = Cons1[y,acc] in
                        let k [ysMore] app = app ysMore k in
                        revloop con k in
                    k lam) in
                  let con = Nil0 in
                  let k [sofar] app = app sofar k in
                  revloop con k
                | false0 ->
                  let _ = PRIM_PutChar(theChar) in
                  let con = Cons1[theChar,sofar] in
                  readloop con k) in
              let con = Nil0 in
              let k [put_chars,mainloop] app =
                let k [mainloop] _ =
                  let _ = PRIM_PutChar('\n') in
                  let con = Unit0 in
                  mainloop con k in
                put_chars app k in
              readloop con k in
            put_chars app k in
          app 1 k in
        explode_loop con k) in
      let explode_loop = fix (fun [] explode_loop acc k ->
        let lam = fun [acc,explode_loop] i k ->
          let prim = PRIM_LessInt(i,0) in
          match prim with
          | true1 -> k acc
          | false0 ->
            let lit = "Welcome to small: a proto readline\n" in
            let x = PRIM_StringIndex(lit,i) in
            let con = Cons1[x,acc] in
            let k [i] app =
              let prim = PRIM_SubInt(i,1) in
              app prim k in
            explode_loop con k in
        k lam) in
      let con = Nil0 in
      let k [put_chars,mainloop] app =
        let k [put_chars,mainloop] app =
          let k [put_chars,mainloop] _ =
            let con = Unit0 in
            let k [put_chars] _ =
              let explode_loop = fix (fun [] explode_loop acc k ->
                let lam = fun [acc,explode_loop] i k ->
                  let prim = PRIM_LessInt(i,0) in
                  match prim with
                  | true1 -> k acc
                  | false0 ->
                    let lit = "NEVER\n" in
                    let x = PRIM_StringIndex(lit,i) in
                    let con = Cons1[x,acc] in
                    let k [i] app =
                      let prim = PRIM_SubInt(i,1) in
                      app prim k in
                    explode_loop con k in
                k lam) in
              let con = Nil0 in
              let k [put_chars] app =
                let k [put_chars] app = put_chars app k in
                app 5 k in
              explode_loop con k in
            mainloop con k in
          put_chars app k in
        app 34 k in
      explode_loop con k in
    put_chars app k in
  app 4 k in
explode_loop con k
