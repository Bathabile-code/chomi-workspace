# EP02 Hybrid Demo Script — May 10 Footage + New Reasoning Angle

## Overview
**Approach:** Combine existing May 10 recordings (team assembly + execution) with NEW recording showing independent reasoning/validation

**Duration:** 5-7 minutes
**Theme:** "My agent assembled a team. But here's what they actually DID — they reasoned."

---

## PART 1: May 10 Footage (Re-edited with new narrative)

### Scene 1: The Hook (0:00-0:30)
**Visual:** Black screen → Text fade-in
**Voiceover:**
> "Every day, support teams waste hours on manual data entry. Copy-paste. Context switching. But what if your AI agent didn't just execute tasks — what if it assembled a team of independent experts that reasoned about your business?"

**Use:** New text overlay (not from May 10 footage)

---

### Scene 2: Team Assembly (0:30-1:30)
**Visual:** Terminal showing OpenClaw spawning agents
**From May 10:** `stage1_2_technical.cast` or `real_demo.mp4`
**Voiceover:**
> "Watch this. An email arrives. OpenClaw spawns an independent expert agent. This agent isn't just executing — it's reasoning. It understands your ServiceNow operating model."

**Key moments to extract:**
- Agent spawning sequence
- "Kwazi-Bridge" agent created
- "Bhinca-QA1" agent created
- "Lakshmi-RITM" agent created

**Text overlays:**
- "Agent: Kwazi-Bridge — Builder"
- "Agent: Bhinca-QA1 — QA Engineer"
- "Agent: Lakshmi-RITM — ServiceNow Expert"

---

### Scene 3: Email Injection (1:30-2:30)
**Visual:** Terminal showing email processing + ServiceNow sys_email table
**From May 10:** `stage1_2_technical.cast` + `before_sys_email.png` + `after_sys_email.png`
**Voiceover:**
> "The team gets to work. Kwazi injects emails into ServiceNow. But here's the difference — these agents aren't just moving data. They're validating every decision."

**Show:**
- Before: sys_email table with 2,250 records
- Process: Email injection happening
- After: New records created with "received" type

**Text overlays:**
- "Before: 2,250 records"
- "After: 2,253 records"
- "Type: received (not send-ready)"

---

### Scene 4: QA Verification (2:30-3:00)
**Visual:** Terminal showing QA agent verifying records
**From May 10:** `stage3_qa_verify.cast`
**Voiceover:**
> "Bhinca-QA1 verifies every record. Not just checking if it exists — validating that it's correct. Subject, priority, type, no duplicates."

**Show:**
- API calls to ServiceNow
- HTTP 200 responses
- Verification results: PASS

**Text overlays:**
- "QA Agent: Bhinca-QA1"
- "Verification: 3/3 PASS"
- "Criteria: Subject ✓ Priority ✓ Type ✓ No Duplicates ✓"

---

## PART 2: New Recording (Independent Reasoning)

### Scene 5: The Reasoning Process (3:00-4:30)
**Visual:** Split screen — Email on left, Agent reasoning on right
**NEW RECORDING NEEDED**
**Voiceover:**
> "But here's what makes this different. The agent doesn't just execute — it reasons independently. Watch."

**Show:**
1. **Email arrives:** "Database connection timeout — Priority: HIGH"
2. **Agent reasoning:**
   - "Analyzing email content..."
   - "Checking CMDB for database CI..."
   - "Validating assignment group..."
   - "Confirming service relationship..."
3. **Validation checks:**
   - "Is this a real incident? ✓"
   - "Does it belong to a known service? ✓"
   - "Is assignment group correct? ✓"
   - "Are relationships accurate? ✓"
4. **Decision:** "Create incident with priority HIGH, route to Database Team"

**Visual elements:**
- Terminal showing agent logs
- ServiceNow CMDB view (CIs, relationships)
- Decision tree visualization

---

