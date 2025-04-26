
(* TODO: merge the various rules generators *)

let generate_rules x =
  Printf.printf {|
(rule
 (deps ../../../x86/runtime.asm ../../compile-examples/gen/%s-5.gen)
 (action
  (with-stdout-to %s.img
   (run nasm -Werror -o %s.img -dCODE='../../compile-examples/gen/%s-5.gen' ../../../x86/runtime.asm))))
(rule
 (alias %s.qemu)
 (deps (universe) %s.img)
 (action
 (progn
  (run chmod +w %s.img)
  (run qemu-system-i386 -hda %s.img))))
|} x x x x x x x x

let allow_example = function
  | _ -> true

let () =
  Sys.readdir "../examples"
  |> Array.to_list
  |> List.sort String.compare
  |> List.filter_map (Filename.chop_suffix_opt ~suffix:".fun")
  |> List.filter allow_example
  |> List.iter generate_rules
