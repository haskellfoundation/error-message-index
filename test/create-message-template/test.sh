#!/usr/bin/env bash

set -Eeuo pipefail

cd "$(dirname $0)"
trap "rm -rf golden*.output.txt messages" EXIT

result=true

for input in golden*.input.txt; do
    output="$(basename -s .input.txt "$input").output.txt"
    golden="$(basename -s .input.txt "$input").expected.txt"
    runghc ../../message-index/create-message-template.hs < "$input" > "$output"
    if [ ! -e "$golden" ]; then
        cp "$output" "$golden"
        echo "$golden created."
    else
        if diff -u "$golden" "$output"
        then 
            echo "$golden ok."
        else
            result=false
            echo "$golden failed."
        fi
    fi
done

$result
