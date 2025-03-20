
Ocaml REPL

  $ cat tiny.input | ../ocaml/bin/tiny.exe
  [ocaml]
  Hello,
  World!
  [EOF]

Haskell REPL

  $ cat tiny.input | ../haskell/main.exe -eval0 tiny.fun
  [stage0]
  Hello,
  World!
  [EOF]

  $ cat tiny.input | ../haskell/main.exe -eval1 tiny.fun
  [stage1]
  Hello,
  World!
  [EOF]

  $ cat tiny.input | ../haskell/main.exe -eval2 tiny.fun
  [stage2]
  Hello,
  World!
  [EOF]
