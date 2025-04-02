
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
     let (module M:Select.S) = Select.select name in (* select.ml is generated code *)
     with_terminal_no_buffering @@ fun () ->
     M.main();
     Printf.printf "[HALT]\n"
  | _ ->
     failwith (Printf.sprintf "%s: expected single arg on command line" __FILE__)
