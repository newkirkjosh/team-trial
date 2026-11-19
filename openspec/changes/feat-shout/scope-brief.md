### Scope Brief

- **Verbatim request:** "Add a --shout flag to greet.sh that prints the greeting in upper case."
- **Interpreted scope:** `greet.sh` accepts an optional `--shout` flag before the name; with it, the whole greeting line is upper case. New tests in `tests/test-greet.sh`.
- **Also update:** the usage comment at the top of `greet.sh`, the usage error message, and the README example block.
- **Deliverable type:** code
- **Explicitly out of scope:** any other flag (`--repeat` is the separate change feat-repeat, which builds on this one); `farewell.sh` (feat-farewell); CI changes (the workflow already runs every test file).
- **Size signal:** narrow
- **Path:** bounded, one flag on an existing script
- **Known-and-accepted:** flags are parsed by hand, with no getopts; that is fine for one flag.
