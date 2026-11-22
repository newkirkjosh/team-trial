# Sprint Contract: Wave
**Change:** feat-wave
**Date:** 2026-11-22
**Derived from:** specs/stories.md

## :cli
Evaluated at: b2e3b9dcef1570b30b976fddd2fb5bd88bec3864
Evaluator run: agent acc7ac81413ed45ce (independent plain exports; no history).

- [x] `bash wave.sh Ada` prints exactly `*waves at Ada*` — PASS: `waves by name`, `tests/test-wave.sh`; direct CLI output observed.
- [x] `bash wave.sh Ada` exits 0 — PASS: `success exits 0`, `tests/test-wave.sh`; observed rc=0.
- [x] No name: usage on stderr, nothing on stdout, exit 2 — PASS: no-name tests, `tests/test-wave.sh`; observed `usage: wave.sh <name>`, rc=2.
- [x] Empty name: usage on stderr, nothing on stdout, exit 2 — PASS: empty-name tests, `tests/test-wave.sh`; observed rc=2.
- [x] Interface mirrors `farewell.sh` (exactly one name; an extra argument exits 2) — PASS: `extra argument exits 2`, `tests/test-wave.sh`; observed rc=2.
- [x] `tests/test-wave.sh` is plain bash and exits non-zero on failure — PASS: inspected; run by `tests/run.sh`.
- [x] Nothing else changed; `README.md` untouched — PASS: base/head export comparison shows only `wave.sh`, `tests/test-wave.sh` and the change folder's `issues.md` as new.

Verification: repository syntax command exited 0; `bash tests/run.sh` ran 5 test files, all PASS (test-wave.sh 7 ok, 0 not ok). Red evidence (coordinator's own run at d41ad91, before wave.sh existed): all 7 test-wave.sh checks failed, rc=1.

Cross-review: codex, 1 pass(es), converged at d088ea7
