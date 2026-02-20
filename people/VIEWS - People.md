# 👥 People

```dataview
TABLE relationship AS "Relationship", role AS "Role", communication_style AS "Communication Style"
FROM "people"
SORT relationship ASC, name ASC
```

## By Relationship
- **Owner:** `= length(filter(this.file.lists, l => l.relationship = "owner"))`
- **Clients:** `= length(filter(this.file.lists, l => l.relationship = "client"))`
- **Colleagues:** `= length(filter(this.file.lists, l => l.relationship = "colleague"))`
- **Family:** `= length(filter(this.file.lists, l => l.relationship = "family"))`

---
*Last updated: `= this.file.cday`*
