# 📂 Tasks by Project

## Filter by Project
Choose a project from the dropdown below:

```dataview
TABLE status AS "Status", priority AS "Priority", owner AS "Owner", due AS "Due"
FROM "tasks"
WHERE contains(tags, "project")
SORT priority DESC
```

## Untagged Tasks
```dataview
TABLE status AS "Status", priority AS "Priority", owner AS "Owner", due AS "Due"
FROM "tasks"
WHERE !contains(tags, "project")
SORT priority DESC
```

---
*Last updated: `= this.file.cday`*
