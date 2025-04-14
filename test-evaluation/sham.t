
Ocaml REPL

  $ cat sham.input | ../ocaml/bin/main.exe Sham
  [ocaml]
  Sham: In-memory file-system. Consider typing "ls".
  % xxx
  sham: xxx: command not found
  % ls
  readme ls cat man rm cp mv
  % readme
  sham: readme: Permission denied
  % cat readme
  Welcome to sham; please try all the commands!
  Can you find the hidden Easter Egg?
  % man man
  man - an interface to the system reference manuals
  % cp ls xx
  % rm ls
  % ls
  sham: ls: command not found
  % xx
  xx readme cat man rm cp mv
  % [EOF]

Haskell

  $ cat sham.input | ../haskell/main.exe ../examples/sham.fun -5
  [Stage5 (ASM); post normalization size: 1252]
  Sham: In-memory file-system. Consider typing "ls".
  % xxx
  sham: xxx: command not found
  % ls
  readme ls cat man rm cp mv
  % readme
  sham: readme: Permission denied
  % cat readme
  Welcome to sham; please try all the commands!
  Can you find the hidden Easter Egg?
  % man man
  man - an interface to the system reference manuals
  % cp ls xx
  % rm ls
  % ls
  sham: ls: command not found
  % xx
  xx readme cat man rm cp mv
  % [EOF:#op=85687]
