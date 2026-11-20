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

check "--shout upper-cases the greeting" "HELLO, ADA!" "$(bash greet.sh --shout Ada 2>/dev/null)"
bash greet.sh --shout Ada >/dev/null 2>&1; check "--shout with name exits 0" "0" "$?"
bash greet.sh --shout >/dev/null 2>&1; check "--shout with no name exits 2" "2" "$?"
check "--shout with no name prints usage to stderr" "usage" "$(bash greet.sh --shout 2>&1 >/dev/null | head -c 5)"
check "--shout with no name prints nothing to stdout" "" "$(bash greet.sh --shout 2>/dev/null)"
bash greet.sh --whisper Ada >/dev/null 2>&1; check "unknown flag exits 2" "2" "$?"
check "unknown flag prints usage to stderr" "usage" "$(bash greet.sh --whisper Ada 2>&1 >/dev/null | head -c 5)"
check "unknown flag prints nothing to stdout" "" "$(bash greet.sh --whisper Ada 2>/dev/null)"
bash greet.sh --whisper >/dev/null 2>&1; check "unknown flag alone exits 2" "2" "$?"
check "unknown flag alone prints nothing to stdout" "" "$(bash greet.sh --whisper 2>/dev/null)"

for args in "--shout --whisper" "--shout --shout" "--shout -x"; do
  # shellcheck disable=SC2086
  bash greet.sh $args >/dev/null 2>&1; check "'$args' exits 2" "2" "$?"
  # shellcheck disable=SC2086
  check "'$args' prints usage to stderr" "usage" "$(bash greet.sh $args 2>&1 >/dev/null | head -c 5)"
  # shellcheck disable=SC2086
  check "'$args' prints nothing to stdout" "" "$(bash greet.sh $args 2>/dev/null)"
done

exit $fail
