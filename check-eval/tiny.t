
Ocaml REPL

  $ cat tiny.input | ../ocaml/bin/tiny.exe
  [ocaml]
  Hello,
  World!
  [EOF]

Haskell REPL

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -0
  [stage0]
  Hello,
  World!
  [EOF]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -1u
  [stage1; un-normalized]
  Hello,
  World!
  [EOF]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -2u
  [stage2; un-normalized]
  Hello,
  World!
  [EOF]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -3u
  [stage3; un-normalized]
  Hello,
  World!
  [EOF]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -1
  [stage1]
  Hello,
  World!
  [EOF]
