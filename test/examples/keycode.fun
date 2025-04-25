(* keycode: see what codes we get from the keyboard *)

let rec main () =
  put_char (get_char ());
  main ()
