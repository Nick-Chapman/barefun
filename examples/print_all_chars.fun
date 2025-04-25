
(* Print all the chars -- weed out diffs between haskell/ocaml/qemu interpreters *)

let del() = put_char '['; put_char 'D'; put_char 'E'; put_char 'L'; put_char ']'
let nl() = put_char '['; put_char 'N'; put_char 'L'; put_char ']'

let main () =
  let rec loop i =
    if 255 < i then () else
      let () = put_char ' ' in
      let () =
        if i = 8 then del() else
          if i = 10 then nl() else
            put_char (chr i)
      in
      loop (i+1)
  in
  loop 0;
  put_char '\n'
