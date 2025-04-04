
(* Version A -- compiles to only use global function defs. *)
let top c =
  let rec outer () =
    put_char c;
    put_char ' ';
    let rec inner () =
      let gotten = get_char () in
      put_char gotten;
      if eq_char gotten '\n' then outer () else inner ()
    in
    inner()
  in outer ()

let main () =
  top '%'
