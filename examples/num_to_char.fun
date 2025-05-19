
(* Check we get sensible behavior for numbers which are too big to fit in a char *)
let main () =
  let a = chr (256+65) in
  let b = noinline chr (256+66) in
  put_char a;
  put_char b;
  put_char '\n'
