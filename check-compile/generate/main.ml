
let generate_rules x m =
  Printf.printf {|
(rule (alias runtest) (action (diff ../%s-%s.ml %s-%s.gen)))
(rule (deps ../../haskell/main.exe ../../examples/%s.fun) (action (with-stdout-to %s-%s.gen (run ../../haskell/main.exe ../../examples/%s.fun -compile -%s))))
 |} x m x m  x x m  x m

let generate_rules_set example =
  ["0";"1";"2";"3";"4"]
  |> List.iter (generate_rules example)

let () =
  Sys.readdir "../examples"
  |> Array.to_list
  |> List.sort String.compare
  |> List.filter_map (Filename.chop_suffix_opt ~suffix:".fun")
  |> List.iter generate_rules_set
