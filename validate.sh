#!/usr/bin/env bash

__index_file="metadata/index.txt"
__license_dir="license-templates"

if [[ ! -f "$__index_file" ]]; then
    printf 'missing index file: %s\n' "$__index_file" >&2
    exit 1
fi

if [[ ! -d "$__license_dir" ]]; then
    printf 'missing license directory: %s\n' "$__license_dir" >&2
    exit 1
fi

__status=0
__line_number=0

declare -A __seen

while IFS= read -r __license_name || [[ -n "$__license_name" ]]; do
    ((__line_number++))

    [[ -n "$__license_name" ]] || continue

    if [[ ! "$__license_name" =~ ^[A-Za-z0-9._+-]+$ ]]; then
        printf 'invalid license identifier at line %d: %s\n' "$__line_number" "$__license_name" >&2
        __status=1
        continue
    fi

    case "$__license_name" in
    .* | */* | *\\* | *..*)
        printf 'unsafe license identifier at line %d: %s\n' "$__line_number" "$__license_name" >&2
        __status=1
        continue
        ;;
    esac

    if [[ -v "__seen[$__license_name]" ]]; then
        printf 'duplicate license identifier at line %d: %s\n' "$__line_number" "$__license_name" >&2
        __status=1
        continue
    fi

    __seen["$__license_name"]=1

    if [[ ! -f "${__license_dir}/${__license_name}" ]]; then
        printf 'missing license file: %s/%s\n' "$__license_dir" "$__license_name" >&2
        __status=1
    fi
done <"$__index_file"

if ((__status != 0)); then
    exit "$__status"
fi

printf 'validation successful\n'
exit 0
