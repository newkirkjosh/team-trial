#!/usr/bin/env bash
set -uo pipefail
cd "$(dirname "$0")/.."
fail=0
check() { # <description> <expected> <actual>
  if [ "$2" == "$3" ]; then echo "  ok: $1"; else echo "  not ok: $1 (expected '$2', got '$3')"; fail=1; fi
}

usage_only() { # <args...>: prints "<stdout>|<first 6 chars of stderr>"
  local out err
  out="$(bash nod.sh "$@" 2>/dev/null)"
  err="$(bash nod.sh "$@" 2>&1 >/dev/null)"
  echo "${out}|${err:0:6}"
}

check "nods at name" "*nods at Ada*" "$(bash nod.sh Ada 2>/dev/null)"
bash nod.sh Ada >/dev/null 2>&1; check "success exits 0" "0" "$?"
check "no name: usage on stderr, nothing on stdout" "|usage:" "$(usage_only)"
check "empty name: usage on stderr, nothing on stdout" "|usage:" "$(usage_only "")"
bash nod.sh >/dev/null 2>&1; check "no name exits 2" "2" "$?"
bash nod.sh "" >/dev/null 2>&1; check "empty name exits 2" "2" "$?"
bash nod.sh Ada Bob >/dev/null 2>&1; check "extra argument exits 2" "2" "$?"

exit $fail
