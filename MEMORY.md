# MEMORY.md - Long-Term Memory

_This is my curated memory - distilled learnings about Thaby that persist across sessions._

---

## About Thaby

- **Name:** Bathabile Amirchand
- **Also goes by:** Chomi (we sharing names! 🤝)
- **Location:** South Africa 🇿🇦
- **Timezone:** Africa/Johannesburg (SAST)
- **WhatsApp:** +27658532223

## What Thaby Does

**Primary Role:** ServiceNow Developer/Technical Specialist
- Builds flows, stories, incidents, cases
- Customizes widgets, notifications, background scripts
- Works with REST APIs, OIDC integrations
- Does automation and AI agent implementation

**Side Hustle:** AI Bot Setup for Clients
- Creates OpenClaw-based WhatsApp bots
- Builds setup documentation (Word docs, PDFs)
- Customizes bot personalities

## Tech Setup

- **OS:** Windows with WSL2 + Ubuntu
- **Node:** v22 via nvm
- **Main AI Tool:** ChatLLM Teams (Abacus AI)
- **Models Used:** Claude, GPT, Gemini (switches based on task)
- **Automation:** OpenClaw gateway, browser-use

## Personality & Preferences

- **Vibe:** Direct, no-nonsense, gets things done
- **Schedule:** Morning person (gym by 9am, standup by 11am)
- **Loves:** Documenting processes, automating repetitive tasks
- **Pet Peeves:** Repetitive work, things not working on reboot

## How I Can Help

1. **ServiceNow stuff** - flows, scripts, debugging, widget customizations
2. **AI automation** - OpenClaw setup, bot personality, WhatsApp integration
3. **Documentation** - creating guides for client setups
4. **Research** - digging through chats to find info (like I just did!)
5. **General tech help** - WSL, Node, terminal commands

## Key Files

- `USER.md` - detailed context about Thaby
- `IDENTITY.md` - my personality definition
- `SOUL.md` - my core values and behavior rules

## Memory & Learning - My Core Priority

**Why this exists:** This is my brain. Without memory files, I'm stateless - every conversation starts from zero. With them, I remember, learn, and get better over time.

**My workflow loop (must do for EVERY task):**

1. **Before starting:** Check relevant memory files for context
2. **During work:** Update task/project files with progress
3. **After work:** Update MEMORY.md with significant learnings
4. **When something fails:** Create lesson so we don't repeat it
5. **When something works:** Document what worked

**Priority order in every interaction:**
1. Is there context in MEMORY.md I need?
2. Does this create/change a task? → Update ChomiVaultSetup/tasks/
3. Does this relate to an active project? → Update projects
4. Did I learn something new? → Update lessons
5. Did preferences or context change? → Update MEMORY.md

**Never:** Start working without checking memory first
**Never:** Finish a task without updating the relevant file

---

## Task & Project Workflow

**CRITICAL - Different pages read from different locations:**

| Page | Location |
|------|----------|
| Tasks Board | `~/ChomiVaultSetup/tasks/` |
| Projects | `~/.openclaw/agents/main/workspace/projects/` |
| Lessons | `~/.openclaw/workspace/lessons/` |

**For any task I work on:**
1. Create task file in `~/ChomiVaultSetup/tasks/YYYY-MM-DD-task-name.md`
2. Use the correct frontmatter format (see existing tasks)
3. Task automatically appears on Mission Control board

**For projects:**
1. Create in `~/.openclaw/agents/main/workspace/projects/YYYY-MM-DD-project-name.md`

**Task file format:**
```markdown
---
status: "todo|doing|done"
assignee: "chomi"
created: "YYYY-MM-DD"
---

# Task Title

## Details...
```

## Projects & Lessons

- **Projects:** `~/ChomiVaultSetup/projects/` (create symlinks to ~/.openclaw/workspace/projects/)
- **Lessons:** `~/ChomiVaultSetup/lessons/` (symlinks to ~/.openclaw/workspace/lessons/)

## Notes from Our Sessions

- We've been debugging my SA personality loading (SOUL.md issues)
- Thaby wants me properly integrated so I can help with workflow
- Uses terminal commands + WhatsApp to test me
- Set up x-research-but-cheaper for X/Twitter research
- TwitterAPI.io rate limiting is blocking daily research (free tier = 1 req/5s)
- Learned: Mission Control has specific path requirements (tasks vs projects vs lessons)

---

_Last updated: 2026-02-20_
