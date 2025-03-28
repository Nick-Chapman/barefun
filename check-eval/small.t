
Ocaml REPL

  $ cat small.input | ../ocaml/bin/small.exe
  [ocaml]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF]

Haskell REPL

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -0
  [stage0]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=364]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -1u
  [stage1; un-normalized]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=364]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -2u
  [stage2; un-normalized]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=364]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -3u
  [stage3; un-normalized]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=364]


  $ cat small.input | ../haskell/main.exe ../examples/small.fun -1
  [stage1]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=120]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -2
  [stage2]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=120]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun -3
  [stage3]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=120]

  $ cat small.input | ../haskell/main.exe ../examples/small.fun
  [stage3]
  LOAD
  RUN
  > Hello, World!
  Hello, World!
  > Good bye.
  Good bye.
  > [EOF:#apps=120]
