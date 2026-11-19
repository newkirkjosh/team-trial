#!/usr/bin/env bash
set -uo pipefail
cd "$(dirname "$0")/.."
fail=0
check() { # <description> <expected> <actual>
  if [ "$2" == "$3" ]; then echo "  ok: $1"; else echo "  not ok: $1 (expected '$2', got '$3')"; fail=1; fi
}

check "greets by name" "Hello, Ada!" "$(bash greet.sh Ada)"
bash greet.sh >/dev/null 2>&1; check "no name exits 2" "2" "$?"
bash greet.sh "" >/dev/null 2>&1; check "empty name exits 2" "2" "$?"

exit $fail
