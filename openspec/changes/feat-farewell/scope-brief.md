### Scope Brief

- **Verbatim request:** "Add a farewell.sh script that says goodbye to a name, like greet.sh does hello."
- **Interpreted scope:** a new `farewell.sh` mirroring `greet.sh`'s interface (one required name argument, usage error exit 2), printing `Goodbye, <name>!`, plus `tests/test-farewell.sh`.
- **Also update:** the README example block.
- **Deliverable type:** code
- **Explicitly out of scope:** `greet.sh` and its tests (feat-shout and feat-repeat change them; touching them here would conflict); flags on `farewell.sh`; CI changes (the workflow already checks every `*.sh` and runs every test file).
- **Size signal:** narrow
- **Path:** bounded, a new script copying an existing pattern
- **Known-and-accepted:** `farewell.sh` duplicates `greet.sh`'s argument check instead of sharing a helper; two scripts don't justify a library.
