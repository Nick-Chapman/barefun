# barefun

The goal of this project is to write a small "operating system" to run on bare metal x86.

- The WIP [operating system](examples/shell.fun) is implemented in an ocaml-style language (`.fun`).
- The WIP [compiler](haskell/src) for the ocaml-style language is written in haskell.

Programming of the operating system & compiler are proceeding in tandem!
- The operating system is just a fragment of a shell.
- The compiler doesn't reach x86 yet.
- There are some hand-coded x86 fragments [here](x86/examples/src/repl.asm) to guide the way.

Various examples of `.fun` code can be found [here](examples). Since `.fun` is a subset of ocaml, we can leverage the ocaml type checker for our examples: `dune build ocaml -w`

We test evaluation of the examples [here](test-evaluation), expecting identical results from the haskell interpreter(s) and direct ocaml execution.

We have haskell interpreters for each stage of the compilation pipeline:
- [Stage0](haskell/src/Stage0_AST.hs): AST
- [Stage1](haskell/src/Stage1_EXP.hs): Simplified expression language.
- [Stage2](haskell/src/Stage2_NBE.hs): Normalization by Evaluation. (Inlining & Constant Folding).
- [Stage3](haskell/src/Stage3_ANF.hs): A-normal form.
- [Stage4](haskell/src/Stage4_CCF.hs): Closure converted form.
- [Stage5](haskell/src/Stage5_ASM.hs): x86 ASM.

The expected output from each compiler stage is [here](compile-examples/expected/),

To run all tests, type `dune test`. (No output is good).

To build the compiler; compile the main `shell.fun` example; and run it, type `make`.
