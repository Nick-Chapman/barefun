(*Stage2 (NbE)*)
let block = fix (fun block f -> (fun a -> (f a))) in
let length =
  fix (fun length xs ->
    match xs with
    | Nil0 -> 0
    | Cons1(_,xs) ->
      let y = (length xs) in
      PRIM_AddInt(1,y)) in
let rev_onto =
  fix (fun rev_onto acc ->
    (fun xs ->
      match xs with
      | Nil0 -> acc
      | Cons1(x,xs) -> ((rev_onto Cons1(x, acc)) xs))) in
let implode =
  (block
  (fun xs ->
    let x = (length xs) in
    let b = PRIM_MakeBytes(x) in
    let loop =
      fix (fun loop i ->
        (fun xs ->
          match xs with
          | Nil0 -> Unit0
          | Cons1(x,xs) ->
            let _ = PRIM_SetBytes(b,i,x) in
            ((loop PRIM_AddInt(i,1)) xs))) in
    let _ = ((loop 0) xs) in
    PRIM_FreezeBytes(b))) in
let explode =
  (block
  (fun s ->
    let explode_loop =
      fix (fun explode_loop acc ->
        (fun i ->
          match PRIM_LessInt(i,0) with
          | true1 -> acc
          | false0 ->
            let x = PRIM_StringIndex(s,i) in
            ((explode_loop Cons1(x, acc)) PRIM_SubInt(i,1)))) in
    let x = PRIM_StringLength(s) in
    ((explode_loop Nil0) PRIM_SubInt(x,1)))) in
let put_chars =
  fix (fun put_chars xs ->
    match xs with
    | Nil0 -> Unit0
    | Cons1(x,xs) ->
      let n = PRIM_CharOrd(x) in
      let _ =
        match PRIM_EqInt(n,8) with
        | true1 -> PRIM_PutChar(x)
        | false0 ->
          match PRIM_EqChar(x,'\n') with
          | true1 -> PRIM_PutChar(x)
          | false0 ->
            match PRIM_LessInt(26,n) with
            | true1 -> PRIM_PutChar(x)
            | false0 ->
              let _ = PRIM_PutChar('^') in
              let x = PRIM_AddInt(65,n) in
              let x = PRIM_SubInt(x,1) in
              let x = PRIM_CharChr(x) in
              PRIM_PutChar(x) in
      (put_chars xs)) in
