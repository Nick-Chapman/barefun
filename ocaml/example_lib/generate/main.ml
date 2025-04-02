
let generate_rules x =
  Printf.printf {|
(rule
  (with-stdout-to %s.ml
    (progn
      (echo "module F() : sig val main : unit -> unit end = struct\n")
      (echo "open! Prim_lib.Prim\n")
      (echo "#1 \"%s.fun\"\n")
      (cat ../../../examples/%s.fun)
      (echo "end\n")
      )))
  |} x x x

let () =
  Sys.readdir "../../examples"
  |> Array.to_list
  |> List.sort String.compare
  |> List.filter_map (Filename.chop_suffix_opt ~suffix:".fun")
  |> List.iter generate_rules
