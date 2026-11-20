# Sprint Contract: Farewell
**Change:** feat-farewell
**Date:** 2026-11-19
**Derived from:** specs/stories.md

## :cli
Evaluated at: e5e54f4c5bfaec871f396ac9b7c45e8f9e2e634c

- [x] `bash farewell.sh Ada` prints `Goodbye, Ada!` (test "says goodbye by name", `tests/test-farewell.sh`; observed by the evaluator)
- [x] `bash farewell.sh Ada` exits 0 (test "success exits 0"; observed rc=0)
- [x] No name: usage message on stderr, nothing on stdout (test "no name: usage on stderr, nothing on stdout"; observed `usage: farewell.sh <name>` on stderr)
- [x] No name exits 2 (test "no name exits 2"; observed rc=2)
- [x] Empty name: usage message on stderr, nothing on stdout (test "empty name: usage on stderr, nothing on stdout"; observed)
- [x] Empty name exits 2 (test "empty name exits 2"; observed rc=2)
- [x] Interface mirrors `greet.sh`: one required name argument, extra arguments exit 2 (test "extra argument exits 2")
- [x] Also update: nothing; `README.md`, `greet.sh`, `tests/test-greet.sh` and `.github/` unchanged (observed with `diff -r base head`, excluding `openspec/`)
- [x] `tests/test-farewell.sh` covers each acceptance criterion (7 checks, all passing)

Evidence: the evaluator's run on the exported head, `bash tests/run.sh` rc=0 (`PASS tests/test-farewell.sh`, `PASS tests/test-greet.sh`, `ran 2 test files`), plus direct runs of `farewell.sh`. Verdict: PASS.
