# 🚫 Blocked Items

```dataview
TABLE priority AS "Priority", owner AS "Owner", depends_on AS "Depends On", tags AS "Tags"
FROM "tasks"
WHERE status = "blocked"
SORT priority DESC
```

## Needs Human Input
These tasks are waiting on something. Check dependencies above.

---
*Last updated: `= this.file.cday`*
