
(* Test "is_comptime_known" primitive *)

let identity x = x

let dub x = x+x
let dub x =
  let mode = if is_comptime_known x then identity else noinline in
  let dub = mode dub in
  dub x

let main() =
  let arg1 = 33 in (* comptime known *)
  let arg2 = noinline 34 in (* NOT comptime known *)
  let () = put_char (chr (dub arg1)) in
  let () = put_char (chr (dub arg2)) in
  ()
