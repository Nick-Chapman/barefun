
let init_no_buffering () =
  let open Unix in
  let tio = tcgetattr stdin in
  tio.c_echo <- false;
  tio.c_icanon <- false;
  tcsetattr stdin TCSANOW tio;
  ()

let main() =
  init_no_buffering();
  Repl.start()
