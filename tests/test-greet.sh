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

# Non-ASCII: bytes are spelled as escapes so the test file's own locale cannot garble them.
# name = "José" (e-acute is C3 A9); expected = "HELLO, JOSÉ!" (E-acute is C3 89).
jose=$'Jos\xc3\xa9'
upper_jose=$'HELLO, JOS\xc3\x89!'

# Pick an installed UTF-8 locale: C.UTF-8 / C.utf8, then en_US.UTF-8 / en_US.utf8, then any *.UTF-8 / *.utf8.
utf8_locale=""
installed=$(locale -a 2>/dev/null)
for want in 'C\.(UTF-8|utf8)' 'en_US\.(UTF-8|utf8)' '.*\.(UTF-8|utf8)'; do
  utf8_locale=$(printf '%s\n' "$installed" | grep -E -m1 "^${want}\$" || true)
  [ -n "$utf8_locale" ] && break
done

if [ -n "$utf8_locale" ]; then
  check "--shout upper-cases non-ASCII letters in a UTF-8 locale ($utf8_locale)" "$upper_jose" "$(LC_ALL=$utf8_locale bash greet.sh --shout "$jose" 2>/dev/null)"
  LC_ALL=$utf8_locale bash greet.sh --shout "$jose" >/dev/null 2>&1; check "--shout with non-ASCII name exits 0 ($utf8_locale)" "0" "$?"
else
  echo "  skip: non-ASCII --shout cases (no UTF-8 locale installed; upper-casing non-ASCII is only defined in one)"
fi

# --repeat N: the greeting line is printed N times; combines with --shout in either order.
check "--repeat 3 prints the greeting three times" $'Hello, Ada!\nHello, Ada!\nHello, Ada!' "$(bash greet.sh --repeat 3 Ada 2>/dev/null)"
bash greet.sh --repeat 3 Ada >/dev/null 2>&1; check "--repeat 3 with name exits 0" "0" "$?"
check "--repeat 1 prints the greeting once" "Hello, Ada!" "$(bash greet.sh --repeat 1 Ada 2>/dev/null)"
check "--repeat 2 --shout prints the shouted greeting twice" $'HELLO, ADA!\nHELLO, ADA!' "$(bash greet.sh --repeat 2 --shout Ada 2>/dev/null)"
check "--shout --repeat 2 prints the shouted greeting twice" $'HELLO, ADA!\nHELLO, ADA!' "$(bash greet.sh --shout --repeat 2 Ada 2>/dev/null)"
bash greet.sh --repeat 2 --shout Ada >/dev/null 2>&1; check "--repeat 2 --shout with name exits 0" "0" "$?"
bash greet.sh --shout --repeat 2 Ada >/dev/null 2>&1; check "--shout --repeat 2 with name exits 0" "0" "$?"
check "--repeat 3 prints exactly three lines" "3" "$(bash greet.sh --repeat 3 Ada 2>/dev/null | wc -l | tr -d ' ')"
check "without --repeat prints exactly one line" "1" "$(bash greet.sh Ada 2>/dev/null | wc -l | tr -d ' ')"

# Invalid --repeat: exit 2, nothing on stdout, and the usage message on stderr that names --repeat.
# Each case is one check that folds in the exit code, so it only passes once --repeat is a documented flag.
# Arguments are listed one per line so an empty or odd value stays a single argument.
repeat_usage_case() { # <description> <args...>
  local desc=$1 out err rc
  shift
  out=$(bash greet.sh "$@" 2>/dev/null); rc=$?
  err=$(bash greet.sh "$@" 2>&1 >/dev/null)
  case "$err" in
    usage*--repeat*) err=usage-with-repeat ;;
    *) err="stderr:$err" ;;
  esac
  check "$desc exits 2, usage mentions --repeat, empty stdout" "2|usage-with-repeat|" "$rc|$err|$out"
}
repeat_usage_case "--repeat with no count and no name" --repeat
repeat_usage_case "--repeat with no count (name follows)" --repeat Ada
repeat_usage_case "--repeat 0" --repeat 0 Ada
repeat_usage_case "--repeat -1" --repeat -1 Ada
repeat_usage_case "--repeat abc" --repeat abc Ada
repeat_usage_case "--repeat 2x" --repeat 2x Ada
repeat_usage_case "--repeat 1.5" --repeat 1.5 Ada
repeat_usage_case "--repeat with empty count" --repeat "" Ada
repeat_usage_case "--repeat 3 with no name" --repeat 3
repeat_usage_case "--shout --repeat with no count" --shout --repeat Ada

exit $fail
