#!/usr/bin/env bash
# Usage: nod.sh <name>
# Prints a nod at <name>.
set -euo pipefail

if [ $# -ne 1 ] || [ -z "$1" ]; then
  echo "usage: nod.sh <name>" >&2
  exit 2
fi

printf '*nods at %s*\n' "$1"
