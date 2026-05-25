# EP02/EP03 Architecture Brief — Headless ServiceNow with Expert Agent Teams

## Vision

Build a **headless ServiceNow platform** orchestrated by OpenClaw expert agent teams. 

**No UI interaction. No human in the loop. AI agents reason autonomously, validate data, and execute with confidence.**

**Checks & balances:** Raksha-Architect owns every solution — she reviews and approves escalations before Thuluzi executes.

---

## The Flow (End-to-End)

### Stage 1: Email Ingestion (Headless)
```
External Email → mails.dev (SendClaw) → MCP Bridge → ServiceNow sys_email table
```
- Poll SendClaw inbox every 5 minutes
- Deduplicate (local tracker + ServiceNow check)
- Ingest via ServiceNow REST Table API → `sys_email` (type: `received`)

### Stage 2: Expert Agent Team — Email Analysis + Approval (AI Agent in the Loop)
```
sys_email record → Spawn Expert Agent (Raksha-Architect) 
  → Read ServiceNow LLM-synthesized docs (github.com/ServiceNow/ServiceNowDocs)
  → Analyze email content, classify, extract fields
  → Validate against CMDB (CIs, services, assignment groups)
  → Route to correct table: incident, ritm, case, or escalation

Escalation emails → Raksha-Architect (approval layer)
  → Reviews, validates, approves
  → Delegates to Thuluzi-ServiceDesk for execution
```

**Checks & Balances:** Raksha owns every solution — nothing escalates without her review.

### Stage 3: RITM Creation (Headless)
```
Expert Agent (Kwazi-Developer) 
  → Create RITM in sc_req_item via Table API
  → Link to sys_email via u_source_email
  → Set priority, assignment, state
```

### Stage 4: Escalation + Approval (Headless)
```
Escalation Email arrives → Raksha-Architect (Approval Layer)
  → Review: Is this a valid escalation? Is there an existing RITM/Case?
  → Validate: CMDB check, business rules, priority
  → Decision: Approve / Reject / Request more info
  → If approved: Delegate to Thuluzi-ServiceDesk

Thuluzi-ServiceDesk (after Raksha approval)
  → Check if related RITM exists (match by subject, CI, or sender)
  → If found: Create new Case, link to existing RITM
  → If not found: Create new RITM + Case, link them
  → Update parent REQ if needed
```

**Checks & Balances:** No escalation executes without Raksha approval.

### Stage 5: QA Validation (Independent)
```
Bhinca-QA validates every stage independently:
  → Stage 1: Verify sys_email ingested correctly
  → Stage 3: Verify RITM created with correct fields
  → Stage 4: Verify escalation linked correctly
  → Generate PASS/FAIL report with evidence
```

---

## Expert Agent Team

### 1. Raksha-Architect (ServiceNow Platform Architect — Owns Every Solution)
**Role:** Platform knowledge, CSDM, CMDB design, governance, **approval layer owner**
**Expertise:**
- Owns every solution on the platform (end-to-end accountability)
- ServiceNow data model (sys_email, incident, sc_req_item, sc_request, sn_customerservice_case)
- CMDB/CSDM relationships
- Assignment group routing
- Priority matrix (business impact × urgency)
- **Checks & balances:** Reviews escalation requests before delegating to Thuluzi
**Knowledge:** github.com/ServiceNow/ServiceNowDocs (LLM-synthesized)
**Handoff:** All escalation emails → Raksha (reviews/approves) → delegates to Thuluzi

### 2. Kwazi-Developer (ServiceNow Integration Developer)
**Role:** API design, REST integration, table APIs, business rules
**Expertise:**
- ServiceNow Table API (GET/POST/PATCH)
- sys_email → RITM transformation logic
- Field mapping, data validation
- Error handling, retry logic
**Knowledge:** API implementation docs, Table API reference

### 3. Bhinca-QA (Quality Assurance Engineer)
**Role:** Validation, verification, regression testing — **independent of execution**
**Expertise:**
- Verify sys_email records exist and are correct
- Verify RITMs created with correct fields
- Verify escalation linking (RITM ↔ Case)
- Audit trail completeness
- **Cannot be overridden** — reports truth to Chomi
**Approach:** Independent validation after every stage

### 4. Thuluzi-ServiceDesk (Service Desk / Business Analyst — Execution after Approval)
**Role:** Business rules, escalation handling, case management — **executes after Raksha approval**
**Expertise:**
- Email classification (incident vs request vs case vs escalation)
- Business priority rules
- Assignment group mapping
- Escalation workflow logic
- **Receives delegated work from Raksha-Architect** (not direct access to escalations)
**Knowledge:** ITSM/CSM best practices

