#!/usr/bin/env bash
# Runs every tests/test-*.sh and fails if any fails.
set -uo pipefail
cd "$(dirname "$0")/.."
fail=0
count=0
for t in tests/test-*.sh; do
  count=$((count + 1))
  if bash "$t"; then
    echo "PASS $t"
  else
    echo "FAIL $t"
    fail=1
  fi
done
echo "ran $count test files"
exit $fail
