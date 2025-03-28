
Ocaml REPL

  $ cat shell.input | ../ocaml/bin/shell.exe
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

Haskell REPL (stage0)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -0
  [stage0]
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
  > [EOF:#apps=355451]

Haskell REPL (stage1u)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -1u
  [stage1; un-normalized]
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
  > [EOF:#apps=355451]

Haskell REPL (stage2u)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -2u
  [stage2; un-normalized]
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
  > [EOF:#push-continuation=324088, #enter=355451, #return=324086]

Haskell REPL (stage3u)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -3u
  [stage3; un-normalized]
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
  > [EOF:#push-continuation=324088, #enter=355451, #return=324086]

Haskell REPL (stage1)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -1
  [stage1]
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
  > [EOF:#apps=87943]

Haskell REPL (stage2)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -2
  [stage2]
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
  > [EOF:#push-continuation=58908, #enter=87943, #return=58907]

Haskell REPL (stage3)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -3
  [stage3]
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
  > [EOF:#push-continuation=58908, #enter=87943, #return=58907]

Haskell REPL

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun
  [stage3]
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
  > [EOF:#push-continuation=58908, #enter=87943, #return=58907]
