# barefun

The goal of this project is to write a small "operating system" to run on bare metal x86.

- The WIP [operating system](test/examples/sham.fun) is implemented in an ocaml-style language (`.fun`).
- The WIP [compiler](haskell/README.md) for the ocaml-style language is written in haskell.

Programming of the operating system & compiler are proceeding in tandem!

- Examples of `.fun` code can be found [here](test/examples/README.md).
- Since `.fun` is a subset of ocaml, we can leverage [ocaml](ocaml/README.md) as our development environment.
- We test evaluation of the examples [here](test-evaluation/README.md), expecting identical results from the haskell interpreter(s) and direct ocaml execution.
- The generated ASM is embedded in the [runtime](x86/runtime.asm) and compiled with `nasm`.
- The images produced from `nasm` can be run by `qemu`.

## Expected output from the compiler is [here](test/expected).
- we use the suffix `.ml` for stages 0--4, as the code is still vaguely ML-ish.
- we use the suffix `.asm` for stage 5.

By default we generate output for just stages 4 and 5. For some some examples, we generate all stages.
To see an example/stage not currently shown, update the control function:
`select_versions_for_example` [here](test/compile-examples/generate/main.ml), and run `dune test --auto-promote`.

## Pre-requisites

Ocaml (dune), haskell (stack), nasm, qemu : TODO: detailed instructions

## Build/Test

- To build everything: `dune build`.
- To run all tests:`dune test`.
- Try `make` to build/run the `sham` example.
- WIP: Examples can be run under `qemu`: i.e. `dune build @small.qemu`

## Running the compiler

TODO: write/doc standalone script

TODO: explain the dune-based development environment
