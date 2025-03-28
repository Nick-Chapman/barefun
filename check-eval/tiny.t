
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
  [EOF:#apps=44]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -1u
  [stage1; un-normalized]
  Hello,
  World!
  [EOF:#apps=44]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -2u
  [stage2; un-normalized]
  Hello,
  World!
  [EOF:#push-continuation=29, #enter=44, #return=28]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -3u
  [stage3; un-normalized]
  Hello,
  World!
  [EOF:#push-continuation=29, #enter=44, #return=28]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -1
  [stage1]
  Hello,
  World!
  [EOF:#apps=15]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -2
  [stage2]
  Hello,
  World!
  [EOF:#enter=15]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun -3
  [stage3]
  Hello,
  World!
  [EOF:#enter=15]

  $ cat tiny.input | ../haskell/main.exe ../examples/tiny.fun
  [stage3]
  Hello,
  World!
  [EOF:#enter=15]
