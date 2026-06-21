#!/bin/sh
set -e

# --- Determine mode (next or last Sunday) ---
MODE="${1:-next}"

case "$MODE" in
  next)
    SUNDAY_FLAGS_BSD="-v+sun"
    SUNDAY_PHRASE_GNU="next sunday"
    ;;
  last)
    SUNDAY_FLAGS_BSD="-v-1w -v+sun"
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
  BRANCH_DATE=$(date $SUNDAY_FLAGS_BSD +"%Y%m%d")
else
  BRANCH_DATE=$(date -d "$SUNDAY_PHRASE_GNU" +"%Y%m%d")
fi
git checkout -b "$BRANCH_DATE"

DATE_IN_TEMPLATE="POST_DATE"
SLUG_IN_TEMPLATE="POST_SLUG_DATE"

if [ "$(uname)" = "Darwin" ]; then
    NEW_DATE=$(date $SUNDAY_FLAGS_BSD +"%Y-%m-%d")
    MONTH_DAY_YEAR=$(date $SUNDAY_FLAGS_BSD +"%B %d, %Y")

    echo ">>> DEBUG: NEW_DATE=[$NEW_DATE]"
    echo ">>> DEBUG: MONTH_DAY_YEAR=[$MONTH_DAY_YEAR]"

    cp template.md ./_posts/$NEW_DATE-update.md

    echo ">>> DEBUG: after cp, file contents:"
    cat ./_posts/$NEW_DATE-update.md

    sed -i '' "s/$SLUG_IN_TEMPLATE/$NEW_DATE/g" ./_posts/$NEW_DATE-update.md

    echo ">>> DEBUG: after slug sed:"
    grep -n "slug" ./_posts/$NEW_DATE-update.md

    sed -i '' "s/$DATE_IN_TEMPLATE/$NEW_DATE/g" ./_posts/$NEW_DATE-update.md

    echo ">>> DEBUG: after date sed:"
    grep -n "date:\|title" ./_posts/$NEW_DATE-update.md

    sed -i '' "s/Month DD, YYYY/$MONTH_DAY_YEAR/g" ./_posts/$NEW_DATE-update.md

    echo ">>> DEBUG: after Month DD, YYYY sed:"
    grep -n "title" ./_posts/$NEW_DATE-update.md
else
    NEW_DATE=$(date -d "$SUNDAY_PHRASE_GNU" +"%Y-%m-%d")
    MONTH_DAY_YEAR=$(date -d "$SUNDAY_PHRASE_GNU" +"%B %d, %Y")
    cp template.md ./_posts/$NEW_DATE-update.md
    sed -i "s/$SLUG_IN_TEMPLATE/$NEW_DATE/g" ./_posts/$NEW_DATE-update.md
    sed -i "s/$DATE_IN_TEMPLATE/$NEW_DATE/g" ./_posts/$NEW_DATE-update.md
    sed -i "s/Month DD, YYYY/$MONTH_DAY_YEAR/g" ./_posts/$NEW_DATE-update.md
fi