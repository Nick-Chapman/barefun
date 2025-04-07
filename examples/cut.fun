
let rec loop def c =
  if c = 0 then def else
    loop (chr c) 0

let main () = put_char (loop 'X' 52)
