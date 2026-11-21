#!/usr/bin/env bash
# Usage: thanks.sh <name>
# Prints a thank-you for <name>.
set -euo pipefail

if [ $# -ne 1 ] || [ -z "$1" ]; then
  echo "usage: thanks.sh <name>" >&2
  exit 2
fi

printf 'Thank you, %s!\n' "$1"
