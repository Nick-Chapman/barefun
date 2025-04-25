## test-evaluation

This directly contains Cram tests (`.t` files) for our [examples](../examples).
- The `.t` files show the expected output.
- Some tests are driven by a corresponding `.input` file.
- Tests are generally run using the ocaml system, and the haskell stage 5 interpreter.
- Run tests: `dune test`
- Update tests: `dune test --auto-promote`

TODO: rename directory to `test/evaluation`

TODO: add contents to init files where that makes sense
