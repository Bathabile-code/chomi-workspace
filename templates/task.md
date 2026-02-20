---
primitive: task
fields:
  status:
    type: string
    required: true
    default: open
    enum: [open, in-progress, blocked, done]
  priority:
    type: string
    enum: [critical, high, medium, low]
    default: medium
  owner:
    type: string
    default: chomi
  due:
    type: date
  tags:
    type: string[]
  estimate:
    type: string
  parent:
    type: string
  depends_on:
    type: string[]
  created:
    type: date
    default: now
  updated:
    type: date
---

# {{title}}

## Metadata
- Status: `{{status}}`
- Priority: `{{priority}}`
- Owner: `{{owner}}`
- Due: `{{due | default: "—"}}`
- Tags: {{tags | join: ", " | default: "—"}}
- Created: `{{created}}`
- Updated: `{{updated}}`

## Dependencies
{{#if depends_on}}
- Depends on: {{depends_on | join: ", "}}
{{/if}}
{{#if parent}}
- Parent: `{{parent}}`
{{/if}}

## Notes
{{description}}
