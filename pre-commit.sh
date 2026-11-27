#!/bin/sh
#
# To configure this pre-commit hook, copy this file to .git/hooks/pre-commit
# Run `cp ./pre-commit.sh ./.git/hooks/pre-commit`
# This script will replace the POST_DATE placeholder in the issue's frontmatter
# (e.g. `date: POST_DATE 22:00:00 -0000`) with the post's date, taken from the
# filename (YYYY-MM-DD-update.md), if the latest file in _posts is touched.

filename=$(ls -t _posts | head -n1)
filepath="_posts/$filename"
post_date="${filename%-update.md}"

if git status --porcelain $filepath | grep -q "^[ AM]  .*$filepath$"; then
    echo "Executing pre-commit hook to set post date in $filepath" >&2

    if [ "$(uname)" = "Darwin" ]; then
        sed -i.bak "s/POST_DATE/$post_date/" "$filepath"
        rm "${filepath}.bak"
    else
        sed -i "s/POST_DATE/$post_date/" "$filepath"
    fi

    git add "$filepath"
fi

exit 0