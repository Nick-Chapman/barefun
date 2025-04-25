(* TODO: die *)
(* this example is to test single-arm variant types *)

type 'a thing = Thing of 'a

let put_thing f =
  let rec doit thing =
    let _ = doit in (* hack to block NbE *)
    match thing with
    | Thing x -> f x
  in
  doit

let main () =
  put_thing put_char (Thing 'x')
