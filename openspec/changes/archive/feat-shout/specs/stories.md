# Specs: Shout

## Story 1
When I greet someone with `--shout`, I want the greeting in upper case, so I can greet them emphatically.

### Acceptance criteria
- [ ] `bash greet.sh --shout Ada` prints `HELLO, ADA!` and exits 0.
- [ ] `bash greet.sh Ada` still prints `Hello, Ada!`.
- [ ] `bash greet.sh --shout` with no name prints the usage message to stderr and exits 2.
- [ ] An unknown flag (`bash greet.sh --whisper Ada`) prints the usage message to stderr and exits 2.
