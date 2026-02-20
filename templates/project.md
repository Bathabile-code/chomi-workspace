---
primitive: project
fields:
  status:
    type: string
    default: active
    enum: [active, paused, completed, archived]
  owner:
    type: string
    default: chomi
  start_date:
    type: date
    default: now
  end_date:
    type: date
  tags:
    type: string[]
  goals:
    type: string[]
  stakeholders:
    type: string[]
---

# Project: {{title}}

## Metadata
- Status: `{{status}}`
- Owner: `{{owner}}`
- Start: `{{start_date}}`
- End: `{{end_date | default: "—"}}`
- Tags: {{tags | join: ", " | default: "—"}}
- Stakeholders: {{stakeholders | join: ", " | default: "—"}}

## Goals
{{#if goals}}
{{goals | join: "\n"}}
{{else}}
-
{{/if}}

## Description
{{description}}

## Current Tasks
{{#if tasks}}
- 
{{else}}
- No tasks yet
{{/if}}

## Notes
{{notes}}
