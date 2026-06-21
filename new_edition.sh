#!/bin/sh
set -e

# --- Determine mode (next or last Sunday) ---
MODE="${1:-next}"

case "$MODE" in
  next)
    SUNDAY_FLAG_BSD="+sun"
    SUNDAY_PHRASE_GNU="next sunday"
    ;;
  last)
    SUNDAY_FLAG_BSD="-1sun"
    SUNDAY_PHRASE_GNU="last sunday"
    ;;
  *)
    echo "Usage: $0 [next|last]"
    exit 1
    ;;
esac

git checkout main
git pull origin main

if [ "$(uname)" = "Darwin" ]; then
  BRANCH_DATE=$(date -v "$SUNDAY_FLAG_BSD" +"%Y%m%d")
else
  BRANCH_DATE=$(date -d "$SUNDAY_PHRASE_GNU" +"%Y%m%d")
fi
git checkout -b "$BRANCH_DATE"

DATE_IN_TEMPLATE="POST_DATE"
SLUG_IN_TEMPLATE="POST_SLUG_DATE"

if [ "$(uname)" = "Darwin" ]; then
    NEW_DATE=$(date -v "$SUNDAY_FLAG_BSD" +"%Y-%m-%d")
    MONTH_DAY_YEAR=$(date -v "$SUNDAY_FLAG_BSD" +"%B %d, %Y")
    cp template.md ./_posts/$NEW_DATE-update.md
    sed -i '' "s/$SLUG_IN_TEMPLATE/$NEW_DATE/g" ./_posts/$NEW_DATE-update.md
    sed -i '' "s/$DATE_IN_TEMPLATE/$NEW_DATE/g" ./_posts/$NEW_DATE-update.md
    sed -i '' "s/Month DD, YYYY/$MONTH_DAY_YEAR/g" ./_posts/$NEW_DATE-update.md
else
    NEW_DATE=$(date -d "$SUNDAY_PHRASE_GNU" +"%Y-%m-%d")
    MONTH_DAY_YEAR=$(date -d "$SUNDAY_PHRASE_GNU" +"%B %d, %Y")
    cp template.md ./_posts/$NEW_DATE-update.md
    sed -i "s/$SLUG_IN_TEMPLATE/$NEW_DATE/g" ./_posts/$NEW_DATE-update.md
    sed -i "s/$DATE_IN_TEMPLATE/$NEW_DATE/g" ./_posts/$NEW_DATE-update.md
    sed -i "s/Month DD, YYYY/$MONTH_DAY_YEAR/g" ./_posts/$NEW_DATE-update.md
fi