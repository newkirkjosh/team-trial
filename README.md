# team-trial

A throwaway repository for trying the `dev` and `team` workflows end to end. The code is a tiny greeting CLI; `greet.sh` requires Bash 4 or later.

```bash
bash greet.sh Ada     # Hello, Ada!
bash greet.sh --shout Ada  # HELLO, ADA!
bash greet.sh --repeat 2 --shout Ada  # HELLO, ADA! twice
bash tests/run.sh     # run the tests
```
