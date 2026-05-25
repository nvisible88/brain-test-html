#!/usr/bin/env bash
# Abort commit if index_v4_stable.html has been modified.
if git diff --cached --name-only | grep -q 'index_v4_stable.html'; then
  echo "ERROR: index_v4_stable.html is staged for commit. This file must not be modified."
  exit 1
fi
