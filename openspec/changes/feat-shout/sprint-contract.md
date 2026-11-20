# Sprint Contract: Shout
**Change:** feat-shout
**Date:** 2026-11-19
**Derived from:** specs/stories.md

## :cli
Evaluated at: 0bef318e00d20546b2ba0bbd416822e67fd1eeaf

- [x] `bash greet.sh --shout Ada` prints `HELLO, ADA!` and exits 0 — tests "--shout upper-cases the greeting", "--shout with name exits 0", tests/test-greet.sh; observed rc=0
- [x] `bash greet.sh Ada` still prints `Hello, Ada!` — test "greets by name"; observed
- [x] `bash greet.sh --shout` with no name prints usage to stderr, nothing to stdout, and exits 2 — tests "--shout with no name exits 2", "prints usage to stderr", "prints nothing to stdout"; observed rc=2
- [x] An unknown flag (`bash greet.sh --whisper Ada`) prints usage to stderr, nothing to stdout, and exits 2 — tests "unknown flag exits 2", "prints usage to stderr", "prints nothing to stdout"; observed rc=2
- [x] Unknown-flag edge cases (flag alone, `--shout --whisper`, `--shout --shout`, `--shout -x`) exit 2 with usage on stderr and nothing on stdout — "unknown flag alone" tests and the loop tests in tests/test-greet.sh
- [x] Also update: usage comment at the top of `greet.sh` reads `# Usage: greet.sh [--shout] <name>` — observed (no test covers a comment)
- [x] Also update: usage error message reads `usage: greet.sh [--shout] <name>` — observed on stderr
- [x] Also update: README example block shows `bash greet.sh --shout Ada  # HELLO, ADA!` — observed
- [x] Tests in `tests/test-greet.sh` cover each acceptance criterion — observed
- [x] Out of scope respected: no `farewell.sh` and no `--repeat` in head — observed

Evidence: fresh evaluator run on the history-free export of 0bef318; `bash tests/run.sh` printed 22 `ok`, `PASS tests/test-greet.sh`, `ran 1 test files`, rc=0. Bash 3.2 compatibility (review finding F2) is not verified by execution: no Bash 3.2 binary on this host.
