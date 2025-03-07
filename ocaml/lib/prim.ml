
let eq_char : char -> char -> bool = fun c1 c2 ->
  c1 = c2

let get_char : unit -> char = fun () ->
  let bytes = Bytes.create 1 in
  let n = Unix.read Unix.stdin bytes 0 1 in
  if n < 1 then failwith "n<1" else
  let c : char = Bytes.get bytes 0 in
  c

let put_char : char -> unit = fun c ->
  let open Printf in
  if c = '\n' then printf "\n%!" else
    let d = Char.code c in
    if d < 32 || d > 126 then printf "%s%!" (Char.escaped c) else
      printf "%c%!" c

