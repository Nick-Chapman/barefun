[transform2]
----------
let k () = ()
let + =
  (fun[] x k ->
    let v2 =
      (fun[x] y k ->
        let v1 = PRIM_AddInt[x,y] in
        k v1) in
    k v2) in
let - =
  (fun[] x k ->
    let v4 =
      (fun[x] y k ->
        let v3 = PRIM_SubInt[x,y] in
        k v3) in
    k v4) in
let ( * ) =
  (fun[] x k ->
    let v6 =
      (fun[x] y k ->
        let v5 = PRIM_MulInt[x,y] in
        k v5) in
    k v6) in
let / =
  (fun[] x k ->
    let v8 =
      (fun[x] y k ->
        let v7 = PRIM_DivInt[x,y] in
        k v7) in
    k v8) in
let % =
  (fun[] x k ->
    let v10 =
      (fun[x] y k ->
        let v9 = PRIM_ModInt[x,y] in
        k v9) in
    k v10) in
let < =
  (fun[] x k ->
    let v12 =
      (fun[x] y k ->
        let v11 = PRIM_LessInt[x,y] in
        k v11) in
    k v12) in
let = =
  (fun[] x k ->
    let v14 =
      (fun[x] y k ->
        let v13 = PRIM_EqInt[x,y] in
        k v13) in
    k v14) in
let eq_char =
  (fun[] x k ->
    let v16 =
      (fun[x] y k ->
        let v15 = PRIM_EqChar[x,y] in
        k v15) in
    k v16) in
let ord =
  (fun[] x k ->
    let v17 = PRIM_CharOrd[x] in
    k v17) in
let chr =
  (fun[] x k ->
    let v18 = PRIM_CharChr[x] in
    k v18) in
let explode =
  (fun[] x k ->
    let v19 = PRIM_Explode[x] in
    k v19) in
let put_char =
  (fun[] x k ->
    let v20 = PRIM_PutChar[x] in
    k v20) in
let get_char =
  (fun[] x k ->
    let v21 = PRIM_GetChar[x] in
    k v21) in
let :: =
  (fun[] x k ->
    let v23 =
      (fun[x] y k ->
        let v22 = Tag_1[x,y] in
        k v22) in
    k v23) in
let not =
  (fun[] b k ->
    match b with
    | Tag_1 ->
      let v24 = Tag_0 in
      k v24
    | Tag_0 ->
      let v25 = Tag_1 in
      k v25) in
let > =
  (fun[<] a k ->
    let v27 =
      (fun[<,a] b k ->
        let k [a] u26 = u26 a k in
        < b k) in
    k v27) in
let <= =
  (fun[<,not] a k ->
    let v30 =
      (fun[<,a,not] b k ->
        let k [not] u28 = not u28 k in
        let k [a] u29 = u29 a k in
        < b k) in
    k v30) in
let >= =
  (fun[<,not] a k ->
    let v33 =
      (fun[<,a,not] b k ->
        let k [not] u31 = not u31 k in
        let k [b] u32 = u32 b k in
        < a k) in
    k v33) in
let parse_digit =
  (fun[-,<=,>=,ord] c k ->
    let k [<=,>=] n =
      let k [<=,n] u38 =
        match u38 with
        | Tag_1 ->
          let k [n] u41 =
            match u41 with
            | Tag_1 ->
              let v44 = Tag_0[n] in
              k v44
            | Tag_0 ->
              let v45 = Tag_1 in
              k v45 in
          let k [] u42 =
            let u43 = 9 in
            u42 u43 k in
          <= n k
        | Tag_0 ->
          let v46 = Tag_1 in
          k v46 in
      let k [] u39 =
        let u40 = 0 in
        u39 u40 k in
      >= n k in
    let k [ord] u34 =
      let k [u34] u36 = u34 u36 k in
      let u37 = '0' in
      ord u37 k in
    let k [-] u35 = - u35 k in
    ord c k) in
