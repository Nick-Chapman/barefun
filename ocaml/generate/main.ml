

let selection x =
  Printf.sprintf {|  | "%s" -> (module Example_lib.%s.F() : S)|} x x

let generate_code body =
  {|
module type S = sig
  val main : unit -> unit
end
let select : string -> (module S) =
  function
|}
^ body ^
{|
  | example -> failwith (Printf.sprintf "%s: select: unknown example: %s" __FILE__ example)
|}

let () =
  Sys.readdir "../examples"
  |> Array.to_list
  |> List.sort String.compare
  |> List.filter_map (Filename.chop_suffix_opt ~suffix:".fun")
  |> List.map String.capitalize_ascii
  |> List.map selection
  |> String.concat "\n"
  |> generate_code
  |> print_endline
