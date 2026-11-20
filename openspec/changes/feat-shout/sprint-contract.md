# Sprint Contract: Shout
**Change:** feat-shout
**Date:** 2026-11-19
**Derived from:** specs/stories.md

## :cli
Evaluated at: 8840c971fe4eea27b13adafdc28e3b9d3fdcccb4

- [x] `bash greet.sh --shout Ada` prints `HELLO, ADA!` — test "--shout upper-cases the greeting", tests/test-greet.sh; observed in the evaluator's run
- [x] `bash greet.sh --shout Ada` exits 0 — test "--shout with name exits 0"; observed rc=0
- [x] `bash greet.sh Ada` still prints `Hello, Ada!` — test "greets by name"; observed
- [x] `bash greet.sh --shout` with no name prints usage to stderr and exits 2 — tests "--shout with no name exits 2", "prints usage to stderr", "prints nothing to stdout"; observed rc=2
- [x] An unknown flag (`bash greet.sh --whisper Ada`) prints usage to stderr and exits 2 — tests "unknown flag exits 2", "prints usage to stderr", "prints nothing to stdout"; observed rc=2
- [x] Also update: usage comment at the top of `greet.sh` reads `# Usage: greet.sh [--shout] <name>` — observed (no test covers a comment)
- [x] Also update: usage error message reads `usage: greet.sh [--shout] <name>` — observed on stderr (tests check only the `usage` prefix)
- [x] Also update: README example block shows `bash greet.sh --shout Ada  # HELLO, ADA!` — observed

Evidence: evaluator run on the history-free export of 8840c97; `bash tests/run.sh` printed 13 `ok`, `PASS tests/test-greet.sh`, `ran 1 test files`, rc=0.
