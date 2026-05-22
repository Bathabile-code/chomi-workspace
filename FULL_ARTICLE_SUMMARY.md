# OpenClaw + ServiceNow: Teams of Expert Agents

**Full Article Status:** ✅ COMPLETE (saved to memory/2026-05-22.md)

## Article Overview

### The Problem
- ServiceNow automation today = task execution (Build Agent, generic AI)
- Manual validation, approval, governance still required
- Scales linearly with volume (need more people)

### The Solution
- OpenClaw spawns **teams of independent expert agents**
- Each expert has own context, reasoning, knowledge
- Team validates before executing
- Autonomous at scale

### The Team
1. **Validator Expert** — Checks CMDB, validates data, reasons about operating model
2. **Executor Expert** — Creates incident, assigns, triggers workflows
3. **Reviewer Expert** — Audits work, checks duplicates, flags anomalies

### The Architecture
- OpenClaw multi-agent model (@steipete)
- Independent sub-agents with forked/isolated context
- ServiceNow LLM-optimized docs as knowledge base
- CMDB + business rules for validation

### The Series
- **EP02:** Email → Expert Team → Incident (autonomous reasoning)
- **EP03:** Building the operating model (CSDM Explorer)
- **Daily Scout:** Elevating automation projects to agentic teams perspective

### The Edge
- **vs. Build Agent:** We spawn expert teams that reason, not just execute
- **vs. Generic AI:** We have domain knowledge, operating model understanding, validation
- **Killer line:** "Build Agent accelerates execution. OpenClaw accelerates expertise."

### The Counter-Narrative
- **Old:** "AI will accelerate bad data"
- **New:** "Expert teams validate before they execute"

---

## Key Sections in Full Article

1. **The Problem** — ServiceNow automation today
2. **The Solution** — OpenClaw + teams of expert agents
3. **The Architecture** — How it works (@steipete's model)
4. **The Counter-Narrative** — vs "AI accelerates bad data"
5. **The Series** — EP02 → EP03 → Daily Scout
6. **The Edge** — Why this is different
7. **The Future** — Where this leads
8. **Implementation** — What you need
9. **The Narrative** — For different audiences
10. **What Makes This Real** — We have the pieces

---

## Files Completed (May 22, 2026)

✅ **EP02 Script** — Rewritten with team of experts angle
✅ **Daily Cron Job** — daily-agentic-ai-scout.js
✅ **Team Brief** — TEAM_BRIEF_EP02_EP03.md
✅ **ServiceNow Docs Reference** — SERVICENOW_DOCS_REFERENCE.md
✅ **Timeout Fix** — agents.defaults.timeoutSeconds: 7200
✅ **Full Article** — Complete, saved to memory/2026-05-22.md

---

## Next Steps (Tomorrow)

1. **Review & Refine** — Read through article, tighten language
2. **Brief the Team** — Share with Lakshmi, Kwazi, Thuluzi, Claire
3. **Record EP02** — Use team of experts script
4. **Publish** — Article + EP02 video + LinkedIn posts

---

## Key Insights (May 22)

### From Kwazi
- "Build Agent accelerates execution. OpenClaw accelerates expertise."
- "EP02's strongest position: expert teams that validate before they execute"
- "Governance isn't a bottleneck — it's the reason agents are allowed to be autonomous"

### From @steipete
- Sub-agents are independent (not puppets)
- Can have forked context (inherit parent) or isolated context (clean slate)
- Each sub-agent has own reasoning capability
- Multiple sub-agents can work together as a team

### From Thaby
- "OpenClaw spawns a team of experts, experts do the work"
- "Experts with own context (key) given the skill in the open source document"
- "We have spent another whole day arguing and not getting anywhere" → Time to execute

---

**Status:** Ready for refinement tomorrow
**Prepared by:** Chomi
**Date:** May 22, 2026 - 18:50 SAST
