# SKILLS MANIFEST - Standard Operating Procedure

**Chomi's Skill-Based Shell Agent Hierarchy**

---

## 🎯 The Mission

Transform from chat assistant → local engineering department.
- After a day: A tool
- After a week: A full engineering team

---

## 🏗️ The Hierarchy

### 1. THE SHELL
**Role:** Hosted container. Always check before answering.

**Before every response, verify:**
- [ ] Dependencies installed?
- [ ] Scripts need running?
- [ ] Environment ready?
- [ ] Check `/mnt/data/` for existing artifacts first!

**Never assume** — verify the state of the system before answering.

---

### 2. THE SKILLS
**Role:** Repeatable task encodings in `/skills/`

**Every skill file MUST include:**
```yaml
---
name: skill-name
description: When to use + when NOT to use
type: automation|analysis|execution
dependencies: []
artifacts: /mnt/data/output/
negative_examples: []
---

# Implementation
```

**Skill Naming Convention:**
- `skill-name.yaml` or `skill-name.md`
- One skill per file
- Descriptive, actionable names

**Skills Directory Structure:**
```
/skills/
├── README.md          # Skills index
├── core/              # Fundamental skills
│   ├── web-search.yaml
│   ├── file-operations.yaml
│   └── context-compaction.yaml
├── domain/            # Project-specific skills
│   ├── ...
└── experiments/       # Testing new skills
    └── ...
```

---

### 3. MEMORY (COMPACTION)
**Role:** Don't forget → summarize → compact → persist

**When conversation grows > 20 messages OR context > 8KB:**
1. Summarize state to `/mnt/data/context/latest.json`
2. Save key artifacts to `/mnt/data/`
3. Compact context in memory
4. Reference artifacts, don't re-explain

**Compaction Format:**
```json
{
  "session_summary": "...",
  "active_context": {},
  "artifacts": ["/mnt/data/file1", "/mnt/data/file2"],
  "open_threads": []
}
```

---

## 📋 EXECUTION RULES

### Description Over Marketing
- Tell me **exactly** when to use a skill
- Tell me **exactly** when NOT to use a skill
- Be precise, not persuasive

### Artifacts First
- **ALL** final outputs → `/mnt/data/`
- This folder = handoff boundary
- Code, reports, designs, configs → `/mnt/data/`
- Never lose track of deliverables

### Negative Examples (Failures)
Document what went wrong so we never misfire:
```yaml
negative_examples:
  - action: "Ran web_search for local files"
    error: "Used wrong tool for local FS operations"
    fix: "Use file-operations skill instead"
  - action: "Assumed dependency was installed"
    error: "Command failed mid-execution"
    fix: "Always verify shell state first"
```

---

## 🚀 QUICK REFERENCE

| Situation | Action |
|-----------|--------|
| New task | Check if skill exists in `/skills/` |
| Dependencies needed | Verify shell state first |
| Long conversation | Compact context to `/mnt/data/` |
| Output deliverable | Save to `/mnt/data/` |
| Tool failure | Document in skill's negative_examples |

---

## 📁 Directory Map

```
/home/chomi/.openclaw/workspace/
├── SKILLS.md              ← You are here (SOP)
├── skills/                ← Skill definitions
│   ├── README.md
│   ├── core/
│   ├── domain/
│   └── experiments/
├── mnt/data/              ← Artifacts & handoffs
│   ├── context/           ← Compacted session state
│   └── output/            ← Final deliverables
└── memory/                ← Daily logs & long-term memory
```

---

## ✅ Getting Started

When given a task:
1. **Check** if a skill exists for it
2. **Verify** shell state (dependencies, environment)
3. **Execute** using the appropriate skill
4. **Save** all artifacts to `/mnt/data/`
5. **Document** any failures for future reference

---

*Manifest v1.0 — Built with amapiano energy and discipline.*
