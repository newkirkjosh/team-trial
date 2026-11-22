# Sprint Contract: Nod
**Change:** feat-nod
**Date:** 2026-11-22
**Derived from:** specs/stories.md

## :cli
Evaluated at: 855584f04f385bb18d454408aad9ded6f1249f11
Evaluator run: agent a71fd1eb5b4fcfaec (independent plain exports; no history).

- [x] `bash nod.sh Ada` prints `*nods at Ada*` — PASS: `nods at name`, `tests/test-nod.sh`; direct CLI output observed.
- [x] `bash nod.sh Ada` exits 0 — PASS: `success exits 0`, `tests/test-nod.sh`; observed rc=0.
- [x] No name: usage on stderr, nothing on stdout, exit 2 — PASS: no-name tests, `tests/test-nod.sh`; observed `usage: nod.sh <name>`, rc=2.
- [x] Empty name: usage on stderr, nothing on stdout, exit 2 — PASS: empty-name tests, `tests/test-nod.sh`; observed rc=2.
- [x] Interface mirrors `farewell.sh` (exactly one name; an extra argument exits 2) — PASS: `extra argument exits 2`, `tests/test-nod.sh`; argument check identical to `farewell.sh`.
- [x] A test exists for each acceptance criterion — PASS: `tests/test-nod.sh`, 7 checks, all ok.
- [x] Nothing else changed; `README.md` untouched — PASS: `diff -rq base head` shows only `nod.sh`, `tests/test-nod.sh` and the change folder's `issues.md` as new; no base file modified.

Verification: repository syntax command exited 0; `bash tests/run.sh` ran 5 test files, all PASS (test-nod.sh 7 ok), rc=0. Red evidence (coordinator's own run at 8e6adc6, before nod.sh existed): all 7 test-nod.sh checks failed, rc=1.
