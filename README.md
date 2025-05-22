# barefun

The goal of this project is to write a small _operating system_ to run on bare metal x86.

- The _operating system_ is implemented in `fun`, an ocaml-style language.
- The _compiler_ for `fun` is written in haskell.

Development of the operating system & compiler are proceeding in tandem!

## Prerequisites

- [haskell](https://www.haskell.org) : To build the Barefun compiler which generates x86 ASM.
- [nasm](https://www.nasm.us/) : Assembly of the generated x86 and the Barefun runtime.
- [qemu](https://www.qemu.org/) : Emulation of assembled i386 image.
- (optional) [ocaml](https://ocaml.org) : `.fun` development.
- (optional) [dune](https://dune.build/install) : Barefun development and testing.

### Running an example:

There are four steps:
- Build the barefun compiler.
- Compile a barefun program `.fun`, generating an `.asm`.
- Use `nasm` to assemble the `.asm` (together with `runtime.asm`) to generate an `.img` file.
- Use `qemu` to emulate the generated `.img`.

Here are the four steps for the [hello.fun](examples/hello.fun) example:
```
dune build @all @runtest
dune exec -- haskell/main.exe examples/hello.fun -compile > hello.asm
nasm -Werror -i x86 -dCODE="'hello.asm'" x86/runtime.asm -o hello.image
qemu-system-i386 hello.image
```

- The full pipeline (build;compile;nasm;qemu) is automated as `dune build @hello`. Any example in [examples](examples) can be run this way.

- Alternatively, the barefun compiler can be build and run using just the haskell tool chain; avoiding `ocaml`/`dune`. The `nasm` and `qemu` steps are unchanged.
```
(cd haskell; stack run -- main.exe ../examples/hello.fun -compile) > hello.asm
```

- To boot on real hardware, the image file can be written to a USB stick using `dd`.

- During development, we can avoid the `nasm` and `qemu` steps, running a barefun program by
using an emulator contained within the barefun compiler. Just omit the `-compile` flag.
```
dune exec -- haskell/main.exe examples/hello.fun
```

- We can even omit the barefun compiler stage, running a barefun program _as if_ it were an ocaml program.
This works for any example in [examples](examples).
```
dune exec -- ocaml/main.exe Hello
```

### Milestone #1

As of Saturday 26th April 2025, we can compile and run the
[sham](examples/sham.fun) demo -- a toy shell with a fake in-memory filesystem.
Try: `dune build @sham`. Then perhaps `ls`; `cat readme`.
There is no garbage collection yet; we get `[OOM]` rather soon.
It might take a few restarts to find the hidden easter egg.

### Milestone #2

As of Saturday 10 May 2025, we have a garbage collector!
Run: `dune build @sham`. Then perhaps `fib 20`

### Milestone #3

As of Monday 19 May 2025, a new example that implements a small "real" [filesystem](examples/filesystem.fun) runs in qemu.
The filesystem is real in the sense that it reads from and writes to disk sectors, providing persistence.
The filesystem is embeded within the same image as the nasm assembled code,
so to preserve changes we must generate the image only once.
```
dune exec -- haskell/main.exe examples/filesystem.fun -compile > filesystem.asm
nasm -Werror -i x86 -dCODE="'filesystem.asm'" x86/runtime.asm -o filesystem.image
qemu-system-i386 filesystem.image
```

Interact with the filesystem explorer:
```
Filesystem explorer
Commands: wipe dump format mount unmount debug ls create append splat rm cat
1> mount
2> ls
file#0 : 75
file#1 : 112
file#2 : 131
file#3 : 145
file#4 : 95
3> cat 0
Here are some poems and aphorisms.
Please add some more if there is space.
4> create
Creating file#5; (to finish type ^D)
If it was hard to write it should be hard to understand.
^D
5> cat 5
If it was hard to write it should be hard to understand.
6> ^D
exiting
[HALT]
```

Restart the filesystem explorer `qemu-system-i386 filesystem.image`; see the file:
```
Filesystem explorer
Commands: wipe dump format mount unmount debug ls create append splat rm cat
1> mount
2> cat 5
If it was hard to write it should be hard to understand.
```

## More

More infomation is available in subdirectory `README`s:
- About the compiler [haskell](./haskell/README.md)
- About the testing infrastructure [test](./test/README.md)
- About the development infrastructure [ocaml](./ocaml/README.md)
