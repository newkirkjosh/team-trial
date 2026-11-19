# Specs: Repeat

## Story 1
When I greet a crowd, I want the greeting repeated N times, so everyone hears it.

### Acceptance criteria
- [ ] `bash greet.sh --repeat 3 Ada` prints `Hello, Ada!` on three lines and exits 0.
- [ ] `bash greet.sh --repeat 2 --shout Ada` and `bash greet.sh --shout --repeat 2 Ada` both print `HELLO, ADA!` on two lines.
- [ ] `--repeat` with a missing, zero, negative or non-numeric count prints the usage message to stderr and exits 2.
- [ ] Without `--repeat`, output is unchanged (one line).
