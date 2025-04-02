(*stage1*)
let is_even =
  fix (fun is_even n ->
    match PRIM_EqInt(n,0) with
    | true1 -> CID1
    | false0 ->
      let n = PRIM_SubInt(n,1) in
      match PRIM_EqInt(n,0) with
      | true1 -> CID0
      | false0 -> (is_even PRIM_SubInt(n,1))) in
let x =
  match (is_even 42) with
  | true1 -> 'E'
  | false0 -> 'O' in
let _ = PRIM_PutChar(x) in
let x =
  match (is_even 13) with
  | true1 -> 'E'
  | false0 -> 'O' in
PRIM_PutChar(x)
