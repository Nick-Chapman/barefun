
Ocaml REPL

  $ cat shell.input | ../ocaml/bin/shell.exe
  [ocaml]
  This is a shell prototype. Try: fib, fact, rev
  > Hello, World!
  You wrote: Hell*, W*rld! {13}
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
  You wrote: G**dbye {7}
  > [EOF]

Haskell REPL (stage0)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -0
  [stage0]
  This is a shell prototype. Try: fib, fact, rev
  > Hello, World!
  You wrote: Hell*, W*rld! {13}
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
  You wrote: G**dbye {7}
  > [EOF]

Haskell REPL (stage1)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -1u
  [stage1; un-normalized]
  This is a shell prototype. Try: fib, fact, rev
  > Hello, World!
  You wrote: Hell*, W*rld! {13}
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
  You wrote: G**dbye {7}
  > [EOF]

Haskell REPL (stage2)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -2u
  [stage2; un-normalized]
  This is a shell prototype. Try: fib, fact, rev
  > Hello, World!
  You wrote: Hell*, W*rld! {13}
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
  You wrote: G**dbye {7}
  > [EOF]

Haskell REPL

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -3u
  [stage3; un-normalized]
  This is a shell prototype. Try: fib, fact, rev
  > Hello, World!
  You wrote: Hell*, W*rld! {13}
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
  You wrote: G**dbye {7}
  > [EOF]
