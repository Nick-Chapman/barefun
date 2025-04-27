
let select_versions_for_example = function
  | "bytes" -> [4;5]
  | "empty" -> [4;5]
  | "evenodd" -> [4;5]
  | "fib" -> [4;5]
  | "filesystem" -> [2;3;4;5]
  | "hello" -> [4;5]
  | "keycode" -> [4;5]
  | "print_all_chars" -> [4;5]
  | "promptA" -> [4;5]
  | "promptB" -> [4;5]
  | "put_int" -> [4;5]
  | "readline" -> [4;5]
  | "sex" -> [4;5]
  | "sham" -> [4;5]
  | "shammy" -> [4;5]
  | "shell" -> [4;5]
  | "small" -> [4;5]
  | "smaller" -> [4;5]
  | "thrice" -> [4;5]
  | "tiny" -> [2;3;4;5]
  | "tree" -> [4;5]
  | _ -> []

let suffix_of_version v =
  if v >= 0 && v <= 4 then "ml" else
    if v == 5 then "asm" else
     failwith "suffix_of_version"

let generate_rules x v =
  let suf = suffix_of_version v in
  let m = Printf.sprintf "%d" v in
  Printf.printf {|
(rule (alias runtest) (action (diff ../../expected/%s-%s.%s %s-%s.gen)))
(rule (deps ../../../haskell/main.exe ../../examples/%s.fun) (action (with-stdout-to %s-%s.gen (run ../../../haskell/main.exe ../../examples/%s.fun -compile -%s))))
 |} x m suf x m  x x m  x m

let generate_rules_set example =
  List.iter (generate_rules example) (select_versions_for_example example)

let allow = function
  | _ -> true

let () =
  Sys.readdir "../examples"
  |> Array.to_list
  |> List.sort String.compare
  |> List.filter_map (Filename.chop_suffix_opt ~suffix:".fun")
  |> List.filter allow
  |> List.iter generate_rules_set
