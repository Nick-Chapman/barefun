run: sham

sham:
	dune exec haskell/main.exe -- examples/sham.fun

# WIP filesystem. still working at level of ocaml
fs:
	dune exec ocaml/bin/main.exe -- Filesystem
