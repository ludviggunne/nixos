#!/usr/bin/env bash
set -xe
git reset "$@"
read -p "Press enter to reset"
git reset @{1}
