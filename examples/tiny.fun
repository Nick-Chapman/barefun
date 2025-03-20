
let main =
  let rec mainloop () =
    put_char (get_char ());
    mainloop ()
  in
  mainloop
