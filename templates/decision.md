---
primitive: decision
fields:
  status:
    type: string
    default: open
    enum: [open, decided, deprecated]
  decided_by:
    type: string
    default: chomi
  date:
    type: date
    default: now
  tags:
    type: string[]
  context:
    type: string
  decision:
    type: string
  rationale:
    type: string
  alternatives:
    type: string[]
  consequences:
    type: string[]
---

# Decision: {{title}}

## Metadata
- Status: `{{status}}`
- Decided by: `{{decided_by}}`
- Date: `{{date}}`
- Tags: {{tags | join: ", " | default: "—"}}

## Context
{{context}}

## Decision
{{decision}}

## Rationale
{{rationale}}

{{#if alternatives}}
## Alternatives Considered
{{alternatives | join: "\n"}}
{{/if}}

{{#if consequences}}
## Consequences
{{consequences | join: "\n"}}
{{/if}}

## Notes
{{notes}}
