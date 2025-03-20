
Ocaml REPL

  $ cat small.input | ../ocaml/bin/small.exe
  [ocaml]
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF]

Haskell REPL

  $ cat small.input | ../haskell/main.exe -eval0 small.fun
  [stage0]
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF]

  $ cat small.input | ../haskell/main.exe -eval1 small.fun
  [stage1]
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF]

  $ cat small.input | ../haskell/main.exe -eval2 small.fun
  [stage2]
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF]
