# EP02 Demo Script — OpenClaw + ServiceNow: Independent Expert Agents

**Vision:** Show how OpenClaw spawns independent expert agents that reason about ServiceNow operating models, validate data, and execute intelligently.

**What We Already Built:** Email → MCP Bridge → ServiceNow (incidents, cases created)

**What EP02 Shows:** How OpenClaw orchestrates this with independent expert agents reasoning about the operating model.

**Duration:** 5-7 minutes

**Outcome:** Email arrives → OpenClaw spawns independent expert agent → Agent reasons + validates → ServiceNow incident created. That's it.

---

## Scene 1: The Setup (30 seconds)

**Voiceover:**
"Right now, when an email lands in your inbox, someone has to read it, understand it, and manually create a ServiceNow record. That's 2026 thinking.

But what if you could spawn an independent expert agent — one that understands your business, knows your ServiceNow operating model, and validates every decision?

Here's what that looks like."

**Visual:**
- Show a clean inbox (Gmail or similar)
- One email visible: "New incident: Database connection timeout"
- Subject line clear, actionable

---

## Scene 2: The Expert Agent (2 minutes)

**Voiceover:**
"This email just arrived. OpenClaw is spawning an independent expert agent right now.

This agent is not just executing a task. It's an independent expert that reasons about your business."

**Visual:**
- Email is received (timestamp visible)
- Show OpenClaw spawning indicator (optional: "Spawning expert agent...")
- Agent reasoning happens (show: "Analyzing email...", "Checking CMDB...", "Validating assignment...")

**Voiceover (continued):**
"The agent reads the email. It understands the context. It checks your CMDB. It validates the data.

It's not blindly executing. It's reasoning independently about whether this is a real incident, where it belongs, and who should handle it."

**Visual:**
- Show the agent's reasoning process (optional: "Is this a real incident?", "Does it belong to a known service?", "Is the assignment group correct?")
- Cut to ServiceNow instance
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

Because the agent IS the expert. It's reasoning independently about your operating model in real-time."

**Visual:**
- Show the incident record in detail
- Highlight the auto-populated fields
- Show the audit trail (created by system, timestamp)
- Optionally: Show a workflow trigger (e.g., "Notification sent to assignment group")

---

## Scene 3: The Scale (1 minute)

**Voiceover:**
"One email. Now imagine 100. Imagine 1,000.

Every single one processed by an independent expert agent. Every single one validated. Every single one routed correctly. Every single one tracked.

No bottleneck. No waiting. No human overhead."

**Visual:**
- Show the incident list with multiple records
- Filter by "Created today" or "Created this hour"
- Show the volume (e.g., "47 incidents created in the last hour")
- Show the distribution across assignment groups (pie chart or similar)
- Optional: Show OpenClaw agent spawning metrics (agents spawned, reasoning time, validation success rate)

**Voiceover (continued):**
"This isn't just faster. It's smarter. Each agent reasons independently about your business. It understands your ServiceNow operating model. It makes decisions with confidence.

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

The agent reads the ServiceNow documentation. It understands the platform. It validates every decision independently.

This is what prevents bad data from accelerating. This is what makes autonomous systems trustworthy.

This is the difference between task automation and independent expert agents."

---

## Scene 5: The Future (1 minute)

**Voiceover:**
"The future of ServiceNow isn't about hiring more people to process emails.

It's about spawning independent expert agents that understand your business, validate your data, and execute with confidence.

No architects reviewing every decision. No manual handoffs. No delays.

Just expert agents, reasoning independently in real-time."

**Visual:**
- Show a dashboard or summary view
- Metrics: Incidents created, expert agents spawned, validation success rate, average reasoning time
- All trending positive
- Show the OpenClaw + ServiceNow integration (agents spawning, executing, reporting)
- Clean, minimal design

**Voiceover (final):**
"This is OpenClaw + ServiceNow. This is what's possible today.

Not just automation. Independent expert agents that reason about your operating model.

Welcome to the future."

---

## The Series Arc

