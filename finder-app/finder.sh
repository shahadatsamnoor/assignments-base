#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

# ---- Input validation ----
if [ "$#" -ne 2 ]; then
  echo "Error: Two arguments required: <filesdir> <searchstr>" >&2
  exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
  echo "Error: '$filesdir' is not a directory or does not exist." >&2
  exit 1
fi

num_files=$(find "$filesdir" -maxdepth 1 -mindepth 1 \( -type f -o -type d \) 2>/dev/null | wc -l | awk '{print $1}')

num_matching_lines=$(
  # If there are no files, avoid calling grep with empty input
  if [ "$num_files" -eq 0 ]; then
    echo 0
  else
    find "$filesdir" -type f -exec grep -F -s "$searchstr" {} + | wc -l
  fi
)

echo "The number of files are ${num_files} and the number of matching lines are ${num_matching_lines}"