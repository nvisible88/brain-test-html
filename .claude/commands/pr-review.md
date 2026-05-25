# /pr-review

Review the current branch diff against main before merging.

## Process
1. Run `git diff main` and read the full diff
2. Check each change against the active SPEC.md
3. Run the code-reviewer agent checklist
4. Output: Approve or list of required changes

## Auto-Fail Conditions
- `index_v4_stable.html` was modified
- A database-sourced value is rendered into innerHTML without `escHtml()`
- A new state variable is not reset in `startQuiz()`
- The change is outside the active SPEC.md scope