let k [%,( * ),+,-,/,::,<,<=,=,>,>=,chr,eq_char,explode,get_char,ord,put_char] parse_num =
  let cons =
    (fun[::] x k ->
      let v59 =
        (fun[::,x] xs k ->
          let k [xs] u58 = u58 xs k in
          :: x k) in
      k v59) in
  let eq_list =
    fix (fun[] eq_list eq k ->
      let v69 =
        (fun[eq,eq_list] xs k ->
          let v68 =
            (fun[eq,eq_list,xs] ys k ->
              match xs with
              | Tag_0 ->
                match ys with
                | Tag_0 ->
                  let v60 = Tag_1 in
                  k v60
                | Tag_1(_,_) ->
                  let v61 = Tag_0 in
                  k v61
              | Tag_1(x,xs) ->
                match ys with
                | Tag_0 ->
                  let v62 = Tag_0 in
                  k v62
                | Tag_1(y,ys) ->
                  let k [eq,eq_list,xs,ys] u63 =
                    match u63 with
                    | Tag_1 ->
                      let k [ys] u65 = u65 ys k in
                      let k [xs] u66 = u66 xs k in
                      eq_list eq k
                    | Tag_0 ->
                      let v67 = Tag_0 in
                      k v67 in
                  let k [y] u64 = u64 y k in
                  eq x k) in
          k v68) in
      k v69) in
  let k [%,( * ),+,-,/,::,<,<=,=,>,>=,chr,cons,eq_char,explode,get_char,ord,parse_num,put_char] eq_char_list =
    let append =
      fix (fun[cons] append xs k ->
        let v73 =
          (fun[append,cons,xs] ys k ->
            match xs with
            | Tag_0 -> k ys
            | Tag_1(x,xs) ->
              let k [append,xs,ys] u70 =
                let k [u70] u71 = u70 u71 k in
                let k [ys] u72 = u72 ys k in
                append xs k in
              cons x k) in
        k v73) in
    let reverse =
      (fun[cons] xs k ->
        let loop =
          fix (fun[cons] loop acc k ->
            let v77 =
              (fun[acc,cons,loop] xs k ->
                match xs with
                | Tag_0 -> k acc
                | Tag_1(x,xs) ->
                  let k [xs] u74 = u74 xs k in
                  let k [loop] u75 = loop u75 k in
                  let k [acc] u76 = u76 acc k in
                  cons x k) in
            k v77) in
        let k [xs] u78 = u78 xs k in
        let u79 = Tag_0 in
        loop u79 k) in
    let map =
      fix (fun[::] map f k ->
        let v85 =
          (fun[::,f,map] xs k ->
            match xs with
            | Tag_0 ->
              let v80 = Tag_0 in
              k v80
            | Tag_1(x,xs) ->
              let k [f,map,xs] u81 =
                let k [u81] u83 = u81 u83 k in
                let k [xs] u84 = u84 xs k in
                map f k in
              let k [::] u82 = :: u82 k in
              f x k) in
        k v85) in
    let length =
      fix (fun[+] length xs k ->
        match xs with
        | Tag_0 ->
          let v86 = 0 in
          k v86
        | Tag_1(_,xs) ->
          let k [length,xs] u87 =
            let k [u87] u89 = u87 u89 k in
            length xs k in
          let u88 = 1 in
          + u88 k) in
    let k [( * ),+,-,::,<,<=,=,>,>=,append,chr,cons,eq_char,eq_char_list,explode,get_char,length,map,ord,parse_num,put_char,reverse] chars_of_int =
      let put_chars =
        fix (fun[put_char] put_chars xs k ->
          match xs with
          | Tag_0 ->
            let v116 = Tag_0 in
            k v116
          | Tag_1(x,xs) ->
            let k [put_chars,xs] _ = put_chars xs k in
            put_char x k) in
      let put_string =
        (fun[explode,put_chars] s k ->
          let k [put_chars] u117 = put_chars u117 k in
          explode s k) in
      let put_int =
        (fun[chars_of_int,put_chars] i k ->
          let k [put_chars] u118 = put_chars u118 k in
          chars_of_int i k) in
      let newline =
        (fun[put_char] _ k ->
          let u119 = '\n' in
          put_char u119 k) in
      let put_string_newline =
        (fun[newline,put_string] s k ->
          let k [newline] _ =
            let u120 = Tag_0 in
            newline u120 k in
          put_string s k) in
      let k [( * ),+,-,::,<,>=,append,eq_char,eq_char_list,explode,length,map,newline,parse_num,put_char,put_chars,put_int,put_string,put_string_newline,reverse] read_line =
        let fib =
          fix (fun[+,-,<] fib n k ->
            let k [+,-,fib,n] u144 =
              match u144 with
              | Tag_1 -> k n
              | Tag_0 ->
                let k [-,fib,n] u147 =
                  let k [u147] u152 = u147 u152 k in
                  let k [fib] u153 = fib u153 k in
                  let k [] u154 =
                    let u155 = 2 in
                    u154 u155 k in
                  - n k in
                let k [+] u148 = + u148 k in
                let k [fib] u149 = fib u149 k in
                let k [] u150 =
                  let u151 = 1 in
                  u150 u151 k in
                - n k in
            let k [] u145 =
              let u146 = 2 in
              u145 u146 k in
            < n k) in
        let fact =
          fix (fun[( * ),-,>=] fact n k ->
            let k [( * ),-,fact,n] u156 =
              match u156 with
              | Tag_1 ->
                let k [n] u159 = u159 n k in
                let k [( * )] u160 = ( * ) u160 k in
                let k [fact] u161 = fact u161 k in
                let k [] u162 =
                  let u163 = 1 in
                  u162 u163 k in
                - n k
              | Tag_0 ->
                let v164 = 1 in
                k v164 in
            let k [] u157 =
              let u158 = 2 in
              u157 u158 k in
            >= n k) in
        let error =
          (fun[newline,put_string] s k ->
            let k [newline,put_string,s] _ =
              let k [newline] _ =
                let u166 = Tag_0 in
                newline u166 k in
              put_string s k in
            let u165 = "ERROR: " in
            put_string u165 k) in
        let runfib =
          (fun[error,fib,newline,parse_num,put_int,put_string] args k ->
            let k [args,error,fib,newline,parse_num,put_int,put_string] _ =
              match args with
              | Tag_0 ->
                let u168 = "expected an argument" in
                error u168 k
              | Tag_1(arg1,more) ->
                match more with
                | Tag_1(_,_) ->
                  let u169 = "expected exactly one argument" in
                  error u169 k
                | Tag_0 ->
                  let k [error,fib,newline,put_int,put_string] u170 =
                    match u170 with
                    | Tag_1 ->
                      let u171 = "expected arg1 to be numeric" in
                      error u171 k
                    | Tag_0(n) ->
                      let k [n,newline,put_int,put_string] res =
                        let k [newline,put_int,put_string,res] _ =
                          let k [newline,put_int,res] _ =
                            let k [newline] _ =
                              let u173 = Tag_0 in
                              newline u173 k in
                            put_int res k in
                          let u172 = " --> " in
                          put_string u172 k in
                        put_int n k in
                      fib n k in
                  parse_num arg1 k in
            let u167 = "fib: " in
            put_string u167 k) in
        let runfact =
          (fun[error,fact,newline,parse_num,put_int,put_string] args k ->
            let k [args,error,fact,newline,parse_num,put_int,put_string] _ =
              match args with
              | Tag_0 ->
                let u175 = "expected an argument" in
                error u175 k
              | Tag_1(arg1,more) ->
                match more with
                | Tag_1(_,_) ->
                  let u176 = "expected exactly one argument" in
                  error u176 k
                | Tag_0 ->
                  let k [error,fact,newline,put_int,put_string] u177 =
                    match u177 with
                    | Tag_1 ->
                      let u178 = "expected arg1 to be numeric" in
                      error u178 k
                    | Tag_0(n) ->
                      let k [n,newline,put_int,put_string] res =
                        let k [newline,put_int,put_string,res] _ =
                          let k [newline,put_int,res] _ =
                            let k [newline] _ =
                              let u180 = Tag_0 in
                              newline u180 k in
                            put_int res k in
                          let u179 = " --> " in
                          put_string u179 k in
                        put_int n k in
                      fact n k in
                  parse_num arg1 k in
            let u174 = "fact: " in
            put_string u174 k) in
        let fallback =
          (fun[+,append,eq_char,explode,length,map,newline,put_char,put_chars,put_int] line k ->
            let k [+,append,explode,length,line,newline,put_char,put_chars,put_int] star_the_ohs =
              let k [append,explode,line,newline,put_char,put_chars,put_int,star_the_ohs] n =
                let k [n,newline,put_char,put_int] _ =
                  let k [n,newline,put_char,put_int] _ =
                    let k [n,newline,put_char,put_int] _ =
                      let k [newline,put_char] _ =
                        let k [newline] _ =
                          let u197 = Tag_0 in
                          newline u197 k in
                        let u196 = '}' in
                        put_char u196 k in
                      put_int n k in
                    let u195 = '{' in
                    put_char u195 k in
                  let u194 = ' ' in
                  put_char u194 k in
                let k [put_chars] u189 = put_chars u189 k in
                let k [line,star_the_ohs] u190 =
                  let k [u190] u193 = u190 u193 k in
                  star_the_ohs line k in
                let k [append] u191 = append u191 k in
                let u192 = "You wrote: " in
                explode u192 k in
              let k [length,line] u186 =
                let k [u186] u188 = u186 u188 k in
                length line k in
              let u187 = 100 in
              + u187 k in
            let u181 =
              (fun[eq_char] c k ->
                let k [c] u182 =
                  match u182 with
                  | Tag_1 ->
                    let v185 = '*' in
                    k v185
                  | Tag_0 -> k c in
                let k [] u183 =
                  let u184 = 'o' in
                  u183 u184 k in
                eq_char c k) in
            map u181 k) in
        let k [eq_char_list,explode,fallback,put_char,put_string_newline,read_line,runfact,runfib] split_words =
          let execute =
            (fun[eq_char_list,explode,fallback,runfact,runfib,split_words] line k ->
              let k [eq_char_list,explode,fallback,line,runfact,runfib] words =
                match words with
                | Tag_0 ->
                  let v219 = Tag_0 in
                  k v219
                | Tag_1(command,args) ->
                  let k [args,command,eq_char_list,explode,fallback,line,runfact,runfib] u220 =
                    match u220 with
                    | Tag_1 -> runfib args k
                    | Tag_0 ->
                      let k [args,fallback,line,runfact] u224 =
                        match u224 with
                        | Tag_1 -> runfact args k
                        | Tag_0 -> fallback line k in
                      let k [explode] u225 =
                        let k [u225] u226 = u225 u226 k in
                        let u227 = "fact" in
                        explode u227 k in
                      eq_char_list command k in
                  let k [explode] u221 =
                    let k [u221] u222 = u221 u222 k in
                    let u223 = "fib" in
                    explode u223 k in
                  eq_char_list command k in
              split_words line k) in
          let mainloop =
            fix (fun[execute,put_char,read_line] mainloop _ k ->
              let k [execute,mainloop,put_char,read_line] _ =
                let k [execute,mainloop,read_line] _ =
                  let k [execute,mainloop] xs =
                    let k [mainloop] _ =
                      let u231 = Tag_0 in
                      mainloop u231 k in
                    execute xs k in
                  let u230 = Tag_0 in
                  read_line u230 k in
                let u229 = ' ' in
                put_char u229 k in
              let u228 = '>' in
              put_char u228 k) in
          let k [mainloop,put_string_newline] _ =
            let main =
              (fun[mainloop,put_string_newline] _ k ->
                let k [mainloop,put_string_newline] _ =
                  let k [put_string_newline] _ =
                    let u235 = "NEVER" in
                    put_string_newline u235 k in
                  let u234 = Tag_0 in
                  mainloop u234 k in
                let u233 = "RUN" in
                put_string_newline u233 k) in
            let u236 = Tag_0 in
            main u236 k in
          let u232 = "LOAD" in
          put_string_newline u232 k in
        let loop =
          fix (fun[::,eq_char,reverse] loop accWs k ->
            let v215 =
              (fun[::,accWs,eq_char,loop,reverse] accCs k ->
                let v214 =
                  (fun[::,accCs,accWs,eq_char,loop,reverse] xs k ->
                    match xs with
                    | Tag_0 ->
                      let k [reverse] u198 = reverse u198 k in
                      let k [accWs] u199 = u199 accWs k in
                      let k [::] u200 = :: u200 k in
                      reverse accCs k
                    | Tag_1(x,xs) ->
                      let k [::,accCs,accWs,loop,reverse,x,xs] u201 =
                        match u201 with
                        | Tag_1 ->
                          let k [xs] u204 = u204 xs k in
                          let k [] u205 =
                            let u209 = Tag_0 in
                            u205 u209 k in
                          let k [loop] u206 = loop u206 k in
                          let k [accWs] u207 = u207 accWs k in
                          let k [::] u208 = :: u208 k in
                          reverse accCs k
                        | Tag_0 ->
                          let k [xs] u210 = u210 xs k in
                          let k [::,accCs,x] u211 =
                            let k [u211] u212 = u211 u212 k in
                            let k [accCs] u213 = u213 accCs k in
                            :: x k in
                          loop accWs k in
                      let k [] u202 =
                        let u203 = ' ' in
                        u202 u203 k in
                      eq_char x k) in
                k v214) in
            k v215) in
        let k [] u216 =
          let u218 = Tag_0 in
          u216 u218 k in
        let u217 = Tag_0 in
        loop u217 k in
      let loop =
        fix (fun[<=,=,>,chr,cons,eq_char,get_char,newline,ord,put_char,reverse] loop acc k ->
          let k [<=,=,>,acc,chr,cons,eq_char,loop,newline,ord,put_char,reverse] c =
            let k [<=,=,>,acc,c,chr,cons,eq_char,loop,newline,put_char,reverse] n =
              let k [<=,=,>,acc,c,chr,cons,loop,n,newline,put_char,reverse] u122 =
                match u122 with
                | Tag_1 ->
                  let k [acc,reverse] _ = reverse acc k in
                  let u125 = Tag_0 in
                  newline u125 k
                | Tag_0 ->
                  let k [=,>,acc,c,chr,cons,loop,n,put_char] u126 =
                    match u126 with
                    | Tag_1 -> loop acc k
                    | Tag_0 ->
                      let k [=,acc,c,chr,cons,loop,n,put_char] u129 =
                        match u129 with
                        | Tag_1 -> loop acc k
                        | Tag_0 ->
                          let k [acc,c,chr,cons,loop,put_char] u132 =
                            match u132 with
                            | Tag_1 ->
                              match acc with
                              | Tag_0 -> loop acc k
                              | Tag_1(_,tail) ->
                                let k [chr,loop,put_char,tail] _ =
                                  let k [chr,loop,put_char,tail] _ =
                                    let k [loop,tail] _ = loop tail k in
                                    let k [put_char] u138 = put_char u138 k in
                                    let u139 = 8 in
                                    chr u139 k in
                                  let u137 = ' ' in
                                  put_char u137 k in
                                let k [put_char] u135 = put_char u135 k in
                                let u136 = 8 in
                                chr u136 k
                            | Tag_0 ->
                              let k [acc,c,cons,loop] _ =
                                let k [loop] u140 = loop u140 k in
                                let k [acc] u141 = u141 acc k in
                                cons c k in
                              put_char c k in
                          let k [] u133 =
                            let u134 = 127 in
                            u133 u134 k in
                          = n k in
                      let k [] u130 =
                        let u131 = 127 in
                        u130 u131 k in
                      > n k in
                  let k [] u127 =
                    let u128 = 31 in
                    u127 u128 k in
                  <= n k in
              let k [] u123 =
                let u124 = '\n' in
                u123 u124 k in
              eq_char c k in
            ord c k in
          let u121 = Tag_0 in
          get_char u121 k) in
      let v143 =
        (fun[loop] _ k ->
          let u142 = Tag_0 in
          loop u142 k) in
      k v143 in
    let k [%,+,/,=,chr,cons] ord0 =
      let char_of_digit =
        (fun[+,chr,ord0] c k ->
          let k [chr] u91 = chr u91 k in
          let k [c] u92 = u92 c k in
          + ord0 k) in
      let loop =
        fix (fun[%,/,=,char_of_digit,cons] loop acc k ->
          let v106 =
            (fun[%,/,=,acc,char_of_digit,cons,loop] i k ->
              let k [%,/,acc,char_of_digit,cons,i,loop] u93 =
                match u93 with
                | Tag_1 -> k acc
                | Tag_0 ->
                  let k [/,i] u96 =
                    let k [u96] u103 = u96 u103 k in
                    let k [] u104 =
                      let u105 = 10 in
                      u104 u105 k in
                    / i k in
                  let k [loop] u97 = loop u97 k in
                  let k [acc] u98 = u98 acc k in
                  let k [cons] u99 = cons u99 k in
                  let k [char_of_digit] u100 = char_of_digit u100 k in
                  let k [] u101 =
                    let u102 = 10 in
                    u101 u102 k in
                  % i k in
              let k [] u94 =
                let u95 = 0 in
                u94 u95 k in
              = i k) in
          k v106) in
      let v115 =
        (fun[=,cons,loop] i k ->
          let k [cons,i,loop] u107 =
            match u107 with
            | Tag_1 ->
              let k [] u110 =
                let u112 = Tag_0 in
                u110 u112 k in
              let u111 = '0' in
              cons u111 k
            | Tag_0 ->
              let k [i] u113 = u113 i k in
              let u114 = Tag_0 in
              loop u114 k in
          let k [] u108 =
            let u109 = 0 in
            u108 u109 k in
          = i k) in
      k v115 in
    let u90 = '0' in
    ord u90 k in
  eq_list eq_char k in
let loop =
  fix (fun[( * ),+,parse_digit] loop acc k ->
    let v56 =
      (fun[( * ),+,acc,loop,parse_digit] xs k ->
        match xs with
        | Tag_0 ->
          let v47 = Tag_0[acc] in
          k v47
        | Tag_1(x,xs) ->
          let k [( * ),+,acc,loop,xs] u48 =
            match u48 with
            | Tag_1 ->
              let v49 = Tag_1 in
              k v49
            | Tag_0(d) ->
              let k [xs] u50 = u50 xs k in
              let k [loop] u51 = loop u51 k in
              let k [d] u52 = u52 d k in
              let k [+] u53 = + u53 k in
              let k [acc] u54 = u54 acc k in
              let u55 = 10 in
              ( * ) u55 k in
          parse_digit x k) in
    k v56) in
let u57 = 0 in
loop u57 k
----------
