
Ocaml REPL

  $ cat sample.input | ocaml/bin/main.exe
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

  $ cat sample.input | haskell/main.exe shell.fun
  [haskell-eval2]
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
