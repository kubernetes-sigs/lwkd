# Steps for Publishing LWKD

1. Merge all PRs.  
2. Do a final edit of the edition.
3. Update the timestamp to be reasonably close to the UTC time (but in the past).
4. Push to branch, and then merge via PR.
5. Publish on buttondown.
6. Make Bluesky and Mastodon posts.

## Buttondown

1. Log into buttondown.com
2. Choose "new email"
3. Make sure that you are in Markdown mode
4. Set the subject: `LWKD: Week Ending $MONTH $DAY, $YEAR`
5. Paste in the full text of the edition
6. Edit the web header out, leaving only the edition date.
7. Glance over the preview for any problems.
8. Click "Publish"
9. Look at the results of the link-checker
10. Click "Finalize" then "Yes, I'm sure" then "Got it"
11. Edition will go out, you can move on.

## Bluesky and Mastodon

1. Log into each account.
2. Write a brief summary of the edition based on highlights of what's in it; usually 2-4 short facts.
3. Fill in the rest of the format below
4. Post
5. Copy to the other platform and post again.

```
Week ending $MONTH $DAY: Fact 1, Fact 2, Fact 3

https://lwkd.info/$YEAR/$EDITION

#kubernetes #containers #CloudNative
```

example:

```
Week ending August 2: Steering candidates selected, CPU manager, Statefulset scaledown, NominatedNodeName

https://lwkd.info/2026/20260806

#kubernetes #containers #CloudNative
```