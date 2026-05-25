# /deploy

Push the current state of main to GitHub Pages.

## What This Does
`git push origin main` — GitHub Pages auto-deploys from main branch.
The live URL is: https://nvisible88.github.io/brain-test-html

## Pre-Deploy Checklist
- [ ] `index_v4_stable.html` is unchanged (run `git diff index_v4_stable.html`)
- [ ] CHANGELOG.md has an entry for this version
- [ ] The quiz runs end-to-end in the browser (manual check)
- [ ] Supabase submit works (test with a real name + country)

## After Deploy
Confirm the live URL loads and the leaderboard fetches within 5 seconds.
Always ask the user to confirm before running `git push`.
