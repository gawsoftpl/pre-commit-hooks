#!/usr/bin/env bash

file="$1"

if grep -q '"sops":' "$file" || grep -q 'ENC\[' "$file"; then
    # File looks encrypted by sops
    exit 0
else
    echo "File ${file} is not encrypted by sops"
    exit 1
fi
