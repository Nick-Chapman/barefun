
Ocaml REPL

  $ cat shell.input | ../ocaml/bin/shell.exe
  [ocaml]
  LOAD
  RUN
  > Hello, World!
  You wrote: Hell*, W*rld! {113}
  > runfib
  fib 10 --> 55
  > runfact
  fact 6 --> 720
  > Goodbye
  You wrote: G**dbye {107}
  > [EOF]

Haskell REPL

  $ cat shell.input | ../haskell/main.exe shell.fun -0
  [stage0]
  LOAD
  RUN
  > Hello, World!
  You wrote: Hell*, W*rld! {113}
  > runfib
  fib 10 --> 55
  > runfact
  fact 6 --> 720
  > Goodbye
  You wrote: G**dbye {107}
  > [EOF]

  $ cat shell.input | ../haskell/main.exe shell.fun -1
  [stage1]
  RUN
  > Hello, World!
  You wrote: Hell*, W*rld! {113}
  > runfib
  fib 10 --> 55
  > runfact
  fact 6 --> 720
  > Goodbye
  You wrote: G**dbye {107}
  > [EOF]

  $ cat shell.input | ../haskell/main.exe shell.fun -2
  [stage2]
  RUN
  > Hello, World!
  You wrote: Hell*, W*rld! {113}
  > runfib
  fib 10 --> 55
  > runfact
  fact 6 --> 720
  > Goodbye
  You wrote: G**dbye {107}
  > [EOF]
