(*stage2*)
let k () = ()
let + = fun[] x k ->
  let v2 = fun[x] y k ->
    let v1 = PRIM_AddInt(x,y) in
    k v1 in
  k v2 in
let - = fun[] x k ->
  let v4 = fun[x] y k ->
    let v3 = PRIM_SubInt(x,y) in
    k v3 in
  k v4 in
let ( * ) = fun[] x k ->
  let v6 = fun[x] y k ->
    let v5 = PRIM_MulInt(x,y) in
    k v5 in
  k v6 in
let / = fun[] x k ->
  let v8 = fun[x] y k ->
    let v7 = PRIM_DivInt(x,y) in
    k v7 in
  k v8 in
let % = fun[] x k ->
  let v10 = fun[x] y k ->
    let v9 = PRIM_ModInt(x,y) in
    k v9 in
  k v10 in
let < = fun[] x k ->
  let v12 = fun[x] y k ->
    let v11 = PRIM_LessInt(x,y) in
    k v11 in
  k v12 in
let = = fun[] x k ->
  let v14 = fun[x] y k ->
    let v13 = PRIM_EqInt(x,y) in
    k v13 in
  k v14 in
let eq_char = fun[] x k ->
  let v16 = fun[x] y k ->
    let v15 = PRIM_EqChar(x,y) in
    k v15 in
  k v16 in
let ord = fun[] x k ->
  let v17 = PRIM_CharOrd(x) in
  k v17 in
let chr = fun[] x k ->
  let v18 = PRIM_CharChr(x) in
  k v18 in
let explode = fun[] x k ->
  let v19 = PRIM_Explode(x) in
  k v19 in
let put_char = fun[] x k ->
  let v20 = PRIM_PutChar(x) in
  k v20 in
let get_char = fun[] x k ->
  let v21 = PRIM_GetChar(x) in
  k v21 in
let :: = fun[] x k ->
  let v23 = fun[x] y k ->
    let v22 = Cons1[x,y] in
    k v22 in
  k v23 in
let not = fun[] b k ->
  match b with
  | true1 ->
    let v24 = false0 in
    k v24
  | false0 ->
    let v25 = true1 in
    k v25 in
let > = fun[<] a k ->
  let v27 = fun[<,a] b k ->
    let k [a] u26 = u26 a k in
    < b k in
  k v27 in
let <= = fun[<,not] a k ->
  let v30 = fun[<,a,not] b k ->
    let k [not] u28 = not u28 k in
    let k [a] u29 = u29 a k in
    < b k in
  k v30 in
let >= = fun[<,not] a k ->
  let v33 = fun[<,a,not] b k ->
    let k [not] u31 = not u31 k in
    let k [b] u32 = u32 b k in
    < a k in
  k v33 in
let parse_digit = fun[-,<=,>=,ord] c k ->
  let k [<=,>=] n =
    let k [<=,n] u38 =
      match u38 with
      | true1 ->
        let k [n] u41 =
          match u41 with
          | true1 ->
            let v44 = Some0[n] in
            k v44
          | false0 ->
            let v45 = None1 in
            k v45 in
        let k [] u42 =
          let u43 = 9 in
          u42 u43 k in
        <= n k
      | false0 ->
        let v46 = None1 in
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
  ord c k in
let parse_num = fun[( * ),+,parse_digit] s k ->
  let loop = fix (fun[( * ),+,parse_digit] loop acc k ->
    let v56 = fun[( * ),+,acc,loop,parse_digit] xs k ->
      match xs with
      | Nil0 ->
        let v47 = Some0[acc] in
        k v47
      | Cons1(x,xs) ->
        let k [( * ),+,acc,loop,xs] u48 =
          match u48 with
          | None1 ->
            let v49 = None1 in
            k v49
          | Some0(d) ->
            let k [xs] u50 = u50 xs k in
            let k [loop] u51 = loop u51 k in
            let k [d] u52 = u52 d k in
            let k [+] u53 = + u53 k in
            let k [acc] u54 = u54 acc k in
            let u55 = 10 in
            ( * ) u55 k in
        parse_digit x k in
    k v56) in
  let k [s] u57 = u57 s k in
  let u58 = 0 in
  loop u58 k in
