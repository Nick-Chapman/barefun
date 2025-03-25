# barefun

The goal of this project is to write a small "operating system" to run on bare metal x86.

- The WIP [operating system](examples/shell.fun) is implemented in an ocaml-style language (`.fun`).
- The WIP [compiler](haskell/src) for the ocaml-style language is written in haskell.

Programming of the operating system & compiler are proceeding in tandem!
- The operating system is just a fragment of a shell.
- The compiler doesn't reach x86 yet.
- There are some hand-coded x86 fragments [here](x86/examples/src/repl.asm) to guide the way.

Various examples of `.fun` code can be found [here](examples). Since `.fun` is a subset of ocaml, we can leverage the ocaml type checker for our examples: `dune build ocaml -w`

We test evaluation of the examples [here](check-eval), expecting identical results from the haskell interpreter(s) and direct ocaml execution.

We have haskell interpreters for each stage of the compilation pipeline:
- [Stage0](haskell/src/Stage0.hs): AST
- [Stage1](haskell/src/Stage1.hs): Simplified expression language.
- [Stage2](haskell/src/Stage2.hs): A-normal form.
- [Stage3](haskell/src/Stage3.hs): Closure converted form.

The expected output from each compiler stage is [here](check-compile),

To run all tests, type `dune test`. (No output is good).

To build the compiler; compile the main `shell.fun` example; and run it, type `make`.
