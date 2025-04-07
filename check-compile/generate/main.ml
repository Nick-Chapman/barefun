

let select_versions_for_example = function
  | "small" -> [0;1;2;3;4]
  | "tiny" -> [0;1;2;3;4;5]
  | "promptA" -> [4;5]
  | "promptB" -> [4;5]
  | "halts" -> [4;5]
  | "evenodd" -> [4;5]
  | "hello" -> [4;5]
  | "put_int" -> [4;5]
  | "fib" -> [4]
  (* TODO: have [4,5] be the default for all examples *)
  | _ -> [4]

let suffix_of_version v =
  if v >= 0 && v <= 4 then "ml" else
    if v == 5 then "asm" else
     failwith "suffix_of_version"

let generate_rules x v =
  let suf = suffix_of_version v in
  let m = Printf.sprintf "%d" v in
  Printf.printf {|
(rule (alias runtest) (action (diff ../%s-%s.%s %s-%s.gen)))
(rule (deps ../../haskell/main.exe ../../examples/%s.fun) (action (with-stdout-to %s-%s.gen (run ../../haskell/main.exe ../../examples/%s.fun -compile -%s))))
 |} x m suf x m  x x m  x m

let generate_rules_set example =
  List.iter (generate_rules example) (select_versions_for_example example)

let () =
  Sys.readdir "../examples"
  |> Array.to_list
  |> List.sort String.compare
  |> List.filter_map (Filename.chop_suffix_opt ~suffix:".fun")
  |> List.iter generate_rules_set
