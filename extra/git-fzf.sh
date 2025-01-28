#!/usr/bin/env bash

if [ ! -d ".git" ]; then
  >&2 echo "not a git repository"
  exit 1
fi

use_fzf=false

while true; do
  case "$1" in
    -F|--fzf) use_fzf=true ;;
    *) break ;;
  esac
  shift
done

if [ "$use_fzf" = true ]; then
  rev="$(git log --oneline | fzf | cut -d' ' -f1)"
  if [ -z "$rev" ]; then
    exit 1
  fi
  git "$@" "$rev"
else
  git "$@"
fi

