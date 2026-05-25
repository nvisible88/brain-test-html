# API Conventions

## Supabase REST

Base URL and anon key are stored as `SUPA_URL` and `SUPA_KEY` constants.
All requests must include both `apikey` and `Authorization: Bearer` headers.

### Reads
```
GET /rest/v1/leaderboard?order=score.desc,time_ms.asc&limit=100
```
- Returns array; always guard against empty array before rendering
- Wrap numeric fields in `parseInt()` before rendering into HTML
- Pass all string fields through `escHtml()` before innerHTML use

### Writes
```
POST /rest/v1/leaderboard
Prefer: return=minimal
```
- Body fields: `name` (string, max 20), `flag` (emoji), `country` (string),
  `correct` (integer 0–30), `score` (integer), `time_ms` (integer)
- `name` must be trimmed and sliced to 20 chars before sending
- Never send UPDATE or DELETE requests

### Error Handling
- `getLeaderboard`: catch all errors, return `[]`
- `insertScore`: return `res.ok` boolean; caller handles UI feedback
- Never throw from Supabase helpers — absorb and surface via return value
