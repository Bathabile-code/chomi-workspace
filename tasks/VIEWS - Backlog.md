# 📚 Backlog

Ideas and tasks not yet promoted to active work.

```dataview
TABLE status AS "Status", priority AS "Priority", created AS "Created", tags AS "Tags"
FROM "tasks"
WHERE status = "open" AND !contains(tags, "priority")
SORT created ASC
```

## Low Priority
```dataview
TABLE priority AS "Priority", owner AS "Owner", created AS "Created"
FROM "tasks"
WHERE status = "open" AND priority = "low"
SORT created ASC
```

---
*Last updated: `= this.file.cday`*