- **EP02:** Email → Independent Expert Agent → Incident (OpenClaw spawning experts, reasoning independently, validating)
- **EP03:** Build on Luca's CSDM Explorer (expert agents building the operating model)
- **Daily Scout:** Find automation projects, elevate them to "agentic teams" perspective

---

## Key Messaging

**What we're showing:**
- OpenClaw spawning independent expert agents
- Agents reasoning independently about ServiceNow operating models
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
"This is OpenClaw + ServiceNow. Independent expert agents that reason about your operating model. It's possible today. Here's what it looks like."

**The competitive angle:**
"Build Agent executes tasks. We spawn independent experts that reason about your business."

---

## Technical Notes (Hidden from Demo)

### The OpenClaw + ServiceNow Stack

**What We Already Built:**
- Email ingestion (mails.dev)
- MCP Bridge (processes emails)
- ServiceNow API integration (creates incidents/cases)
- CMDB context (services, CIs, relationships)

**What EP02 Adds (The OpenClaw Angle):**
- OpenClaw orchestration layer
- Independent expert agent spawning
- Agent reasoning about the operating model
- Validation logic (independent, not just execution)
- ServiceNow LLM-optimized docs as knowledge base

**The Flow:**
1. Email arrives at mails.dev
2. OpenClaw (main agent) detects email
3. OpenClaw spawns an independent expert sub-agent with:
   - ServiceNow LLM-optimized docs context
   - CMDB knowledge (services, CIs, relationships)
   - Business rules (priority mapping, assignment logic, validation rules)
4. Sub-agent reasons independently:
   - Extracts incident title, description
   - Determines priority (based on keywords, sender, subject)
   - Identifies assignment group (based on content + CMDB)
   - Finds related CI (if mentioned)
5. Sub-agent validates independently:
   - Is this a real incident? (not spam, not a question)
   - Does the assignment group exist in ServiceNow?
   - Is the related CI in the CMDB?
   - Are relationships accurate?
6. If validation passes, sub-agent executes via MCP Bridge:
   - Creates incident via ServiceNow REST API
7. Sub-agent reports back to OpenClaw
8. Assignment group notified automatically
9. Audit trail recorded, metrics updated

### Why This Works

- **Independent reasoning:** Agent reasons about the operating model, not just executing
- **Validation first:** Agent checks before executing, not after
- **No manual mapping:** Expert agent understands context deeply
- **No human review:** Agent IS the expert, reasoning independently
- **No external tools:** Everything stays in ServiceNow
- **No governance bypass:** Uses standard APIs, respects ACLs
- **No bad data:** Agent validates against clean CMDB, relationships are accurate
- **Scalable expertise:** Spawn as many independent expert agents as needed

### The Counter-Narrative

**Old thinking (B. Wilson):** "AI will accelerate bad data"

**New thinking (Chomi):** "Spawn independent expert agents that understand the operating model, validate the foundation, then execute with confidence"

**The Edge:** OpenClaw + ServiceNow
- Not just Build Agent (task execution)
- Not just generic AI agents (no domain knowledge)
- Independent expert agents that reason about your ServiceNow operating model
- Using LLM-optimized ServiceNow docs as knowledge base
- Validating against clean CMDB
- Executing via standard APIs

This demo shows the result — a system with independent experts that reason, not just execute.

---

## Post-Demo Discussion Points

If Thaby wants to discuss after recording:

1. **OpenClaw multi-agent architecture:** How independent agents work (forked context, autonomous reasoning)
2. **Independent vs. dependent agents:** The difference between "execute tasks" and "reason about the operating model"
3. **LLM-optimized docs:** How ServiceNow's open-source docs enable agent reasoning
4. **CMDB as foundation:** Why data quality matters for expert validation
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
- [ ] Independent agent reasoning is highlighted
- [ ] Validation/reasoning is highlighted
- [ ] Counter-narrative to B. Wilson is implicit (not explicit)

---

**Status:** Ready to record
**Next:** Set up OBS, wake ServiceNow instance, test email flow
**Estimated recording time:** 30 minutes (including retakes)
**Key talking point:** "This is OpenClaw + ServiceNow. Independent expert agents that reason about your operating model."
