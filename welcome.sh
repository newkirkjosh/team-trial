#!/usr/bin/env bash
# Usage: welcome.sh <name>
# Prints a welcome for <name>.
set -euo pipefail

if [ $# -ne 1 ] || [ -z "$1" ]; then
  echo "usage: welcome.sh <name>" >&2
  exit 2
fi

printf 'Welcome, %s!\n' "$1"
