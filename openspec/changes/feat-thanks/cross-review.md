# Cross-review: Thanks

reviewer=claude mode=change base=origin/main merge_base=e99b72614c25b1743e6921c79b959cc2903dbec9 head=e893df2e251f7989428f0d99e9a39e2e2b2c968f
I found no blocking findings. This was a code-reading review only: I didn't run the scripts or tests, because the review was read-only.

What I checked:
- **The script:** `thanks.sh:1-11` is a line-for-line copy of `farewell.sh`, changing only the usage name, the comment and the greeting text. It checks for exactly one non-empty argument and prints the usage message to stderr with exit 2 if that fails. Otherwise it prints `printf 'Thank you, %s!\n' "$1"`. Passing the name as an argument to `printf`, rather than putting it in the format string, means names containing format characters print literally.
- **The story** (`openspec/changes/feat-thanks/specs/stories.md:7-8`):
  - `bash thanks.sh Ada` printing `Thank you, Ada!` with exit 0 is covered by `tests/test-thanks.sh:16-17`.
  - No name or an empty name giving usage on stderr with exit 2 is covered by `tests/test-thanks.sh:18-21`.
- **The test runner:** `tests/run.sh:7` runs every `tests/test-*.sh`, so the new test file is picked up.
- **Scope:** the diff touches only `thanks.sh`, `tests/test-thanks.sh` and the feat-thanks OpenSpec files (`issues.md`, `sprint-contract.md`). `README.md`, `greet.sh`, `farewell.sh` and CI are unchanged.
REVIEWER_EXIT=0
STATUS=COMPLETED
