---
primitive: lesson
fields:
  type:
    type: string
    default: insight
    enum: [insight, mistake, pattern, technique, preference]
  source:
    type: string
  context:
    type: string
  lesson:
    type: string
  tags:
    type: string[]
  confidence:
    type: number
    default: 0.8
  applied:
    type: boolean
    default: false
  date:
    type: date
    default: now
---

# Lesson: {{title}}

## Metadata
- Type: `{{type}}`
- Source: `{{source | default: "—"}}`
- Date: `{{date}}`
- Confidence: `{{confidence}}`
- Applied: `{{applied}}`
- Tags: {{tags | join: ", " | default: "—"}}

## Context
{{context}}

## Lesson
{{lesson}}

## Notes
{{notes}}

---
**Action Items:**
{{#if action_items}}
{{action_items | join: "\n"}}
{{else}}
- None yet
{{/if}}
