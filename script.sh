#!/bin/sh
git checkout main
git pull origin main
git checkout -b $(date -v -sun +"%Y%m%d")

DATE_IN_TEMPLATE=2025-01-22
SLUG_IN_TEMPLATE=2025-01-20

if [ "$(uname)" = "Darwin" ]; then
    NEW_DATE=$(date -v -sun +"%Y-%m-%d")
    cp template.md ./_posts/$NEW_DATE-update.md
    sed -i '' "s/$SLUG_IN_TEMPLATE/$(date -v -sun +"%Y-%m-%d")/g" ./_posts/$NEW_DATE-update.md
    sed -i '' "s/$DATE_IN_TEMPLATE/$(date +"%Y-%m-%d")/g" ./_posts/$NEW_DATE-update.md
    sed -i '' "s/Month DD/$(date -v -sun +"%B %d")/g" ./_posts/$NEW_DATE-update.md
else
    NEW_DATE=$(date -d 'last sunday' +"%Y-%m-%d")
    cp template.md ./_posts/$NEW_DATE-update.md
    sed -i "s/$SLUG_IN_TEMPLATE/$(date -d 'last sunday' +"%Y-%m-%d")/g" ./_posts/$NEW_DATE-update.md
    sed -i '' "s/$DATE_IN_TEMPLATE/$(date +"%Y-%m-%d")/g" ./_posts/$NEW_DATE-update.md
    sed -i '' "s/Month DD/$(date -d 'last sunday' +"%B %d")/g" ./_posts/$NEW_DATE-update.md
fi

