### Scope Brief

- **Verbatim request:** "Add a nod.sh script that prints `*nods at <name>*`, like farewell.sh does goodbye."
- **Interpreted scope:** a new `nod.sh` mirroring `farewell.sh`'s interface (one required name argument, usage error exit 2), printing `*nods at <name>*`, plus `tests/test-nod.sh`.
- **Also update:** nothing else. Leave `README.md` alone: feat-wave may still be open beside this change.
- **Deliverable type:** code
- **Explicitly out of scope:** `README.md`, every other script and its tests, flags on `nod.sh`, CI changes (the workflow already checks every `*.sh` and runs every test file).
- **Size signal:** narrow
- **Path:** bounded, a new script copying an existing pattern
- **Known-and-accepted:** `nod.sh` duplicates the argument check instead of sharing a helper.
