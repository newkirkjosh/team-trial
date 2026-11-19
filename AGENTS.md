# team-trial

A throwaway repository for trying the `dev` and `team` workflows end to end. The code is a tiny bash CLI, `greet.sh`. `CLAUDE.md` only imports this file.

## Testing

Completion criteria, run before every commit:

```bash
for f in *.sh tests/*.sh; do bash -n "$f" || exit 1; done
bash tests/run.sh
```

Every behaviour gets a test in `tests/test-<name>.sh` (plain bash, no framework, exits non-zero on failure). `tests/run.sh` runs them all and prints how many files ran.

## Verification

It is a CLI: verify a change by running the scripts directly (`bash greet.sh Ada`) from the exported tree. There is no app, device or external service.

## Tracker

GitHub issues on this repository, one issue per change.

## Layers

One layer, `:cli`: every change is one PR.

## Pull requests

Conventional-commit titles, squash merge only. Label: `enhancement`. No project board.

## Code review

Every change gets a converged cross-model review (`cross-review`) before it is merge-ready. There is no hosted reviewer on this repository: no CodeRabbit, no required human review.

Required checks, from the ruleset on `main`: `test` (the `ci` workflow). Required reviewers: none.

## Merge policy

An agent may squash-merge its own PR under `team` when every gate holds on the head commit, re-checked right before merging: the `test` check green, the cross-review converged, and no unresolved review thread. Hand the merge back to the user when the PR touches `.github/workflows/`, this Merge policy, or the Code review section of this file.
