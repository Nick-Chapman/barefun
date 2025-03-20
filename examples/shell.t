
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

  $ cat shell.input | ../haskell/main.exe -eval0 shell.fun
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

  $ cat shell.input | ../haskell/main.exe -eval1 shell.fun
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

  $ cat shell.input | ../haskell/main.exe -eval2 shell.fun
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
