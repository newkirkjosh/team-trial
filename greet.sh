#!/usr/bin/env bash
# Usage: greet.sh [--shout] <name>
# Prints a greeting for <name>; with --shout the greeting is upper case.
set -euo pipefail

usage() {
  echo "usage: greet.sh [--shout] <name>" >&2
  exit 2
}

shout=0
if [ $# -ge 1 ]; then
  case "$1" in
    --shout) shout=1; shift ;;
    -*) usage ;;
  esac
fi

if [ $# -ne 1 ] || [ -z "$1" ]; then
  usage
fi

case "$1" in
  -*) usage ;;
esac

greeting=$(printf 'Hello, %s!' "$1")
if [ "$shout" -eq 1 ]; then
  greeting=$(printf '%s' "$greeting" | tr '[:lower:]' '[:upper:]')
fi
printf '%s\n' "$greeting"
