# barefun

The goal of this project is to write a small _operating system_ to run on bare metal x86.

- The _operating system_ is implemented in `fun`, an ocaml-style language.
- The _compiler_ for `fun` is written in haskell.

Development of the operating system & compiler are proceeding in tandem!

## Prerequisites

If you have [Nix](https://nixos.org/) an [direnv](https://direnv.net/), you can
just run `direnv allow` and be good to go. Otherwise, you'll have to manually
install the following, and possibly some of their dependencies.

- [haskell](https://www.haskell.org) : To build the Barefun compiler which generates x86 ASM.
- [nasm](https://www.nasm.us/) : Assembly of the generated x86 and the Barefun runtime.
- [qemu](https://www.qemu.org/) : Emulation of assembled i386 image.
- (optional) [ocaml](https://ocaml.org) : `.fun` development.
- (optional) [dune](https://dune.build/install) : Barefun development and testing.

## Milestone #1

As of Saturday 26th April 2025, we can compile and run the
[sham](test/examples/sham.fun) demo -- a toy shell with a fake in-memory filesystem.

```
dune build @all @runtest
dune exec -- haskell/main.exe test/examples/sham.fun -compile > code
nasm -Werror -dCODE="'code'" x86/runtime.asm -o image
qemu-system-i386 image
```

- To boot on real hardware, `image` can be written to USB: `dd if=image of=/dev/sda`.

- The full pipeline (build;compile;nasm;qemu) is automated as `dune build @sham`. (The image ends up here: `_build/default/test/images/gen/sham.img`)

- Any example in [test/examples](test/examples) can be run this way. Perhaps [hello.fun](test/examples/hello.fun) by `dune build @hello -w`. Here we add the `-w` flag for interactive rebuild.

- Alternatively, the Barefun compiler can be build and run using just the haskell tool chain; avoiding `ocaml`/`dune`. The `nasm` and `qemu` steps are unchanged.

```
(cd haskell; stack build)
(cd haskell; stack run -- main.exe ../test/examples/sham.fun -compile) > code
```

More info available in subdirectory `README`s:
[haskell](./haskell/README.md)
[test](./test/README.md)
[ocaml](./ocaml/README.md)
