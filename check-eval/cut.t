
Ocaml REPL

  $ ../ocaml/bin/main.exe Cut
  [ocaml]
  4[HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/cut.fun -4
  [Stage4 (CCF); normalization: 96 -> 20]
  4[HALT:#push-continuation=3, #enter=4, #return=4, #prim=4]


TODO: Stage 5 execution fails for put_int

  $ ../haskell/main.exe ../examples/cut.fun -5
  [Stage5 (ASM); normalization: 96 -> 20]
  main.exe: ("deChar",52)
  CallStack (from HasCallStack):
    error, called at src/Stage5_ASM.hs:323:35 in barefun-0.1.0.0-6XcQLzyaMgy6j7vUcK2FKm:Stage5_ASM
  [1]
