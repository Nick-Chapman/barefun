
(* example to ensure parse of if/; is the the same in .fun as in ocaml. *)

let foo () =
  if true then put_char 'A' else put_char 'B';
  put_char 'C'

let main () =
  foo(); put_char '\n'
