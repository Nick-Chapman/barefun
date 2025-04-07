
Ocaml REPL

  $ ../ocaml/bin/main.exe Put_int
  [ocaml]
  42[HALT]

Haskell REPL

  $ ../haskell/main.exe ../examples/put_int.fun -4
  [Stage4 (CCF); normalization: 141 -> 46]
  42[HALT:#push-continuation=4, #enter=9, #return=5, #prim=13]


TODO: Stage 5 execution fails for put_int

  $ ../haskell/main.exe ../examples/put_int.fun -5
  [Stage5 (ASM); normalization: 141 -> 46]
  main.exe: ("deMemAddr","(\"OpMove\",\"source-indirect\")",52)
  CallStack (from HasCallStack):
    error, called at src/Stage5_ASM.hs:317:45 in barefun-0.1.0.0-6XcQLzyaMgy6j7vUcK2FKm:Stage5_ASM
  [1]
