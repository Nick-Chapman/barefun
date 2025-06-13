(* thrice: "thrice thrice" example to stretch pap/overapp *)

let decrease = noinline (fun b a -> a - b)

let thrice f x = f (f (f x))

(* need two definition because of ocaml tying *)
let thriceA = noinline thrice
let thriceB = noinline thrice

let main () =
  let start = 65+27 in
  let res = thriceA thriceB (decrease 1) start in
  put_char (chr res) (*'A'*)
