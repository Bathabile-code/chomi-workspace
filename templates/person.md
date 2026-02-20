---
primitive: person
fields:
  name:
    type: string
    required: true
  role:
    type: string
  relationship:
    type: string
    enum: [owner, client, colleague, friend, family, vendor, other]
  contact:
    type: string
  tags:
    type: string[]
  communication_style:
    type: string
  preferences:
    type: string[]
  known_for:
    type: string[]
  last_interaction:
    type: date
---

# {{name}}

## Metadata
- Role: `{{role | default: "—"}}`
- Relationship: `{{relationship}}`
- Contact: `{{contact | default: "—"}}`
- Tags: {{tags | join: ", " | default: "—"}}
- Last Interaction: `{{last_interaction | default: "—"}}`

## Communication Style
{{communication_style | default: "—"}}

## Preferences
{{#if preferences}}
{{preferences | join: "\n"}}
{{else}}
-
{{/if}}

## Known For
{{#if known_for}}
{{known_for | join: "\n"}}
{{else}}
-
{{/if}}

## Notes
{{notes}}
