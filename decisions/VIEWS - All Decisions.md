# ⚖️ All Decisions

```dataview
TABLE status AS "Status", decided_by AS "Decided By", date AS "Date", tags AS "Tags"
FROM "decisions"
SORT date DESC
```

## Open Questions
```dataview
TABLE decided_by AS "Owner", date AS "Date", tags AS "Tags"
FROM "decisions"
WHERE status = "open"
SORT date ASC
```

## Recently Decided
```dataview
TABLE decided_by AS "Decided By", tags AS "Tags"
FROM "decisions"
WHERE status = "decided"
SORT date DESC
LIMIT 10
```

---
*Last updated: `= this.file.cday`*
