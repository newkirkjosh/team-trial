### Scope Brief

- **Verbatim request:** "Add a welcome.sh script that prints `Welcome, <name>!`, like farewell.sh does goodbye."
- **Interpreted scope:** a new `welcome.sh` mirroring `farewell.sh`'s interface (one required name argument, usage error exit 2), printing `Welcome, <name>!`, plus `tests/test-welcome.sh`.
- **Also update:** nothing else. Leave `README.md` alone: feat-thanks runs beside this change.
- **Deliverable type:** code
- **Explicitly out of scope:** `README.md`, `greet.sh`, `farewell.sh` and their tests; anything feat-thanks adds; flags on `welcome.sh`; CI changes (the workflow already checks every `*.sh` and runs every test file).
- **Size signal:** narrow
- **Path:** bounded, a new script copying an existing pattern
- **Known-and-accepted:** `welcome.sh` duplicates the argument check instead of sharing a helper.
