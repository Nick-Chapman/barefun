
(* example to drive multi lam/app work *)

let two =
  noinline
  (fun x y ->
    x + y
  )

let numA = noinline (fun () -> 60)
let numB = noinline (fun () -> 5)

let call_two = noinline (fun () ->
  let a = numA() in
  let b = numB() in
  let res = two a b in
  res)

let main () =
  let res = call_two () in
  put_char (chr res)
