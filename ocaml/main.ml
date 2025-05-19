
let with_terminal_no_buffering f =
  let open Unix in
  if isatty stdin then
    let tio = tcgetattr stdin in
    tcsetattr stdin TCSANOW { tio with c_echo = false; c_icanon = false };
    let opt = try f(); None with exn -> Some exn in
    tcsetattr stdin TCSANOW tio; (* reset the terminal even when we got an exception *)
    match opt with None -> () | Some exn -> raise exn
  else
    f()

let () =
  match Array.to_list Sys.argv with
  | [_;name] ->
     let (module M:Select.S) = Select.select name in (* select.ml is generated code *)
     with_terminal_no_buffering (fun () ->
         let () =
           try M.main();
           with Prim_lib.Prim.CRASH message -> Printf.printf "%s" message
         in
         Printf.printf "[HALT]\n"
       )
    | _ ->
       failwith (Printf.sprintf "%s: expected single arg on command line" __FILE__)
