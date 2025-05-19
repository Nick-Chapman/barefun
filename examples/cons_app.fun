
(* example to ensure parse of constructor application w.r.t normal application is correct *)

let iff b x y = if b then x else y

let foo () = put_char (iff true 'A' 'B')

let main () =
  foo(); put_char '\n'