let disk = Disk0(PRIM_MakeBytes(16384)) in
let loop =
  fix (fun loop acc ->
    (fun i ->
      match PRIM_EqInt(i,0) with
      | true1 -> acc
      | false0 ->
        let c = PRIM_ModInt(i,10) in
        let x = PRIM_AddInt(48,c) in
        let x = PRIM_CharChr(x) in
        ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
let s1 = (implode Cons1('0', Nil0)) in
let xs = (explode s1) in
let ys = (explode "   **SLOW**") in
let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
let xs = (explode "read_sector ") in
let ys = (explode s2) in
let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
let xs = (explode m) in
let ys = (explode "\n") in
let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
let xs = (explode "trace: ") in
let ys = (explode s2) in
let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
let _ = (put_chars (explode s)) in
let source =
  match disk with
  | Disk0(x) -> x in
let target = PRIM_MakeBytes(512) in
let loop =
  fix (fun loop i ->
    let b = PRIM_LessInt(i,512) in
    match match b with
    | true1 -> false0
    | false0 -> true1 with
    | true1 -> Unit0
    | false0 ->
      let y = PRIM_AddInt(0,i) in
      let char = PRIM_GetBytes(source,y) in
      let _ = PRIM_SetBytes(target,i,char) in
      (loop PRIM_AddInt(i,1))) in
let _ = (loop 0) in
let cache_line = Cache_Line0(PRIM_MakeRef(false0), 0, Sector0(target)) in
let disk = DiskC10(disk, PRIM_MakeRef(cache_line)) in
let loop =
  fix (fun loop i ->
    match PRIM_LessInt(124,i) with
    | true1 -> Unit0
    | false0 ->
      let y = PRIM_ModInt(i,10) in
      let x = PRIM_AddInt(48,y) in
      let char = PRIM_CharChr(x) in
      let loop =
        fix (fun loop acc ->
          (fun i ->
            match PRIM_EqInt(i,0) with
            | true1 -> acc
            | false0 -> ((loop Cons1(char, acc)) PRIM_SubInt(i,1)))) in
      let x = (implode ((loop Nil0) 64)) in
      let block = Block0(PRIM_ThawBytes(x)) in
      let _ =
        match match PRIM_LessInt(i,0) with
        | true1 -> true1
        | false0 ->
          let b = PRIM_LessInt(i,256) in
          match b with
          | true1 -> false0
          | false0 -> true1 with
        | true1 ->
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s2 =
            (implode
            match PRIM_EqInt(i,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) i)) in
          let xs = (explode "write_block ") in
          let ys = (explode s2) in
          let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode m) in
          let ys = (explode "\n") in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode "error: ") in
          let ys = (explode s2) in
          let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let _ = (put_chars (explode s)) in
          PRIM_Crash(Unit0)
        | false0 ->
          let seci = PRIM_DivInt(i,8) in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s1 =
            (implode
            match PRIM_EqInt(i,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) i)) in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s1 =
            (implode
            match PRIM_EqInt(seci,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) seci)) in
          let xs = (explode s1) in
          let ys = (explode "]") in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode "[") in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode s1) in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode "write_block ") in
          let ys = (explode s2) in
          let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let y = PRIM_ModInt(i,8) in
          let offset = PRIM_MulInt(64,y) in
          let new_bytes =
            match block with
            | Block0(x) -> x in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s1 =
            (implode
            match PRIM_EqInt(seci,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) seci)) in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s1 =
            (implode
            match PRIM_EqInt(offset,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) offset)) in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s2 = (implode ((loop Nil0) 64)) in
          let xs = (explode ", len=") in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode s1) in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode ", offset=") in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode s1) in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode "update_sectorC1 seci=") in
          let ys = (explode s2) in
          let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          match disk with
          | DiskC10(disk,r) ->
            let cache_line = PRIM_DeRef(r) in
            match cache_line with
            | Cache_Line0(dirty,secj,sector) ->
              match PRIM_EqInt(seci,secj) with
              | true1 ->
                let target =
                  match sector with
                  | Sector0(x) -> x in
                let loop =
                  fix (fun loop i ->
                    let b = PRIM_LessInt(i,64) in
                    match match b with
                    | true1 -> false0
                    | false0 -> true1 with
                    | true1 -> Unit0
                    | false0 ->
                      let char = PRIM_GetBytes(new_bytes,i) in
                      let y = PRIM_AddInt(offset,i) in
                      let _ = PRIM_SetBytes(target,y,char) in
                      (loop PRIM_AddInt(i,1))) in
                let _ = (loop 0) in
                PRIM_SetRef(dirty,true1)
              | false0 ->
                let _ =
                  match PRIM_DeRef(dirty) with
                  | true1 ->
                    match match PRIM_LessInt(secj,0) with
                    | true1 -> true1
                    | false0 ->
                      let b = PRIM_LessInt(secj,32) in
                      match b with
                      | true1 -> false0
                      | false0 -> true1 with
                    | true1 ->
                      let loop =
                        fix (fun loop acc ->
                          (fun i ->
                            match PRIM_EqInt(i,0) with
                            | true1 -> acc
                            | false0 ->
                              let c = PRIM_ModInt(i,10) in
                              let x = PRIM_AddInt(48,c) in
                              let x = PRIM_CharChr(x) in
                              ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                      let s2 =
                        (implode
                        match PRIM_EqInt(secj,0) with
                        | true1 -> Cons1('0', Nil0)
                        | false0 -> ((loop Nil0) secj)) in
                      let xs = (explode "write_sector ") in
                      let ys = (explode s2) in
                      let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode m) in
                      let ys = (explode "\n") in
                      let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode "error: ") in
                      let ys = (explode s2) in
                      let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let _ = (put_chars (explode s)) in
                      PRIM_Crash(Unit0)
                    | false0 ->
                      let loop =
                        fix (fun loop acc ->
                          (fun i ->
                            match PRIM_EqInt(i,0) with
                            | true1 -> acc
                            | false0 ->
                              let c = PRIM_ModInt(i,10) in
                              let x = PRIM_AddInt(48,c) in
                              let x = PRIM_CharChr(x) in
                              ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                      let s1 =
                        (implode
                        match PRIM_EqInt(secj,0) with
                        | true1 -> Cons1('0', Nil0)
                        | false0 -> ((loop Nil0) secj)) in
                      let xs = (explode s1) in
                      let ys = (explode "   **SLOW**") in
                      let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode "write_sector ") in
                      let ys = (explode s2) in
                      let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode m) in
                      let ys = (explode "\n") in
                      let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode "trace: ") in
                      let ys = (explode s2) in
                      let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let _ = (put_chars (explode s)) in
                      let target =
                        match disk with
                        | Disk0(x) -> x in
                      let offset = PRIM_MulInt(secj,512) in
                      let source =
                        match sector with
                        | Sector0(x) -> x in
                      let loop =
                        fix (fun loop i ->
                          let b = PRIM_LessInt(i,512) in
                          match match b with
                          | true1 -> false0
                          | false0 -> true1 with
                          | true1 -> Unit0
                          | false0 ->
                            let char = PRIM_GetBytes(source,i) in
                            let y = PRIM_AddInt(offset,i) in
                            let _ = PRIM_SetBytes(target,y,char) in
                            (loop PRIM_AddInt(i,1))) in
                      (loop 0)
                  | false0 -> Unit0 in
                let sector =
                  match match PRIM_LessInt(seci,0) with
                  | true1 -> true1
                  | false0 ->
                    let b = PRIM_LessInt(seci,32) in
                    match b with
                    | true1 -> false0
                    | false0 -> true1 with
                  | true1 ->
                    let loop =
                      fix (fun loop acc ->
                        (fun i ->
                          match PRIM_EqInt(i,0) with
                          | true1 -> acc
                          | false0 ->
                            let c = PRIM_ModInt(i,10) in
                            let x = PRIM_AddInt(48,c) in
                            let x = PRIM_CharChr(x) in
                            ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                    let s2 =
                      (implode
                      match PRIM_EqInt(seci,0) with
                      | true1 -> Cons1('0', Nil0)
                      | false0 -> ((loop Nil0) seci)) in
                    let xs = (explode "read_sector ") in
                    let ys = (explode s2) in
                    let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let xs = (explode m) in
                    let ys = (explode "\n") in
                    let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let xs = (explode "error: ") in
                    let ys = (explode s2) in
                    let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let _ = (put_chars (explode s)) in
                    PRIM_Crash(Unit0)
                  | false0 ->
                    let loop =
                      fix (fun loop acc ->
                        (fun i ->
                          match PRIM_EqInt(i,0) with
                          | true1 -> acc
                          | false0 ->
                            let c = PRIM_ModInt(i,10) in
                            let x = PRIM_AddInt(48,c) in
                            let x = PRIM_CharChr(x) in
                            ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                    let s1 =
                      (implode
                      match PRIM_EqInt(seci,0) with
                      | true1 -> Cons1('0', Nil0)
                      | false0 -> ((loop Nil0) seci)) in
                    let xs = (explode s1) in
                    let ys = (explode "   **SLOW**") in
                    let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let xs = (explode "read_sector ") in
                    let ys = (explode s2) in
                    let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let xs = (explode m) in
                    let ys = (explode "\n") in
                    let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let xs = (explode "trace: ") in
                    let ys = (explode s2) in
                    let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let _ = (put_chars (explode s)) in
                    let source =
                      match disk with
                      | Disk0(x) -> x in
                    let offset = PRIM_MulInt(seci,512) in
                    let target = PRIM_MakeBytes(512) in
                    let loop =
                      fix (fun loop i ->
                        let b = PRIM_LessInt(i,512) in
                        match match b with
                        | true1 -> false0
                        | false0 -> true1 with
                        | true1 -> Unit0
                        | false0 ->
                          let y = PRIM_AddInt(offset,i) in
                          let char = PRIM_GetBytes(source,y) in
                          let _ = PRIM_SetBytes(target,i,char) in
                          (loop PRIM_AddInt(i,1))) in
                    let _ = (loop 0) in
                    Sector0(target) in
                let target =
                  match sector with
                  | Sector0(x) -> x in
                let loop =
                  fix (fun loop i ->
                    let b = PRIM_LessInt(i,64) in
                    match match b with
                    | true1 -> false0
                    | false0 -> true1 with
                    | true1 -> Unit0
                    | false0 ->
                      let char = PRIM_GetBytes(new_bytes,i) in
                      let y = PRIM_AddInt(offset,i) in
                      let _ = PRIM_SetBytes(target,y,char) in
                      (loop PRIM_AddInt(i,1))) in
                let _ = (loop 0) in
                let cache_line = Cache_Line0(PRIM_MakeRef(true1), seci, sector) in
                PRIM_SetRef(r,cache_line) in
      (loop PRIM_AddInt(i,1))) in
let _ = (loop 101) in
let loop =
  fix (fun loop i ->
    match PRIM_LessInt(119,i) with
    | true1 -> Unit0
    | false0 ->
      let loop =
        fix (fun loop acc ->
          (fun i ->
            match PRIM_EqInt(i,0) with
            | true1 -> acc
            | false0 -> ((loop Cons1('-', acc)) PRIM_SubInt(i,1)))) in
      let x = (implode ((loop Nil0) 64)) in
      let block = Block0(PRIM_ThawBytes(x)) in
      let _ =
        match match PRIM_LessInt(i,0) with
        | true1 -> true1
        | false0 ->
          let b = PRIM_LessInt(i,256) in
          match b with
          | true1 -> false0
          | false0 -> true1 with
        | true1 ->
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s2 =
            (implode
            match PRIM_EqInt(i,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) i)) in
          let xs = (explode "write_block ") in
          let ys = (explode s2) in
          let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode m) in
          let ys = (explode "\n") in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode "error: ") in
          let ys = (explode s2) in
          let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let _ = (put_chars (explode s)) in
          PRIM_Crash(Unit0)
        | false0 ->
          let seci = PRIM_DivInt(i,8) in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s1 =
            (implode
            match PRIM_EqInt(i,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) i)) in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s1 =
            (implode
            match PRIM_EqInt(seci,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) seci)) in
          let xs = (explode s1) in
          let ys = (explode "]") in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode "[") in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode s1) in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode "write_block ") in
          let ys = (explode s2) in
          let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let y = PRIM_ModInt(i,8) in
          let offset = PRIM_MulInt(64,y) in
          let new_bytes =
            match block with
            | Block0(x) -> x in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s1 =
            (implode
            match PRIM_EqInt(seci,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) seci)) in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s1 =
            (implode
            match PRIM_EqInt(offset,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) offset)) in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s2 = (implode ((loop Nil0) 64)) in
          let xs = (explode ", len=") in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode s1) in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode ", offset=") in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode s1) in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode "update_sectorC1 seci=") in
          let ys = (explode s2) in
          let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          match disk with
          | DiskC10(disk,r) ->
            let cache_line = PRIM_DeRef(r) in
            match cache_line with
            | Cache_Line0(dirty,secj,sector) ->
              match PRIM_EqInt(seci,secj) with
              | true1 ->
                let target =
                  match sector with
                  | Sector0(x) -> x in
                let loop =
                  fix (fun loop i ->
                    let b = PRIM_LessInt(i,64) in
                    match match b with
                    | true1 -> false0
                    | false0 -> true1 with
                    | true1 -> Unit0
                    | false0 ->
                      let char = PRIM_GetBytes(new_bytes,i) in
                      let y = PRIM_AddInt(offset,i) in
                      let _ = PRIM_SetBytes(target,y,char) in
                      (loop PRIM_AddInt(i,1))) in
                let _ = (loop 0) in
                PRIM_SetRef(dirty,true1)
              | false0 ->
                let _ =
                  match PRIM_DeRef(dirty) with
                  | true1 ->
                    match match PRIM_LessInt(secj,0) with
                    | true1 -> true1
                    | false0 ->
                      let b = PRIM_LessInt(secj,32) in
                      match b with
                      | true1 -> false0
                      | false0 -> true1 with
                    | true1 ->
                      let loop =
                        fix (fun loop acc ->
                          (fun i ->
                            match PRIM_EqInt(i,0) with
                            | true1 -> acc
                            | false0 ->
                              let c = PRIM_ModInt(i,10) in
                              let x = PRIM_AddInt(48,c) in
                              let x = PRIM_CharChr(x) in
                              ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                      let s2 =
                        (implode
                        match PRIM_EqInt(secj,0) with
                        | true1 -> Cons1('0', Nil0)
                        | false0 -> ((loop Nil0) secj)) in
                      let xs = (explode "write_sector ") in
                      let ys = (explode s2) in
                      let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode m) in
                      let ys = (explode "\n") in
                      let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode "error: ") in
                      let ys = (explode s2) in
                      let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let _ = (put_chars (explode s)) in
                      PRIM_Crash(Unit0)
                    | false0 ->
                      let loop =
                        fix (fun loop acc ->
                          (fun i ->
                            match PRIM_EqInt(i,0) with
                            | true1 -> acc
                            | false0 ->
                              let c = PRIM_ModInt(i,10) in
                              let x = PRIM_AddInt(48,c) in
                              let x = PRIM_CharChr(x) in
                              ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                      let s1 =
                        (implode
                        match PRIM_EqInt(secj,0) with
                        | true1 -> Cons1('0', Nil0)
                        | false0 -> ((loop Nil0) secj)) in
                      let xs = (explode s1) in
                      let ys = (explode "   **SLOW**") in
                      let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode "write_sector ") in
                      let ys = (explode s2) in
                      let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode m) in
                      let ys = (explode "\n") in
                      let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode "trace: ") in
                      let ys = (explode s2) in
                      let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let _ = (put_chars (explode s)) in
                      let target =
                        match disk with
                        | Disk0(x) -> x in
                      let offset = PRIM_MulInt(secj,512) in
                      let source =
                        match sector with
                        | Sector0(x) -> x in
                      let loop =
                        fix (fun loop i ->
                          let b = PRIM_LessInt(i,512) in
                          match match b with
                          | true1 -> false0
                          | false0 -> true1 with
                          | true1 -> Unit0
                          | false0 ->
                            let char = PRIM_GetBytes(source,i) in
                            let y = PRIM_AddInt(offset,i) in
                            let _ = PRIM_SetBytes(target,y,char) in
                            (loop PRIM_AddInt(i,1))) in
                      (loop 0)
                  | false0 -> Unit0 in
                let sector =
                  match match PRIM_LessInt(seci,0) with
                  | true1 -> true1
                  | false0 ->
                    let b = PRIM_LessInt(seci,32) in
                    match b with
                    | true1 -> false0
                    | false0 -> true1 with
                  | true1 ->
                    let loop =
                      fix (fun loop acc ->
                        (fun i ->
                          match PRIM_EqInt(i,0) with
                          | true1 -> acc
                          | false0 ->
                            let c = PRIM_ModInt(i,10) in
                            let x = PRIM_AddInt(48,c) in
                            let x = PRIM_CharChr(x) in
                            ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                    let s2 =
                      (implode
                      match PRIM_EqInt(seci,0) with
                      | true1 -> Cons1('0', Nil0)
                      | false0 -> ((loop Nil0) seci)) in
                    let xs = (explode "read_sector ") in
                    let ys = (explode s2) in
                    let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let xs = (explode m) in
                    let ys = (explode "\n") in
                    let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let xs = (explode "error: ") in
                    let ys = (explode s2) in
                    let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let _ = (put_chars (explode s)) in
                    PRIM_Crash(Unit0)
                  | false0 ->
                    let loop =
                      fix (fun loop acc ->
                        (fun i ->
                          match PRIM_EqInt(i,0) with
                          | true1 -> acc
                          | false0 ->
                            let c = PRIM_ModInt(i,10) in
                            let x = PRIM_AddInt(48,c) in
                            let x = PRIM_CharChr(x) in
                            ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                    let s1 =
                      (implode
                      match PRIM_EqInt(seci,0) with
                      | true1 -> Cons1('0', Nil0)
                      | false0 -> ((loop Nil0) seci)) in
                    let xs = (explode s1) in
                    let ys = (explode "   **SLOW**") in
                    let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let xs = (explode "read_sector ") in
                    let ys = (explode s2) in
                    let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let xs = (explode m) in
                    let ys = (explode "\n") in
                    let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let xs = (explode "trace: ") in
                    let ys = (explode s2) in
                    let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                    let _ = (put_chars (explode s)) in
                    let source =
                      match disk with
                      | Disk0(x) -> x in
                    let offset = PRIM_MulInt(seci,512) in
                    let target = PRIM_MakeBytes(512) in
                    let loop =
                      fix (fun loop i ->
                        let b = PRIM_LessInt(i,512) in
                        match match b with
                        | true1 -> false0
                        | false0 -> true1 with
                        | true1 -> Unit0
                        | false0 ->
                          let y = PRIM_AddInt(offset,i) in
                          let char = PRIM_GetBytes(source,y) in
                          let _ = PRIM_SetBytes(target,i,char) in
                          (loop PRIM_AddInt(i,1))) in
                    let _ = (loop 0) in
                    Sector0(target) in
                let target =
                  match sector with
                  | Sector0(x) -> x in
                let loop =
                  fix (fun loop i ->
                    let b = PRIM_LessInt(i,64) in
                    match match b with
                    | true1 -> false0
                    | false0 -> true1 with
                    | true1 -> Unit0
                    | false0 ->
                      let char = PRIM_GetBytes(new_bytes,i) in
                      let y = PRIM_AddInt(offset,i) in
                      let _ = PRIM_SetBytes(target,y,char) in
                      (loop PRIM_AddInt(i,1))) in
                let _ = (loop 0) in
                let cache_line = Cache_Line0(PRIM_MakeRef(true1), seci, sector) in
                PRIM_SetRef(r,cache_line) in
      (loop PRIM_AddInt(i,1))) in
let _ = (loop 114) in
let loop =
  fix (fun loop i ->
    match PRIM_LessInt(125,i) with
    | true1 -> Unit0
    | false0 ->
      let thing =
        match match PRIM_LessInt(i,0) with
        | true1 -> true1
        | false0 ->
          let b = PRIM_LessInt(i,256) in
          match b with
          | true1 -> false0
          | false0 -> true1 with
        | true1 ->
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s2 =
            (implode
            match PRIM_EqInt(i,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) i)) in
          let xs = (explode "read_block ") in
          let ys = (explode s2) in
          let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode m) in
          let ys = (explode "\n") in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode "error: ") in
          let ys = (explode s2) in
          let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let _ = (put_chars (explode s)) in
          PRIM_Crash(Unit0)
        | false0 ->
          let seci = PRIM_DivInt(i,8) in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s1 =
            (implode
            match PRIM_EqInt(i,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) i)) in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s1 =
            (implode
            match PRIM_EqInt(seci,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) seci)) in
          let xs = (explode s1) in
          let ys = (explode "]") in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode "[") in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode s1) in
          let ys = (explode s2) in
          let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let xs = (explode "read_block ") in
          let ys = (explode s2) in
          let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let seci = PRIM_DivInt(i,8) in
          let loop =
            fix (fun loop acc ->
              (fun i ->
                match PRIM_EqInt(i,0) with
                | true1 -> acc
                | false0 ->
                  let c = PRIM_ModInt(i,10) in
                  let x = PRIM_AddInt(48,c) in
                  let x = PRIM_CharChr(x) in
                  ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
          let s2 =
            (implode
            match PRIM_EqInt(seci,0) with
            | true1 -> Cons1('0', Nil0)
            | false0 -> ((loop Nil0) seci)) in
          let xs = (explode "read_sectorC1 seci=") in
          let ys = (explode s2) in
          let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
          let sector =
            match disk with
            | DiskC10(disk,r) ->
              let cache_line = PRIM_DeRef(r) in
              match cache_line with
              | Cache_Line0(dirty,secj,sector) ->
                match PRIM_EqInt(seci,secj) with
                | true1 -> sector
                | false0 ->
                  let _ =
                    match PRIM_DeRef(dirty) with
                    | true1 ->
                      match match PRIM_LessInt(secj,0) with
                      | true1 -> true1
                      | false0 ->
                        let b = PRIM_LessInt(secj,32) in
                        match b with
                        | true1 -> false0
                        | false0 -> true1 with
                      | true1 ->
                        let loop =
                          fix (fun loop acc ->
                            (fun i ->
                              match PRIM_EqInt(i,0) with
                              | true1 -> acc
                              | false0 ->
                                let c = PRIM_ModInt(i,10) in
                                let x = PRIM_AddInt(48,c) in
                                let x = PRIM_CharChr(x) in
                                ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                        let s2 =
                          (implode
                          match PRIM_EqInt(secj,0) with
                          | true1 -> Cons1('0', Nil0)
                          | false0 -> ((loop Nil0) secj)) in
                        let xs = (explode "write_sector ") in
                        let ys = (explode s2) in
                        let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                        let xs = (explode m) in
                        let ys = (explode "\n") in
                        let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                        let xs = (explode "error: ") in
                        let ys = (explode s2) in
                        let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                        let _ = (put_chars (explode s)) in
                        PRIM_Crash(Unit0)
                      | false0 ->
                        let loop =
                          fix (fun loop acc ->
                            (fun i ->
                              match PRIM_EqInt(i,0) with
                              | true1 -> acc
                              | false0 ->
                                let c = PRIM_ModInt(i,10) in
                                let x = PRIM_AddInt(48,c) in
                                let x = PRIM_CharChr(x) in
                                ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                        let s1 =
                          (implode
                          match PRIM_EqInt(secj,0) with
                          | true1 -> Cons1('0', Nil0)
                          | false0 -> ((loop Nil0) secj)) in
                        let xs = (explode s1) in
                        let ys = (explode "   **SLOW**") in
                        let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                        let xs = (explode "write_sector ") in
                        let ys = (explode s2) in
                        let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                        let xs = (explode m) in
                        let ys = (explode "\n") in
                        let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                        let xs = (explode "trace: ") in
                        let ys = (explode s2) in
                        let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                        let _ = (put_chars (explode s)) in
                        let target =
                          match disk with
                          | Disk0(x) -> x in
                        let offset = PRIM_MulInt(secj,512) in
                        let source =
                          match sector with
                          | Sector0(x) -> x in
                        let loop =
                          fix (fun loop i ->
                            let b = PRIM_LessInt(i,512) in
                            match match b with
                            | true1 -> false0
                            | false0 -> true1 with
                            | true1 -> Unit0
                            | false0 ->
                              let char = PRIM_GetBytes(source,i) in
                              let y = PRIM_AddInt(offset,i) in
                              let _ = PRIM_SetBytes(target,y,char) in
                              (loop PRIM_AddInt(i,1))) in
                        (loop 0)
                    | false0 -> Unit0 in
                  let sector =
                    match match PRIM_LessInt(seci,0) with
                    | true1 -> true1
                    | false0 ->
                      let b = PRIM_LessInt(seci,32) in
                      match b with
                      | true1 -> false0
                      | false0 -> true1 with
                    | true1 ->
                      let loop =
                        fix (fun loop acc ->
                          (fun i ->
                            match PRIM_EqInt(i,0) with
                            | true1 -> acc
                            | false0 ->
                              let c = PRIM_ModInt(i,10) in
                              let x = PRIM_AddInt(48,c) in
                              let x = PRIM_CharChr(x) in
                              ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                      let s2 =
                        (implode
                        match PRIM_EqInt(seci,0) with
                        | true1 -> Cons1('0', Nil0)
                        | false0 -> ((loop Nil0) seci)) in
                      let xs = (explode "read_sector ") in
                      let ys = (explode s2) in
                      let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode m) in
                      let ys = (explode "\n") in
                      let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode "error: ") in
                      let ys = (explode s2) in
                      let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let _ = (put_chars (explode s)) in
                      PRIM_Crash(Unit0)
                    | false0 ->
                      let loop =
                        fix (fun loop acc ->
                          (fun i ->
                            match PRIM_EqInt(i,0) with
                            | true1 -> acc
                            | false0 ->
                              let c = PRIM_ModInt(i,10) in
                              let x = PRIM_AddInt(48,c) in
                              let x = PRIM_CharChr(x) in
                              ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
                      let s1 =
                        (implode
                        match PRIM_EqInt(seci,0) with
                        | true1 -> Cons1('0', Nil0)
                        | false0 -> ((loop Nil0) seci)) in
                      let xs = (explode s1) in
                      let ys = (explode "   **SLOW**") in
                      let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode "read_sector ") in
                      let ys = (explode s2) in
                      let m = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode m) in
                      let ys = (explode "\n") in
                      let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let xs = (explode "trace: ") in
                      let ys = (explode s2) in
                      let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
                      let _ = (put_chars (explode s)) in
                      let source =
                        match disk with
                        | Disk0(x) -> x in
                      let offset = PRIM_MulInt(seci,512) in
                      let target = PRIM_MakeBytes(512) in
                      let loop =
                        fix (fun loop i ->
                          let b = PRIM_LessInt(i,512) in
                          match match b with
                          | true1 -> false0
                          | false0 -> true1 with
                          | true1 -> Unit0
                          | false0 ->
                            let y = PRIM_AddInt(offset,i) in
                            let char = PRIM_GetBytes(source,y) in
                            let _ = PRIM_SetBytes(target,i,char) in
                            (loop PRIM_AddInt(i,1))) in
                      let _ = (loop 0) in
                      Sector0(target) in
                  let cache_line = Cache_Line0(PRIM_MakeRef(false0), seci, sector) in
                  let _ = PRIM_SetRef(r,cache_line) in
                  sector in
          let y = PRIM_ModInt(i,8) in
          let offset = PRIM_MulInt(64,y) in
          let source =
            match sector with
            | Sector0(x) -> x in
          let target = PRIM_MakeBytes(64) in
          let loop =
            fix (fun loop i ->
              let b = PRIM_LessInt(i,64) in
              match match b with
              | true1 -> false0
              | false0 -> true1 with
              | true1 -> Unit0
              | false0 ->
                let y = PRIM_AddInt(offset,i) in
                let char = PRIM_GetBytes(source,y) in
                let _ = PRIM_SetBytes(target,i,char) in
                (loop PRIM_AddInt(i,1))) in
          let _ = (loop 0) in
          Block0(target) in
      let x =
        match thing with
        | Block0(x) -> x in
      let block_string = PRIM_FreezeBytes(x) in
      let loop =
        fix (fun loop acc ->
          (fun i ->
            match PRIM_EqInt(i,0) with
            | true1 -> acc
            | false0 ->
              let c = PRIM_ModInt(i,10) in
              let x = PRIM_AddInt(48,c) in
              let x = PRIM_CharChr(x) in
              ((loop Cons1(x, acc)) PRIM_DivInt(i,10)))) in
      let s1 =
        (implode
        match PRIM_EqInt(i,0) with
        | true1 -> Cons1('0', Nil0)
        | false0 -> ((loop Nil0) i)) in
      let xs = (explode " : ") in
      let ys = (explode block_string) in
      let s2 = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
      let xs = (explode s1) in
      let ys = (explode s2) in
      let s = (implode ((rev_onto ys) ((rev_onto Nil0) xs))) in
      let _ = (put_chars (explode s)) in
      let _ = PRIM_PutChar('\n') in
      (loop PRIM_AddInt(i,1))) in
let _ = (loop 100) in
Unit0
