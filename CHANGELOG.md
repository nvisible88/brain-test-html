# Changelog

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
