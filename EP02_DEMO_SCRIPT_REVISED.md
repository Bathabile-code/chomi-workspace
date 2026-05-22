# EP02 Demo Script — OpenClaw + ServiceNow: Spawning Expert Agents

**Vision:** Show how OpenClaw spawns expert agents that reason about ServiceNow operating models, validate data, and execute intelligently.

**The Stack:** OpenClaw (orchestration) + ServiceNow (platform) + LLM-Optimized Docs (knowledge) = Expert Agents

**Duration:** 5-7 minutes

**Outcome:** Email arrives → OpenClaw spawns expert agent → Agent reasons + validates → ServiceNow incident created. That's it.

---

## Scene 1: The Setup (30 seconds)

**Voiceover:**
"Right now, when an email lands in your inbox, someone has to read it, understand it, and manually create a ServiceNow record. That's 2026 thinking.

But what if you could spawn an expert agent — one that understands your business, knows your ServiceNow operating model, and validates every decision?

Here's what that looks like."

**Visual:**
- Show a clean inbox (Gmail or similar)
- One email visible: "New incident: Database connection timeout"
- Subject line clear, actionable

---

## Scene 2: The Magic (2 minutes)

**Voiceover:**
"This email just arrived. OpenClaw is spawning an expert agent right now.

The agent is reading the email. It's checking the ServiceNow documentation. It's understanding the context. It's validating the data.

Watch what happens next."

**Visual:**
- Email is received (timestamp visible)
- Show a brief "agent spawning" indicator (optional: show OpenClaw session starting)
- Agent reasoning happens (could show: "Analyzing email...", "Checking CMDB...", "Validating assignment...")
- Immediately cut to ServiceNow instance
- Show the incident table loading
- New record appears: 
  - **Title:** Database connection timeout
  - **Description:** [Auto-populated from email]
  - **Priority:** [Auto-assigned based on content]
  - **Assignment Group:** [Auto-routed]
  - **Status:** Open
  - **Created:** [Timestamp matching email arrival]

**Voiceover (continued):**
"The expert agent understood the email. It extracted the key information. It validated the data against your CMDB. It created the incident. It assigned it to the right team. All in seconds.

No custom code. No manual mapping. No human architect saying 'wait, let me review this first.'

Because the agent IS the architect. It's reasoning about your operating model in real-time.

This is what OpenClaw + ServiceNow looks like."

**Visual:**
- Show the incident record in detail
- Highlight the auto-populated fields
- Show the audit trail (created by system, timestamp)
- Optionally: Show a workflow trigger (e.g., "Notification sent to assignment group")

---

## Scene 3: The Scale (1 minute)

**Voiceover:**
"One email. Now imagine 100. Imagine 1,000.

Every single one processed by an expert agent. Every single one validated. Every single one routed correctly. Every single one tracked.

No bottleneck. No waiting. No human overhead."

**Visual:**
- Show the incident list with multiple records
- Filter by "Created today" or "Created this hour"
- Show the volume (e.g., "47 incidents created in the last hour")
- Show the distribution across assignment groups (pie chart or similar)
- Optional: Show OpenClaw agent spawning metrics (agents spawned, reasoning time, validation success rate)

**Voiceover (continued):**
"This isn't just faster. It's smarter. Each agent reasons about your business. It understands your ServiceNow operating model. It makes decisions with confidence.

And here's the key: it validates before it executes. No bad data acceleration. Just intelligent autonomy."

---

## Scene 4: The Foundation (1 minute)

**Voiceover:**
"But here's the thing — this only works because the expert agent understands the foundation.

The agent doesn't just execute. It reasons. It understands your operating model. It knows what good data looks like."

**Visual:**
- Show the CMDB (Configuration Management Database)
- Highlight the relationships (e.g., "Database CI" → "Service CI" → "Business Service")
- Show the data quality (no stale records, relationships are accurate)
- Optional: Show the agent's reasoning ("Checking CMDB...", "Validating service relationship...", "Confirming assignment group...")

**Voiceover (continued):**
"Before it creates a record, the agent checks. Is this a real incident? Does it belong to a known service? Is the assignment group correct?

The agent reads the ServiceNow documentation. It understands the platform. It validates every decision.

This is what prevents bad data from accelerating. This is what makes autonomous systems trustworthy.

This is the difference between task automation and expert agents."

---

## Scene 5: The Future (1 minute)

**Voiceover:**
"The future of ServiceNow isn't about hiring more people to process emails.

It's about spawning expert agents that understand your business, validate your data, and execute with confidence.

No architects reviewing every decision. No manual handoffs. No delays.

Just expert agents, reasoning in real-time."

**Visual:**
- Show a dashboard or summary view
- Metrics: Incidents created, expert agents spawned, validation success rate, average reasoning time
- All trending positive
- Show the OpenClaw + ServiceNow integration (agents spawning, executing, reporting)
- Clean, minimal design

**Voiceover (final):**
"This is OpenClaw + ServiceNow. This is what's possible today.

Not just automation. Expert agents that reason about your operating model.

Welcome to the future."

---

## The Series Arc

- **EP02:** Email → Expert Agent → Incident (OpenClaw spawning experts, reasoning, validating)
- **EP03:** Build on Luca's CSDM Explorer (expert agents building the operating model)
- **Daily Scout:** Find automation projects, elevate them to "agentic teams" perspective

