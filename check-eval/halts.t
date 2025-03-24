
Ocaml REPL

  $ cat halts.input | ../ocaml/bin/halts.exe
  [ocaml]
  XhYeZ[HALT]

Haskell REPL

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -0
  [stage0]
  XhYeZ[HALT]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -1
  [stage1]
  XhYeZ[HALT]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun -2
  [stage2]
  XhYeZ[HALT]

  $ cat halts.input | ../haskell/main.exe ../examples/halts.fun
  [stage3]
  XhYeZ[HALT]
