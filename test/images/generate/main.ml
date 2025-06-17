
let flags_for_example = function
  | _ -> "-mlam -mapp" (* starting to work in qemu *)

let generate_rules x =
  let flags = flags_for_example x in
  Printf.printf
{|
 (rule
  (deps ../../../haskell/main.exe ../../../examples/%s.fun)
  (action
   (with-stdout-to %s.asm
    (run ../../../haskell/main.exe ../../../examples/%s.fun -compile %s))))

 (rule
  (deps ../../../x86/runtime.asm ../../../disk.image %s.asm)
  (action
   (with-stdout-to %s.img
    (run nasm -Werror -i ../../.. -o %s.img -dCODE='%s.asm' ../../../x86/runtime.asm))))

 (rule
  (alias %s)
  (deps (universe) %s.img)
  (action
  (progn
   (run chmod +w %s.img)
   (run qemu-system-i386 -hda %s.img))))

|} x x x  flags  x x x x x x x x

let allow_example = function
  (*| "filesystem" -> false*) (* generated code is too big *)
  | _ -> true

let () =
  Sys.readdir "../../examples"
  |> Array.to_list
  |> List.sort String.compare
  |> List.filter_map (Filename.chop_suffix_opt ~suffix:".fun")
  |> List.filter allow_example
  |> List.iter generate_rules
