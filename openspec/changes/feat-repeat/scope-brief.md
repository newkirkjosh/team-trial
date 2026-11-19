### Scope Brief

- **Verbatim request:** "Once --shout is in, add --repeat N to greet.sh so the greeting prints N times; it should work together with --shout."
- **Interpreted scope:** `greet.sh` accepts `--repeat N` (N a positive integer) in any order with `--shout`, before the name, and prints the greeting line N times. New tests in `tests/test-greet.sh`.
- **Also update:** the usage comment at the top of `greet.sh`, the usage error message, and the README example block.
- **Deliverable type:** code
- **Explicitly out of scope:** `farewell.sh` (feat-farewell); changing how `--shout` behaves; CI changes.
- **Size signal:** narrow
- **Path:** bounded, one more flag on an existing script
- **Known-and-accepted:** a hand-written flag loop is fine for two flags.
