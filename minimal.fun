
let put_two_chars c =
  put_char c;
  put_char c

let main =
  let rec mainloop () =
    put_two_chars (get_char ());
    mainloop ()
  in
  mainloop
