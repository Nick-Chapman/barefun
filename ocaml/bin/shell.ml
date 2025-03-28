
(* TODO: reset terminal when we exit *)
(* TODO: share this setup code across all examples *)

let init_terminal_no_buffering () =
  let open Unix in
  if isatty stdin then
    let tio = tcgetattr stdin in
    tio.c_echo <- false;
    tio.c_icanon <- false;
    tcsetattr stdin TCSANOW tio

let () =
  Printf.printf "[ocaml]\n";
  init_terminal_no_buffering();
  let module M = Example_lib.Shell.F() in
  M.main();
  Printf.printf "[HALT]\n"
