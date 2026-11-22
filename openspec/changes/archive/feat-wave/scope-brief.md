### Scope Brief

- **Verbatim request:** "Add a wave.sh script that prints `*waves at <name>*`, like farewell.sh does goodbye."
- **Interpreted scope:** a new `wave.sh` mirroring `farewell.sh`'s interface (one required name argument, usage error exit 2), printing `*waves at <name>*`, plus `tests/test-wave.sh`.
- **Also update:** nothing else. Leave `README.md` alone.
- **Deliverable type:** code
- **Explicitly out of scope:** `README.md`, every other script and its tests, flags on `wave.sh`, CI changes (the workflow already checks every `*.sh` and runs every test file).
- **Size signal:** narrow
- **Path:** bounded, a new script copying an existing pattern
- **Known-and-accepted:** `wave.sh` duplicates the argument check instead of sharing a helper.
