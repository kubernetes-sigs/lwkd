#!/bin/sh
#
# To configure this pre-commit hook, copy this file to .git/hooks/pre-commit
# Run `cp ./pre-commit.sh ./.git/hooks/pre-commit`
# This script will update the time date key in the issue's frontmatter
# if the latest file in _posts is touched.

filename=$(ls -t _posts | head -n1)
filepath="_posts/$filename"

if git status --porcelain $filepath | grep -q "^[ AM]  .*$filepath$"; then
    echo "Executing pre-commit hook to set current date in $filepath" >&2
    date=$(TZ=UTC date +"%Y-%m-%d %H:%M:%S -0000")

    if [ "$(uname)" = "Darwin" ]; then
        sed -i.bak "s/^date:.*$/date: $date/" "$filepath"
        rm "${filepath}.bak"
    else
        sed -i "s/^date:.*$/date: $date/" "$filepath"
    fi

    git add "$filepath"
fi

exit 0