# Sprint Contract: Thanks
**Change:** feat-thanks
**Date:** 2026-11-21
**Derived from:** specs/stories.md

## :cli
Evaluated at: f6e1262a999a43adbd46697b3759dc5aa4fa40b1
Evaluator run: evaluator_thanks (independent plain exports; no history).

- [x] A named thank-you prints `Thank you, Ada!` and exits 0 — PASS: `thanks by name` and `success exits 0`, `tests/test-thanks.sh`; direct CLI bytes matched.
- [x] A missing name emits usage on stderr, empty stdout, and exits 2 — PASS: missing-name tests and direct CLI observation.
- [x] An empty name emits usage on stderr, empty stdout, and exits 2 — PASS: empty-name tests and direct CLI observation.
- [x] Exactly one argument is required, matching the farewell interface — PASS: extra-argument test and direct CLI observation.
- [x] `tests/test-thanks.sh` covers the acceptance criteria — PASS: inspected and freshly executed by the full runner.

Verification: repository syntax command exited 0; `bash tests/run.sh` executed three test files with zero failures or skips. Direct CLI checks covered named, missing, empty and extra arguments, spaces, format characters and a literal flag-shaped name. No processes remained after evaluation.
