## Barefun compiler

- Code in [src](src).
- Executable entry point: [app/main.hs](app/main.hs).
- See [dune](dune) wrapper for `stack build`.
- To run: `dune exec -- ./main.exe <example.fun>`

### Behaviour:
- Compiles a single `.fun` file to x86 `.asm` code, via a sequence of compilation stages.
- By default, we compile all the way to stage 5 (ASM).
- Command line flags `-0|-1|-2|-3|-4|-5` limit the final stage of the compile pipeline.
- By default, the compiled code is evaluated using a haskell interpreter for that stage.
- To instead emit the code to stdout, use the flag `-compile`.

### Compilation phases
- [Stage0](src/Stage0_AST.hs): AST
- [Stage1](src/Stage1_EXP.hs): Simplified expression language.
- [Stage2](src/Stage2_NBE.hs): Normalization by Evaluation. (Inlining & Constant Folding).
- [Stage3](src/Stage3_ANF.hs): A-normal form.
- [Stage4](src/Stage4_CCF.hs): Closure converted form.
- [Stage5](src/Stage5_ASM_AbstractSyntax.hs): x86 ASM.
[compiler](src/Stage5_ASM_Compiler.hs)
[emulation](src/Stage5_ASM_Emulation.hs)
