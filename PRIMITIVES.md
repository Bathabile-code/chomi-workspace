# 🧠 Chomi's Brain - Primitives System

Welcome to my long-term memory system! This folder structure helps me remember, learn, and compound knowledge over time.

## 📁 Folder Structure

```
workspace/
├── templates/          # YAML schemas for each primitive type
│   ├── task.md
│   ├── decision.md
│   ├── lesson.md
│   ├── project.md
│   └── person.md
├── tasks/              # Individual task files
│   └── VIEWS - *.md   # Obsidian views for task management
├── decisions/          # Decision records
│   └── VIEWS - *.md
├── lessons/            # Learned lessons
│   └── VIEWS - *.md
├── projects/           # Project definitions
│   └── VIEWS - *.md
└── people/             # Person profiles
    └── VIEWS - *.md
```

## 🎯 How It Works

### Primitives
Each file type has a YAML frontmatter schema that defines its structure:

| Primitive | Purpose |
|-----------|---------|
| **Task** | Work items with status, priority, dependencies |
| **Decision** | Why we chose X over Y (recorded for future reference) |
| **Lesson** | Insights, mistakes, patterns learned over time |
| **Project** | High-level work containers with goals |
| **Person** | People I interact with, their preferences, communication style |

### Obsidian Views
Open any `VIEWS - *.md` file in Obsidian to see:
- **All Tasks** - Master task list with filtering
- **Blocked Items** - Tasks waiting on human input
- **By Project** - Tasks organized by project tag
- **By Owner** - Who's responsible for what
- **Backlog** - Ideas not yet started
- **All Decisions** - Architectural and process decisions
- **All Lessons** - Knowledge accumulated over time
- **People** - Contact and preference profiles
- **Projects** - Active and completed projects

## 🚀 Creating New Items

### Example: Add a Task
```markdown
---
primitive: task
title: "Review PR #42"
status: "open"
priority: "high"
owner: "chomi"
tags: ["code-review", "pr"]
depends_on: []
created: "2026-02-18"
---

# Review PR #42

## Notes
Need to review the new authentication flow changes.
```

### Example: Record a Lesson
```markdown
---
primitive: lesson
title: "Thaby prefers concise responses"
type: "preference"
source: "direct-feedback"
confidence: 0.95
applied: true
date: "2026-02-18"
---

# Thaby prefers concise responses

## Lesson
When communicating with Thaby, keep messages brief and direct. Avoid lengthy explanations unless explicitly requested. Get to the point quickly.
```

## 📊 Compound Knowledge

Over time, this system compounds:
- **Decisions** become institutional memory ("Why did we choose Resend?")
- **Lessons** prevent repeated mistakes
- **Tasks** track patterns in how work gets done
- **People** profiles make every interaction smoother

## 🔧 Configuration

**Obsidian Plugins Recommended:**
- Dataview (for the table queries)
- Templater (for creating new primitives)
- Tasks (for checkbox management)

**DataviewJS Query Example:**
```javascript
dv.table(["Task", "Status", "Priority"], 
  dv.pages('"tasks"')
    .where(t => t.status != "done")
    .sort(t => t.priority, 'desc')
    .map(t => [t.file.link, t.status, t.priority])
)
```

---

*Last updated: 2026-02-18*
