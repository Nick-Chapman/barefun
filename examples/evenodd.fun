
let rec is_even n =
  let is_odd n = if n = 0 then false else is_even (n-1) in
  let is_even n = if n = 0 then true else is_odd (n-1) in
  is_even n

let check n =
  put_char (if is_even n then 'E' else 'O')

let main() =
  check 42;
  check 13
