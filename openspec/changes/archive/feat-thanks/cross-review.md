# Cross-review: Thanks

reviewer=claude mode=change base=origin/main merge_base=fe8ddad73d80d31473252f47684ea9c656f30c3e head=fef114c79e3aef0b5b885ed8c1ebd0c027c064b7
I found no blocking findings. This was a code-reading review only: I didn't run the scripts or tests, because the review was read-only.

What I checked:
- **The script:** `thanks.sh:1-11` is `farewell.sh:1-11` with only the usage name, the comment and the greeting text changed. It checks for exactly one non-empty argument. If that fails, it prints the usage message to stderr and exits 2. Otherwise it runs `printf 'Thank you, %s!\n' "$1"`, so a name containing format characters prints as typed.
- **The story** (`openspec/changes/archive/feat-thanks/specs/stories.md:7-8`):
  - `bash thanks.sh Ada` printing `Thank you, Ada!` with exit 0 is covered by `tests/test-thanks.sh:16-17`.
  - No name or an empty name giving usage on stderr with exit 2 is covered by `tests/test-thanks.sh:18-21`.
  - `tests/test-thanks.sh:22` also checks that an extra argument exits 2, matching `farewell.sh`.
- **The test runner:** `tests/run.sh:7` runs every `tests/test-*.sh`, so the new test file is picked up.
- **After the merge with feat-welcome:** the thanks and welcome OpenSpec records sit in separate `archive/` folders, so no paths collide. Nothing in the diff touches `README.md`, `greet.sh`, `farewell.sh`, `tests/run.sh` or CI.
REVIEWER_EXIT=0
STATUS=COMPLETED
