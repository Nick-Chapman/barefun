
let main =
  let rec mainloop () =
    let gotten = get_char () in
    put_char gotten;
    put_char gotten;
    mainloop ()
  in
  mainloop