### Scene 6: Incident Creation (4:30-5:00)
**Visual:** ServiceNow incident form auto-populating
**NEW RECORDING NEEDED**
**Voiceover:**
> "The agent creates the incident. Not just copying data — understanding it. Priority is HIGH because the email says so. Assignment is Database Team because the CMDB says so. Every field is validated."

**Show:**
- Incident form loading
- Fields auto-populating:
  - Title: "Database connection timeout"
  - Description: [Extracted from email]
  - Priority: 1 - High
  - Assignment Group: Database Team
  - Configuration Item: [From CMDB]
  - State: Open
- Audit trail: "Created by system, timestamp"

---

### Scene 7: The Scale (5:00-5:30)
**Visual:** Dashboard showing metrics
**Can use May 10 footage or new recording**
**Voiceover:**
> "One email. Now imagine 100. Imagine 1,000. Every single one processed by independent expert agents. Every single one validated. Every single one routed correctly. No bottleneck. No waiting. No human overhead."

**Show:**
- Incident list with multiple records
- Metrics: "47 incidents created in last hour"
- Agent spawning metrics
- Validation success rate: 100%

---

## PART 3: Outro

### Scene 8: The Future (5:30-6:00)
**Visual:** Clean text overlay with links
**Voiceover:**
> "This is OpenClaw + ServiceNow. Independent expert agents that reason about your operating model. Not just automation — intelligent autonomy. Welcome to the future."

**Text:**
- "OpenClaw + ServiceNow"
- "Independent Expert Agents"
- "Link in bio for full write-up"

---

## Technical Requirements for New Recording

### Setup Needed:
1. **ServiceNow instance awake** (dev228466)
2. **Browser open** with sys_email and incident tables
3. **Terminal ready** for agent spawning
4. **CMDB data visible** (CIs, relationships)
5. **OBS configured** for screen recording

### New Assets to Capture:
1. Agent reasoning logs (terminal)
2. CMDB validation checks (browser)
3. Incident form auto-population (browser)
4. Decision tree visualization (optional)

### Recording Checklist:
- [ ] ServiceNow instance awake and responsive
- [ ] Email account set up and receiving
- [ ] Browser Harness connected
- [ ] OBS configured (1920x1080, 30fps)
- [ ] Voiceover recorded (or use text overlays)
- [ ] Clean terminal theme (Dracula/Monokai)
- [ ] No visible scaffolding (no MCP server details)

---

## Post-Production Plan

### Step 1: Extract May 10 Clips
- Convert .cast files to video (asciinema convert)
- Extract key moments (team spawning, email injection, QA)
- Add text overlays for agent names and results

### Step 2: Record New Footage
- Set up ServiceNow + browser
- Record agent reasoning process
- Record incident creation
- Capture CMDB validation

### Step 3: Combine
- Edit May 10 clips with new narrative
- Insert new reasoning footage
- Add transitions and text overlays
- Export final video (5-7 minutes)

### Step 4: Publish
- LinkedIn post with video
- Article with embedded video
- GitHub repo update

---

## Key Messaging

**What we're showing:**
- OpenClaw spawning independent expert agents
- Agents reasoning independently (not just executing)
- Validation before execution
- CMDB checks and business logic
- Scale without overhead

**What we're NOT showing:**
- How we built it (MCP servers, etc.)
- Technical scaffolding
- Manual steps
- Limitations

**The narrative:**
"My agent assembled a team. But here's what they actually did — they reasoned about my business, validated every decision, and executed with confidence."

**The competitive angle:**
"Build Agent executes tasks. We spawn independent experts that reason about your operating model."

---

## Next Steps

1. ✅ Extract May 10 clips (convert .cast to video)
2. ⏳ Record new reasoning footage
3. ⏳ Combine and edit
4. ⏳ Export final video
5. ⏳ Write LinkedIn article
6. ⏳ Publish

**Ready to start recording?** Let's set up ServiceNow and capture the reasoning process! 💪
