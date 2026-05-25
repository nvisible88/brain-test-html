# brain-test-html — Claude Working Instructions

## Project
Single-page viral pattern recognition test with global leaderboard.
Live at: https://nvisible88.github.io/brain-test-html
Stack: Vanilla HTML/CSS/JS · Supabase REST API · GitHub Pages · Google Fonts
All code lives in `index.html`. Do not introduce build tools, bundlers, or frameworks.

## Stable Snapshot
`index_v4_stable.html` — do not modify this file ever.

## Scope Rule
Do not suggest or implement features outside the active SPEC.md definition of done
unless explicitly asked. When in doubt, do less and confirm.

## Code Style
- Vanilla JS only — no libraries, no npm, no imports
- Inline `<style>` and `<script>` tags stay in index.html (single-file constraint)
- No comments explaining what code does; only why when non-obvious
- CSS variables in `:root` for all colors and shared values
- Use `escHtml()` for all user-supplied or database-sourced values rendered into HTML

## Supabase
- URL and anon key are intentionally in source (client-side, RLS-protected)
- All reads: `GET /rest/v1/leaderboard`
- All writes: `POST /rest/v1/leaderboard`
- Never add UPDATE or DELETE calls without explicit instruction

## Git
- Commit after every discrete working change
- Message format: imperative, under 60 chars, body only when why is non-obvious
- Co-author line required: `Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>`
- Never push without user confirmation unless user explicitly authorizes it for the session
- When code changes have been written but commit is paused for user verification,
  surface a reminder at the start of every new task:
  "Uncommitted changes from previous task — review and decide commit/discard before proceeding."

## Before Touching index.html
- Confirm the change is in the active SPEC.md
- Confirm `index_v4_stable.html` is unchanged
- Call out any change that affects quiz logic, scoring, or Supabase calls before editing
