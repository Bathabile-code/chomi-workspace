# 🚀 Projects

```dataview
TABLE status AS "Status", owner AS "Owner", start_date AS "Start", end_date AS "End", stakeholders AS "Stakeholders"
FROM "projects"
SORT status DESC, start_date DESC
```

## Active Projects
```dataview
TABLE owner AS "Owner", goals AS "Goals", stakeholders AS "Stakeholders"
FROM "projects"
WHERE status = "active"
SORT start_date DESC
```

## Completed
```dataview
TABLE owner AS "Owner", start_date AS "Started", end_date AS "Completed"
FROM "projects"
WHERE status = "completed"
SORT end_date DESC
```

---
*Last updated: `= this.file.cday`*
