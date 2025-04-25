(* promptB: compiles to access frame variables; inner recursion is via "me" *)

let rec outer c =
  put_char c;
  put_char ' ';
  let rec inner () =
    let gotten = get_char () in
    put_char gotten;
    if eq_char gotten '\n' then outer c else inner ()
  in
  inner()

let main () =
  outer '%'
