
Ocaml REPL

  $ cat sham.input | ../ocaml/bin/main.exe Sham
  [ocaml]
  Sham: In-memory file-system. Consider typing "ls".
  % xxx
  sham: xxx: command not found
  % ls
  readme ls cat man
  % readme
  sham: readme: Permission denied
  % cat readme
  Welcome to sham; please try all the commands!
  Can you find the hidden Easter Egg?
  % man man
  Show the manual page for a command.
  % [EOF]

Haskell

  $ cat sham.input | ../haskell/main.exe ../examples/sham.fun -5
  [Stage5 (ASM); post normalization size: 924]
  Sham: In-memory file-system. Consider typing "ls".
  % xxx
  sham: xxx: command not found
  % ls
  readme ls cat man
  % readme
  sham: readme: Permission denied
  % cat readme
  Welcome to sham; please try all the commands!
  Can you find the hidden Easter Egg?
  % man man
  Show the manual page for a command.
  % [EOF:#op=55486]
