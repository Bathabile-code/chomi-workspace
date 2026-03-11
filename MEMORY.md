---
status: "todo"
assignee: "chomi"
created: "2026-03-11"
---

# Session Memory - 2026-03-11

## What We Did Today
- Executed evening cron backup routine
- Git pushed to origin main (commit c431d6e)
- Reviewed lessons folder for missed learnings

## Key Learnings Merged
### From Mission Control Deletion Incident (2026-02-21)
Critical file management rules added to knowledge base:
- **Never delete without running `git status` and `find` first**
- **When app breaks: STOP → git status → git restore → verify**
- **Check Tailwind version in package.json before writing CSS** (v3 uses `@tailwind base/components/utilities`, v4 uses `@import "tailwindcss"`)
- **Only ONE layout.tsx should render `<html>` and `<body>` tags**

## Git Backup Status
✅ Pushed: c431d6e - Evening backup 2026-03-11

## Still Todo
- Check for missed tasks in sessions not posted to task board.
