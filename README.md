# barefun

The goal of this project is to write a small _operating system_ to run on bare metal x86.

- The _operating system_ will be implemented in an ocaml-style language (`.fun`).
- The _compiler_ for the `.fun` language is written in haskell.

Programming of the operating system & compiler are proceeding in tandem!

## Prerequisites

- [haskell](https://www.haskell.org) : To build the Barefun compiler which generates x86 ASM.
- [ocaml](https://ocaml.org) : `.fun` development.
- [dune](https://dune.build/install) (ocaml build system) : Barefun development and testing.
- [nasm](https://www.nasm.us/) : Assembly of the generated x86 and the Barefun runtime.
- [qemu](https://www.qemu.org/) : Emulation of assembled i386 image.

## Milestone #1

As of Saturday 26th April 2025, we can compile and run the
[sham](test/examples/sham.fun) demo -- a toy shell with a fake in-memory filesystem.

```
dune build @all @runtest
dune exec -- haskell/main.exe test/examples/sham.fun -compile > code
nasm -Werror -dCODE="'code'" x86/runtime.asm -o image
qemu-system-i386 image
```

Or burned to a USB stick: `dd if=image of=/dev/sda`.

## Dev

- The [compiler](haskell/README.md) for the `.fun` language is written in haskell.
- Examples of `.fun` code can be found [here](test/examples/README.md).
- Since `.fun` is a subset of ocaml, we can leverage [ocaml](ocaml/README.md) as our development environment.
- We test evaluation of the examples [here](test/evaluation/README.md), expecting identical results from the haskell interpreter(s) and direct ocaml execution.
- The generated ASM is embedded in the [runtime](x86/runtime.asm) and compiled with `nasm`.
- The images produced from `nasm` can be run by `qemu`.

## Expected output from the compiler is [here](test/expected).
- we use the suffix `.ml` for stages 0--4, as the code is still vaguely ML-ish.
- we use the suffix `.asm` for stage 5.

By default we generate output for just stages 4 and 5. For some some examples, we generate all stages.
To see an example/stage not currently shown, update the control function:
`select_versions_for_example` [here](test/compile-examples/generate/main.ml), and run `dune test --auto-promote`.

TODO: explain the dune-based development environment
