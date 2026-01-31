#!/bin/bash

# This script is used to create FUTO `.dict` file for Chinese(RIME) support.

NAME=zidian
SUFFIX=dict

if [[ $# == 0 ]]; then
    version="-v$(date +%y-%m)"
    echo \
"
No version specified, use \`$version\` as default.
To assign a version code, use:
    \`$0 [version]\`
"
else
    version="-$1"
fi

if [[ ! -d dict ]]; then
    mkdir dict
fi

TARGET="dict/$NAME$version.$SUFFIX"

if [[ -e $TARGET ]]; then
    rm -r "$TARGET"
fi

EXCLUDE=(".git/*" ".gitignore" "dict/*" "$0")
if zip -q -r "$TARGET" ./ -x "${EXCLUDE[@]}"; then
    echo "Output: $TARGET"
fi
