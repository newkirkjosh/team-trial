### Scope Brief

- **Verbatim request:** "Add a thanks.sh script that prints `Thank you, <name>!`, like farewell.sh does goodbye."
- **Interpreted scope:** a new `thanks.sh` mirroring `farewell.sh`'s interface (one required name argument, usage error exit 2), printing `Thank you, <name>!`, plus `tests/test-thanks.sh`.
- **Also update:** nothing else. Leave `README.md` alone: feat-welcome runs beside this change.
- **Deliverable type:** code
- **Explicitly out of scope:** `README.md`, `greet.sh`, `farewell.sh` and their tests; anything feat-welcome adds; flags on `thanks.sh`; CI changes (the workflow already checks every `*.sh` and runs every test file).
- **Size signal:** narrow
- **Path:** bounded, a new script copying an existing pattern
- **Known-and-accepted:** `thanks.sh` duplicates the argument check instead of sharing a helper.
