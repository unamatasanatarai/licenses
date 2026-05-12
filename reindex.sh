#!/usr/bin/env bash

__index_file="metadata/index.txt"
__license_dir="license-templates"

for f in "$__license_dir"/*; do
    if [[ -f "$f" ]]; then
        echo "${f##*/}"
    fi
done | sort >"$__index_file"