let cons = fun[::] x k ->
  let v60 = fun[::,x] xs k ->
    let k [xs] u59 = u59 xs k in
    :: x k in
  k v60 in
let eq_list = fix (fun[] eq_list eq k ->
  let v70 = fun[eq,eq_list] xs k ->
    let v69 = fun[eq,eq_list,xs] ys k ->
      match xs with
      | Nil0 ->
        match ys with
        | Nil0 ->
          let v61 = true1 in
          k v61
        | Cons1(_,_) ->
          let v62 = false0 in
          k v62
      | Cons1(x,xs) ->
        match ys with
        | Nil0 ->
          let v63 = false0 in
          k v63
        | Cons1(y,ys) ->
          let k [eq,eq_list,xs,ys] u64 =
            match u64 with
            | true1 ->
              let k [ys] u66 = u66 ys k in
              let k [xs] u67 = u67 xs k in
              eq_list eq k
            | false0 ->
              let v68 = false0 in
              k v68 in
          let k [y] u65 = u65 y k in
          eq x k in
    k v69 in
  k v70) in
let eq_char_list = fun[eq_char,eq_list] a k ->
  let v73 = fun[a,eq_char,eq_list] b k ->
    let k [b] u71 = u71 b k in
    let k [a] u72 = u72 a k in
    eq_list eq_char k in
  k v73 in
let append = fix (fun[cons] append xs k ->
  let v77 = fun[append,cons,xs] ys k ->
    match xs with
    | Nil0 -> k ys
    | Cons1(x,xs) ->
      let k [append,xs,ys] u74 =
        let k [u74] u75 = u74 u75 k in
        let k [ys] u76 = u76 ys k in
        append xs k in
      cons x k in
  k v77) in
let reverse = fun[cons] xs k ->
  let loop = fix (fun[cons] loop acc k ->
    let v81 = fun[acc,cons,loop] xs k ->
      match xs with
      | Nil0 -> k acc
      | Cons1(x,xs) ->
        let k [xs] u78 = u78 xs k in
        let k [loop] u79 = loop u79 k in
        let k [acc] u80 = u80 acc k in
        cons x k in
    k v81) in
  let k [xs] u82 = u82 xs k in
  let u83 = Nil0 in
  loop u83 k in
let map = fix (fun[::] map f k ->
  let v89 = fun[::,f,map] xs k ->
    match xs with
    | Nil0 ->
      let v84 = Nil0 in
      k v84
    | Cons1(x,xs) ->
      let k [f,map,xs] u85 =
        let k [u85] u87 = u85 u87 k in
        let k [xs] u88 = u88 xs k in
        map f k in
      let k [::] u86 = :: u86 k in
      f x k in
  k v89) in
let length = fix (fun[+] length xs k ->
  match xs with
  | Nil0 ->
    let v90 = 0 in
    k v90
  | Cons1(_,xs) ->
    let k [length,xs] u91 =
      let k [u91] u93 = u91 u93 k in
      length xs k in
    let u92 = 1 in
    + u92 k) in
let chars_of_int = fun[%,+,/,=,chr,cons,ord] i k ->
  let k [%,+,/,=,chr,cons,i] ord0 =
    let char_of_digit = fun[+,chr,ord0] c k ->
      let k [chr] u95 = chr u95 k in
      let k [c] u96 = u96 c k in
      + ord0 k in
    let loop = fix (fun[%,/,=,char_of_digit,cons] loop acc k ->
      let v110 = fun[%,/,=,acc,char_of_digit,cons,loop] i k ->
        let k [%,/,acc,char_of_digit,cons,i,loop] u97 =
          match u97 with
          | true1 -> k acc
          | false0 ->
            let k [/,i] u100 =
              let k [u100] u107 = u100 u107 k in
              let k [] u108 =
                let u109 = 10 in
                u108 u109 k in
              / i k in
            let k [loop] u101 = loop u101 k in
            let k [acc] u102 = u102 acc k in
            let k [cons] u103 = cons u103 k in
            let k [char_of_digit] u104 = char_of_digit u104 k in
            let k [] u105 =
              let u106 = 10 in
              u105 u106 k in
            % i k in
        let k [] u98 =
          let u99 = 0 in
          u98 u99 k in
        = i k in
      k v110) in
    let k [cons,i,loop] u111 =
      match u111 with
      | true1 ->
        let k [] u114 =
          let u116 = Nil0 in
          u114 u116 k in
        let u115 = '0' in
        cons u115 k
      | false0 ->
        let k [i] u117 = u117 i k in
        let u118 = Nil0 in
        loop u118 k in
    let k [] u112 =
      let u113 = 0 in
      u112 u113 k in
    = i k in
  let u94 = '0' in
  ord u94 k in
