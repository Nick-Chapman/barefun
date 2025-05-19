(* thrice: example to push NbE *)
let thrice f x = f (f (f x))

let main () =
  let start = '@' in
  let next x = put_char (chr x); x+1 in
  put_char (chr (thrice thrice next (ord start)));
  put_char '\n'
