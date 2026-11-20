# Sprint Contract: Shout
**Change:** feat-shout
**Date:** 2026-11-19
**Derived from:** specs/stories.md

## :cli
Evaluated at: 05074acb1edde4e17bd92f8f5fb448944971f0f0

- [x] `bash greet.sh --shout Ada` prints `HELLO, ADA!` and exits 0 — tests "--shout upper-cases the greeting", "--shout with name exits 0", tests/test-greet.sh; observed rc=0
- [x] `bash greet.sh Ada` still prints `Hello, Ada!` — test "greets by name"; observed
- [x] `bash greet.sh --shout` with no name prints usage to stderr and exits 2 — tests "--shout with no name exits 2", "prints usage to stderr", "prints nothing to stdout"; observed rc=2
- [x] An unknown flag (`bash greet.sh --whisper Ada`) prints usage to stderr and exits 2 — tests "unknown flag exits 2", "prints usage to stderr", "prints nothing to stdout", plus the `--shout --whisper`, `--shout --shout`, `--shout -x` loop; observed rc=2
- [x] Also update: usage comment at the top of `greet.sh` reads `# Usage: greet.sh [--shout] <name>` — observed (no test covers a comment)
- [x] Also update: usage error message reads `usage: greet.sh [--shout] <name>` — observed on stderr (tests check only the `usage` prefix)
- [x] Also update: README example block shows `bash greet.sh --shout Ada  # HELLO, ADA!` — observed
- [x] Out of scope respected: only `greet.sh`, `README.md` and `tests/test-greet.sh` differ from base outside `openspec/`; `.github` identical — observed with `diff -r`

Evidence: fresh evaluator run on the history-free export of 05074ac; `bash tests/run.sh` printed 22 `ok`, `PASS tests/test-greet.sh`, `ran 1 test files`, rc=0.
