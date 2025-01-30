#!/bin/sh
git checkout main
git pull origin main
git checkout -b $(date -v -sun +"%Y%m%d")

NEW_DATE=$(date -v -sun +"%Y-%m-%d")
cp template.md ./_posts/$NEW_DATE-update.md

sed -i '' "s/2025-01-20/$(date -v -sun +"%Y-%m-%d")/g" ./_posts/$NEW_DATE-update.md
sed -i '' "s/2025-01-22/$(date +"%Y-%m-%d")/g" ./_posts/$NEW_DATE-update.md
sed -i '' "s/Month DD/$(date -v -sun +"%B %d")/g" ./_posts/$NEW_DATE-update.md
