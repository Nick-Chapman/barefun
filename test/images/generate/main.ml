
let generate_rules x =
  Printf.printf
{|
 (rule
  (deps ../../../haskell/main.exe ../../examples/%s.fun)
  (action
   (with-stdout-to %s.asm
    (run ../../../haskell/main.exe ../../examples/%s.fun -compile))))

 (rule
  (deps ../../../x86/runtime.asm %s.asm)
  (action
   (with-stdout-to %s.img
    (run nasm -Werror -o %s.img -dCODE='%s.asm' ../../../x86/runtime.asm))))

 (rule
  (alias %s)
  (deps (universe) %s.img)
  (action
  (progn
   (run chmod +w %s.img)
   (run qemu-system-i386 -hda %s.img))))

|} x x x x x x x x x x x

let allow_example = function
  | "more" -> false (* TODO: x86 from more.fun is too big *)
  | _ -> true

let () =
  Sys.readdir "../examples"
  |> Array.to_list
  |> List.sort String.compare
  |> List.filter_map (Filename.chop_suffix_opt ~suffix:".fun")
  |> List.filter allow_example
  |> List.iter generate_rules
