
Ocaml REPL

  $ cat shell.input | ../ocaml/bin/main.exe Shell
  [ocaml]
  This is a shell prototype. Try: fib, fact, rev
  > Hello, World!
  You wrote: "Hell*, W*rld!" (13 chars)
  > fib
  fib: ERROR: expected an argument
  > fib xx
  fib: ERROR: expected arg1 to be numeric
  > fib xx yy
  fib: ERROR: expected exactly one argument
  > fib 20
  fib: 20 --> 6765
  > fib 21
  fib: 21 --> 10946
  > fact 6
  fact: 6 --> 720
  > fact 7
  fact: 7 --> 5040
  > rev
  (reverse typed lines until ^D)
  Here are some words.
  .sdrow emos era ereH
  And here are some more.
  .erom emos era ereh dnA
  ^D
  > Goodbye
  You wrote: "G**dbye" (7 chars)
  > [EOF]

Haskell REPL (stage4)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -4
  [Stage4 (CCF); normalization: 824 -> 1116]
  This is a shell prototype. Try: fib, fact, rev
  > Hello, World!
  You wrote: "Hell*, W*rld!" (13 chars)
  > fib
  fib: ERROR: expected an argument
  > fib xx
  fib: ERROR: expected arg1 to be numeric
  > fib xx yy
  fib: ERROR: expected exactly one argument
  > fib 20
  fib: 20 --> 6765
  > fib 21
  fib: 21 --> 10946
  > fact 6
  fact: 6 --> 720
  > fact 7
  fact: 7 --> 5040
  > rev
  (reverse typed lines until ^D)
  Here are some words.
  .sdrow emos era ereH
  And here are some more.
  .erom emos era ereh dnA
  ^D
  > Goodbye
  You wrote: "G**dbye" (7 chars)
  > [EOF:#push-continuation=59273, #enter=60084, #return=59272, #prim=147977]

Haskell REPL (stage5)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -5
  [Stage5 (ASM); normalization: 824 -> 1116]
  This is a shell prototype. Try: fib, fact, rev
  > Hello, World!
  You wrote: "Hell*, W*rld!" (13 chars)
  > fib
  fib: ERROR: expected an argument
  > fib xx
  fib: ERROR: expected arg1 to be numeric
  > fib xx yy
  fib: ERROR: expected exactly one argument
  > fib 20
  fib: 20 --> 6765
  > fib 21
  fib: 21 --> 10946
  > fact 6
  fact: 6 --> 720
  > fact 7
  fact: 7 --> 5040
  > rev
  (reverse typed lines until ^D)
  Here are some words.
  .sdrow emos era ereH
  And here are some more.
  .erom emos era ereh dnA
  ^D
  > Goodbye
  You wrote: "G**dbye" (7 chars)
  > [EOF:#op=1474724]
