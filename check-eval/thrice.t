
  $ cat thrice.input | ../ocaml/bin/main.exe Thrice
  [ocaml]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -0
  [stage0]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:#apps=158]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -1u
  [stage1; un-normalized]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:#apps=158]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -2u
  [stage2; un-normalized]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:#push-continuation=115, #enter=158, #return=116]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -3u
  [stage3; un-normalized]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:#push-continuation=115, #enter=158, #return=116]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -1
  [stage1; normalization: 106 -> 341]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -2
  [stage2; normalization: 106 -> 341]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:#return=1]

  $ cat thrice.input | ../haskell/main.exe ../examples/thrice.fun -3
  [stage3; normalization: 106 -> 341]
  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[
  [HALT:#return=1]
