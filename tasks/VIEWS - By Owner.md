# 👤 Tasks by Owner

## Chomi's Tasks
```dataview
TABLE status AS "Status", priority AS "Priority", due AS "Due", tags AS "Tags"
FROM "tasks"
WHERE owner = "chomi"
SORT priority DESC
```

## Other Owners
```dataview
TABLE owner AS "Owner", status AS "Status", priority AS "Priority", due AS "Due"
FROM "tasks"
WHERE owner != "chomi"
SORT owner ASC, priority DESC
```

---
*Last updated: `= this.file.cday`*
