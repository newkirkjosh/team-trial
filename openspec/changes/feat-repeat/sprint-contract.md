# Sprint Contract: Repeat
**Change:** feat-repeat
**Date:** 2026-11-19
**Derived from:** specs/stories.md

## :cli
Evaluated at: eacb887d17459b3c5f4d3a6852bfc1d7a8ce4393

- [x] `bash greet.sh --repeat 3 Ada` prints `Hello, Ada!` on three lines and exits 0 — tests "--repeat 3 prints the greeting three times", "--repeat 3 with name exits 0", "--repeat 3 prints exactly three lines" in tests/test-greet.sh; observed
- [x] `bash greet.sh --repeat 2 --shout Ada` prints `HELLO, ADA!` on two lines — test "--repeat 2 --shout prints the shouted greeting twice" and its exit-0 test
- [x] `bash greet.sh --shout --repeat 2 Ada` prints `HELLO, ADA!` on two lines — test "--shout --repeat 2 prints the shouted greeting twice" and its exit-0 test; observed
- [x] `--repeat` with a missing count prints usage to stderr, nothing to stdout, and exits 2 — tests "--repeat with no count and no name", "--repeat with no count (name follows)", "--shout --repeat with no count"
- [x] `--repeat 0` prints usage to stderr, nothing to stdout, and exits 2 — test "--repeat 0"; observed
- [x] `--repeat -1` prints usage to stderr, nothing to stdout, and exits 2 — test "--repeat -1"; observed
- [x] Non-numeric counts (`abc`, `2x`, `1.5`, empty) print usage to stderr, nothing to stdout, and exit 2 — the `repeat_usage_case` tests for those inputs
- [x] Without `--repeat`, output is one line — test "without --repeat prints exactly one line"; observed
- [x] Also update: usage comment at the top of `greet.sh` reads `# Usage: greet.sh [--shout] [--repeat N] <name>` and describes `--repeat` — observed (no test covers a comment)
- [x] Also update: usage error message reads `usage: greet.sh [--shout] [--repeat N] <name>` — observed; tests check the `usage` prefix and that it mentions `--repeat`
- [x] Also update: README example block shows `bash greet.sh --repeat 2 --shout Ada  # HELLO, ADA! twice` — observed
- [x] Out of scope respected: `farewell.sh` identical to base, existing `--shout` tests pass, no CI change — `cmp` against base export; only `greet.sh`, `README.md`, `tests/test-greet.sh` and the change folder differ

Evidence: fresh evaluator run on the history-free export of eacb887; `bash -n` clean on every script; `bash tests/run.sh` printed `PASS tests/test-farewell.sh`, `PASS tests/test-greet.sh`, `ran 2 test files`, exit 0, no `not ok`. Observed beyond the stories, not contract items: `--repeat 08` prints 8 lines (decimal, not octal); a duplicate `--repeat` and a count over 18 digits exit 2 with usage (untested).
