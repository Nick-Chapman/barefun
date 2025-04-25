
(* Print all the chars -- weed out diffs between haskell/ocaml/qemu interpreters *)

let main () =
  let rec loop i =
    if 255 < i then () else
      let () = put_char ' ' in
      let () = put_char (chr i) in
      loop (i+1)
  in
  loop 0
