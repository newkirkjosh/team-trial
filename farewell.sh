#!/usr/bin/env bash
# Usage: farewell.sh <name>
# Prints a goodbye for <name>.
set -euo pipefail

if [ $# -ne 1 ] || [ -z "$1" ]; then
  echo "usage: farewell.sh <name>" >&2
  exit 2
fi

printf 'Goodbye, %s!\n' "$1"
