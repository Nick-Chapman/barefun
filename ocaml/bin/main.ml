
module type S = sig
  val main : unit -> unit
end

let select : string -> (module S) =
  function
  | "Halts" -> (module Example_lib.Halts.F() : S)
  | "Fib" -> (module Example_lib.Fib.F() : S)
  | "Tiny" -> (module Example_lib.Tiny.F() : S)
  | "Small" -> (module Example_lib.Small.F() : S)
  | "Shell" -> (module Example_lib.Shell.F() : S)
  | example -> failwith (Printf.sprintf "%s: select: unknown example: %s" __FILE__ example)

let with_terminal_no_buffering f =
  let open Unix in
  if isatty stdin then
    let tio = tcgetattr stdin in
    tcsetattr stdin TCSANOW { tio with c_echo = false; c_icanon = false };
    f();
    tcsetattr stdin TCSANOW tio
  else
    f()

let () =
  Printf.printf "[ocaml]\n";
  match Array.to_list Sys.argv with
  | [_;name] ->
     let (module M:S) = select name in
     with_terminal_no_buffering @@ fun () ->
     M.main();
     Printf.printf "[HALT]\n"
  | _ ->
     failwith (Printf.sprintf "%s: expected single arg on command line" __FILE__)