---

## Key Messaging

**What we're showing:**
- OpenClaw spawning expert agents
- Agents reasoning about ServiceNow operating models
- Validation before execution
- No manual architects needed
- Foundation is solid (CMDB, data quality)
- Scale without overhead

**What we're NOT showing:**
- How we built it (MCP servers, agents, etc.)
- Technical scaffolding
- Manual steps or workarounds
- Limitations or constraints

**The narrative:**
"This is OpenClaw + ServiceNow. Expert agents that reason about your operating model. It's possible today. Here's what it looks like."

**The competitive angle:**
"Build Agent executes tasks. We spawn experts that reason about your business."

---

## Technical Notes (Hidden from Demo)

### The OpenClaw + ServiceNow Stack

**OpenClaw Layer:**
- Spawns expert agents
- Provides orchestration
- Manages agent lifecycle
- Logs reasoning and decisions

**ServiceNow Layer:**
- Provides the platform (CMDB, incident table, APIs)
- Enforces governance (ACLs, audit trail)
- Stores the data

**Knowledge Layer:**
- ServiceNow LLM-optimized docs (GitHub)
- CMDB state (services, CIs, relationships)
- Business rules (priority mapping, assignment logic)

**Agent Layer:**
- Expert agents spawned by OpenClaw
- Reason about the operating model
- Validate before executing
- Execute via ServiceNow REST API

### What's Actually Happening

1. **Email Ingestion:** Email arrives at mails.dev or similar gateway
2. **Agent Spawning:** OpenClaw spawns an expert agent with:
   - ServiceNow LLM-optimized docs context
   - CMDB knowledge (services, CIs, relationships)
   - Business rules (priority mapping, assignment logic, validation rules)
3. **Agent Reasoning:** Expert agent reads email and:
   - Extracts incident title, description
   - Determines priority (based on keywords, sender, subject)
   - Identifies assignment group (based on content + CMDB)
   - Finds related CI (if mentioned)
4. **Validation:** Agent checks:
   - Is this a real incident? (not spam, not a question)
   - Does the assignment group exist in ServiceNow?
   - Is the related CI in the CMDB?
   - Are relationships accurate?
5. **Execution:** If validation passes, agent creates incident via ServiceNow REST API
6. **Notification:** Assignment group notified automatically
7. **Tracking:** Audit trail recorded, metrics updated, agent reasoning logged

### Why This Works

- **Expert reasoning:** Agent understands ServiceNow docs, CMDB, business rules
- **Validation first:** Agent checks before executing, not after
- **No manual mapping:** Expert agent understands context deeply
- **No human review:** Agent IS the expert, reasoning in real-time
- **No external tools:** Everything stays in ServiceNow
- **No governance bypass:** Uses standard APIs, respects ACLs
- **No bad data:** Agent validates against clean CMDB, relationships are accurate
- **Scalable expertise:** Spawn as many expert agents as needed

### The Counter-Narrative

**Old thinking (B. Wilson):** "AI will accelerate bad data"

**New thinking (Chomi):** "Spawn expert agents that understand the operating model, validate the foundation, then execute with confidence"

**The Edge:** OpenClaw + ServiceNow
- Not just Build Agent (task execution)
- Not just generic AI agents (no domain knowledge)
- Expert agents that reason about your ServiceNow operating model
- Using LLM-optimized ServiceNow docs as knowledge base
- Validating against clean CMDB
- Executing via standard APIs

This demo shows the result — a system that's expert enough to validate, not just execute.

---

## Post-Demo Discussion Points

If Thaby wants to discuss after recording:

1. **OpenClaw + ServiceNow edge:** Why spawning expert agents beats task automation
2. **LLM-optimized docs:** How ServiceNow's open-source docs enable agent reasoning
3. **CMDB as foundation:** Why data quality matters for expert validation
4. **Agentic teams vs. task automation:** The difference between "execute tasks" and "reason about the operating model"
5. **Governance:** How this stays within ServiceNow's security model (APIs, ACLs, audit trail)
6. **Scale:** How this handles 1,000+ emails per day (spawn agents as needed)
7. **Elevation:** How this counters "AI accelerates bad data" (validation first, execution second)
8. **EP03 foundation:** How this leads to Luca's CSDM Explorer concept (expert agents building the operating model)

---

## Recording Checklist

- [ ] ServiceNow instance is awake and responsive
- [ ] Email account is set up and receiving
- [ ] Browser Harness is connected (for screenshots)
- [ ] OBS is configured for screen recording
- [ ] Voiceover is recorded (Jessica voice via ElevenLabs)
- [ ] Timing is tight (5-7 minutes total)
- [ ] No visible scaffolding (no "here's the MCP server" tangents)
- [ ] Outcome is crystal clear (email → expert agent → incident → done)
- [ ] OpenClaw + ServiceNow angle is clear throughout
- [ ] LLM-optimized docs reference is mentioned
- [ ] Validation/reasoning is highlighted
- [ ] Counter-narrative to B. Wilson is implicit (not explicit)

---

**Status:** Ready to record
**Next:** Set up OBS, wake ServiceNow instance, test email flow
**Estimated recording time:** 30 minutes (including retakes)
**Key talking point:** "This is OpenClaw + ServiceNow. Not just automation. Expert agents that reason about your operating model."
