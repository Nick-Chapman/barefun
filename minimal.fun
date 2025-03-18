
let main =
  let rec loop () =
    let c = get_char () in
    put_char c;
    put_char c;
    loop ()
  in
  loop
