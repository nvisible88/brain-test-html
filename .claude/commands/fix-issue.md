# /fix-issue

Fix a specific bug or broken behavior in index.html.

## Usage
Describe the issue. The agent will:
1. Read the relevant section of index.html
2. Identify the root cause
3. Apply the minimal fix
4. Commit with a `fix:` prefixed message

## Rules
- Do not fix adjacent issues unless they are the direct cause
- Do not refactor around the fix
- Call out any impact on quiz state, scoring, or Supabase calls before committing
