# barefun

Functional language system on baremetal. WIP

Driving example: `example.fun`

- Can be execute directly by treating example code as ocaml.
- Can be via using haskell-coded interpreter.

```
(cd ocaml; dune build -w)
(cd haskell; ghcid)

(cd ocaml; dune exec bin/main.exe)
(cd haskell; stack run)

cat sample.input | (cd ocaml; dune exec bin/main.exe)
cat sample.input | (cd haskell; stack run)

watch -n 1 'cat sample.input | (cd ocaml; dune exec bin/main.exe)'
watch -n 1 'cat sample.input | (cd haskell; stack run)'
```
