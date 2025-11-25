#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments required: <writefile> <writestr>" >&2
    exit 1
fi

writefile=$1
writestr=$2

dirpath=$(dirname "$writefile")
if ! mkdir -p "$dirpath"; then
    echo "Error: Failed to create directory path '$dirpath'" >&2
    exit 1
fi

if ! echo "$writestr" > "$writefile"; then
    echo "Error: Failed to write to file '$writefile'" >&2
    exit 1
fi