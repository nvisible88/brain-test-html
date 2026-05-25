# Changelog

## [v1] — 2026-05-22

### Added
- Name and country picker on the intro screen — player identifies before the test begins
- "Begin Test" requires a non-empty nickname (red border flash if blank)
- Result screen pre-populates name and country from intro entry (editable)
- Country selection syncs between intro and result screen pickers
- Share Score button on result screen — generates a 960×540 PNG card via Canvas API
- Card shows badge tier, correct count, "/30", and site URL at the bottom
- Web Share API used on mobile; falls back to PNG download on desktop
- Leaderboard "Play Now" routes to intro screen (ensures name is always entered)
- Retry routes back to intro screen with name pre-filled

All notable changes to brain-test-html are recorded here.
Format: `## [version] — YYYY-MM-DD` with sections Added / Changed / Fixed.

---

## [v4-stable] — 2026-05-22

### Added
- 30-level pattern recognition quiz across 5 difficulty tiers
- Global leaderboard via Supabase REST API (top 100, ordered by score then time)
- Country picker modal with 100+ countries
- Speed bonus scoring system (+0–5 pts per question based on time remaining)
- Streak detection with popup animation (3×, 5×, 10×)
- Result screen with three animated performance bars (Processing Speed, Anomaly Detection, Pattern Depth)
- Five result badge tiers based on correct answer count

### Fixed (2026-05-22)
- Question cell positions now re-randomize on every retry (were fixed per page load)
- Removed duplicate `rn/m` question shared across TIER4 and TIER5
- Replaced duplicate with `qq/qp` question in TIER5
- Wrapped `e.score` and `e.time_ms` in `parseInt()` before leaderboard HTML render
