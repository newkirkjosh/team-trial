#!/usr/bin/env bash
# Usage: wave.sh <name>
# Prints a wave at <name>.
set -euo pipefail

if [ $# -ne 1 ] || [ -z "$1" ]; then
  echo "usage: wave.sh <name>" >&2
  exit 2
fi

printf '*waves at %s*\n' "$1"
