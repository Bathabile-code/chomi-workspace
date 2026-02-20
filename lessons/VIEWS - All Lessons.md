# 💡 All Lessons

```dataview
TABLE type AS "Type", source AS "Source", confidence AS "Confidence", applied AS "Applied", date AS "Date"
FROM "lessons"
SORT date DESC
```

## Applied Lessons
```dataview
TABLE source AS "Source", date AS "Date"
FROM "lessons"
WHERE applied = true
SORT date DESC
```

## Not Yet Applied
```dataview
TABLE type AS "Type", source AS "Source", confidence AS "Confidence", date AS "Date"
FROM "lessons"
WHERE applied = false
SORT confidence DESC
```

## By Type
- **Insights:** `= length(filter(this.file.lists, l => l.type = "insight"))`
- **Mistakes:** `= length(filter(this.file.lists, l => l.type = "mistake"))`
- **Patterns:** `= length(filter(this.file.lists, l => l.type = "pattern"))`
- **Techniques:** `= length(filter(this.file.lists, l => l.type = "technique"))`
- **Preferences:** `= length(filter(this.file.lists, l => l.type = "preference"))`

---
*Last updated: `= this.file.cday`*
