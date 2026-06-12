#!/bin/sh
git checkout main
git pull origin main

if [ "$(uname)" = "Darwin" ]; then
  git checkout -b $(date -v +sun +"%Y%m%d")
else
  git checkout -b $(date -d 'next sunday' +"%Y%m%d")
fi

DATE_IN_TEMPLATE="POST_DATE"
SLUG_IN_TEMPLATE="POST_SLUG_DATE"

if [ "$(uname)" = "Darwin" ]; then
    NEW_DATE=$(date -v +sun +"%Y-%m-%d")
    cp template.md ./_posts/$NEW_DATE-update.md
    sed -i '' "s/$SLUG_IN_TEMPLATE/$NEW_DATE/g" ./_posts/$NEW_DATE-update.md
    sed -i '' "s/$DATE_IN_TEMPLATE/$NEW_DATE/g" ./_posts/$NEW_DATE-update.md
    sed -i '' "s/Month DD/$(date -v +sun +"%B %d")/g" ./_posts/$NEW_DATE-update.md
else
    NEW_DATE=$(date -d 'next sunday' +"%Y-%m-%d")
    cp template.md ./_posts/$NEW_DATE-update.md
    sed -i "s/$SLUG_IN_TEMPLATE/$NEW_DATE/g" ./_posts/$NEW_DATE-update.md
    sed -i "s/$DATE_IN_TEMPLATE/$NEW_DATE/g" ./_posts/$NEW_DATE-update.md
    sed -i "s/Month DD/$(date -d 'next sunday' +"%B %d")/g" ./_posts/$NEW_DATE-update.md
fi