#!/usr/bin/env bash
# Usage: greet.sh <name>
# Prints a greeting for <name>.
set -euo pipefail

if [ $# -ne 1 ] || [ -z "$1" ]; then
  echo "usage: greet.sh <name>" >&2
  exit 2
fi

printf 'Hello, %s!\n' "$1"
