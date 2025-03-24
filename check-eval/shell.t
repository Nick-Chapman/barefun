
Ocaml REPL

  $ cat shell.input | ../ocaml/bin/shell.exe
  [ocaml]
  LOAD
  RUN
  > Hello, World!
  You wrote: Hell*, W*rld! {113}
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
  > Goodbye
  You wrote: G**dbye {107}
  > [EOF]

Haskell REPL (stage0)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -0
  [stage0]
  LOAD
  RUN
  > Hello, World!
  You wrote: Hell*, W*rld! {113}
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
  > Goodbye
  You wrote: G**dbye {107}
  > [EOF]

Haskell REPL (stage1)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -1
  [stage1]
  LOAD
  RUN
  > Hello, World!
  You wrote: Hell*, W*rld! {113}
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
  > Goodbye
  You wrote: G**dbye {107}
  > [EOF]

Haskell REPL (stage2)

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun -2
  [stage2]
  LOAD
  RUN
  > Hello, World!
  You wrote: Hell*, W*rld! {113}
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
  > Goodbye
  You wrote: G**dbye {107}
  > [EOF]

Haskell REPL

  $ cat shell.input | ../haskell/main.exe ../examples/shell.fun
  [stage3]
  LOAD
  RUN
  > Hello, World!
  You wrote: Hell*, W*rld! {113}
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
  > Goodbye
  You wrote: G**dbye {107}
  > [EOF]