let put_chars = fix (fun[put_char] put_chars xs k ->
  match xs with
  | Nil0 ->
    let v119 = Unit0 in
    k v119
  | Cons1(x,xs) ->
    let k [put_chars,xs] _ = put_chars xs k in
    put_char x k) in
let put_string = fun[explode,put_chars] s k ->
  let k [put_chars] u120 = put_chars u120 k in
  explode s k in
let put_int = fun[chars_of_int,put_chars] i k ->
  let k [put_chars] u121 = put_chars u121 k in
  chars_of_int i k in
let newline = fun[put_char] _ k ->
  let u122 = '\n' in
  put_char u122 k in
let put_string_newline = fun[newline,put_string] s k ->
  let k [newline] _ =
    let u123 = Unit0 in
    newline u123 k in
  put_string s k in
let read_line = fun[<=,=,>,chr,cons,eq_char,get_char,newline,ord,put_char,reverse] _ k ->
  let loop = fix (fun[<=,=,>,chr,cons,eq_char,get_char,newline,ord,put_char,reverse] loop acc k ->
    let k [<=,=,>,acc,chr,cons,eq_char,loop,newline,ord,put_char,reverse] c =
      let k [<=,=,>,acc,c,chr,cons,eq_char,loop,newline,put_char,reverse] n =
        let k [<=,=,>,acc,c,chr,cons,loop,n,newline,put_char,reverse] u125 =
          match u125 with
          | true1 ->
            let k [acc,reverse] _ = reverse acc k in
            let u128 = Unit0 in
            newline u128 k
          | false0 ->
            let k [=,>,acc,c,chr,cons,loop,n,put_char] u129 =
              match u129 with
              | true1 -> loop acc k
              | false0 ->
                let k [=,acc,c,chr,cons,loop,n,put_char] u132 =
                  match u132 with
                  | true1 -> loop acc k
                  | false0 ->
                    let k [acc,c,chr,cons,loop,put_char] u135 =
                      match u135 with
                      | true1 ->
                        match acc with
                        | Nil0 -> loop acc k
                        | Cons1(_,tail) ->
                          let k [chr,loop,put_char,tail] _ =
                            let k [chr,loop,put_char,tail] _ =
                              let k [loop,tail] _ = loop tail k in
                              let k [put_char] u141 = put_char u141 k in
                              let u142 = 8 in
                              chr u142 k in
                            let u140 = ' ' in
                            put_char u140 k in
                          let k [put_char] u138 = put_char u138 k in
                          let u139 = 8 in
                          chr u139 k
                      | false0 ->
                        let k [acc,c,cons,loop] _ =
                          let k [loop] u143 = loop u143 k in
                          let k [acc] u144 = u144 acc k in
                          cons c k in
                        put_char c k in
                    let k [] u136 =
                      let u137 = 127 in
                      u136 u137 k in
                    = n k in
                let k [] u133 =
                  let u134 = 127 in
                  u133 u134 k in
                > n k in
            let k [] u130 =
              let u131 = 31 in
              u130 u131 k in
            <= n k in
        let k [] u126 =
          let u127 = '\n' in
          u126 u127 k in
        eq_char c k in
      ord c k in
    let u124 = Unit0 in
    get_char u124 k) in
  let u145 = Nil0 in
  loop u145 k in
