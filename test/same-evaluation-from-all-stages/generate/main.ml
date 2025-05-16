
let generate_rules x =
  let capX = String.capitalize_ascii x in

  Printf.printf
{|
 (rule (deps ../../../test/inputs/%s.input ../../examples/%s.fun ../../../ocaml/main.exe)
  (action
   (with-stdin-from ../../../test/inputs/%s.input
    (with-stdout-to %s.out%c
     (run ../../../ocaml/main.exe %s)))))
|}
x x x x 'X' capX;

  let f v = Printf.printf
{|
 (rule (deps ../../../test/inputs/%s.input ../../examples/%s.fun ../../../haskell/main.exe)
  (action
   (with-stdin-from ../../../test/inputs/%s.input
    (with-stdout-to %s.out%c
     (run ../../../haskell/main.exe ../../examples/%s.fun -%c)))))
|}
x x x x v x v
  in
  List.iter f ['0';'1';'2';'3';'4';'5'];

  let f (a,b) = Printf.printf
{|
 (rule
  (alias runtest)
   (action (diff %s.out%c %s.out%c)))
|}
x a x b in
  List.iter f ['X','0'; '0','1'; '1','2'; '2','3'; '3','4'; '4','5';]

let allow = function
  | "secex" -> false
  | "filesystem" -> false (* TODO: enable this when haskell emulator supports load/store sector *)
  | _ -> true

let () =
  Sys.readdir "../inputs"
  |> Array.to_list
  |> List.sort String.compare
  |> List.filter_map (Filename.chop_suffix_opt ~suffix:".input")
  |> List.filter allow
  |> List.iter generate_rules
