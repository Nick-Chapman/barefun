## test

## Umbrella directory for testing.

Notes:
- The [compiler](../haskell/README.md) for the `.fun` language is written in haskell.
- Examples of `.fun` code can be found [here](examples/README.md).
- Since `.fun` is a subset of ocaml, we can leverage [ocaml](../ocaml/README.md) as our development environment.
- We test evaluation of the examples [here](evaluation/README.md), expecting identical results from the haskell interpreter(s) and direct ocaml execution.
- The generated ASM is embedded in the [runtime](../x86/runtime.asm) and compiled with `nasm`.

## Expected output from the compiler is [here](expected).
- we use the suffix `.ml` for stages 0--4, as the code is still vaguely ML-ish.
- we use the suffix `.asm` for stage 5.

By default we generate output for just stages 4 and 5. For some some examples, we generate all stages.
To see an example/stage not currently shown, update the control function:
`select_versions_for_example` [here](compile-examples/generate/main.ml), and run `dune test --auto-promote`.