let fib = fix (fun[+,-,<] fib n k ->
  let k [+,-,fib,n] u146 =
    match u146 with
    | true1 -> k n
    | false0 ->
      let k [-,fib,n] u149 =
        let k [u149] u154 = u149 u154 k in
        let k [fib] u155 = fib u155 k in
        let k [] u156 =
          let u157 = 2 in
          u156 u157 k in
        - n k in
      let k [+] u150 = + u150 k in
      let k [fib] u151 = fib u151 k in
      let k [] u152 =
        let u153 = 1 in
        u152 u153 k in
      - n k in
  let k [] u147 =
    let u148 = 2 in
    u147 u148 k in
  < n k) in
let fact = fix (fun[( * ),-,>=] fact n k ->
  let k [( * ),-,fact,n] u158 =
    match u158 with
    | true1 ->
      let k [n] u161 = u161 n k in
      let k [( * )] u162 = ( * ) u162 k in
      let k [fact] u163 = fact u163 k in
      let k [] u164 =
        let u165 = 1 in
        u164 u165 k in
      - n k
    | false0 ->
      let v166 = 1 in
      k v166 in
  let k [] u159 =
    let u160 = 2 in
    u159 u160 k in
  >= n k) in
let error = fun[newline,put_string] s k ->
  let k [newline,put_string,s] _ =
    let k [newline] _ =
      let u168 = Unit0 in
      newline u168 k in
    put_string s k in
  let u167 = "ERROR: " in
  put_string u167 k in
let runfib = fun[error,fib,newline,parse_num,put_int,put_string] args k ->
  let k [args,error,fib,newline,parse_num,put_int,put_string] _ =
    match args with
    | Nil0 ->
      let u170 = "expected an argument" in
      error u170 k
    | Cons1(arg1,more) ->
      match more with
      | Cons1(_,_) ->
        let u171 = "expected exactly one argument" in
        error u171 k
      | Nil0 ->
        let k [error,fib,newline,put_int,put_string] u172 =
          match u172 with
          | None1 ->
            let u173 = "expected arg1 to be numeric" in
            error u173 k
          | Some0(n) ->
            let k [n,newline,put_int,put_string] res =
              let k [newline,put_int,put_string,res] _ =
                let k [newline,put_int,res] _ =
                  let k [newline] _ =
                    let u175 = Unit0 in
                    newline u175 k in
                  put_int res k in
                let u174 = " --> " in
                put_string u174 k in
              put_int n k in
            fib n k in
        parse_num arg1 k in
  let u169 = "fib: " in
  put_string u169 k in
let runfact = fun[error,fact,newline,parse_num,put_int,put_string] args k ->
  let k [args,error,fact,newline,parse_num,put_int,put_string] _ =
    match args with
    | Nil0 ->
      let u177 = "expected an argument" in
      error u177 k
    | Cons1(arg1,more) ->
      match more with
      | Cons1(_,_) ->
        let u178 = "expected exactly one argument" in
        error u178 k
      | Nil0 ->
        let k [error,fact,newline,put_int,put_string] u179 =
          match u179 with
          | None1 ->
            let u180 = "expected arg1 to be numeric" in
            error u180 k
          | Some0(n) ->
            let k [n,newline,put_int,put_string] res =
              let k [newline,put_int,put_string,res] _ =
                let k [newline,put_int,res] _ =
                  let k [newline] _ =
                    let u182 = Unit0 in
                    newline u182 k in
                  put_int res k in
                let u181 = " --> " in
                put_string u181 k in
              put_int n k in
            fact n k in
        parse_num arg1 k in
  let u176 = "fact: " in
  put_string u176 k in
let fallback = fun[+,append,eq_char,explode,length,map,newline,put_char,put_chars,put_int] line k ->
  let k [+,append,explode,length,line,newline,put_char,put_chars,put_int] star_the_ohs =
    let k [append,explode,line,newline,put_char,put_chars,put_int,star_the_ohs] n =
      let k [n,newline,put_char,put_int] _ =
        let k [n,newline,put_char,put_int] _ =
          let k [n,newline,put_char,put_int] _ =
            let k [newline,put_char] _ =
              let k [newline] _ =
                let u199 = Unit0 in
                newline u199 k in
              let u198 = '}' in
              put_char u198 k in
            put_int n k in
          let u197 = '{' in
          put_char u197 k in
        let u196 = ' ' in
        put_char u196 k in
      let k [put_chars] u191 = put_chars u191 k in
      let k [line,star_the_ohs] u192 =
        let k [u192] u195 = u192 u195 k in
        star_the_ohs line k in
      let k [append] u193 = append u193 k in
      let u194 = "You wrote: " in
      explode u194 k in
    let k [length,line] u188 =
      let k [u188] u190 = u188 u190 k in
      length line k in
    let u189 = 100 in
    + u189 k in
  let u183 = fun[eq_char] c k ->
    let k [c] u184 =
      match u184 with
      | true1 ->
        let v187 = '*' in
        k v187
      | false0 -> k c in
    let k [] u185 =
      let u186 = 'o' in
      u185 u186 k in
    eq_char c k in
  map u183 k in
