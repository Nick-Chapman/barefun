
Ocaml REPL

  $ cat small.input | ../ocaml/bin/small.exe
  [ocaml]
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF]

Haskell REPL

  $ cat small.input | ../haskell/main.exe small.fun -0
  [stage0]
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF]

  $ cat small.input | ../haskell/main.exe small.fun -1
  [stage1]
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF]

  $ cat small.input | ../haskell/main.exe small.fun -2
  [stage2]
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF]

  $ cat small.input | ../haskell/main.exe small.fun
  [stage3]
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF]
