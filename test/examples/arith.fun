
(* idea: test and self-test arith *)

let () = assert (1 + 2 = 3)
let () = assert (5 - 3 = 2)

let noinline = let rec block f a = let _ = block in f a in block

let my_assert name b = if b then () else crash name

(* check the result from runtime execution matches the result from compiletime inlining *)
let run_test name f x =
  let a = f x in
  let b = noinline f x in
  let res = (a = b) in
  my_assert name res

let main () =
  let () = run_test "1+2" (fun x -> 1 + x) 2 in
  let () = run_test "5-2" (fun x -> 5 - x) 2 in
  let () = run_test "5/3" (fun x -> 5 / x) 3 in
  let () = run_test "-1/3" (fun x -> (0-1) / x) 3 in
  ()