### 5. Chomi-Orchestrator (Main Agent)
**Role:** Spawn experts, coordinate handoffs, manage state, report results
**Expertise:**
- OpenClaw sub-agent spawning
- Context injection (docs, CMDB, business rules)
- Session management
- Final reporting and audit

---

## The "AI Agent in the Loop" (No Human in the Loop)

**Old paradigm:** Human reviews every email → Human creates record → Human assigns → Human escalates

**New paradigm:** 
```
Email arrives → AI Agent Team reasons → Validates → Executes → Reports
```

**Key difference:**
- AI agents have **platform knowledge** (ServiceNow docs)
- AI agents **validate** against CMDB (no hallucinated tables)
- AI agents **reason** about business rules (priority, assignment)
- AI agents **execute** via APIs (headless)
- AI agents **verify** their own work (QA agent checks every output)
- **Checks & balances:** Raksha approves all escalations before Thuluzi executes

---

## Headless Architecture (No UI)

| Layer | Component | Headless? | Owner |
|-------|-----------|-----------|-------|
| Ingestion | MCP Bridge + SendClaw API | ✅ Yes | System |
| Analysis | Raksha-Architect (AI Agent) | ✅ Yes | Raksha |
| Approval | Raksha reviews escalations | ✅ Yes | Raksha |
| Creation | Kwazi-Developer (API calls) | ✅ Yes | Kwazi |
| Escalation | Thuluzi-ServiceDesk (after approval) | ✅ Yes | Thuluzi |
| Validation | Bhinca-QA (independent checks) | ✅ Yes | Bhinca |
| Reporting | API queries + Slack/Telegram | ✅ Yes | Chomi |
| **NO UI** | **Zero browser automation needed** | ✅ **100% Headless** | — |

---

## Data Model

### Tables Used
1. **sys_email** — Inbound email records
2. **sc_request** — Parent request
3. **sc_req_item** — Request items (RITMs)
4. **sn_customerservice_case** — Customer service cases (escalations)
5. **cmdb_ci_service** — Business services (for validation)
6. **cmdb_rel_ci** — CI relationships
7. **sys_user_group** — Assignment groups

### Key Fields
- `sys_email.u_source_email` → links to RITM
- `sc_req_item.u_source_email` → links back to email
- `sn_customerservice_case.u_ritm` → links case to RITM
- Priority matrix: 1=Critical, 2=High, 3=Medium, 4=Low

---

## Escalation Logic (with Approval Layer)

```
Escalation Email arrives:
  1. Parse email (sender, subject, body)
  2. Send to Raksha-Architect (Approval Queue)
     → Raksha reviews: Is this a valid escalation?
     → Validates against CMDB and business rules
     → Decision: Approve / Reject / Request more info
  3. If APPROVED by Raksha:
     → Delegate to Thuluzi-ServiceDesk with context + approval token
     → Thuluzi executes: Create/link Case to RITM
  4. If REJECTED by Raksha:
     → Log rejection reason
     → Do not create Case
     → Optional: notify sender or log for review
  5. Bhinca-QA validates the final outcome
```

**Checks & Balances:**
- Raksha owns every solution — she is the gatekeeper
- Thuluzi cannot act on escalations without Raksha's approval
- Bhinca-QA independently validates every approved escalation
- Audit trail shows: who reviewed, who approved, who executed, who validated

---

## Success Metrics

- **Ingestion rate:** 100% emails ingested (0 lost)
- **Deduplication:** 0 duplicates in ServiceNow
- **RITM creation:** < 30 seconds from email arrival
- **Validation pass rate:** > 99%
- **Escalation approval rate:** ~85% (Raksha filters noise)
- **Escalation linking accuracy:** > 95% (after Raksha approval)
- **Zero human intervention required**

---

## Competitive Angle

**What others say:**
> "AI agents need clean CMDB or they fast-track bad data" (B. Wilson)
> "You need a human in the loop for governance" (Industry)

**What EP02/EP03 shows:**
> "Our AI agents ARE the governance layer. Raksha-Architect owns every solution and reviews every escalation. They have platform knowledge. They validate against CMDB. They don't fast-track bad data — they clean it before executing. And they don't need a human in the loop because they are the experts."

---

## Next Steps

1. ✅ MFA disabled on ServiceNow
2. ✅ Kwazi-Developer spawned (RITM creation logic built)
3. ⏳ Spawn Raksha-Architect (approval layer + platform knowledge)
4. ⏳ Spawn Thuluzi-ServiceDesk (escalation execution)
5. ⏳ Spawn Bhinca-QA (independent validation)
6. ⏳ Test end-to-end flow: email → sys_email → RITM → Raksha approval → escalation case
7. ⏳ Record demo showing headless expert agents reasoning autonomously

---

**Status:** Architecture defined, team roles clarified, ready to build 💪
