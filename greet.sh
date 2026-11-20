#!/usr/bin/env bash
# Usage: greet.sh [--shout] [--repeat N] <name>
# Prints a greeting for <name>; with --shout the greeting is upper case;
# with --repeat N (a positive integer, at most 18 digits) the greeting line is
# printed N times. Flags may come in any order, before the name; each flag
# may be given at most once.
# Requires Bash 4 or later.
set -euo pipefail

usage() {
  echo "usage: greet.sh [--shout] [--repeat N] <name>" >&2
  exit 2
}

shout=0
repeat=1
repeat_seen=0
while [ $# -ge 1 ]; do
  case "$1" in
    --shout)
      [ "$shout" -eq 0 ] || usage
      shout=1; shift ;;
    --repeat)
      [ "$repeat_seen" -eq 0 ] || usage
      [ $# -ge 2 ] || usage
      count=$2
      [[ $count =~ ^[0-9]+$ ]] || usage
      # Strip leading zeros so 08 is not read as octal; reject
      # counts over 18 digits so bash 64-bit arithmetic stays exact.
      while [[ $count == 0?* ]]; do count=${count#0}; done
      [ "${#count}" -le 18 ] && [ "$count" -ge 1 ] || usage
      repeat=$count
      repeat_seen=1
      shift 2 ;;
    -*) usage ;;
    *) break ;;
  esac
done

if [ $# -ne 1 ] || [ -z "$1" ]; then
  usage
fi

case "$1" in
  -*) usage ;;
esac

greeting=$(printf 'Hello, %s!' "$1")
if [ "$shout" -eq 1 ]; then
  greeting=${greeting^^}
fi
for ((i = 0; i < repeat; i++)); do
  printf '%s\n' "$greeting"
done
