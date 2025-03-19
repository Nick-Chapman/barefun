
let main =
  let rec mainloop () =
    let c = get_char () in
    put_char c;
    put_char c;
    mainloop ()
  in
  mainloop
