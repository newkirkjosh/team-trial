# Sprint contract: feat-welcome

## :cli
Evaluated at: bbc11dd7d3318280841f3a8d1fb508738faab7cb

- [x] Ada receives exactly `Welcome, Ada!` followed by newline, exit 0 — evaluator R1 (`tests/test-welcome.sh`) and R2 direct observation.
- [x] Missing name emits usage on stderr, empty stdout, exit 2 — evaluator R1 and R2.
- [x] Empty name emits usage on stderr, empty stdout, exit 2 — evaluator R1 and R2.
- [x] Excess arguments emit usage on stderr, empty stdout, exit 2 — evaluator R1 exit assertion and R2 full stream observation.

Evaluator R1: required bash syntax checks and `bash tests/run.sh`, exit 0, three test files, zero failures or skips; seven welcome assertions passed.
Evaluator R2: five independent direct invocations, exact stream bytes/status checked; zero failures/skips. Golden path, missing, empty, extra arguments and literal format characters passed.
Existing seven committed checks were preserved; test author and implementer confirmed they failed for missing `welcome.sh` before implementation.
VERDICT: PASS
