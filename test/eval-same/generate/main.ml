
(* TODO: maybe also have aliases to run in ocaml and haskell emulators *)

let generate_rules x =
  let capX = String.capitalize_ascii x in (* TODO: make ocaml have same interface to avoid this hack *)
  Printf.printf {|
(rule (deps ../../../examples/%s.fun) (action (with-stdout-to %s.outX (run ../../../ocaml/bin//main.exe %s))))

(rule (deps ../../../examples/%s.fun) (action (with-stdout-to %s.out0 (run ../../../haskell/main.exe -no-measure ../../../examples/%s.fun -0))))
(rule (deps ../../../examples/%s.fun) (action (with-stdout-to %s.out1 (run ../../../haskell/main.exe -no-measure ../../../examples/%s.fun -1))))
(rule (deps ../../../examples/%s.fun) (action (with-stdout-to %s.out2 (run ../../../haskell/main.exe -no-measure ../../../examples/%s.fun -2))))
(rule (deps ../../../examples/%s.fun) (action (with-stdout-to %s.out3 (run ../../../haskell/main.exe -no-measure ../../../examples/%s.fun -3))))
(rule (deps ../../../examples/%s.fun) (action (with-stdout-to %s.out4 (run ../../../haskell/main.exe -no-measure ../../../examples/%s.fun -4))))
(rule (deps ../../../examples/%s.fun) (action (with-stdout-to %s.out5 (run ../../../haskell/main.exe -no-measure ../../../examples/%s.fun -5))))

(rule (alias runtest) (action (diff %s.outX %s.out0)))
(rule (alias runtest) (action (diff %s.out0 %s.out1)))
(rule (alias runtest) (action (diff %s.out1 %s.out2)))
(rule (alias runtest) (action (diff %s.out2 %s.out3)))
(rule (alias runtest) (action (diff %s.out3 %s.out4)))
(rule (alias runtest) (action (diff %s.out4 %s.out5)))

|} x x capX x x x x x x x x  x x x x x x x x x x  x x x x x x x x x x  x x

let allow = function
  | "bytes" -> false (* TODO: remove when fixed *)
  | "print_all_chars" -> false (* TODO: remove when fixed *)
  | _ -> true

let () =
  Sys.readdir "../../examples"
  |> Array.to_list
  |> List.sort String.compare
  |> List.filter_map (Filename.chop_suffix_opt ~suffix:".fun")
  |> List.filter allow
  |> List.iter generate_rules
