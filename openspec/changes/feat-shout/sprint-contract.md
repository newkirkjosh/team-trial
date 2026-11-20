# Sprint Contract: Shout
**Change:** feat-shout
**Date:** 2026-11-19
**Derived from:** specs/stories.md

## :cli
Evaluated at: 6aa851f8d8d41168b4c32ca3e8d48f6ba12da234

- [x] `bash greet.sh --shout Ada` prints `HELLO, ADA!` and exits 0 — tests "--shout upper-cases the greeting", "--shout with name exits 0", tests/test-greet.sh; observed rc=0
- [x] `bash greet.sh Ada` still prints `Hello, Ada!` — test "greets by name"; observed
- [x] `bash greet.sh --shout` with no name prints usage to stderr, nothing to stdout, and exits 2 — tests "--shout with no name exits 2", "prints usage to stderr", "prints nothing to stdout"; observed rc=2
- [x] An unknown flag (`bash greet.sh --whisper Ada`) prints usage to stderr, nothing to stdout, and exits 2 — tests "unknown flag exits 2", "prints usage to stderr", "prints nothing to stdout"; observed rc=2
- [x] Unknown-flag edge cases (flag alone, `--shout --whisper`, `--shout --shout`, `--shout -x`) exit 2 with usage on stderr and nothing on stdout — "unknown flag alone" tests and the loop tests in tests/test-greet.sh
- [x] Non-ASCII names are upper-cased in a UTF-8 locale (`LC_ALL=C.UTF-8 bash greet.sh --shout José` prints `HELLO, JOSÉ!`) — test "--shout upper-cases non-ASCII letters in a UTF-8 locale"; observed
- [x] Also update: usage comment at the top of `greet.sh` reads `# Usage: greet.sh [--shout] <name>` and states `# Requires Bash 4 or later.` — observed (no test covers a comment)
- [x] Also update: usage error message reads `usage: greet.sh [--shout] <name>` — observed on stderr (tests check the `usage` prefix only)
- [x] Also update: README example block shows `bash greet.sh --shout Ada  # HELLO, ADA!` and the README states `greet.sh` requires Bash 4 or later — observed
- [x] Out of scope respected: no other flag, no CI change — observed

Evidence: fresh evaluator run on the history-free export of 6aa851f; `bash -n` clean on every script; `bash tests/run.sh` printed `PASS tests/test-farewell.sh`, `PASS tests/test-greet.sh`, `ran 2 test files`, no `not ok`. Bash 5.3.15. Bash 3.2 is unsupported by user decision (scope brief, Known-and-accepted).
