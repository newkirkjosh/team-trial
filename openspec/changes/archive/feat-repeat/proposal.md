# Proposal: Repeat
**Change:** feat-repeat
**Story group:** Core Loop
**Date:** 2026-11-18

## Scope
Add `--repeat N` to `greet.sh`, combinable with `--shout`.

## Rationale
Users greeting a crowd want the line repeated.

## Out of scope
`farewell.sh`, changes to `--shout`'s behaviour, CI changes.

**Depends on:** feat-shout. This change extends the flag parsing that feat-shout adds to `greet.sh`, so it starts only after feat-shout is merged.
