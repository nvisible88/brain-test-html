# Testing Rules

## Philosophy
No automated test runner. All verification is manual browser testing.
Test the golden path and one edge case per new feature before marking done.

## Required Tests Before Any Commit to index.html
1. Full quiz run: start → 30 questions → result screen appears
2. Score and correct count display correctly on result screen
3. Submit with name + country → leaderboard entry appears
4. Leaderboard loads and renders without NaN or [object Object]
5. Retry → question cell positions are different from previous run

## v1 Feature Tests (before shipping)
- Name and country entry on intro screen: values carry into the post-quiz submit
- Share image: card renders with correct score, badge text, and URL
- Share image: works on mobile Safari (canvas toDataURL / Blob fallback)

## Edge Cases to Always Check
- Submit with empty name → red border flash, no request sent
- Leaderboard with 0 entries → "No scores yet" message shown
- Timer expiry → question auto-advances, streak resets
- 30 correct answers → "EXCEPTIONAL" badge shown
- 0 correct answers → "PATTERN NOVICE" badge shown
