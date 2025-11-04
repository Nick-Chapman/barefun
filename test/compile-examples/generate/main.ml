
let flags_for_example = function
  | _ -> ""

let select_versions_for_example = function
  | "bytes" -> [5]
  | "codes" -> [2;3;4;5]
  | "echo" -> [5]
  | "evenodd" -> [5]
  | "ff" -> [5]
  | "fib" -> [5]
  | "filesystem" -> [4;5]
  | "hello" -> [0;1;2;3;4;5]
  | "norm" -> [5]
  | "print_all_chars" -> [5]
  | "put_int" -> [5]
  | "readline" -> [5]
  | "secex" -> [5]
  | "sham" -> [5]
  | "tree" -> [5]
  | "thrice" -> [2;3;4;5]
  | "two" -> [0;1;2;3;4;5]
  | "peval" -> [0;1;2;3;4;5]
  | _ -> []

let suffix_of_version v =
  if v >= 0 && v <= 4 then "ml" else
    if v == 5 then "asm" else
     failwith "suffix_of_version"

let generate_rules x v =
  let flags = flags_for_example x in
  let suf = suffix_of_version v in
  let m = Printf.sprintf "%d" v in
  Printf.printf
{|
 (rule
  (alias runtest)
   (action
    (diff ../../expected/%s-%s.%s %s-%s.gen)))

 (rule
  (deps ../../../haskell/main.exe ../../../examples/%s.fun)
  (action
   (with-stdout-to %s-%s.gen
    (run ../../../haskell/main.exe ../../../examples/%s.fun -compile %s -%s))))

|} x m suf x m  x x m  x flags m

let generate_rules_set example =
  List.iter (generate_rules example) (select_versions_for_example example)

let allow = function
  | _ -> true

let () =
  Sys.readdir "../../examples"
  |> Array.to_list
  |> List.sort String.compare
  |> List.filter_map (Filename.chop_suffix_opt ~suffix:".fun")
  |> List.filter allow
  |> List.iter generate_rules_set
