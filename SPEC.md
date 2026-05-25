# SPEC — brain-test-html v1

**Status:** DRAFT — awaiting approval before implementation begins
**Last updated:** 2026-05-22

---

## Definition of Done

v1 is complete when both features below are implemented, manually tested per
`.claude/rules/testing.md`, and deployed to GitHub Pages.

---

## Feature 1 — Name & Country at Start

### What
Move the name input and country picker from the result screen to the intro screen,
so the player identifies themselves before the test begins.

### Why
Makes the post-quiz submit flow frictionless — the player is already identified
when they reach the result screen, so submitting to the leaderboard is one tap.

### Behavior
- Intro screen gains a name input (`placeholder="Your nickname…"`, `maxlength=20`)
  and the country picker button, laid out identically to the current result screen row
- "Begin Test" button is only active when name is non-empty (trim check)
  - Empty name: red border flash on the input, button stays disabled
- When the quiz ends and result screen appears:
  - The submit box still shows (pre-filled name and country, non-editable display)
  - Submit button is active immediately — no re-entry required
  - User can still change name/country from the result screen if desired
    (inputs remain editable, just pre-populated)
- `selectedCountry` and `playerName` are set at intro time and carried through

### What Does NOT Change
- Quiz logic, scoring, timer, streak — untouched
- Leaderboard screen — untouched
- Supabase payload fields — identical (`name`, `flag`, `country`, `correct`, `score`, `time_ms`)
- `index_v4_stable.html` — untouched

### DOM Changes
- Intro screen (`#intro`): add `.name-country-row` block above "Begin Test" button
- Result screen (`#result`): submit box inputs pre-populated but remain editable
- No new screens, no new routes

---

## Feature 2 — Share as Image

### What
Add a "Share Score" button on the result screen that generates a PNG card the player
can save or share. No external service — generated client-side using Canvas API.

### Why
Viral loop: players share their result as an image to social media or messaging apps.
The card includes the site URL, which drives traffic back.

### Card Design (480 × 270px — 16:9, fits social previews)
```
┌─────────────────────────────────────────────────────────┐
│  [dark bg: #0a0a0f]                                     │
│                                                         │
│  ◈ EXCEPTIONAL PATTERN MIND          [badge color text] │
│                                                         │
│         27 / 30                      [large Syne font]  │
│     correct answers                  [muted subtitle]   │
│                                                         │
│  nvisible88.github.io/brain-test-html  [muted footer]  │
└─────────────────────────────────────────────────────────┘
```
- Background: `#0a0a0f`
- Badge text: colored per tier (same colors as result screen badge)
- Score number: white, large
- URL: muted (`#7070a0`), bottom-center
- No player name on the card (privacy — name goes to leaderboard only)

### Behavior
- Button label: "Share Score" (or "Save Image" on desktop)
- On click: draw to offscreen `<canvas>`, call `canvas.toBlob()` then
  `navigator.share({ files: [blob] })` if Web Share API is available
- Fallback (no Web Share or desktop): `canvas.toDataURL()` → trigger download
  as `brain-test-result.png`
- Button appears on result screen, below the result bars, above the submit box
- Button is always shown (not conditional on submission)

### Constraints
- Canvas only — no html2canvas, no external libraries
- Font rendering: use system fallback fonts on canvas (Google Fonts are not available
  to Canvas — do not attempt to load them)
- Must work on mobile Safari (use `toBlob` not `toDataURL` for share flow)

### What Does NOT Change
- Result screen layout otherwise unchanged
- Leaderboard, quiz, intro — untouched
- Supabase — untouched

---

## Out of Scope for v1
- Server-side score validation
- Rate limiting on submissions
- Leaderboard caching
- Multiple quiz modes
- Any analytics or tracking