let split_words = fun[::,eq_char,reverse] s k ->
  let loop = fix (fun[::,eq_char,reverse] loop accWs k ->
    let v217 = fun[::,accWs,eq_char,loop,reverse] accCs k ->
      let v216 = fun[::,accCs,accWs,eq_char,loop,reverse] xs k ->
        match xs with
        | Nil0 ->
          let k [reverse] u200 = reverse u200 k in
          let k [accWs] u201 = u201 accWs k in
          let k [::] u202 = :: u202 k in
          reverse accCs k
        | Cons1(x,xs) ->
          let k [::,accCs,accWs,loop,reverse,x,xs] u203 =
            match u203 with
            | true1 ->
              let k [xs] u206 = u206 xs k in
              let k [] u207 =
                let u211 = Nil0 in
                u207 u211 k in
              let k [loop] u208 = loop u208 k in
              let k [accWs] u209 = u209 accWs k in
              let k [::] u210 = :: u210 k in
              reverse accCs k
            | false0 ->
              let k [xs] u212 = u212 xs k in
              let k [::,accCs,x] u213 =
                let k [u213] u214 = u213 u214 k in
                let k [accCs] u215 = u215 accCs k in
                :: x k in
              loop accWs k in
          let k [] u204 =
            let u205 = ' ' in
            u204 u205 k in
          eq_char x k in
      k v216 in
    k v217) in
  let k [s] u218 = u218 s k in
  let k [] u219 =
    let u221 = Nil0 in
    u219 u221 k in
  let u220 = Nil0 in
  loop u220 k in
let execute = fun[eq_char_list,explode,fallback,runfact,runfib,split_words] line k ->
  let k [eq_char_list,explode,fallback,line,runfact,runfib] words =
    match words with
    | Nil0 ->
      let v222 = Unit0 in
      k v222
    | Cons1(command,args) ->
      let k [args,command,eq_char_list,explode,fallback,line,runfact,runfib] u223 =
        match u223 with
        | true1 -> runfib args k
        | false0 ->
          let k [args,fallback,line,runfact] u227 =
            match u227 with
            | true1 -> runfact args k
            | false0 -> fallback line k in
          let k [explode] u228 =
            let k [u228] u229 = u228 u229 k in
            let u230 = "fact" in
            explode u230 k in
          eq_char_list command k in
      let k [explode] u224 =
        let k [u224] u225 = u224 u225 k in
        let u226 = "fib" in
        explode u226 k in
      eq_char_list command k in
  split_words line k in
let mainloop = fix (fun[execute,put_char,read_line] mainloop _ k ->
  let k [execute,mainloop,put_char,read_line] _ =
    let k [execute,mainloop,read_line] _ =
      let k [execute,mainloop] xs =
        let k [mainloop] _ =
          let u234 = Unit0 in
          mainloop u234 k in
        execute xs k in
      let u233 = Unit0 in
      read_line u233 k in
    let u232 = ' ' in
    put_char u232 k in
  let u231 = '>' in
  put_char u231 k) in
let k [mainloop,put_string_newline] _ =
  let main = fun[mainloop,put_string_newline] _ k ->
    let k [mainloop,put_string_newline] _ =
      let k [put_string_newline] _ =
        let u238 = "NEVER" in
        put_string_newline u238 k in
      let u237 = Unit0 in
      mainloop u237 k in
    let u236 = "RUN" in
    put_string_newline u236 k in
  let u239 = Unit0 in
  main u239 k in
let u235 = "LOAD" in
put_string_newline u235 k
