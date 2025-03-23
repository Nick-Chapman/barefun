
Ocaml REPL

  $ cat tiny.input | ../ocaml/bin/tiny.exe
  [ocaml]
  Hello,
  World!
  [EOF]

Haskell REPL

  $ cat tiny.input | ../haskell/main.exe tiny.fun -0
  [stage0]
  Hello,
  World!
  [EOF]

  $ cat tiny.input | ../haskell/main.exe tiny.fun -1
  [stage1]
  Hello,
  World!
  [EOF]

  $ cat tiny.input | ../haskell/main.exe tiny.fun -2
  [stage2]
  Hello,
  World!
  [EOF]

  $ cat tiny.input | ../haskell/main.exe tiny.fun
  [stage3]
  Hello,
  World!
  [EOF]
