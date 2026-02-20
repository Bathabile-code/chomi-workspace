# 📋 All Tasks

```dataview
TABLE status AS "Status", priority AS "Priority", owner AS "Owner", due AS "Due", tags AS "Tags"
FROM "tasks"
SORT priority DESC, created DESC
```

## Quick Stats
- **Open:** `= length(filter(this.file.tasks, t => t.status = "open"))`
- **In Progress:** `= length(filter(this.file.tasks, t => t.status = "in-progress"))`
- **Blocked:** `= length(filter(this.file.tasks, t => t.status = "blocked"))`
- **Done:** `= length(filter(this.file.tasks, t => t.status = "done"))`

---
*Last updated: `= this.file.cday`*
