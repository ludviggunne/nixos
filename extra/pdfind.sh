#!/usr/bin/env bash
set -e

if [[ "$#" -lt 2 ]]; then
  >&2 echo "usage: $0 <pattern> <file>"
  exit 1
fi

selection=$(pdfgrep -n "$@" | fzf)

file=$(echo "$selection" | cut -f1 -d':')
page=$(echo "$selection" | cut -f2 -d':')

evince -i "$page" "$file"
