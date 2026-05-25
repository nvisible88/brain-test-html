# Security Rules

## XSS Prevention
- Every value sourced from Supabase or user input that is rendered via innerHTML
  must pass through `escHtml()` — no exceptions
- Numeric fields (score, time_ms, correct) must be cast with `parseInt()` before render
- Do not construct `onclick` attribute strings with dynamic values; use `data-` attributes
  and delegated event listeners instead

## Supabase Anon Key
- The anon key in source is expected and acceptable — it is RLS-protected
- The anon role must have: SELECT + INSERT on `leaderboard`, nothing else
- Never log or expose the key in error messages

## Score Integrity
- All scoring computation happens client-side (known limitation for v1)
- Do not add client-side validation that creates false confidence — it is bypassable
- Server-side validation (Supabase trigger or Edge Function) is the correct fix,
  tracked as a post-v1 improvement

## Input Sanitization
- `name`: trim whitespace, slice to 20 chars, store as-is (escHtml on render)
- `country`/`flag`: only accept values from the hardcoded COUNTRIES array
- Never trust `e.*` fields from Supabase responses without defensive casting
