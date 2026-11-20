# Specs: Farewell

## Story 1
When someone leaves, I want to say goodbye to them by name, so I can close the conversation politely.

### Acceptance criteria
- [ ] `bash farewell.sh Ada` prints `Goodbye, Ada!` and exits 0.
- [ ] `bash farewell.sh` with no name, or an empty name, prints a usage message to stderr and exits 2.
